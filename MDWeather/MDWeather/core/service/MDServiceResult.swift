//
//  ServiceResult.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

public typealias MDServiceResult<T> = (data: Data, result: Result<T, MDServiceError>)
