test:
	fd -e sh -e bats | entr -c bats . 
