====
##RUBY
Q1: What is the difference between the send and public_send methods?
send can call an objects's private methods and public_send cannot.

Q2: Do Ruby variables typically hold object values or references to objects?
A: References

Q3: Name four exceptions to this: (point for each)
true, false, nil, or integers

Q4: Why might you want to avoid using string literals within loops?
A: A new object is created for every string literal even when the values are identical. Consider using variables or symbols instead.

Q5: Why are symbols typically used as hash keys instead of strings?
A: Symbols are immutable. Comparing two symbols is faster than comparing two String objects. Convention

Q6: Is a block an object?
A: No. A block is a syntactic structure of the interpreter. 

Q7: What's an exception to this?
A: block can be converted to a Proc object.

Q8: When might you encounter a LocalJumpError?
A: You might typically encounter this exception when attempting to yield when no block is given. You might also encounter this exception when attempting to return from a method that has already returned such as if you attempt to return from a Proc object whose lexically enclosing method has already returned.

Q9: Why must a class name begin with a capital letter?
A: Because the class keyword creates a new constant that refers to the class and constants begin with a capital letter.

Q10: Which method is invoked when a method is not found?
A: The nearest #method_missing

##Meta-Programming

Q1: When would you use a git rebase, instead of a git merge?
A: When you want to compact a lot of commits into one or two
When you want to avoid a merge commit

Q2: One billion bytes, is more commonly known as what?
A: Gigabyte

Q3: Briefly (in 10 words or less) describe an algorithm to find the greatest common divisor of two numbers (bonus point for 5 words or less)
A: Multiply together mutual prime factors

Q4: What's the average algoritmic complexity of the quicksort algorithm
A: O(n log n)

Q5: What about the worst case?
A: O(n^2)

Q6: For what might you use a 'Hamming Code'
A: Error detection/correction

Q7: What kind of DNS record would you use to alias one domain name to another?
CNAME

Q8: What does EC2 stand for?
A: Elastic Compute Cloud

Q9: DHH is the creator of Ruby on Rails, but what does DHH stand for?
A: David Heinemeir Hansson

Q10: What are the 5 SOLID principles of object oriented design? (One point each. Rory's team lose 1 point for each one they miss)

A:
Single responsibility principle
Open/closed principle
Liskov substitution principle
Interface segregation principle
Dependency inversion principle



##Geek Trivia

Q1: What is Asimov's first law of robotics?
A: A robot may not injure a human being or, through inaction, allow a human being to come to harm.

Q2: Which 80s movie sees David Lightman as a bright but unmotivated Seattle high school student and hacker.
A: Wargames

Q3: In the 1984 NES game 'Duck Hunt' you could do what to control the movement of the ducks on the screen?
A: Move the controller

Q4: In what year did Harry Potter first attend Hogwarts?
A: 1991

Q5: David Bowie and Alan Rickman sadly both passed away this week. As well as being the same age, they also have the same Bacon number - what is it?
A: 2

Q6: As well a gold rings, Sonic the Hedgehog is also famous for collecting which semi-precious stones?
A: (Chaos) Emeralds

Q7: In the X-Men, by what name is Scott Summers more commonly known by?
A: Cyclops

Q8: Seven actors have played Batman on the Big Screen. Name them all. (point for each)
A: Lewis G. Wilson, Robert Lowrey, Adam West, Michael Keaton, Val Kilmer, George Clooney, Christian Bale.

Q9: Which video game franchise is renowned for its graphic finishing moves called 'fatalities'
A: Mortal Kombat

Q10: Why do computer scientists confuse Christmas and Halloween?
A: oct 31 = dec 25
