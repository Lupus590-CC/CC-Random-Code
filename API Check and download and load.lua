--http://www.computercraft.info/forums2/index.php?/topic/24253-monitor-touchscreen-woes/page__view__findpost__p__228877
if not touchpoint then                                                                                -- If the touchpoint API isn't already loaded,
        if not (fs.exists("touchpoint") or fs.exists(shell.resolve("touchpoint"))) then                -- then if the file doesn't exist,
                shell.run("pastebin get pFHeia96 touchpoint")                                           -- download it to the current folder
                os.loadAPI(shell.resolve("touchpoint"))                                                 -- then load it.
        else os.loadAPI(fs.exists("touchpoint") and "touchpoint" or shell.resolve("touchpoint")) end   -- else load it from root or the current folder, whichever happens to contain it.
end