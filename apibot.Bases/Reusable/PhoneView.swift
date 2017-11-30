//
//  PhoneView.swift
//  bolshoe
//
//  Created by Anton Skorodumov on 23.07.15.
//  Copyright (c) 2015 E-Lite-Telecom. All rights reserved.
//

import UIKit

protocol PhoneViewDelegate: class
{
    /**
     @author Gutov AndreyJ
     Номер заполнен
     */
    func onPhoneIsFull()
    /**
     @author Gutov AndreyJ
     Номер не заполнен
     */
    func onPhoneNotFull()
    /**
     @author Gutov AndreyJ
     Номер не валиден
     */
    func onValidate()
    /**
     @author Gutov AndreyJ
     Показать/скрыть заголовок
     */
    func showTitle(_ show: Bool)
}

class PhoneView: UIView, UITextFieldDelegate
{
    
    @IBOutlet weak var tfPhone   : UITextField!
    @IBOutlet weak var lbPrefix  : UILabel!
    
    fileprivate var phoneIsFull: Bool = false
    fileprivate var placeholderShow: Bool = true
    var view     : UIView!
    weak var delegate : PhoneViewDelegate?
    
    // MARK: - initial
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func loadViewFromNib() -> UIView
    {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PhoneView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // MARK: - public functions
    
    func phone() -> String
    {
        let phone = (tfPhone.text! as NSString).replacingOccurrences(of: "(\\d{0,3})\\s*(\\d{0,3})\\s*(\\d{0,4})\\s*",
            with: "$1$2$3",
            options: NSString.CompareOptions.regularExpression,
            range: NSRange(location: 0, length: tfPhone.text!.characters.count))
        return "7\(phone)"
    }
    
    func textAttributes(size: CGFloat, placeholderShow: Bool, alignment: NSTextAlignment = .left, color: UIColor = .black) {
        lbPrefix.font = UIFont(name: lbPrefix.font!.fontName, size: size)
        lbPrefix.textColor = color
        tfPhone.font = UIFont(name: tfPhone.font!.fontName, size: size)
        tfPhone.textColor = color
        tfPhone.textAlignment = alignment
        self.placeholderShow = placeholderShow
        self.showPlaceholder(placeholderShow)
    }
    
    func isFull() -> Bool
    {
        return phoneIsFull
    }
    
    func fillPhone(_ phone: String?) {
        guard let newPhone = phone else { return }
        let length = newPhone.characters.count
        var phone = (newPhone as NSString).replacingOccurrences(of: "(\\d{0,3})\\s*(\\d{0,3})\\s*(\\d{0,4})\\s*",
                                                                                 with: "$1 $2 $3",
                                                                                 options: NSString.CompareOptions.regularExpression,
                                                                                 range: NSRange(location: 0, length: length))
        phone = phone.trimmingCharacters(in: CharacterSet.whitespaces)
        tfPhone.text = phone
        if length == 10 {
            phoneIsFull = true
            delegate?.onPhoneIsFull()
        }
        else {
            delegate?.onPhoneNotFull()
        }
    }
    
    // MARK: - private fucntions
    
    fileprivate func showKeyboard()
    {
        tfPhone.becomeFirstResponder()
    }
    
    fileprivate func xibSetup()
    {
        view = loadViewFromNib()
        view.frame = bounds
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        constraints()
        tfPhone.delegate = self
        showPlaceholder(true)
    }
    
    fileprivate func constraints() {
        self.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0))
    }
    
    fileprivate func showPlaceholder(_ show: Bool) {
        delegate?.showTitle(!show)
        if show && placeholderShow {
            tfPhone.attributedPlaceholder = NSAttributedString(string:loc("AUTH_PHONE_PLACEHOLDER"),
                                                               attributes:[NSForegroundColorAttributeName: UIColor.white])
        }
        else {
            tfPhone.placeholder = ""
        }
    }
    
    // MARK: - UIText field delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        showPlaceholder(false)
    }
    
    func textField(_ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool
    {
        phoneIsFull = false
        let regex = "[0-9]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isNumber = predicate.evaluate(with: string)
        if (!isNumber && string != "") {
            return false
        }
        // rememver cursor position
        let beginning = textField.beginningOfDocument
        let cursorLocation = textField.position(from: beginning, offset: range.location + string.characters.count)

        var newString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as String
        newString = (newString as NSString).replacingOccurrences(of: "(\\d{0,3})\\s*(\\d{0,3})\\s*(\\d{0,4})\\s*",
            with: "$1$2$3",
            options: NSString.CompareOptions.regularExpression,
            range: NSRange(location: 0, length: newString.characters.count))
        let len = newString.characters.count
        if len > 10 {
            phoneIsFull = true
            delegate?.onPhoneIsFull()
            return false
        }
        else if len == 10 {
            phoneIsFull = true
            delegate?.onPhoneIsFull()
        }
        else {
            delegate?.onPhoneNotFull()
        }
        
        fillPhone(newString)
        
        // change cursor position
        if cursorLocation != nil
        {
            textField.selectedTextRange = textField.textRange(from: cursorLocation!,
                to: cursorLocation!)
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        showPlaceholder(textField.text == "")
        if !phoneIsFull {
            delegate?.onValidate()
        }
    }
    
}
