# Contributing

Follow these guidelines if you'd like to contribute to the project! **Commit early and often**

---

### Table of Contents

Read through these guidelines before you get started:

1. [Best Practices](#best-practices)
2. [Questions & Concerns](#questions--concerns)
3. [Issues & Bugs](#issues--bugs)
4. [Feature Requests](#feature-requests)
5. [Submitting Pull Requests](#submitting-pull-requests)
6. [Code Style](#code-style)
7. [The Life of a Feature](#the-life-of-a-feature)

### Best Practices

#### Commit Related Changes

A commit should be a wrapper for related changes. For example, fixing two different bugs should produce two separate commits. Small commits make it easier for other team members to understand the changes and roll them back if something went wrong. With tools like the staging area and the ability to stage only parts of a file, Git makes it easy to create very granular commits.

#### Commit Often

Committing often keeps your commits small and, again, helps you commit only related changes. Moreover, it allows you to share your code more frequently with others. That way it’s easier for everyone to integrate changes regularly and avoid having merge conflicts. Having few large commits and sharing them rarely, in contrast, makes it hard both to solve conflicts and to comprehend what happened.

#### Test Before You Commit

Resist the temptation to commit something that you “think” is completed. Test it thoroughly to make sure it really is completed and has no side effects (as far as one can tell). While committing half-baked things in your local repository only requires you to forgive yourself, having your code tested is even more important when it comes to pushing / sharing your code with others.

#### Don't Commit Half-Done Work

You should only commit code when it's completed. This doesn't mean you have to complete a whole, large feature before committing. Quite the contrary: split the feature's implementation into logical chunks and remember to commit early and often. But don't commit just to have something in the repository before leaving the office at the end of the day. If you're tempted to commit just because you need a clean working copy (to check out a branch, pull in changes, etc.) consider using Git's "Stash" feature instead.

#### Write Good (Descriptive) Commit Messages

Begin your message with a short summary of your changes (up to 50 characters as a guideline). Separate it from the following body by including a blank line. The body of your message should provide detailed answers to the following questions: What was the motivation for the change? How does it differ from the previous implementation? Use the imperative, present tense ("change", not "changed" or "changes") to be consistent with generated messages from commands like git merge.

#### Version Control is not a Backup System

Having your files backed up on a remote server is a nice side effect of having a version control system. But you should not use your VCS like it was a backup system. When doing version control, you should pay attention to committing semantically (see "related changes") - you shouldn't just cram in files.

#### Use Branches

Branching is one of Git's most powerful features - and this is not by accident: quick and easy branching was a central requirement from day one. Branches are the perfect tool to help you avoid mixing up different lines of development. You should use branches extensively in your development workflows: for new features, bug fixes, experiments, ideas…


### Questions & Concerns

If you have any questions about using or developing for this project, reach out to @Braunson or send an [email][1].

### Issues & Bugs

Submit an [issue][2] or [pull request][3] with a fix if you find any bugs in the project. See [below](#submitting-pull-requests) for instructions on sending in pull requests, and be sure to reference the [code style guide](#code-style) first!

When submitting an issue or pull request, make sure you're as detailed as possible and fill in all answers to questions asked in the templates. For example, an issue that simply states "X/Y/Z isn't working!" will be closed.

### Feature Requests

Submit an [issue][2] to request a new feature. Features fall into one of two categories:

1. **Major**: Major changes should be discussed with me via [email][1]. I'm always open to suggestions and will get back to you as soon as I can!
2. **Minor**: A minor feature can be added via a [pull request][3].

### Submitting Pull Requests

Before you do anything, make sure you check the current list of [pull requests][4] and in the Trello Development board to ensure you aren't duplicating anyone's work. Then, do the following:

1. Fork the repository and make your changes in a git branch: `git checkout -b my-branch base-branch`
2. Read and follow the [code style guidelines](#code-style).
3. Make sure your feature or fix doesn't break the project! Test thoroughly.
4. Commit your changes, and be sure to leave a detailed commit message.
5. Push your branch to your forked repo on GitHub: `git push origin my-branch`
6. [Submit a pull request][3] and hold tight!
7. If any changes are requested by the project maintainers, make them and follow this process again until the changes are merged in.

#### Notes

- Each commit must have a unique and descriptive name, no "fix" or "hope this works"!
- Anything that's in master can be deployed by anyone at any time. This is to enforce discipline for code review, but also for introducing changes that i.e. require migrations. You'll use feature flags more, split DN schema changes into several deployments, make code work with both schema version, etc. All good practices that you'll need anyway when we reach larger scale and run into issues with different versions of code running concurrently during deployments.

### Code Style

Please follow the coding style conventions detailed below:

https://github.com/Braunson/project-boilerplate/wiki/Code-Standards-&-Style-Guide

### The Life of a Feature

So you want to add a new feature to the code base, no problem. We've adopted parts of the [Gitflow][5] Model into the process.

#### New (Notification) Feature Example:

##### As the developer

1. Checkout the branch you want to branch off from, in this example it's going to be master `git checkout origin/master`
2. Create a new branch `git checkout -b feature/notifications`
3. Publish our new branch `git push -u origin feature/notifications`
4. Make your changes and commit them to your repository
5. Once your feature is complete, you must update your branch with the latest version of the branch you originally branched off at (to avoid conflicts when merging), `git fetch` and `git merge origin/master`. If you have any conflicts, it will show which files conflict, open them and select what version to use, save the files and commit your changes.
6. Create a Pull Request via the GitHub Pull Request page from your branch `feature/notifications` into `master` and fill out the pull request template that pre-fills into the description area.
7. Assign your new pull request to a senior developer for review
8. Once it's been reviewed, if there are changes you will be notified, make the changes and commit them
9. Once it's been reviewed, the reviewer will move forward with the merge into `master`. Voila!

##### As the reviewer
1. View assigned pull request
2. Checkout the branch and using the pull request steps in the description, test the feature
3. Make sure the branch is up to date with the origin branch, `git fetch` and `git merge origin/master`
4. If any changes need to be made, make comments in the code for the user to adjust or fix
5. Once everything is solid, you can merge the pull request into the requested branch

#### Notes

- When creating a branch for a patch prefix it with `patch/for-whatever`, or for a hotfix `hotfix/for-whatever`.
- Always-always-always update your branch from the origin branch before merging to avoid conflicts or issues after merging.

[1]: mailto:braunson@braunson.ca
[2]: https://github.com/Braunson/project-boilerplate/issues/new
[3]: https://github.com/Braunson/project-boilerplate/compare
[4]: https://github.com/Braunson/project-boilerplate/pulls
[5]: https://blog.axosoft.com/gitflow/
