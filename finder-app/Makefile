
#Donditional Switch
ifeq ($(CROSS_COMPILE), aarch64-none-linux-gnu-)
	CC = aarch64-none-linux-gnu-gcc
else
	CC = gcc
endif
writer:writer.c
	$(CC) -o $@ $^
.PHONY : clean
clean:
	rm -f writer *.o
.PHONY : target
target:
	echo $(TARGET)
