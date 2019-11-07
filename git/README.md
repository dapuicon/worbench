# Git

## Reset local branch to remote

```bash
git reset --hard origin/master
```

## Replace master branch entirely from another branch

```bash
git checkout <source-branch>
git merge -s ours master
git checkout master
git merge <source-branch>
```

> `-s ours` is short for `--strategy=ours`

[the docs](https://git-scm.com/docs/git-merge)

## Clone Repo between remote gits

1. Obtain the repository url to be migrated.
2. Clone the repository to be migrated executing the following commands.

   `git clone  --mirror`

3. Change to the new directory created.
4. Obtain the target repository url where it will be migrated.
5. Add a this url as a new remote repository.

   `git remote add new-remote` 

6. Push the mirrored repository to the targe repository executing the following commands.

   `git push new-remote --mirror`

7. NOTE: If the is problema with self signed sertificate. Excute the following commands instead:
8. `git -c http.sslverify=false push santander --mirror`

### Clone several repo

In order to manage several repositories.

Create a file like the following:

{% file src="../.gitbook/assets/test.txt" caption="List of repositories" %}

Script to execute

{% file src="../.gitbook/assets/script.sh" %}

