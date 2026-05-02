# .files

My configuration files

## Loading Configuration

I use my own zsh bunch of scripts for loading dotfiles called `che`. It's optimized for minimal actions needed to store configuration remotely.

```sh
che                         
che install <REPO>

che mkdirs
che mklinks

che add <file>
che add --no-git <file>

che backup all
che clean all
```

## Comments - Information Annotation 

Configuration is annotated with comments to justify selection in following format:

### Sections - Settings Grouping - BEGIN/END

```shell
##### --- BEGIN <SECTION> --- #####
### --- BEGIN <SUB_SECTION> --- ###
### --- END <SUB_SECTION> --- ###
##### --- END <SECTION> --- #####
```

### #> - Where can this be read about? 

Notation:

```shell
#> <url>
<subject>
```

Example:

```shell
#> https://zsh.sourceforge.io/Doc/Release/Options.html
typeset -a opts_disabled=(
```

### #? - Why why was this particular setting chosen?

Notation:

```shell
<subject> #? <justification>
```

Example:

```shell
AUTO_CD #? to avoid confusion, for better completion control
```

### #[D] - Explicit Default Setting

Notation:

```shell
<subject> #[D]
```

Example:

```shell
AUTO_NAME_DIRS #[D] - #? to not create named dirs by accident
```

### Opinion

Notation:

```shell
setting #[O] <opinion>
```

Example:

```shell
CORRECT_ALL #[O] not useful when advanced completions are on
```


## Contributions

I'd be glad to accept contributions in form of public as well as private criticizm, discussion and questions. I'm actively monitoring: 
- gitlab work items
- github issues 
- email: odwrotkonrad@gmail.com

## Source Code

- Primary Location: https://gitlab.com/konradodwrot/che/dotfiles.git
- Mirror: https://github.com/odwrotkonrad/dotfiles.git
