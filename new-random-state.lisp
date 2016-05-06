;; ===================================================================
;; Create a new ACT-R random module which uses a random number
;; generated from Clozure Common Lisp (the Lisp implementation used to
;; create the MS Windows standalone ACT-R executable) to seed ACT-R's
;; PRNG.
;; ===================================================================

(defun create-random-module (ignore)
  (declare (ignore ignore))
  (let* ((state (make-mersenne-twister))
         (vec (coerce (ccl::random.mrg31k3p−state (make−random−state t)) 'simple-vector)))
    (init_by_array vec state)
    (make-act-r-random-module :state state)))

;; ===================================================================
;; Return a real-valued random number between max and min making sure
;; that random is passed a floating point to avoid integer only
;; results.
;; ===================================================================

(defun bounded-random (min max)
  (let ((delta (- max min)))
    (+ min (if (integerp delta)
               (act-r-random (* 1.0 delta))
             (act-r-random delta)))))

;; ===========
;; end of file
;; ===========
