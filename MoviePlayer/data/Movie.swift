//
//  Movie.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import Foundation

struct Movie: Identifiable, Codable {
    
    let title: String
    let description: String
    let posterImageURL: String
    let headerImageURL: String
    let rating: Double
    let numberOfPeopleWatching: Int
    let categories: [String]
    
    var id: UUID = UUID()
    
    static func example1() -> Movie {
        
        Movie(title: "Venom",
              description: "Die Entwicklungsgeschichte von Marvels geheimnisvollster, komplexester und krassester Figur – Venom! Als Journalist versucht Eddie (Tom Hardy) schon seit Langem den zwielichtigen, aber genialen Gründer der Life Foundation, Carlton Drake (Riz Ahmed), zu überführen – eine Besessenheit, die ihn bereits seine Karriere und die Beziehung zu seiner Freundin Anne Weying (Michelle Williams) gekostet hat. Bei der aktuellen Recherche zu Drakes Experimenten verbindet sich das Alien Venom mit Eddies Körper und verleiht ihm nicht nur erstaunliche Superkräfte, sondern auch die Freiheit, zu tun, was immer er will. Durchtrieben, düster, unberechenbar und voller Zorn: Eddie muss lernen, die gefährlichen Kräfte, die von Venom ausgehen, zu kontrollieren. Und ist gleichzeitig berauscht von der neu gewonnen Macht, die er nun in sich spürt.",
              posterImageURL: "https://i.ytimg.com/vi/eDdsl0-NdY0/movieposter.jpg",
              headerImageURL: "https://de.web.img3.acsta.net/r_654_368/newsv7/21/02/19/16/08/5459488.jpg",   //not from Youtube
              rating: 4.7,
              numberOfPeopleWatching: 2304,
              categories: ["Action", "Adventure", "Fantasy"])
    }
    
    
    static func example2() -> Movie {
        
        Movie(title: "Planet der Affen: Prevolution",
              description: " Will Rodman (James Franco) ist ein junger, engagierter Wissenschaftler, der zusammen mit seinem Vater (John Lithgow), ebenfalls ein Forscher, Heilmittel für Menschen erforscht. Ein vielversprechendes Mittel, in das Will viele Hoffnungen setzt, testet er in einem hoch-modernen Labor an Affen. Ein besonderer Affe namens Caesar (Andy Serkis) wächst ihm dabei ans Herz. Das Mittel scheint zu funktionieren. Doch plötzlich ruft es noch ganz andere, unerwartete Reaktionen hervor... Die Primatenforscherin Caroline (Freida Pinto) unterstützt Will auf der Suche nach den Ursachen - und den Folgen!\n  PLANET DER AFFEN: PREVOLUTION ist ein Prequel der beliebten Planet der Affen-Franchise, das modernste Special Effects des prämierten WETA Studios ('Avatar', 'Herr Der Ringe') enthält.",
              posterImageURL: "https://i.ytimg.com/vi/kYBpmPaeuQ0/movieposter.jpg",
              headerImageURL: "https://crops.giga.de/74/f1/d1/e97c60bc9ce607570b894e1e96_YyAxMzI5eDc0OCs1NisyAnJlIDg0MCA0NzIDNzFlY2JjMDc4ZTk=.jpeg",
              rating: 4.7,
              numberOfPeopleWatching: 2304,
              categories: ["Science fiction"])
    
    
        //https://i.ytimg.com/vi/91055TN7pVA/hqdefault.jpg?sqp=-oaymwEiCKgBEF5IWvKriqkDFQgBFQAAAAAYASUAAMhCPQCAokN4AQ==&rs=AOn4CLCxt-hLbeXfzMGyfzjNGM1RUEFH0w
    }
}


extension Movie: Hashable, Comparable {
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        lhs.title < rhs.title
    }
}
