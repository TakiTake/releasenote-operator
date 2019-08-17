{{ DEPLOY_NAME }} - {{ VERSION }}
=================================

## Build Info

### Operator {{ BUILD_OPERATOR }}
### Date {{ BUILD_DATE }}
### URL {{ BUILD_URL }}

## Commits

for rsc in resources
	NAME
	| Commit ID | User Name | Commit Date | Commit Message |
	for d in diff
		| COMMIT_ID | USER_NAME | COMMIT_DATE | COMMIT_MESSAGE |
