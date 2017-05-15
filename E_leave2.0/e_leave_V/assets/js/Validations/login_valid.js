/*
Author : Agaile
25/03/2017
Custom login validation script
*/

var Login = function () {

    var runLoginValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                username: {
                    minlength: 2,
                    required: true
                },
                password: {
                    minlength: 4,
                    maxlength: 30,
                    required: true
                }
            },
            submitHandler: function (form) {
                errorHandler.hide();
                form.submit();
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                errorHandler.show();
            }
        });
    };
    return {
        //main function to initiate template pages
        init: function () {
            runLoginValidator();
        }
    };
}();