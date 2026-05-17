<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE   = 'Bardetech Plans Manager';
$URL_NAME     = 'dashboard/manage-bardetech-plans';
require_once("../inc/accessbility_controller.inc.php");

// Handle auto-match POST
$match_results = [];
if (isset($_POST['auto_match'])) {
    $sme_datas = $TopupController->Get_All_SME_Data();
    // Fetch all Bardetech plans for all networks
    $barde_all = [];
    foreach ([1,2,3,4] as $net) {
        $plans = $TopupController->FetchBardePlans($net);
        if (is_array($plans)) {
            $barde_all = array_merge($barde_all, $plans);
        }
    }

    $updated = 0;
    $skipped = 0;
    foreach ($sme_datas as $row) {
        $bundle_clean = strtolower(trim($row->data_bundle)); // e.g. "1gb", "2gb"
        // Normalize: "1 GB" -> "1.0GB", "1GB" -> "1.0GB"
        $bundle_clean = preg_replace('/\s+/', '', $bundle_clean);
        $bundle_clean = preg_replace('/(\d+)gb/i', '$1.0GB', $bundle_clean);
        $bundle_clean = strtoupper($bundle_clean);

        // Map network_id to Bardetech network int
        $net_map = [1=>1, 2=>2, 3=>3, 4=>4]; // MTN=1, GLO=2, 9MOBILE=3, AIRTEL=4
        $target_net = $net_map[$row->network_id] ?? null;

        $best_match = null;
        foreach ($barde_all as $p) {
            if (intval($p->network) !== intval($target_net)) continue;
            $p_plan = strtoupper(preg_replace('/\s+/', '', $p->plan));
            // e.g. "2.0GB"
            if ($p_plan === $bundle_clean || $p_plan === str_replace('.0GB','GB',$bundle_clean)) {
                $best_match = $p;
                break;
            }
        }

        if ($best_match) {
            $TopupController->Update_SME_Data(
                $row->id, $row->direct_price, $row->our_price,
                $row->data_bundle, $row->data_duration,
                $best_match->dataplan_id
            );
            $match_results[] = ['bundle' => $row->data_bundle, 'network' => $row->network_id, 'matched_id' => $best_match->dataplan_id, 'matched_plan' => $best_match->plan, 'status' => 'matched'];
            $updated++;
        } else {
            $match_results[] = ['bundle' => $row->data_bundle, 'network' => $row->network_id, 'matched_id' => null, 'matched_plan' => null, 'status' => 'no-match'];
            $skipped++;
        }
    }
    if ($updated > 0) {
        array_push($SITE_SUCCESS, "$updated bundles auto-matched to Bardetech plan IDs. $skipped could not be matched.");
    }
}

// Fetch live Bardetech plans for display
$barde_plans = [];
$api_error   = null;
foreach ([1,2,3,4] as $net) {
    $plans = $TopupController->FetchBardePlans($net);
    if (is_array($plans)) {
        $barde_plans = array_merge($barde_plans, $plans);
    } elseif ($net === 1) {
        $api_error = 'Could not reach Bardetech API. Check your token.';
    }
}

