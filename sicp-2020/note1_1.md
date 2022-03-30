# SICP Note 1.1
## 1 - Building Abstractions with Procedures

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why the title is “building abstractions with procedures”? I thought the most important thing in this chapter is computational process, but is it wrong?  

> We are about to study the idea of a computational process. Computational processes are abstract beings that inhabit computers. As they evolve, processes manipulate other abstract things called data.  
> The evolution of a process is directed by a pattern of rules called a program. People create programs to direct processes.  

- The main goal of this part is **to study the idea of a computational process**  
- Computational processes are abstract beings, as well as data.  
- Processes **evolve**. I’m not sure what it means, but they evolve.  
- Processes manipulate data “as they evolve”.  
- A program is a pattern of rules.  
- “The evolution” of a process is directed by a program.  
- Evolve - it means “develop gradually, especially from a simple to a more complex form” - so it doesn't mean the evolution of creatures. It means development of something.  
- An enlightenment: I should think about the meaning of the words carefully, beyond the context of computer science because.. they - the authors and pioneers uses that specific words intentionally. For example, evolution theory - when someone says evolution, we usually think of Darwin’s evolution theory. But the word “evolution” existed even before the evolution theory, and it has its own meaning. -- So if something’s strange or awkward, clean out previous knowledge and let’s search for the meaning of it, and then accept the new knowledge. That is the meaning of “knowing”, or “seeing as is”  

> A computational process is indeed much like a sorcerer’s idea of spirit. It cannot be seen or touched. It is not composed of matter at all.  
> Programs are carefully composed from symbolic expressions in programming languages that prescribe(command) the tasks we want our processes to perform.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What’s the difference between a process and a program?  

- A process (computational process) is an idea. There’s no format, or shape. A program, on the other hand, is a real thing. A program is a pattern of rules, and is composed from expressions in programming language.  

A procedure is a description of the rules for manipulating the data.  
A procedure is a pattern for the local evolution of a computational process.  

<br>

> Master software engineers have the ability to organize programs so that they can be reasonably sure that the resulting processes will perform the tasks intended. They can visualize the behavior of their systems in advance. They know how to structure programs so that unanticipated problems do not lead to catastrophic consequences, and when problems do arise, **they can debug their programs.** Well-designed computational systems, like well-designed automobiles or nuclear reactors, are designed **in a modular manner**, so that the parts can be constructed, replaced, and debugged separately.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. The author says the distinctions between Master software engineers and novice are..  

- An ability to design the system - to structure and organize programs to prevent critical problems.  
- An ability to debug the program - to find the cause of the problems, and fix it.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. It says “well-designed system” are designed in a modular manner. What it means to be “modular”? Why modular systems are considered “well-designed”?  

- “Separately” constructed*replaced*debugged.  
- In modular system, the components which forms the systems are separately constructed, replaced, and debugged - meaning that some problems or changes in one module does not affect the other modules. By modularizing the system, you can delimit the effect of the problems and changes, which leads to less debugging and easy development.  

<br>

### 1.1 The Elements of Programming

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Author says.. powerful programming languages should provides primitives, means for combination, and means for abstraction. Why those concepts make the programming languages so “powerful”?  

- As a program is a thought of a person, it reflects our though process. Hence, programming languages should provide means to express the process, in a way that the human thinks.  

- How do we think? First there’re are some basic ideas - or, a unit of the thoughts. - This is **Primitives**  
- With these units, we combine the units to build more complex ideas - compounds. - This is **Combination**  
- After building the complex element, we can now treat it as an unit of another thoughts or combinations. - This is **Abstraction**  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is **abstraction**?  

- Abstraction is a process of removing details to focus on details of **greater importance**.  
- So when you want to abstract things, you should think about what to focus, and what to ignore.  
- Is **modeling** an abstraction? Yes! - It only represents details that someone wants to emphasize.  

What can you benefit from using abstraction?  
- First, you can save more resources - computing power, energy, space, human thinking, all kinds of resources. Abstraction is all about efficiency. Think about image compression. If you compress an image(remove the details), you loses the resolution, but you can save more space. In many cases, the decreasion of resolution doesn’t matter, so it improves efficiency.  
- Here’s another perspective. Imagine you have a microscope and use it to observe the tree. If you look really, really close, you can only see atoms and empty spaces. As you get back, you can see cells, chloroplasts, and then organisms, tree, and then a forest, …  
- So abstraction gives us **various perspectives with different levels about one phenomenon**. In other words, by abstracting certain things, you can observe new things from the same phenomena.  

