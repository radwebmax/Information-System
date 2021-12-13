let output = document.querySelector('.white p').textContent;
let new_output = document.querySelector('.formatted_output');
let request = document.querySelector('h2').textContent.replace(/ /g, '');
let request_title = document.querySelector('h2');
let array_output = output.split(',');
/*Selects*/
let report_1 = 'SELECT package_of_services.name, COUNT(*)\
                    from package_of_services\
                    JOIN contract on contract.id_pos=package_of_services.id\
                    GROUP BY package_of_services.name'.replace(/ /g, ''),
    report_2 = 'select contract.id, contract.sum from contract\
                    LEFT join payment on payment.id_contract=contract.id \
                    GROUP BY contract.id\
                    having (contract.sum>0 AND sum(payment.sum) is NULL) OR \
                    sum(payment.sum)<(contract.sum*EXTRACT(MONTH FROM (CURRENT_DATE-contract.start_date)))'.replace(/ /g, ''),
    select_1 = 'SELECT client.full_name, contract.number FROM client \
                    JOIN contract on contract.client_id = client.id '.replace(/ /g, ''),
    select_2 = 'SELECT client.full_name, contract.end_date FROM client \
                    JOIN contract on contract.client_id = client.id '.replace(/ /g, ''),
    select_3 = 'SELECT client.full_name, package_of_services.name FROM client \
                    JOIN contract on contract.client_id = client.id\
                    JOIN package_of_services on package_of_services.id = contract.id_pos'.replace(/ /g, ''),
    select_4 = 'SELECT package_of_services.name, service.name, package_of_services.month_payment FROM package_of_services \
                    JOIN service_package_of_services on service_package_of_services.id = package_of_services.id\
                    JOIN service on service.id = service_package_of_services.id_pos'.replace(/ /g, '');


for (let line of array_output) {
    line = line.replace('[', '').replace(']', '').replace('(', '').replace(')', '').replaceAll("'", '');
    if (request == report_1 || request == report_2 || request.includes(select_1) || request.includes(select_2) || request.includes(select_3)) {
        let new_line = `<p style="width:50%">${line}</p>`;
        new_output.insertAdjacentHTML('beforeend', new_line);

    } else if (request.includes(select_4)) {
        let new_line = `<p style="width:33.333333%">${line}</p>`;
        new_output.insertAdjacentHTML('beforeend', new_line);
        console.log("width='33%'")
    } else {
        let new_line = `<p style="width:25%">${line}</p>`;
        new_output.insertAdjacentHTML('beforeend', new_line);
        console.log("width='25%'")
    }

}

//Rename requests

if (request == report_1) {
    request_title.textContent = 'Report about packages'
} else if (request == report_2) {
    request_title.textContent = 'Report about contracts'
} else if (request.includes(select_1)) {
    request_title.textContent = 'Contract id'
} else if (request.includes(select_2)) {
    request_title.textContent = 'Contract validity'
} else if (request.includes(select_3)) {
    request_title.textContent = 'Package of services I use'
} else if (request.includes(select_4)) {
    request_title.textContent = 'Info about package'
}
