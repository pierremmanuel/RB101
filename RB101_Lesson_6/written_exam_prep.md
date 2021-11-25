### Question 1

On line 1, we initialize the variable `num` to the integer object `3`. On line 3, we invoke the `loop` method and pass it a block as an argument.

Inside the block, on line 4, we reassign the variable `num` to the integer object `5`. This reassignment is possible because `num` was initialized in the outer scope. On line 5, we initialize the variable `size` to the string object `"medium"`. Finally, we `break` out of the loop after the first iteration on line 6.

On line 9, we call the `puts` method and pass it the variable `num` as an argument which outputs `5` to the console and returns `nil`. On line 10, we call the `puts` method and pass it the variable `size` as an argument, which prints an error message on the screen.

This example demonstrates variable scoping rules in Ruby. The reason we were able to output `num` and not `size` is simple: since `size` was initialized inside the `do..end` block, therefore in the inner scope, Ruby is not able to access this variable on line 10.

### Question 2

On line 1, we initialize the variable `num` to the integer object `3`. On line 3, we invoke the `loop` method and pass it a block as an argument.

On line 4, inside the block, we initialize the variable `size` to the string object `"medium"`. On line 6, we call the `times` method on the integer `2` and pass it a block as an argument. This method executes the code inside the block the number of times it was called upon, in this case `2`.

Inside the `do..end` block, on line 7, we initialize the variable `color` to `"blue"` 2 times.  

On line 10, we call the `puts` method on the object referenced by `num` which outputs `3` and returns `nil`. On line 11, we call the `puts` method on the object referenced by `size` which outputs `medium` and returns `nil`. However, when we try to do the same on line 12 with the variable `color`, we get an error message.

The reason for this message is the fact that `color` was initialized in the `do..end` block of the `times` method, therefore in the inner scope. Ruby does not have access to this variable. However, it has access to `size` and `num` because they were initialized both in a different higher-level scope.

Finally, we `break` out of the loop on line 14.

This code demonstrates how nested structures work in regards to variable scoping rules in Ruby.

### Question 3

On line 1, we initialize variable `num` to the integer `5`. On line 3, we call the `times` method on the integer `1` and pass it a block as an argument.

The `times` method executes the code inside the block the number of times it was called upon, in this case, once. Inside the block, on line 4, we initialize the block parameter `num` to the integer object `3`.

Finally, on line 7, we call the `puts` method and pass it the variable `num` as an argument which outputs `5` to the console and returns `nil`.

The reason why Ruby did not output `3` is because of variable shadowing. The block parameter takes precedence inside the block, therefore Ruby did not modify the local variable `num` inside it but the parameter `num`.

To solve this issue, a programmer could simply reassign the variable `num` in the outer scope, or reassign `num` in the outer scope to the return value of a method that would return the integer `5`.

### Question 4

On line 9, we initialize the variable `str` to the string object `"hello world"`. On line 11, we invoke the `a_method` method on the object referenced by `str`.

On line 1, both `str` the method parameter and `str` the local variable reference the same string object `"hello world"`. On line 2, we call the `puts` method on the object referenced by `str` which outputs `"hello world"` and returns `nil`.

On line 12, we invoke the `another_method`. Inside the method definition, on line 6, we call the `puts` method on the object referenced by `str`. However, the code is not executed and an error message appear instead. This is because method definition set their own scope, therefore any variables used inside it cannot be accessed by Ruby. What can be accessed by Ruby inside method definitions are parameters, but they must be initialized at the beginning of the method, which is not the case here with `another_method`.

### Question 5

On line 1, we initialize the variable `a` to the integer `3`. On line 2, we initialize the variable `b` to the string object `"blue"`. On line 3, we initialize the variable `c` to the array object `["shape"]`.

On line 5, we reassign variable `a` to the object referenced by `b` which is `"blue"`. On line 6, we reassign the variable `b` to the string object `"green"`. On line 7, we reassign `c` to the object referenced by `a` which is now `"blue"`.

