OBJ := sum

FLEXO := sum
FLEXI := $(FLEXO).l
FLEXC := $(FLEXO).c

BISONO := sum
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
	    echo "12 + 34" | ./$(OBJ)

clean:
	    rm -f ./$(OBJ) ./$(FLEXC) ./$(BISONC) ./$(BISONH)
