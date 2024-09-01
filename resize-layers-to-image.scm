(define (script-fu-resize-layers-to-image img)
  (let* ((num-layers (car (gimp-image-get-layers img)))
         (layers (cadr (gimp-image-get-layers img))))
    (while (> num-layers 0)
      (let* ((layer (vector-ref layers (- num-layers 1))))
        (gimp-layer-resize-to-image-size layer))
      (set! num-layers (- num-layers 1))))
  (gimp-displays-flush))

(script-fu-register
 "script-fu-resize-layers-to-image"
 "Resize Layers to Image Size"
 "Resize all layers to the size of the image."
 "sanjeyac"
 "sanjeyac"
 "2024"
 "RGB*, GRAY*"
 SF-IMAGE "Image" 0)

(script-fu-menu-register "script-fu-resize-layers-to-image" "<Image>/Layer")

