(in-package #:climi)

(defclass standard-port (clim:basic-port)
  ((mirrored-sheet->current-pointer-cursor :initform (make-hash-table :test #'eq))))

(defmethod port-lookup-current-pointer-cursor ((port standard-port) sheet)
  (gethash sheet (slot-value port 'mirrored-sheet->current-pointer-cursor)))

(defmethod climb:set-sheet-pointer-cursor :before ((port standard-port) sheet cursor)
  (setf (gethash sheet (slot-value port 'mirrored-sheet->current-pointer-cursor)) cursor))




