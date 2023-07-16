# IS456_PE05

## SQLite-Use the Chinook Database

![Command Line Interface](./IMG/CLI.png)

### Task 1

-- Pattern Matching
-- Write a Select statement using Like Operator to search the words which start with "Wild" from the tracks table.

```sql
SELECT *
FROM tracks
WHERE name LIKE 'Wild%';
```

-- Write a Select statement using Glob Operator to search the words which end with "Man" from the tracks table.

```sql
SELECT *
FROM tracks
WHERE name GLOB '*Man';
```

[task 1 output](./task1.txt)

<details>
    <summary>task 1 tables</summary>

| TrackId | Name             | AlbumId | MediaTypeId | GenreId | Composer                                   | Milliseconds | Bytes   | UnitPrice |
| ------- | ---------------- | ------- | ----------- | ------- | ------------------------------------------ | ------------ | ------- | --------- |
| ------- | ---------------- | ------- | ----------- | ------- | ------------------------------------------ | ------------ | ------- | --------- |
| 1245    | Wildest Dreams   | 98      | 1           | 13      | Adrian Smith/Steve Harris                  | 232777       | 9312384 | 0.99      |
| 1973    | Wild Side        | 162     | 1           | 3       | Nikki Sixx/Tommy Lee/Vince Neil            | 276767       | 9116997 | 0.99      |
| 2627    | Wild Hearted Son | 213     | 1           | 1       | 266893                                     | 8670550      | 0.99    |
| 2633    | Wild Flower      | 213     | 1           | 1       | 215536                                     | 7084321      | 0.99    |
| 2944    | Wild Honey       | 233     | 1           | 1       | Adam Clayton, Bono, Larry Mullen, The Edge | 226768       | 7466069 | 0.99      |

| TrackId | Name                         | AlbumId | MediaTypeId | GenreId | Composer                                           | Milliseconds | Bytes     | UnitPrice |
| ------- | ---------------------------- | ------- | ----------- | ------- | -------------------------------------------------- | ------------ | --------- | --------- |
| ------- | ---------------------------- | ------- | ----------- | ------- | -------------------------------------------------- | ------------ | --------- | --------- |
| 31      | Blind Man                    | 5       | 1           | 1       | Steven Tyler, Joe Perry, Taylor Rhodes             | 240718       | 7877453   | 0.99      |
| 359     | Muffin Man                   | 31      | 1           | 1       | Frank Zappa                                        | 332878       | 10891682  | 0.99      |
| 431     | The Invisible Man            | 36      | 1           | 1       | Queen                                              | 238994       | 7920353   | 0.99      |
| 760     | Hard Lovin' Man              | 59      | 1           | 1       | Blackmore, Gillan, Glover, Lord, Paice             | 431203       | 13931179  | 0.99      |
| 809     | Holy Man                     | 65      | 1           | 1       | D.Coverdale/G.Hughes/Glenn Hughes/J.Lord/John Lord | 270236       | 8818093   | 0.99      |
| 821     | Ramshackle Man               | 66      | 1           | 1       | roger glover                                       | 334445       | 10874679  | 0.99      |
| 836     | Make Love Like A Man         | 67      | 1           | 1       | 255660                                             | 8309725      | 0.99      |
| 962     | Just A Man                   | 76      | 1           | 1       | Mike Bordin, Billy Gould, Mike Patton              | 336666       | 11031254  | 0.99      |
| 1235    | The Wicker Man               | 97      | 1           | 1       | Adrian Smith/Bruce Dickinson/Steve Harris          | 275539       | 11022464  | 0.99      |
| 1353    | The Wicker Man               | 108     | 1           | 3       | Adrian Smith/Bruce Dickinson/Steve Harris          | 281782       | 11272320  | 0.99      |
| 1457    | Half The Man                 | 118     | 1           | 15      | Toby Smith                                         | 289854       | 9577679   | 0.99      |
| 1573    | 2,000 Man                    | 126     | 1           | 1       | Mick Jagger, Keith Richard                         | 312450       | 10292829  | 0.99      |
| 1809    | Of Wolf And Man              | 148     | 1           | 3       | James Hetfield, Lars Ulrich and Kirk Hammett       | 256835       | 8339785   | 0.99      |
| 2107    | Iron Man                     | 174     | 1           | 3       | A. F. Iommi, W. Ward, T. Butler, J. Osbourne       | 172120       | 5609799   | 0.99      |
| 2162    | Better Man                   | 178     | 1           | 1       | Eddie Vedder                                       | 246204       | 8019563   | 0.99      |
| 2224    | Mystic Man                   | 141     | 1           | 8       | 353671                                             | 11812170     | 0.99      |
| 2228    | Equal Rights Downpresser Man | 141     | 1           | 8       | 366733                                             | 12086524     | 0.99      |
| 2372    | My Lovely Man                | 193     | 1           | 4       | Anthony Kiedis/Chad Smith/Flea/John Frusciante     | 279118       | 9220114   | 0.99      |
| 2645    | Back Door Man                | 214     | 1           | 1       | Willie Dixon, C. Burnett                           | 214360       | 7035636   | 0.99      |
| 2854    | Company Man                  | 228     | 3           | 21      | 2601226                                            | 493168135    | 1.99      |
| 2855    | Company Man                  | 228     | 3           | 21      | 2601101                                            | 503786316    | 1.99      |
| 2880    | Confidence Man               | 230     | 3           | 19      | 2615244                                            | 223756475    | 1.99      |
| 2986    | Wake Up Dead Man             | 236     | 1           | 1       | Bono, The Edge, Adam Clayton, and Larry Mullen     | 292832       | 9515903   | 0.99      |
| 3022    | Drowning Man                 | 239     | 1           | 1       | U2                                                 | 254458       | 8457066   | 0.99      |
| 3090    | Ice Cream Man                | 244     | 1           | 1       | John Brim                                          | 200306       | 6573145   | 0.99      |
| 3223    | How to Stop an Exploding Man | 228     | 3           | 21      | 2687103                                            | 487881159    | 1.99      |
| 3379    | She'll Never Be Your Man     | 270     | 2           | 23      | Chris Cornell                                      | 204078       | 3355715   | 0.99      |
| 3427    | Fanfare for the Common Man   | 296     | 2           | 24      | Aaron Copland                                      | 198064       | 3211245   | 0.99      |

