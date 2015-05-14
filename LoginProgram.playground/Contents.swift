//: Playground - noun: a place where people can play

import UIKit

struct User {
    var email:String
    var password:String
}

//START Regex initialisation code supplied by http://benscheirman.com/2014/06/regex-in-swift/

class Regex {
    let internalExpression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        var error: NSError?
        self.internalExpression = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error)!
    }
    
    func test(input: String) -> Bool {
        let matches = self.internalExpression.matchesInString(input, options: nil, range:NSMakeRange(0, count(input)))
        return matches.count > 0
    }
}

infix operator =~ {}

func =~ (input: String, pattern: String) -> Bool {
    return Regex(pattern).test(input)
}

//END Regex initialisation code

//START custom code by Adam

//let users = [
//    User(email: "adam_corcoran@me.com", password: "password01"),
//    User(email: "acorcoran@redcross.org.au", password: "password02"),
//    User(email: "adzcorcoran@gmail.com", password: "password03"),
//    User(email: "incorrectemail.com", password: "badone"),
//]

var users = [User]()

users.append(
    User(email: "adam_corcoran@me.com", password: "password01")
    )

users.append(
    User(email: "acorcoran@redcross.org.au", password: "password02")
)

users.append(
    User(email: "adzcorcoran@gmail.com", password: "password03")
)

users.append(
    User(email: "incorrectemail.com", password: "badone")
)

//Fixed the array iteration with Ryan's help.

for user in users {
if user.email =~ "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" {
    println("You have entered a valid email address.")
}

else {
    println("Please enter a valid email address.")
}
}

for user in users {
if user.password =~ "\\w{8}" {
    println("Your password matches our security settings.")
}

else {
    println("Please enter a password with a minimum of eight characters.")
}
}
