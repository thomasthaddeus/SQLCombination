# Hands-On Practice

## 001 Aggregate Data

---

### World-1

```sql
-- 01 Aggregate Data
-- world.db
.output 'HOP05_World_1.txt'
.headers ON
SELECT COUNT(*) FROM Country
;
```

| COUNT(*) |
|----------|
| 239      |

### World-2

```sql
.output 'HOP05_World_2.txt'
.headers ON
SELECT Region, COUNT(*)
  FROM Country
  GROUP BY Region
;
```

| Region                    | COUNT(*) |
|---------------------------|----------|
| Antarctica                | 5        |
| Australia and New Zealand | 5        |
| Baltic Countries          | 3        |
| British Islands           | 2        |
| Caribbean                 | 24       |
| Central Africa            | 9        |
| Central America           | 8        |
| Eastern Africa            | 20       |
| Eastern Asia              | 8        |
| Eastern Europe            | 10       |
| Melanesia                 | 5        |
| Micronesia                | 7        |
| Micronesia/Caribbean      | 1        |
| Middle East               | 18       |
| Nordic Countries          | 7        |
| North America             | 5        |
| Northern Africa           | 7        |
| Polynesia                 | 10       |
| South America             | 14       |
| Southeast Asia            | 11       |
| Southern Africa           | 5        |
| Southern Europe           | 15       |
| Southern and Central Asia | 14       |
| Western Africa            | 17       |
| Western Europe            | 9        |

### World-3

```sql
.output 'HOP05_World_3.txt'
.headers ON
SELECT Region, COUNT(*) AS Count
  FROM Country
  GROUP BY Region
  ORDER BY Count DESC, Region
;
```

| Region                    | Count |
|---------------------------|-------|
| Caribbean                 | 24    |
| Eastern Africa            | 20    |
| Middle East               | 18    |
| Western Africa            | 17    |
| Southern Europe           | 15    |
| South America             | 14    |
| Southern and Central Asia | 14    |
| Southeast Asia            | 11    |
| Eastern Europe            | 10    |
| Polynesia                 | 10    |
| Central Africa            | 9     |
| Western Europe            | 9     |
| Central America           | 8     |
| Eastern Asia              | 8     |
| Micronesia                | 7     |
| Nordic Countries          | 7     |
| Northern Africa           | 7     |
| Antarctica                | 5     |
| Australia and New Zealand | 5     |
| Melanesia                 | 5     |
| North America             | 5     |
| Southern Africa           | 5     |
| Baltic Countries          | 3     |
| British Islands           | 2     |
| Micronesia/Caribbean      | 1     |

### Album-4

```sql
-- album.db
use album.db
.output 'HOP05_Album_4.txt'
.headers ON
SELECT a.title AS Album, COUNT(t.track_number) as Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  GROUP BY a.id
  ORDER BY Tracks DESC, Album
;
```

| Album                  | Tracks |
|------------------------|--------|
| Rubber Soul            | 14     |
| Birds of Fire          | 10     |
| Two Men with the Blues | 10     |
| Apostrophe             | 9      |
| Hendrix in the West    | 9      |
| Live And               | 6      |
| Kind of Blue           | 5      |

### Album-5

```sql
.output 'HOP05_Album_5.txt'
.headers ON
SELECT a.title AS Album, COUNT(t.track_number) as Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  GROUP BY a.id
  HAVING Tracks >= 10
  ORDER BY Tracks DESC, Album
;
```

| Album                  | Tracks |
|------------------------|--------|
| Rubber Soul            | 14     |
| Birds of Fire          | 10     |
| Two Men with the Blues | 10     |

### Album-6

```sql
.output 'HOP05_Album_6.txt'
.headers ON
SELECT a.title AS Album, COUNT(t.track_number) as Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  WHERE a.artist = 'The Beatles'
  GROUP BY a.id
  HAVING Tracks >= 10
  ORDER BY Tracks DESC, Album
;
```

| Album                  | Tracks |
|------------------------|--------|
| Rubber Soul            | 14     |
| Birds of Fire          | 10     |
| Two Men with the Blues | 10     |
| Apostrophe             | 9      |
| Hendrix in the West    | 9      |
| Live And               | 6      |
| Kind of Blue           | 5      |

---

## 002 Aggregate Functions

