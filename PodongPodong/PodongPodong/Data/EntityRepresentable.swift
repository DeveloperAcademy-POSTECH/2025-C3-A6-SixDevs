//
//  EntityRepresentable.swift
//  PodongPodong
//
//  Created by 김민석 on 6/4/25.
//

protocol EntityRepresentable {
    var entityName: CollectionType { get }
    var documentID: String { get }
    var asDictionary: [String: Any]? { get }
}
