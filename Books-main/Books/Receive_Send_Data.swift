//
//  Receive_Send_Data.swift
//  Landmarks
//

import SwiftUI

struct Receive_Send_Data: View {
    @State var results = [BookData]()
    
    var body: some View {
        VStack{
            Button("Recieve Data"){
                receive_data_from_server()
            }
            List(results, id: \.id){item in
                VStack(alignment: .leading){
                    Text(String(item.id))
                    Text(item.title)
                }
                
            }
            
            Button("Send Data"){
                send_data_to_server()
            }
        }
      
    }
    
    func receive_data_from_server(){
        //you can also replace the address there with your ip address
        //use ipconfig getifaddr en0 in command terminal
        //192.168.0.214
        guard let url = URL(string: "http://127.0.0.1:8000/send_data") else {
            print("URL error")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ data, response, error in if let data = data {
            if let response = try? JSONDecoder().decode([BookData].self, from: data){
                DispatchQueue.main.async{
                    self.results = response
                }
                return
            }
            }
        }
        task.resume()
    }
    
    func send_data_to_server(){
        let mydata = BookData(id: 123, title: "Excellent")
        
        guard let data_to_upload = try? JSONEncoder().encode(mydata) else {
            return
        }
        
        let url = URL(string: "http://127.0.0.1:8000/receive_data")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                          
        let task = URLSession.shared.uploadTask(with: request, from: data_to_upload){
            data, resonse, error in
            if let error = error {
                print("URL error")
                return
            }
        }
        task.resume()
    }
}

struct Receive_Send_Data_Previews: PreviewProvider {
    static var previews: some View {
        Receive_Send_Data()
    }
}
