<%
#
# Get FORM/id and access PostgreSQL to get the note
#
    set r [ns_conn form]
    set id [ns_set get $r id]

    if {[string length $id] < 1} {
        ns_returnredirect [ns_conn location]/index.adp
    }

    set arrayvar(id) $id
    set result [dbi_rows -columns cols -bind arrayvar -result lists {select * from Notes where id = :id}]
    set fresult [lindex $result 0] 
    set title [lindex $fresult 1]
    set body [lindex $fresult 2]
%>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>tnotes</title>
        <link rel="stylesheet" href="css/pure-min.css">
</head>
<body>
<h1>Edit Note - <%= $id %></h1>
<form  class="pure-form" action="handler/UpdateNote.adp" method="post">
    <input name="id" value="<%= $id %>" type="hidden" />
    <div>
        <label name="title">Title</label>
        <div>
            <input name="title" value="<%= $title %>" />
        </div>
        <label name="body">Body</label>
        <div><textarea rows="5" cols="70" name="body"><%= $body %></textarea></div>
    </div>
    <br>
    <div>
        <button type="submit">Save</button>
    </div>
</form>
</body>
</html>
