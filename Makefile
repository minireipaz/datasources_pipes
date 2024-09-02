.PHONY: upload_datasources force_upload_datasources upload_pipes test interactive

upload_datasources:
	@./data/tinybird/scripts/upload_datasources.sh

force_upload_datasources:
	@./data/tinybird/scripts/force_upload_datasources.sh

upload_pipes:
	@./data/tinybird/scripts/upload_pipes.sh

test:
	@./data/tinybird/scripts/make_test.sh

interactive:
	@./data/tinybird/scripts/make_interactive.sh