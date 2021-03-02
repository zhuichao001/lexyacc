OBJ := wc

FLEXO := $(OBJ)
FLEXI := $(FLEXO).l
FLEXC := $(FLEXO).c
CFLAGS := -lfl

LEX := flex

$(OBJ) : $(FLEXC)
	$(CC) -o $(OBJ) $(FLEXC) $(CFLAGS)

$(FLEXC) : $(FLEXI)
	$(LEX) -t $(FLEXI) > $(FLEXC)

test:
	echo "12 + 34 abc god." | ./$(OBJ)

clean:
	rm -f ./$(OBJ) ./$(FLEXC)
