//
//  ReposGitNetworkManager.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 12/04/21.
//

import Foundation

enum NetworkError: Error {
    case errorRequest(ValidationError)
}

class ReposGitNetworkManager {
    
    func getUsersByLanguage(language: String, with completion: @escaping (_ result: Result<RepositoriesGitModel?, NetworkError>) -> Void) {
        
        let urlString = "https://api.github.com/search/repositories?q=language:\(language)&sort=stars"
        let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.errorRequest(error)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.errorRequest(error)))
                return
            }
            
            if httpResponse.statusCode == 200{
                guard let datas = data else{
                    completion(.failure(.errorRequest(error)))
                    return
                }
                
                do {
                    let decode = JSONDecoder()
                    let json = try decode.decode(RepositoriesGitModel.self, from: datas)
                    completion(.success(json))
                }catch {
                    let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")
                    completion(.failure(.errorRequest(error)))
                }
            }else {
                let error = ValidationError(titleError: "", messageError: "Erro \(httpResponse.statusCode)")
                completion(.failure(.errorRequest(error)))
            }
        }.resume()
    }
    
    func getReposByUser(login: String, with completion: @escaping (_ result: Result<[Items]?, NetworkError>) -> Void) {
        
        let urlString = "https://api.github.com/users/\(login)/repos"
        let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.errorRequest(error)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.errorRequest(error)))
                return
            }
            
            if httpResponse.statusCode == 200{
                guard let datas = data else{
                    completion(.failure(.errorRequest(error)))
                    return
                }
                
                do {
                    let decode = JSONDecoder()
                    let json = try decode.decode([Items].self, from: datas)
                    completion(.success(json))
                }catch {
                    let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")
                    completion(.failure(.errorRequest(error)))
                }
            }else {
                let error = ValidationError(titleError: "", messageError: "Erro \(httpResponse.statusCode)")
                completion(.failure(.errorRequest(error)))
            }
        }.resume()
    }
    
    func getDetailRepoByUser(login: String, nameRepo: String, with completion: @escaping (_ result: Result<Items?, NetworkError>) -> Void) {
        
        let urlString = "https://api.github.com/repos/\(login)/\(nameRepo)"
        let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.errorRequest(error)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.errorRequest(error)))
                return
            }
            
            if httpResponse.statusCode == 200{
                guard let datas = data else{
                    completion(.failure(.errorRequest(error)))
                    return
                }
                
                do {
                    let decode = JSONDecoder()
                    let json = try decode.decode(Items.self, from: datas)
                    completion(.success(json))
                }catch {
                    let error = ValidationError(titleError: "", messageError: "Não foi possível carregar os dados")
                    completion(.failure(.errorRequest(error)))
                }
            }else {
                let error = ValidationError(titleError: "", messageError: "Erro \(httpResponse.statusCode)")
                completion(.failure(.errorRequest(error)))
            }
        }.resume()
    }
}
