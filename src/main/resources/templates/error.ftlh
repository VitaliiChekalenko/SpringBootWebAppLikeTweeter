<#import "parts/common.ftlh" as c>
<#import "parts/gotomain.ftlh" as g>
<#import "parts/login.ftlh" as l>
<@c.page>
    <style>
        .text {
            font-size: 30pt;
            color: maroon;
            text-align:  center;
        }
        body {
            background: url(img/error.jpg) no-repeat;
            -moz-background-size: 100%; /* Firefox 3.6+ */
            -webkit-background-size: 100%; /* Safari 3.1+ и Chrome 4.0+ */
            -o-background-size: 100%; /* Opera 9.6+ */
            background-size: 100%; /* Современные браузеры */
        }
    </style>
    <@g.gototmain/> <br><@l.logout/><br>
    <div class="text"><p>Shit happens, check your code!!</p></div>

</@c.page>