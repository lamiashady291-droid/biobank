import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector


# =========================
# Database Connection
# =========================

def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="biobank_app",
        password="Biobank123",
        database="BiobankDB"
    )


# =========================
# Show All Donors
# =========================

def show_all():
    for row in tree.get_children():
        tree.delete(row)

    try:
        connection = connect_db()
        cursor = connection.cursor()

        cursor.execute("""
            SELECT donor_id, first_name, last_name,
                   gender, date_of_birth, phone, email
            FROM Donors
        """)

        rows = cursor.fetchall()

        for row in rows:
            tree.insert("", tk.END, values=row)

        cursor.close()
        connection.close()

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", str(err))


# =========================
# Search Donor
# =========================

def search_donor():
    search_text = search_entry.get().strip()

    if search_text == "":
        messagebox.showwarning("Warning", "Please enter a donor name.")
        return

    for row in tree.get_children():
        tree.delete(row)

    try:
        connection = connect_db()
        cursor = connection.cursor()

        cursor.execute("""
            SELECT donor_id, first_name, last_name,
                   gender, date_of_birth, phone, email
            FROM Donors
            WHERE first_name LIKE %s
               OR last_name LIKE %s
        """, (f"%{search_text}%", f"%{search_text}%"))

        rows = cursor.fetchall()

        for row in rows:
            tree.insert("", tk.END, values=row)

        cursor.close()
        connection.close()

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", str(err))


# =========================
# Add Donor
# =========================

def add_donor():
    first_name = first_name_entry.get().strip()
    last_name = last_name_entry.get().strip()
    gender = gender_entry.get().strip()
    date_of_birth = dob_entry.get().strip()
    phone = phone_entry.get().strip()
    email = email_entry.get().strip()

    if not first_name or not last_name or not gender:
        messagebox.showwarning(
            "Validation",
            "First Name, Last Name and Gender are required."
        )
        return

    try:
        connection = connect_db()
        cursor = connection.cursor()

        sql = """
            INSERT INTO Donors
            (first_name, last_name, gender, date_of_birth, phone, email)
            VALUES (%s, %s, %s, %s, %s, %s)
        """

        values = (
            first_name,
            last_name,
            gender,
            date_of_birth,
            phone,
            email
        )

        cursor.execute(sql, values)
        connection.commit()

        cursor.close()
        connection.close()

        messagebox.showinfo("Success", "Donor added successfully.")

        clear_fields()
        show_all()

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", str(err))


# =========================
# Select Donor
# =========================

def select_donor(event):
    selected = tree.focus()

    if not selected:
        return

    values = tree.item(selected, "values")

    clear_fields()

    id_entry.insert(0, values[0])
    first_name_entry.insert(0, values[1])
    last_name_entry.insert(0, values[2])
    gender_entry.insert(0, values[3])
    dob_entry.insert(0, values[4])
    phone_entry.insert(0, values[5])
    email_entry.insert(0, values[6])


# =========================
# Update Donor
# =========================

def update_donor():
    donor_id = id_entry.get().strip()

    if donor_id == "":
        messagebox.showwarning(
            "Warning",
            "Please select a donor first."
        )
        return

    first_name = first_name_entry.get().strip()
    last_name = last_name_entry.get().strip()
    gender = gender_entry.get().strip()
    date_of_birth = dob_entry.get().strip()
    phone = phone_entry.get().strip()
    email = email_entry.get().strip()

    if not first_name or not last_name or not gender:
        messagebox.showwarning(
            "Validation",
            "First Name, Last Name and Gender are required."
        )
        return

    try:
        connection = connect_db()
        cursor = connection.cursor()

        sql = """
            UPDATE Donors
            SET first_name = %s,
                last_name = %s,
                gender = %s,
                date_of_birth = %s,
                phone = %s,
                email = %s
            WHERE donor_id = %s
        """

        values = (
            first_name,
            last_name,
            gender,
            date_of_birth,
            phone,
            email,
            donor_id
        )

        cursor.execute(sql, values)
        connection.commit()

        cursor.close()
        connection.close()

        messagebox.showinfo("Success", "Donor updated successfully.")

        clear_fields()
        show_all()

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", str(err))


# =========================
# Delete Donor
# =========================

def delete_donor():
    donor_id = id_entry.get().strip()

    if donor_id == "":
        messagebox.showwarning(
            "Warning",
            "Please select a donor first."
        )
        return

    answer = messagebox.askyesno(
        "Confirm Delete",
        "Are you sure you want to delete this donor?"
    )

    if not answer:
        return

    try:
        connection = connect_db()
        cursor = connection.cursor()

        cursor.execute(
            "DELETE FROM Donors WHERE donor_id = %s",
            (donor_id,)
        )

        connection.commit()

        cursor.close()
        connection.close()

        messagebox.showinfo("Success", "Donor deleted successfully.")

        clear_fields()
        show_all()

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", str(err))