Finally, we call the `puts` method on line 9 and pass it the variable `a` as an argument which outputs `blue` and returns `nil`. We call the `puts` method on the object referenced by `b` which outputs `green` and returns `nil`, and then we call again the `puts` method on the object referenced by `c` which outputs `blue`.

This code demonstrates the fact that in Ruby variables merely act as pointers. Even though we reassigned `a` to `b` on line 5, there is not link between `a` and `b`, just the fact that they now share the same string object. The same applies with `c` on line 7: `a` and `c` now share the same string object `"blue"`.

### Question 6

On line 5, we initialize the variable `n` to the integer `4`. On line 6, we initialize the variable `x` to `3`.

On line 8, we invoke the `double` method and pass it the variable `x` as an argument. On line 1, inside the method definition, both `x` the method parameter and `x` the local variable reference the same object `3`. On line 2, we initialize the variable `n` to the return value of the expression `2 * x`. Inside this expression, we call the `*` method on the integer `2` and pass it the parameter `x` as an argument.

The return value of the method call on line 8 is the return value of `n` inside the method definition, because it is the last line evaluated inside it. Its return value therefore is `6`.

On line 10, we call the `puts` method on the object referenced by `n` which outputs `4` and returns `nil`.

The reason why `4` is output to the console and not `6` is because method definitions define their own scope. Ruby does not have access to the local variable `n` inside the method definition on line 2. It can only have access to method parameters defined at the beginning of the method definition.

### Question 7

On line 5, we initialize the variable `instruction` to the string object `"SHHH"`. On line 6, we invoke the `quiet` method and pass it the variable `instruction` as an argument.

On line 1, inside the method definition, both `string` the method parameter and `instruction` the local variable, reference the same string object `"SHHH"`.

On line 2, we call the `downcase` method on the object referenced by `string`. It is a non-mutating method, hence it returns a new string object. Since it is the last line of the method definition, its return value is also the return value of the method, which is `"shhh"`.

On line 8, we call the `puts` method on the object referenced by `instruction` which outputs `"SHHH"` and returns `nil`.

The reason why the original object `"SHHH"` is output is because we used a non-mutating method inside `quiet`. This demonstrates that objects can be passed by value inside method calls in Ruby.

### Question 8

On line 6, we initialize the variable `instruction` to the string object `"SHHH"`. On line 7, we invoke the `double_quiet` method and pass it the variable `instruction` as an argument.

On line 1, inside the method definition, both `string` the method parameter and `instruction` the local variable reference the same string object `"SHHH"`.

On line 2, we call the `+` method on the object referenced by `string` and pass it the parameter `string` as an argument. It is a non-mutating method that will return a new string object. On line 3, we call the `downcase!` method on the object referenced by `string`. This is a method that mutates its caller, therefore, now both `string` and `instruction` reference the string `"shhh"`. Since it is the last line evaluated in the method definition, the return value of `double_quiet(instruction)` is `"shhh"`.

Finally, on line 9, we call the `puts` method on the object referenced by `instruction` which outputs `"shhh"` and returns `nil`.

This code demonstrates that Ruby can be considered a pass-by reference programming language.

### Question 9

On line 6, we initialize the variable `instruction` to the string object `"SHHH"`. On line 7, we invoke the method `double_quiet` and pass it the variable `instruction` as an argument.

On line 1, inside the method definition, both `string` the method parameter and `instruction` the local variable reference the same string object `"SHHH"`. On line 2, we reassign `string` to the return value of the expression `string + string`. Inside this expression we call the `+` method which is non-mutating and returns a new string. Since reassignment inside method definitions is destructive in Ruby, now the link between `string` and `instruction` is broken. Therefore, when we call the `downcase!` method on the object referenced by `string` on the next line, we are only mutating the parameter `string`.

