;; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(defun toggle-full-screen ()
  "Toggles full-screen mode for Emacs window on Win32."
  (interactive)
  (shell-command "emacs_fullscreen.exe"))

(defun toggle-bars ()
  "Toggles bars visibility."
  (interactive)
  (menu-bar-mode)
  (tool-bar-mode)
  (scroll-bar-mode))

(defun toggle-full-screen-and-bars ()
  "Toggles full-screen mode and bars."
  (interactive)
  (toggle-bars)
  (toggle-full-screen))

;; Use F11 to switch between windowed and full-screen modes
(global-set-key [f11] 'toggle-full-screen-and-bars)

;; Switch to full-screen mode during startup
(toggle-full-screen-and-bars)
