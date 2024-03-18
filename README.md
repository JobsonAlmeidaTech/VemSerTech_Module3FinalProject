# <p align="center"> Vem Ser Tech Course - Module 3 Final Project - Modeling a Database </p>

<p align="center">
<img src="images/VemSerTech.jpg"  alt="VemSerTech" height="200px align="left" />
<img src="images/database.png"  alt="database" height="200px align="right"/>
</p>

## Vem Ser Tech

Vem Ser Tech was a course offered by a partnership between the companies Ada Tech and iFood. Each student was offered one subject among 4 possibilities: Front-End, Back-End, DevOps and Data. I chose the Back-End technology track, which aimed to study the JavaScript language divided into 6 modules:

Module 1: Programming Language

Module 2: Object Oriented Programming

Module 3: Database

Module 4: Node.js with Express (intermediate level)

Module 5: Node.js with Express (advanced level)

Module 6: Automated Testing

The course lasted 324 hours with synchronous classes every Monday, Wednesday and Friday, from 7pm to 10pm, between October 6, 2023 and March 15, 2024. You can find more information about this course here: <a href="https://ada.tech/sou-aluno/programas/ifood-vem-ser-tech">Vem Ser Tech</a>

## Purpose 

At the end of the third module, students were invited to carry out a group project. The objective of this project was to model a database for a car rental company. In the Requirements section you can read all the project requirements that were written by the module teacher.

The model was requested to be built using MySQL and Unified Modeling Language (UML). This has been done and the final MySQL script can be seen in the file called Script_Projeto_Final_Modulo3.sql and the final report written in Brazilian Portuguese can be seen in the file called Projeto_Módulo3_Relatorio.pdf.

## Requirements

The final project of the MYSQL Database module proposes to continue the car rental company project from the previous module, follow the instructions below to develop the project.
Imagine that you are in front of the client in a meeting to discuss a database project to serve a Car Rental Company. At this meeting you had the opportunity to explore and learn about the specifications necessary to start modeling a database.
Since you now have all the necessary information, write a text that describes the rental company's case, that is, tell the story of what the case is about and the rules involved. Seek to address terms that clarify which business rules must be met, which entities are involved, how they relate, their cardinalities, restrictions, etc. Feel free to bring all the details you deem necessary, the evaluation will be based on the depth defined in the case.
The case must be presented covering the following sections:

#### 1. Context
Describe the entire business context that data modeling must respect. In the text, try to make the entities clear, how they relate to each other, the references of integrity, cardinality. At this point, let it be textual, imagine that this specification will be delivered to the database developer. Highlight the database assumptions, for example, "a car cannot be reserved by more than one person on the same day".

#### 2. Objectives
Describe the goals for the database
Example:
. User registration - will allow you to CRUD users
. Course - will allow you to CRUD courses, as well as activate or deactivate a course
. Enrollment - allows you to enroll or cancel enrollment for a specific student

#### 3. DER - Entity and relationship diagram
When modeling your base remember all the details. Below are some of the most important ones, but feel free to add other properties seen during the module.
Entities, Relationship, Attributes
Remember to point out the correct types if it makes sense (strong entity, weak entity, key attribute, derived, multivalued, cardinality, etc.)

#### 4. MER - Entity and Relationship Model
Now convert from DER to MER, consider all the properties seen in this module, such as Attributes with their types and sizes, Cardinality, PK/FK, etc.

#### 5. Database creation DDL script
Create the database creation script, in this script it is essential that comments are placed for each DDL block. Ensure that the script runs without any errors.
The script must be delivered in a .sql file.

PS.: Validate at the end whether the objectives match the context and MAINLY the modeling delivered.
Files must be delivered within the LMS ADA portal
The groups must present their work on December 13, 2024 and each group will have 30 minutes to present