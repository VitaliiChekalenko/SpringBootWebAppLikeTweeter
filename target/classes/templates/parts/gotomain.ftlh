<#macro gototmain>
    <form action="/main" method="get">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Go to main"/>
    </form>
</#macro>