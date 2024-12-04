//
//  ExpenseEntity+CoreDataProperties.swift
//  CoreExpense
//
//  Created by Pavithran P K on 22/10/24.
//
//

import Foundation
import CoreData


extension ExpenseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseEntity> {
        return NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double

}

extension ExpenseEntity : Identifiable {

}
