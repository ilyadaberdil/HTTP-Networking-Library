# HTTP-Networking-Library
HTTP Networking Library - iOS Swift  Service Core Sample 

# API Usage 

  <h2> HTTP - GET Request </h2>

        public func getSampleModel(url: String, completionHandler: @escaping (ServiceResponse<SampleModel>) -> ()) {
        BaseService.getMethod(url: url, completionHandler: completionHandler)
    }
    
  <h4> GET - Service Call </h4>

        let sampleUrl = "https://jsonplaceholder.typicode.com/todos/1"
        getServiceExecutor.getSampleModel(url: sampleUrl) { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.removeSpinner()
            switch response {
            case .success(let result):
                print("GET METHOD SUCCESS - NAME: \(result?.title ?? "NIL TITLE")")
            case .failure(let error):
                print("GET METHOD FAILED - ERROR: \(error.debugDescription)")
            }
        }
    
    
  <h2> HTTP - POST Request </h2>

        public func postSampleModel(param: SampleParameter, completionHandler: @escaping (ServiceResponse<TokenModel>) -> ()) {
        BaseService.postMethod(url: "https://reqres.in/api/login", param: param, completionHandler: completionHandler)
    }
    
  <h4> POST - Service Call </h4>

        let parameter: SampleParameter = SampleParameter.init(email: "eve.holt@reqres.in", password: "cityslicka")
        postServiceExecutor.postSampleModel(param: parameter) { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let result):
                print("LOGIN SUCCESS - TOKEN: \(result?.token ?? "NIL TITLE")")
                strongSelf.getServiceCall()
            case .failure(let error):
                print("LOGIN FAILED - ERROR: \(error.debugDescription)")
            }
        }
