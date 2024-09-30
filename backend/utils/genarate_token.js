const crypto = require('crypto');


// function generateToken(length) {
//     const buffer = crypto.randomBytes(length);
//     let base64Token = buffer.toString('base64');
//     base64Token = base64Token.replace(/[/+=]/g, '').slice(0, length);
//     return base64Token;
// }


exports.generateToken=(length)=>{
    const buffer = crypto.randomBytes(length);
    let base64Token = buffer.toString('base64');
    base64Token = base64Token.replace(/[/+=]/g, '').slice(0, length);
    return base64Token; 
}