OBJ := vsql

FLEXO := sql_lex
FLEXI := $(FLEXO).l
FLEXC := $(FLEXO).c

BISONO := sql_yacc
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

test:
	    echo 'select * from foo where a = 123 and b = "zed"' | ./$(OBJ)

clean:
	    rm -f ./$(OBJ) ./$(FLEXC) ./$(BISONC) ./$(BISONH)