On line 9, we call the `puts` method and pass it the variable `instruction` as an argument, which outputs `"SHHH"` and returns `nil`.

This example shows that Ruby can be considered a pass-by value programming language in regards to reassignments inside method definitions.

### Question 10

In the first example, on line 6, we initialize the variable `instruction` to the string object `"SHHH"`. We do the exact same in the second example.

The first difference between the two examples appears on line 7: in example 1, we simply invoke the method `double_quiet` and pass it the variable `instruction` as an argument. In example 2, we reassign `instruction` to the return value of this method call.  

Inside the method definition, on line 1 of both examples, `string` the method parameter and `instruction` the local variable reference the same object `"SHHH"` and the same space in memory.

On line 2, in example 1 we use the concatenation method `<<` on the object referenced by `string` and pass it the parameter `string` as an argument. This method is mutating, therefore now `string` and `instruction` reference the same object `"SHHHSHHH"`. In example 2, we reassign `string` to the return value of `string + string`. The `+` method is non-destructive therefore the expression `string + string` returns a new string. Since reassignments inside method definition is destructive, now `string` and `instruction` reference two different objects and spaces in memory. Any further modification on `string` in the method will not have any impact on `instruction`.

On line 3, in example 1, we call the `downcase!` method on the object referenced by `string`. It is a mutating method therefore both `string` and `instruction` reference now reference the object `"shhhshhh"`. `"shhhshhh"` is also the return value of the method definition because it the last return value of it. In example 2, we call the non-destructive method `downcase` on the object referenced by `string`. At the end of the method, string references `"shhhshhh"` and `instruction` references `"SHHH"`.

On the last line of the code, we call the `puts` method and pass it the variable `instruction` as an argument which outputs `"shhhshhh"` in both examples. The reason for this is that in example 2 we reassigned `instruction` to the return value of `double_quiet(instruction)` and in example 1 we mutated `instruction` thanks to a simple method call of `double_quiet`.

These two examples demonstrates that Ruby can be both considered a pass-by value programming language (example 2) and a pass-by reference programming language (example 1)

### Question 11

On line 1, in example 1, we initialize `arr` to the array of integers object `[1, 2, 3, 4, 5]`. On line 2, we initialize the variable `new_arr` to the empty array `[]`.

On line 3, we call the each method on the object referenced by `arr` and pass it a block as an argument. Every element of `arr` is passed inside the block and assigned to the block parameter `num`. Inside the block, on line 5, we call the `<<` destructive method on the object referenced by `new_arr`. In line 5, we push the return value of `num * 2` inside `new_arr`. Now `new_arr` references `[2, 4, 6, 8, 10]`.

On line 8, we call the `p` method on the object referenced by `new_arr` which outputs `[2, 4, 6, 8, 10]` and returns the very same array object.

In order to get the same results in example 2, we need to implement this piece of code:
```ruby
arr = [1, 2, 3, 4, 5]
new_arr = []

index = 0

loop do
  new_arr[index] = arr[index] * 2
  index += 1
  break if index == arr.size
end

p new_arr

```
### Question 12

The `Hash#select` method is a method that iterates through every key-value pairs of the calling hash to perform selection. Every key-value pair of the calling hash is passed inside the block and assigned to 2 block parameters. If a block parameter is not required or not used inside the block, then we usually assign it to `_`. The method returns a new hash comprised of every key-value pair of the calling hash for which the block evaluates to `true`. Therefore, the `Hash#select` method evaluates the truthiness of the returned values of the block to perform selection. If the block evaluates to `false` (meaning the return value of the block is either `false` or `nil`), then the key-value pair is not selected by the method.

### Question 13

On line 1, we call the `map` method on the array literal `[1, 2, 3]` and pass it a block as an argument. Every element of the calling array is passed inside the block and assigned to the block parameter `num`.

