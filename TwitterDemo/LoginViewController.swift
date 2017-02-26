//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by Jose-Rafael Diaz on 2/26/17.
//  Copyright © 2017 Jose-Rafael Diaz. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string:"https://api.twitter.com")! as URL!, consumerKey: "aYPKA5NhlA6jDSuFFgVxtSbg0", consumerSecret: "5XRjbQt6DwWPIlxv10FSMwtcpKKtd5O9tDiUwE0lrlvVUNXmGV")
        
        twitterClient?.deauthorize()
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterdemo://oauth") as URL!, scope: nil, success: { (requestToken: BDBOAuth1Credential?) -> Void in print("Acquired Token")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken!.token!)")!
            UIApplication.shared.openURL(url as URL)
            
        }) {(error: Error?) -> Void in print("Error: \(error?.localizedDescription)")}
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
