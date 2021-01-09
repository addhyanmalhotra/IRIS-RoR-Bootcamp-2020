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

 NOTE: All this is just my [@addhyanmalhotra] opinion, feel free to recommend any changes/suggestions. 
 




## Submitting for review

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b <your_name>_session_0`)
3. Commit your Changes (`git commit -m 'completed bla bla bla task'`)
4. Push to the Branch (`git push --set-upsream <your_name>_session_0`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2020](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2020)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* []()
* []()
* []()





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
