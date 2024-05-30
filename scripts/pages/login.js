const callbackLogin = (data) => {
    const result = JSON.parse(data);

    // check the status
    if (result.hasOwnProperty('status') && result['status'] === 'success') {
        deleteCookie();
        //存入後端發放的驗證token到 cookie
        const session_id = result['sessionToken'];
        setCookie(session_id, 1800);

        window.location = '/';
    } else {
        alert('Login failed!');
    }
}

const logined = (e) => {
    e.preventDefault();

    //表單帳密
    const dataLogin = new FormData(e.target);

    // formpost到api
    postAPI('http://localhost:5173/api/authentication/login', callbackLogin, dataLogin);

    return;
}