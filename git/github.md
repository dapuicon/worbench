# Github

## Delete repos

```bash
#!/bin/bash

TOKEN=<acces_token>

REPO_LIST=$(curl -H "Authorization: token ${TOKEN}" https://api.github.com/orgs/MigracionPucela/repos | jq -r '.[].name')

for REPO in $REPO_LIST
do
  echo Deleting ${REPO}
  curl -H "Authorization: token ${TOKEN}" -X DELETE https://api.github.com/repos/MigracionPucela/${REPO} -v
done
```

