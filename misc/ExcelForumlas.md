# Excel Formulas
A collection of usefull excel forumlas

## Adjust Date
Convert world date to US date
```
=DATE(VALUE(RIGHT(A1,4)), VALUE(MID(A1,4,2)), VALUE(LEFT(A1,2)))
```