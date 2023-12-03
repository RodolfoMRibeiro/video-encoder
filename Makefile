install:
	@echo Validating dependecies...
	@go mod tidy
	@echo Generating vendor...
	@go mod vendor

coverage:
	@echo "${COLOR_YELLOW}Running project coverage...${COLOR_WHITE}\n"
	@go test ./... -v -coverprofile=cover.out
	@go tool cover -html=cover.out -o cover.html
	@echo "${COLOR_GREEN}Coverage completed successfully.${COLOR_WHITE}"

test:
	go test ./... -short -coverprofile=cover.out && go tool cover -html=cover.out -o cover.html

commit:
	@cz