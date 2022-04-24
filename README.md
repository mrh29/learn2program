# learn2program: Git 

## Intro

Git is a tool used for version control among repositories. Version control
means being able to track changes that you or others make. It is very powerful
when working collaboratively or trying to find breaking changes. This asssumes
that you know how to use your shell of choice. For MacOS or Linux, you'll want
the Terminal application. For Windows, you'll want to be using PowerShell (or an equivalent).

## Local vs. Remote

Git documents often differentiate between a local repo and a remote repo. A local repo
is one that is one your machine. Local changes are ones that you have made locally but have not
been added to the remote repo. This means that no one can access your changes except your machine.
Pushing to the remote repository ensures that everyone can see and access your changes.

## Getting Code (Initially)

To start out, you will need to ```fork``` and ```clone``` this repository. Forking
means making a copy that you own and cloning means
bringing remote repository and bringing it locally to your machine.


### Forking
To fork the repo, click the Fork button on the top right hand of the page. You should
see a page titled "Create a new fork." The owner should be [git username]/learn2program. Feel free to
add a description. After clicking "Create fork," you'll be taken to the new repository that you own.

### Cloning
In the top right hand corner of your repository page, you should see a green button that
says "Code." Click it and you should see a link like git@github.com:[username]/learn2program.git.
Paste that link into your terminal after a git clone command, so that the full command looks like:
```git clone git@github.com:[usernname]/learn2program.git```. After you run the command, you should
see logs that tell you the files (objects) have been downloaded. You now have the code!

## Branching Off

Run the command ```git status```. You'll see "On branch main." 
However, for this part of the introduction, you'll want to be on this branch (git-todo).

### What's a branch?

A branch is a way to work on new features or improvements without altering the
history of the main branch or potentially breaking something for everyone. It allows
you to try something out on your own and then potentially add it to the main branch
for everyone else (see Merges and Conflicts below for more on this).


### Switching Branches
Run the command ```git branch```. This will list all of the branches in
the repository. You should see ```git-todo``` (among others).

Now run the command ```git checkout git-todo```. This tells git to
switch to (or checkout) the branch named git-todo.

Run ```git status``` again. You should now see "On branch git-todo".


### Making Branches
You should also know how to make branches. To make a branch you can run 
the command ```git branch [branch_name]``` replacing [branch_name] with 
the name of your choice. Then you can run the checkout command from above 
replacing git-todo with branch_name, and you are now on your shiny brand 
new branch. Because making and then checking out a branch is such a common sequence,
you can also run the command ```git checkout -b [branch_name]```
which will create the branch branch_name and then check it out. As a note, 
created branches start from the branch that you're currently on. So if you
want to branch off of git-todo you need to make sure you're currently
on that branch and not X-todo before running a branch creation command. Go ahead
and make a new branch off of git-todo now.

## Making Changes

Now that you're on a new branch, you're ready to make some changes.

### Local Changes

Take a look at favorites.txt in a text editor. 
This is a simple text file with a list of 
your favorite things. Add a thing (or two) to the list. Run
```git status```  again. You'll see a line that says
"modified:  favorites.txt." If you run the command
```git diff```, you'll see the items you added. Once you're happy with the items you've
added, you can move on to the next section.

### Adding Changes

Now run the command ```git add favorites.txt```. This tells git that you've made changes
to the file favorites.txt and you want it to be included in the next commit (or snapshot
of the branch). Now when you run ```git status``` you should see "modified: favorites.txt"
listed under the header "Changes to be committed."

### Commiting Changes

A commit is a snapshot of the branch. A good rule of thumb is to commit "early and often."
You want to commit basic changes, so that you can see what changes between commits. This
allows you to track down mistakes easily and check where something may have gone wrong.

Think of a good message to descibe the changes you made to favorites.txt. Keep in mind
that this message is how you'll track changes and will be a desciptor of what changed
from the last commit to this one. On a public repo, it would also be viewable
by the public. Once you have a message run the command
```git commit -m "[your message]"``` replacing [your_message] with the message you thought of
to describe your changes. The -m option tells git you're providing the message along with the
commit command rather than providing it separately. 

### Pushing Changes

Now that you've committed the changes, you're ready to push them. Pushing refers to
taking the commit you made locally, and adding it to the remote branches history.
Run ```git push origin [your_branch]```. You should see logs indicating that you've pushed the changes
up to the remote branch. You can also check online to see that the changes are now
reflected there.

## Merges and Conflicts

Now that you've pushed changes to a branch, you're ready to merge your changes.
A merge is when two branches are brought together. This is often done when a feature
is completed and ready to be shared on the main branch. To start,
checkout the git-todo branch.

### Fetch

First run the ```git fetch``` command. This tells git to pull down any changes
from the remote repo. It's a good way to pull down changes that have occurred
on the remote repository since the last fetch.

### Merge

Now you're ready to merge in the changes from your branch. Run the command
```git merge origin/[branch_name]``` where branch_name is the branch you
made in the Making Changes section. You should see logs indicating
that favorites.txt has changed. Go ahead and run ```git push origin git-todo ``` to update
git-todo on the remote repository. You should now have all the tools
you need to start programming! Feel free to read about conflicts if you
want to know what happens when changes are made on your branch and the
one you're trying to merge into.

### Conflicts

Hopefully, you shouldn't have run into any conflicts if you only added
items to the list. However, conflicts can occur if for example the file
has been updated on the original branch and you haven't pulled in the
changes. 


#### Creating Conflicts

On git-todo add another item to favorites.txt. Add, commit, 
and push the change. Now checkout your branch from earlier, and
add a different item to favorites.txt. Add commit, and push the change
to this branch. Now go back to git-todo and attempt to merge your branch.
You should get this message: "CONFLICT (content): Merge conflict in favorites.txt."

#### Resolving Conflicts

Open up favorites.txt. You should see weird lines:

<<<<<<< HEAD
=======
>>>>>>> [your_branch]


The HEAD line indicates what the changes on the current branch are.
This is what is there currently in favorites.txt. The = line
indicates the dividing line between the current branch and the branch
merging in. Everything below that line is what is in favorites.txt
on the branch you're attempting to merge from. To resolve the conflict,
remove the HEAD, =, and >>>>> [your_branch] lines and fix the numbering
of the items to fix the list. Then add, commit, and push your changes.
Congratulations, you've resolved the conflict!

## Solution

If you'd like to see an example of this tutorial, you can look at the
history of the git-soln branch. It's history is as follows: it first
merges from the branch "branch_to_merge", then it pushes a new
commit, and finally merges from branch_to_merge again
which resulted in a merge conflict.
