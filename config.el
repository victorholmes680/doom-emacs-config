;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;


;; 退出emacs不需要确认
(setq confirm-kill-emacs nil)

;; 终端下开启鼠标支持
(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  ;; 启用鼠标滚轮支持
  (mouse-wheel-mode 1)
  ;; 绑定滚轮事件到终端模式
  (global-set-key (kbd "<mouse-4>") #'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") #'scroll-up-line)
  ;; 或者使用更通用的滚轮绑定
  (when (fboundp 'mwheel-install)
    (mwheel-install)))

  ;; ------------------------------
;; Tree-sitter grammar sources
;; ------------------------------
;;(setq treesit-language-source-alist
;;      '((c     . ("https://github.com/tree-sitter/tree-sitter-c"))
;;        (cpp   . ("https://github.com/tree-sitter/tree-sitter-cpp"))
;;        (java  . ("https://github.com/tree-sitter/tree-sitter-java"))
;;        (json  . ("https://github.com/tree-sitter/tree-sitter-json"))
;;        (python . ("https://github.com/tree-sitter/tree-sitter-python"))))
;;
;; 设置jdtls的jdk环境
;;(after! lsp-java
;;  (setq lsp-java-java-path "~/.sdkman/candidates/java/21.0.9-amzn/bin/java")
;;  )

;; 定位项目根目录， 方便jdtls识别
;;(setq lsp-auto-guess-root t)

;; lombok注解识别
;;(after! lsp-java
;;  (setq lsp-java-vmargs
;;        (list
;;         "-Xmx2G"
;;         (concat "-javaagent:" (expand-file-name "~/.local/share/lombok.jar"))
;;         (concat "-Xbootclasspath/a:" (expand-file-name "~/.local/share/lombok.jar")))))
;;(after! eglot
;;  ;; 强制让 JDTLS 使用 Java 21
;;  (setenv "JAVA_HOME" (expand-file-name "~/.sdkman/candidates/java/21.0.9-amzn"))
;;  (setenv "PATH" (concat (expand-file-name "~/.sdkman/candidates/java/21.0.9-amzn/bin:")
;;                         (getenv "PATH")))
;;
;;  (add-to-list 'eglot-server-programs
;;               '(java-mode
;;                 . ("jdtls"
;;                    "-vm" "~/.sdkman/candidates/java/21.0.9-amzn/bin/java"))))
;;
;;
;;
;;(add-hook 'prog-mode-hook' #'eglot-ensure)
;; Java LSP configuration with lsp-mode
(after! lsp-java
  ;; 设置jdtls的jdk环境
  (setq lsp-java-java-path "~/.sdkman/candidates/java/21.0.9-amzn/bin/java")

  ;; 定位项目根目录，方便jdtls识别
  (setq lsp-auto-guess-root t)

  ;; lombok注解识别
  (setq lsp-java-vmargs
        (list
         "-Xmx2G"
         (concat "-javaagent:" (expand-file-name "~/.local/share/lombok.jar"))
         (concat "-Xbootclasspath/a:" (expand-file-name "~/.local/share/lombok.jar"))))

  ;; 强制让 JDTLS 使用 Java 21
  (setenv "JAVA_HOME" (expand-file-name "~/.sdkman/candidates/java/21.0.9-amzn"))
  (setenv "PATH" (concat (expand-file-name "~/.sdkman/candidates/java/21.0.9-amzn/bin:")
                         (getenv "PATH"))))

;; General LSP configuration
(after! lsp-mode
  ;; General LSP settings
  (setq lsp-auto-guess-root t)
  (setq lsp-prefer-capf t)
  (setq lsp-completion-provider :capf)
  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 1000)
  (setq lsp-idle-delay 0.1)
  (setq lsp-log-io nil)  ; Set to t for debugging
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-document t)
  (setq lsp-semantic-highlighting t)
  (setq lsp-enable-snippet nil)
  (setq lsp-modeline-code-actions-enable t)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-links nil)
  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-enable-text-document-sync t)
  (setq lsp-restart 'auto-restart)
  (setq lsp-response-timeout 5))

;; 为所有编程模式启用 LSP，确保语法高亮和 LSP 功能正常工作
;; lsp-mode automatically enables LSP for supported languages

;; 确保字体锁定（语法高亮）在所有模式下启用
;;(global-font-lock-mode 1)
;;(setq font-lock-maximum-decoration t)

;; 函数折叠
(add-hook 'prog-mode-hook #'hs-minor-mode)

(map! "C-x t t" #'treemacs)

(after! treemacs
  (setq treemacs-width 55)
  (global-set-key (kbd "M-0") #'treemacs-select-window)
  (treemacs-follow-mode t)
  (setq treemacs-collapse-dirs 3)
  (treemacs-filewatch-mode t))


;; --- macOS terminal clipboard integration ------------------------------
(when (not (display-graphic-p))
  ;; 将 Emacs 的剪切/复制发送到 macOS 剪贴板
  (setq interprogram-cut-function
        (lambda (text &optional push)
          (let ((process-connection-type nil))
            (let ((proc (start-process "pbcopy" nil "pbcopy")))
              (process-send-string proc text)
              (process-send-eof proc)))))

  ;;;; 从 macOS 剪贴板粘贴到 Emacs
  ;;(setq interprogram-paste-function
  ;;      (lambda ()
  ;;        (let ((clip (shell-command-to-string "pbpaste")))
  ;;          ;; 去掉末尾的额外新行（可选）
  ;;          (when (string-suffix-p "\n" clip)
  ;;            (setq clip (substring clip 0 -1)))
  ;;          clip)))
  )
;; ----------------------------------------------------------------------
;; lsp-mode has different ways to handle document on type formatting
;; Use lsp-ui if you need this functionality
