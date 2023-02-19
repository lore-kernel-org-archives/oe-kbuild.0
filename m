Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697A6EBB
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676802396; x=1708338396;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zfduNAxNefUu+Fap/zYNPjHaXhYlJZxW5Cih6AhFr1A=;
  b=Af1Ak04HPMNpmGAfY65wQOso/hy96JP/GFu2eJzyeb/afYx3PvbTlzTY
   ItR4tTc/gYRkNw5QyfH0IDJxKEo1D8HDU8AwODbXve0vhBZVOb4qCKUlc
   4QbivkeD1wP2KnMtaK7f48cWtpGjbVQ1Rv1hsdnLYapBZYqVw0LkSRK2f
   ccDdpAr2Vx2QM7dhCN+bN6pQ3xPtKIIUHIBXFXRedmre1wqMi4ZW2OS4/
   DiBr8o34jxj4SfTl5ZBmH6dQLIGYRscRKY4iymMpoplABioBEuH+TE3Mz
   pH/oAG15lX6sd2rJg8AgPTys9QdOL7HXHyxw87jFAiUARiUVqMYjZi0WD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="333600104"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="333600104"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 02:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="664340032"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="664340032"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Feb 2023 02:26:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTgtt-000DF5-1k;
	Sun, 19 Feb 2023 10:26:33 +0000
Date: Sun, 19 Feb 2023 18:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/skl_watermark.c:1522
 skl_crtc_allocate_plane_ddb() error: uninitialized symbol 'blocks'.
Message-ID: <202302191846.4oeXQ8wO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 42a0d256496f4526046b9779ea6e49018b58f779 drm/i915: Extract skl_watermark.c
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230219/202302191846.4oeXQ8wO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191846.4oeXQ8wO-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/skl_watermark.c:1522 skl_crtc_allocate_plane_ddb() error: uninitialized symbol 'blocks'.

vim +/blocks +1522 drivers/gpu/drm/i915/display/skl_watermark.c

