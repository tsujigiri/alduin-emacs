;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with <open> and enter text in its buffer.

(deftheme alduin "The Alduin theme for Emacs")

(defvar alduin-default-colors
  '(("alduin-bg"             . "#121212")
    ("alduin-fg"             . "#dfdfaf")
    ("alduin-black"          . "#1c1c1c")
    ("alduin-red"            . "#af1600")
    ("alduin-green"          . "#af5f00")
    ("alduin-yellow"         . "#878787")
    ("alduin-blue"           . "#af875f")
    ("alduin-magenta"        . "#875f5f")
    ("alduin-cyan"           . "#87afaf")
    ("alduin-white"          . "#dfdfaf")
    ("alduin-bold"           . "#ffffff")
    ("alduin-white-bright"   . "#ffdf87")
    ("alduin-magenta-bright" . "#af8787")
    ("alduin-black-bright"   . "#87875f")
    ("alduin-black-alt"      . "#262626")
    ; original color names
    ("orange"      . "#af875f")
    ("soft-orange" . "#dfaf87")
    ("dark-orange" . "#af5f00")
    ("soft-red"    . "#af8787")
    ("red"         . "#af5f5f")
    ("dark-red"    . "#875f5f")
    ("cyan"        . "#87afaf")
    ("grey"        . "#878787")
    ("green"       . "#87875f")
    ("soft-yellow" . "#dfdfaf")
    ("dark-grey"   . "#4e4e4e")))

(defmacro alduin-apply-colors (&rest body)
  `(let ((foo "bar")
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   alduin-default-colors))
     ,@body))

;; apply colors
(alduin-apply-colors
 (custom-theme-set-faces
  'alduin
  ;;;; default
  `(default ((t (:foreground ,soft-yellow :background ,alduin-black))))
  ;;;; strings
  `(font-lock-string-face ((t (:foreground ,alduin-white-bright
                               :background ,alduin-black-alt))))
  ;;;; functions
  `(font-lock-function-name-face ((t (:foreground ,dark-red))))
  ;;;; constants
  `(font-lock-type-face ((t (:foreground ,soft-red))))
  ;;;; comments
  `(font-lock-comment-face ((t (:foreground ,green))))
  `(font-lock-comment-delimiter-face ((t (:foreground ,green))))
  `(font-lock-doc-face ((t (:foreground ,green))))
  ;;;; keywords (if etc)
  `(font-lock-keyword-face ((t (:foreground ,grey))))
  ;;;; variables
  `(font-lock-variable-name-face ((t (:foreground ,cyan))))
  ;;;; mode line
  `(mode-line ((t (:foreground ,alduin-bg :background ,green :box t :overline nil))))
  `(mode-line-inactive ((t (:foreground ,green :background ,alduin-bg :box t :overline nil))))
  ;;;; fringe
  `(fringe ((t (:background ,alduin-black))))
  ;;;; hl line
  `(hl-line ((t (:background ,alduin-black-alt))))
  ;;;; dired
  `(dired-directory ((t (:foreground ,dark-red))))
  `(dired-symlink ((t (:foreground ,grey))))
  ;;;; magit
  `(magit-section-highlight ((t (:background ,alduin-black-alt))))
  `(magit-diff-file-heading-highlight ((t (:background ,alduin-black-alt))))
  `(magit-diff-context-highlight ((t (:background ,alduin-black-alt))))
  ;;;; links
  `(link ((t (:foreground ,red))))
  `(markdown-inline-code-face ((t (:foreground ,soft-orange))))
  `(markdown-header-face ((t (:foreground ,soft-orange))))
  `(markdown-header-delimiter-face ((t (:foreground ,soft-yellow))))
  `(line-number ((t (:foreground ,dark-grey
                     :background ,alduin-bg))))
  `(isearch ((t (:foreground ,soft-yellow
                 :background ,soft-red))))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'alduin)
