//
//  PersonDetailViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation
import RxSwift

final class PersonDetailViewModel: BaseViewModel {

    var reloadViewPublishObservable: Observable<Void?> {
        reloadViewPublishSubject
    }

    var goToScenePublishObservable: Observable<PeopleCoordinator.GoToScene> {
        goToSceneSubject
    }
    var isFavoritePublishObservable: Observable<Bool> {
        isFavoriteSubject
    }
    var argsObservable: Observable<PersonDetailViewArgs> {
        argsPublishSubject
    }

    private let reloadViewPublishSubject = PublishSubject<Void?>()
    private let goToSceneSubject = PublishSubject<PeopleCoordinator.GoToScene>()
    private let isFavoriteSubject = PublishSubject<Bool>()

    private let args: PersonDetailViewArgs
    private let getPersonUseCase: GetPersonUseCase.Alias
    private let getPersonCastUseCase: GetPersonCastUseCase.Alias
    private let getPersonCrewUseCase: GetPersonCrewUseCase.Alias

    private(set) var castRoles: [UiCast] = []
    private(set) var crewRoles: [UiCrew] = []

    private(set) var person: UiPerson?

    private var dispatchGroup = DispatchGroup()

    init(
        getPersonUseCase: GetPersonUseCase.Alias,
        getPersonCastUseCase: GetPersonCastUseCase.Alias,
        getPersonCrewUseCase: GetPersonCrewUseCase.Alias,
        args: PersonDetailViewArgs
    ) {
        self.getPersonUseCase = getPersonUseCase
        self.getPersonCastUseCase = getPersonCastUseCase
        self.getPersonCrewUseCase = getPersonCrewUseCase

        self.args = args
    }

    private let argsPublishSubject = PublishSubject<PersonDetailViewArgs>()

    func onViewDidLoad() {
        argsPublishSubject.onNext(args)
        getPerson()
    }

    private func getPerson() {
        isLoadingSubject.onNext(true)

        dispatchGroup.enter()
        getPersonUseCase.execute(args.person.id) { [weak self] personResult in
            guard let self = self else { return }
            switch personResult {
            case .success(data: let person):
                self.person = person
            case .error(error: let errorType):
                self.onError(errorType)
            }
            self.dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getPersonCrewUseCase.execute(args.person.id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(data: let crewRoles):
                self.crewRoles = crewRoles
            case .error(error: let errorType):
                self.onError(errorType)
            }
            self.dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getPersonCastUseCase.execute(args.person.id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(data: let castRoles):
                self.castRoles = castRoles
            case .error(error: let errorType):
                self.onError(errorType)
            }
            self.dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.isLoadingSubject.onNext(false)
            self.reloadViewPublishSubject.onNext(())
            debugPrint(self.castRoles.count)
            debugPrint(self.crewRoles.count)
        }
    }

    func onSelection(indexPath: IndexPath) {
        if let show = indexPath.section == 0 ?
            crewRoles[indexPath.row].embedded?.show : castRoles[indexPath.row].embedded?.show {

            goToSceneSubject.onNext(
                .pushToShowDetail(ShowDetailViewArgs(show: show))
            )
        }

    }
}
