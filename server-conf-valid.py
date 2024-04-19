import subprocess

def parse_config(file_path):
    with open(file_path, 'r') as file:
        config_lines = file.readlines()

    section_stack = []  # Stack to keep track of open sections
    namespace_count = 0
    namespace_names = set()
    errors = []

    for line_number, line in enumerate(config_lines, start=1):
        line = line.strip()
        if not line or line.startswith('#'):
            continue

        # Check indentation
        indent_level = line.find(line.lstrip())
        if indent_level % 4 != 0:
            errors.append(f"Error at line {line_number}: Improper indentation.")

        # Check for incomplete sections
        if line.endswith('{'):
            section_stack.append((line.split()[0], line_number))
        elif line.endswith('}'):
            if not section_stack:
                errors.append(f"Error at line {line_number}: Extra closing curly brace '}}'.")
            else:
                section_name, _ = section_stack.pop()

        # Check for duplicate namespaces and count namespaces
        if line.startswith('namespace'):
            namespace_count += 1
            namespace_name = line.split()[1]
            if namespace_name in namespace_names:
                errors.append(f"Error at line {line_number}: Duplicate namespace '{namespace_name}' found.")
            else:
                namespace_names.add(namespace_name)

    # Check for unclosed sections
    if section_stack:
        for section_name, line_number in section_stack:
            errors.append(f"Error: Incomplete section '{section_name}' at line {line_number}.")

    # Check total namespaces
    if namespace_count > 2:
        errors.append(f"Error: Total namespaces exceed 2 at line {line_number}.")

    if errors:
        for error in errors:
            print(error)
        return False
    else:
        print("Validation complete. Applying changes and restarting the Aerospike server.")
        return True

def apply_changes_and_restart():
    try:
        # Execute a command to restart the Aerospike service. Adjust the command below according to your system setup.
        subprocess.run(['sudo', 'systemctl', 'restart', 'aerospike'], check=True)
        print("Aerospike server restarted successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to restart Aerospike server: {e}")

if __name__ == "__main__":
    config_file = "/etc/aerospike/aerospike.conf"  # Path to Aerospike config file
    if parse_config(config_file):
        apply_changes_and_restart()
