<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.worker.model.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.workpower.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	WorkerVO workerVOlogin = (WorkerVO) session.getAttribute("workerVOLogin");

	ProductService productService = new ProductService();
	List<ProductVO> list = productService.getAllWithOut();

	// 	WorkerService workerSvc = new WorkerService();
	// 	List<WorkerVO> list = workerSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<%-- <jsp:useBean id="WorkPowerSvc" scope="page" --%>
<%-- 	class="com.workpower.model.WorkPowerService" /> --%>
<%-- <jsp:useBean id="PowerListSvc" scope="page" --%>
<%-- 	class="com.powerlist.model.PowerListService" /> --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>訂單</title>

<!-- Custom fonts for this template -->
<link href="assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="assets/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="assets/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="<%=request.getContextPath()%>/back-end/index.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-dumbbell"></i>
				</div>
				<div class="sidebar-brand-text mx-3">IN GYM</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">選單列表</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#one" aria-expanded="true"
				aria-controls="one"> <i class="far fa-grin"></i> <span>員工</span>
			</a>
				<div id="one" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Worker Components:</h6>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/worker/listAllEmp.jsp">搜尋員工</a>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/worker/addEmp.jsp">新增員工</a>
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#two" aria-expanded="true"
				aria-controls="two"> <i class="fas fa-user"></i> <span>會員</span>
			</a>
				<div id="two" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Member Components:</h6>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/mem/listAllMem.jsp">管理會員</a>
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#three" aria-expanded="true"
				aria-controls="three"> <i class="fas fa-object-ungroup"></i> <span>課程</span>
			</a>
				<div id="three" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Class Components:</h6>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/class/listAllClassType.jsp">管理課程</a>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/class/listCoachClassAuth.jsp">專長審查</a>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/class/listCoachAuth.jsp">教練審查</a>
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item active"><a class="nav-link collapsed"
				href="#" data-toggle="collapse" data-target="#four"
				aria-expanded="true" aria-controls="four"> <i
					class="fas fa-store"></i> <span>商城</span>
			</a>
				<div id="four" class="collapse show" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Mall Components:</h6>
						<a class="collapse-item active"
							href="<%=request.getContextPath()%>/back-end/product/listAllProduct.jsp">商品管理</a>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/product/listAllOrder.jsp">訂單管理</a>
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#six" aria-expanded="true"
				aria-controls="six"> <i class="fas fa-bullhorn"></i> <span>檢舉</span>
			</a>
				<div id="six" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Report Components:</h6>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/report/listAllReport.jsp">揪團檢舉</a>
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#seven" aria-expanded="true"
				aria-controls="seven"> <i class="fas fa-hamburger"></i> <span>食品資料庫</span>
			</a>
				<div id="seven" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Food Components:</h6>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/food/listAllFoodBackEnd.jsp">搜尋食物資料庫</a>
						<a class="collapse-item"
							href="<%=request.getContextPath()%>/back-end/food/addFood.jsp">新增食物資料庫</a>
					</div>
				</div></li>


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - User Information -->
						<%
							if (workerVOlogin != null) {
						%>
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small"><%=workerVOlogin.getW_name()%></span>
								<img class="img-profile rounded-circle"
								src="<%=request.getContextPath()%>/workerptool.do?work_id=<%=workerVOlogin.getWork_id()%>">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#Setting"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> 
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/back-end/worker/worker.do?action=logout">
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>
						<%
							}
						%>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">商城</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">

						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>商品編號</th>
											<th>商品名稱</th>
											<th>賣家編號</th>
											<th>價格</th>
											<th>庫存量</th>
											<th>上架日期</th>
											<th>商品狀態</th>
											<th>強制下架</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>商品編號</th>
											<th>商品名稱</th>
											<th>賣家編號</th>
											<th>價格</th>
											<th>庫存量</th>
											<th>上架日期</th>
											<th>商品狀態</th>
											<th>強制下架</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="productVO" items="${list}">
											<tr>
												<td>${productVO.productNo}</td>
												<td>${productVO.pName}</td>
												<td>${productVO.memId}</td>
												<td><fmt:formatNumber value="${productVO.pPrice}"
														pattern="0.#" />元</td>
												<td><fmt:formatNumber value="${productVO.pStock}"
														pattern="0.#" /></td>
												<td><fmt:formatDate value="${productVO.pUploadTime}"
														pattern="yyyy-MM-dd" /></td>
												<td class="pStatus">${listProductByMemId[productVO.pStatus]}</td>
												<td>
													<!--這邊用ajax --> <input type="submit" value="強制下架"
													class="deleteBack" onclick=deleteAJAX(this);> <input
													type="hidden" class="productNo"
													value="${productVO.productNo}">
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
	<!-- 				Setting Modal -->
  <div class="modal fade" id="Setting" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">修改密碼</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
        	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/worker/worker.do" name="form1">
				<table>
				<tr>
				<td>原密碼:</td>
				<td><input type="password" name="w_pw" size=45/></td>
				</tr>
				<tr>
				<td>新密碼:</td>
				<td><input type="password" name="w_npw" id="t_name" size=45/></td>
				</tr>
				</table>
				<br>
				<input type="hidden" name="work_id" value="${workerVOLogin.work_id}" >
				<input type="hidden" name="action" value="update_pw">
				<input type="submit" value="送出修改">
			</FORM>
        </div>
      </div>
    </div>
  </div>

	<!-- Bootstrap core JavaScript-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="assets/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="assets/js/demo/datatables-demo.js"></script>
	<script src="assets/js/wedyListAllProduct.js"></script>

</body>
<script>
// 	$("#dataTable").DataTable({
// 		"aLengthMenu" : [ 5, 10, 25, 50, 100 ]
// 	});
</script>

</html>
