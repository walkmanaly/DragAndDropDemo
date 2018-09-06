//
//  DragAndDropViewController.swift
//  DragAndDropDemo
//
//  Created by Nick on 2018/9/6.
//  Copyright © 2018年 Nick. All rights reserved.
//

import UIKit

class DragAndDropViewController: UIViewController, UIDropInteractionDelegate
{

    var image: UIImage?
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var dropView: UIView!
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            let dropinteraction = UIDropInteraction(delegate: self)
            imageView.addInteraction(dropinteraction)
            imageView.isUserInteractionEnabled = true
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: UIImage.self) { images in
            let images = images as! [UIImage]
            self.imageView.image = images.first
        }
    }

}
