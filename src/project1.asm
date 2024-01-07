;;
;; Sample Code
;;
    ; Allow the Next paging and instructions
    DEVICE ZXSPECTRUMNEXT

    ; Generate a map file for use with Cspect
    CSPECTMAP "project1.map"

    org $8000


Start:
    ld  a,4          ; Set A to green
    out ($fe),a     ; Change the folder
    jr  $


;;
;; Set up the Next output
;;

    ; This sets the name of the project, the start address,
    ; and the initial stack pointer
    SAVENEX OPEN "project1.nex", Start, $ff40

    ; This asserts the minimum core version. Set it to the core version
    ; and the initial stack pointer
    SAVENEX CORE 2,0,0

    ; This sets the border color whi8le loading (in this case white)
    ; what to do with the file handle of the next file when starting (0 =
    ; close file handle as we're not going to access the project1.nex
    ; file after starting. See sjasmplus (0 = no, we set to default), and
    ; whether we require the full 2MB expansion (0 = no we don't).
    SAVENEX CFG 7,0,0,0

    ; Generate the #Nex File automatically based on which pages you use.
    SAVENEX AUTO