```sql
-- 02 Aggregate functions
-- world.db
use world.db
.output 'HOP05_World_2_1.txt'
.headers ON
SELECT COUNT(*) FROM Country;
```

### World 2-1

| COUNT(*) |
|----------|
| 239      |

### World 2-2

```sql
.output 'HOP05_World_2_2.txt'
.headers ON
SELECT COUNT(Population) FROM Country;
```

| COUNT(Population) |
|-------------------|
| 232               |

### World 2-3

```sql
.output 'HOP05_World_2_3.txt'
.headers ON
SELECT AVG(Population) FROM Country;
```

| AVG(Population) |
|-----------------|
| 26201506.25     |

### World 2-4

```sql
.output 'HOP05_World_2_4.txt'
.headers ON
SELECT Region, AVG(Population) FROM Country GROUP BY Region;
```

| Region                    | AVG(Population)  |
|---------------------------|------------------|
| Antarctica                |                  |
| Australia and New Zealand | 4550620.0        |
| Baltic Countries          | 2520633.33333333 |
| British Islands           | 31699250.0       |
| Caribbean                 | 1589166.66666667 |
| Central Africa            | 10628000.0       |
| Central America           | 16902625.0       |
| Eastern Africa            | 12999947.3684211 |
| Eastern Asia              | 188416000.0      |
| Eastern Europe            | 30702600.0       |
| Melanesia                 | 1294400.0        |
| Micronesia                | 77571.4285714286 |
| Micronesia/Caribbean      |                  |
| Middle East               | 10465594.4444444 |
| Nordic Countries          | 3452342.85714286 |
| North America             | 61926400.0       |
| Northern Africa           | 24752285.7142857 |
| Polynesia                 | 63305.0          |
| South America             | 24698571.4285714 |
| Southeast Asia            | 47140090.9090909 |
| Southern Africa           | 9377200.0        |
| Southern Europe           | 9644946.66666667 |
| Southern and Central Asia | 106484000.0      |
| Western Africa            | 13039529.4117647 |
| Western Europe            | 20360844.4444444 |

```sql
.output 'HOP05_World_2_5.txt'
.headers ON
SELECT Region, MIN(Population), MAX(Population) FROM Country GROUP BY Region;
```

### World 2-5

| Region                    | MIN(Population) | MAX(Population) |
|---------------------------|-----------------|-----------------|
| Antarctica                |                 |                 |
| Australia and New Zealand | 600             | 18886000        |
| Baltic Countries          | 1439200         | 3698500         |
| British Islands           | 3775100         | 59623400        |
| Caribbean                 | 8000            | 11201000        |
| Central Africa            | 147000          | 51654000        |
| Central America           | 241000          | 98881000        |
| Eastern Africa            | 77000           | 62565000        |
| Eastern Asia              | 473000          | 1277558000      |
| Eastern Europe            | 4380000         | 146934000       |
| Melanesia                 | 190000          | 4807000         |
| Micronesia                | 12000           | 168000          |
| Micronesia/Caribbean      |                 |                 |
| Middle East               | 599000          | 66591000        |
| Nordic Countries          | 3200            | 8861400         |
| North America             | 7000            | 278357000       |
| Northern Africa           | 293000          | 68470000        |
| Polynesia                 | 50              | 235000          |
| South America             | 2000            | 170115000       |
| Southeast Asia            | 328000          | 212107000       |
| Southern Africa           | 1008000         | 40377000        |
| Southern Europe           | 1000            | 57680000        |
| Southern and Central Asia | 286000          | 1013662000      |
| Western Africa            | 6000            | 111506000       |
| Western Europe            | 32300           | 82164700        |

### World 2-6

```sql
.output 'HOP05_World_2_6.txt'
.headers ON
SELECT Region, SUM(Population) FROM Country GROUP BY Region;
```

| Region                    | SUM(Population) |
|---------------------------|-----------------|
| Antarctica                |                 |
| Australia and New Zealand | 22753100        |
| Baltic Countries          | 7561900         |
| British Islands           | 63398500        |
| Caribbean                 | 38140000        |
| Central Africa            | 95652000        |
| Central America           | 135221000       |
| Eastern Africa            | 246999000       |
| Eastern Asia              | 1507328000      |
| Eastern Europe            | 307026000       |
| Melanesia                 | 6472000         |
| Micronesia                | 543000          |
| Micronesia/Caribbean      |                 |
| Middle East               | 188380700       |
| Nordic Countries          | 24166400        |
| North America             | 309632000       |
| Northern Africa           | 173266000       |
| Polynesia                 | 633050          |
| South America             | 345780000       |
| Southeast Asia            | 518541000       |
| Southern Africa           | 46886000        |
| Southern Europe           | 144674200       |
| Southern and Central Asia | 1490776000      |
| Western Africa            | 221672000       |
| Western Europe            | 183247600       |