<br>

#### Chapter 1.1.1 Expressions

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is “expression”?  

> You type an expression, and the interpreter responds by displaying the result of its evaluating that expression.  

- One thing that can observe from the above quote is that the expression is **the interaction** between an interpreter and us, .  
- Another thing is that evaluating the expression must produce some **result**. The important thing is, the expression **produces some result, not a value**.  
- i.e. an expression is something which **can be evaluated** by interpreter, **to produce some result**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why the expression should produce some result?  

- This question is meaningless, I think. That’s the definition of the expression. Without it, we can’t deploy further thoughts and concepts.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is the meaning of **result** in the above context?  

- It can be **anything**. It can be a value, or a calculation, an action, literally anything.  

<br>

> Expressions **representing** numbers may be combined with an expression **representing** a primitive procedure to form a compound expression that **represents** the application of the procedure to those numbers.  

- The author repeatedly use the word “represent”. Based on this quote, I would say **an expression is a representation of a computational object**  

<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is a “computational object”?  

- A **computational object** is something that can be placed in memory, and manipulated by a program. It is anything that can be **the value of a variable**.  
- What are the types of computation objects? It depends on the language. Numbers, strings, lists, arrays, functions, …  

<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is “the application of the procedure to something”? In the above quote? What is “procedure application” exactly?  

- From the quote.. a compound expression, or a **combination** - which formed by combining data with a procedure - “represents” the application of the procedure.  

> **The value of a combination** is obtained by applying the procedure specified by the operator to the arguments that are the values of the operands.  

- You can obtain the value of a combination “**by applying the procedure** specified by the operator **to the arguments** that are the values of the operands”  

<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Recall that an expression is a representation of a computational object. Then is the procedure application a computational object? Or the result of the procedure application?  

- First Speculation: I think procedure application is more hypothetical concept like computational process or thoughts, while the result of it is a real thing that can be stored in somewhere.  
- Let’s say you have a combination `(+ 4 5)`. Before you use interpreter to evaluate this expression, its value is unknown. As an expression is a representation of a computational object, **not** an evaluation of a computational object, I think the procedure application is also computational object too, but it’s just a speculation. I’m not sure what to answer this question at this point. **TBD**  

Advantages of prefix notation:  
* be able to accommodate procedures that may take an arbitrary number of arguments  
* provides a straight-forward way to allow combinations to be nested.  

<br>

#### Chapter 1.1.2 Naming and Environment

> A critical aspect of a programming language is the means it provides for using names to refer to computational objects. We say that the name identified a variable whose value is the object.  

Relations:  
* Variable is a name of a computational object.  
* Computational object is a value of a variable.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why naming computational objects is so important?  

- Because it is the simplest means of abstraction. Imagine you have an extremely complex computational object. Without naming, you have to remember the  

> It should be clear that the possibility of associating values with symbols and later retrieving them means that the interpreter **must maintain some sort of memory** that keeps track of the name-object pairs. This memory is called the **environment** (more precisely the global environment, since we will see later that a computation may involve a number of different environments.  

- Naming capability implies the existence of some sort of memory.  

<br>

#### Chapter 1.1.3 Evaluating combinations

> One of our goals in this chapter is to isolate issues about thinking procedurally. As a case in point, let us consider that, in evaluating combinations, the interpreter is itself following a procedure.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. The author says, the goal in this chapter is to isolate “issues about thinking procedurally”. What does it mean?  

- Hmm.. The author did not mention about any “issues”. I guess it means “things to concern in order to evaluate the expressions”. But.. I’m not sure the main theme of this chapter - is it a procedure, or an interpreter?  

To evaluate a combination, do the following:  
1. Evaluate the subexpressions of the combination.  
2. Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).  

So the **procedure is recursive** - meaning that it includes itself as one of its steps.  We can evaluate very complicated combinations easily with the recursion. In general, recursion is a very powerful technique for dealing with hierarchical - tree-like objects.  
The above **procedure leads us to the bottom** - primitives, not combinations. So there should be a way to evaluate the primitives as well.  

<br>

