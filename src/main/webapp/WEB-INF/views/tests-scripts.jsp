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
                            html:  '<br/> <div class="text-center levelCircle" style="margin:0 auto;">${level}</div> <br/> <br/> <br/> <div id="containerFirstBar" class="progress progress-striped active"> <div id="firstBar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${actualExp}" aria-valuemin="0" aria-valuemax="100" style="width: ${preExp}%"> <span class="sr-only"></span> </div> </div> <div id="containerSecondBar" class="progress progress-striped active" style="display: none;"> <div id="secondBar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${actualExp}" aria-valuemin="0" aria-valuemax="100" style="width: 0%"> <span class="sr-only"></span> </div> </div> <p>+50 de experiencia</p>',
                            confirmButtonText: "OK",
                            closeOnConfirm: true,
                            animation: false
                        });

                        var firstBar = $('#firstBar');
                        var secondBar = $('#secondBar');
                        var containerFirstBar = $('#containerFirstBar');
                        var containerSecondBar = $('#containerSecondBar');
                        var levelCircle = $('.levelCircle');

                        var FunctionOne = function () {
                            // create a deferred object
                            var r = $.Deferred();

                            // do whatever you want (e.g. ajax/animations other asyc tasks)
                            $(firstBar).width(100 + '%');

                            setTimeout(function () {
                                // and call `resolve` on the deferred object, once you're done
                                r.resolve();
                            }, 1000);

                            // return the deferred object
                            return r;
                        };

                        // define FunctionTwo as needed
                        var FunctionTwo = function () {
                            $(containerFirstBar).hide();
                            $(levelCircle).fadeOut(700);

                            setTimeout(
                                    function()
                                    {
                                        $(levelCircle).text(${level}+1);
                                        $(levelCircle).fadeIn("slow","swing");

                                    }, 700);
                            setTimeout(
                                    function()
                                    {
                                        $(containerSecondBar).show();
                                        $(secondBar).width(${actualExp} + '%');

                                    }, 400);
                        };

                        var FunctionTree = function () {
                            $(containerFirstBar).hide();
                            $(levelCircle).fadeOut(700);

                            setTimeout(
                                    function()
                                    {
                                        $(levelCircle).text(${level}+1);
                                        $(levelCircle).fadeIn("slow","swing");

                                    }, 700);

                            setTimeout(
                                    function()
                                    {
                                        $(containerSecondBar).show();
                                        $(secondBar).width('0' + '%');

                                    }, 400);
                        };

                        $(function(){
                            $(firstBar).each(function(){
                                if('${actualExp}' == 100){
                                    FunctionOne().done(FunctionTree);
                                }
                                else if('${actualExp}' > '${preExp}'){
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
