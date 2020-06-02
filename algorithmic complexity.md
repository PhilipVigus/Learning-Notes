# Algorithmic Complexity

How to algorithms scale? It's all about the scaling
Looks at how time grows in proportion to size

- time on the y, n on the x
	- linear search = n
	- binary search = log n (logarithmic complexity) O(log n)

Linear complexity
O(n) - any straight line

Logarithmic complexity
O(log n)

At some point, logarithmic complexity always gets faster when n increases
This gets really, really important at very high numbers of n
For an input size of 1000000000
Linear search = 1000000000
Binary search = 30

This is also a good reason why we sort data - it makes it much, much quicker to search. For example, indexes in databases are sorted and searched using binary search to make it really fast.

## Sorting algorithms

### Selection sort

- Go over the array, looking for the minimum and put it in a new array
- Repeat with each element until sorted

Quadratic complexity O(n^2)

### Insertion sort

- Take the last element of the array (pop it)
- Put it into the new array
- Take the next element, put it in the new array relative to the existing elements that have been moved over. Basically, insert it into the correct place in the new array
- etc

Insertion sort is expensive, because each time you insert, you have to move along all of the elements to the right of the insertion point

complexity O(n^2) - still quadratic, but with a lower constant (which you ignore for the purpose of big-O notation). So its quicker than selection sort, but still quadratic complexity

## Divide and conquer

A general strategy for algorithm design
Don't attack a problem as a whole, break it down into smaller problems and deal with those. Break them down smaller and smaller until the size makes the complexity easy

A general algorithm using recursion:

```
def solve(input)
	if input is simple enough
		return solution
	else
		break input down into input1 and input2
		solution1 = solve(input1)
		solution2 = solove(input2)
		merge solution1 & solution2 into solution
		return solution
```
The way you break the input down into two pieces varies depending on the problem. Different problems require different strategies in break it up.

### Applying this to sorting (mergesort)

What counts as a trivial input?

* empty array -> empty array
* [2] -> [2]
* [41] -> [41]

If len(arr) < 2
	return array
	
#### How should I break down the input and merge them back into one?
Only need to either make breaking down or merging clever

##### Breaking down:

* left = left half
* right = right half

##### Merging:

This is more complex because the breaking down is so simple. For example, we might need to merge:

* [5, 6, 7] and [2, 8]
* Take the lowest element from position 0 of each array

#### Complexity
```
Calc length
Break array into two at halfway point
call mergesort on the first subarray
	Calc length
	Break array into two at halfway point
	call mergesort on the first subarray
	etc
call mergesory on the sescond subarray
	Calc length
	Break array into two at halfway point
	call mergesort on the first subarray
	etc
```
Complexity O(2log(n))

### Quicksort - used with every language that uses arrays

Makes the breaking down complex and the combining simple

* Chose a pivot point to break the array between, usually the first element in the array
* Anything smaller goes in the left array, anything larger goes into the right array
* Repeat recursively with each subarray until you end up with a single element
* When you recombine it is just left + right

Complexity O(nlogn)

Grokking algorithms - free online
