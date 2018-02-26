frab Cookbook
=============
This cookbook installs and configures the free and open conference management system [frab](http://frab.github.io/frab/ "Free and open conference management system frab").

Requirements
------------
- Ubuntu 16.04 LTS

Attributes
----------
## Global settings: frab::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['frab']['environment']</tt></td>
    <td>String</td>
    <td>Rails environemnt, e.g. <tt>development</tt>, <tt>test</tt>, <tt>production</tt></td>
    <td><tt>development</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['install']['dir']</tt></td>
    <td>String</td>
    <td>Install directory for frab</td>
    <td><tt>/srv/frab</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['install']['release']</tt></td>
    <td>String</td>
    <td>Git reference for frab version</td>
    <td><tt>master</tt></td>
  </tr>
</table>

## Development environment: frab::default
<table>
  <tr>
    <td><tt>['frab']['settings']['development']['host']</tt></td>
    <td>String</td>
    <td>Configure frab host for settings.yml</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['settings']['development']['port']</tt></td>
    <td>Integer</td>
    <td>Configure frab port for WebBrick web server in settings.yml</td>
    <td><tt>3000</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['settings']['development']['protocol']</tt></td>
    <td>String</td>
    <td>Configure frab transport protocol for WebBrick web server in settings.yml</td>
    <td><tt>http</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['settings']['development']['from_email']</tt></td>
    <td>String</td>
    <td>Configure frab recepient mail address in settings.yml</td>
    <td><tt>frab@localhost</tt></td>
  </tr>
  <tr>
     <td><tt>['frab']['database']['development']['adapter']</tt></td>
     <td>String</td>
     <td>Configure frab database adapter in database.yml</td>
     <td><tt>sqlite3</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['development']['sqlitedb_path']</tt></td>
    <td>String</td>
    <td>Configure frab database SQLite path relative to install directory in database.yml</td>
    <td><tt>db/development.sqlite3</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['development']['pool']</tt></td>
    <td>Integer</td>
    <td>Configure frab database SQLite pool size in database.yml</td>
    <td><tt>5</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['development']['timeout']</tt></td>
    <td>Integer</td>
    <td>Configure frab database SQLite connection timeout in database.yml</td>
    <td><tt>5000</tt></td>
  </tr>
</table>

## Test environment: frab::default
<table>
  <tr>
    <td><tt>['frab']['settings']['test']['host']</tt></td>
    <td>String</td>
    <td>Configure frab host for settings.yml</td>
    <td><tt>frab.test</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['settings']['test']['protocol']</tt></td>
    <td>String</td>
    <td>Configure frab transport protocol for WebBrick web server in settings.yml</td>
    <td><tt>http</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['settings']['test']['from_email']</tt></td>
    <td>String</td>
    <td>Configure frab recepient mail address in settings.yml</td>
    <td><tt>frab@frab.test</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['test']['adapter']</tt></td>
    <td>String</td>
    <td>Configure frab database adapter in database.yml</td>
    <td><tt>sqlite3</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['test']['sqlitedb_path']</tt></td>
    <td>String</td>
    <td>Configure frab database SQLite path relative to install directory in database.yml</td>
    <td><tt>db/development.sqlite3</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['test']['pool']</tt></td>
    <td>Integer</td>
    <td>Configure frab database SQLite pool size in database.yml</td>
    <td><tt>5</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['test']['timeout']</tt></td>
    <td>Integer</td>
    <td>Configure frab database SQLite connection timeout in database.yml</td>
    <td><tt>5000</tt></td>
  </tr>
</table>

## Production environment: frab::default
<table>
  <tr>
    <td><tt>['frab']['settings']['production']['host']</tt></td>
    <td>String</td>
    <td>Configure frab host for settings.yml</td>
    <td><tt>frab.test</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['settings']['production']['protocol']</tt></td>
    <td>String</td>
    <td>Configure frab transport protocol for WebBrick web server in settings.yml</td>
    <td><tt>http</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['settings']['production']['from_email']</tt></td>
    <td>String</td>
    <td>Configure frab recepient mail address in settings.yml</td>
    <td><tt>frab@frab.test</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['production']['adapter']</tt></td>
    <td>String</td>
    <td>Configure frab database adapter in database.yml</td>
    <td><tt>sqlite3</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['production']['sqlitedb_path']</tt></td>
    <td>String</td>
    <td>Configure frab database SQLite path relative to install directory in database.yml</td>
    <td><tt>db/development.sqlite3</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['production']['pool']</tt></td>
    <td>Integer</td>
    <td>Configure frab database SQLite pool size in database.yml</td>
    <td><tt>5</tt></td>
  </tr>
  <tr>
    <td><tt>['frab']['database']['production']['timeout']</tt></td>
    <td>Integer</td>
    <td>Configure frab database SQLite connection timeout in database.yml</td>
    <td><tt>5000</tt></td>
  </tr>
</table>

Contributing
------------
If this is a public cookbook, detail the process for contributing.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Ronny Trommer <ronny@opennms.org>
