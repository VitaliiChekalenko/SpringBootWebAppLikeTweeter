<#macro gototmain>
    <form action="/main" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Go to main"/>
    </form>
</#macro>