42a0d256496f45 Ville Syrjälä 2022-09-08  1448  
42a0d256496f45 Ville Syrjälä 2022-09-08  1449  static int
42a0d256496f45 Ville Syrjälä 2022-09-08  1450  skl_crtc_allocate_plane_ddb(struct intel_atomic_state *state,
42a0d256496f45 Ville Syrjälä 2022-09-08  1451  			    struct intel_crtc *crtc)
42a0d256496f45 Ville Syrjälä 2022-09-08  1452  {
42a0d256496f45 Ville Syrjälä 2022-09-08  1453  	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
42a0d256496f45 Ville Syrjälä 2022-09-08  1454  	struct intel_crtc_state *crtc_state =
42a0d256496f45 Ville Syrjälä 2022-09-08  1455  		intel_atomic_get_new_crtc_state(state, crtc);
42a0d256496f45 Ville Syrjälä 2022-09-08  1456  	const struct intel_dbuf_state *dbuf_state =
42a0d256496f45 Ville Syrjälä 2022-09-08  1457  		intel_atomic_get_new_dbuf_state(state);
42a0d256496f45 Ville Syrjälä 2022-09-08  1458  	const struct skl_ddb_entry *alloc = &dbuf_state->ddb[crtc->pipe];
42a0d256496f45 Ville Syrjälä 2022-09-08  1459  	int num_active = hweight8(dbuf_state->active_pipes);
42a0d256496f45 Ville Syrjälä 2022-09-08  1460  	struct skl_plane_ddb_iter iter;
42a0d256496f45 Ville Syrjälä 2022-09-08  1461  	enum plane_id plane_id;
42a0d256496f45 Ville Syrjälä 2022-09-08  1462  	u16 cursor_size;
42a0d256496f45 Ville Syrjälä 2022-09-08  1463  	u32 blocks;
42a0d256496f45 Ville Syrjälä 2022-09-08  1464  	int level;
42a0d256496f45 Ville Syrjälä 2022-09-08  1465  
42a0d256496f45 Ville Syrjälä 2022-09-08  1466  	/* Clear the partitioning for disabled planes. */
42a0d256496f45 Ville Syrjälä 2022-09-08  1467  	memset(crtc_state->wm.skl.plane_ddb, 0, sizeof(crtc_state->wm.skl.plane_ddb));
42a0d256496f45 Ville Syrjälä 2022-09-08  1468  	memset(crtc_state->wm.skl.plane_ddb_y, 0, sizeof(crtc_state->wm.skl.plane_ddb_y));
42a0d256496f45 Ville Syrjälä 2022-09-08  1469  
42a0d256496f45 Ville Syrjälä 2022-09-08  1470  	if (!crtc_state->hw.active)
42a0d256496f45 Ville Syrjälä 2022-09-08  1471  		return 0;
42a0d256496f45 Ville Syrjälä 2022-09-08  1472  
42a0d256496f45 Ville Syrjälä 2022-09-08  1473  	iter.start = alloc->start;
42a0d256496f45 Ville Syrjälä 2022-09-08  1474  	iter.size = skl_ddb_entry_size(alloc);
42a0d256496f45 Ville Syrjälä 2022-09-08  1475  	if (iter.size == 0)
42a0d256496f45 Ville Syrjälä 2022-09-08  1476  		return 0;
42a0d256496f45 Ville Syrjälä 2022-09-08  1477  
42a0d256496f45 Ville Syrjälä 2022-09-08  1478  	/* Allocate fixed number of blocks for cursor. */
42a0d256496f45 Ville Syrjälä 2022-09-08  1479  	cursor_size = skl_cursor_allocation(crtc_state, num_active);
42a0d256496f45 Ville Syrjälä 2022-09-08  1480  	iter.size -= cursor_size;
42a0d256496f45 Ville Syrjälä 2022-09-08  1481  	skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb[PLANE_CURSOR],
42a0d256496f45 Ville Syrjälä 2022-09-08  1482  			   alloc->end - cursor_size, alloc->end);
42a0d256496f45 Ville Syrjälä 2022-09-08  1483  
42a0d256496f45 Ville Syrjälä 2022-09-08  1484  	iter.data_rate = skl_total_relative_data_rate(crtc_state);
42a0d256496f45 Ville Syrjälä 2022-09-08  1485  
42a0d256496f45 Ville Syrjälä 2022-09-08  1486  	/*
42a0d256496f45 Ville Syrjälä 2022-09-08  1487  	 * Find the highest watermark level for which we can satisfy the block
42a0d256496f45 Ville Syrjälä 2022-09-08  1488  	 * requirement of active planes.
42a0d256496f45 Ville Syrjälä 2022-09-08  1489  	 */
42a0d256496f45 Ville Syrjälä 2022-09-08  1490  	for (level = ilk_wm_max_level(i915); level >= 0; level--) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1491  		blocks = 0;
42a0d256496f45 Ville Syrjälä 2022-09-08  1492  		for_each_plane_id_on_crtc(crtc, plane_id) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1493  			const struct skl_plane_wm *wm =
42a0d256496f45 Ville Syrjälä 2022-09-08  1494  				&crtc_state->wm.skl.optimal.planes[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1495  
42a0d256496f45 Ville Syrjälä 2022-09-08  1496  			if (plane_id == PLANE_CURSOR) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1497  				const struct skl_ddb_entry *ddb =
42a0d256496f45 Ville Syrjälä 2022-09-08  1498  					&crtc_state->wm.skl.plane_ddb[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1499  
42a0d256496f45 Ville Syrjälä 2022-09-08  1500  				if (wm->wm[level].min_ddb_alloc > skl_ddb_entry_size(ddb)) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1501  					drm_WARN_ON(&i915->drm,
42a0d256496f45 Ville Syrjälä 2022-09-08  1502  						    wm->wm[level].min_ddb_alloc != U16_MAX);
42a0d256496f45 Ville Syrjälä 2022-09-08  1503  					blocks = U32_MAX;
42a0d256496f45 Ville Syrjälä 2022-09-08  1504  					break;
42a0d256496f45 Ville Syrjälä 2022-09-08  1505  				}
42a0d256496f45 Ville Syrjälä 2022-09-08  1506  				continue;
42a0d256496f45 Ville Syrjälä 2022-09-08  1507  			}
42a0d256496f45 Ville Syrjälä 2022-09-08  1508  
42a0d256496f45 Ville Syrjälä 2022-09-08  1509  			blocks += wm->wm[level].min_ddb_alloc;
42a0d256496f45 Ville Syrjälä 2022-09-08  1510  			blocks += wm->uv_wm[level].min_ddb_alloc;
42a0d256496f45 Ville Syrjälä 2022-09-08  1511  		}
42a0d256496f45 Ville Syrjälä 2022-09-08  1512  
42a0d256496f45 Ville Syrjälä 2022-09-08  1513  		if (blocks <= iter.size) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1514  			iter.size -= blocks;
42a0d256496f45 Ville Syrjälä 2022-09-08  1515  			break;
42a0d256496f45 Ville Syrjälä 2022-09-08  1516  		}
42a0d256496f45 Ville Syrjälä 2022-09-08  1517  	}
42a0d256496f45 Ville Syrjälä 2022-09-08  1518  
42a0d256496f45 Ville Syrjälä 2022-09-08  1519  	if (level < 0) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1520  		drm_dbg_kms(&i915->drm,
42a0d256496f45 Ville Syrjälä 2022-09-08  1521  			    "Requested display configuration exceeds system DDB limitations");
42a0d256496f45 Ville Syrjälä 2022-09-08 @1522  		drm_dbg_kms(&i915->drm, "minimum required %d/%d\n",
42a0d256496f45 Ville Syrjälä 2022-09-08  1523  			    blocks, iter.size);
42a0d256496f45 Ville Syrjälä 2022-09-08  1524  		return -EINVAL;
42a0d256496f45 Ville Syrjälä 2022-09-08  1525  	}
42a0d256496f45 Ville Syrjälä 2022-09-08  1526  
42a0d256496f45 Ville Syrjälä 2022-09-08  1527  	/* avoid the WARN later when we don't allocate any extra DDB */
42a0d256496f45 Ville Syrjälä 2022-09-08  1528  	if (iter.data_rate == 0)
42a0d256496f45 Ville Syrjälä 2022-09-08  1529  		iter.size = 0;
42a0d256496f45 Ville Syrjälä 2022-09-08  1530  
42a0d256496f45 Ville Syrjälä 2022-09-08  1531  	/*
42a0d256496f45 Ville Syrjälä 2022-09-08  1532  	 * Grant each plane the blocks it requires at the highest achievable
42a0d256496f45 Ville Syrjälä 2022-09-08  1533  	 * watermark level, plus an extra share of the leftover blocks
42a0d256496f45 Ville Syrjälä 2022-09-08  1534  	 * proportional to its relative data rate.
42a0d256496f45 Ville Syrjälä 2022-09-08  1535  	 */
42a0d256496f45 Ville Syrjälä 2022-09-08  1536  	for_each_plane_id_on_crtc(crtc, plane_id) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1537  		struct skl_ddb_entry *ddb =
42a0d256496f45 Ville Syrjälä 2022-09-08  1538  			&crtc_state->wm.skl.plane_ddb[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1539  		struct skl_ddb_entry *ddb_y =
42a0d256496f45 Ville Syrjälä 2022-09-08  1540  			&crtc_state->wm.skl.plane_ddb_y[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1541  		const struct skl_plane_wm *wm =
42a0d256496f45 Ville Syrjälä 2022-09-08  1542  			&crtc_state->wm.skl.optimal.planes[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1543  
42a0d256496f45 Ville Syrjälä 2022-09-08  1544  		if (plane_id == PLANE_CURSOR)
42a0d256496f45 Ville Syrjälä 2022-09-08  1545  			continue;
42a0d256496f45 Ville Syrjälä 2022-09-08  1546  
42a0d256496f45 Ville Syrjälä 2022-09-08  1547  		if (DISPLAY_VER(i915) < 11 &&
42a0d256496f45 Ville Syrjälä 2022-09-08  1548  		    crtc_state->nv12_planes & BIT(plane_id)) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1549  			skl_allocate_plane_ddb(&iter, ddb_y, &wm->wm[level],
42a0d256496f45 Ville Syrjälä 2022-09-08  1550  					       crtc_state->rel_data_rate_y[plane_id]);
42a0d256496f45 Ville Syrjälä 2022-09-08  1551  			skl_allocate_plane_ddb(&iter, ddb, &wm->uv_wm[level],
42a0d256496f45 Ville Syrjälä 2022-09-08  1552  					       crtc_state->rel_data_rate[plane_id]);
42a0d256496f45 Ville Syrjälä 2022-09-08  1553  		} else {
42a0d256496f45 Ville Syrjälä 2022-09-08  1554  			skl_allocate_plane_ddb(&iter, ddb, &wm->wm[level],
42a0d256496f45 Ville Syrjälä 2022-09-08  1555  					       crtc_state->rel_data_rate[plane_id]);
42a0d256496f45 Ville Syrjälä 2022-09-08  1556  		}
42a0d256496f45 Ville Syrjälä 2022-09-08  1557  	}
42a0d256496f45 Ville Syrjälä 2022-09-08  1558  	drm_WARN_ON(&i915->drm, iter.size != 0 || iter.data_rate != 0);
42a0d256496f45 Ville Syrjälä 2022-09-08  1559  
42a0d256496f45 Ville Syrjälä 2022-09-08  1560  	/*
42a0d256496f45 Ville Syrjälä 2022-09-08  1561  	 * When we calculated watermark values we didn't know how high
42a0d256496f45 Ville Syrjälä 2022-09-08  1562  	 * of a level we'd actually be able to hit, so we just marked
42a0d256496f45 Ville Syrjälä 2022-09-08  1563  	 * all levels as "enabled."  Go back now and disable the ones
42a0d256496f45 Ville Syrjälä 2022-09-08  1564  	 * that aren't actually possible.
42a0d256496f45 Ville Syrjälä 2022-09-08  1565  	 */
42a0d256496f45 Ville Syrjälä 2022-09-08  1566  	for (level++; level <= ilk_wm_max_level(i915); level++) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1567  		for_each_plane_id_on_crtc(crtc, plane_id) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1568  			const struct skl_ddb_entry *ddb =
42a0d256496f45 Ville Syrjälä 2022-09-08  1569  				&crtc_state->wm.skl.plane_ddb[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1570  			const struct skl_ddb_entry *ddb_y =
42a0d256496f45 Ville Syrjälä 2022-09-08  1571  				&crtc_state->wm.skl.plane_ddb_y[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1572  			struct skl_plane_wm *wm =
42a0d256496f45 Ville Syrjälä 2022-09-08  1573  				&crtc_state->wm.skl.optimal.planes[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1574  
42a0d256496f45 Ville Syrjälä 2022-09-08  1575  			if (DISPLAY_VER(i915) < 11 &&
42a0d256496f45 Ville Syrjälä 2022-09-08  1576  			    crtc_state->nv12_planes & BIT(plane_id))
42a0d256496f45 Ville Syrjälä 2022-09-08  1577  				skl_check_nv12_wm_level(&wm->wm[level],
42a0d256496f45 Ville Syrjälä 2022-09-08  1578  							&wm->uv_wm[level],
42a0d256496f45 Ville Syrjälä 2022-09-08  1579  							ddb_y, ddb);
42a0d256496f45 Ville Syrjälä 2022-09-08  1580  			else
42a0d256496f45 Ville Syrjälä 2022-09-08  1581  				skl_check_wm_level(&wm->wm[level], ddb);
42a0d256496f45 Ville Syrjälä 2022-09-08  1582  
42a0d256496f45 Ville Syrjälä 2022-09-08  1583  			if (icl_need_wm1_wa(i915, plane_id) &&
42a0d256496f45 Ville Syrjälä 2022-09-08  1584  			    level == 1 && wm->wm[0].enable) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1585  				wm->wm[level].blocks = wm->wm[0].blocks;
42a0d256496f45 Ville Syrjälä 2022-09-08  1586  				wm->wm[level].lines = wm->wm[0].lines;
42a0d256496f45 Ville Syrjälä 2022-09-08  1587  				wm->wm[level].ignore_lines = wm->wm[0].ignore_lines;
42a0d256496f45 Ville Syrjälä 2022-09-08  1588  			}
42a0d256496f45 Ville Syrjälä 2022-09-08  1589  		}
42a0d256496f45 Ville Syrjälä 2022-09-08  1590  	}
42a0d256496f45 Ville Syrjälä 2022-09-08  1591  
42a0d256496f45 Ville Syrjälä 2022-09-08  1592  	/*
42a0d256496f45 Ville Syrjälä 2022-09-08  1593  	 * Go back and disable the transition and SAGV watermarks
42a0d256496f45 Ville Syrjälä 2022-09-08  1594  	 * if it turns out we don't have enough DDB blocks for them.
42a0d256496f45 Ville Syrjälä 2022-09-08  1595  	 */
42a0d256496f45 Ville Syrjälä 2022-09-08  1596  	for_each_plane_id_on_crtc(crtc, plane_id) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1597  		const struct skl_ddb_entry *ddb =
42a0d256496f45 Ville Syrjälä 2022-09-08  1598  			&crtc_state->wm.skl.plane_ddb[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1599  		const struct skl_ddb_entry *ddb_y =
42a0d256496f45 Ville Syrjälä 2022-09-08  1600  			&crtc_state->wm.skl.plane_ddb_y[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1601  		struct skl_plane_wm *wm =
42a0d256496f45 Ville Syrjälä 2022-09-08  1602  			&crtc_state->wm.skl.optimal.planes[plane_id];
42a0d256496f45 Ville Syrjälä 2022-09-08  1603  
42a0d256496f45 Ville Syrjälä 2022-09-08  1604  		if (DISPLAY_VER(i915) < 11 &&
42a0d256496f45 Ville Syrjälä 2022-09-08  1605  		    crtc_state->nv12_planes & BIT(plane_id)) {
42a0d256496f45 Ville Syrjälä 2022-09-08  1606  			skl_check_wm_level(&wm->trans_wm, ddb_y);
42a0d256496f45 Ville Syrjälä 2022-09-08  1607  		} else {
42a0d256496f45 Ville Syrjälä 2022-09-08  1608  			WARN_ON(skl_ddb_entry_size(ddb_y));
42a0d256496f45 Ville Syrjälä 2022-09-08  1609  
42a0d256496f45 Ville Syrjälä 2022-09-08  1610  			skl_check_wm_level(&wm->trans_wm, ddb);
42a0d256496f45 Ville Syrjälä 2022-09-08  1611  		}
42a0d256496f45 Ville Syrjälä 2022-09-08  1612  
42a0d256496f45 Ville Syrjälä 2022-09-08  1613  		skl_check_wm_level(&wm->sagv.wm0, ddb);
42a0d256496f45 Ville Syrjälä 2022-09-08  1614  		skl_check_wm_level(&wm->sagv.trans_wm, ddb);
42a0d256496f45 Ville Syrjälä 2022-09-08  1615  	}
42a0d256496f45 Ville Syrjälä 2022-09-08  1616  
42a0d256496f45 Ville Syrjälä 2022-09-08  1617  	return 0;
42a0d256496f45 Ville Syrjälä 2022-09-08  1618  }
42a0d256496f45 Ville Syrjälä 2022-09-08  1619  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
