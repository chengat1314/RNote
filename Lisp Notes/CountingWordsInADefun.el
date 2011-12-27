;; Copyright (C) 2011 Richard Wong

;; Time-stamp: <2011-12-27 14:15:25 Tuesday by richard>

;; Author: Richard Wong
;; Email: chao787@gmail.com

;; Version: 0.1a
;; PUBLIC LICENSE: GPLv3
(defun count-words-in-defun()
  "Documentation..."
  (beginning-of-defun)
  (let ((count 0)
        (search-keyword "\\(\\w\\|\\s_\\)+[^ \t\n]*[ \t\n]*")
        (end (save-excursion (end-of-defun) (point))))
    (while (and (< (point) end)
                (re-search-forward search-keyword end t))
      (setq count (1+ count)))
    count))

(defun count-words-defun()
  "Documentation..."
  (interactive)
  (message "Counting words and symbols in a definition.")
  (let ((count (count-words-in-defun)))
    (cond
     ((zerop count)
      (message
       "The definition does NOT have any words or symbols."))
     ((= 1 count)
      (message
       "The definition has 1 word or symbol."))
     (t
      (message
       "The definition has %d words or symbols." count)))
    ))


(global-key-binding "\C-=" 'count-words-defun)

(defun lengths-list-file(filename)
  "Documentation..."
  (message "Working on '%s' ..." filename)
  (save-excursion
    (let ((buffer (find-file-noselect filename))
          (lengths-list))
      (set-buffer buffer)
      (setq buffer-read-only t)
      (widen)
      (goto-char (point-min))
      (while (re-search-forward "^(defun" nil t )
        (setq lengths-list
              (cons (count-words-in-defun) lengths-list)))
      (kill-buffer buffer)
      lengths-list)))


(lengths-list-file "/home/richard/emacs-dev/settings/autopair.el")

(defun lengths-list-many-files(list-of-files)
  "Documentation..."
  (let (lengths-list)
    (while list-of-files
      (setq lengths-list
            (append lengths-list
                    (lengths-list-file
                     (expand-file-name (car list-of-files)))))
      (setq list-of-files (cdr list-of-files)))
    lenths-list))

(append '(1 2 3) '(3))

(defun multiply-by-seven (number)
  "Multiply NUMBER by seven."
  (* 7 number))

(sort '(4 5 6 12 45 11 446 221 ) '<)

(4 5 6 11 12 45 221 446)

(sort '(4 5 6 12 45 11 446 221 ) '>)

(446 221 45 12 11 6 5 4)

(defun line-graph-print-rectangle-version(number-list &optional mark)
  "Documentation..."

  (car number-list)
)
;; Donot using insert-rectangle function to print lines.
(defun line-graph-print(number-list &optional mark)
  "Print a line graph version...."
  (interactive "e") ;; x to require A list value..  
  (or mark (setq mark "|"))
  (let ((number)(temp-list) (max-num (apply 'max number-list)))
    ;; Build maximum number-list. 
    (while (not (= max-num 0))
      ;; process the max-num to become less one.
      (setq temp-list number-list)
      (while temp-list
        (setq number (car temp-list))
        (if (<= max-num number)
            (insert-string mark)
          (insert-string " "))
        (insert-string " ")
        (setq temp-list (cdr temp-list)))
      (insert-string "\n")
      (setq max-num (1- max-num)))
    (insert-list number-list)))


(defun insert-list(list)
  "function to insert a list."
  (interactive "e")
  (while list
    (insert-string (car list) " ")
    (setq list (cdr list))))


