//
//  UIView+TapGesture.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 3/5/23.
//

import UIKit

private var tapKey: UInt8 = 0

extension UIView {
    func addTapGesture(action: @escaping () -> Void) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
        objc_setAssociatedObject(self, &tapKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }

    @objc private func handleTapGesture(sender: UITapGestureRecognizer) {
        guard let action = objc_getAssociatedObject(self, &tapKey) as? () -> Void else {
            return
        }
        action()
    }
}
