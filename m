Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D801CD2C
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 23:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764633513; cv=none; b=KVJMUR13MZMkQHi5wrvOLTSE7QyaFQ1A0gwb/iom2BnkeMQC4gGW/30+8KOch8Kt7Xsh95HbRIsGLxjHdO0OB+5qzwM0Ok/zb87ih+FTVuYKDT8mLT8Z3mUSY2NVbIaXc3bRWf+DaJu8Ut0t7cN7zbkuaTeWjvaMHcA3XNVfR4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764633513; c=relaxed/simple;
	bh=G2c+vU/wln92h5TA33Ds7EN93FBrwhAI/b0fDZ2HKnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYxoPt0s8uk1zaP82+zuY5k3ZixTF8ekNpTyeGa71LsufzN3nINut1U2ohuDPwrcdCw4b6KFXjQTLVbpqOXBDCx6LOFI2UI/pBH/qeK2w1weNEXEZIn+qjhvJ7edIju8+joM2i2LdWn/sESee1y3Xn7HZ77SETRD8fti6EJatcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZUXZHP0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZUXZHP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764633511; x=1796169511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2c+vU/wln92h5TA33Ds7EN93FBrwhAI/b0fDZ2HKnM=;
  b=PZUXZHP0tq7jIEV1eOeZO22AFMBZ9BY45l+FMElB0OUNTgIO7Ykm3bNr
   KcfK1JzFNY0Kaq11g8JEe+IjkV5lQmsXHQVjt3Xra4okn15ODXKC+fyTz
   A3T3J2kX8mXVTjzMXA5Np2WPDbwqhrveE+eblnrmLiwHLsm0yBsZ25uMW
   GlQCLAiuoR2EofEM7xUCyu0FfGLzSJZALsjrDLPvQOLmsLwT1L/Pe7Yd2
   9gBJqcvrbqf9d0UiUgZahjydiW7c+yep1ct6oV2qhsn9ZqH+llC191/ca
   C7I33myecgDCTtQg3uT5yPfKfDMohHbasa/raW53mc7EnQdhXoWfJNk/Z
   g==;
X-CSE-ConnectionGUID: HCX4LjV9Tnu9nprWPAHNtA==
X-CSE-MsgGUID: Tyl1yyaWQMiWfkdAczJIZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66474253"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66474253"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 15:58:31 -0800
X-CSE-ConnectionGUID: 0Vj69z1DR6GC+9Z0TLKcCA==
X-CSE-MsgGUID: Hy/ntD8rQnuHHuOnBXeO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="217551017"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Dec 2025 15:58:30 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQDmm-000000002mT-0EYn;
	Mon, 01 Dec 2025 23:58:28 +0000
Date: Tue, 2 Dec 2025 00:58:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/ntb/ntb_transport_core.c:1286:40: warning: variable
 'qp_count' set but not used
Message-ID: <202512020039.WSRSzQXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251130-001424, commit: 2c52b6a2a63cec47e6569a2c2c5d0ac8950e6b91"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Koichiro Den <den@valinux.co.jp>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251130-001424
head:   87cdc4c7eaef841a607491db40b8d66c37ec2459
commit: 2c52b6a2a63cec47e6569a2c2c5d0ac8950e6b91 NTB: ntb_transport: Introduce remote eDMA backed transport mode
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251202/202512020039.WSRSzQXV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020039.WSRSzQXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020039.WSRSzQXV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_init_queue':
>> drivers/ntb/ntb_transport_core.c:1286:40: warning: variable 'qp_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                                        ^~~~~~~~
>> drivers/ntb/ntb_transport_core.c:1286:30: warning: variable 'mw_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                              ^~~~~~~~
>> drivers/ntb/ntb_transport_core.c:1286:22: warning: variable 'mw_num' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                      ^~~~~~
   drivers/ntb/ntb_transport_core.c: At top level:
>> drivers/ntb/ntb_transport_core.c:1367:47: warning: 'edma_backend_ops' defined but not used [-Wunused-const-variable=]
    1367 | static const struct ntb_transport_backend_ops edma_backend_ops;
         |                                               ^~~~~~~~~~~~~~~~


vim +/qp_count +1286 drivers/ntb/ntb_transport_core.c

fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1281  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1282  static int ntb_transport_init_queue(struct ntb_transport_ctx *nt,
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1283  				    unsigned int qp_num)
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1284  {
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1285  	struct ntb_transport_qp *qp;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09 @1286  	unsigned int mw_num, mw_count, qp_count;
948d3a65b6d164 drivers/ntb/ntb_transport.c      Jon Mason    2013-04-18  1287  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1288  	mw_count = nt->mw_count;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1289  	qp_count = nt->qp_count;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1290  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1291  	mw_num = QP_TO_MW(nt, qp_num);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1292  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1293  	qp = &nt->qp_vec[qp_num];
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1294  	qp->qp_num = qp_num;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1295  	qp->transport = nt;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1296  	qp->ndev = nt->ndev;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1297  	qp->client_ready = false;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1298  	qp->event_handler = NULL;
cc79bd2738c2d4 drivers/ntb/ntb_transport.c      Dave Jiang   2023-08-22  1299  	ntb_qp_link_context_reset(qp);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1300  
c8650fd03d320e drivers/ntb/ntb_transport.c      Dave Jiang   2015-07-13  1301  	if (nt->debugfs_node_dir) {
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1302  		char debugfs_name[8];
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1303  
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1304  		snprintf(debugfs_name, sizeof(debugfs_name), "qp%d", qp_num);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1305  		qp->debugfs_dir = debugfs_create_dir(debugfs_name,
c8650fd03d320e drivers/ntb/ntb_transport.c      Dave Jiang   2015-07-13  1306  						     nt->debugfs_node_dir);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1307  
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1308  		qp->debugfs_stats = debugfs_create_file("stats", S_IRUSR,
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1309  							qp->debugfs_dir, qp,
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1310  							&ntb_qp_debugfs_stats_fops);
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1311  	} else {
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1312  		qp->debugfs_dir = NULL;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1313  		qp->debugfs_stats = NULL;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1314  	}
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1315  
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1316  	INIT_DELAYED_WORK(&qp->link_work, ntb_qp_link_work);
fca4d5188c1123 drivers/ntb/ntb_transport.c      Jon Mason    2013-09-09  1317  	INIT_WORK(&qp->link_cleanup, ntb_qp_link_cleanup_work);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1318  
da2e5ae56164b8 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-07-13  1319  	spin_lock_init(&qp->ntb_rx_q_lock);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1320  	spin_lock_init(&qp->ntb_tx_free_q_lock);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1321  
da2e5ae56164b8 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-07-13  1322  	INIT_LIST_HEAD(&qp->rx_post_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1323  	INIT_LIST_HEAD(&qp->rx_pend_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1324  	INIT_LIST_HEAD(&qp->rx_free_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1325  	INIT_LIST_HEAD(&qp->tx_free_q);
282a2feeb9bfb1 drivers/ntb/ntb_transport.c      Jon Mason    2013-02-12  1326  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1327  	tasklet_init(&qp->rxc_db_work, ntb_transport_rxc_db,
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1328  		     (unsigned long)qp);
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1329  
282a2feeb9bfb1 drivers/ntb/ntb_transport.c      Jon Mason    2013-02-12  1330  	return 0;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1331  }
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1332  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1333  static unsigned int ntb_transport_default_tx_free_entry(struct ntb_transport_qp *qp)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1334  {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1335  	unsigned int head = qp->tx_index;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1336  	unsigned int tail = qp->remote_rx_info->entry;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1337  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1338  	return tail >= head ? tail - head : qp->tx_max_entry + tail - head;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1339  }
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1340  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1341  static int ntb_transport_default_rx_enqueue(struct ntb_transport_qp *qp,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1342  					    struct ntb_queue_entry *entry)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1343  {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1344  	ntb_list_add(&qp->ntb_rx_q_lock, &entry->entry, &qp->rx_pend_q);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1345  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1346  	if (qp->active)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1347  		tasklet_schedule(&qp->rxc_db_work);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1348  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1349  	return 0;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1350  }
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1351  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1352  static void ntb_transport_default_rx_poll(struct ntb_transport_qp *qp);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1353  static int ntb_transport_default_tx_enqueue(struct ntb_transport_qp *qp,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1354  					    struct ntb_queue_entry *entry,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1355  					    void *cb, void *data, unsigned int len,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1356  					    unsigned int flags);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1357  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1358  static const struct ntb_transport_backend_ops default_backend_ops = {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1359  	.setup_qp_mw = ntb_transport_default_setup_qp_mw,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1360  	.tx_free_entry = ntb_transport_default_tx_free_entry,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1361  	.tx_enqueue = ntb_transport_default_tx_enqueue,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1362  	.rx_enqueue = ntb_transport_default_rx_enqueue,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1363  	.rx_poll = ntb_transport_default_rx_poll,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1364  	.debugfs_stats_show = ntb_transport_default_debugfs_stats_show,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1365  };
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1366  
2c52b6a2a63cec drivers/ntb/ntb_transport_core.c Koichiro Den 2025-11-30 @1367  static const struct ntb_transport_backend_ops edma_backend_ops;
2c52b6a2a63cec drivers/ntb/ntb_transport_core.c Koichiro Den 2025-11-30  1368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
