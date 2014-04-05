

;;(add-to-list 'load-path "/path/to/rspec-mode")
;;(require 'rspec-mode)

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

(global-set-key (kbd "M-1") "|")
(global-set-key (kbd "M-2") "@")
(global-set-key (kbd "M-3") "#")
(global-set-key (kbd "M-º") "\\")
(global-set-key (kbd "M-ç") "}")
(global-set-key (kbd "M-+") "]")
(global-set-key (kbd "M-ñ") "~")


(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-ruby starter-kit-bindings starter-kit-js starter-kit-eshell magit)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/zenburn-theme-1.5/")
(load-theme 'zenburn t)
;; (load-theme 'zenburn t)

;;(require 'magit)


(add-to-list 'load-path "~/.emacs.d/elpa/textmate-4/textmate.el")
(require 'textmate)
(textmate-mode)


;; (global-linum-mode 1)

;; (add-to-list 'load-path "~/.emacs.d/elpa/ruby-complexity/")

;; (require 'linum)
;; (require 'ruby-complexity)
;; (add-hook 'ruby-mode-hook
;;           (function (lambda ()
;;                       (flymake-mode)
;;                       (linum-mode)
;;                       (ruby-complexity-mode))))

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/plugins/yasnippet/extras/imported"))
(yas/global-mode 1)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'rvm)
;; (rvm-activate-corresponding-ruby)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(require 'rspec-mode)
(define-key rspec-mode-verifible-keymap (kbd "s") 'rspec-verify-single)

;; (defun arrange-frame (w h x y)
;;   "Set the width, height, and x/y position of the current frame"
;;   (let ((frame (selected-frame)))
;;     (delete-other-windows)
;;     (set-frame-position frame x y)
;;     (set-frame-size frame w h)))


;; (arrange-frame 160 55 2 22)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(compile-command "rspec /Users/hector/apps/sponge/spec --options /Users/hector/apps/sponge/.rspec")
 '(cua-mode t nil (cua-base))
 '(exec-path (quote ("/Users/hector/.rvm/gems/ruby-2.0.0-p247@cloudsponge/bin" "/Users/hector/.rvm/gems/ruby-2.0.0-p247@global/bin" "/Users/hector/.rvm/gems/ruby-2.0.0-p247/bin" "/Users/hector/.rvm/rubies/ruby-2.0.0-p247/bin/" "/Users/hector/.rvm/gems/ruby-2.0.0-p247@cloudsponge/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin")))
 '(explicit-bash-args (quote ("--noediting" "-i")))
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(markdown-command "bundle exec markdown")
 '(rspec-rake-command "")
 '(rspec-spec-command "rspec")
 '(rspec-use-bundler-when-possible nil)
 '(rspec-use-opts-file-when-available t)
 '(rspec-use-rake-flag nil)
 '(rspec-use-rvm t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (whitespace-line-column . 80) (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'multi-term)
(setq multi-term-program "/bin/sh")

(setq ffap-machine-p-known 'reject)

(add-to-list 'load-path
              "~/.emacs.d/plugins/")
(require 'git-messenger)
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-engines-alist
      '(("erb"    . "\\.rhtml\\'"))
)

;; (defun seeing-is-believing ()
;;   "Replace the current region (or the whole buffer, if none) with the output
;; of seeing_is_believing."
;;   (interactive)
;;   (let ((beg (if (region-active-p) (region-beginning) (point-min)))
;;         (end (if (region-active-p) (region-end) (point-max))))
;;     (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))

(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)
;; (highlight-tabs)
;; (highlight-trailing-whitespace)
