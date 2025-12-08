# Document Title
# Download lombok to local machine
``` bash
curl -L https://projectlombok.org/downloads/lombok.jar -o ~/.local/share/lombok.jar
```

``` elisp
(after! lsp-java
  (setq lsp-java-vmargs
        (list
         "-Xmx2G"
         (concat "-javaagent:" (expand-file-name "~/.local/share/lombok.jar")))))

```

