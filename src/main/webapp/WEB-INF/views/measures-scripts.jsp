<script src="/static/bootstrap/js/bootstrap-datetimepicker.js"></script>
<script src="/static/bootstrap/js/bootstrap-datetimepicker.es.js"></script>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        format: "dd-mm-yyyy",
        autoclose: true,
        language: "es",
        endDate: new Date(),
        minView: 2
    });
</script>

<script type="text/javascript">


    function cleanFilter() {
        $('#clearButton').hide();
        $('#alertDayEmpty').hide();
        $('#datefilter').val('');
        $('.list-group-item').each(function(){
            $(this).show();
        });
    }

    $('#datefilter').change( function() {
        var text = $('#datefilter').val();

        $('#clearButton').show();

        var allHidden = true;

        $('.list-group-item').each(function(){
            if($(this).find('.list-group-item-heading').text().indexOf(text) < 0){
                $(this).hide();
            }
            else {
                $(this).show();
                allHidden = false;
            }
        });

        if(allHidden){
            $('#alertDayEmpty').show();
        }
        else{
            $('#alertDayEmpty').hide();
        }

    })

    function showComment(comment) {
        swal({
            title: "Comentario",
            text: comment,
            type: "info",
            confirmButtonText: "OK",
            closeOnConfirm: true
        });
    }

</script>