$network_names = [1=>'MTN', 2=>'Glo', 3=>'9mobile', 4=>'Airtel'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
   <?php require_once 'layout/header-propt.inc.php'; ?>
   <title><?= $PAGE_TITLE . " | " . SITE_TITLE ?></title>
</head>
<body>
   <?php require_once 'layout/preloader.inc.php'; ?>
   <div id="main-wrapper">
      <?php
      require_once 'layout/header.inc.php';
      require_once 'layout/sidebar.inc.php';
      ?>
      <div class="content-body">
        <?php include('layout/minor-top-navbar.inc.php'); ?>
        <div class="container-fluid">

          <div class="row page-titles mx-0">
            <div class="col-sm-6 p-md-0">
              <div class="welcome-text">
                <h4 style="color:#003366;font-size:20px"><?= $PAGE_TITLE ?></h4>
                <p class="text-muted mb-0">Live plans fetched directly from the Bardetech API</p>
              </div>
            </div>
            <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)"><?= SITE_TITLE ?></a></li>
                <li class="breadcrumb-item"><a href="manage-sme-data.php">Manage SME Data</a></li>
                <li class="breadcrumb-item active"><?= $PAGE_TITLE ?></li>
              </ol>
            </div>
          </div>

          <?php if (!empty($match_results)): ?>
          <div class="row mb-3">
            <div class="col-12">
              <div class="card border-left-success">
                <div class="card-body">
                  <h5>Auto-Match Results</h5>
                  <table class="table table-sm table-bordered">
                    <thead class="thead-light">
                      <tr><th>Bundle</th><th>Network</th><th>Bardetech Plan ID</th><th>Matched Plan</th><th>Status</th></tr>
                    </thead>
                    <tbody>
                    <?php foreach ($match_results as $r): ?>
                      <tr class="<?= $r['status']==='matched' ? 'table-success' : 'table-warning' ?>">
                        <td><?= htmlspecialchars($r['bundle']) ?></td>
                        <td><?= $network_names[$r['network']] ?? $r['network'] ?></td>
                        <td><?= $r['matched_id'] ?? '—' ?></td>
                        <td><?= $r['matched_plan'] ?? 'Not found' ?></td>
                        <td><span class="badge badge-<?= $r['status']==='matched'?'success':'warning' ?>"><?= ucfirst($r['status']) ?></span></td>
                      </tr>
                    <?php endforeach; ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <?php endif; ?>

          <!-- Auto-Match Card -->
          <div class="row mb-3">
            <div class="col-12">
              <div class="card border-left-primary">
                <div class="card-body d-flex align-items-center justify-content-between flex-wrap">
                  <div>
                    <h5 class="mb-1">Auto-Match Bardetech Plan IDs</h5>
                    <p class="text-muted mb-0">Automatically matches your existing bundles to Bardetech plan IDs by comparing bundle size and network. Review results before going live.</p>
                  </div>
                  <form action="" method="POST" class="mt-2 mt-md-0">
                    <button name="auto_match" type="submit" value="1" class="btn btn-primary btn-lg"
                            onclick="return confirm('Auto-match all bundles to Bardetech plan IDs? Existing Bardetech IDs will be overwritten.');">
                      Auto-Match Plans
                    </button>
                    <a href="manage-sme-data.php" class="btn btn-outline-secondary btn-lg ml-2">Manual Edit</a>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <!-- Live Plan Table -->
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4 class="card-title mb-0">Bardetech Available Plans (Live)</h4>
                  <?php if (!$api_error): ?>
                    <span class="badge badge-success"><?= count($barde_plans) ?> plans fetched</span>
                  <?php endif; ?>
                </div>
                <div class="card-body">

                  <?php if ($api_error): ?>
                    <div class="alert alert-danger"><?= htmlspecialchars($api_error) ?></div>
                  <?php else: ?>

                  <!-- Network filter tabs -->
                  <ul class="nav nav-pills mb-3" id="networkTab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" data-toggle="pill" href="#net-all">All (<?= count($barde_plans) ?>)</a>
                    </li>
                    <?php foreach ([1=>'MTN',2=>'Glo',3=>'9mobile',4=>'Airtel'] as $nid => $nname): 
                      $cnt = count(array_filter($barde_plans, fn($p) => intval($p->network) === $nid)); ?>
                    <li class="nav-item">
                      <a class="nav-link" data-toggle="pill" href="#net-<?= $nid ?>"><?= $nname ?> (<?= $cnt ?>)</a>
                    </li>
                    <?php endforeach; ?>
                  </ul>

                  <div class="tab-content">
                    <?php
                    $tab_groups = ['all' => $barde_plans, 1=>[], 2=>[], 3=>[], 4=>[]];
                    foreach ($barde_plans as $p) $tab_groups[intval($p->network)][] = $p;

                    foreach ($tab_groups as $key => $plans):
                      $active = $key === 'all' ? 'show active' : '';
                    ?>
                    <div class="tab-pane fade <?= $active ?>" id="net-<?= $key ?>">
                      <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover table-sm">
                          <thead class="thead-dark">
                            <tr>
                              <th>Plan ID</th>
                              <th>Network</th>
                              <th>Type</th>
                              <th>Bundle Size</th>
                              <th>Validity</th>
                              <th>Bardetech Price (₦)</th>
                            </tr>
                          </thead>
                          <tbody>
                          <?php if (empty($plans)): ?>
                            <tr><td colspan="6" class="text-center text-muted">No plans for this network</td></tr>
                          <?php endif; ?>
                          <?php foreach ($plans as $p): ?>
                            <tr>
                              <td><code class="text-primary font-weight-bold"><?= htmlspecialchars($p->dataplan_id ?? $p->id) ?></code></td>
                              <td><?= htmlspecialchars($p->plan_network ?? '') ?></td>
                              <td><span class="badge badge-info"><?= htmlspecialchars($p->plan_type ?? '') ?></span></td>
                              <td><strong><?= htmlspecialchars($p->plan ?? '') ?></strong></td>
                              <td><?= htmlspecialchars($p->month_validate ?? '') ?></td>
                              <td>₦<?= number_format(floatval($p->plan_amount ?? 0), 2) ?></td>
                            </tr>
                          <?php endforeach; ?>
                          </tbody>
                        </table>
                      </div>
                    </div>
                    <?php endforeach; ?>
                  </div>

                  <div class="alert alert-info mt-3">
                    <strong>How to use these Plan IDs:</strong> Copy the <strong>Plan ID</strong> from the table above and paste it into the <strong>Bardetech Plan ID</strong> field in <a href="manage-sme-data.php" class="alert-link">Manage SME Data</a>. Or click <strong>Auto-Match Plans</strong> above to do it automatically.
                  </div>

                  <?php endif; ?>

                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
   </div>
  <?php
  require_once 'layout/footer.inc.php';
  require_once 'layout/footer-propt.inc.php';
  ?>
</body>
</html>
