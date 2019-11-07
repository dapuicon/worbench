#!/bin/bash

# USO
# ./script test.txt

FILE=$1
# TO DO // access_token 
TOKEN=<token>
# TO DO // access_token 
while IFS= read -r line; do
  line2=${line##*/}
  name_of_old_repo=$(echo $line2 | tr -d \\r)
  echo D${name_of_old_repo}D
  curl -d "{\"name\":\"${name_of_old_repo}\" }" -H "Content-Type: application/json" -H "Authorization: token ${TOKEN}" -X POST https://api.github.com/orgs/MigracionPucela/repos
  git clone --mirror $line
  cd ${name_of_old_repo}
  # TO DO // 
  # Hay que meter la organización de orange
  # Ejemplo: git remote add new-origin https://github.com/MigracionPucela/${name_of_old_repo}
  git remote add new-origin https://github.com/ <organización >/${name_of_old_repo}
  # TO DO // 
  git push new-origin --mirror
done <"$FILE"