</details>

### Task 2

-- Use the albums and tracks table:

-- Write a query and a subquery to return all the tracks in the album that have the title `'Let There Be Rock'`.
-- Make sure your result should have three columns of `'trackid'`, `'album id'` and `'name'`.

```sql
SELECT trackid,
       albumid,
       name
FROM tracks
WHERE albumid = (
        SELECT albumid
        FROM albums
        WHERE title = 'Let There Be Rock'
);
```

<details>
    <summary>task 2 table</summary>

| TrackId | AlbumId | Name                         |
| ------- | ------- | ---------------------------- |
| ------- | ------- | ---------------------------- |
| 15      | 4       | Go Down                      |
| 16      | 4       | Dog Eat Dog                  |
| 17      | 4       | Let There Be Rock            |
| 18      | 4       | Bad Boy Boogie               |
| 19      | 4       | Problem Child                |
| 20      | 4       | Overdose                     |
| 21      | 4       | Hell Ain't A Bad Place To Be |
| 22      | 4       | Whole Lotta Rosie            |

</details>

[task 2 output](./task2.txt)

### Task 3

-- Write a query to return all customers who sales representative is located in Canada.
-- Make sure use the IN operator
-- Use employees and customers tables

```SQL
SELECT
    customerid,
    firstname,
    lastname
FROM customers
WHERE supportrepid IN (
           SELECT employeeid AS 'empId'
             FROM employees
            WHERE country = 'Canada'
       );
```

<details>
    <summary>task 3 table</summary>

CustomerId FirstName LastName

---

1 Luís Gonçalves  
2 Leonie Köhler  
3 François Tremblay  
4 Bjørn Hansen  
5 František Wichterlová
6 Helena Holý  
7 Astrid Gruber  
8 Daan Peeters  
9 Kara Nielsen  
10 Eduardo Martins  
11 Alexandre Rocha  
12 Roberto Almeida  
13 Fernanda Ramos  
14 Mark Philips  
15 Jennifer Peterson  
16 Frank Harris  
17 Jack Smith  
18 Michelle Brooks  
19 Tim Goyer  
20 Dan Miller  
21 Kathy Chase  
22 Heather Leacock  
23 John Gordon  
24 Frank Ralston  
25 Victor Stevens  
26 Richard Cunningham  
27 Patrick Gray  
28 Julia Barnett  
29 Robert Brown  
30 Edward Francis  
31 Martha Silk  
32 Aaron Mitchell  
33 Ellie Sullivan  
34 João Fernandes  
35 Madalena Sampaio  
36 Hannah Schneider  
37 Fynn Zimmermann  
38 Niklas Schröder  
39 Camille Bernard  
40 Dominique Lefebvre  
41 Marc Dubois  
42 Wyatt Girard  
43 Isabelle Mercier  
44 Terhi Hämäläinen  
45 Ladislav Kovács  
46 Hugh O'Reilly  
47 Lucas Mancini  
48 Johannes Van der Berg
49 Stanisław Wójcik  
50 Enrique Muñoz  
51 Joakim Johansson  
52 Emma Jones  
53 Phil Hughes  
54 Steve Murray  
55 Mark Taylor  
56 Diego Gutiérrez  
57 Luis Rojas  
58 Manoj Pareek  
59 Puja Srivastava

</details>

[task 3 output](./task3.txt)
