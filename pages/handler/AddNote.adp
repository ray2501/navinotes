<%
#
# Handler: Add a note
#
    set r [ns_conn form]
    set title [ns_set get $r title]
    set body [ns_set get $r body]

    if {[string length $title] < 1 || [string length $body] < 1} {
        ns_returnredirect [ns_conn location]/index.adp
    }

    set arrayvar(title) $title
    set arrayvar(body) $body
    dbi_dml -bind arrayvar {INSERT INTO Notes (title, body, created) values (:title, :body, now())}
    ns_returnredirect [ns_conn location]/index.adp
%>
