'''
Name:- Kaushal Ramesh Gawali
Batch:- AS3
PRN:- UCS21M1050
Rno:- 50
'''

echo "use BRS" > boat_sh.sql
echo "reserve table"
echo "select *from sailors;" >> boat_sh.sql

echo "bid | sid | dor"
read bi
read sid
read d

echo "insert into reserve values('$bi','sid','d');" >> boat_sh.sql
echo "select *from sailors;" >> boat_sh.sql
sudo mysql -u root < boat_sh.sql
echo "done"

'''
  reserve table
bid | sid | dor
12
103
2023-06-05
sid	sname	srating
101	xyz	12
102	abc	15
103	lmn	19
[sudo] password for kasuhal:
done

'''
