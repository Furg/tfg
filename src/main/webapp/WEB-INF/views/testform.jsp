
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Test Form</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="/static/dynamic_list_helper2.js" type="text/javascript"></script>
</head>
<body>

<h3>Creación de un test</h3>
<c:set var="method" value="POST"/>
<c:set var="action" value="/tests"/>

<form:form method="${method}" action="${action}" modelAttribute="test" id="questionListForm">
    <table>
        <tr>
            <td><form:label path="name">Nombre:</form:label></td>
            <td><form:input path="name"/> <i><form:errors path="name"></form:errors></i></td>
        </tr>

        <tr>


            <td>Tema:</td>
            <td>
                <form:select path="type">
                <form:option value="" label="" />
                <form:options items="${types}" />
                </form:select>
            </td>
            <td><i><form:errors path="type"></form:errors></i></td>


        </tr>

        <tr>
            <td><form:label path="description">Descripción:</form:label></td>
            <td><form:input path="description"/> <i><form:errors path="description"></form:errors></i></td>
        </tr>
    </table>


    <table>
        <thead>
        <tr>
            <th>Question</th>
            <th>Answer</th>
            <th></th>
        </tr>
        </thead>
        <tbody id="questionListContainer">
        <c:if test="${test.questions.size() == 0}">
            <tr class="qtest defaultRow">
                <td><input type="text" name="questions[].question" value="" /></td>
                <td><select name="questions[].answer">
                    <option value="Verdadero">Verdadero</option>
                    <option value="Falso">Falso</option>
                </select></td>
                <td><a href="#" class="removeQuestion">Remove Question</a></td>
            </tr>
        </c:if>
        </tbody>
        </table>

        <a href="#" id="addQuestion">Add Question</a>&nbsp;&nbsp;
    <input type="submit" value="Guardar Test" id="submit"/>
        </form:form>


        <script type="text/javascript">
        function rowAdded(rowElement) {
            //clear the imput fields for the row
            $(rowElement).find("input").val('');
            //may want to reset <select> options etc

    }


    $(document).ready( function() {
        var config = {
            rowClass : 'qtest',
            addRowId : 'addQuestion',
            removeRowClass : 'removeQuestion',
            formId : 'questionListForm',
            rowContainerId : 'questionListContainer',
            indexedPropertyName : 'questions',
            indexedPropertyMemberNames : 'question,answer',
            rowAddedListener : rowAdded
        };
        new DynamicListHelper(config);
    });
</script>

</body>
</html>