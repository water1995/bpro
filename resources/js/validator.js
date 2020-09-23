const name =/^([A-Z\s][a-z\s]+)+$/;
const branch =/^(IT|EXTC|MECH|COMPS)$/;
const studID =/^\d{10}$/;
const pass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
const text = /^[a-zA-Z0-9-,./ ]*$/;
const course = /^[a-zA-Z0-9-. ]*$/;
const tname = /^[A-Z]* [A-Z]* [A-Z]* [A-Z]*$/;
const rpe = /^(TE|BE)-[5-8]-(MAY|DEC)-\d{4}$/;
const year = /^\d{4}$/;
const email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

export  function testName(value){
    return name.test(value);
}

export  function testBranch(value){
    return branch.test(value);
}

export  function testStudID(value){
    return studID.test(value);
}

export function testPass(value){
    return pass.test(value);
}

export function testText(value){
    return text.test(value);
}

export function testCourse(value){
    return course.test(value);
}

export function testTName(value){
    return tname.test(value);
}

export function testRPE(value){
    return rpe.test(value);
}

export function testYear(value){
    return year.test(value);
}

export function testEmail(value){
    return email.test(value);
}