---

## Distinct Aggregates

### World 3-1

```sql
-- 03 DISTINCT Aggregates
-- world.db
.output 'HOP05_World_3_1.txt'
.headers ON
SELECT COUNT(HeadOfState) FROM Country;
```

| COUNT(HeadOfState) |
|--------------------|
| 238                |

### World 3-2

```sql
.output 'HOP05_World_3_2.txt'
.headers ON
SELECT HeadOfState FROM Country ORDER BY HeadOfState;
```

| HeadOfState                       |
|-----------------------------------|
| Abdelaziz Bouteflika              |
| Abdiqassim Salad Hassan           |
| Abdoulaye Wade                    |
| Abdullah II                       |
| Abdurrahman Wahid                 |
| Adolf Ogi                         |
| Ahmed Tejan Kabbah                |
| Ahmet Necdet Sezer                |
| Akihito                           |
| Albert II                         |
| Aleksander Kwasniewski            |
| Alfonso Portillo Cabrera          |
| Ali Abdallah Salih                |
| Ali Mohammad Khatami-Ardakani     |
| Aljaksandr Lukaenka               |
| Alpha Oumar Konaré                |
| Andrés Pastrana Arango            |
| Ange-Félix Patassé                |
| Ante Jelavic                      |
| António Mascarenhas Monteiro      |
| Arnoldo Alemán Lacayo             |
| Arthur N. R. Robinson             |
| Askar Akajev                      |
| Azali Assoumani                   |
| Bakili Muluzi                     |
| Bashar al-Assad                   |
| Beatrix                           |
| Beatrix                           |
| Beatrix                           |
| Benjamin William Mkapa            |
| Bernard Dowiyogo                  |
| Bharrat Jagdeo                    |
| Bhumibol Adulyadej                |
| Blaise Compaoré                   |
| Boris Trajkovski                  |
| Carl XVI Gustaf                   |
| Carlo Azeglio Ciampi              |
| Carlos Roberto Flores Facussé     |
| Cassam Uteem                      |
| Chandrika Kumaratunga             |
| Charles Taylor                    |
| Chen Shui-bian                    |
| Daniel arap Moi                   |
| Denis Sassou-Nguesso              |
| Didier Ratsiraka                  |
| Eduard evardnadze                 |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Elisabeth II                      |
| Emomali Rahmonov                  |
| Fahd ibn Abdul-Aziz al-Sa´ud      |
| Ferenc Mádl                       |
| Fernando Henrique Cardoso         |
| Fernando de la Rúa                |
| Festus G. Mogae                   |
| Fidel Castro Ruz                  |
| France-Albert René                |
| Francisco Guillermo Flores Pérez  |
| Frederick Chiluba                 |
| George W. Bush                    |
| George W. Bush                    |
| George W. Bush                    |
| George W. Bush                    |
| George W. Bush                    |
| George W. Bush                    |
| George W. Bush                    |
| Glafkos Klerides                  |
| Gloria Macapagal-Arroyo           |
| Gnassingbé Eyadéma                |
| Guido de Marco                    |
| Gustavo Noboa Bejarano            |
| Gyanendra Bir Bikram              |
| Haji Hassan al-Bolkiah            |
| Hamad ibn Isa al-Khalifa          |
| Hamad ibn Khalifa al-Thani        |
| Hans-Adam II                      |
| Harald V                          |
| Harald V                          |
| Harald V                          |
| Henri                             |
| Heydär Äliyev                     |
| Hipólito Mejía Domínguez          |
| Hosni Mubarak                     |
| Hugo Bánzer Suárez                |
| Hugo Chávez Frías                 |
| Idriss Déby                       |
| Ion Iliescu                       |
| Isayas Afewerki [Isaias Afwerki]  |
| Islam Karimov                     |
| Ismail Omar Guelleh               |
| Jabir al-Ahmad al-Jabir al-Sabah  |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jacques Chirac                    |
| Jean-Bertrand Aristide            |
| Jiang Zemin                       |
| Jiang Zemin                       |
| Jiang Zemin                       |
| Jigme Singye Wangchuk             |
| Joaquím A. Chissano               |
| Johannes Paavali II               |
| Johannes Rau                      |
| John Bani                         |
| John Kufuor                       |
| Jorge Batlle Ibáñez               |
| Jorge Sampãio                     |
| Josefa Iloilo                     |
| Joseph Kabila                     |
| José Alexandre Gusmão             |
| José Eduardo dos Santos           |
| Juan Carlos I                     |
| Kessai Note                       |
| Khamtay Siphandone                |
| Kim Dae-jung                      |
| Kim Jong-il                       |
| Kocheril Raman Narayanan          |
| Kostis Stefanopoulos              |
| Kumba Ialá                        |
| Kuniwo Nakamura                   |
| Lansana Conté                     |
| Laurent Gbagbo                    |
| Lennart Meri                      |
| Leo A. Falcam                     |
| Leonid Kutma                      |
| Letsie III                        |
| Luis Ángel González Macchi        |
| Maaouiya Ould Sid´Ahmad Taya      |
| Malietoa Tanumafili II            |
| Mamadou Tandja                    |
| Margrethe II                      |
| Margrethe II                      |
| Margrethe II                      |
| Mary McAleese                     |
| Mathieu Kérékou                   |
| Maumoon Abdul Gayoom              |
| Miguel Trovoada                   |
| Miguel Ángel Rodríguez Echeverría |
| Milan Kucan                       |
| Mireya Elisa Moscoso Rodríguez    |
| Mohammad Omar                     |
| Mohammad Rafiq Tarar              |
| Mohammed Abdel Aziz               |
| Mohammed VI                       |
| Moshe Katzav                      |
| Mswati III                        |
| Muammar al-Qadhafi                |
| Natsagiin Bagabandi               |
| Negasso Gidada                    |
| Norodom Sihanouk                  |
| Nursultan Nazarbajev              |
| Olusegun Obasanjo                 |
| Omar Bongo                        |
| Omar Hassan Ahmad al-Bashir       |
| Paul Biya                         |
| Paul Kagame                       |
| Petar Stojanov                    |
| Pierre Buyoya                     |
| Qabus ibn Sa´id                   |
| Rainier III                       |
| Rexhep Mejdani                    |
| Ricardo Lagos Escobar             |
| Robert G. Mugabe                  |
| Robert Kotarjan                   |
| Ronald Venetiaan                  |
| Rudolf Schuster                   |
| Saddam Hussein al-Takriti         |
| Salahuddin Abdul Aziz Shah Alhaj  |
| Sam Nujoma                        |
| Saparmurad Nijazov                |
| Sellapan Rama Nathan              |
| Shahabuddin Ahmad                 |
| Tarja Halonen                     |
| Taufa´ahau Tupou IV               |
| Teburoro Tito                     |
| Teodoro Obiang Nguema Mbasogo     |
| Thabo Mbeki                       |
| Thomas Klestil                    |
| Trân Duc Luong                    |
| Vaira Vike-Freiberga              |
| Valdas Adamkus                    |
| Valentin Paniagua Corazao         |
| Vernon Shaw                       |
| Vicente Fox Quesada               |
| Vladimir Putin                    |
| Vladimir Voronin                  |
| Vojislav Kotunica                 |
| Václav Havel                      |
| Yahya Jammeh                      |
| Yasser (Yasir) Arafat             |
| Yoweri Museveni                   |
| Zayid bin Sultan al-Nahayan       |
| Zine al-Abidine Ben Ali           |
| kenraali Than Shwe                |
| tipe Mesic                        |
| Émile Lahoud                      |
| Ólafur Ragnar Grímsson            |

### World 3-3

```sql
.output 'HOP05_World_3_3.txt'
.headers ON
SELECT COUNT(DISTINCT HeadOfState) FROM Country;
```

| COUNT(DISTINCT HeadOfState) |
|-----------------------------|
| 179                         |

--Provide at least 3 screenshots as part of HOP submission.
![Section 2 & 3](./picture1.png)

--Write a 150-word summary to explain your understandings and findings from this lab assignment.
