Class CharsetTranslator{


    /**
        * Static Attribute: __init__
        *   used for automatic initialisation of 
        *   derived static classes. To be used with a
        *   a customised _initialise() method.
        * Note:
        *   __init__ should be set true to mark itself as initialised
    */
    ;static __init__ := DerivedClassName._initialise()


    /**
        * Method: __New(dict)
        *   creates a new CharsetTranslator instance
        *   with the handed dict as dictionary 
        * Params:
        *   dict:   An instance of the COMDict class
        *               to be used for translation
        * Return:
        *   the newly created instance or false in case
        *   case the dict isn't an COMDict instance
    */
    __New(dict){
        if(!COMDict.isCOMDict(dict))
            return, ""
        this.dict := dict
    }


    /**
        * Method: encode(sequence)
        *   encodes the given sequence using its classes dict
        * Params:
        *   sequence:   the sequence to be encoded
        * Return:
        *   the encoded sequence
    */
    encode(sequence){
        return, this._translator(sequence, this.dict, this.byChar)
    }


    /**
        * Method: decode(sequence)
        *   decodes the given sequence using its classes dict inverted
        * Params:
        *   sequence:   the sequence to be decoded
        * Return:
        *   the decoded sequence
    */
    decode(sequence){
        return, this._translator(sequence, this.dict.invert(), this.byChar)
    }


    /**
        * Method: _translator(sequence, dict, byChar := "")
        *   decides which translator method to use
        * Params:
        *   sequence:   the sequence to be de- / encoded
        *   dict:       the dict to use for the translation
        *   byChar:     whether to use byChar method
        * Return:
        *   the de- / encoded sequence
    */
    _translator(sequence, dict, byChar := ""){
        return, this["__Translator" . ((byChar) ? "ByChar" : "")](sequence, dict)
    }


    /**
        * Method: __Translator(sequence, dict)
        *   translates using RegExReplace to replace
        * Params:
        *   sequence:   the sequence to be de- / encoded
        *   dict:       the dict to use for the translation
        * Return:
        *   the de- / encoded sequence
    */
    __Translator(sequence, dict){
        for k, v in dict
            sequence := RegExReplace(sequence, k, v)
        return, sequence
    }


    /**
        * Method: __TranslatorByChar(sequence, dict)
        *   translates by evaluating every char individually
        * Params:
        *   sequence:   the sequence to be de- / encoded
        *   dict:       the dict to use for the translation
        * Return:
        *   the de- / encoded sequence
    */
    __TranslatorByChar(sequence, dict){
        for _, v in StrSplit(sequence){
            r .= ((dict.exists(v)) ? (dict.item(v)) : v)
        }
        return, r
    }


    /**
        * Method: _initialise()
        *   Implement this method along with a
        *   static __init__ := DerivedClassName._initialise()
        *   within the class itself to build a static translator
        * Params: As you like/need
        * Return:
        *   True to signalise that the static class has been initialised
    */
    _initialise(){
        ;your code to create a dict for a static derivate of CharsetTranslator Class
    }


}


#Include, %A_LineFile%/../lib/COMDict/COMDict.ahk