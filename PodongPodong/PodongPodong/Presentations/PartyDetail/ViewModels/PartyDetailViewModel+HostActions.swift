//
//  PartyDetailViewModel+HostActions.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/8/25.
//

extension PartyDetailViewModel {

    // MARK: - Party Host Action
    // 대기 멤버 수락
    func acceptWaitingMember(_ user: User) async {
        guard isHost, var party = party else { return }

        do {
            party.waitingMembers.removeAll { $0.id == user.id }
            party.member.append(user)

            try await firestoreManager.update(party)
            self.party = party

            await checkAndAutoCloseIfNeeded()
        } catch {
            handleError(error)
        }
    }

    // 대기 멤버 거절
    func rejectWaitingMember(_ user: User) async {
        guard isHost, var party = party else { return }

        do {
            party.waitingMembers.removeAll { $0.id == user.id }

            try await firestoreManager.update(party)
            self.party = party

        } catch {
            handleError(error)
        }
    }

    // 멤버 내보내기
    func removeMember(_ user: User) async {
        guard isHost, var party = party else { return }

        do {
            party.member.removeAll { $0.id == user.id }

            try await firestoreManager.update(party)
            self.party = party

        } catch {
            handleError(error)
        }
    }

    // 파티 상태 변경
    func updatePartyStatus() async {
        guard isHost, var party = party else { return }

        do {
            switch party.status {
            case .recruiting:
                party.status = .inProgress
            case .inProgress:
                party.status = .completed
            case .completed:
                break
            }

            try await firestoreManager.update(party)
            self.party = party

        } catch {
            handleError(error)
        }
    }
    
    // 파티 삭제하기
    func deleteParty() async {
        guard isHost, var party = party else { return }
        
        do {
            try await firestoreManager.delete(party)
            self.party = nil
            
        } catch {
            handleError(error)
        }
    }
}
