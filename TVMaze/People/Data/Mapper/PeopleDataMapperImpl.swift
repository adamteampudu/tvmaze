//
//  PeopleDataMapperImpl.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct PeopleDataMapperImpl: PeopleDataMapper {
    func mapToDomain(_ value: [ApiPersonResult]) -> [Person] {
        value.map {
            Person(
                id: $0.person.id,
                url: $0.person.url,
                name: $0.person.name,
                country: Country(
                    name: $0.person.country?.name,
                    code: $0.person.country?.code,
                    timezone: $0.person.country?.timezone
                ),
                birthday: $0.person.birthday,
                deathday: $0.person.deathday,
                gender: $0.person.gender,
                image: Image(
                    medium: $0.person.image?.medium,
                    original: $0.person.image?.original
                ),
                links: Links(
                    linksSelf: Link(href: $0.person.links.linksSelf.href) ,
                    previousepisode: Link(href: $0.person.links.previousepisode?.href),
                    nextepisode: Link(href: $0.person.links.nextepisode?.href)
                )
            )
        }
    }

    func mapToDomain(_ value: ApiPerson) -> Person { 
        Person(
            id: value.id,
            url: value.url,
            name: value.name,
            country: Country(
                name: value.country?.name,
                code: value.country?.code,
                timezone: value.country?.timezone
            ),
            birthday: value.birthday,
            deathday: value.deathday,
            gender: value.gender,
            image: Image(
                medium: value.image?.medium,
                original: value.image?.original
            ),
            links: Links(
                linksSelf: Link(href: value.links.linksSelf.href) ,
                previousepisode: Link(href: value.links.previousepisode?.href),
                nextepisode: Link(href: value.links.nextepisode?.href)
            )
        )
    }

    func mapToDomain(_ value: [ApiCast]) -> [Cast] {
        value.map {
            Cast(
                personCrewSelf: $0.personCrewSelf,
                voice: $0.voice,
                links: PersonCrewLinks(
                    show: Character(href: $0.links?.show.href ?? ""),
                    character: Character(href: $0.links?.character.href ?? "")
                ),
                embedded: EmbeddedShow(show: map($0.embedded?.show))
            )
        }
    }

    func mapToDomain(_ value: [ApiCrew]) -> [Crew] {
        value.map {
            Crew(
                type: $0.type,
                links: PersonCrewLinks(
                    show: Character(href: $0.links?.show.href ?? ""),
                    character: Character(href: $0.links?.character.href ?? "")
                ),
                embedded: EmbeddedShow(show: map($0.embedded?.show))
            )
        }
    }

    private func map(_ value: ApiShow?) -> Show? {
        guard let value = value else { return nil }
        return Show(
            id: value.id,
            url: value.url,
            name: value.name,
            image: Image(
                medium: value.image?.medium ?? nil,
                original: value.image?.original
            ),
            type: value.type,
            language: value.language,
            genres: value.genres,
            status: value.status,
            runtime: value.runtime,
            averageRuntime: value.averageRuntime,
            premiered: value.premiered,
            officialSite: value.officialSite,
            schedule: Schedule(
                time: value.schedule?.time,
                days: value.schedule?.days
            ),
            rating: Rating(average: value.rating?.average),
            weight: value.weight,
            network: Network(
                id: value.network?.id,
                name: value.network?.name,
                country: Country(
                    name: value.network?.country?.name,
                    code: value.network?.country?.code,
                    timezone: value.network?.country?.timezone
                )
            ),
            webChannel: Network(
                id: value.webChannel?.id,
                name: value.webChannel?.name,
                country: Country(
                    name: value.webChannel?.country?.name,
                    code: value.webChannel?.country?.code,
                    timezone: value.webChannel?.country?.timezone
                )
            ),
            externals: Externals(
                tvrage: value.externals?.tvrage,
                thetvdb: value.externals?.thetvdb,
                imdb: value.externals?.imdb
            ),
            summary: value.summary,
            updated: value.updated,
            links: Links(
                linksSelf: Link(href: value.links?.linksSelf.href),
                previousepisode: Link(href: value.links?.previousepisode?.href),
                nextepisode: Link(href: value.links?.nextepisode?.href)
            )
        )
    }

}
