# bats-demo

Example usage of [bats](https://github.com/bats-core/bats-core) (Bash Automated Testing System)

## Usage

### Create a script

[print_file.sh](./print_file.sh)

```sh
#!/usr/bin/env bash

[[ -z $1 ]] && {
    echo "Please specify a filename" >&2
    exit 1
}

cat "$1"
```

### Define expected behaviour with bats

[print_file_test.bats](./print_file_test.bats)

```sh
subject=./print_file.sh

@test "$subject given no filename should return error" {
  run "$subject"
  [[ $status -eq 1 ]]
  [[ $output = "Please specify a filename" ]]
}

@test "$subject given the name of a non-existent file should return error" {
  run "$subject" "angry-dog.png"
  [[ $status -eq 1 ]]
  [[ $output = "cat: angry-dog.png: No such file or directory" ]]
}

@test "$subject given the name of a existing file should return the file contents" {
  run "$subject" "roundtine.txt"
  [[ $status -eq 0 ]]
  [[ $output = "That's gold, Jerry! Gold!" ]]
}
```

### Run tests

```sh
$ bats .
 ✓ ./print_file.sh given no filename should return error
 ✓ ./print_file.sh given the name of a non-existent file should return error
 ✓ ./print_file.sh given the name of a existing file should return the file contents
```
