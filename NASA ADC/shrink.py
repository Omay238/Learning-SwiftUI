import pandas as pd


def generate_subregion_csv(input_filename, output_filename, rows=100, cols=100):
    # Read the original CSV file
    try:
        df = pd.read_csv(input_filename)
    except FileNotFoundError:
        print(f"Error: File {input_filename} not found.")
        return
    except pd.errors.EmptyDataError:
        print(f"Error: File {input_filename} is empty.")
        return

    # Extract the first 100 rows and 100 columns
    subregion = df.iloc[:rows, :cols]

    # Save the subregion to a new CSV file
    subregion.to_csv(output_filename, index=False)

    print(f"Subregion saved to {output_filename}")


# Example usage:
if __name__ == "__main__":
    # Get filename input from the user
    input_filename = input("Enter the original CSV filename: ")

    # Generate output filename (assuming ".csv" extension)
    output_filename = input_filename.replace(".csv", "100.csv")

    # Generate and save the subregion CSV
    generate_subregion_csv(input_filename, output_filename)