> Each combination is represented by a node with branches corresponding to the operator, and the operands of the combination stemming from it. The terminal nodes (nodes with no branches stemming from them) represent either operators or numbers. Viewing evaluation in terms of the tree, we can image that **the values of the operands percolate upward**, **starting from the terminal nodes** and then **combining at higher and higher levels**.  

> We take care of the primitive case by “stipulating” that  
> - The values of numerals are the numbers that they name  
> - The values of built-in operators are the machine instruction sequences that carry out the corresponding operations  
> - The values of other names are the objects associated with those names in the environment  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why do we have to “stipulate” the evaluation rules of primitives like the above? Is there another way to evaluate the primitives?  

- Well, you may say the values of numerals are the numbers that they name, subtracted by 1. So the value of “1” is `0`, “2” is `1`, and so on. But what’s the meaning of all this? It’s **counter-intuitive** - does not follow our thinking process.  
- So, you can define evaluation rule as whatever you want, but counter-intuitive evaluation rule may be meaningless to use, humans. We cannot go further with those evaluation rules.  

In the above rule, we can consider the second rule as a special case of the third one, by assuming that the symbols - such as ** and + are “names” in the environment, and machine instructions are their values.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. **the meaning of the names is determined by the environment.** What does it mean?  

- Here’s a simple expression: `x`. What’s the value of this expression? Without the information about the environment, you cannot answer the question. In other words, **to evaluate an expression, we need an environment associated with it.**  
- So even if the symbol `+` looks like “plus sign”, the instruction associated with this symbol - operator may different. We, as programmers, are more friendly about this concept - think about “operator overloading”, “Polymorphism”, etc. I guess the idea we’ve discussed above is behind those concepts.  

<br>

> … (define x 3) is not a combination. …  
> Such exceptions to the general evaluation rule are called **special forms**.  
> Each special form **has its own evaluation rule**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why do we need a special form?  

- Special forms are exceptions to the general evaluation rule. This means, there’re some cases where **the general evaluation rule cannot handle**. `define` - Giving a name to a value, is one of those cases.  
- But.. is it really needed? I mean, from CPU’s perspective, all those expressions are reduced to some set of machine instructions, eventually. If we extend the general evaluation rule, we may not need special forms!  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What would be such evaluation rule, that embrace special forms like definition?  

- Think of general evaluation rule. When you evaluate a combination, there should a value of that evaluation. (Because if you follow general evaluation rule,  you should percolate the values of subexpressions upwards)  
- What will be the value of `definition` procedure? Well, note that **the general evaluation rule does not affect the environment.** It uses the environment to evaluate the names, procedures, but it cannot modify the environment itself.  
- So extending evaluation rule to embrace special forms means, it should take account of not only the expressions, but also the environment!  
- Maybe the value of `definition` is the value it gives a name. So the value of  `(define x 2)` is `2`. But.. is it okay to do such thing? I mean, if we define the value of the definition such way, then the value of `2` is equal to the value of `(define x 2)`! **The values are the same, but the result is different!**  
- At this point, I recalled the concepts of side effect and pure function. In this case, the value does not fully describe the result of the expression. So we may define the value of `(define x 2)` to something like `(2, "x: 2")`, so that we can observe what the expression did - what’s the result of the expression.  
- But.. is it valid? Of course we can show what it did, but.. I think **the values cannot exist beyond the environment**.  
- **Express the environment as a value**…  

<br>

###### Summary
* The main topic of this chapter is **how to evaluate expressions**  
* I observed the recursive nature of evaluation rule.  
* I know how to evaluate combinations, primitives, as well as special forms - which has its own evaluation rule.  
* So there’re 3 kinds of expressions: primitives, combination, special forms.  
* I’ve speculated why special forms should exist.  

<br>

#### Chapter 1.1.4 Compound procedures

> Now we will learn about **procedure definitions**, a much more powerful abstraction technique by which a compound operation can be given a name and then referred to as a unit.  

Procedure definition extends the concept of `definition` - Giving a name to not only values (objects) but also combinations.  
- Data and procedures are eventually the same, but we haven’t discussed about it. At this point, consider procedure and the objects are distinct concepts.  

`(define (square x) (** x x))`  
> We have here a **compound procedure**, which has been given the name square. The procedure represents the operation of multiplying something by itself. The thing to be multiplied is given a **local name**, x, which plays the same role that a pronoun plays in natural language. **Evaluating the definition creates this compound procedure and associates it with the name square**.  

