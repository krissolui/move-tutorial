script {
    use 0x42::Education;
    use std::debug;

    fun test_student() {
        let student = Education::new_student(b"Tim", 7);
        let school = Education::new_school(b"Move Elemantory School", b"elemantory");
        Education::add_school(&mut student, school);
        let score = Education::get_score(&student);
        debug::print(&score)
    }
}