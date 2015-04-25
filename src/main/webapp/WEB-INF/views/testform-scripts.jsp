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
