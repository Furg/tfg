<script type="text/javascript" charset="UTF-8">
    function showComment(comment) {
        swal({
            title: "Comentario",
            text: comment,
            type: "info",
            confirmButtonText: "OK",
            closeOnConfirm: true
        });
    }

    window.onload = function showAlert() {

        if ('${completed}' === 'true') {
            swal({
                        title: "Control guardado",
                        type: "success",
                        confirmButtonText: "OK",
                        closeOnConfirm: true
                    });
        }

        if ('${gainExp}' === 'true') {
            swal({
                        title: "Control guardado",
                        type: "success",
                        confirmButtonText: "OK",
                        closeOnConfirm: false
                    },
                    function(){
                            swal({
                                title: "Controles de hoy",
                                html:  '<div class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2"> <div id="measuresExp" class="progress progress-striped active"> <div id="todaysMeasureBar" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${sizeTodaysMeasures*20}" aria-valuemin="0" aria-valuemax="100" style="width: ${(sizeTodaysMeasures-1)*20}%">${sizeTodaysMeasures}/5 <span class="sr-only"></span> </div> </div> </div> <br> <div class="col-xs-12 col-sm-12"> <p>Con cada uno de los 5 primeros controles del d\u00EDa que guardes ganar\u00E1s +5 de experiencia.</p> <br> </div>',
                                confirmButtonText: "OK",
                                closeOnConfirm: true,
                                animation: false
                            });

                        var todaysMeasureBar = $('#todaysMeasureBar');

                        $(function(){
                            $(todaysMeasureBar).each(function(){
                                bar_width = $(this).attr('aria-valuenow');
                                $(this).width(bar_width + '%');

                            });
                        });
                    });
        }
    }
</script>