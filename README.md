# Hair Salon

## By
Kyle Langley

## Description
A mock user website that allows the user to:

1. View, add, update, and delete Stylists.
2. View, add, update, and delete Clients.
3. Add Clients to Stylists.

## Use

1. clone `https://github.com/Vawx/salon_db_test`
2. terminal `bundle install`
3. terminal `CREATE DATABASE salon;`
4. terminal `\c salon`
5. terminal `CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);`
6. terminal `CREATE TABLE stylists ( id serial PRIMARY KEY, name varchar);`
7. terminal  `CREATE DATABASE salon_test WITH TEMPLATE salon;`

## Test
Follow above then, terminal `rspec`

## License
The MIT License (MIT)
Copyright (c) <2016> <Kyle Langley / Epicodus>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
