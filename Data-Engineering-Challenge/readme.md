# Data Engineering Challange

This folder contains 3 files:

- **DDLs.sql**: contains all the DDLs needed to build the schema. The statements had been modified in order to be able to be ran.

- **Five_more_used**: this sql code answers the first requested question: 
    ```
        Given the table schemas below, write a query to print a new pizza recipe that includes
        the most used 5 ingredients in all the ordered pizzas in the past 6 months.
    ```
    I replaced the requested 6 months by 16 months in order to actually display some data as every order if from 2021

 

- **recipe_list.sql**: this sql code answers the second requested question: 
    ```
        Help the cook by generating an alphabetically ordered comma separated ingredient list
        for each ordered pizza and add a 2x in front of any ingredient that is requested as extra
        and is present in the standard recipe too. 
    ```