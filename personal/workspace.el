;;; package --- Workspace
;;; Commentary:
;;;  Functions that interface with workspace.

;;; Code:

(defvar workspace-buffer)
(setq workspace-buffer "*workspace-launcher*")

(defun workspace-open-app (app)
  "Start a shell and open the given APP."
  (interactive)
  ;; Initialize workspace buffer (shell)
  (if (get-buffer workspace-buffer)
      (switch-to-buffer workspace-buffer)
    (progn
      (shell workspace-buffer)
      (insert "cd ~")
      (comint-send-input)
      (insert "source ~/.bash_profile;")
      (comint-send-input)))

  (insert "open " app)
  (comint-send-input))

(defun workspace-open-slack ()
  "Opens Slack."
  (interactive)
  (workspace-open-app "/Applications/Slack.app/"))

(defun workspace-open-airmail ()
  "Opens Airmail."
  (interactive)
  (workspace-open-app "/Applications/Airmail.app/"))

(defun workspace-initialize ()
  "Opens all apps in my workspace."
  (interactive)
  (workspace-open-slack)
  (workspace-open-airmail))

(provide 'workspace)
;;; workspace.el ends here
