;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-dracula)
(setq doom-theme 'doom-molokai)
;; (setq doom-theme 'doom-monokai-classic)
;; (setq doom-theme 'doom-monokai-pro)
;; (setq doom-theme 'doom-monokai-machine)
;; (setq doom-theme 'doom-monokai-octagon)
;; (setq doom-theme 'doom-monokai-ristretto)
;; (setq doom-theme 'doom-monokai-spectrum)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; customize config.el

;; evil key binding
(evil-define-motion cy/evil-next-visual-line (count)
  "Move the cursor COUNT screen lines down, or 5."
  :type exclusive
  (let ((line-move-visual t))
  (evil-line-move (or count 5))))

(evil-define-motion cy/evil-previous-visual-line (count)
  "Move the cursor COUNT screen lines up, or 5."
  :type exclusive
  (let ((line-move-visual t))
  (evil-line-move (- (or count 5)))))

;; C-j C-k
(define-key evil-normal-state-map (kbd "C-j") '(lambda () (interactive) (evil-next-line 5)))
(define-key evil-normal-state-map (kbd "C-k") '(lambda () (interactive) (evil-next-line -5)))

(define-key evil-visual-state-map (kbd "C-j") 'cy/evil-next-visual-line)
(define-key evil-visual-state-map (kbd "C-k") 'cy/evil-previous-visual-line)

;; C-n mapping '*'
(define-key evil-normal-state-map (kbd "C-n") 'evil-ex-search-word-forward)

;; ,rn mapping rename symbol
(define-key evil-normal-state-map (kbd ",rn") 'tide-rename-symbol)

;; press `s'
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; treemacs
;; C-w C-w
(define-key evil-normal-state-map (kbd "C-w C-w") 'evil-window-next)

;; toggle (vim like)
(define-key evil-normal-state-map (kbd ", ,") '+treemacs/toggle)
