// Importing the UIKit framework which is necessary for building the user interface.
import UIKit

// Declaring the ViewController class which inherits from UIViewController.
class ViewController: UIViewController {
    
    // Creating an image view with some predefined properties.
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill  // Setting the content mode to scale aspect fill.
        imageView.backgroundColor = .white       // Setting the background color of the image view to white.
        return imageView
    }()
    
    // Creating a button with some predefined properties.
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white          // Setting the background color of the button to white.
        button.setTitle("Random Photo", for: .normal) // Setting the title of the button.
        button.setTitleColor(.black, for: .normal)   // Setting the title color of the button to black.
        return button
    }()
    
    // Defining an array of colors.
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemPink,
        .systemMint
    ]
    
    // This method is called after the view controller has loaded its view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.randomElement()       // Setting the background color of the view.
        view.addSubview(imageView)              // Adding the image view as a subview of the main view.

        imageView.frame = CGRect(x:0, y:0, width:300, height: 300) // Setting the frame of the image view.
        imageView.center = view.center          // Centering the image view within the main view.
        
        view.addSubview(button)                 // Adding the button as a subview of the main view.
        getRandomPhoto()                        // Calling the method to get a random photo.
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) // Adding an action to the button.
    }
    
    // This method is called when the button is tapped.
    @objc func didTapButton() {
        getRandomPhoto()                        // Fetching a new random photo.
        view.backgroundColor = colors.randomElement() // Changing the background color of the view randomly.
    }
    
    // This method is called to layout subviews.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x:30,
                              y:view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width:view.frame.size.width-60,
                              height: 55)    // Setting the frame of the button.
    }
    
    // This method is responsible for fetching a random photo from the internet.
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/600x600" // URL string for fetching the photo.
        let url  = URL(string: urlString)!  // Creating a URL from the string.
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data) // Setting the image of the imageView to the fetched photo.
    }
}
