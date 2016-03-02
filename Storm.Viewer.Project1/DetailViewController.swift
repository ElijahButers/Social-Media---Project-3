//
//  DetailViewController.swift
//  Storm.Viewer.Project1
//
//  Created by User on 2/28/16.
//  Copyright © 2016 Elijah Buters. All rights reserved.
//

import Social
import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailImageView: UIImageView!
    


    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        // Setting the right bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Sharing method
    func shareTapped() {
        
//        let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
//        presentViewController(vc, animated: true, completion: nil)
        
        // Facebook sharing
        
        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        vc.setInitialText("Look at this great picture!")
        vc.addImage(detailImageView.image!)
        vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(vc, animated: true, completion: nil)
    }


}

