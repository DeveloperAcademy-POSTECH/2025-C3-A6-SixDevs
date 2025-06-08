//
//  FirestoreManager+Party.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/6/25.
//

import FirebaseFirestore

extension FirestoreManager {

    // MARK: Numeric Field Update
    /// 특정 숫자 필드를 1씩 증가 또는 감소시키는 함수
    /// data: EntityRepresentable을 채택한 데이터 모델 (문서의 경로 및 ID 정보를 포함)
    /// field: 증가 또는 감소시킬 필드의 이름 (문자열)
    /// increase: true면 1 증가, false면 1 감소
    /// 사용예시: try await FirestoreManager.shared.updateFieldByOne(party, field: "viewCount", increase: true) // (1 증가)
    func updateFieldByOne(
        _ data: EntityRepresentable,
        field: String,
        increase: Bool
    ) async throws {
        guard let dataDictionary = data.asDictionary else {
            throw Error.encodingFailed
        }

        let value: Int64 = increase ? 1 : -1

        try await db
            .collection(data.entityName.rawValue)
            .document(data.documentID)
            .updateData([field: FieldValue.increment(value)])
    }
}
