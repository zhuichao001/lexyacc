OBJ := vsql

FLEXO := vsql
FLEXI := $(FLEXO).l
FLEXC := $(FLEXO).c

BISONO := vsql
BISONI := $(BISONO).y
BISONC := $(BISONO).tab.c
BISONH := $(BISONO).tab.h

LEX := flex
YACC := bison

$(OBJ) : $(FLEXC) $(BISONC)
	    $(CC) -o $(OBJ) $(FLEXC) $(BISONC)

$(FLEXC) : $(FLEXI)
	    $(LEX) -t $(FLEXI) > $(FLEXC)

$(BISONC) $(BISONH) : $(BISONI)
	    $(YACC) -d $(BISONI)

get:
	echo "SELECT id, `type` FROM product WHERE id>3" | ./$(OBJ)
	echo "SELECT id, `type` FROM product" | ./$(OBJ)

put:
	echo "INSERT INTO websites (name, url, alexa) VALUES ('ali','aliyun.com',4);" | ./$(OBJ)
	echo "INSERT INTO websites (id, name) VALUES (7, 'ali');" | ./$(OBJ)

post:
	echo "UPDATE websites SET alexa = 30, country = 'USA' WHERE name = 123;" | ./$(OBJ)
	echo "UPDATE websites SET used = 0;" | ./$(OBJ)

del:
	echo "DELETE FROM websites WHERE `id` > 12;" | ./$(OBJ)
	echo "DELETE FROM websites;" | ./$(OBJ)

clean:
	rm -f ./$(OBJ) ./$(FLEXC) ./$(BISONC) ./$(BISONH)
