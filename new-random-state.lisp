
(defun create-random-module (ignore)
  (declare (ignore ignore))
  (let* ((state (make-mersenne-twister))
         (list (coerce (ccl::random.mrg31k3p-state (make-random-state t)) 'list))
         (vector (coerce list 'vector)))

    (init_by_array vector state)

    (make-act-r-random-module :state state)))


