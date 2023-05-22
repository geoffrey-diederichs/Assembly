# Arithmetic

Only dealing with 1 digit not to overcomplicate things yet.

```
$ nasm -felf64 add.asm && ld add.o -o add
$ ./add
Result can not be over 9
Give the first number : 3
Give the second number : 5
Result is : 8
```

```
$ nasm -felf64 mult.asm && ld mult.o -o mult
$ ./mult
Result can not be over 9
Give the first number : 3
Give the second number : 2
Result is : 6
```

```
$ nasm -felf64 div.asm && ld div.o -o div
$ ./div
Give the first number (0-9) : 8
Give the second number (0-9) : 2
Result is : 4
```
