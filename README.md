# Movies-iOS

## 1. What does the single responsibility principle consist of? What's its purpose?

It consists of only giving one "job" or functionality to a Class/Struct (etc). This helps avoid having to touch or modify a class that's already accomplishing its purpose, preventing possible regression bugs, and also keeping the separations of concerns. This results in a code more maintainable and scalable.

## 2. What characteristics does, in your opinion, a “good” code or clean code have?

The first that comes to mind is DRY(don't repeat yourself) and having it decoupled, which I think are one of the most common "code smells". besides that If the code is testable (follows the SOLID principles), has a good use of Dedign patterns without overcomplicating/overusing them, and if it's easy to read/understand.

## 3 Detail how you would do everything that you have not completed?
- I would complete the unit tests following the same pattern I've used for the few I made.
- I'd refactor the hardcoded values inside the views and also the Constants enum which I think could be clearer, also move the API key to the environment
- I'd also refactor that navigation so it uses NavigationPath instead of the simple navigation
- And maybe also I'd go back to CoreData instead of SwiftData since it's difficult to do unit tests with it currently
- I wasn't able to generate the `.ipa` file because I don't have a personal developer account


### Home Screen:
<img src="https://github.com/user-attachments/assets/d3e3ed52-8cc6-4f27-bc1d-2fa57877cf80" width="248">

### Search Screen:

<img src="https://github.com/user-attachments/assets/5af7bd2d-a27d-4969-b740-d435c06df267" width="248">


### Movie Details:

<img src="https://github.com/user-attachments/assets/5fc41b4e-2602-46a8-ab82-a25eccda9dc6" width="248">

## Watch List:

https://github.com/user-attachments/assets/98e6c1b3-1df2-4638-ac1e-45da7774187b