Procedure definition is a special form, and 1) it creates a compound procedure, and 2) associate it with the given name.  
- These two operations **can be done independently** - to create a procedure without a name, and to give a name to a procedure already created.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why it is a **local name**, not just a name?  

- Recall the third rule of evaluation rules of primitive case: `the values of other names are the objects associated with those names in the environment.` So applying compound procedure creates **a local environment** for its body, with associations between formal parameters and the actual arguments.  

The general form of a procedure definition:  
`(define (<name> <formal paramters>) <body> )`  

> The **⟨name⟩** is a symbol to be associated with the procedure definition in the environment. The **⟨formal parameters⟩** are the names used within the body of the procedure to refer to the corresponding arguments of the procedure. The **⟨body⟩** is an expression that will yield the value of the procedure application when the formal parameters are replaced by the actual arguments to which the procedure is applied.  

- When the interpreter evaluates procedure definition,  
1. It associates the <name> with the compound procedure provided.  

- When the interpreter evaluates compound procedure (When the compound procedure is applied),  
1. It creates a local environment for the expression(body). It associates the names(formal parameters) with the value provided as arguments to the procedure.  
2. Follows general evaluation rule.  

- It is important to understand that **“procedure definition” and “compound procedure” are different**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What are the **arguments** or the procedure?  

- It’s not clear because the author does not mention about it directly but from the context, I think **arguments are the actual values provided to the procedure, when the procedure application happens**. It is obvious when you think about formal parameters. They are **names** referring to arguments, and those names are replaced by the actual arguments.  

> Compound procedures are used in exactly the same way as primitive procedures. Indeed, one could not tell by looking at the definition of sum-of-squares given above whether square was built into the interpreter, like + and **, or defined as a compound procedure.  

- This means the evaluation mechanisms for compound procedure and procedure are the same. We can embrace compound procedure with the general evaluation rule!  

###### Summary
* The main topic of this chapter is **compound procedure**.  
* I know the concepts of procedure definition, formal parameters, and arguments.  
* I know the process of procedure definition along with evaluation of compound procedure - it’s not a single step.  

#### Chapter 1.1.5 The Substitution Model for Procedure Application

> We can assume that the mechanism for applying primitive procedures to arguments is built into the interpreter. For compound procedures, the application process is as follows:  
> To apply a compound procedure to arguments, **evaluate the body of the procedure with each formal parameter** **replaced by the corresponding argument**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Let’s compare with our speculations! Is it correct, or not?  

- Unfortunately, it does not tell about the environment. But.. our speculation about the arguments may seem correct!  

To evaluate a combination, or a compound procedure, we should repeatedly apply the above rule:  

```
(sum-of-square (** 2 3) (+ 4 6))
-> (sum-of-square 6 10)
-> (+ (square 6) (square 10))
-> (+ (** 6 6) (** 10 10))
-> (+ 36 100)
-> 136
```

To formalize this step:  
1. Replace the names (the formal parameters) with the actual values (the arguments)  
2. Evaluate primitive expressions.  

> The process we have just described is called the **substitution model** for **procedure application**. It can be taken as a model that determines the “meaning” of procedure application, insofar as the procedures in this chapter are concerned.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What’s the relation between.. substitution model and procedure application?  

- As the author says, the substitution model **determines** the **meaning** of procedure application. Now, we can observe few things from the quote.  
1. There’re **other models** - not substitution model, but they’re also models for the procedure application.  
2. Substitution model is a **process**! And recall that “computational process” is an abstract thing, which is directed by a program.  
3. Now we know what procedure application really does. Although it’s not exactly the same as how the interpreter works, but it’s a big step.  

> In practice, the “substitution” is accomplished by using a local environment for the formal parameters.  

- The author mentioned “local environment”! Our speculation is correct. Maybe it’s about the implementation details. But.. let’s wait until chapter 3, and 4.  

The substitution model is not the only model, and there’re more elaborate and complicated models out there. But for now, the substitution model works as expected, and that’s enough. As we reach the limitation, we will manage to find a new model.  

<br>

> According to the description of evaluation given in Section 1.1.3, the interpreter first evaluates the operator and operands and then applies the resulting procedure to the resulting arguments.  This is not the only way to perform evaluation.  
> An alternative evaluation model would not evaluate the operands until their values were needed. Instead it would first substitute operand expressions for parameters until It obtained an expression involving only primitive operators, and would then perform the evaluation.  

