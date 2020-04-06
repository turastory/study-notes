# SICP Note 2.2
### Hierarchical Data and the Closure Property

> As a consequence, pairs pro- vide a universal building block from which we can construct all sorts of data structures.  

> The ability to **create pairs whose elements are pairs** is the essence of list structure’s importance as a representational tool. We refer to this ability as the **closure property** of `cons`.   
> In general, an operation for combining data objects satisfies the closure property if the results of combining things with that operation can themselves be combined using the same operation.  

> Closure is the key to power in any means of combination, because it permits us to create **hierarchical structures** - structures made up of parts, which themselves are made up of parts, and so on.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. How is it different from the usual “closure” that we know?  

> The use of the word “closure” here comes from abstract algebra, where a set of elements is said to be closed under an operation if applying the operation to elements in the set produces an element that is again an element of the set.  
> The Lisp community also uses the word “closure” to describe a totally unrelated concept: A closure is an implementation technique for representing procedures with free variables.  

- So there it is. The word “closure” in the second context, does not really mean any sort of concepts.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Seems like we’ve already seen the closure property in part 1. Is there any relation between compound procedures and the closure property?  

> From the outset of Chapter 1, we’ve made essential use of closure in dealing with procedures, because all but the very simplest programs rely on the fact that the elements of a combination can themselves be combinations.  

- We’ve already used it! Combination - a compound procedure is one of the examples of the closure property.  

> “It is better to have 100 functions operate on one data structure than to have 10 functions operate on 10 data structures.”  

- This statement is used as a virtue of functional programming. From another perspective, if you can make a new data structure just like any functions, then does this statement exist?  
- The authors make an interesting claim about it.   

