const callbackChecking = (data) => {
    // parse the data from backend
    const result = JSON.parse(data);

    // check the status
    if (result.hasOwnProperty('status') && result['status'] === 'success') {
        if (result['code'] === 'user') {
            document.getElementById('username').style.borderColor = 'green';
            document.getElementsByClassName('error-message')[0].innerHTML = '';
        }
        if (result['code'] === 'email') {
            document.getElementById('email').style.borderColor = 'green';
            document.getElementsByClassName('error-message')[1].innerHTML = '';
        }
    } else {
        if (result['code'] === 'user') {
            document.getElementById('username').style.borderColor = 'red';
            document.getElementsByClassName('error-message')[0].innerHTML = result['description'];
        }
        if (result['code'] === 'email') {
            document.getElementById('email').style.borderColor = 'red';
            document.getElementsByClassName('error-message')[1].innerHTML = result['description'];
        }
    }
}



const matchPass = () => {
    // get the value
    const pass = document.getElementById('password').value;
    const passConfirm = document.getElementById('repassword').value;

    return pass === passConfirm;
}

const callbackRegisters = (data) => {
    // parse the data from backend
    const result = JSON.parse(data);

    // check the status
    if (result.hasOwnProperty('status') && result['status'] === 'success') {
        deleteCookie();

        const session_id = result['sessionToken'];
        setCookie(session_id, 1800);

        window.location = '/';
    } else {
        alert('Register failed!');
    }
}

const registered = (e) => {
    e.preventDefault();

    if (matchPass()) {
        // get the input from form
        const dataRegister = new FormData(e.target);

        // post to checking the register to backend
        postAPI('http://localhost:5173/api/authentication/register', callbackRegisters, dataRegister);
    } else {
        alert('Password does not match!');
    }
    
    return;
}
