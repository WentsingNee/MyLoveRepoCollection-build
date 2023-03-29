GIT_COMMIT_ID:=$(shell cd $(SRC_DIR) && git rev-parse HEAD)
GIT_COMMIT_SHORT_ID?=$(shell cd $(SRC_DIR) && git rev-parse --short HEAD)
GIT_COMMIT_DATE?=$(shell cd $(SRC_DIR) && git log --pretty=format:%cd --date=format:%Y%m%d -1)
GIT_COMMIT_TIME?=$(shell cd $(SRC_DIR) && git log --pretty=format:%cd --date=format:%H%M%S -1)
