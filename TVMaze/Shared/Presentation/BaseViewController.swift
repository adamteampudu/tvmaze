//
//  BaseViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

//class BaseViewController<V: BaseViewModel, C: Coordinator>: UIViewController, Alertable {
class BaseViewController<V: BaseViewModel, C: Coordinator>: UIViewController {

    let viewModel: V
    let coordinator: C
    let disposeBag = DisposeBag()

    init(
        _ coordinator: C,
        _ viewModel: V
    ) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToError()
        subscribeToIsLoadingObservable()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupNavigationBar()
    }

    func bind(observable: Observable<String>, label: UILabel) {
        observable.bind(to: label.rx.text).disposed(by: disposeBag)
    }

    func bind(observable: Observable<String>, label: UILabel, format: String) {
        observable.asObservable()
            .map { String(format: format, $0) }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }

    func bind(observable: Observable<Bool>, action: @escaping (Bool) -> Void) {
        observable.bind { (result) in
            action(result)
        }.disposed(by: disposeBag)
    }

    func subscribe<T>(observable: Observable<T>, action: @escaping (T) -> Void) {
        observable.subscribe(onNext: { data in
            action(data)
        }).disposed(by: disposeBag)
    }

    func listen<T>(observable: Observable<T>, action: @escaping (T?) -> Void, complete: @escaping () -> Void) {
        observable.subscribe(
            onNext: action, onError: nil, onCompleted: complete, onDisposed: nil
        ).disposed(by: disposeBag)
    }

    private func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationController?.navigationBar.tintColor = Asset.Colors.textInput.color
//        navigationController?.navigationBar.barTintColor = Asset.Colors.backgroundOverlay.color
//        navigationController?.navigationBar.backgroundColor = Asset.Colors.backgroundOverlay.color
//        navigationController?.navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: Asset.Colors.textInput.color,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: TextSize.HEADING_5, weight: UIFont.Weight.regular)
//        ]
    }

    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }

    private func subscribeToError() {
        subscribe(observable: viewModel.baseErrorObservable) { [weak self] errorArgs in
            guard let self = self else { return }
//            self.present(
//                args: errorArgs.error,
//                presentationType: errorArgs.presentationType,
//                onMainAction: errorArgs.onMainAction,
//                onSecondaryAction: errorArgs.onSecondaryAction
//            )
        }
    }

    func bindIsHidden(view: UIView, observable: Observable<Bool>, skip: Int = 1) {
        observable.skip(skip).bind(to: view.rx.isHidden).disposed(by: disposeBag)
    }

    func bind(_ textField: UITextField, observable: BehaviorRelay<String?>) {
        textField.rx.text.asObservable().bind(to: observable).disposed(by: disposeBag)
    }
}

/// Manage navigation bar
extension BaseViewController {
    func showNavigationBar(animated: Bool = true) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func hideNavigationBar(animated: Bool = true) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension BaseViewController {
    func present(args: BaseAlertViewContentArgs,
                 presentationType: ViewPresentationType,
                 onMainAction: (() -> Void)? = nil,
                 onSecondaryAction: (() -> Void)? = nil,
                 onTertiaryAction: (() -> Void)? = nil) {
        guard presentationType != .pushFullScreen else { return }
        let args = BaseAlertViewArgs(contentArgs: args,
                                     presentation: presentationType,
                                     onMainAction: onMainAction,
                                     onSecondaryAction: onSecondaryAction,
                                     onTertiaryAction: onTertiaryAction)
//        coordinator.presentAlert(from: self, args: args)
    }

    func push(args: BaseAlertViewContentArgs,
              onMainAction: (() -> Void)? = nil,
              onSecondaryAction: (() -> Void)? = nil,
              onTertiaryAction: (() -> Void)? = nil) {
        let args = BaseAlertViewArgs(contentArgs: args,
                                     presentation: .pushFullScreen,
                                     onMainAction: onMainAction,
                                     onSecondaryAction: onSecondaryAction,
                                     onTertiaryAction: onTertiaryAction)
//        coordinator.pushAlert(from: self, args: args)
    }

//    func pushLoaderError(error: LoaderErrorType,
//                         onMainAction: (() -> Void)? = nil,
//                         onSecondaryAction: (() -> Void)? = nil) {
//        let errorVC = LoaderErrorViewController(error: error,
//                                                onMainAction: onMainAction,
//                                                onSecondaryAction: onSecondaryAction)
//        navigationController?.pushViewController(errorVC, animated: true)
//    }
}

extension BaseViewController {
    private func subscribeToIsLoadingObservable() {
//        subscribe(observable: viewModel.isLoadingObservable, action: {
//            $0 ? LoaderBuffer.shared.showLoader() : LoaderBuffer.shared.hideLoader()
//        })
    }
}
