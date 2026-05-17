<?php
require_once '../inc/user_session.inc.php';


if (isset($_POST['add'])) {

	$rules = [
		'sub_link' => [
			'required'
		],
		'sub_link_name' => [
			'required'
		],
		'sub_link_icon' => [
			'required'
		],
		'sub_url_role' => [
			'required'
		]
	];

	$validation_result = SimpleValidator\Validator::validate($_POST, $rules);
	if ($validation_result->isSuccess()) {

		if ($AdminTask->SubAddUrl($_POST)) {
			$GetSiteRepsonseStatus = $site_settings->GetSiteRepsonseStatus([], ['New Url is Successful Added']);
		} else {
			$GetSiteRepsonseStatus = $site_settings->GetSiteRepsonseStatus(['Error Occur ! Maybe Url is already added']);
		}
	} else {
		$GetSiteRepsonseStatus = $site_settings->GetSiteRepsonseStatus($validation_result->getErrors());
	}
}

?>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:10:19 GMT -->

<head>

	<?php
	$PAGE_TITLE   = 'Add Sub-Url';
	$URL_NAME     = 'add-sub-url';
	require_once("../inc/accessbility_controller.inc.php");
	require_once '../layout/dashboard-header-layout-property.php';
	?>
</head>

<body class="ttr-opened-sidebar ttr-pinned-sidebar">

	<?php
	require_once '../layout/dashboard-header.php';
	require_once '../layout/dashboard-sidebar.php';

	?>

	<!--Main container start -->
	<main class="ttr-wrapper">
		<div class="container-fluid">

			<?php
			require_once '../layout/dashboard-header-bottom.php';
			?>
			<div class="row">
				<!-- Your Profile Views Chart -->
				<div class="col-lg-12 m-b30">
					<div class="widget-box">
						<div class="wc-title">
							<h4><?= $PAGE_TITLE ?></h4>
						</div>
						<div class="widget-inner">
							<div id="response_status">
								<?= isset($GetSiteRepsonseStatus) ? $GetSiteRepsonseStatus : '' ?>
							</div>
							<form class="edit-profile m-b30" action="" method="POST">
								<div class="row">

									<div class="form-group col-6">
										<label class="col-form-label">Sub-Url Link :</label>
										<div>
											<input name="sub_link" class="form-control" type="text" value="" required="">
										</div>
									</div>
									<div class="form-group col-6">
										<label class="col-form-label">Sub-Url Name :</label>
										<div>
											<input name="sub_link_name" class="form-control" type="text" value="" required="">
										</div>
									</div>
									<div class="form-group col-6">
										<label class="col-form-label">Main-Url-Link</label>
										<div>
											<select name="url_id" class="form-control" required="">
												<?php
												if ($links = $site_settings->url_link($Auth->admin_role)) {
													foreach ($links as $link) {
												?>
														<option value="<?= $link->id ?>"><?= $link->link_name ?></option>

												<?php
													}
												}
												?>
											</select>
										</div>
									</div>
									<div class="form-group col-6">
										<label class="col-form-label">Url Icon</label>
										<div>
											<input name="sub_link_icon" class="form-control" type="text" value="" required="">
										</div>
									</div>



									<div class="form-group col-12">
										<label class="col-form-label">Admin Role</label>
										<div>
											<select name="sub_url_role" class="form-control" required="">
												<option value="1">developer</option>
												<option value="2">Admin</option>

											</select>
										</div>
									</div>

									<div class="seperator"></div>



									<div class="col-12">
										<button type="submit" class="btn" name="add">Save changes</button>

									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
				<!-- Your Profile Views Chart END-->
			</div>





		</div>
	</main>
	<?php
	require_once '../layout/dashboard-footer-layout-property.php';
	?>


</html>