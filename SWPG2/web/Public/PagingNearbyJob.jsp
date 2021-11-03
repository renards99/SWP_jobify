<%
    int pageIndex = Integer.parseInt(request.getAttribute("current1").toString());
    int totalPage = Integer.parseInt(request.getAttribute("total1").toString());
    String controller = request.getAttribute("controller").toString();
%>
<div>
    <nav aria-label="Page navigation example">
        <ul class="pagination pagination-sm">
            <li class="page-item">
                <a class="page-link text-dark" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <% if (totalPage > 0) {%>
            <%for (int i = 1; i <= totalPage; i++) {%>
            <li class="page-item">
                <a class="page-link text-dark" href="<%=controller%>?page=<%=i%>"  <%if (i == pageIndex) {%> class="current"<%}%>><%=i%></a>
            </li>
                <%}%>
            <%}%>
            
            <li class="page-item">
                <a class="page-link text-dark" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>