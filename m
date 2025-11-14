Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE83288510
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 18:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763144355; cv=none; b=sHK9/OqcTb8PgrZIwq1cF4XRBKf8QERfkd+dCEdLU1x+SKshyQazJEJcye6qKuZPWui3PGgNBias0nJ5zn8aLjo4TuzYSfdy+s8z9ELf+X51zHMXvEr4qL3JF/UGDth+T8v322LD53nu/ZzCOYK932rdI/5/RTOS1eIYAmbzr1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763144355; c=relaxed/simple;
	bh=E5USxq6Us6tj5i57aE9tpSH71b0wqL2jT2tCAJpBbh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sung2jGE5rio6MEtrpEJSjtzbGD1XV54twu94YF6MGtvcuff107Z+GpYivWUSce1qTRC3E3NqqnnFuEXhCXGbYgRO5RJIjnI03Ubbe+VIgO11EzF2bCU8/UPC7i+XCK1zRl2MffY+OYgo9ZIvkMK3abNJjjSwyViY554XVp6VNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/WJ1PSy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/WJ1PSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144354; x=1794680354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5USxq6Us6tj5i57aE9tpSH71b0wqL2jT2tCAJpBbh4=;
  b=A/WJ1PSyQHVjCSGvrN/mEZbchilow2XNh2evVd7eHJxsmOt2s1brm9P4
   rJcP2CenF/Qw6rVUjt25nANP/tOa0wBwLC1YBgENV+4JQtWDCDFOmr4B5
   CAQ17oZnZbFuQ1Movxv2+QNIS9vMyBo4opHjQB9KUAvY61G3Jjfg4OKRx
   THxEJySLlWWzKZu4iKjnQW5LMBiO1BnoXmrksVBWpS8Lrx243QwmsXeFq
   AhRDSJAom2UmNzznQvKo/ur2lEItnyLTryC9Z1bSFScKN99yu56Ric0Xl
   NXl47Ykz7c8GjSQzn0ompA0W0/AKX8/wlI0azs3+iE2hmHDWx8t9CcCRS
   Q==;
X-CSE-ConnectionGUID: OocFVvigSvadsqE82p9hcQ==
X-CSE-MsgGUID: BBdE+vYlSbyoZH2p1T7qCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75566355"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="75566355"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:19:13 -0800
X-CSE-ConnectionGUID: y4pt1Vy4S468PVGyPHmzjg==
X-CSE-MsgGUID: H+mweaf9RnyxHLv49E2yMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189101173"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2025 10:19:11 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJyO4-0006y3-2q;
	Fri, 14 Nov 2025 18:19:08 +0000
Date: Sat, 15 Nov 2025 02:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-kiwi-6.1 0/24]
 fs/smb/client/smbdirect.c:1620:3-4: WARNING opportunity for min()
