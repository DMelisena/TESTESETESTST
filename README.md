# C4-FindingNemo
Apple Developer Academy Challenge 4 - Team 10

open this link : https://brew.sh/
you would get this command below :
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Paste this to terminal and run it
Copy whatever on your terminal run it on terminal
then install tuist using this command below :
```
$ brew install tuist
```
eventually you would be brought to a screen to create tuist account just create it and everything
then git clone this repository
```
$ git clone https://github.com/shreyasvenadan/C4-FindingNemo/
```
open it using this command
```
$ cd C4-FindingNemo 
```
then generate .xcodeproj file using this command
```
$ tuist install && tuist generate
```
if the code doesn't work, try this one below :
```
$ tuist install && tuist generate --no-cache
```
this should open the xcode automaticallythen you can open the .xcodeproj using
```
$ open -a Xcode./FindingNemo.xcodeproj

```
