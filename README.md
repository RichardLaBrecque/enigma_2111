# Welcome to Enigma!

***

## Self eval   
### Functionality  
As is currently set up, The CLI is operating as expected, and generating proper files  

OOP  
Project seems to be broken into what feels like the most logical pieces, each class does exactly 1 step of the process  

Conventions and Mechanics  
hashes hashes everywhere!

TDD  
I treid to test for everything i could think of, and I am rutinely adding tests as I try to make changes

Version control   
at current count 40 commits from 10 branches
***

## This project can encrypt and decrypt messages based on a key and date comboination
* Fork and clone this repo down to see what magic it can do!
### Basic operation of the ENIGMA encryption

* Start with a simple text file containting a message
  * there theres one called `message.txt`provided, feel free to replace the message   inside
* In your Terminal navigate to the repo and enter the following
  * `ruby encrypt.rb message.txt encrypted.txt`
  * this will create a new file called `encrypted.txt` as well as return the **key** and **date** used for encryption
* Because we have not given it keys or dates, it will generate it own random key, and use todays date, dont loose these as they how we can decrypt the message later

### decrypting the message
* to decrypt the message its done similary using a file called `decrypt.rb`
  * in your terminal enter `ruby decrypt.rb encrypted.txt decrypted.txt` following the decrypted.txt youll need to also enter your **key** and **date** as they were returned from before. this will decrypt the message and place it in a new file called `decrypted.txt`

### Spoilers below for how the magic happens!
## The inner workings
* There are a 5 files that do the work here
* text is encrypted using a 5 digit key and 6 digit date code, provided as strings
* Here we're using a cesar cypher to shift letters around.
  * in this case there are 4 shifts A B C D
* To start we take the 5 digit key provided and use it to create 4 2 digit number keys in the `keymaker.rb`
* Next the date is transformed into 4 single digit offsets in `offsetmaker.rb`
* `shiftmaker` takes the outputs from `keymaker` and `offsetmaker` and combines them into 4 shifts **A B C D**
* `lettershift` then applies the shifts to your message, using a rotating array of letters and keys to change each letter one at a time.
* the actual `enigma.rb` just pulls all the pieces together and makes it all go!
* encrypt and decrypt methods work the same way, the only differnce is an optional `-1` argument on the lettermaker `.shift` method forcing it into reverse