Message-ID: <202511150211.RBAPIoDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2c86a387b0237cd5ce34ef10bd2c404debac3955
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [0/24] smb: move client and server files to common directory fs/smb
:::::: branch date: 30 hours ago
:::::: commit date: 2 years, 5 months ago
config: x86_64-randconfig-104-20251114 (https://download.01.org/0day-ci/archive/20251115/202511150211.RBAPIoDC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511150211.RBAPIoDC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/smbdirect.c:1620:3-4: WARNING opportunity for min()

vim +1620 fs/smb/client/smbdirect.c

f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1517  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1518  /* Create a SMBD connection, called by upper layer */
9084432c316b76f fs/cifs/smbdirect.c kbuild test robot 2017-12-18  1519  static struct smbd_connection *_smbd_get_connection(
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1520  	struct TCP_Server_Info *server, struct sockaddr *dstaddr, int port)
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1521  {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1522  	int rc;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1523  	struct smbd_connection *info;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1524  	struct rdma_conn_param conn_param;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1525  	struct ib_qp_init_attr qp_attr;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1526  	struct sockaddr_in *addr_in = (struct sockaddr_in *) dstaddr;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1527  	struct ib_port_immutable port_immutable;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1528  	u32 ird_ord_hdr[2];
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1529  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1530  	info = kzalloc(sizeof(struct smbd_connection), GFP_KERNEL);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1531  	if (!info)
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1532  		return NULL;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1533  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1534  	info->transport_status = SMBD_CONNECTING;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1535  	rc = smbd_ia_open(info, dstaddr, port);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1536  	if (rc) {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1537  		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1538  		goto create_id_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1539  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1540  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1541  	if (smbd_send_credit_target > info->id->device->attrs.max_cqe ||
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1542  	    smbd_send_credit_target > info->id->device->attrs.max_qp_wr) {
0350d7a39c7f817 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1543  		log_rdma_event(ERR, "consider lowering send_credit_target = %d. Possible CQE overrun, device reporting max_cqe %d max_qp_wr %d\n",
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1544  			       smbd_send_credit_target,
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1545  			       info->id->device->attrs.max_cqe,
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1546  			       info->id->device->attrs.max_qp_wr);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1547  		goto config_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1548  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1549  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1550  	if (smbd_receive_credit_max > info->id->device->attrs.max_cqe ||
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1551  	    smbd_receive_credit_max > info->id->device->attrs.max_qp_wr) {
0350d7a39c7f817 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1552  		log_rdma_event(ERR, "consider lowering receive_credit_max = %d. Possible CQE overrun, device reporting max_cqe %d max_qp_wr %d\n",
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1553  			       smbd_receive_credit_max,
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1554  			       info->id->device->attrs.max_cqe,
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1555  			       info->id->device->attrs.max_qp_wr);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1556  		goto config_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1557  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1558  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1559  	info->receive_credit_max = smbd_receive_credit_max;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1560  	info->send_credit_target = smbd_send_credit_target;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1561  	info->max_send_size = smbd_max_send_size;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1562  	info->max_fragmented_recv_size = smbd_max_fragmented_recv_size;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1563  	info->max_receive_size = smbd_max_receive_size;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1564  	info->keep_alive_interval = smbd_keep_alive_interval;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1565  
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1566  	if (info->id->device->attrs.max_send_sge < SMBDIRECT_MAX_SEND_SGE ||
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1567  	    info->id->device->attrs.max_recv_sge < SMBDIRECT_MAX_RECV_SGE) {
33023fb85a42b53 fs/cifs/smbdirect.c Steve Wise        2018-06-18  1568  		log_rdma_event(ERR,
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1569  			"device %.*s max_send_sge/max_recv_sge = %d/%d too small\n",
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1570  			IB_DEVICE_NAME_MAX,
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1571  			info->id->device->name,
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1572  			info->id->device->attrs.max_send_sge,
33023fb85a42b53 fs/cifs/smbdirect.c Steve Wise        2018-06-18  1573  			info->id->device->attrs.max_recv_sge);
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1574  		goto config_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1575  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1576  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1577  	info->send_cq = NULL;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1578  	info->recv_cq = NULL;
20cf4e026730104 fs/cifs/smbdirect.c Chuck Lever       2019-07-29  1579  	info->send_cq =
20cf4e026730104 fs/cifs/smbdirect.c Chuck Lever       2019-07-29  1580  		ib_alloc_cq_any(info->id->device, info,
20cf4e026730104 fs/cifs/smbdirect.c Chuck Lever       2019-07-29  1581  				info->send_credit_target, IB_POLL_SOFTIRQ);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1582  	if (IS_ERR(info->send_cq)) {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1583  		info->send_cq = NULL;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1584  		goto alloc_cq_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1585  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1586  
20cf4e026730104 fs/cifs/smbdirect.c Chuck Lever       2019-07-29  1587  	info->recv_cq =
20cf4e026730104 fs/cifs/smbdirect.c Chuck Lever       2019-07-29  1588  		ib_alloc_cq_any(info->id->device, info,
20cf4e026730104 fs/cifs/smbdirect.c Chuck Lever       2019-07-29  1589  				info->receive_credit_max, IB_POLL_SOFTIRQ);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1590  	if (IS_ERR(info->recv_cq)) {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1591  		info->recv_cq = NULL;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1592  		goto alloc_cq_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1593  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1594  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1595  	memset(&qp_attr, 0, sizeof(qp_attr));
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1596  	qp_attr.event_handler = smbd_qp_async_error_upcall;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1597  	qp_attr.qp_context = info;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1598  	qp_attr.cap.max_send_wr = info->send_credit_target;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1599  	qp_attr.cap.max_recv_wr = info->receive_credit_max;
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1600  	qp_attr.cap.max_send_sge = SMBDIRECT_MAX_SEND_SGE;
d2e81f92e5b76c4 fs/cifs/smbdirect.c Tom Talpey        2022-09-23  1601  	qp_attr.cap.max_recv_sge = SMBDIRECT_MAX_RECV_SGE;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1602  	qp_attr.cap.max_inline_data = 0;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1603  	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1604  	qp_attr.qp_type = IB_QPT_RC;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1605  	qp_attr.send_cq = info->send_cq;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1606  	qp_attr.recv_cq = info->recv_cq;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1607  	qp_attr.port_num = ~0;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1608  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1609  	rc = rdma_create_qp(info->id, info->pd, &qp_attr);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1610  	if (rc) {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1611  		log_rdma_event(ERR, "rdma_create_qp failed %i\n", rc);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1612  		goto create_qp_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1613  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1614  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1615  	memset(&conn_param, 0, sizeof(conn_param));
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1616  	conn_param.initiator_depth = 0;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1617  
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1618  	conn_param.responder_resources =
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1619  		info->id->device->attrs.max_qp_rd_atom
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22 @1620  			< SMBD_CM_RESPONDER_RESOURCES ?
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1621  		info->id->device->attrs.max_qp_rd_atom :
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1622  		SMBD_CM_RESPONDER_RESOURCES;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1623  	info->responder_resources = conn_param.responder_resources;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1624  	log_rdma_mr(INFO, "responder_resources=%d\n",
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1625  		info->responder_resources);
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1626  
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1627  	/* Need to send IRD/ORD in private data for iWARP */
3023a1e93656c02 fs/cifs/smbdirect.c Kamal Heib        2018-12-10  1628  	info->id->device->ops.get_port_immutable(
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1629  		info->id->device, info->id->port_num, &port_immutable);
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1630  	if (port_immutable.core_cap_flags & RDMA_CORE_PORT_IWARP) {
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1631  		ird_ord_hdr[0] = info->responder_resources;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1632  		ird_ord_hdr[1] = 1;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1633  		conn_param.private_data = ird_ord_hdr;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1634  		conn_param.private_data_len = sizeof(ird_ord_hdr);
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1635  	} else {
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1636  		conn_param.private_data = NULL;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1637  		conn_param.private_data_len = 0;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1638  	}
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1639  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1640  	conn_param.retry_count = SMBD_CM_RETRY;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1641  	conn_param.rnr_retry_count = SMBD_CM_RNR_RETRY;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1642  	conn_param.flow_control = 0;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1643  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1644  	log_rdma_event(INFO, "connecting to IP %pI4 port %d\n",
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1645  		&addr_in->sin_addr, port);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1646  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1647  	init_waitqueue_head(&info->conn_wait);
050b8c374019c10 fs/cifs/smbdirect.c Long Li           2019-04-04  1648  	init_waitqueue_head(&info->disconn_wait);
050b8c374019c10 fs/cifs/smbdirect.c Long Li           2019-04-04  1649  	init_waitqueue_head(&info->wait_reassembly_queue);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1650  	rc = rdma_connect(info->id, &conn_param);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1651  	if (rc) {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1652  		log_rdma_event(ERR, "rdma_connect() failed with %i\n", rc);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1653  		goto rdma_connect_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1654  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1655  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1656  	wait_event_interruptible(
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1657  		info->conn_wait, info->transport_status != SMBD_CONNECTING);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1658  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1659  	if (info->transport_status != SMBD_CONNECTED) {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1660  		log_rdma_event(ERR, "rdma_connect failed port=%d\n", port);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1661  		goto rdma_connect_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1662  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1663  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1664  	log_rdma_event(INFO, "rdma_connect connected\n");
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1665  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1666  	rc = allocate_caches_and_workqueue(info);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1667  	if (rc) {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1668  		log_rdma_event(ERR, "cache allocation failed\n");
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1669  		goto allocate_cache_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1670  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1671  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1672  	init_waitqueue_head(&info->wait_send_queue);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1673  	INIT_DELAYED_WORK(&info->idle_timer_work, idle_connection_timer);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1674  	queue_delayed_work(info->workqueue, &info->idle_timer_work,
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1675  		info->keep_alive_interval*HZ);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1676  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1677  	init_waitqueue_head(&info->wait_send_pending);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1678  	atomic_set(&info->send_pending, 0);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1679  
3ffbe78aff93586 fs/cifs/smbdirect.c Long Li           2020-03-30  1680  	init_waitqueue_head(&info->wait_post_send);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1681  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1682  	INIT_WORK(&info->disconnect_work, smbd_disconnect_rdma_work);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1683  	INIT_WORK(&info->post_send_credits_work, smbd_post_send_credits);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1684  	info->new_credits_offered = 0;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1685  	spin_lock_init(&info->lock_new_credits_offered);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1686  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1687  	rc = smbd_negotiate(info);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1688  	if (rc) {
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1689  		log_rdma_event(ERR, "smbd_negotiate rc=%d\n", rc);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1690  		goto negotiation_failed;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1691  	}
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1692  
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1693  	rc = allocate_mr_list(info);
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1694  	if (rc) {
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1695  		log_rdma_mr(ERR, "memory registration allocation failed\n");
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1696  		goto allocate_mr_failed;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1697  	}
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1698  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1699  	return info;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1700  
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1701  allocate_mr_failed:
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1702  	/* At this point, need to a full transport shutdown */
c51ae01104b318b fs/cifs/smbdirect.c Zhang Xiaoxu      2022-11-18  1703  	server->smbd_conn = info;
050b8c374019c10 fs/cifs/smbdirect.c Long Li           2019-04-04  1704  	smbd_destroy(server);
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1705  	return NULL;
c7398583340a6d8 fs/cifs/smbdirect.c Long Li           2017-11-22  1706  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1707  negotiation_failed:
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1708  	cancel_delayed_work_sync(&info->idle_timer_work);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1709  	destroy_caches_and_workqueue(info);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1710  	info->transport_status = SMBD_NEGOTIATE_FAILED;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1711  	init_waitqueue_head(&info->conn_wait);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1712  	rdma_disconnect(info->id);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1713  	wait_event(info->conn_wait,
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1714  		info->transport_status == SMBD_DISCONNECTED);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1715  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1716  allocate_cache_failed:
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1717  rdma_connect_failed:
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1718  	rdma_destroy_qp(info->id);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1719  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1720  create_qp_failed:
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1721  alloc_cq_failed:
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1722  	if (info->send_cq)
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1723  		ib_free_cq(info->send_cq);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1724  	if (info->recv_cq)
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1725  		ib_free_cq(info->recv_cq);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1726  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1727  config_failed:
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1728  	ib_dealloc_pd(info->pd);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1729  	rdma_destroy_id(info->id);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1730  
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1731  create_id_failed:
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1732  	kfree(info);
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1733  	return NULL;
f198186aa9bbd60 fs/cifs/smbdirect.c Long Li           2017-11-04  1734  }
399f9539d951adf fs/cifs/smbdirect.c Long Li           2017-11-17  1735  

:::::: The code at line 1620 was first introduced by commit
:::::: c7398583340a6d82b8bb7f7f21edcde27dc6a898 CIFS: SMBD: Implement RDMA memory registration

:::::: TO: Long Li <longli@microsoft.com>
:::::: CC: Steve French <smfrench@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
