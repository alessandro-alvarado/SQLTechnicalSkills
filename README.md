<h1>SQL Technical Skills</h1>

<h2>Introduction</h2>
I am an enthusiastic and detail-oriented programmer with a strong foundation in object-oriented
programming (OOP) and Java development. My academic and project work has enabled me to
build a robust skill set, particularly in designing and implementing efficient systems using
modern programming practices. I have a passion for solving problems and writing clean,
maintainable code. Below is an overview of the skills I have developed through various projects.
<br />

<h2>Core Skills</h2>

<b>1. Object-Oriented Programming (OOP)</b>
- <b>Inheritance:</b> I have a solid understanding of inheritance and have applied it in multiple
projects to create a hierarchy of classes. For example, in my Animal, Mammal,
Carnivore, Herbivore, and Bird classes, I used inheritance to share common
behavior while allowing specific attributes for each subclass.

- <b>Polymorphism:</b> I have experience with method overriding to provide subclass-specific
implementations of inherited methods. This is demonstrated in my projects with methods
like calcSize() and setSolitary() that behave differently based on the subclass.

- <b>Encapsulation:</b> I applied encapsulation principles by controlling access to class
attributes using access modifiers (private, protected) and providing appropriate
getters/setters.
<br />

<b>2. Interfaces</b>
- <b>Interface Design:</b> I implemented interfaces, such as the Habitat interface, to enforce
a contract for habitat size calculation and solitary status management across different
animal classes. This highlights my understanding of abstraction and modular design in
Java.
<br />

<b>3. Collections Framework</b>
- <b>ArrayLists:</b> I utilized the ArrayList class to manage dynamic collections of objects.
For example, in the AnimalInventory class, I stored various animal objects and
manipulated them effectively using methods like .add() and .get() to demonstrate
my understanding of collections.

- <b>Iteration:</b> I used loops to iterate through lists of objects, enabling efficient data
processing. For example, in my figureSizes() method, I iterated over a list of
animals and calculated their required habitat size.
<br />

<b>4. Method Overriding and Polymorphic Behavior</b>
- <b>Overriding Methods:</b> I have demonstrated proficiency in overriding methods such as
toString(), calcSize(), and setSolitary() to provide specialized functionality
in each subclass. This allows my code to be flexible and adaptable to different animal
types while adhering to a common interface.

- <b>Polymorphism in Action:</b> I showcased polymorphism in the MyZoo class by creating a
single method (figureSizes()) that handles different types of animals, each with its
own implementation of calcSize(), allowing the system to process diverse objects in a
uniform way.
<br />

<b>5. Class Design & Constructors</b>
- <b>Class Construction:</b> I have designed well-structured classes with constructors that
initialize objects with specific attributes, ensuring the correct setup for each animal
object. I also used constructor chaining (super()) to call parent class constructors for
shared attributes.

- <b>Data Handling:</b> My projects involve managing various attributes for each animal type,
such as species, size, and social behavior. This demonstrates my ability to organize data
within objects and provide meaningful interactions between them.
<br />

<b>6. Java Syntax & Conventions</b>
- <b>Code Organization:</b> I follow industry-standard Java conventions, such as appropriate
use of curly braces, indentation, and class/method naming. This makes my code easy to
read and maintain.

- <b>Comments & Documentation:</b> I ensure all key sections of my code are
well-commented, providing clear explanations for class designs, methods, and complex
logic. This enhances the maintainability of the code and ensures others can easily
understand and modify it if needed.
<br />

<h2>Order of Classes</h2>

- MyZoo
- Animal (implements Habitat)
- Mammal (extends Animal)
- Carnivore (extends Mammal)
- Herbivore (extends Mammal)
- Bird (extends Animal)
- Habitat
- AnimalInventory
- Results (Shows product of the project)

<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
