This repository contains the R package, tutorialTK, that has some
functions and data that I find helpful when writing tutorials and
presentations. Here are some use cases:

Installation
------------

    library(devtools)
    install_github("johnsonra/tutorialTK")

Colorblind-friendly pallete
---------------------------

I have a couple of colorblind-friendly palletes I've included with this
package.

    library(datasets)

    princomp(iris[,1:4])$scores %>%
        cbind(iris) %>%
        
        ggplot(aes(Comp.1, Comp.2, color = Species)) +
        geom_point() +
        scale_color_manual(values = cbb8[1:3])

![](README_files/figure-markdown_strict/iris%20example-1.png)

Ghostwriter
-----------

If you find yourself trying to think, talk and type at the same time
while recording a tutorial, `ghostwriter` might be a good tool for you.
Start by putting the text you want to type into a file (e.g.
`code.txt`), and have `ghostwriter` write an AppleScript file to do the
typing for you (sorry, Linux and Windows users - any similar solutions
for those systems is welcome).

    ghostwriter('code.txt')

Here is an example of a `ghostwriter` script typing while I talk.

<iframe src="https://drive.google.com/file/d/1JHJKxQZJro42fUlZjOCbCj-hwn8f7k8C/preview" width="640" height="480">
</iframe>
