<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>



<@c.page>
      <font size="21" color="#8b0000">Add new user</font> <br>
<br>
    ${message!}
<br>
    <@l.login "/registratio n" />
</@c.page>