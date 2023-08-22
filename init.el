(message "hello nico")


;;; Code:

;; toggle to diagnose startup issues. FIXME: read cli/env values
;; ref. https://github.com/purcell/emacs.d/blob/master/init.el#L9C14-L9C14
;; 
;;(setq debug-on-error t)


;; 29.1 is the recent release at the time of this writing
;; ref. https://github.com/purcell/emacs.d/blob/master/init.el#L12
(let ((minver "29.1"))
  (when (version< emacs-version minver)
    (error "This Emacs release is too old -- this config requires v%s or higher" minver)))

;; ref. https://github.com/purcell/emacs.d/blob/master/init.el#L18
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; timu theme
;(load-theme 'timu-macos t)
;(load-theme 'twilight t)
;(load-theme 'zenburn t)
(load-theme 'twilight-bright t)

;; be able to write umlaute
(setq ns-alternate-modifier 'none
      ns-right-alternate-modifier 'meta)

;; set font size
(set-face-attribute 'default nil :height 130)

;; minimize emacs ui
; To disable the menu bar, place the following line in your .emacs file:
(menu-bar-mode -1)
; To disable the scrollbar, use the following line:
(scroll-bar-mode -1)
; To disable the toolbar, use the following line:
(tool-bar-mode -1) 

;; ref. https://github.com/purcell/emacs.d/blob/master/init.el#L19
;; FIXME: look at the init-benchmarking.el file and adapt it
;;(require 'init-benchmarking) 

;; FIXME: evaluate if it wouldn't make more sense to introduce a proper
;; system-type config / flag system:w

;; ref. https://github.com/purcell/emacs.d/blob/master/init.el#L22C1-L22C47
(defconst *is-a-mac* (eq system-type 'darwin))

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;;(package-refresh-contents)

;; todo: put to /lisp folder
;; pixel-based scroll with bezier scrolling dynamics
(add-to-list 'load-path "~/code/good-scroll.el")
(require 'good-scroll)
(good-scroll-mode 1)

;; sidebar
(require 'neotree)

;; all the icons(when (display-graphic-p)
(when (display-graphic-p)
  (require 'all-the-icons))

;; make sidebar (neotree) show nice icons
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; package.el
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons neotree twilight-bright-theme zenburn-theme twilight-theme timu-macos-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; teach emacs proper text editing
(evil-mode 1)

;(add-to-list 'load-path (expand-file-name "fullscreen.el"))
(toggle-frame-fullscreen)
