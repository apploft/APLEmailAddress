# APLEmailAddress

APLEmailAddress contains the class EmailAddressDetector to detect valid email-Addresses in a string and return instances of the EmailAddressProtocol. 


## Installation

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

Add this to your Podfile:

```ruby
pod "APLEmailAddress"
```
## Usage

Create an instance of EmailAddressDetector and use their methods to detect and create EmailAddress objects.
```ruby 
let emailAddressDetector: EmailAddressDetector = EmailAddressDetectorImpl()
```

### EmailAddressDetector
```ruby 
func detect(_ emailString: String) -> [EmailAddress]?
```
This function takes a string as input, uses the NSDataDetector to detect all valid email-addresses within that string and returns a list of valid EmailAddress objects.
```ruby 
func detectSolely(_ emailString: String) -> EmailAddress?
```
This is a convenience function that detects the first valid email-address within a given string, checks wether it is the only one and returns it in that case. 

### EmailAddress
EmailAddress is a protocol that implements the get-only property asString which returns the valid email-address as String.

The protocol also implements Hashable, Equatable and CustomStringConvertible. 
To access these Hashable, Equatable and CustomStringConvertible protocols the object EmailAddress needs to be converted to AnyHashableEmailAddress with the method asHashable(). 
