struct _coord {
    double x;                   // offset of 0
    double y;                   // offset of 8
};

typedef struct _node Node;
struct _node {
    int value;                  // offset of 0
    Node *next;                 //offset of 4
};

struct next{
    int value;                  //offset of 4
    Node *next;                    //offset of 8
}

struct _enrolment {
    int stu_id;         // e.g. 5012345       //offset of 0
    char course[9]:     // e.g. "COMP1521"    //offset of 4
    char term[5];       // e.g. "17s2"       //offset of 13
    char grade[3];      // e.g. "HD"         //offset of 18
    double mark;        // e.g. 87.3         //offset of 24
};