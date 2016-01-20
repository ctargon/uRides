# uRides

uRides is a student-to-student driving service founded by Colin Targonski, Caleb Sarnecki, and Jack Friedman. 

# Git Hub Basic Commands

git pull - every time I start. Updates git hub on my computer

git add . - add all changed files to local repository 

git status - see the changes in green that you are ready to commit

git commit - write subject and more detailed description of what I changed

in vim -type ’s’ to edit and enter the subject/description, then ‘escape’ then colon ‘w’ to write and colon ‘q’ to quit

git push origin master - puts all my data to the cloud

git log - check the most recent commits to the master 

**********IMPORTANT RESET COMMAND**********

git fetch --all
git reset --hard origin/master

-> The above command will reset your local directory with everything that is currently on the master directory if you have
   any merging conflicts like I was having.


# What to do, what to do!

Launch screen -> finished up launch screen on 12/21. Need to check constraint bounds and make sure that the bounds look
                 correct for every iPhone size. Also, find attributes that will ensure the application is only allowed
                 to go in portrait mode.

Sign up/Log in-> This is the next page to be completed on the story board. 

useful site for icons

https://www.iconfinder.com/icons/722666/arrow_direction_left_previous_icon#size=24

----------------------------------------------------------------------------------

1/20/2016 Branching and Merging 

Read this! 

https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging

1.) To create a branch and switch to it:

git checkout -b [branchName]

*do work*

*make sure it works* 

git commit -a -m [‘comment’]

2.) Checkout what you want to merge with, in most cases master

git checkout master 

3.)Merge your branch into the master

git merge [branchName]

To delete the branch once merged back (if you want)

git branch -d [branchName]

4.) If conflicts arise 

git mergetool 

attempt to resolve 
