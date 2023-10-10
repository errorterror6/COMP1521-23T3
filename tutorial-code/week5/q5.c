#include <stdint.h>
#include <stdio.h>

// uint8_t printerControl = 0; // 0b 0000 0000

// Whether the printer is out of ink
#define NO_INK (0x1)       // 0b 0000 0001
// Whether to print/scan in colour
#define COLOUR (0x2)       // 0b 0000 0010
// Select print mode
#define SELECT_PRINT (0x4) // 0b 0000 0100
// Select scan mode
#define SELECT_SCAN (0x8)  // 0b 0000 1000
// Start print/scan
#define START (0x10)       // 0b 0001 0000

uint8_t printerControl = 0x1; // 0b 0000 0000

void checkInk(void);               // Question A
void replaceInk(void);             // Question B
void useColourAndSelectScan(void); // Question C
void toggleMode(void);             // Question D
void start(void);                  // Question E

// Main function for testing
int main(void)
{
    printf("printerControl = 0x%02x\n", printerControl);
    // checkInk();
    // replaceInk();
    useColourAndSelectScan();
    toggleMode();
    start();
    // toggleMode();
    printf("printerControl = 0x%02x\n", printerControl);
}

void checkInk() {
    if (printerControl & NO_INK) {
        printf("out of ink\n");
    } else {
        printf("INK levels OK\n");
    }
}

void replaceInk(void) {
    printerControl &= ~NO_INK;
    // ~NO_INK : 1111 1110
    //printer:   0000 0001

}

void useColourAndSelectScan() {
    printerControl |= (SELECT_SCAN | COLOUR);
}

void toggleMode() {
    printerControl ^= (SELECT_SCAN | SELECT_PRINT);
    // printer: 0000 1000
    // operator:0000 1100
    // result : 0000 0100
}
// (Extension question) to start printing/scanning. It should:
// check that one (and only one) mode is selected
// check there's ink if printing.
// print (to terminal) what it's doing and any error messages.
// wait until the printing/scanning is finished and print a 'finished' message. Since there isn't an actual printer on the other side, a correct implementation of this will infinite loop and never print 'finished'.
void start(void) {
    int is_scanning = (printerControl & SELECT_SCAN) >> 3;
    int is_printing = (printerControl & SELECT_PRINT) >> 2;


    if (is_scanning == is_printing) {
        printf("invalid modes\n");
        return;
    }


    if (is_printing) {
        if (printerControl & NO_INK) {
            printf("No ink!\n");
            return;
        }
        
        if (printerControl & COLOUR) {
            printf("I AM PRINTING IN COLOR!!!1\n");
        } else {
            printf("I AM PRINTING IN BLACK AND WHITE!!\n");
        }
    } else {
        printf("I AM SCANNING \n");
    }


    printerControl |= START;

    while (printerControl & START) {

    }

    printf("FINISHED\n");

    
}