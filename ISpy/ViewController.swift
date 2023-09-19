//
//  ViewController.swift
//  ISpy
//
//  Created by Egor on 05.09.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / image.bounds.width
        let heightScale = size.height / image.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }

}

