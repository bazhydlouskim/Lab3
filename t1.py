import re
import urllib2
import MySQLdb

# Cath any database error
try:
   
   # Open connection to the database
   db = MySQLdb.connect(host="localhost",user="root",passwd="MyFakePassword",db="Wiki")
   x = db.cursor()


   ###db.query("""INSERT INTO Categories VALUE (%s);""", ())

   with open("sources.txt") as sourcefile:
        # Reading the URLs of chosen websites
        for line in sourcefile.readlines():
          
          # Getting the page
          req = urllib2.Request(line)
          response = urllib2.urlopen(req)
          the_page = response.read()
          
          # Searching for the header
          string = re.search(r'(<h1.*?>)(.+)(</h1>)', the_page)
          
          # Printing the header
          if string:
             header = string.group(2)
             print header
             # Inserting headers into the database
             try:
             ###   x.execute("""INSERT INTO Articles (ArticleTitle) VALUES (%s);""", (header))
             ###   db.commit()
                x.execute("""SELECT articleID FROM articles WHERE articleTitle = (%s)""", (header))###########################
                headerid = x.fetchall()
                print headerid   # Testing
             except MySQLdb.Error as e:
                db.rollback()
                print "Error %d: %s" % (e.args[0],e.args[1])
                print "Article title not commited!"
             x.execute("""SELECT articleID FROM articles WHERE articleTitle = (%s)""", (header))##########################
             headerid = x.fetchone()
             print headerid   # Testing
          else:
             print "Header not found! " + line

          print
          print "Categories:"

          # Searching for and printing categories
          strings = re.search(r'(">Categor\w+</a>:)(.+?)(</div>)', the_page, re.DOTALL)
          if strings:
                string = strings.group(2) # Piece of text that contains all useful categories
                strings = re.findall(r'(">)(.+?)(</a>)', string)
                for result in strings:
                        category = result[1]
                        print category   # Testing

                        # Inserting categories into the database
                        try:
                          ### x.execute("""INSERT INTO Category (categoryName) VALUES (%s);""", (category))
                          ### db.commit()
                           x.execute("""SELECT categoryID FROM Category WHERE categoryName = (%s)""", (category))
                           categoryid = x.fetchone()
                           print categoryid   # Testing
                        except MySQLdb.Error as e:
                           db.rollback()
                           print "Error %d: %s" % (e.args[0],e.args[1])
                           print "Category name not commited!"

                        # Inserting articleID and categoryID into the junction table
                        try:
                           x.execute("""INSERT INTO article_category (articleID, categoryID) VALUES (%s, %s);""", (headerid[0], categoryid[0]))
                           db.commit()
                           print
                        except MySQLdb.Error as e:
                           db.rollback()
                           print "Error %d: %s" % (e.args[0],e.args[1])
                           print "Not commited!"
                           
          else:
                print "Categories not found!"

          print # New line

    # After iterations are over, check if articles & categories were inserted
   x.execute("""SELECT COUNT(*) FROM article_category""")
   result = x.fetchall()
   print result      

except MySQLdb.Error as e:
  
    print "Error %d: %s" % (e.args[0],e.args[1])

# Close the dababase
finally:    
        
    if db:    
          db.close()

