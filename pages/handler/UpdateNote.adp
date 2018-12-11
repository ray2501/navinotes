<%
#
# Update a note
#
    set r [ns_conn form]
    set id [ns_set get $r id]
    set title [ns_set get $r title]
    set body [ns_set get $r body]

    if {[string length $id] < 1 || [string length $title] < 1 || [string length $body] < 1} {
        ns_returnredirect [ns_conn location]/index.adp
    }

    set arrayvar(id) $id
    set arrayvar(title) $title
    set arrayvar(body) $body
    dbi_dml -bind arrayvar {UPDATE Notes SET Title = :title, Body = :body where Id = :id}
    ns_returnredirect [ns_conn location]/index.adp
%>
