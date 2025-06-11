//
//  MyPartiesViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation
import Observation

@Observable
final class MyPartiesViewModel {
    var selectedPartyStatus: PartyStatus = .recruiting

    private(set) var partyList: [Party] = []
    private var user: User = User.sampleHost

    init() {
        partyList = DummyData.allParties
    }

    var myParties: [Party] {
        partyList
            .filter { $0.member.contains { $0.id == user.id } }
            .filter { $0.status == selectedPartyStatus }
    }
}
