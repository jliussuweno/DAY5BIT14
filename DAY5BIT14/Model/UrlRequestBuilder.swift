//
//  UrlRequestBuilder.swift
//  day six
//
//  Created by BCA_GSIT_Macbook_2 on 8/19/19.
//  Copyright © 2019 BCA_GSIT_Macbook_2. All rights reserved.
//

import UIKit

public class UrlRequestBuilder: NSObject {
    
    func buildUrlRequestGetTotalReportCovid19(date: String?) -> URLRequest {
        var urlString : String = "https://covid-19-statistics.p.rapidapi.com/reports/total"
        if date != nil {
            urlString = urlString + "?date=" + date!
        }
        let url = URL.init(string: urlString)
        var urlRequest : URLRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("covid-19-statistics.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        urlRequest.addValue("1aaf44486dmshce55c5a82a7edc9p188e0ajsn181bded96bb9", forHTTPHeaderField: "x-rapidapi-key")
        urlRequest.timeoutInterval = 30
        return urlRequest
    }
    
    func buildUrlRequestGetRegions() -> URLRequest {
        var urlString : String = "https://covid-19-statistics.p.rapidapi.com/regions"
        let url = URL.init(string: urlString)
        var urlRequest : URLRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("covid-19-statistics.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        urlRequest.addValue("1aaf44486dmshce55c5a82a7edc9p188e0ajsn181bded96bb9", forHTTPHeaderField: "x-rapidapi-key")
        urlRequest.timeoutInterval = 10
        return urlRequest
    }
    
    func buildUrlRequestGetReport(date: String?, iso: String?) -> URLRequest {
        var urlString : String = "https://covid-19-statistics.p.rapidapi.com/reports"
        if date != nil {
            urlString = urlString + "?date=" + date! + "&iso=" + iso!
        }
        let url = URL.init(string: urlString)
        var urlRequest : URLRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("covid-19-statistics.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        urlRequest.addValue("1aaf44486dmshce55c5a82a7edc9p188e0ajsn181bded96bb9", forHTTPHeaderField: "x-rapidapi-key")
        urlRequest.timeoutInterval = 30
        return urlRequest
    }
    
}
