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

