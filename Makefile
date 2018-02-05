SRC := src
OBJ := build
BIN := bin
INCLUDE := include

SOURCES_WILDCARD := $(wildcard $(SRC)/*.c)
OBJECTS_SUBSTITUTION := $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SOURCES_WILDCARD))

WARNING := -Wall -Wextra


.PHONY: all clean

all: $(BIN)/ncrename

$(BIN)/ncrename: $(OBJECTS_SUBSTITUTION)
	@echo "Linking"
	$(CC) -o $(BIN)/ncrename $(OBJECTS_SUBSTITUTION) -lncurses 

$(OBJ)/%.o: $(SRC)/%.c
	@echo 'Building: $<'
	$(CC) -O3 $(WARNING) -std=gnu99 -o $@ -I$(INCLUDE) -c $<


###############################################################################
# Create build and bin folders if missing:

$(OBJECTS_SUBSTITUTION): | $(OBJ) $(BIN)

$(OBJ):
	mkdir -p $(OBJ)

$(BIN):
	mkdir -p $(BIN)


clean:
	rm -rf $(OBJ)/*
	rm -rf $(BIN)/*
