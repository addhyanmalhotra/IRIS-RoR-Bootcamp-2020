<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/github_username/IRIS-RoR-Bootcamp-2020">
    <img src="https://media-exp1.licdn.com/dms/image/C510BAQECuNESgHrJMQ/company-logo_200_200/0/1533275791895?e=2159024400&v=beta&t=Tayas0MKSRXxXw3zIywPtfCZPHy7mjpGz8jsLOvsIGg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">session_0 editorial</h3>

  <p align="center">
    A guide to tasks prescribed in session_0 of bootcamp
    <br />
    <a href="https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2020"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2020">View Demo</a>
    ·
    <a href="https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2020/issues">Report Bug</a>
    ·
    <a href="https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2020/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#fizz-buzz">Fizz Buzz</a>
    </li>
    <li>
      <a href="#word-processing">Word Processing</a>
    </li>
    <li>
      <a href="#items">Items</a>
    </li>
  </ol>
</details>


## Fizz Buzz

### TASK AT HAND
 - Upon reading the comments in fizz_buzz.rb the following conclusions can be drawn about the task@hand

 - INPUT: 3 integers, n,x and y are given as keyword arguments in a precreated fizz buzz method.
 
 - OUTPUT : given a number n, return an array of first n natural number except number divisible by 'x' and 'y' are replaced by the ford "FizzBuzz" , those divisble only by 'x' are replaced by "Fizz" and those divisible only by 'y' replaced by "Buzz". Remaining numbers are left as is.

- EXCEPTION HANDLING: Raise ```ArgumentError``` if any one of x,y [divion by 0 is not defined] or if either one(or more) of x,y or n is(are) negative.   

### Approach

 - Keeping in mind this task is part of a larger ROR bootcamp and that the ultimate goal of the task is to learn ruby our solution should embody the following  software design paradigms
   - [Convention over configeration](https://en.wikipedia.org/wiki/Convention_over_configuration)
   - [DRY Code: Don't Repeat Yourself Code](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)  

### Solution

```ruby
def fizz_buzz(n:, x: 3, y: 5)
  if n<0 || x<=0 || y<=0
    raise ArgumentError
  end
  a = Array (1..n)
  a.map! do |i|
    if (i % x).zero? && (i % y).zero?
      i="FizzBuzz"
    elsif(i % x).zero?
      i="Fizz"
    elsif(i % y).zero?
      i="Buzz"
    else
     i=i.to_s
    end
  end
  return a
end
```

### Explaination
 Since the logic of the program is pretty straigt forward i'd like to discuss the constructs used in this rather implementation
 - instead of using a tradional for loop we use range construct to populate the array, followed by map! to modify the array in place
 - instead of using ==0 to check divisbility we use in-built function .zero? 
 - All this helps improve the readablity of the code and makes it easier to debug, and maintain on the long run.
 
## Word Processing

### 1. lower_case function
#### Solution 
``` ruby
def lower_case(words)
  return words.map{ |word| word.downcase }
end
```
#### Explaination
The logic of this function is pretty self explainatory. The function .map allocates a new array of the length of the original array and pushes the values that are used into this array. 

### 2. lower_case! function
#### Solution
``` ruby
def lower_case!(words)
  words.map!{ |word| word.downcase}
  return nil
end
```
#### Explaination
The logic of this function is very similar to the previous function but we need to modify the array in place and thus we use .map! instead of .map.The function .map! stores the value in the inital array itself.

### 3. words_with_prefix function
#### Solution
``` ruby
def words_with_prefix(prefix, words)
  return words.select{ |word| word.start_with?(prefix)}
end
```
#### Explaination
This function uses the select method. Select is used when you want to filter a list & get an array with the results. Hence, this method filters the list with all the words that starts with the prefix.

### 4. similarity_score function
#### Solution
```ruby
def similarity_score(word_1, word_2)
  length = [word_1.size, word_2.size].min
  similarity=0
  for i in 0..length-1
    if word_1[i].downcase == word_2[i].downcase
      similarity+=1
    else
      break
    end
  end
  return similarity
end
```
#### Explaination
In this function, we first find the size of the smaller word because we will iterate that number times at max. Now, we increment the similarity variable when the characters match and we break out of the loop when it doesnt. The similarity variable gives the similarity score.

### 5. most_similar_words function
#### Solution
```ruby
def most_similar_words(chosen_word, words)
  max_similar=0
  arr=Array.new
	words.each do |word|
		score=similarity_score(word,chosen_word)
		if score > max_similar
			max_similar=score
			arr=[word]
		elsif score == max_similar
			arr.push(word)
		end
	end
	return arr
end
```
#### Explaination
In this function we use the previous function similarity_score to calculate the similarity score between the choosen_word and each word of the words array. 

## Items
### TASK AT HAND
- Our first task is to store quantity of the item , so the company can keep track of items which need to be re-stocked. 
### Solution
```ruby
  attr_accessor :name, :price, :category_id, :discount_rate,
    :discount_deadline, :quantity
```
### Explaination
We add :quantity to the attr_accessor. If you are familiar with OOP concept, You must be familiar with getter and setter method. attr_accessor does the same in Ruby. 
### TASK AT HAND
- Now we have to write a function which returns a boolean value whether the item is discounted i.e. the discount deadline has been crossed or not.
### Solution
```ruby
  def discounted?
    return @discount_deadline>=Time.now
  end
```
### Explaination
The function is pretty self explainatory. Time.now returns the current time and date.

### TASK AT HAND
- We have to write a function which returns the current price
### Solution
```ruby
  def current_price
    if discounted?
      return @price * (100 - @discount_rate)/100
  else
    return @price
  end
  end
```
### Explaination
- We first check whether the item is eligible for discount, if it is then we do the calculation to find the new price. 

### TASK AT HAND
- We have to write a function which calculates the stock price by category.
### Solution
```ruby
def self.stock_price_by_category(items)
    #initialize hash with default value as 0
    total = Hash.new(0)
    items.each do |item|
      total[item.category_id]+=item.current_price * item.quantity
    end
    return total
  end
```
### Explaination
We first define a Hash whose keys refer to the category id of the items, and the key maps to the value which is the total stock price. Now we iterate through each item and calculate the stock price and store it in the corresponding key.

## Submitting for review
You can submit your code for review by following these 5 quick steps
1. Fork the Project
2. Create your Feature Branch (`git checkout -b <your_name>_session_0`)
3. Commit your Changes (`git commit -m 'completed bla bla bla task'`)
4. Push to the Branch (`git push --set-upsream <your_name>_session_0`)
5. Open a Pull Request

##### NOTE: All this is just our ( ()[@addhyanmalhotra] | ()[@gaurav2699]) approach to the problemset, feel free to recommend any changes.


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2020](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2020)







<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/IRIS-NITK/IRIS-RoR-Bootcamp-2020.svg?style=for-the-badge
[contributors-url]: https://github.com/IRIS-NITK/repo/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/IRIS-NITK/IRIS-RoR-Bootcamp-2020.svg?style=for-the-badge
[forks-url]: https://github.com/IRIS-NITK/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/IRIS-NITK/IRIS-RoR-Bootcamp-2020.svg?style=for-the-badge
[stars-url]: https://github.com/IRIS-NITK/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/IRIS-NITK/IRIS-RoR-Bootcamp-2020.svg?style=for-the-badge
[issues-url]: https://github.com/IRIS-NITK/repo/issues
[license-shield]: https://img.shields.io/github/license/IRIS-NITK/IRIS-RoR-Bootcamp-2020.svg?style=for-the-badge
[license-url]: https://github.com/IRIS-NITK/repo/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/IRIS-NITK