So.. there’re two ways to evaluate the expressions.  

1. **Applicative-order evaluation**: Evaluate the operands, and then operator  
- “Evaluate the arguments and then apply”  
2. **Normal-order evaluation**: Evaluate the operator, and then operands  
- “Fully expand and then reduce“  

More familiar one is the first. Actually, interpreter uses the applicative order evaluation.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why the evaluation is “applicative”? Is there a relation with “applicative functor”??  

- I think the adjective “applicative” comes from what it is. It “applies” the procedure first, if possible. While in normal-order evaluation, we first expand all the names and compounds, and then apply to reduce.  

> It can be shown that, for procedure applications that **can be modeled using substitution** (including all the procedures in the first two chapters of this book) and that yield **legitimate values**, normal-order and applicative-order evaluation produce the same value.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Is there a procedure application that cannot be modeled using substitution model?  

- The author mentioned other models. If we encounter those procedure applications, we will use new models.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is legitimate values? What does it mean that the values are **legitimate**?  

- Hmm.. I don’t know the examples of such values, but as mentioned above, if the procedure application yields legitimate values, then normal-order and applicative-order evaluation produces the same value.  
- In other words, legitimate value is something have the same values, if those procedures are eventually equal, **regardless of the order of the application** of the procedures.  
- It reminds me pure function and side effects, again.  

