public struct LoginResponse {
    public let code: String
    public let state: String
    
    public init(code: String, state: String) {
        self.code = code
        self.state = state
    }
}
