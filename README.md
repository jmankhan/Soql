# Soql - Dynamic, Typed SOQL String Builder


## Description
Construct SOQL query strings in a typesafe manner with editor feedback and supported autosuggest functionality. This project aims to ease and speed development with a reliable, consistent, and easy to use API. It follows the StepBuilder pattern to provide a simple and straightforward path with easy to remember functions that model a normal SOQL query as closely as possible. Note that the actual SOQL keywords are reserved and thus cannot be used, so a naming scheme has been employed to provide the next best experience.

## Usage
#### Simple Example
```java
Soql q = new Soql.Builder()
.selectId()
.fromm('Account')
.build();

```
generates the query string
```
SELECT Id FROM Account
```

This may seem like a lot of overhead, but consider the following example:
#### Medium Example
```java
List<String> fields = new List<String>{'Id', 'Name', 'RecordTypeId'};
Soql q = new Soql.Builder()
    .selectFields(fields)
    .fromm('Account')
    .wheree(
        new SoqlCondition.Builder()
        .eq('Name', 'Thomas').orr()
        .eq('Name', 'Jefferson').orr()
        .lt('CreatedDate', Date.today())
        .build()
    ).limitBy(1)
    .build();
```
which generates
```
SELECT Id,Name,RecordTypeId FROM Account WHERE Name = 'Thomas' OR Name = 'Jefferson' OR CreatedDate < '2018-07-25' LIMIT 1
```

#### Advanced Example
```java
Account a = new Account(Name='Test', NumberOfEmployees=5);
Account b = new Account(Name='Test 2');

SoqlCondition condition = new SoqlCondition.Builder()
.neqNull('NumberOfEmployees').orr()
.paren(
    new SoqlCondition.Builder().eq('Name', a.Name).build()
).build();

Soql q = new Soql.Builder()
.selectField('Name')
.fromm('Account')
.wheree(condition)
.orderBy('Name', true)
.build().execute();
```
which generates
```
SELECT Name FROM Account WHERE NumberOfEmployees != NULL OR ( Name = 'Test'  ) ORDER BY Name ASC
```

## Feature Status
The API tries to maintain as close as possible to the Salesforce SOQL reference. There are still some methods being built, particularly subqueries, aggregate functions, and grouping. A full list of completed and planned features is listed below.

| Feature        | Status           | Comments  |
| -------------- |:----------------:| --------- |
| Core and common features | complete | Construct and execute common select queries |
| Helper select functions      | complete | selectId, selectField, selectFields |
| SoqlCondition class      | complete      | Follows same builder pattern as SOQL |
| Valid SoqlCondition methods | complete      | Limit methods to those that produce valid queries. E.g. Id > '...' is not a valid query. Blobs are also not supported by SOQL |
| Validate query | incomplete | Validate logic to ensure the query makes sense. Provide compile time feedback |
| Support more SOQL features | incomplete | Subqueries, Aggregate functions, Group By, With, Group By/Having, For |

## API Reference
#### Soql.cls
```
--- start: proceed to SELECT step
selectId()
selectField(String field)
selectFields(List<String> fields)

--- proceed to FROM step
fromm(String sObjectName)

--- proceed to WHERE, build step
wheree(SoqlCondition condition)

--- proceed to LIMIT, ORDER BY, build step
limitBy(Integer amount)
orderBy(String fieldName, Boolean ascending)

--- proceed to build
build()

--- available after build
execute()
getQueryLocator()
```

#### SoqlCondition.cls
```
--- start: proceed to CONDITION step. available for all primitive types
eq - equal to '='
neq - not equal to '!='
lt - less than '<'
le - less than or equal to '<='
gr - greater than '>'
ge - greater than or equal to '>='
inn - in 'IN'
ninn - not in 'NOT IN'
inc - includes 'INCLUDES'
exc - excludes 'EXCLUDES'
eqNull - equals null '= NULL'
neqNull - not equals null '!= NULL'
paren - surround contents with () '(...)'

--- proceed to OPERATOR, build step
andd() - and 'AND'  AS DDDDDDDX
orr() - or 'OR'
build()

```

## Contribute or Support
Feel free to open an issue, a pull request, or [email](mailto:jmankhan1@gmail.com) the author if you have ideas or questions! If you'd like to support the project, any and all donations are welcome
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](paypal.me/jmankhan)