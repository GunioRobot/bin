# Simple script, monitors download/upload bandwidth from ifconfig eth0.
# Stores data in sqlite3 database, each month gets its own table,
# rows will store bandwidth used on a per day bases. Will use
# ruby daemon gem to keep rows updated every so many seconds.
# Controller script to get statics, daily,monthly,yearly bandwidth reports.
# Can clearly data every so often to save space.
