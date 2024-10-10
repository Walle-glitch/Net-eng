import serial  # pip install pyserial
import time
import os
from datetime import datetime

def create_log_file():
    # Create the "loggs" directory if it doesn't exist
    if not os.path.exists("loggs"):
        os.makedirs("loggs")

    # Create a file based on the current timestamp
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    log_file = f"loggs/session_{timestamp}.log"
    
    return log_file

def log_to_file_and_terminal(log_file, data):
    # Write data to the terminal
    print(data)
    # Log data to the file and flush immediately for continuous logging
    with open(log_file, 'a', encoding='utf-8') as f:
        f.write(data + '\n')
        f.flush()

def connect_to_device(serial_port, baud_rate):
    log_file = create_log_file()
    
    try:
        # Open the serial connection
        ser = serial.Serial(serial_port, baudrate=baud_rate, timeout=1)
        message = f"Connecting to device via {serial_port} with baud rate {baud_rate}..."
        log_to_file_and_terminal(log_file, message)

        if ser.is_open:
            log_to_file_and_terminal(log_file, "Connection established!")
        else:
            log_to_file_and_terminal(log_file, "Failed to open the port.")
            return None

        # Send commands to the device
        command = "show version"  # Example command
        send_command(ser, command, log_file)

        # Read data from the device
        read_response(ser, log_file)

        # Close the connection
        ser.close()
        log_to_file_and_terminal(log_file, "Connection closed.")
    except serial.SerialException as e:
        error_message = f"Error connecting to device: {e}"
        log_to_file_and_terminal(log_file, error_message)
    except Exception as e:
        error_message = f"An unexpected error occurred: {e}"
        log_to_file_and_terminal(log_file, error_message)

def send_command(ser, command, log_file):
    """
    Send a command to the device and log it
    """
    ser.write(f"{command}\n".encode('utf-8'))
    log_to_file_and_terminal(log_file, f"Sent command: {command}")
    time.sleep(1)  # Wait for the device to respond

def read_response(ser, log_file):
    """
    Read the device's response and log it continuously
    """
    while ser.in_waiting > 0:
        response = ser.read(ser.in_waiting).decode('utf-8')
        log_to_file_and_terminal(log_file, f"Response from the device:\n{response}")

if __name__ == "__main__":
    serial_port = "/dev/ttyUSB0"  # Change this to your port, e.g., /dev/ttyUSB0 on Linux
    baud_rate = 9600  # Common baud rate for Cisco devices
    connect_to_device(serial_port, baud_rate)
