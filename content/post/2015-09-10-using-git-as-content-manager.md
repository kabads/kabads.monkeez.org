---
date: 2015-09-10T00:00:00Z
title: Using Git as a content manager system
url: /2015/09/10/using-git-as-content-manager/
---

Not familiar with [git](https://git-scm.com)? Start with an [online book](https://git-scm.com/book/en/v1/Getting-Started) or [Version Control with Git](https://git-scm.com/book/en/v1/Getting-Started).

[Git](https://git-scm.com/) is an open sourced source control software system. It allows coders to manage large projects remotely and on their own machine. Each contributor will hold their own version of the code on their machine and can manipulate that however they wish. Eventually, they can push back their contributions to a remote repository.

This workflow design can also be great for managing content, although that content does have to be in text format - git will allow binary files to be uploaded and managed, but doesn't allow for differences between files to be shown - this can only be done with plain text files.

Git manages differences in a project by creating branches. However, you do not need to create a branch for each new set of content. For example, if you write a new article, you do not need a new branch for this. Within [Jekyll](http://www.jekyllrb.com), you create a _drafts folder and then put your content in there.

Add the new file to your git repository.

	git add _drafts/your-new-post.md

Commit the post:

	git commit -am"new post added"

To share with multiple authors, set up a remote repository and push to remove:

	git push origin master

When other contributors/authors start their work, they will pull down the latest changes. They could start work on your contribution if they wished, or they could start their own article. 

Obviously, this is a small article and cannot go in to the full details of how git works. Other documentation for git exists - [Version Control with Git](http://shop.oreilly.com/product/0636920022862.do).
