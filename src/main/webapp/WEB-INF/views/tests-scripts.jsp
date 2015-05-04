<script type="text/javascript" charset="UTF-8">
    window.onload = function showAlert() {
        if ('${completed}') {
            swal({
                        title: "Test completado",
                        text: "\u00A1Buen trabajo!",
                        type: "success",
                        confirmButtonText: "OK",
                        closeOnConfirm: false
                    },
                    function(){
                        swal({
                            title: '+50 de experiencia',
                            html:  '<div class="progress progress-striped active"> <div id="firstBar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${actualExp}" aria-valuemin="0" aria-valuemax="100" style="width: ${preExp}%"> <span class="sr-only"></span> </div> </div> <div id="containerSecondBar" class="progress progress-striped active" style="visibility: hidden;"> <div id="secondBar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${actualExp}" aria-valuemin="0" aria-valuemax="100" style="width: 0%"> <span class="sr-only"></span> </div> </div>',
                            type: "success",
                            confirmButtonText: "OK",
                            closeOnConfirm: true
                        });

                        var firstBar = $('#firstBar');
                        var secondBar = $('#secondBar');
                        var containerSecondBar = $('#containerSecondBar');

                        var FunctionOne = function () {
                            // create a deferred object
                            var r = $.Deferred();

                            // do whatever you want (e.g. ajax/animations other asyc tasks)
                            $(firstBar).width(100 + '%');

                            setTimeout(function () {
                                // and call `resolve` on the deferred object, once you're done
                                r.resolve();
                            }, 500);

                            // return the deferred object
                            return r;
                        };

                        // define FunctionTwo as needed
                        var FunctionTwo = function () {
                            $(firstBar).text("\u00A1Has subido de nivel!");
                            $(containerSecondBar).css('visibility', 'visible');
                            $(secondBar).width(${actualExp} + '%');

                        };

                        $(function(){
                            $(firstBar).each(function(){
                                if('${actualExp}' > '${preExp}'){
                                    bar_width = $(this).attr('aria-valuenow');
                                    $(this).width(bar_width + '%');
                                }else{
                                    FunctionOne().done(FunctionTwo);
                                }
                            });
                        });
                });
        }
    }


</script>
