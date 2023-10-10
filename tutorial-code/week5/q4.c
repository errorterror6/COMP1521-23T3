#define READING   0x01           0000 0001
#define WRITING   0x02           0000 0010
#define AS_BYTES  0x04           0000 0100
#define AS_BLOCKS 0x08           0000 1000
#define LOCKED    0x10           0001 0000


unsigned char device;

device = device | LOCKED | READING | AS_BYTES.
// device: 0001 0101

// mark the device as locked for writing blocks

device = device & ~READING
// device:     0001 0101
// notreading: 1111 1110
------------------------
//             0001 0100
device = device | WRITING
device = device & !AS_BYTES
device = device | AS_BLOCKS

// set the device as both reading and writing
device = device | READING
// device:     0001 1010
// READING:    0000 0001       |
------------------------
//             0001 1011