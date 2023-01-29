//
//  ViewController.swift
//  KFH_Calculator
//
//  Created by asmat manal on 29/01/23.
//

import UIKit
import TinyConstraints

class ViewController: BaseViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        let cvc = UICollectionView(frame: CGRect(origin: CGPointMake(0, 100), size: CGSize(width: view.frame.width, height: view.frame.height - 100)), collectionViewLayout: layout)
        return cvc
    }()
    
    let lineLabel: UIView = {
        let separator = UIView()
        separator.backgroundColor = .black
        separator.backgroundColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1)
        return separator
    }()
    
    let lineLabel2: UIView = {
        let separator = UIView()
        separator.backgroundColor = .black
        separator.backgroundColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1)
        return separator
    }()
    
    
    let warningLabel: UIStackView = {
        var stack = UIStackView()
        let text = UILabel()
        let image = restrictSizeImageView1(height: 25, width: 25)
        image.image = #imageLiteral(resourceName: "Vector (10)")
        image.contentMode = .scaleAspectFit
        
        text.text = " This calculation is not final and does\n not obligate KFH. For more\n information you may call 1803333."
        text.font = UIFont(name: "Lato-Regular", size: 16)
        text.textColor = UIColor(red: 0.62, green: 0.475, blue: 0.2, alpha: 1)
        text.textAlignment = .left
        text.numberOfLines = 3
        
        stack = UIStackView(arrangedSubviews: [SpacerView(space: 24),image,SpacerView(space: 22),text])
        stack.backgroundColor = UIColor(red: 0.984, green: 0.961, blue: 0.863, alpha: 1)
        stack.layer.cornerRadius = 8
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(red: 0.922, green: 0.898, blue: 0.824, alpha: 1).cgColor
        stack.widthAnchor.constraint(equalToConstant: 343).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 73).isActive = true
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let calculationTypeLabel: UIStackView = {
        var stackView = UIStackView()
        var icon = restrictSizeImageView1(height: 8, width: 8)
        let leftTitle = UILabel()
        let rightTitle = UILabel()
        
        icon.image = #imageLiteral(resourceName: "Vector (11)")
        icon.contentMode = .scaleAspectFit
        
        leftTitle.text = "Calculation Type"
        leftTitle.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        leftTitle.font = UIFont(name: "Lato-Bold", size: 15)
        
        rightTitle.text = "Select"
        rightTitle.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        rightTitle.font = UIFont(name: "Lato-Bold", size: 16)
        rightTitle.textAlignment = .right
        
        stackView = UIStackView(arrangedSubviews: [SpacerView(space: 16),leftTitle,UIView(),UIView(),UIView(),UIView(),rightTitle,SpacerView(space: 13),icon,SpacerView(space: 15)])
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.distribution = .fill
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        stackView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCalculationType))
//        tapGesture.numberOfTapsRequired = 1
        stackView.addGestureRecognizer(tapGesture)
        return stackView
    }()
    
    lazy var customerTypeSegementedControlView: UIView = {
        let view = UIView()
        let items = ["KFH Customer","New Customer"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.backgroundColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1)
        control.layer.cornerRadius = 8.91
        control.height(32)
        control.width(343)
        let font = UIFont(name: "Lato-Regular", size: 14)
        control.setTitleTextAttributes([NSAttributedString.Key.font : font ?? ""], for: .normal)
        let font2 = UIFont(name: "Lato-Bold", size: 14)
        control.setTitleTextAttributes([NSAttributedString.Key.font : font2 ?? ""], for: .selected)
        view.addSubview(control)
        control.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12),usingSafeArea: true)
        //control.addTarget(self, action: <#T##Selector#>, for: .valueChanged)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return view
    }()
    
    let bankingTierLabel: UIStackView = {
        var stackView = UIStackView()
        var icon = restrictSizeImageView1(height: 8, width: 8)
        let leftTitle = UILabel()
        let rightTitle = UILabel()
        
        icon.image = #imageLiteral(resourceName: "Vector (11)")
        icon.contentMode = .scaleAspectFit
        
        leftTitle.text = "Banking Tier"
        leftTitle.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        leftTitle.font = UIFont(name: "Lato-Bold", size: 15)
        
        rightTitle.text = "Select"
        rightTitle.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        rightTitle.font = UIFont(name: "Lato-Bold", size: 16)
        rightTitle.textAlignment = .right
        
        stackView = UIStackView(arrangedSubviews: [SpacerView(space: 16),leftTitle,UIView(),UIView(),UIView(),UIView(),rightTitle,SpacerView(space: 13),icon,SpacerView(space: 15)])
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.distribution = .fill
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return stackView
    }()
    
    let costFeild: UITextField = {
        let textFeild = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.478, green: 0.486, blue: 0.482, alpha: 1),
            NSAttributedString.Key.font : UIFont(name: "Lato-Regular", size: 15)!
        ]
        textFeild.attributedPlaceholder = NSAttributedString(string: "      Cost", attributes:attributes)
        textFeild.layer.borderWidth = 0.5
        textFeild.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return textFeild
    }()
    
    let downPaymentFeild: UITextField = {
        let textFeild = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.478, green: 0.486, blue: 0.482, alpha: 1),
            NSAttributedString.Key.font : UIFont(name: "Lato-Regular", size: 15)!
        ]
        textFeild.attributedPlaceholder = NSAttributedString(string: "      Down Payment", attributes:attributes)
        textFeild.layer.borderWidth = 0.5
        textFeild.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return textFeild
    }()
    
    let installmentPeriodLabel: UIStackView = {
        var stackView = UIStackView()
        var icon = restrictSizeImageView1(height: 8, width: 8)
        let leftTitle = UILabel()
        let rightTitle = UILabel()
        
        icon.image = #imageLiteral(resourceName: "Vector (11)")
        icon.contentMode = .scaleAspectFit
        
        leftTitle.text = "Installment Period"
        leftTitle.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        leftTitle.font = UIFont(name: "Lato-Bold", size: 15)
        
        rightTitle.text = "Select"
        rightTitle.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        rightTitle.font = UIFont(name: "Lato-Bold", size: 16)
        rightTitle.textAlignment = .right
        
        stackView = UIStackView(arrangedSubviews: [SpacerView(space: 16),leftTitle,UIView(),UIView(),UIView(),UIView(),rightTitle,SpacerView(space: 13),icon,SpacerView(space: 15)])
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.distribution = .fill
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCalculationType))
        tapGesture.numberOfTapsRequired = 1
        stackView.isUserInteractionEnabled = true
        stackView.addGestureRecognizer(tapGesture)
        return stackView
    }()
    
    let calculateLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.textAlignment = .center
        view.text = "Calculate"
        view.font = UIFont(name: "Lato-Bold", size: 20)
        view.textColor = UIColor(red: 0.859, green: 0.651, blue: 0.118, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(handleCalculationType))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(labelTap)
        
        return view
    }()
    
   
    lazy var topSegementedControl: UISegmentedControl = {
        let items = ["Commercial","Jameati"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.backgroundColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1)
        control.layer.cornerRadius = 8.91
        control.height(32)
        control.width(343)
        let font = UIFont(name: "Lato-Regular", size: 14)
        control.setTitleTextAttributes([NSAttributedString.Key.font : font ?? ""], for: .normal)
        let font2 = UIFont(name: "Lato-Bold", size: 14)
        control.setTitleTextAttributes([NSAttributedString.Key.font : font2 ?? ""], for: .selected)
        //control.addTarget(self, action: <#T##Selector#>, for: .valueChanged)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        collectionView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height - 100)
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .backgroundGray
        setNavigationBarItems(title: "Calculator", leftNavigationItem: "Vector (7)", rightNavigationItem: "")
            //setupLabelTap()
    }
    
    
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [calculationTypeLabel,customerTypeSegementedControlView,bankingTierLabel,costFeild,downPaymentFeild,installmentPeriodLabel])
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(top: warningLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 37, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 336)
        view.addSubview(lineLabel)
        view.addSubview(lineLabel2)
        lineLabel2.anchor(top: nil, left: nil, bottom: stackView.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 0.5)
        lineLabel.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 0.5)
        view.addSubview(calculateLabel)
        calculateLabel.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 36, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 48)
        
    }

    fileprivate func setupViews() {
        view.addSubview(topSegementedControl)
        topSegementedControl.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 18, left: 12, bottom: 0, right: 12),usingSafeArea: true)
        view.addSubview(warningLabel)
        warningLabel.anchor(top: topSegementedControl.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 36, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 343, height: 73)
        setupStackView()
    }
    
    @objc open func handleCalculationType(_ sender: UITapGestureRecognizer){
        print("calc was clicked")
        let vc = CalculationTypeTableController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if calculationTypeLabel == touch.view {
                print("bank tier")
            }
            else if bankingTierLabel == touch.view {
                print("bank tier")
            }
            else if installmentPeriodLabel == touch.view {
                print("install")
            }
        }
    }
    
//    func setupLabelTap() {
//            
//            let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.handleCalculationType))
//            self.calculateLabel.isUserInteractionEnabled = true
//            self.calculateLabel.addGestureRecognizer(labelTap)
//            
//        }

}

