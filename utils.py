# utils.py
import MySQLdb


DATABASE='triviaDB'
DB_USER = 'tUser'
DB_PASSWORD = 'tPasswd'
HOST = 'localhost'

def db_connect():
  return MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE)