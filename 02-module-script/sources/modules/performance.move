module 0x42::Performance {
    friend 0x42::Education;

    struct StudentScore has drop{
        student: vector<u8>,
        school: vector<u8>,
        score: u8
    }

    public(friend) fun new_score(student: vector<u8>, school: vector<u8>, score: u8): u8 {
        let scoreRecord = StudentScore {
            student: student,
            school: school,
            score: score
        };

        return scoreRecord.score
    }
}