module 0x42::Education {
    use std::debug;
    use std::vector;

    struct Student has drop {
        name: vector<u8>,
        age: u8,
        schools: vector<School>
    }

    struct School has drop {
        name: vector<u8>,
        level: vector<u8>
    }

    public fun new_school(name: vector<u8>, level: vector<u8>): School {
        School {
            name: name,
            level: level
        }
    }

    public fun new_student(name: vector<u8>, age: u8): Student {
        Student {
            name: name,
            age: age,
            schools: (vector[]: vector<School>)
        }
    }

    public fun add_school(student: &mut Student, school: School): &mut Student {
        vector::push_back(&mut student.schools, school);
        student
    }

    public fun get_score(student: &Student): u8 {
        let score = 0x42::Performance::new_score(student.name, vector::borrow(&student.schools, 0).name, 100);
        return score
    }

    #[test]
    fun test_student() {
        let student = new_student(b"Tim", 7);
        let school = new_school(b"Move Elemantory School", b"elemantory");
        debug::print(&student.name);
        add_school(&mut student, school);
        let score = get_score(&student);
        debug::print(&score);
        assert!(student.name == b"Tim", 0);
        assert!(student.age == 7, 0);
        assert!(score == 100, 0);
    }
}