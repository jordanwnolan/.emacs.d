;;; package --- Redis
;;; Commentary:
;;;  Functions that interface with redis.

;;; Code:

(defvar redis-buffer)
(setq redis-buffer "*redis*")

(defun start-redis ()
  "Open a shell and start a redis server."
  (interactive)
  (shell redis-buffer)
  (insert "cd ~")
  (comint-send-input)
  (insert "source ~/.bash_profile;")
  (comint-send-input)
  (insert "redis")
  (comint-send-input))

;; TODO:
;; Look into making it so we don't have a confirmation
;; prompt in order to kill the active processes
(defun stop-redis ()
  "Stop any currently running redis processes."
  (interactive)
  (switch-to-buffer redis-buffer)
  (comint-interrupt-subjob)
  (insert "exit")
  (comint-send-input)
  (kill-buffer redis-buffer))

(provide 'redis)
;;; redis.el ends here
