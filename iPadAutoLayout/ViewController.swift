//
//  ViewController.swift
//  iPadAutoLayout
//
//  Created by  on 2023-02-03.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate {

    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfWeight : UILabel!
    
    @IBOutlet var lbName : UILabel!
    @IBOutlet var lbWeight : UILabel!
    
    @IBOutlet var slWeight : UISlider!

    
    @IBAction func sliderValueChanged(sender : UISlider){
        updateLabel()
    }
    
    func updateLabel(){
        let weight = slWeight.value
        let strWeight = String(format: "%.0f",weight)
        tfWeight.text = strWeight
    }

    func doTheUpdate(){
        let data : Data = .init()
        data.initWithStuff(theName: tfName.text!, theWeight: tfWeight.text!)
        
        lbName.text = data.savedName
        lbWeight.text = data.savedWeight
    }
    
    @IBAction func updateLabels(sender : Any){
        
        let alert = UIAlertController(title: "Warning", message: "Are You Sure?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler:
        {(alert : UIAlertAction!) in
            self.doTheUpdate()
            self.dismiss(animated: true, completion: nil)
        }
        )
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIDevice.current.userInterfaceIdiom == .pad
        {
        let urlAddress = URL(string: "https://www.tsn.ca/")
        let url = URLRequest(url: urlAddress!)
        webView.load(url)
        webView.navigationDelegate = self
        }
        else
        {
            webView.isHidden = true
            activity.isHidden = true
        }
    }

       func animateMe() {
           let fadeImage = UIImage(named: "myimage.jpg")
           fadeLayer = CALayer.init()
           fadeLayer?.contents = fadeImage?.cgImage
           fadeLayer?.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
           fadeLayer?.position = CGPoint(x:200, y:200)

           self.view.layer.addSublayer(fadeLayer!)
           
           let fadeAnimate = CABasicAnimation(keyPath: "opacity")
           fadeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
           fadeAnimate.fromValue = NSNumber.init(value: 1.0)
           fadeAnimate.toValue = NSNumber.init(value: 0.0)
           
           fadeAnimate.isRemovedOnCompletion = false
           fadeAnimate.duration = 3.0
           fadeAnimate.beginTime = 1.0
           fadeAnimate.isAdditive = false
           fadeAnimate.repeatCount = Float.infinity
           fadeLayer?.add(fadeAnimate, forKey: nil)
       }
    
    override func viewWillAppear(_ animated: Bool) {
        let soundURL = Bundle.main.path(forResource: "song1", ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
        
        self.
    }
   }

