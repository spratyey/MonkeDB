# DnA Project Phase 4
## MonkeDB, CLI Phase

## Development
- Frontend in Python
- Backend in MySQL

## Team WeDontKnown:
- Gaurav Singh, 2020111014
- Pratyay Suvarnapathaki, 2020111016 
- Yash Mehan, 2020111020


## Miniworld
The miniworld is a **national park.**
A national park is an area set aside by a national government for the preservation of the natural environment, and for purposes of public recreation and enjoyment or because of its historical or scientific interest. Most of the landscapes and accompanying plants and animals in a national park are kept in their natural state.
Currently, India has 104 total national parks.
This database deals with one such typical park: its major interacting components and administrative tasks have been represented systematically. Naturally, due to the scope of operations of a real national park being very expansive, it is not possible to fit every little operational nuance in this database.
The purpose of the database is to organize and store the information of the various flora and fauna present in the park, staff (rangers, security personnel, vets), their personal information, visitor data, information about their tours within the park and vehicles owned by the park, with the ability to update and retrieve data in an efficient and convenient way.


## Libraries used
- `pymysql`
- `tabulate`

## List of Commands
### Commands which modify
0. `Insert` a new visitor.
    - inserting a new visitor, entering a UID, Name, and phone number
1. `Delete` a visitor entry.
    - Deleting all information about a visitor from all relevant tables.
2. `Update` zone description.
    - description is a 1000 character long string. Can be used to hold any data/comments/remarks about the zone.
3. `Modify` a doctor's ability to treat animals.
    - A doctor (or a vet to be specific) can gain experience to treat more animals or may lose credentials/certifications from treating certain animals.
4. `Update` employee's record to give an increment.
    - gives an employee an absolute increment in their salary.
5. `Update` a particular animal's population record for a particular year.

### Commands which retrieve
6. `List` details of all organisms that inhabit a particular zone.
7. `List` all visitors who went on a tour more than a given number of hours long.
8. `Retrieve` the average population of an organism across all years.
9. `Retrieve` the names of all employees whose address contains the given substring.


## Changes from Phase 3
- The datatype `smallmoney` has been replace with `int` as the former does not exist in MySQL.
- The datatype `smalldatetime` has been replaced with UNIX timestamps, implemented as `int(11)`.
- The Genera and Species attributes have been merged into one single attribute `SciName`.

## Link to the video
<u>https://iiitaphyd-my.sharepoint.com/:v:/g/personal/pratyay_s_research_iiit_ac_in/EUq2r2d4qoZLjBLYX4Dh8HYBrwFyBRs-qAijFPvL9RQYyA?e=fpLfVG</u>
