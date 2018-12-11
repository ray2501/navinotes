<%
#
# Delete a note
#
    set r [ns_conn form]
    set id [ns_set get $r id]

    if {[string length $id] < 1} {
        ns_returnredirect [ns_conn location]/index.adp
    }

    set arrayvar(id) $id
    dbi_dml -bind arrayvar {DELETE FROM Notes where Id = :id}
    ns_returnredirect [ns_conn location]/index.adp
%>
