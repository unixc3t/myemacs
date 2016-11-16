 (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'c-mode-common-hook 'google-set-c-style)


(quickrun-add-command "clang/cz"
                      '("c/clang" . ((:command . "clang")
                  (:exec    . ("%c -x c %o -o %e %s" "%e %a"))
                  (:compile-only . "%c -Wall -Werror %o -o %e %s")
                  (:remove  . ("%e"))
                  (:description . "Compile C file with llvm/clang and execute")))
                      :default "c")

(provide 'init-c)
