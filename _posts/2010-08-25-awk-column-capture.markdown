---
title: "Awk Column Capture"
date: 2010-08-25 14:54:18 -0500

content_author:
categories: notes
---

get a count of unique values in the first column of file 
(foo is the file name):

```shell
cat foo  | awk -F \\, '{print $1}' | sort -u | wc  -l
```


Replace the comma with whatever your field separator is.
Replace $1 with whatever column number you're looking for.
Counts unique values - get rid of sort -u to get everything.


<span class="post-meta">
&nbsp;&nbsp;&nbsp;&nbsp;-- {{page.content_author}} <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{page.content_date}} <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{page.location}}
</span>
