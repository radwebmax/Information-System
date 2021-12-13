let ajax_call = (data) => {
    $.ajax({
        data: data,
        type: 'POST',
        url: '/userUpdates',
        success: function (data) {
            if (data.error) {
                //    $('#errorAlert').text(data.error).show();
                //    $('#successAlert').hide();
                //    $('#loading').hide();
                console.log(error, ':error');
            }
            else {
                //show smth
                console.log('sucess');
            }
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR);

        }
    })
}




let $main_select = $('#real-services__select').val();
let $full_name = $('#user-fullname').val();
let $new_full_name = $('#user-new-fullname');
let $new_end_date = $('#prolong-date');
let $new_address = $('#new-address');
let $new_payment = $('#payment-sum');
let $new_package = $('#select-service');

$('#real-services__select').on('change', () => {
    $('.hidden-inputs label').hide();
    let $main_select_swap = $('#real-services__select').val();

    if ($main_select_swap == 'Update full name') {
        $new_full_name.show();

    } else if ($main_select_swap == 'Make month payment') {
        $new_payment.show();

    } else if ($main_select_swap == 'Prolong contract') {
        $new_end_date.show();

    } else if ($main_select_swap == 'Change address registration') {
        $new_address.show();

    } else if ($main_select_swap == 'Add new package') {
        $new_package.show();
    }
});

$('.real-form').on('submit', function (event) {
    event.preventDefault();

    let $_full_name = $('#user-fullname').val();
    let $_new_full_name = $('#user-new-fullname input').val();
    // let $_new_end_date = $('#prolong-date input').val().replaceAll('-','.');
    let $_new_address = $('#new-address input').val();
    let $_new_payment = $('#payment-sum input').val();
    let $_new_package = $('#select-service select').val();
    let $_service_type = $('#service-type').val();

    if ($main_select == 'Add new package') {
        $_service_type = 'new_pack';
        data = {
            fullname: $full_name,
            new_fullname: $new_full_name,
            service_type: $_service_type,
        }
        ajax_call(data);
    } else if ($main_select == 'Change address registration') {
        $_service_type = 'new_addr';
        data = {
            fullname: $full_name,
            new_fullname: $new_full_name,
            service_type: $_service_type,
        }
        ajax_call(data);
    } else if ($main_select == 'Prolong contract') {
        $_service_type = 'new_date';
        data = {
            fullname: $full_name,
            new_fullname: $new_full_name,
            service_type: $_service_type,
        }
        ajax_call(data);
    } else if ($main_select == 'Make payment') {
        $_service_type = 'new_pay';
        data = {
            fullname: $full_name,
            new_fullname: $new_full_name,
            service_type: $_service_type,
        }
        ajax_call(data);
    } else if ($main_select == 'Update full name') {
        $_service_type = 'new_full';
        data = {
            full_name: $_full_name,
            new_fullname: $_new_full_name,
            service_type: $_service_type,
        }
        ajax_call(data);
    }
    event.preventDefault();
    event.stopPropagation();
});