import QtQuick

pragma Singleton

QtObject
{
    property string resultString: ""

    function add(string) {resultString = string}

    function view() {return resultString}
}