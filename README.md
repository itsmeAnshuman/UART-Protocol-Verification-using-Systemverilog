# UART-Protocol-Verification-using-Systemverilog

### 🔄 UART Working Principle

UART (Universal Asynchronous Receiver/Transmitter) enables asynchronous serial communication between two devices.  
It transfers data **one bit at a time** without requiring a shared clock.

#### ✅ UART Frame Structure
1. **Idle State**
   - Line stays high (`1`) when no data is transmitted

2. **Start Bit**
   - Line goes low (`0`) to indicate beginning of transmission

3. **Data Bits**
   - Typically 8 bits sent **LSB first**

4. **Optional Parity Bit**
   - Used for simple error detection (Even/Odd/None)

5. **Stop Bit(s)**
   - 1 or 2 bits high to mark end of frame
   - Line returns to idle state

#### ✅ Key Characteristics
- **Asynchronous** communication — no clock line
- Uses only **TX** and **RX** wires
- Requires matching **baud rate** on both ends (e.g., 9600, 115200)
- Simple, low-cost, widely used in embedded systems

#### ✅ Common Applications
- Microcontroller-to-PC communication
- Debug consoles
- Bluetooth/GPS modules
- Serial terminals
