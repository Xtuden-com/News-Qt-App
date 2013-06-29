import QtQuick 1.1

Rectangle {
    signal backClicked();

    property string title: ""
    property string body: ""
    property string link: ""
    property string author: ""
    property string pubdate: ""
    property bool unread: false
    property bool starred: false


    Flickable {

        anchors.top: parent.top
        anchors.bottom: btnBack.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        flickableDirection: Flickable.VerticalFlick
        clip: true

        contentHeight: itemContent.height + 50

        Rectangle {
            width: parent.width
            height: 256

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#dddddd" }
                GradientStop { position: 0.33; color: "#ffffff" }
            }
        }

        Item {
            id: itemContent
            width: parent.width
            height: childrenRect.height


            Text {
                id: txtTitle
                text: title
                font.pointSize: 14
                font.bold: unread
                wrapMode: Text.Wrap
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 5
            }

            Item {
                id: titleRow
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: txtTitle.bottom

                height: childrenRect.height
                anchors.margins: 5
                Text {
                    id: txtAuthor
                    text: author
                    font.pointSize: 12
                    anchors.left: parent.left
                    width: parent.width / 3
                    clip: true
                    wrapMode: Text.WordWrap
                }

                Text {
                    id: txtPubDate
                    text: pubdate
                    font.pointSize: 12
                    anchors.right: parent.right
                    width: parent.width / 3
                    clip: true
                    wrapMode: Text.WordWrap
                }
            }


            Text {

                id: txtBody
                text: body
                font.pointSize: 12
                color: "#888888"
                wrapMode: Text.Wrap
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: titleRow.bottom
                anchors.margins: 5

            }
        }

    }

    PGZButton {
        id:btnBack
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10

        height: 100
        width: 200

        buttonText: "Back"

        onButtonClicked: {
            backClicked();
        }
    }


}