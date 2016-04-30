# Excel Formulas
A collection of usefull excel forumlas

## Adjust Date
Convert world date to US date
```
=DATE(VALUE(RIGHT(A1,4)), VALUE(MID(A1,4,2)), VALUE(LEFT(A1,2)))
```

## Math Formulas
square root 3 over pi r squared
```
=sqrt(3)/(3.14)* [cell] ^2
=sqrt(3)/(3.14)* A1 ^2
```

## Concatinate Email
Join first and last names to create a email adress
```
=LEFT(B3,1) & C3 & "@email.com"
=LEFT([first cell],1) & [last cell] & [website cell]
```
