subject=./print_file.sh

@test "$subject given no filename should return error" {
  run "$subject"
  [[ $status -eq 1 ]]
  [[ $output = "Please specify a filename" ]]
}

@test "$subject given the name of a non-existent file should return error" {
  run "$subject" "angry-dog.png"
  [[ $status -eq 1 ]]
  [[ $output == *"No such file or directory" ]]
}

@test "$subject given the name of a existing file should return the file contents" {
  run "$subject" "roundtine.txt"
  [[ $status -eq 0 ]]
  [[ $output = "That's gold, Jerry! Gold!" ]]
}
