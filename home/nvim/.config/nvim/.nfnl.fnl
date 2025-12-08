;; By default, the Fennel compiler employs a compiler sandbox in your macro modules. 
;; This means you can't refer to any free global variables such a vim.
;; You can either prefix each of these globals with _G like _G.vim.g.some_var 
;; or you can turn off the relevant sandboxing rules. One approach is to set
;; the compiler environment to _G instead of Fennel's sanitised environment. You can 
;; do that with the following .nfnl.fnl file.
{:verbose true :compiler-options {:compiler-env _G}
 :source-file-patterns ["fnl/*.fnl" "fnl/**/*.fnl"]}