The `map` method iterates through every element of the calling array to perform transformation. It returns a new array comprised of the returned values of the block. In this case, the `map` method returns the same elements of the calling array because the return values of the block are always the return values of the parameter `num`. Hence the `map` does not perform transformation is this case.

Also on line 1, we reassign `arr` to the return value of the `map` method, which is `[1, 2, 3]`.

On line 3, we call the `p` methods on the object referenced by `arr` which outputs `[1, 2, 3]` and returns `[1, 2, 3]`.

Since we are using the array `[1, 2, 3]`, its object-id is always different as we are using it through the code. However, when it is assigned to a variable (in this case `arr`), its object id never changes. We can verify this with the following:

```ruby
p [1, 2, 3].object_id

arr = [1, 2, 3].map { |num| num }

p [1, 2, 3].object_id
p arr.object_id

p arr

```
 We can see that the array literal and `arr` reference two different space in memory by using the `object_id` method. Therefore they are two different objects.

### Question 14

On line 1, we call the `select` method on the array literal `[1, 2, 3]`. Every element of the calling array is passed inside the block and assigned to the block parameter `num`. The `select` method iterates through every element of the calling array to perform selection. It returns a new array comprised of every element of the calling array for which the block evaluates to `true`.

In this case, `num` always evaluates to `true` therefore every element of the calling array are selected in the new array.

While `map` returns a new array of the return values of the block, `select` returns a new array of every element for which the block returns `true`.

Therefore, when call the `p` method on the object referenced by `arr`, it outputs `[1, 2, 3]` and returns `[1, 2, 3]`.

### Question 15

On line 1, we initialize the variable `letters_and_numbers` to the hash object `{"a" => 1, "b" => 2, "c" => 3}`. On line 3, we call the `each` method on the object referenced by `letters_and_numbers` and pass it a block as an argument.

The `each` method always returns the original object it was called on and ignores the return value of the block.

Every key-value pair of `letters_and_numbers` is passed inside the block and assigned to the parameters `letter` and `num`. Since the return value of the block is ignored and that the only expression of the block does not perform anything (`num < 4`), then the method `each` is useless.

On line 3, we initialize the variable `hsh` to the return value of `letters_and_numbers.each` which is the original hash `{"a" => 1, "b" => 2, "c" => 3}`.

That is why when we call the `p` method on the object referenced by `hsh` on line 7, it outputs `{"a" => 1, "b" => 2, "c" => 3}` and returns `{"a" => 1, "b" => 2, "c" => 3}`.

### Question 16

On line 1, we initialize the variable `letters_and_numbers` to the hash object `{"a" => 1, "b" => 2, "c" => 3}`. On line 3, we call the `select` method on the object referenced by `letters_and_numbers` and pass it a block as an argument.  

The `select` method iterates through every key-value pair of the calling hash to perform selection. It returns a new hash comprised of every key-value pairs for which the block evaluates to `true`. Every key-value pair of `letters_and_numbers` is passed inside the block and assigned to the parameters `letter` and `num`.

On line 4, we evaluate the expression `num < 4`, which returns a boolean value. Since it is the last line of the block, its return value is also the return value of the block. In this case, the `select` method selects every key-value pairs of the calling hash because every value of the calling hash respect the condition `num < 4`. The block always returns `true`. The method `select` returns a new hash with every elements of the calling hash.

On line 3, we initialize the variable `hsh` to the return value of `letters_and_numbers.each` which is the original hash `{"a" => 1, "b" => 2, "c" => 3}`.

That is why when we call the `p` method on the object referenced by `hsh` on line 7, it outputs `{"a" => 1, "b" => 2, "c" => 3}` and returns `{"a" => 1, "b" => 2, "c" => 3}`.

The main difference between `each` and `select` is that the only use case for `each` is that it can perform some code inside the block passed as an argument to it. `select` on the other hand returns a new object by evaluating the return values of the block.

### Question 17

