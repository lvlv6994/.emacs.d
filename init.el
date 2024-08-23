(message "Loading ~/.emacs.d/init.el started")
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(save-place-mode 1)
(electric-pair-mode 1)

(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)
(setq make-backup-files nil)

(setq frame-title-format '("%b – Emacs")
      icon-title-format frame-title-format)
(setq-default cursor-type 'bar)
(setq-default resize-mini-windows t)
(setq-default display-line-numbers-type nil)
(setq-default truncate-lines t)
(setq-default scroll-step 3)
(setq-default show-trailing-whitespace nil)
;;(visual-line-mode 1)

(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)

(set-fringe-mode 1)
(set-frame-parameter nil 'minimal t)
(setq-default fringe-mode 'no-fringes)
(setq-default initial-major-mode 'org-mode)

(setq-default large-file-warning-threshold 500000000)
;;(setq-default mode-line-format nil)

(setq-default term-kill-buffer-on-exit t)
(setq dired-guess-shell-alist-user '(
                                     ("\\.mp4\\'" "mpv --quiet --loop=yes")
                                     ("\\.mp3\\'" "ffplay -loglevel 8 -loop 0")
                                     ("\\.wav\\'" "ffplay -loglevel 8 -loop 0")
                                     ("\\.mov\\'" "mpv --quiet --loop=yes")
                                     ("\\.webm\\'" "mpv --quiet --loop=yes")
                                     ("\\.jpg\\'" "mpv --quiet --loop=yes")
                                     ("\\.png\\'" "mpv --quiet --loop=yes")
                                     ("\\.gif\\'" "mpv --quiet --loop=yes")
                                     ("\\.jpeg\\'" "mpv --quiet --loop=yes")
                                     ("." "open -a Google\\ Chrome")
                                     ))
(setq default-input-method nil)

(setq dired-listing-switches "-alh")

(global-set-key (kbd "C-x C-c") 'server-edit)
(global-set-key (kbd "C-x K") 'kill-current-buffer)
;;(global-set-key (kbd "C-h") 'delete-backward-char) 
(global-set-key (kbd "C-u") 'kill-whole-line)
(global-set-key (kbd "C-x C-o") 'overwrite-mode)
(global-set-key (kbd "C-@") 'set-mark-command)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(defun adjust-opacity (frame incr)
  "Adjust the opacity of the FRAME by increment INCR."
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         (newalpha (min 100 (max 0 (+ incr oldalpha)))))
    (modify-frame-parameters frame (list (cons 'alpha newalpha)))))

(global-set-key (kbd "s-[")
                (lambda () (interactive) (adjust-opacity nil 5)))
(global-set-key (kbd "s-]")
                (lambda () (interactive) (adjust-opacity nil -5)))

(global-set-key (kbd "C-s-,") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))

(defun c_w_redefine()                   
  "delele word or region depending on the mode"
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning)(region-end))
    (backward-kill-word 1)
      )
  )

(global-set-key (kbd "C-w") 'c_w_redefine)


(defun m_w_redefine()
  "copy current line or region"
  (interactive)
  (if (use-region-p)
      (progn
        (kill-ring-save (region-beginning) (region-end))
        )
    (progn
      (kill-ring-save (line-beginning-position) (line-end-position))
      (move-end-of-line 1)
      (newline 1)
      (move-beginning-of-line 1)
      (yank)
      )
    )
  )

(global-set-key (kbd "M-w") 'm_w_redefine)

;;(global-set-key (kbd "C-@") 'rectangle-mark-mode)
(global-set-key (kbd "C-<tab>") 'tab-next)
(global-set-key (kbd "s-<escape>") 'next-window-any-frame)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)

(global-set-key (kbd "s-w") 'delete-frame)
(global-set-key (kbd "s-n") 'make-frame-command)

(global-set-key (kbd "s-{") 'tab-previous)
(global-set-key (kbd "s-}") 'tab-next)
(global-set-key (kbd "s-t") 'term)
(global-set-key (kbd "s-e") 'eshell)

(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("91c008faf603a28d026957120a5a924a3c8fff0e12331abf5e04c0e9dd310c65" "0ed3d96a506b89c1029a1ed904b11b5adcebeb2e0c16098c99c0ad95cb124729" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "b6c43bb2aea78890cf6bd4a970e6e0277d2daf0075272817ea8bb53f9c6a7f0a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "d8bcb88ef0a3259a38d6deba78e569c0750ebfede82ad3e6da16573419fef48c" "8122fb61548fe36171d9cf24cdb9b5f24d053b626d4cda739c3815e080623209" default))
 '(package-selected-packages
   '(markdown-mode pdf-tools scala-mode which-key standard-themes web-mode kotlin-mode typescript-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:font "Courier New-20")))))
;; 设置默认字体

;; ;; 设置注释外观
;; (custom-set-faces
;;  '(font-lock-comment-face ((t (:slant italic :foreground "gray")))))
;; ;; 设置关键字外观
;; (custom-set-faces
;;  '(font-lock-keyword-face ((t (:weight bold :foreground "yellow")))))
;; ;; 设置字符串外观
;; (custom-set-faces
;;  '(font-lock-string-face ((t (:foreground "red")))))

(setq-default line-spacing 0)
(when (member "Songti SC" (font-family-list))
  (set-fontset-font t 'han (font-spec :family "Songti SC" :size 20)))


(message "Loading ~/.emacs.d/init.el completed")
(put 'list-threads 'disabled nil)
(put 'set-goal-column 'disabled nil)


(pdf-tools-install)
(put 'dired-find-alternate-file 'disabled nil)
