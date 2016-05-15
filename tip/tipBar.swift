//
//  tipBar.swift
//  tip
//
//  Created by DJIBRIL KEITA on 2/29/16.
//  Copyright © 2016 DJIBRILKEITA. All rights reserved.
//

import UIKit
import BLKFlexibleHeightBar

class tipBar: BLKFlexibleHeightBar {
    
    var userName: String?
    var userImage: UIImage?

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
            self.configureBar()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureBar()

    }
    
    func configureBar() {
        
        if let dataArray: NSArray = self.loadData() {
            let dict: NSDictionary = dataArray[0]
             as! NSDictionary
            
            userName = dict.valueForKey("firstName") as? String
            print(userName)
            
            let imageName = dict.valueForKey("imageName") as? String
            userImage = UIImage(named:imageName!)
            
            print(userImage)
        }
    self.maximumBarHeight = 200.0
    self.minimumBarHeight = 65.0
    self.backgroundColor  = UIColor(colorLiteralRed: 72.0/255.0, green: 211.0/255.0, blue: 178.0/255.0, alpha: 1)
    
    let nameLabel  = UILabel()
        
    nameLabel.font = UIFont.systemFontOfSize(22.0)
    nameLabel.textColor = UIColor.whiteColor()
    nameLabel.text = userName
        
    let initialNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        
    initialNameLabelLayoutAttributes.size = nameLabel.sizeThatFits(CGSizeZero)
    initialNameLabelLayoutAttributes.center = CGPointMake(self.frame.size.width * 0.5, self.maximumBarHeight - 50.0)
    nameLabel.addLayoutAttributes(initialNameLabelLayoutAttributes, forProgress: 0.0)
   
    let midwayNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialNameLabelLayoutAttributes)
        
    midwayNameLabelLayoutAttributes.center = CGPointMake(self.frame.size.width * 0.5, (self.maximumBarHeight - self.minimumBarHeight) * 0.4 + self.minimumBarHeight - 50.0)
        
    nameLabel.addLayoutAttributes(midwayNameLabelLayoutAttributes, forProgress: 0.6)
    
    let finalNameLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: midwayNameLabelLayoutAttributes)
        
    finalNameLayoutAttributes.center = CGPointMake(self.frame.size.width * 0.5, self.minimumBarHeight - 25.0)
    
    nameLabel.addLayoutAttributes(finalNameLayoutAttributes, forProgress: 1.0)
    
    self.addSubview(nameLabel)
        
    //Configure Profile Image
        
    let profileImageView =  UIImageView(image:userImage)
     
    profileImageView.contentMode = UIViewContentMode.ScaleAspectFill
    profileImageView.clipsToBounds = true
    profileImageView.layer.cornerRadius = 35.0
    profileImageView.layer.borderWidth = 5.0
    let color = UIColor(colorLiteralRed: 94.0/255.0, green: 91.0/255.0, blue: 149.0/255.0, alpha: 1)

    profileImageView.layer.borderColor = color.CGColor
    let initialProfileImageViewLayoutAttributes: BLKFlexibleHeightBarSubviewLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        
    initialProfileImageViewLayoutAttributes.size = CGSizeMake(70.0, 70.0)
    initialProfileImageViewLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, self.maximumBarHeight-110.0)
    profileImageView.addLayoutAttributes(initialProfileImageViewLayoutAttributes, forProgress: 0.0)
        
        
   let midwayProfileImageViewLayoutAttributes: BLKFlexibleHeightBarSubviewLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialProfileImageViewLayoutAttributes)
        
    midwayProfileImageViewLayoutAttributes.center = CGPointMake(self.frame.size.width * 0.5,
        (self.maximumBarHeight-self.minimumBarHeight)*0.8 + self.minimumBarHeight-110.0)
        
    profileImageView.addLayoutAttributes(midwayProfileImageViewLayoutAttributes, forProgress: 0.2)
        
   let finalProfileImageViewLayoutAttributes: BLKFlexibleHeightBarSubviewLayoutAttributes =
        BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: midwayProfileImageViewLayoutAttributes
        )
        
    finalProfileImageViewLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, (self.maximumBarHeight-self.minimumBarHeight)*0.64+self.minimumBarHeight-110.0)
    finalProfileImageViewLayoutAttributes.transform = CGAffineTransformMakeScale(0.5, 0.5);
    finalProfileImageViewLayoutAttributes.alpha = 0.0
        
    profileImageView.addLayoutAttributes(finalProfileImageViewLayoutAttributes, forProgress: 0.5)
        
    self.addSubview(profileImageView)
        
        
        
    }
    
    func loadData()-> NSArray{
        
        let path = NSBundle.mainBundle().pathForResource("tipList", ofType: "plist")
        
        let array = NSArray(contentsOfFile: path!)
        
        return array!
        
        
    }
    
}





