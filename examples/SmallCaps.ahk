#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
return
!e::Clipboard := SmallCaps.encode(Clipboard)
!d::Clipboard := SmallCaps.decode(Clipboard)
return


Class SmallCaps extends CharsetTranslator{
    static __init__ := SmallCaps._initialise()
    static ByChar := true

    __New(){
        this.dict := SmallCaps.dict
    }

    _initialise(){
        this.dict := new COMDict()
        dcfa := []
        dcfa.Push({"key": "a", "val": "ᴀ"}
                , {"key": "b", "val": "ʙ"}
                , {"key": "c", "val": "ᴄ"}
                , {"key": "d", "val": "ᴅ"}
                , {"key": "e", "val": "ᴇ"}
                , {"key": "f", "val": "ꜰ"}
                , {"key": "g", "val": "ɢ"}
                , {"key": "h", "val": "ʜ"}
                , {"key": "i", "val": "ɪ"}
                , {"key": "j", "val": "ᴊ"}
                , {"key": "k", "val": "ᴋ"}
                , {"key": "l", "val": "ʟ"}
                , {"key": "m", "val": "ᴍ"}
                , {"key": "n", "val": "ɴ"}
                , {"key": "o", "val": "ᴏ"}
                , {"key": "p", "val": "ᴘ"}
                , {"key": "q", "val": "ǫ"}
                , {"key": "r", "val": "ʀ"}
                , {"key": "s", "val": "ꜱ"}
                , {"key": "t", "val": "ᴛ"}
                , {"key": "u", "val": "ᴜ"}
                , {"key": "v", "val": "ᴠ"}
                , {"key": "w", "val": "ᴡ"}
                , {"key": "x", "val": "ⅹ"}
                , {"key": "y", "val": "ʏ"}
                , {"key": "z", "val": "ᴢ"})
        dcfa.Push({"key": "A", "val": "ᴀ"}
                , {"key": "B", "val": "ʙ"}
                , {"key": "C", "val": "ᴄ"}
                , {"key": "D", "val": "ᴅ"}
                , {"key": "E", "val": "ᴇ"}
                , {"key": "F", "val": "ꜰ"}
                , {"key": "G", "val": "ɢ"}
                , {"key": "H", "val": "ʜ"}
                , {"key": "I", "val": "ɪ"}
                , {"key": "J", "val": "ᴊ"}
                , {"key": "K", "val": "ᴋ"}
                , {"key": "L", "val": "ʟ"}
                , {"key": "M", "val": "ᴍ"}
                , {"key": "N", "val": "ɴ"}
                , {"key": "O", "val": "ᴏ"}
                , {"key": "P", "val": "ᴘ"}
                , {"key": "Q", "val": "ǫ"}
                , {"key": "R", "val": "ʀ"}
                , {"key": "S", "val": "ꜱ"}
                , {"key": "T", "val": "ᴛ"}
                , {"key": "U", "val": "ᴜ"}
                , {"key": "V", "val": "ᴠ"}
                , {"key": "W", "val": "ᴡ"}
                , {"key": "X", "val": "ⅹ"}
                , {"key": "Y", "val": "ʏ"}
                , {"key": "Z", "val": "ᴢ"})
        this.dict.setAnew(dcfa)
        return, True
    }
}


#Include, %A_LineFile%/../../CharsetTranslator.ahk