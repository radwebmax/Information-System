$(document).ready(function () {
    //Create user with ajax
    $('.real-registration').on('submit', function (event) {
        $('#loading').show();
        $.ajax({
            data: {
                fullname: $('#fullname').val(),
                username: $('#username').val(),
                password: $('#password').val(),
                email: $('#email').val()
            },
            type: 'POST',
            url: '/signup'
        })
            .done(function (data) {
                if (data.error) {
                    $('#errorAlert').text(data.error).show();
                    $('#successAlert').hide();
                    $('#loading').hide();
                }
                else {
                    $('#successAlert').text(data.name).show();
                    $('#errorAlert').hide();
                    //    $('#loading').hide();
                    setTimeout(() => {
                        $('#login').addClass('disabled');
                        $('#user-wrapper').addClass('active');
                        localStorage.setItem('user_type', 'user');
                        localStorage.setItem('user_name', $('#username').val());
                        $('.user-wrapper').innerHTML = `Welcome, ${localStorage.getItem('user_name')} !`;
                    }, 1000)

                }

            });
        event.preventDefault();
    });


    //Ajax func for post requests
    let ajax_post = (data) => {
        $.ajax({
            data: data,
            type: 'POST',
            url: '/userUpdates'            
        }).done(function(data){
            if (data.error) {
                console.log(error, ':error');
            }
            else {
                //show smth
                console.log('sucess');
                $('#successAlert').show();
            }
        })
    }
    
    //Real form for user
    $('.real-form').on('submit', function (event) {
        event.preventDefault();
        let $main_select = $('#real-services__select').val();

        let $full_name = $('#user-fullname').val(),
            $new_full_name = $('#user-new-fullname').val(),
            $new_payment_sum = parseInt($('#payment-sum').val()),
            $new_end_date = $('#prolong-date').val().replaceAll('-','.'),
            $contract_number = parseInt($("#contract-number").val()),
            $new_adress = $('#new-adress').val();

        if ($main_select == 'Make payment'){
            let current_date = new Date();
            let month = current_date.getMonth();
            let year = current_date.getFullYear();
            let payment_date = current_date.toLocaleString().split(',')[0];
            let data = {
                update: `INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
                            select payment.id_contract, ${month},${year},${$new_payment_sum},'${payment_date}' from client
                            join contract on contract.id = client.id
                            join payment on payment.id_contract = contract.id
                            where client.full_name = '${$full_name}'
                            LIMIT 1`
            }
            ajax_post(data);
        } else if ($main_select == 'Update full name'){
            let data ={
                update: `UPDATE client SET full_name = '${$full_name}' WHERE full_name = '${$new_full_name}'`,     
            }
            ajax_post(data);
        } else if ($main_select == 'Prolong contract'){
            let data ={
                update: `UPDATE contract SET end_date = '${$new_end_date}'
                         where number = '${$contract_number}'`,
            }
            ajax_post(data);
        } else if ($main_select == 'Change address registration'){
            let data = {
                update: `UPDATE contract SET adress = '${$new_adress}'
                         where number = '${$contract_number}'`,
            }
            ajax_post(data)
        }
        
    });

    //Check selected option
    $('#real-services__select').on('change', () => {
        $('.hidden-label').removeClass('active');
        let $main_select_swap = $('#real-services__select').val();
        console.log($main_select_swap)

        if ($main_select_swap == 'Update full name') {
            $('.hidden-fullname').addClass('active');

        } else if ($main_select_swap == 'Make payment') {
            $('.hidden-sum').addClass('active');       

        } else if ($main_select_swap == 'Prolong contract') {
            $('.hidden-date').addClass('active');
            $('.hidden-number').addClass('active');

        } else if ($main_select_swap == 'Change address registration'){
            $('.hidden-address').addClass('active');
            $('.hidden-number').addClass('active');
        }
    });
   
});