# =========================
# Clear Fields
# =========================

def clear_fields():
    id_entry.delete(0, tk.END)
    first_name_entry.delete(0, tk.END)
    last_name_entry.delete(0, tk.END)
    gender_entry.delete(0, tk.END)
    dob_entry.delete(0, tk.END)
    phone_entry.delete(0, tk.END)
    email_entry.delete(0, tk.END)


# =========================
# GUI
# =========================

root = tk.Tk()
root.title("Biobank and Biospecimen Management System")
root.geometry("1250x750")


title = tk.Label(
    root,
    text="Biobank Donor Management System",
    font=("Arial", 24, "bold")
)

title.pack(pady=20)


# =========================
# Search Section
# =========================

search_frame = tk.Frame(root)
search_frame.pack(pady=5)

tk.Label(
    search_frame,
    text="Search Donor:"
).pack(side=tk.LEFT, padx=5)

search_entry = tk.Entry(
    search_frame,
    width=30
)

search_entry.pack(side=tk.LEFT, padx=5)

tk.Button(
    search_frame,
    text="Search",
    command=search_donor
).pack(side=tk.LEFT, padx=5)

tk.Button(
    search_frame,
    text="Show All",
    command=show_all
).pack(side=tk.LEFT, padx=5)


# =========================
# Donor Form
# =========================

form_frame = tk.Frame(root)
form_frame.pack(pady=15)


tk.Label(form_frame, text="ID").grid(row=0, column=0, padx=5, pady=5)
id_entry = tk.Entry(form_frame, width=20)
id_entry.grid(row=0, column=1, padx=5, pady=5)


tk.Label(form_frame, text="First Name").grid(row=0, column=2, padx=5, pady=5)
first_name_entry = tk.Entry(form_frame, width=20)
first_name_entry.grid(row=0, column=3, padx=5, pady=5)


tk.Label(form_frame, text="Last Name").grid(row=1, column=0, padx=5, pady=5)
last_name_entry = tk.Entry(form_frame, width=20)
last_name_entry.grid(row=1, column=1, padx=5, pady=5)


tk.Label(form_frame, text="Gender").grid(row=1, column=2, padx=5, pady=5)
gender_entry = tk.Entry(form_frame, width=20)
gender_entry.grid(row=1, column=3, padx=5, pady=5)


tk.Label(form_frame, text="Date of Birth").grid(row=2, column=0, padx=5, pady=5)
dob_entry = tk.Entry(form_frame, width=20)
dob_entry.grid(row=2, column=1, padx=5, pady=5)


tk.Label(form_frame, text="Phone").grid(row=2, column=2, padx=5, pady=5)
phone_entry = tk.Entry(form_frame, width=20)
phone_entry.grid(row=2, column=3, padx=5, pady=5)


tk.Label(form_frame, text="Email").grid(row=3, column=0, padx=5, pady=5)
email_entry = tk.Entry(form_frame, width=20)
email_entry.grid(row=3, column=1, padx=5, pady=5)


# =========================
# Buttons
# =========================

button_frame = tk.Frame(root)
button_frame.pack(pady=10)

tk.Button(
    button_frame,
    text="Add Donor",
    width=15,
    command=add_donor
).pack(side=tk.LEFT, padx=5)

tk.Button(
    button_frame,
    text="Update Donor",
    width=15,
    command=update_donor
).pack(side=tk.LEFT, padx=5)

tk.Button(
    button_frame,
    text="Delete Donor",
    width=15,
    command=delete_donor
).pack(side=tk.LEFT, padx=5)

tk.Button(
    button_frame,
    text="Clear",
    width=15,
    command=clear_fields
).pack(side=tk.LEFT, padx=5)


# =========================
# Table
# =========================

table_frame = tk.Frame(root)
table_frame.pack(fill=tk.BOTH, expand=True, padx=20, pady=10)

columns = (
    "ID",
    "First Name",
    "Last Name",
    "Gender",
    "Date of Birth",
    "Phone",
    "Email"
)

tree = ttk.Treeview(
    table_frame,
    columns=columns,
    show="headings"
)

for column in columns:
    tree.heading(column, text=column)
    tree.column(column, width=150)

tree.pack(
    fill=tk.BOTH,
    expand=True
)

tree.bind(
    "<ButtonRelease-1>",
    select_donor
)


# =========================
# Start Program
# =========================

show_all()

root.mainloop()