Here we have two procedures:  
```scheme
(define (p) (p))
(define (test x y) (if (= x 0) 0 y))
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What’s the result of the following expression? What will happen?  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. `(test 0 (p))`  

- In applicative-order, it evaluates to 0. Because in applicative-order, it evaluates the arguments first and then apply the procedure. So the order of evaluation is `(= x 0) -> 0`  
- In normal-order, otherwise, I’m not sure what would happen. In normal-order, all the subexpressions expand before reduction so it evaluates `(p)` first.  
- But as you notice, `(p)` evaluates to `(p)`! So it will fall into infinite loop. So the result is different from the applicative-order.  
- Hence, the procedure application above, yields **illegitimate value**.  

<br>

Lisp uses applicative-order evaluation because of two advantages, compared to normal-order evaluation:  
1. Avoid duplicate application of the same procedure  
2. Relatively simple, even with the cases that the substitution model cannot handle.  

- The concepts above are familiar. Call-by-value, eager evaluation - these are applicative-order evaluations. Call-by-name, lazy evaluation - these are normal-order evaluations!  

###### Summary
* The main topics of this chapter are **substitution model**, and **evaluation strategy**.  
* I know what substitution model is, and the existence of other models.  
* I know two different evaluation strategies, and the concept of legitimate values.  

<br>

#### Chapter 1.1.6 Conditional Expressions and Predicates

> The expressive power of the class of procedures that we can define at this point is very limited, because we have **no way to make tests** and to **perform different operations depending on the result of a test**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is **case analysis** and **conditional expression**?  

Case analysis is a **construct** that perform different operations, depending on the conditions. Conditional expression is a **special form**, and it is used to notate case analysis.  

General form of a conditional expression:  
```scheme
(cond (<p_1> <e_1>)
      (<p_2> <e_2>)
      ...
      (<p_n> <e_n>)
```

* `cond` - A special form that represents the case analysis.  
* `(<p> <e>)` - A **clause** that is a **pair of expressions**, followed by `cond` symbol in the conditional expression.  
* `<p>` - A **predicate** that is an **expression** whose value is interpreted as either true or false. Predicate also means a **procedure** that evaluate to true or false.  

> Conditional expressions are evaluated as follows. The predicate ⟨p1⟩ is evaluated first. If its value is false, then ⟨p2⟩ is evaluated. If ⟨p2⟩’s value is also false, then ⟨p3⟩ is evaluated. This process continues until a predicate is found whose value is true, in which case the interpreter returns the value of the corresponding consequent expression ⟨e⟩ of the clause as the value of the conditional expression. If none of the ⟨p⟩’s is found to be true, the value of the cond is undefined.  

Evaluation of conditional expression:  
1. Evaluate the predicate.  
2. If the result of the predicate is true, the value of the conditional expression is the expression in that clause, which is in pair with the predicate.  
3. If the result of the predicate is false, go to next clause and do (1)  
4. If there’s no predicate whose value is true, then the value of the conditional expression is undefined.  

`else` - A symbol that can be used as a predicate, in the final clause of the conditional expression. **It evaluates to true**.  

<br>

`if` is a special form, which is a restricted type of conditional that can be used when there are **exactly two cases** in the case analysis.  

General form of an if expression:  
`(if <predicate> <consequent> <alternative>)`  

Evaluation of if expression:  
1. Evaluate the <predicate>.  
2. If the value of the predicate is true, the value of the if expression is <consequent>.  
3. If the value of the predicate is false, the value of the if expression is <alternative>  

<br>

> The absolute- value procedure abs makes use of the **primitive predicates** >, <, and =.18 These take two numbers as arguments and test whether the first number is, respectively, greater than, less than, or equal to the second number, returning true or false accordingly.  
> In addition to primitive predicates such as <, =, and >, there are **logical composition operations**, which enable us to construct **compound predicates**.  

Logical composition operations:  
* `(and <p_1> ... <p_n>)` - If all predicates evaluate to true, then it’s true. Otherwise, it’s false.  
* `(or <p_1> ... <p_n>)` - If any of predicates evaluates to true, then it’s true. Otherwise, it’s false.  
* `(not <p>)` - If the predicate evaluates to true, then it’s false. Otherwise, it’s true.  

> Notice that and and or are special forms, not procedures, because the subexpressions are not necessarily all evaluated. not is an ordinary procedure.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why `and` and `or` are special forms, not ordinary procedures?  

- This is because they don’t follow the general evaluation rule. For instance, `and` does not evaluate other expressions, if any of preceding expression evaluates to false, because there’s no need to evaluate other expressions.  

###### Summary
* I know a construct called case analysis, and the representation of it - a conditional expression.  
* I know what conditional expression, and if expression is, and how to evaluate them.  
* I know what logical composition operations are, and why `and` and `or` are special forms.  
* There are not so much things to discuss in this chapter.  

<br>

#### Chapter 1.1.7

> *Procedures must be effective* … The contrast between function and procedure is a reflection of the general distinction between describing **properties of things** and describing **how to do things** - or, as it is sometimes referred to, the distinction between **declarative knowledge** and **imperative knowledge**.  

- In mathematics we are concerned with declarative descriptions, while in computer science we are usually concerned with imperative descriptions.  

Recall the preface:  
> we want to establish the idea that a computer language is not just a way of getting a computer to perform operations but rather that it is **a novel formal medium for expressing ideas about methodology**. programs must be written for people to read, and **only incidentally for machines to execute**.  

- It’s interesting that the author says “Programs only incidentally for machines to execute”. Usually we think the program is for machines, not for humans, but the author say the order is inverse.  
- So it’s an irony that the name is “Computer” science, while the main concern is human thoughts, not a computer.  

> Declarative and imperative descriptions are intimately related, as indeed are mathematics and computer science … one actually programs in terms of declarative statements. The idea is to make interpreters sophisticated enough so that, given “what is” knowledge specified by the programmer, they can generate “how to” knowledge automatically.  

- So here’s a definition of **declarative programming** - The interpreter generate imperative knowledge from the declarative knowledge, so that the programmer can only concern about what to do.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why would I wants to program in terms of declarative statements? What can I benefit from it?  

- If you can program in declarative way, you don’t have to think about the details. You can focus on the logic of the program.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Is declarative programming style related to abstraction?  

- It is not clear what is an abstraction. But in declarative programming, you don’t need to know about how they actually works. It hides the implementation details, and emphasize on what to do. This is also an abstraction.  

<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why `if` needs to be provided as a special form? Why `if` is not an ordinary procedure?  

- Recall that the interpreter uses applicative-order evaluation. If you define `new-if` like this:  
```scheme
(define (new-if p c a)
  (cond (p c) (else a)))
```
- When you want to apply `new-if`, because the interpreter evaluate each expression first and then apply the procedure, you have to evaluate `c` and also `a`, even when p evaluates to true.  
- As a consequence, 1) You have to evaluate unnecessary expressions. 2) If some of the expressions involve recursion, it may fall into infinite loop.  
- Observe that this behavior is similar to and/or logical composition operations.  

- Interesting thing to note here is that, all the special forms above - cold, if, and, or - they involve some sort of “laziness”. They’re special forms in order to support this lazy evaluation.  
- In fact, **branching** - determine running path depending on the result of the test - should be lazy.  

###### Summary
* Computer science is all about **methodology**. We describe **how** to do things, not what they are. It’s not about computers. It’s about our thoughts.  
* I’ve discussed about declarative/imperative descriptions.  
* I know why conditional constructs are special forms.  

<br>

#### Chapter 1.1.8 Procedures as Black-Box Abstractions

> Observe that the problem of computing square roots breaks up naturally into a number of subproblems … The importance of this decomposition strategy is not simply that one is dividing the program into parts. … it is crucial that each procedure accomplishes **an identifiable task** that can be **used as a module in defining other procedures**.  

Just breaking up a procedure into small procedures is not enough - you have to let those procedures do their own task.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why it is important to let each procedure accomplishes an identifiable task?  

- By doing like this, we can use those procedures as a black-box. If you know what the procedure does, you don’t have to know about how the procedure do the task.  

> We are not at that moment concerned with how the procedure computes its result, only with the fact that it computes the square.  
> The details of how the square is computed can be suppressed, to be considered at a later time. Indeed, as far as the `good-enough?` procedure is concerned, `square` is not quite a procedure but rather an abstraction of a procedure, a so-called **procedural abstraction**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is **procedural abstraction**? What is different from procedure?  

- Procedural abstraction is not a procedure. In involves relations of procedures.  
- Consider the following procedure:  
```
(define (pythagoras a b c) (sqrt (+ (square a) (square b))))
```
- Here, `sqrt` and `square` is **a name in the environment** where the programs runs. As far as a procedure that `sqrt` is pointing to gives the square root of the given value, you can use it regardless of how it computes the value. You can see the following procedures do exactly the same task:  
```
(define (square x) (** x x))
(define (square x) (exp (double (log x))))
```
- Note that even if these procedures do the same task, the performances of them may be different. But which procedure is a more efficient implementation - is not clear, because it is heavily dependent on the hardware available.  

> At this *level of abstraction*, any procedure that computes the square is equally good.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. The author uses the term: **level of abstraction**. Does the abstraction have some levels?  

- The two procedures above are **not the same**, but they can be **considered to be the same**, as far as they are used as building blocks of another procedures.  
- So the **level** is a hypothetical concept that is emerged as a result of an abstraction, and you can change the level of abstraction by adding more details(lower the level), or removing more details(higher the level).  
- It reminds me an isomorphism.  

> So a procedure definition should be able to suppress detail. The users of the procedure may not have written the procedure themselves, but may have obtained it from another programmer as a black box. **A user should not need to know how the procedure is implemented in order to use it.**  

- This is what the authors wants to say: you should carefully design and build a procedure to do an identifiable task so that the user of the procedure can use it without worrying about the implementation details.  

<br>

> … the meaning of a procedure should be independent of the parameter names used by its author … the parameter names of a procedure **must be local to the body** of the procedure.  

- the name of the formal parameter doesn’t affect the procedure’s implementation. The following square procedures are not the same, but they’re indistinguishable.  
```scheme
(define (square x) (** x x))
(define (square y) (** y y))
```

Consider the following procedures:  
```scheme
(define (square x) (** x x))
(define (f x) (** (square x) x))
```
- When you evaluate the procedure `f`, then running the procedure `square` should not affect the value of `x` in `f`.  
- So `x` in `square` and `x` in the `f` are different, and they are **local** to their procedures.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why the parameters should be local to the bodies?  

- If the parameters were not local to the bodies of their procedures, then the behavior of a procedure depends on the implementation details of the procedures that it uses.  
- This breaks the black-box abstraction - A user should need to know how the procedure is implemented, just in order to use it.  

> A formal parameter of a procedure has a very special role in the procedure definition, in that it doesn’t matter what name the formal parameter has. Such a name is called a **bound variable**, and we say that **the procedure definition binds its formal parameters**. If a variable is not bound, we say that it is **free**. The set of expressions for which a binding defines a name is called the **scope** of that name.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is a variable?  

- A **name** that can be **changed** and **associated with an object** in the environment.  
- A variable cannot exist without an environment.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. “The meaning of a procedure definition is unchanged if a bound variable is consistently renamed throughout the definition“ - what does it mean?  

- “rename” - It means change the name without changing the associated object.  
- “throughout the definition” - it means the variable should be renamed **within the scope** of it - the body of the procedure definition, in this case.  
- “meaning of a procedure definition” - Procedure definition is essentially giving a name to a compound operation. So I guess the meaning of a procedure definition may be a compound operation that is associated with the name.  
- We can rewrite the words like this: “The compound operation that the procedure definition is associated with, is unchanged if the name of a bound variable is consistently changed within the body of the procedure definition, without changing the associated object”  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is a bound variable, and what is a free variable?  

- If a variable is bound, then the object associated with the variable remains unchanged, regardless of the name it has.  
- If a variable is free, then changing the name of it affects the meaning of the variable - the object that the variable is associated with.  

- Note that bound variable and free variable is not directly translated to local variable and global variable, respectively. They’re more than that. When you say “free variable”, that is indeed a **name**, and primitive operations also have their own names.  
**-> Forget about what you’ve learned. You don’t know a local variable, a function, or a class, etc. You only know a process, a procedure, and an object - data. Based on these ideas, we’re building the fundamental concepts of computer science.**  
- So when you want to know a name is a bound variable or a free variable, see if the name satisfies the above definitions of bound and free variables.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is a scope of the name?  

- A scope is **a set of expressions** where the variables are bound to. In procedure definition, the body is a scope for the formal parameters.  
- A scope is closely related to an environment!  

<br>

> We have one kind of **name isolation** available to us so far: The formal parameters of a procedure are local to the body of the procedure. … The problem with this program is that **the only procedure that is important to users of sqrt is sqrt** . The other procedures only clutter up their minds. … We would like to **localize the sub-procedures**, hiding them inside sqrt so that sqrt could coexist with other successive approximations, each having its own private good-enough? procedure.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Isolation of a procedure - why?  

- It’s all about the abstraction. From the perspective of a user of `sqrt`, they’re not interested in the other auxiliary procedures - good-enough?, improve, etc. They don’t need them, in order to use `sqrt`.  
- Similar to the black-box abstraction of a procedure definition, here we need another, program-level of abstraction (What should I name it? Program? Package?) that suppress the internal procedures and focus on a public procedure that accomplishes the main task.  
- And now, I have an idea about what is the **level** of an abstraction. Think of a huge program written in Kotlin, that consists of several grade modules that has their own purpose. Inside each module, it has classes, and public functions, internal and private functions and variables, and so on. (I just noticed that the modifiers - public, internal, private - are also a mean of abstraction.)  
- These several **units** which can be combined to more complex structure, define the levels. Class-level, package-level, … (Recall the definition of abstraction that we’ve learned before: “After building the complex element, we can now treat it as an unit of another thoughts or combinations.”)  

```scheme
(define (sqrt x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  ...
```
- This nesting of definitions is called **block structure**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What are the advantages when I use block structure?  

- At the very first, I can accomplish the program-level abstraction. Now the user of `sqrt` cannot see `good-enough?` procedure.  
- Each procedure definition has its own scope as its body. And you can see a procedure definition of `good-enough?` is inside the body of a procedure definition `sqrt`! What it means is that the internal procedures are in the scope of `x`. So I can share this `x` in internal procedures, by omitting `x` from the internal definitions. What I’m doing is to make a bound variable **x** free in the internal definitions. This discipline is called **lexical scoping**.  
```scheme
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  ...
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is lexical scoping? Clarify the meaning of it.  

- Lexical scoping (static scoping) dictates a variable should only be referenced from within the block of code, where it is defined. In the above code snippet, the scope of `x` is the body of the procedure `sqrt`, so the body of `good-enough?` can access to `x` but it cannot be referenced outside of the definition of `sqrt`. Similarly, the scope of `guess` is the body of the procedure `good-enough?`, so the variable `guess` cannot be referenced from the body of `sqrt` that is not the body of `good-enough?`.  
- This applies to not only variables, but also procedure definitions as well. There are some common grounds here. Both are **names** in the environment. Isn’t that interesting? The author says will be covered in chapter 3! I can’t wait to learn them..  
- Another interesting thing is, we have introduced **nested scope** and **nested environment** by nesting the definition. The body of inner definition should be able to access a variable bound to that inner definition, as well a variable bound to the outer definition. So.. the data structure of environment should be a stack or something like that.  
- Block structure - It seems to be strongly related to structured programming.  

<br>

###### Summary
* Procedural abstraction: “A user should not need to know how the procedure is implemented in order to use it.”  
* A bound variable and a free variable.  
* A scope.  
* Block structure and the advantages of it.  
* Lexical scoping.  

#SICP  