Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E935D946C
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 01:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892027; cv=none; b=WkLoOPMeooVGEE0IcgrJptLqgDOVfemzgos0jqe8m0/NFaw+0/luVXsLR8V/uU/T4Q+UU5txLXQuNM/ZVTyx5am1JKRcUNKxdy4sWKlmM4a/b0+5TUZfP3AFk8xnDzX6JTRayBZPH39R5IgKZ3aBO3IxFaHmoa0LVUp9dwrHTwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892027; c=relaxed/simple;
	bh=6Yv80li7Ib/7xmjktws+Fl0wrtCJWTKV0bpMpZ8bpgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CsL8iQ8/zShL9rx+M+EwQiFwqAuDXBV7gKm3qcUO189DvYfX3znknCx5uR5eQUX57jAV8dTt52GsyZbzMrd5y6aWHtcVhpUNOCqLL0+lEPGgJZTGLAHsoKlbodCrFRhv0NFJzmOIX3yZ2i9Vt1Jv3Q6KAak58IaYe8fRsAhOS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVexh8A9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVexh8A9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738892025; x=1770428025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Yv80li7Ib/7xmjktws+Fl0wrtCJWTKV0bpMpZ8bpgU=;
  b=aVexh8A9r3ICY0fE4m8jD5tBdqtx9H8wJnvPjaEo0whrWqxjcKqpPkpk
   OZZmlKqwRQd3ca73UComZyF8w2Kvtey4pjAKAP5S7aRRsY3cpZE2y5DXZ
   jtb+bpNHdHvdD69gpZ9bbo0VXX30djexMJzJG6ZBRwG0T3I4LFaQY0bvD
   yXl80oYNL6dg/e0RecwJ6Q5zqCu7X12bAgGqXhBD6kC9ZEBhReCe0RqZo
   o/6sfMa5NecB8MpCOzIb0gXLkAy+facZuQma/yE+JvME3NaCVKaGH8o9H
   giETeV97LKmFc7nPxd7j8hVKbPCOooQFOpF/4FdibhZBwTXSw2vERrTo/
   A==;
X-CSE-ConnectionGUID: KoVu1goETOCyuAwTrQeXUA==
X-CSE-MsgGUID: X5cyeSFcRQqS/tONrHIpuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39677201"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39677201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 17:33:43 -0800
X-CSE-ConnectionGUID: lV2mPP1FRnmF4DX5JZAaQQ==
X-CSE-MsgGUID: Do7UD8O7QoyAyT9WYxXqbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="116416892"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2025 17:33:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgDFT-000xcC-0d;
	Fri, 07 Feb 2025 01:33:39 +0000
Date: Fri, 7 Feb 2025 09:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:rdma-next 76/77]
 drivers/infiniband/core/uverbs_cmd.c:1492 create_qp() error: 'pd'
 dereferencing possible ERR_PTR()
Message-ID: <202502070936.x78bftbK-lkp@intel.com>
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
TO: Maher Sanalla <msanalla@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   98119a2a0f09ec10bf3a35026f43a0e5732be742
commit: 84633f80b89acfaa55e09c273f27843a2277143e [76/77] RDMA/uverbs: Propagate errors from rdma_lookup_get_uobject()
:::::: branch date: 31 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070936.x78bftbK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502070936.x78bftbK-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/uverbs_cmd.c:1492 create_qp() error: 'pd' dereferencing possible ERR_PTR()
drivers/infiniband/core/uverbs_cmd.c:1494 create_qp() error: 'scq' dereferencing possible ERR_PTR()
drivers/infiniband/core/uverbs_cmd.c:1497 create_qp() error: 'rcq' dereferencing possible ERR_PTR()
drivers/infiniband/core/uverbs_cmd.c:1500 create_qp() error: 'srq' dereferencing possible ERR_PTR()
drivers/infiniband/core/uverbs_cmd.c:1503 create_qp() error: 'ind_tbl' dereferencing possible ERR_PTR()

vim +/pd +1492 drivers/infiniband/core/uverbs_cmd.c

