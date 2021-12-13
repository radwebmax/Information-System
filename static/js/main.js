//Fake login
let login_submit_btn = document.querySelector('.login-submit');
let admin_wrapper = document.getElementById('admin-wrapper');
let user_wrapper = document.getElementById('user-wrapper');
let login_wrapper = document.getElementById('login');
const user_type = localStorage.getItem('user_type');
let __error = document.querySelector('.error');
let welcome_user = document.querySelector('.hi-user');

if (user_type === 'admin') {
    login_wrapper.classList.add('disabled');
    admin_wrapper.classList.add('active');
} else if (user_type === 'user') {
    login_wrapper.classList.add('disabled');
    user_wrapper.classList.add('active');
    welcome_user.innerHTML = `Welcome, ${localStorage.getItem('user_name')} !`
}

let auth = event => {
    let username = document.querySelector('input[name="username-login"]').value;
    let password = document.querySelector('input[name="password-login"]').value;
    console.log(password);

    localStorage.setItem('user_name', username);


    if (username == 'admin' && password == 'admin') {
        login_wrapper.classList.add('disabled');
        admin_wrapper.classList.add('active');
        localStorage.setItem('user_type', 'admin');
    } else if (password == 'user') {
        login_wrapper.classList.add('disabled');
        user_wrapper.classList.add('active');
        localStorage.setItem('user_type', 'user');
        welcome_user.innerHTML = `Welcome, ${localStorage.getItem('user_name',)} !`
    } else {
        __error.classList.add('visible');
    }
}

//Remove this line on production
// localStorage.removeItem('user_type');

login_submit_btn.addEventListener('click', auth);


//Show tables for admin
let showTables = event => {
    document.querySelector('.table-wrapper').classList.add('show');
    event.target.closest('button').classList.add('disabled');
}

document.querySelector('.show-all').addEventListener('click', showTables);

//Show reports
let admin_form = document.querySelector('.admin-form');

let report_1 = () => {
    event.target.closest('button').classList.add('disabled');
    document.querySelector('.admin-input').value = `SELECT package_of_services.name, COUNT(*)
                                                    from package_of_services
                                                    JOIN contract on contract.id_pos=package_of_services.id
                                                    GROUP BY package_of_services.name`;
    admin_form.submit();
}

let report_2 = () => {
    event.target.closest('button').classList.add('disabled');
    document.querySelector('.admin-input').value = `select contract.id, contract.sum from contract 
                                                    LEFT join payment on payment.id_contract=contract.id 
                                                    GROUP BY contract.id
                                                    having (contract.sum>0 AND sum(payment.sum) is NULL) OR 
                                                    sum(payment.sum)<(contract.sum*EXTRACT(MONTH FROM (CURRENT_DATE-contract.start_date)))`;
    admin_form.submit();
}

document.querySelector('.report-1').addEventListener('click', report_1);
document.querySelector('.report-2').addEventListener('click', report_2);

//Log out
let logout_btn = document.querySelectorAll('.log-out');


for (let btn of logout_btn) {
    btn.addEventListener('click', () => {
        localStorage.clear();
        document.location.reload();
    });
}



//Create select for user
let user_submit_btn = document.querySelector('.user-submit');
let user_form = document.querySelector('.user-form');
let user_select = document.getElementById('service_select');

user_select.addEventListener('input', event => {
    if (user_select.value == 'Info about package') {
        document.querySelector('.for-services').style.display = 'flex';
    } else {
        document.querySelector('.for-services').style.display = 'none';
    }
});


let create_select = event => {
    let hidden_input = document.querySelector('.user-input');
    let selected_option = document.getElementById('service_select');
    let package_name = document.getElementById('package_name').value;
    let username = `${document.querySelector('input[name="user-surname"]').value} ${document.querySelector('input[name="user-name"]').value} ${document.querySelector('input[name="user-patronymic"]').value}`
    event.preventDefault();


    if (selected_option.value == 'Contract id') {
        hidden_input.value = `SELECT client.full_name, contract.number FROM client 
                                JOIN contract on contract.client_id = client.id 
                                WHERE client.full_name = '${username}'`;
        console.log(hidden_input.value);
        user_form.submit();
    } else if (selected_option.value == 'Contract validity') {
        hidden_input.value = `SELECT client.full_name, contract.end_date FROM client 
                                JOIN contract on contract.client_id = client.id 
                                WHERE client.full_name = '${username}'`;
        console.log(hidden_input.value);
        user_form.submit();
    } else if (selected_option.value == 'Package of services I use') {
        hidden_input.value = `SELECT client.full_name, package_of_services.name FROM client 
                                JOIN contract on contract.client_id = client.id
                                JOIN package_of_services on package_of_services.id = contract.id_pos
                                WHERE client.full_name = '${username}'`;
        console.log(hidden_input.value);
        user_form.submit();
    } else if (selected_option.value == 'Info about package' && package_name.length == 0) {
        document.querySelector('.for-services').style.display = 'block';
    } else if (selected_option.value == 'Info about package' && package_name.length != 0) {
        hidden_input.value = `SELECT package_of_services.name, service.name, package_of_services.month_payment FROM package_of_services 
                                JOIN service_package_of_services on service_package_of_services.id = package_of_services.id
                                JOIN service on service.id = service_package_of_services.id_pos
                                WHERE package_of_services.name = '${package_name}'`;
        console.log(hidden_input.value);
        user_form.submit();
    } else if (selected_option.value == 'Show all packages') {
        hidden_input.value = `SELECT package_of_services.name, service.name, package_of_services.month_payment FROM package_of_services 
                                JOIN service_package_of_services on service_package_of_services.id = package_of_services.id
                                JOIN service on service.id = service_package_of_services.id_pos`;
        console.log(hidden_input.value);
        user_form.submit();
    }

}

user_submit_btn.addEventListener('click', create_select);


//Auth flippers

let create_acc_btn = document.querySelectorAll('.new_account span');

let flip_cards = () => {
    document.querySelector('.fake-login').classList.toggle('disabled');
    document.querySelector('.real-registration').classList.toggle('disabled');
}

for (let btn of create_acc_btn) {
    btn.addEventListener('click', flip_cards);
}
