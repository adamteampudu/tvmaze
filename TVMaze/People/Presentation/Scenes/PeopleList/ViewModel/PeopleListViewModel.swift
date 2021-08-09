//
//  PeopleListViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import RxSwift

final class PeopleListViewModel: BaseViewModel {

    var onSearchTextChangedObservable: Observable<String> {
        onSearchTextChangedSubject
    }

    var reloadPublishObservable: Observable<Void?> {
        reloadPublishSubject
    }

    var goToScenePublishObservable: Observable<PeopleCoordinator.GoToScene> {
        goToSceneSubject
    }

    private let reloadPublishSubject = PublishSubject<Void?>()
    private let goToSceneSubject = PublishSubject<PeopleCoordinator.GoToScene>()
    private let onSearchTextChangedSubject = PublishSubject<String>()

    private(set) var people: [UiPerson] = [] {
        didSet {
            reloadPublishSubject.onNext(())
        }
    }
    private var currentSearchTerm: String?

    private let getPeopleUseCase: GetPeopleUseCase.Alias

    var dispatchGroup = DispatchGroup()

    init(
        getPeopleUseCase: GetPeopleUseCase.Alias
    ) {
        self.getPeopleUseCase = getPeopleUseCase
    }

    private func getPeople(name: String) {
        dispatchGroup.enter()
        isLoadingSubject.onNext(false)
        isLoadingSubject.onNext(true)
        let nameEscaped = name.replacingOccurrences(of: " ", with: "%20")
        getPeopleUseCase.execute(nameEscaped) { [weak self] peopleResult in
            guard let self = self else { return }
            switch peopleResult {
            case .success(data: let peopleList):
                self.people = peopleList
            case .error(error: let errorType):
                self.onError(errorType)
            }
            self.dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.isLoadingSubject.onNext(false)
        }

    }

    func onSelection(row: Int) {
        goToSceneSubject.onNext(
            .pushToPersonDetail(
                PersonDetailViewArgs(
                    person: people[row]
                )
            )
        )
    }

    func onSearch(text: String?) {
        currentSearchTerm = text
        if let text = text, text.count > 0 {
            getPeople(name: text)
        } else {
            people = []
        }
    }
}
