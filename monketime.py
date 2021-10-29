import pymysql
import pymysql.cursors
from tabulate import tabulate

# works
def option0():
    """
    Function to insert a new visitor
    """
    try:
        row = {}  # input dictionary
        phone_num = []  # stores all phone numbers of a given visitor
        print("Enter new visitor's details: ")
        row["name"] = input("Name: ")
        row["UID"] = input("Unique_ID: ")
        visitor_phone_num = int(input("Enter number of phone numbers: "))
        for i in range(visitor_phone_num):
            input_num = int(input(f"Enter phone number ({i+1}): "))
            phone_num.append([row["UID"], input_num])
        query = f'''INSERT INTO Visitor (UniqueID, Name) VALUES ("{row["UID"]}","{row["name"]}") ;'''
        #print(query)
        cur.execute(query)
        con.commit()
        query = f"INSERT INTO Visitor_PhNos (Visitor_UID, Phone_Num) VALUES "
        for i in phone_num:
            if i == phone_num[-1]:
                query+= f'''("{i[0]}",{i[1]});'''
            else:
                query+= f'''("{i[0]}",{i[1]}),''' 
        #print(query)
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)


# works
def option1():
    """
    Function to delete a visitor
    """
    # deleting from 3 tables
    # visitor id is varchar(100)
    visitor_id = input("Here we delete a visitor by ID. enter ID:")
    try:
        query = f"DELETE FROM Visitor_PhNos WHERE Visitor_UID = '{visitor_id}';"
        #print(query)
        cur.execute(query)
        con.commit()
        query = f"DELETE FROM Tour WHERE Visitor_UID = '{visitor_id}';"
        #print(query)
        cur.execute(query)
        con.commit()
        #query = f"DELETE FROM Visitor WHERE UniqueID = '{visitor_id}';"
        print(query)
        cur.execute(query)
        con.commit()    
        print(f"the record for visitor with id '{visitor_id}' should be completely gone now")
    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)


#works
def option2():
    """
    Function to implement modification of a description of a zone
    """
    zone_name = input("modifying description of a zone, on the basis of name. Enter name: ")
    new_zone_desc = input("new description that you want to set: ")
    try:
        query = f"UPDATE Zone SET Description = '{new_zone_desc}' WHERE ZoneName = '{zone_name}';"
        #print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)


#works
def option3():
    """
    Function to update a doctor's capability
    """
    empID = input("Enter employee ID: ")
    choice = input("Adding (a), or deleting (d) the ability to treat an animal? : ")
    animal = input("Scientific Name of that animal: ")
    if choice != 'a' and choice != 'd':
        print("invalid input")
        return
    try:
        if choice == 'a':
            query = f"INSERT INTO CAN_TREAT (Medic_ID, Org_SciName) VALUES ({empID}, '{animal}');"
            #print(query)
            cur.execute(query)
            con.commit()
        else:
            query = f"DELETE FROM CAN_TREAT WHERE Medic_ID = {empID} AND Org_SciName = '{animal}';"
            #print(query)
            cur.execute(query)
            con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)


#works
def option4():
    """
    Function to give a raise to an employee
    """
    empID = int(input("enter the employee ID you want to give a raise: "))
    incr=float(input("Enter increment amount: "))
    try:
        query = f"UPDATE Employee SET Salary=Salary+{incr} WHERE Employee_ID = {empID};"
        #print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)
            

#works
def option5():
    """
    Update a particular animal's population record for a particular year
    """
    sciname = input("enter the animal that you want to look for (the scientific name): ")
    year = int(input("which year's record to be updated?: "))
    newpop = int(input("enter new population: "))
    try:
        query = f"UPDATE Population SET Number = {newpop} WHERE Org_SciName = '{sciname}' AND Year = {year};"
        #print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)

# works
def option6():
    """
    6. List details of all organisms that inhabit a particular zone.
    """
    try:
        targetzone = input("Enter zone name to be searched: ")
        query = f"SELECT SciName, Class, Common_Name FROM Organism JOIN Org_CommonNames ON Organism.SciName=Org_CommonNames.Org_SciName where SciName IN (SELECT Org_SciName FROM PRESENT_IN where ZoneName='{targetzone}');"

        #print(query)
        cur.execute(query)
        data=cur.fetchall()
        print(tabulate(data, headers="keys", tablefmt='psql'))
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)

    return

#works
def option7():
    """
    List all visitors who went on a tour more than a given number of hours long.
    """

    hours=int(input("Enter the number of hours: "))
    try:
        print("Not implemented")
        query = f'''
        SELECT UniqueID,Name FROM Visitor WHERE UniqueID IN 
        (
            SELECT Visitor_UID FROM Tour WHERE (End_timestamp - Start_timestamp > {hours*3600})
        );
        '''
        #print(query)
        cur.execute(query)
        data=cur.fetchall()
        print(tabulate(data, headers="keys", tablefmt='psql'))
        con.commit()
        
    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)

# works
def option8():
    """
    Function to implement option 8
    """
    try:
        organism_name=input("Enter the scientific name of the organism: ")
        query=f'''
        SELECT AVG(Number) FROM Population WHERE Org_SciName = "{organism_name}";
        '''

        # print(query)
        cur.execute(query)
        data=cur.fetchall()
        print(tabulate(data, headers="keys", tablefmt='psql'))
        con.commit()
        
    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e) 

# works
def option9():
    """
    Retrieve the names of all employees whose address contains the given substring 
    """
    reqdsubstring=input("Enter the substring to be searched for in the employees' addresses: ")
    print(f"the following are the employess whose address has the substring {reqdsubstring} in it:")
    try:
        query = f"SELECT Employee_ID, Name, Address FROM Employee WHERE Address LIKE '%{reqdsubstring}%';"
        #print(query)
        cur.execute(query)
        data=cur.fetchall()
        print(tabulate(data, headers="keys", tablefmt='psql'))
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to execute command")
        print(">>>>>>>>>>>>>", e)

#works
def option10():
    """
    Function to implement option 4
    """
    print("Not implemented")


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 0):
        option0()
    elif(ch == 1):
        option1()
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    elif(ch == 5):
        option5()
    elif(ch == 6):
        option6()
    elif(ch == 7):
        option7()
    elif(ch == 8):
        option8()
    elif(ch == 9):
        option9()
    elif(ch == 10):
        option10()
    else:
        print("Error: Invalid Option")


# Global
while(1):

    # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(host='localhost',
                              port=30306,
                              user="root",
                              password=password,
                              db='monkeDBfinal',
                              cursorclass=pymysql.cursors.DictCursor)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                print("MODIFICATIONS")
                print("0. Insert a new visitor.")
                print("1. Delete a visitor entry.")
                print("2. Modify zone description.")
                print("3. Update a doctor's ability to treat animals.")
                print("4. Give an employee an increment.");
                print("5. Update a particular animal's population record for a particular year.");
                
                print(" ")
                print("RETRIEVALS")
                print("6. List details of all organisms that inhabit a particular zone.")
                print("7. List all visitors who went on a tour more than a given number of hours long.")
                print("8. Retrieve the average population of an organism across all years.")
                print("9. Retrieve the names of all employees whose address contains the given substring.")

                print(" ")
                print("10. Logout")

                ch = int(input("Enter choice> "))

                if ch == 10:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:

        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")