# SICP Part 1 Review

- Computational processes are abstract beings that inhibit computers.  
- Processes manipulate other abstract things called **data**  
- The evaluation of a process is directed by **a pattern of rules** called a **program**.  
- Computational process does not have any physical aspects. It’s rather a concept or thoughts.  
- Programs are composed from **programming languages**.  
- **Procedures** in Lisp are descriptions of processes.  

<br>

## Chapter 1.1 The Elements of Programming

- Primitive expressions - which represent the simplest entities the language is concerned with.  
- Means of combination - by which compound elements are built from simpler ones  
- Means of abstraction - by which compound elements can be renamed and manipulated as units.  

<br>

### Expression

- You type an `expression`, and the interpreter responds by displaying the result of its `evaluating` that **expression**.  
- **Combinations** are formed by delimiting a list of expressions within parenthesis in order to denote **procedure application**.  
- The value of a combination is obtained by applying the procedure specified by the operator to **the arguments** that are **the values of the operands**.  

> Even with complex expressions, the interpreter always operates in the same basic cycle: It reads an expression from the terminal, evaluates the expression, and prints the result.   

<br>

### Naming and the Environment

> A critical aspect of a programming language is the means it provides for **using names to refer to computational objects**. We say that the name identifies a **variable** whose value is the object.   

> `define` is our language’s simplest means of abstraction, for it allows us to use simple names to refer to the results of compound operations   

> It should be clear that the possibility of associating values with symbols and later retrieving them means that the interpreter must maintain some sort of memory that keeps track of the name-object pairs. This memory is called the **environment**.  

<br>

### Evaluating Combinations

To evaluate a combination, do the following:  
1. Evaluate the subexpressions of the combination  
2. Apply the procedure that is the value of the leftmost subexpression, to the arguments that are the values of the other subexpressions.  

> Even this simple rule illustrates some important points about processes in general. First, observe that the first step dictates that **in order to accomplish the evaluation process for a combination we must first perform the evaluation process on each element of the combination**. Thus, the evaluation rule is recursive in nature; that is, it includes, as one of its steps, the need to invoke the rule itself.  

- By using recursion, we can express deeply nested combinations easily, otherwise be viewed as a rather complicated process.  
- At some point, we need to evaluation not combinations, but primitive expressions such as numerals, built-in operators, or other names:  
1. The values of numerals are the numbers that they name.  
2. The values of other names are the computational objects associated with those names in the environment.  

* The key point to notice is the **role of the environment** in determining the meaning of the symbols in expressions.   

- `(define x 3)` is not a combination. Such exceptions are called `special forms`, and each special form has its own evaluation rule.  

<br>

### Compound Procedure

- Now we will learn about `procedure definitions`, a much more powerful abstraction technique by which a compound operation can be given a name and then referred to as a unit.  

<br>

### The Substitution Model for Procedure Application

- For compound procedures, the application process is as follows:  
> To apply a compound procedure to arguments, evaluate the body of the procedure with each formal parameter replaced by the corresponding argument.   

- Numbers and arithmetic operations are primitive data and procedures.  
- Nesting of combinations provides a means of combining operations.  
- Definitions that associate names with values provide a limited means of abstraction.  
- Definitions that gives names to compound operations provides another means of abstraction.  

- Application order: first evaluates the operator and operands and then applies the resulting procedure to the resulting arguments.  
- Normal order: first substitute operand expressions for parameters until it obtained an expression involving only primitive operators, and then perform the evaluation.  

<br>

### Conditional Expressions and Predicates

> … we have no way to make tests and to perform different operations depending on the result to a test yet.  

```scheme
(cond (<p1> <e1>)
      ...)
```

- The general form of a conditional expression is consisting of the symbol `cond` followed by parenthesized pairs of expressions called **clauses**.  
- The first expression in each pair is a **predicate** - that is **an expression whose value is interpreted as either true or false**.  

<br>

### Procedures as Black-Box Abstractions

- It is crucial that each procedure accomplishes an identifiable task that can be used as a module in defining other procedures.  
- We are not at the moment concerned with `how` the procedure computes its result, only with the fact that it computes the square.  
- The details of how the square is computed can be suppressed, to be considered at a later time.  

- Say that we have two procedures A, B and A uses B. From the perspective of the procedure A, B is not quite a procedure, but rather an abstraction of procedure - **procedural abstraction**.  
- At this level of abstraction, any procedure that computes the square is equally good.  

- So a procedure definition should be able to suppress detail.  The uses of the procedure may not have written the procedure themselves, but may have obtained it from another programmer as a black box. **A user should not need to know the procedure is implemented in order to use it**.  

* The meaning of a procedure should be independent of the parameter names used by its author.  
* -> The parameter names of a procedure must be local to the body of the procedure.  

- A formal parameter of a procedure has a very special role in the procedure definition, in that it doesn’t matter what name the formal parameter has. Such a name is called a **bound variable**, and we say that **the procedure definition binds its formal parameters**.   
- If a variable is not bound, we say that it is **free**.  
- The set of expressions for which a binding defines a name is called the **scope** of that name.  

<br>

## Chapter 1.2 Procedures and the Processes They Generate

> To become experts, we must learn to visualize the processes generated by various types of procedures.   

- A procedure is a pattern for the **local evolution** of a computational process. It specifies how each stage of the process is built upon the previous stage.  
- In this section we will examine some common “shapes” for processes generated by simple procedures.  
- We will also investigate the rates at which these processes consume the important computational resources of time and space.  
