#### file permission and ownership

**ownership**

user: the owner of the file.

groups: a user group can contain multiple users.

other: Any other user who has access to a file.


**Read**: This permission give you the authority to open and read a file. Read permission on a directory gives you the ability to lists its content.

**Write**: The write permission gives you the authority to modify the contents of a file. The write permission on a directory gives you the authority to add, remove and rename files stored in the directory.

**Execute**: you cannot run a program unless the execute permission is set.

1. absolute mode

| Number | Permission type      | Symbol |
| ------ | -------------------- | ------ |
| 0      | no permission        | ---    |
| 1      | execute              | --x    |
| 2      | write                | -w-    |
| 3      | execute, write       | -wx    |
| 4      | read                 | r--    |
| 5      | read, execute        | r-x    |
| 6      | read, write          | rw-    |
| 7      | read, write, execute | rwx    |

```
touch test.txt
chmod 764 test.txt
```

2. symbolic mode

| Operator | Description                                                    |
| -------- | -------------------------------------------------------------- |
| +        | Adds a permission to a file or directory                       |
| -        | Removes the permission                                         |
| =        | Sets the permission and overrides the permissions set earlier. |


| User | Denotations |
| ---- | ----------- |
| u    | user/owner  |
| g    | group       |
| o    | other       |
| a    | all         |

```
chmod a=rw test.txt
chmod u+x test.txt
chmod g-r test.txt
```

# tr command

```bash
# convert lower case to upper case
echo "Hello world" | tr "[a-z]" "[A-Z]"
echo "Hello world" | tr "[:lower:]" "[:upper:]"

# translate white-space to tabs
echo "Hello world" | tr "[:space:]" "\t"

# use squeeze repetition of character using -s
# convert multiple continuous spaces with a single space
echo "Hello    world" | tr -s "[:space:]" " "

# delete all the specified characters using -d
echo "Hello    world" | tr -d "l"

# remove all the digits
echo "my ID is 73535" | tr -d [:digit:]

# complement the sets using -c
echo "my ID is 73535" | tr -cd [:digit:]
```