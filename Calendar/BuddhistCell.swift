//
//  BuddhistCell.swift
//  Calendar
//
//  Created by chanthem on 2/24/19.
//  Copyright © 2019 chanthem. All rights reserved.
//

import UIKit
import FSCalendar

class BuddhistCell: FSCalendarCell {
  weak private var buddhistImageView: UIImageView!
  
  var isBuddhaDay: Bool = false {
    didSet {
      buddhistImageView.isHidden = !isBuddhaDay
    }
  }

  override init!(frame: CGRect) {
    super.init(frame: frame)
    
    let buddhistImageView = UIImageView(image: UIImage(named: "buddhist"))
    buddhistImageView.contentMode = .scaleAspectFit
    self.contentView.addSubview(buddhistImageView)
    self.buddhistImageView = buddhistImageView
    self.buddhistImageView.isHidden = true
    self.buddhistImageView.frame = CGRect(x: frame.size.width-20, y: 0, width: 20, height: 20)
  }
  
  required init!(coder aDecoder: NSCoder!) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    subtitleLabel.numberOfLines = 0
    subtitleLabel.frame.size.height = contentView.frame.height - (titleLabel.frame.size.height + titleLabel.frame.origin.y)
    let diameter: CGFloat = min(contentView.frame.height, contentView.frame.width) * 0.8
    shapeLayer.frame = CGRect(origin: contentView.bounds.origin, size: CGSize(width: diameter, height: diameter))
    shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: (contentView.frame.width / 2) - (diameter / 2), y: (contentView.frame.height / 2) - (diameter / 2), width: diameter, height: diameter)).cgPath
  }
  
  override func configureAppearance() {
    super.configureAppearance()
  }
}
