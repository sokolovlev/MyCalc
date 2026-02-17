import QtQuick

pragma Singleton

QtObject
{
    property string last3symbolsServicingString: ""
    function last3(sym)
    {
        last3symbolsServicingString += sym
        if (last3symbolsServicingString.length > 3)
            last3symbolsServicingString = last3symbolsServicingString.slice(last3symbolsServicingString.length - 3)
    }

    function view()
    {
        return last3symbolsServicingString
    }
}