<%--
  Created by IntelliJ IDEA.
  User: dheerajmadaan
  Date: 5/6/14
  Time: 11:14 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
    <script type="text/javascript" src="${resource(dir: "js",file: "jquery-1.8.2.min.js")}"></script>

    <script>
        $(document).ready(function(){
            var height=$(document.body).height()+100;
            var width=$(document.body).width()+100;
            parent.$.colorbox.resize({width:width, height:height});

        });
    </script>
</head>

<body>

    <table cellpadding="0" cellspacing="0" border="0">

        <tr>
            <td valign="top" width="10">
                <img src= "${resource(dir: 'images',file: 'crvBox2-tl.png')}"  height="12" width="10">
            </td>
            <td class="crvBox2-top">
            </td>
            <td valign="top" width="16">
                <img src="${resource(dir: 'images',file: 'crvBox2-tr.png')}" height="12" width="16">
            </td>
        </tr>
        <tr>
            <td class="crvBox2-left" width="100%">
            </td>
            <td class="crvBox2-bg">
                <table border="0" cellpadding="6" cellspacing="1" width="100%">
                    <tr>
                        <td colspan="4" class="hTextN15 grBborder " align="left">Confirmation</td>
                    </tr>
                </table>
            </td>
            <td class="crvBox2-right" width="100%">
            </td>
        </tr>
        <tr>
            <td class="crvBox2-left" width="100%">
            </td>
            <td class="crvBox2-bg">
                <table border="0" cellpadding="6" cellspacing="1" width="100%">
                  <tr>
                      <td class="tb_data">
                          Your request has been processed.
                      </td>
                  </tr>
                </table>
            </td>
            <td class="crvBox2-right" width="100%"></td>
        </tr>
        <tr>
            <td align="left" valign="bottom">
                <img src="${resource(dir: 'images',file: 'crvBox2-bl.png')}" height="17" width="10">
            </td>
            <td class="crvBox2-botom"></td>
            <td align="right" valign="bottom">
                <img src="${resource(dir: 'images',file: 'crvBox2-br.png')}" height="17" width="16">
            </td>
        </tr>


    </table>
    <table>
        <tr>
            <td>
               <input type="button" name="submit" class="new_buttonY" value="Close" onClick="javascript:parent.$.colorbox.close();">
            </td>

        </tr>
    </table>

</body>
</html>