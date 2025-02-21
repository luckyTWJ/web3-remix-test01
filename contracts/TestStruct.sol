// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract TestStruct {
    struct Person {
        address account;
        bool gender;
        uint8 age;
    }
    // 声明变量而不初始化
    Person person; //默认为storage

    // 按成员顺序（结构体声明时的顺序）赋值
Person person2 = Person(address(0x0), false, 18) ;

Person public person6 = Person(address(0x0), false, 18) ;

// 在函数内声明
// Person memory person3 = Person(address(0x0), false, 18) ;

// 使用具名变量初始化
Person person4 = Person({account:address(0x11),gender:false,age:19});

//在函数内声明
// Person memory person =  Person({account: address(0x0), gender: false, age: 18}) ;

function updatePerson()public {
    person.account = msg.sender;
    person.gender= true;
    person.age = 12;
}


}
