import psycopg2
from tabulate import tabulate

class Psql:

    def __init__(self, password, dbname = 'tv-payment-system-2.0', user ='postgres', host='localhost'):

        self.conn = psycopg2.connect(dbname = dbname,
                                user = user, 
                                password = password,
                                host = host)

        self.cursor = self.conn.cursor()

        print('Connected to the DB')

    def get_data_command(self):
        text = input("Input SQL command -->")
        self.cursor.execute(text)
        data = self.cursor.fetchall()
        print(tabulate(data, tablefmt='orgtbl'))
        # self.cursor.close()

    def get_data_file(self):
        file_name = input("Paste absolute SQL file location -->")
        with open(file_name, "r") as f:
            for line in f.readlines():
                self.cursor.execute(line)
                data = self.cursor.fetchall()
                print(data, tablefmt='orgtbl')

    def execute_file(self, file_path):
        with open(file_path, "r", encoding='utf-8') as f:
            self.cursor.execute(f.read())

    def execute_fetch(self, command):
        self.cursor.execute(command)
        return self.cursor.fetchall()

    def get_table_contents(self, table_name):
        self.cursor.execute(f"SELECT * FROM {table_name};")
        colnames = [desc[0] for desc in self.cursor.description]
        data = self.cursor.fetchall()
        return [colnames, data]


    def __del__(self):
        self.cursor.close()
        self.conn.close()

if __name__ == "__main__":
    psql = Psql('root',
                dbname='tv-payment-system-2.0',
                user='postgres',
                host='localhost')

    psql.get_data_file()
