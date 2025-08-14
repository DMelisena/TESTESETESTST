//
//  Gemini.swift
//  FindingNemo
//
//  Created by Shreyas Venadan on 13/8/2025.
//

import FirebaseVertexAI
import PhotosUI
import SwiftUI

struct Gemini: View {
    // Use the new Firebase Vertex AI SDK
    let model = VertexAI.vertexAI().generativeModel(modelName: "gemini-1.5-flash")

    @State var userPrompt = ""
    @State var response = "How can I help you today?"
    @State var isLoading = false
    @State var selectedImage: UIImage?
    @State var isShowingImagePicker = false
    @State var imageSelection: PhotosPickerItem?
    @State var showingImageOptions = false

    // Add your own preset images here (put these image files in your Xcode project)
    let presetImages = ["sample1", "sample2", "sample3"] // Your image file names

    var body: some View {
        VStack {
            Text("Welcome to Gemini AI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.indigo)
                .padding(.top, 20)

            // Image display area
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 200)
                    .cornerRadius(10)
                    .padding()
            }

            ZStack {
                ScrollView {
                    Text(response)
                        .font(.title2)
                        .padding()
                }

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                        .scaleEffect(3)
                }
            }

            VStack(spacing: 10) {
                // Image selection buttons
                HStack(spacing: 15) {
                    // Photo library picker
                    PhotosPicker(selection: $imageSelection, matching: .images) {
                        VStack {
                            Image(systemName: "photo.on.rectangle")
                            Text("Photos")
                                .font(.caption)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue, in: RoundedRectangle(cornerRadius: 10))
                    }
                    .onChange(of: imageSelection) { _, newValue in
                        Task {
                            if let data = try? await newValue?.loadTransferable(type: Data.self),
                               let image = UIImage(data: data)
                            {
                                selectedImage = image
                            }
                        }
                    }

                    // Preset images button
                    Button {
                        showingImageOptions = true
                    } label: {
                        VStack {
                            Image(systemName: "folder")
                            Text("My Images")
                                .font(.caption)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green, in: RoundedRectangle(cornerRadius: 10))
                    }
                    .actionSheet(isPresented: $showingImageOptions) {
                        ActionSheet(
                            title: Text("Choose Image"),
                            buttons: presetImages.map { imageName in
                                .default(Text(imageName)) {
                                    selectedImage = UIImage(named: imageName)
                                }
                            } + [.cancel()]
                        )
                    }
                }

                // Clear image button
                if selectedImage != nil {
                    Button("Remove Image") {
                        selectedImage = nil
                        imageSelection = nil
                    }
                    .foregroundColor(.red)
                }

                // Text input
                TextField("Ask about the image or anything else...", text: $userPrompt, axis: .vertical)
                    .lineLimit(3)
                    .font(.body)
                    .padding()
                    .background(Color.indigo.opacity(0.2), in: Capsule())
                    .disableAutocorrection(true)
                    .onSubmit {
                        generateResponse()
                    }
            }
            .padding()
        }
        .padding()
    }

    func generateResponse() {
        guard !userPrompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || selectedImage != nil else {
            return
        }

        isLoading = true
        response = ""

        Task {
            do {
                let result: GenerateContentResponse

                if let image = selectedImage {
                    // Convert UIImage to Data
                    guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                        throw NSError(domain: "ImageError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])
                    }

                    // Create content with both text and image using Firebase SDK
                    if userPrompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        // Only image, use a default prompt
                        result = try await model.generateContent(
                            ModelContent(parts: [
                                .data(mimetype: "image/jpeg", imageData),
                                .text("Describe this image in detail."),
                            ])
                        )
                    } else {
                        // Both text and image
                        result = try await model.generateContent(
                            ModelContent(parts: [
                                .text(userPrompt),
                                .data(mimetype: "image/jpeg", imageData),
                            ])
                        )
                    }
                } else {
                    // Text only
                    result = try await model.generateContent(userPrompt)
                }

                await MainActor.run {
                    isLoading = false
                    response = result.text ?? "No response found"
                    userPrompt = ""
                }

            } catch {
                await MainActor.run {
                    isLoading = false
                    response = "Something went wrong\n\(error.localizedDescription)"
                }
            }
        }
    }
}

#Preview {
    Gemini()
}
