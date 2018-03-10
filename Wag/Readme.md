
WAG Readme

Using Swift 4 - I know the coding challenge required Objective-C however, I only have minimal experience with this language. The Apps I have built myself and released to the app store as well as the startup company’s apps that I have worked on have all been written in Swift.

Model Data - I created a User.swift file to store my model code.
- Created two Structs - User && Badges
- Both Structs conform to the Decodable and Equatable protocols
- The Decodable protocol was used to make the JSON parsing much     easier and readable. With the introduction of Swift 4, as long as the         data is structured you can basically parse JSON in just a few lines of         code.
- The Equatable protocol was used to allow comparing of custom         data types
- I also created a class called UserData to allow me to query the web     for the stackoverflow data
- This class has one function called getData - This function uses an         escaping closure to return data to a view controller.

Downloading Images - Inside the tableView’s “cellForRowAt” function, I am calling a function called “assignImage”. This function is checking whether the User in the array of users already has a UIImage assigned to it. If it does, then that image is used. If it doesn’t then the image is downloaded. This allows the images to only be downloaded once.
- While the image is loading or if there is an error loading the image then a placeholder image will be shown.

Third Party Libraries - I used Alamofire and AlamofireImage to reach out to the stackoverflow endpoint and retrieve the data as well as download the images.

GlobalExtensions.swift - I created this file so I could add a function as an extension to UIView to create a shadow on the images. I have used this function in many projects.


