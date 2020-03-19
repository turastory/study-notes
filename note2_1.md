# SICP Note 2.1
## 2 - Building Abstractions with Data
- The title of the first chapter was “Building abstractions with procedures”.  
- So the main topic changed from procedure to data.  

> In this chapter we are going to look at more complex data … we turn in this chapter to another key aspect of any programming language: the **means it provides for building abstractions by combining data objects to form compound data**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why do we need to form compound data?  

> For the same reasons that we want compound procedures: to elevate the conceptual level at which we can design our programs, to increase the modularity of our designs, and to enhance the expressive power of our language.  

By using compound data, we can:  
1. Elevate the level of abstractions while designing the program.  
2. Increase modularity of program designs.  
3. Enhance expressive power of the language.  

- So basically what we can achieve are same as compound procedures.  

> The general technique of isolating the parts of a program that deal with how data objects are represented from the parts of a program that deal with how data objects are used is a powerful design methodology called **data abstraction.**  

- **Data abstraction: Separating data representation and data usage**  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is “expressive power” of the language?  

> … This same example shows why it is important that our programming language provide the **ability to manipulate compound objects directly**: Without this, there is no way for a procedure such as linear-combination to pass its arguments along to add and mul **without having to know their detailed structure.**  

- I think it means we only concern about the expression of the logic, and give much less attention to how the logic actually works.  
- In short, “expressive power” of the language is what the language provides as means of abstraction.  

> We will see that the key to forming compound data is that a programming language should provide some kind of **glue** so that data objects can be combined to form more complex data objects.  

Introduction to data abstraction and abstraction barriers -> Different ways to form compound data -> key ideas (closure, conventional interfaces) -> symbolic expressions -> generic operations -> data-directed programming  

