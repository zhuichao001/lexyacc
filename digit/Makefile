OBJ := digit

FLEXO := $(OBJ)
FLEXI := $(FLEXO).l
FLEXC := $(FLEXO).c
CFLAGS := -lfl

LEX := flex

$(OBJ) : $(FLEXC)
	$(CC) -o $(OBJ) $(FLEXC) $(CFLAGS)

$(FLEXC) : $(FLEXI)
	$(LEX) -t $(FLEXI) > $(FLEXC)

clean:
	rm -f ./$(OBJ) ./$(FLEXC)