bc38a6abdd5a50 Roland Dreier      2005-07-07  1275  
8313c10fa8be03 Jason Gunthorpe    2018-11-25  1276  static int create_qp(struct uverbs_attr_bundle *attrs,
ece9ca97ccdc84 Jason Gunthorpe    2018-11-25  1277  		     struct ib_uverbs_ex_create_qp *cmd)
bc38a6abdd5a50 Roland Dreier      2005-07-07  1278  {
9ead190bfde2a4 Roland Dreier      2006-06-17  1279  	struct ib_uqp_object		*obj;
b93f3c18727634 Sean Hefty         2011-05-27  1280  	struct ib_device		*device;
b93f3c18727634 Sean Hefty         2011-05-27  1281  	struct ib_pd			*pd = NULL;
b93f3c18727634 Sean Hefty         2011-05-27  1282  	struct ib_xrcd			*xrcd = NULL;
fd3c7904db6e05 Matan Barak        2017-04-04  1283  	struct ib_uobject		*xrcd_uobj = ERR_PTR(-ENOENT);
b93f3c18727634 Sean Hefty         2011-05-27  1284  	struct ib_cq			*scq = NULL, *rcq = NULL;
9977f4f64bfeb5 Sean Hefty         2011-05-26  1285  	struct ib_srq			*srq = NULL;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1286  	struct ib_qp			*qp;
c70285f880e88c Yishai Hadas       2016-05-23  1287  	struct ib_qp_init_attr		attr = {};
16e51f78a9db36 Leon Romanovsky    2020-07-19  1288  	struct ib_uverbs_ex_create_qp_resp resp = {};
bc38a6abdd5a50 Roland Dreier      2005-07-07  1289  	int				ret;
c70285f880e88c Yishai Hadas       2016-05-23  1290  	struct ib_rwq_ind_table *ind_tbl = NULL;
c70285f880e88c Yishai Hadas       2016-05-23  1291  	bool has_sq = true;
bbd51e881ff05a Jason Gunthorpe    2018-07-25  1292  	struct ib_device *ib_dev;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1293  
5807bb32055bb8 Leon Romanovsky    2020-09-26  1294  	switch (cmd->qp_type) {
5807bb32055bb8 Leon Romanovsky    2020-09-26  1295  	case IB_QPT_RAW_PACKET:
5807bb32055bb8 Leon Romanovsky    2020-09-26  1296  		if (!capable(CAP_NET_RAW))
c938a616aadb62 Or Gerlitz         2012-03-01  1297  			return -EPERM;
5807bb32055bb8 Leon Romanovsky    2020-09-26  1298  		break;
5807bb32055bb8 Leon Romanovsky    2020-09-26  1299  	case IB_QPT_RC:
5807bb32055bb8 Leon Romanovsky    2020-09-26  1300  	case IB_QPT_UC:
5807bb32055bb8 Leon Romanovsky    2020-09-26  1301  	case IB_QPT_UD:
5807bb32055bb8 Leon Romanovsky    2020-09-26  1302  	case IB_QPT_XRC_INI:
5807bb32055bb8 Leon Romanovsky    2020-09-26  1303  	case IB_QPT_XRC_TGT:
5807bb32055bb8 Leon Romanovsky    2020-09-26  1304  	case IB_QPT_DRIVER:
5807bb32055bb8 Leon Romanovsky    2020-09-26  1305  		break;
5807bb32055bb8 Leon Romanovsky    2020-09-26  1306  	default:
5807bb32055bb8 Leon Romanovsky    2020-09-26  1307  		return -EINVAL;
5807bb32055bb8 Leon Romanovsky    2020-09-26  1308  	}
c938a616aadb62 Or Gerlitz         2012-03-01  1309  
8313c10fa8be03 Jason Gunthorpe    2018-11-25  1310  	obj = (struct ib_uqp_object *)uobj_alloc(UVERBS_OBJECT_QP, attrs,
bbd51e881ff05a Jason Gunthorpe    2018-07-25  1311  						 &ib_dev);
fd3c7904db6e05 Matan Barak        2017-04-04  1312  	if (IS_ERR(obj))
fd3c7904db6e05 Matan Barak        2017-04-04  1313  		return PTR_ERR(obj);
fd3c7904db6e05 Matan Barak        2017-04-04  1314  	obj->uxrcd = NULL;
fd3c7904db6e05 Matan Barak        2017-04-04  1315  	obj->uevent.uobject.user_handle = cmd->user_handle;
f48b726920d96d Matan Barak        2017-04-04  1316  	mutex_init(&obj->mcast_lock);
bc38a6abdd5a50 Roland Dreier      2005-07-07  1317  
ece9ca97ccdc84 Jason Gunthorpe    2018-11-25  1318  	if (cmd->comp_mask & IB_UVERBS_CREATE_QP_MASK_IND_TABLE) {
2cc1e3b80942a7 Jason Gunthorpe    2018-07-04  1319  		ind_tbl = uobj_get_obj_read(rwq_ind_table,
2cc1e3b80942a7 Jason Gunthorpe    2018-07-04  1320  					    UVERBS_OBJECT_RWQ_IND_TBL,
8313c10fa8be03 Jason Gunthorpe    2018-11-25  1321  					    cmd->rwq_ind_tbl_handle, attrs);
84633f80b89acf Maher Sanalla      2025-02-04  1322  		if (IS_ERR(ind_tbl)) {
84633f80b89acf Maher Sanalla      2025-02-04  1323  			ret = PTR_ERR(ind_tbl);
c70285f880e88c Yishai Hadas       2016-05-23  1324  			goto err_put;
c70285f880e88c Yishai Hadas       2016-05-23  1325  		}
c70285f880e88c Yishai Hadas       2016-05-23  1326  
c70285f880e88c Yishai Hadas       2016-05-23  1327  		attr.rwq_ind_tbl = ind_tbl;
c70285f880e88c Yishai Hadas       2016-05-23  1328  	}
c70285f880e88c Yishai Hadas       2016-05-23  1329  
c70285f880e88c Yishai Hadas       2016-05-23  1330  	if (ind_tbl && (cmd->max_recv_wr || cmd->max_recv_sge || cmd->is_srq)) {
c70285f880e88c Yishai Hadas       2016-05-23  1331  		ret = -EINVAL;
c70285f880e88c Yishai Hadas       2016-05-23  1332  		goto err_put;
c70285f880e88c Yishai Hadas       2016-05-23  1333  	}
c70285f880e88c Yishai Hadas       2016-05-23  1334  
c70285f880e88c Yishai Hadas       2016-05-23  1335  	if (ind_tbl && !cmd->max_send_wr)
c70285f880e88c Yishai Hadas       2016-05-23  1336  		has_sq = false;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1337  
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1338  	if (cmd->qp_type == IB_QPT_XRC_TGT) {
1f7ff9d5d36ae1 Matan Barak        2018-03-19  1339  		xrcd_uobj = uobj_get_read(UVERBS_OBJECT_XRCD, cmd->pd_handle,
8313c10fa8be03 Jason Gunthorpe    2018-11-25  1340  					  attrs);
fd3c7904db6e05 Matan Barak        2017-04-04  1341  
fd3c7904db6e05 Matan Barak        2017-04-04  1342  		if (IS_ERR(xrcd_uobj)) {
fd3c7904db6e05 Matan Barak        2017-04-04  1343  			ret = -EINVAL;
fd3c7904db6e05 Matan Barak        2017-04-04  1344  			goto err_put;
fd3c7904db6e05 Matan Barak        2017-04-04  1345  		}
fd3c7904db6e05 Matan Barak        2017-04-04  1346  
fd3c7904db6e05 Matan Barak        2017-04-04  1347  		xrcd = (struct ib_xrcd *)xrcd_uobj->object;
b93f3c18727634 Sean Hefty         2011-05-27  1348  		if (!xrcd) {
b93f3c18727634 Sean Hefty         2011-05-27  1349  			ret = -EINVAL;
b93f3c18727634 Sean Hefty         2011-05-27  1350  			goto err_put;
b93f3c18727634 Sean Hefty         2011-05-27  1351  		}
b93f3c18727634 Sean Hefty         2011-05-27  1352  		device = xrcd->device;
b93f3c18727634 Sean Hefty         2011-05-27  1353  	} else {
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1354  		if (cmd->qp_type == IB_QPT_XRC_INI) {
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1355  			cmd->max_recv_wr = 0;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1356  			cmd->max_recv_sge = 0;
9977f4f64bfeb5 Sean Hefty         2011-05-26  1357  		} else {
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1358  			if (cmd->is_srq) {
2cc1e3b80942a7 Jason Gunthorpe    2018-07-04  1359  				srq = uobj_get_obj_read(srq, UVERBS_OBJECT_SRQ,
8313c10fa8be03 Jason Gunthorpe    2018-11-25  1360  							cmd->srq_handle, attrs);
84633f80b89acf Maher Sanalla      2025-02-04  1361  				if (IS_ERR(srq) ||
84633f80b89acf Maher Sanalla      2025-02-04  1362  				    srq->srq_type == IB_SRQT_XRC) {
84633f80b89acf Maher Sanalla      2025-02-04  1363  					ret = IS_ERR(srq) ? PTR_ERR(srq) :
84633f80b89acf Maher Sanalla      2025-02-04  1364  								  -EINVAL;
9977f4f64bfeb5 Sean Hefty         2011-05-26  1365  					goto err_put;
9977f4f64bfeb5 Sean Hefty         2011-05-26  1366  				}
9977f4f64bfeb5 Sean Hefty         2011-05-26  1367  			}
5909ce545db415 Roland Dreier      2012-04-30  1368  
c70285f880e88c Yishai Hadas       2016-05-23  1369  			if (!ind_tbl) {
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1370  				if (cmd->recv_cq_handle != cmd->send_cq_handle) {
2cc1e3b80942a7 Jason Gunthorpe    2018-07-04  1371  					rcq = uobj_get_obj_read(
2cc1e3b80942a7 Jason Gunthorpe    2018-07-04  1372  						cq, UVERBS_OBJECT_CQ,
8313c10fa8be03 Jason Gunthorpe    2018-11-25  1373  						cmd->recv_cq_handle, attrs);
84633f80b89acf Maher Sanalla      2025-02-04  1374  					if (IS_ERR(rcq)) {
84633f80b89acf Maher Sanalla      2025-02-04  1375  						ret = PTR_ERR(rcq);
9ead190bfde2a4 Roland Dreier      2006-06-17  1376  						goto err_put;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1377  					}
9977f4f64bfeb5 Sean Hefty         2011-05-26  1378  				}
5909ce545db415 Roland Dreier      2012-04-30  1379  			}
c70285f880e88c Yishai Hadas       2016-05-23  1380  		}
5909ce545db415 Roland Dreier      2012-04-30  1381  
84633f80b89acf Maher Sanalla      2025-02-04  1382  		if (has_sq) {
2cc1e3b80942a7 Jason Gunthorpe    2018-07-04  1383  			scq = uobj_get_obj_read(cq, UVERBS_OBJECT_CQ,
8313c10fa8be03 Jason Gunthorpe    2018-11-25  1384  						cmd->send_cq_handle, attrs);
84633f80b89acf Maher Sanalla      2025-02-04  1385  			if (IS_ERR(scq)) {
84633f80b89acf Maher Sanalla      2025-02-04  1386  				ret = PTR_ERR(scq);
84633f80b89acf Maher Sanalla      2025-02-04  1387  				goto err_put;
84633f80b89acf Maher Sanalla      2025-02-04  1388  			}
84633f80b89acf Maher Sanalla      2025-02-04  1389  		}
84633f80b89acf Maher Sanalla      2025-02-04  1390  
efeb973ffce7f3 Xiao Yang          2020-12-16  1391  		if (!ind_tbl && cmd->qp_type != IB_QPT_XRC_INI)
5909ce545db415 Roland Dreier      2012-04-30  1392  			rcq = rcq ?: scq;
2cc1e3b80942a7 Jason Gunthorpe    2018-07-04  1393  		pd = uobj_get_obj_read(pd, UVERBS_OBJECT_PD, cmd->pd_handle,
8313c10fa8be03 Jason Gunthorpe    2018-11-25  1394  				       attrs);
84633f80b89acf Maher Sanalla      2025-02-04  1395  		if (IS_ERR(pd)) {
84633f80b89acf Maher Sanalla      2025-02-04  1396  			ret = PTR_ERR(pd);
5909ce545db415 Roland Dreier      2012-04-30  1397  			goto err_put;
5909ce545db415 Roland Dreier      2012-04-30  1398  		}
5909ce545db415 Roland Dreier      2012-04-30  1399  
b93f3c18727634 Sean Hefty         2011-05-27  1400  		device = pd->device;
b93f3c18727634 Sean Hefty         2011-05-27  1401  	}
bc38a6abdd5a50 Roland Dreier      2005-07-07  1402  
bc38a6abdd5a50 Roland Dreier      2005-07-07  1403  	attr.event_handler = ib_uverbs_qp_event_handler;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1404  	attr.send_cq       = scq;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1405  	attr.recv_cq       = rcq;
f520ba5aa48e28 Roland Dreier      2005-08-18  1406  	attr.srq           = srq;
b93f3c18727634 Sean Hefty         2011-05-27  1407  	attr.xrcd	   = xrcd;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1408  	attr.sq_sig_type   = cmd->sq_sig_all ? IB_SIGNAL_ALL_WR :
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1409  					      IB_SIGNAL_REQ_WR;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1410  	attr.qp_type       = cmd->qp_type;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1411  
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1412  	attr.cap.max_send_wr     = cmd->max_send_wr;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1413  	attr.cap.max_recv_wr     = cmd->max_recv_wr;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1414  	attr.cap.max_send_sge    = cmd->max_send_sge;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1415  	attr.cap.max_recv_sge    = cmd->max_recv_sge;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1416  	attr.cap.max_inline_data = cmd->max_inline_data;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1417  
9ead190bfde2a4 Roland Dreier      2006-06-17  1418  	INIT_LIST_HEAD(&obj->uevent.event_list);
9ead190bfde2a4 Roland Dreier      2006-06-17  1419  	INIT_LIST_HEAD(&obj->mcast_list);
bc38a6abdd5a50 Roland Dreier      2005-07-07  1420  
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1421  	attr.create_flags = cmd->create_flags;
8a06ce59a4cd03 Leon Romanovsky    2015-12-20  1422  	if (attr.create_flags & ~(IB_QP_CREATE_BLOCK_MULTICAST_LOOPBACK |
8a06ce59a4cd03 Leon Romanovsky    2015-12-20  1423  				IB_QP_CREATE_CROSS_CHANNEL |
8a06ce59a4cd03 Leon Romanovsky    2015-12-20  1424  				IB_QP_CREATE_MANAGED_SEND |
b531b909481933 Majd Dibbiny       2016-04-17  1425  				IB_QP_CREATE_MANAGED_RECV |
9e1b161f3b8f14 Noa Osherovich     2017-01-18  1426  				IB_QP_CREATE_SCATTER_FCS |
2dee0e545894c2 Yishai Hadas       2017-06-08  1427  				IB_QP_CREATE_CVLAN_STRIPPING |
e1d2e887336950 Noa Osherovich     2017-10-29  1428  				IB_QP_CREATE_SOURCE_QPN |
e1d2e887336950 Noa Osherovich     2017-10-29  1429  				IB_QP_CREATE_PCI_WRITE_END_PADDING)) {
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1430  		ret = -EINVAL;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1431  		goto err_put;
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1432  	}
6d8a74972b7115 Eran Ben Elisha    2015-10-21  1433  
2dee0e545894c2 Yishai Hadas       2017-06-08  1434  	if (attr.create_flags & IB_QP_CREATE_SOURCE_QPN) {
2dee0e545894c2 Yishai Hadas       2017-06-08  1435  		if (!capable(CAP_NET_RAW)) {
2dee0e545894c2 Yishai Hadas       2017-06-08  1436  			ret = -EPERM;
2dee0e545894c2 Yishai Hadas       2017-06-08  1437  			goto err_put;
2dee0e545894c2 Yishai Hadas       2017-06-08  1438  		}
2dee0e545894c2 Yishai Hadas       2017-06-08  1439  
2dee0e545894c2 Yishai Hadas       2017-06-08  1440  		attr.source_qpn = cmd->source_qpn;
2dee0e545894c2 Yishai Hadas       2017-06-08  1441  	}
2dee0e545894c2 Yishai Hadas       2017-06-08  1442  
d2b10794fc1312 Leon Romanovsky    2021-08-03  1443  	qp = ib_create_qp_user(device, pd, &attr, &attrs->driver_udata, obj,
d2b10794fc1312 Leon Romanovsky    2021-08-03  1444  			       KBUILD_MODNAME);
bc38a6abdd5a50 Roland Dreier      2005-07-07  1445  	if (IS_ERR(qp)) {
bc38a6abdd5a50 Roland Dreier      2005-07-07  1446  		ret = PTR_ERR(qp);
fd3c7904db6e05 Matan Barak        2017-04-04  1447  		goto err_put;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1448  	}
5507f67d08cdd9 Leon Romanovsky    2021-08-03  1449  	ib_qp_usecnt_inc(qp);
bc38a6abdd5a50 Roland Dreier      2005-07-07  1450  
9ead190bfde2a4 Roland Dreier      2006-06-17  1451  	obj->uevent.uobject.object = qp;
98a8890f734894 Yishai Hadas       2020-05-19  1452  	obj->uevent.event_file = READ_ONCE(attrs->ufile->default_async_file);
98a8890f734894 Yishai Hadas       2020-05-19  1453  	if (obj->uevent.event_file)
98a8890f734894 Yishai Hadas       2020-05-19  1454  		uverbs_uobject_get(&obj->uevent.event_file->uobj);
bc38a6abdd5a50 Roland Dreier      2005-07-07  1455  
846be90d810c28 Yishai Hadas       2013-08-01  1456  	if (xrcd) {
846be90d810c28 Yishai Hadas       2013-08-01  1457  		obj->uxrcd = container_of(xrcd_uobj, struct ib_uxrcd_object,
846be90d810c28 Yishai Hadas       2013-08-01  1458  					  uobject);
846be90d810c28 Yishai Hadas       2013-08-01  1459  		atomic_inc(&obj->uxrcd->refcnt);
fd3c7904db6e05 Matan Barak        2017-04-04  1460  		uobj_put_read(xrcd_uobj);
846be90d810c28 Yishai Hadas       2013-08-01  1461  	}
846be90d810c28 Yishai Hadas       2013-08-01  1462  
b93f3c18727634 Sean Hefty         2011-05-27  1463  	if (pd)
fd3c7904db6e05 Matan Barak        2017-04-04  1464  		uobj_put_obj_read(pd);
b93f3c18727634 Sean Hefty         2011-05-27  1465  	if (scq)
5bd48c18c8cea0 Jason Gunthorpe    2020-01-08  1466  		rdma_lookup_put_uobject(&scq->uobject->uevent.uobject,
5bd48c18c8cea0 Jason Gunthorpe    2020-01-08  1467  					UVERBS_LOOKUP_READ);
9977f4f64bfeb5 Sean Hefty         2011-05-26  1468  	if (rcq && rcq != scq)
5bd48c18c8cea0 Jason Gunthorpe    2020-01-08  1469  		rdma_lookup_put_uobject(&rcq->uobject->uevent.uobject,
5bd48c18c8cea0 Jason Gunthorpe    2020-01-08  1470  					UVERBS_LOOKUP_READ);
9ead190bfde2a4 Roland Dreier      2006-06-17  1471  	if (srq)
9fbe334c6a67c3 Jason Gunthorpe    2020-01-08  1472  		rdma_lookup_put_uobject(&srq->uobject->uevent.uobject,
9fbe334c6a67c3 Jason Gunthorpe    2020-01-08  1473  					UVERBS_LOOKUP_READ);
c70285f880e88c Yishai Hadas       2016-05-23  1474  	if (ind_tbl)
fd3c7904db6e05 Matan Barak        2017-04-04  1475  		uobj_put_obj_read(ind_tbl);
16e51f78a9db36 Leon Romanovsky    2020-07-19  1476  	uobj_finalize_uobj_create(&obj->uevent.uobject, attrs);
16e51f78a9db36 Leon Romanovsky    2020-07-19  1477  
16e51f78a9db36 Leon Romanovsky    2020-07-19  1478  	resp.base.qpn             = qp->qp_num;
16e51f78a9db36 Leon Romanovsky    2020-07-19  1479  	resp.base.qp_handle       = obj->uevent.uobject.id;
16e51f78a9db36 Leon Romanovsky    2020-07-19  1480  	resp.base.max_recv_sge    = attr.cap.max_recv_sge;
16e51f78a9db36 Leon Romanovsky    2020-07-19  1481  	resp.base.max_send_sge    = attr.cap.max_send_sge;
16e51f78a9db36 Leon Romanovsky    2020-07-19  1482  	resp.base.max_recv_wr     = attr.cap.max_recv_wr;
16e51f78a9db36 Leon Romanovsky    2020-07-19  1483  	resp.base.max_send_wr     = attr.cap.max_send_wr;
16e51f78a9db36 Leon Romanovsky    2020-07-19  1484  	resp.base.max_inline_data = attr.cap.max_inline_data;
16e51f78a9db36 Leon Romanovsky    2020-07-19  1485  	resp.response_length = uverbs_response_length(attrs, sizeof(resp));
16e51f78a9db36 Leon Romanovsky    2020-07-19  1486  	return uverbs_response(attrs, &resp, sizeof(resp));
9ead190bfde2a4 Roland Dreier      2006-06-17  1487  
9ead190bfde2a4 Roland Dreier      2006-06-17  1488  err_put:
fd3c7904db6e05 Matan Barak        2017-04-04  1489  	if (!IS_ERR(xrcd_uobj))
fd3c7904db6e05 Matan Barak        2017-04-04  1490  		uobj_put_read(xrcd_uobj);
9ead190bfde2a4 Roland Dreier      2006-06-17  1491  	if (pd)
fd3c7904db6e05 Matan Barak        2017-04-04 @1492  		uobj_put_obj_read(pd);
9ead190bfde2a4 Roland Dreier      2006-06-17  1493  	if (scq)
5bd48c18c8cea0 Jason Gunthorpe    2020-01-08 @1494  		rdma_lookup_put_uobject(&scq->uobject->uevent.uobject,
5bd48c18c8cea0 Jason Gunthorpe    2020-01-08  1495  					UVERBS_LOOKUP_READ);
43db2bc04409b1 Roland Dreier      2006-07-23  1496  	if (rcq && rcq != scq)
5bd48c18c8cea0 Jason Gunthorpe    2020-01-08 @1497  		rdma_lookup_put_uobject(&rcq->uobject->uevent.uobject,
5bd48c18c8cea0 Jason Gunthorpe    2020-01-08  1498  					UVERBS_LOOKUP_READ);
9ead190bfde2a4 Roland Dreier      2006-06-17  1499  	if (srq)
9fbe334c6a67c3 Jason Gunthorpe    2020-01-08 @1500  		rdma_lookup_put_uobject(&srq->uobject->uevent.uobject,
9fbe334c6a67c3 Jason Gunthorpe    2020-01-08  1501  					UVERBS_LOOKUP_READ);
c70285f880e88c Yishai Hadas       2016-05-23  1502  	if (ind_tbl)
fd3c7904db6e05 Matan Barak        2017-04-04 @1503  		uobj_put_obj_read(ind_tbl);
9ead190bfde2a4 Roland Dreier      2006-06-17  1504  
a6a3797df2741a Shamir Rabinovitch 2019-03-31  1505  	uobj_alloc_abort(&obj->uevent.uobject, attrs);
bc38a6abdd5a50 Roland Dreier      2005-07-07  1506  	return ret;
bc38a6abdd5a50 Roland Dreier      2005-07-07  1507  }
bc38a6abdd5a50 Roland Dreier      2005-07-07  1508  

:::::: The code at line 1492 was first introduced by commit
:::::: fd3c7904db6e05043398aee5c1448682acfb025b IB/core: Change idr objects to use the new schema

:::::: TO: Matan Barak <matanb@mellanox.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
