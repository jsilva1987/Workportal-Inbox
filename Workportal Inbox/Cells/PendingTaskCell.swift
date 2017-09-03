//
//  PendingTaskCell.swift
//  Workportal Inbox
//
//  Created by trink2 on 8/30/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import UIKit

class PendingTaskCell: UITableViewCell {
    
    private var dateFormatter: DateFormatter?
    private var pendingTask: PendingTask?

    //MARK: - Outlets
    
    @IBOutlet weak var employeeLabel: UILabel!
    @IBOutlet weak var requestedDaysLabel: UILabel!
    @IBOutlet weak var startToEndDateLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    
    //MARK: - Configuration
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateFormatter = DateFormatter()
    }
    
    internal func configureCell(with pendingTask: PendingTask) {
        self.pendingTask = pendingTask
        employeeLabel.text = pendingTask.employee
        employeeLabel.textColor = UIColor.bizagiGreen
        requestedDaysLabel.text = "Requested Days: \(pendingTask.requestedDays)"
        requestedDaysLabel.textColor = UIColor.bizagiGrey
        startToEndDateLabel.text = dateLabelText()
        startToEndDateLabel.textColor = UIColor.bizagiGrey
    }
    
    fileprivate func dateLabelText() -> String {
        
        let messagePlaceholder = "Unable to retrieve Date information."
        
        guard let pendingTask = pendingTask else {
            return messagePlaceholder
        }
        
        guard let startDate = dateFormatter?.isoFormatString(from: pendingTask.beginDate), let endDate = dateFormatter?.isoFormatString(from: pendingTask.endDate) else {
            return messagePlaceholder
        }
        
        return "From \(startDate) to \(endDate)"
    }
    
    //MARK: - Actions
    
    @IBAction func acceptAction(_ sender: UIButton) {
        updateIconImage(with: .accepted)
    }
    
    @IBAction func rejectAction(_ sender: UIButton) {
        updateIconImage(with: .rejected)
    }
    
    //MARK: - Icon Animation
    
    fileprivate func updateIconImage(with icon: Icon) {
        guard let currentImage = iconImageView.image else {
            animateIconTransition(with: icon)
            return
        }
        
        guard currentImage != icon.image else {
            return
        }
        
        animateIconTransition(with: icon)
    }
    
    fileprivate func animateIconTransition(with icon: Icon) {
        UIView.transition(with: iconImageView, duration: 0.25, animations: { [weak self] in
            self?.iconImageView.image = icon.image
            self?.iconImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }, completion: { _ in
                UIView.animate(withDuration: 0.25, animations: { [weak self] in
                    self?.iconImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
        })
    }
    
    
    //MARK: - Utils
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName:self.identifier(), bundle: nil)
    }
}
