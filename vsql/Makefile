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

clean:
	    rm -f ./$(OBJ) ./$(FLEXC) ./$(BISONC) ./$(BISONH)
