# conda-recipes
Recipes to build conda packages for the coecms channel

To add a package, clone the repository, create a directory for the new package
with the same name as the package. Make a `meta.yaml` file

https://conda.io/docs/user-guide/tasks/build-packages/recipe.html

Build the package:

```
conda build meta.yaml
```

Upload the package to the coecms channel (you will need a personal anaconda
account with write access to the coecms channel)

For example, to upload the `ncdu` package:

```
anaconda upload -u coecms $HOME/conda-bld/linux-64/ncdu-1.13-0.tar.bz2
```
