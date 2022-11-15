// SPDX-License-Identifier:MIT
pragma solidity ^0.6;
contract Student_Management{
    struct Student{
        uint stud_id;
        string name;
        string department;
    }
    Student[] students;

    function addStudent(uint stud_id,string memory name,string memory department) public {
        Student memory stud=Student(stud_id,name,department);
        students.push(stud);
    }
    function getStudent(uint stud_id)public view returns(string memory,string memory){
        for(uint i=0;i<students.length;i++){
            Student memory stud=students[i];
            if(stud.stud_id==stud_id){
                return(stud.name,stud.department);
            }
        }
        return("not_found","not_found");
    }
}
