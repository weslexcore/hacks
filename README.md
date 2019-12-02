# hacks
Scripts and conf that make my life easier

Place project at root and place this into `.bash_profile`
```
# Source all files in scripts
for f in ~/hacks/scripts/*; do source $f; done
for f in ~/conf/*; do source $f; done
for f in ~/hacks/aliases/*; do source $f; done
for f in ~/hacks/conf/*; do source $f; done
```

Place configuration that contains senstive information into `/conf` so that it is not committed.
