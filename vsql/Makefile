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

select:
	    echo 'SELECT id, `type` FROM product WHERE id = 123 AND `type` = "zed"' | ./$(OBJ)
	    echo 'SELECT id, `type` FROM product' | ./$(OBJ)

insert:
	    echo "INSERT INTO websites (name, url, alexa) VALUES ('ali','aliyun.com',4)" | ./$(OBJ)
	    echo "INSERT INTO websites (id, name) VALUES (7, 'ali')" | ./$(OBJ)

update:
	    echo "UPDATE websites SET alexa=30, country='USA' WHERE name='ali'" | ./$(OBJ)
	    echo "UPDATE websites SET used=0" | ./$(OBJ)

delete:
	    echo "DELETE FROM websites WHERE `id` > 12 " | ./$(OBJ)
	    echo "DELETE FROM websites " | ./$(OBJ)

clean:
	    rm -f ./$(OBJ) ./$(FLEXC) ./$(BISONC) ./$(BISONH)