On line 1, we call the `sort` method on the array literal `["ab", "c", "aaa", "b", "aa"]`. The way the `sort` method works is by comparing two different elements of the calling array.

We could pass an optional block as an argument to detail what the `sort` method does:

```ruby
["ab", "c", "aaa", "b", "aa"].sort { |a, b| a <=> b }
```

This code performs the same thing and returns the same array. Every element of the calling array is successively assigned to the block parameters to perform comparison. We do so by calling the `<=>` method (also called the spaceship operator) to compare the two.

Precedence in Ruby is done by comparing the position of the elements in the ASCII table. When `a` has precedence over `b` the expression `a <=> b` returns -1. When it is the other way then it returns `1`. When both parameters are equal in terms of precedence then it returns `0`

We can view the position of an object in the ASCII table in Ruby by calling the `#ord` method on a specific object.

### Question 18

On line 3, we call the setter method `[]` on the hash object referenced by `my_hash` to access the position of the value `3` of the calling hash.

The concept this example demonstrates the fact that collection objects like arrays and hashes can have other collection objects within them. In this example, `my_hash` is a two-dimensional hash: one of the values of `my_hash` is the hash `{d: 3, e: 5}`.

In order to work with nested collection objects in Ruby, we need to use the setter method `[]`. If the hash is two-dimensional (like it is the case in this example) and that we want to access one of its values, we need to call the setter-method twice and specify the key that match the element each time. 

In the expression `my_hash[:b][:d]`, the `[:b]` part helps us access the value corresponding to the key `:b` which is the hash `{d: 3, e: 5}`. Then, the `[:d]` part helps us access the value corresponding to the `:d` key inside `{d: 3, e: 5}`.


### Question 19

On line 1, we initialize the variable `my_arr` to the 2-layer nested array object `[["a", "b"], ["c", "d"], ["e", "f"]]`. On line 3, we call the `each` method on the object referenced by `my_arr` and pass it a block as an argument.

Every element of `my_arr` is passed inside the block and assigned to the block parameter `arr`. The `each` method only performs the code inside the block and iterates through every element of the calling array and returns the original calling array.

On line 4, we call the `each` method on the object referenced by `arr` and pass it a block as an argument. Every element of `arr` is passed inside the block and assigned to the block parameter `letter`. On line 5, we call the `puts` method on the object referenced by `letter` which outputs successively every letters of `my_arr` and returns `nil`.

The following gets printed to the console:
```ruby
a
b
c
d
e
f
```

### Question 20

On line 5, we initialize the variable `a` to the return value of the method call `greeting`. On line 2, inside the method definition, we call the `puts` method on the string literal `"Hello"` which outputs `Hello` and returns `nil`. Therefore `a` is initialized to `nil`.

On line 7, we use the `if` conditional statements to execute possible parts of the code on lines 8 to 10. In this case, the `if` statements evaluates the truthiness of `a`. Since `nil` is not considered truthy by falsey in Ruby, the code after the `else` statement on line 9 is executed and not the code on line 8.

On line 10, we call the `puts` method on the string literal `"Goodbye"` which outputs `Goodbye` and returns `nil`.

### Question 21

On line 5, we evaluate the expression `some_method == false` by calling the `==` comparison method on the object referenced by the return value of the method call `some_method`. We want to check if the return value of the method call is the boolean object `false`. The expression `some_method == false` returns a boolean, `false`.

On line 2, inside the method definition of `some_method`, we call the `puts` method on the string literal `"True"` which outputs `True` and returns `nil`. Since it is the last line of the method, its return value is also the return value of the method. Therefore the method call `some_method` on line 5 returns `nil`.

Since `nil` is not the same object as `false`, the expression `some_method == false` returns `false`. The confusion could arise if the programmer who wrote this code thought that he was evaluating the truethiness of the last expression, which is not the case.

This code demonstrates the difference between concepts like truethiness and falseyness versus the boolean objects `true` and `false`.
