/*
git init
git add .
git status
git commit -m "message"
*/

/*
git branch branchname
git checkout branchname
*/

rebase:

fastforward commit
/*
git checkout branchname
git rebase master

git checkout master
git merger branchname
*/

rearrange COMMIT
/*
git rebase -i head~4
*/

Merging commit:
/*
git rebase -i head~4
*/

stash:
/*
git stash

git stash -u

git stash pop

*/

amend: if any changes made to commited file git considers it as untracked file 
to add changes to existing commit we use amend
/*

git commit --amend -m "commited message"

*/

reset:
to roll back commit we use RESETLOGS
/*
git reset --hard commitid
*/

remote repository:
to add remote repository to local we use remote command
/*
git remote add origin remote repo url

git push -u origin master --push into remote repository
*/

