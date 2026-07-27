Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422AC4156F7
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jul 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158676; cv=none; b=qWQJnSNYHYgbv2dHjD0vDIQmQJChxd8rPBj3Z/n4E98t7f7abG7zop1HnKFOTYWvUW3qpAULlvVfMDim2EoriVHf6h9dGPeuhUAfebnJQgMTl+Z6v9srnvShpXWG9h8j5lz41rndjUyt9WkRHkPRExAMrPxNfssn/t6gwcEvKRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158676; c=relaxed/simple;
	bh=OLPGmKisvQvgZuPKrk73xZEB5yXH8upGdeIvgIyMqyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BpK4F6KNXoRaO3qdVs9rdbD8WqwyZ4d40oevfQOuNUrGIBUCEeYDrjsXv9Ul1aXwawqkzGHBh4rsVbEu8HkFYHZKg5O5gzPq3jx08JLBe+UXgTWhMWnJuvd1pCCHdWwWMMwRX5phvI8lpkC8Wva/1GJwoUQx53vgk54+C+l4lDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0pTHNQa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0pTHNQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785158674; x=1816694674;
  h=date:from:to:cc:subject:message-id;
  bh=OLPGmKisvQvgZuPKrk73xZEB5yXH8upGdeIvgIyMqyo=;
  b=n0pTHNQarnEbD8/zmbRIxJI1v87VI4pGhL8HZqPuFXrM3etVVqzbup47
   XMcE8Bm0289YcRhWtdPqiZpLmiRXd80ItE1z5kQEu0tcMwFbVEW6MN9Vp
   rEjE9YqBzkW5XZngRu8ZuirIiJjbN5kXyi/ie6fL4gwvdvRg1og34SGfj
   1Ccje4LJENhjcYi2msOu7oaX2FEhJXOSvfbw+nBpZvOmBG2/V4G3AQuUy
   21rRJ2V0GkASQov/r51fqf+7YUGDTUPiVDIjWZRTxccIS4GPgJVrsxtaO
   Ie4+nrR1Iz1/TN4clxDMIcG1kvNNpUcicvaJOHTb04cHFStjXIsTx4a+e
   w==;
X-CSE-ConnectionGUID: GoBOwDp5SxGUVQzy7VjqXA==
X-CSE-MsgGUID: BTm69x+tRUSFdzL3Ze0wvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85489488"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85489488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 06:24:34 -0700
X-CSE-ConnectionGUID: Gi98TFQdTIeDHP4yqK2Ipg==
X-CSE-MsgGUID: RXPc8gaUT+yoaQim2AinFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="257622613"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Jul 2026 06:24:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woLJm-00000000dBF-2i16;
	Mon, 27 Jul 2026 13:24:30 +0000
Date: Mon, 27 Jul 2026 21:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/sw/rxe/rxe_verbs.c:1101 rxe_create_cq()
 warn: missing unwind goto?
Message-ID: <202607272122.kETnCupL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Leon Romanovsky <leonro@nvidia.com>
CC: Zhu Yanjun <yanjun.zhu@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: dc76086a2d94d09aea9fd41a65ed56e0f7a6ec50 RDMA: Properly propagate the number of CQEs as unsigned int
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20260727 (https://download.01.org/0day-ci/archive/20260727/202607272122.kETnCupL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dc76086a2d94 ("RDMA: Properly propagate the number of CQEs as unsigned int")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607272122.kETnCupL-lkp@intel.com/

smatch warnings:
drivers/infiniband/sw/rxe/rxe_verbs.c:1101 rxe_create_cq() warn: missing unwind goto?
drivers/infiniband/sw/rxe/rxe_verbs.c:1146 rxe_resize_cq() warn: missing unwind goto?

vim +1101 drivers/infiniband/sw/rxe/rxe_verbs.c

8700e3e7c4857d Moni Shoua         2016-06-16  1073  
5bf944f24129cb Bob Pearson        2023-03-03  1074  /* cq */
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  1075  static int rxe_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
dd6d7f8574d7f8 Akiva Goldberger   2024-06-27  1076  			 struct uverbs_attr_bundle *attrs)
8700e3e7c4857d Moni Shoua         2016-06-16  1077  {
dd6d7f8574d7f8 Akiva Goldberger   2024-06-27  1078  	struct ib_udata *udata = &attrs->driver_udata;
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  1079  	struct ib_device *dev = ibcq->device;
8700e3e7c4857d Moni Shoua         2016-06-16  1080  	struct rxe_dev *rxe = to_rdev(dev);
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  1081  	struct rxe_cq *cq = to_rcq(ibcq);
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1082  	struct rxe_create_cq_resp __user *uresp = NULL;
5bf944f24129cb Bob Pearson        2023-03-03  1083  	int err, cleanup_err;
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1084  
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1085  	if (udata) {
5bf944f24129cb Bob Pearson        2023-03-03  1086  		if (udata->outlen < sizeof(*uresp)) {
5bf944f24129cb Bob Pearson        2023-03-03  1087  			err = -EINVAL;
6482718086bf69 Li Zhijian         2024-01-09  1088  			rxe_dbg_dev(rxe, "malformed udata, err = %d\n", err);
5bf944f24129cb Bob Pearson        2023-03-03  1089  			goto err_out;
5bf944f24129cb Bob Pearson        2023-03-03  1090  		}
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1091  		uresp = udata->outbuf;
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1092  	}
8700e3e7c4857d Moni Shoua         2016-06-16  1093  
5bf944f24129cb Bob Pearson        2023-03-03  1094  	if (attr->flags) {
5bf944f24129cb Bob Pearson        2023-03-03  1095  		err = -EOPNOTSUPP;
6482718086bf69 Li Zhijian         2024-01-09  1096  		rxe_dbg_dev(rxe, "bad attr->flags, err = %d\n", err);
5bf944f24129cb Bob Pearson        2023-03-03  1097  		goto err_out;
5bf944f24129cb Bob Pearson        2023-03-03  1098  	}
8700e3e7c4857d Moni Shoua         2016-06-16  1099  
dc76086a2d94d0 Leon Romanovsky    2026-03-19  1100  	if (attr->cqe > rxe->attr.max_cqe)
dc76086a2d94d0 Leon Romanovsky    2026-03-19 @1101  		return -EINVAL;
5bf944f24129cb Bob Pearson        2023-03-03  1102  
5bf944f24129cb Bob Pearson        2023-03-03  1103  	err = rxe_add_to_pool(&rxe->cq_pool, cq);
5bf944f24129cb Bob Pearson        2023-03-03  1104  	if (err) {
6482718086bf69 Li Zhijian         2024-01-09  1105  		rxe_dbg_dev(rxe, "unable to create cq, err = %d\n", err);
5bf944f24129cb Bob Pearson        2023-03-03  1106  		goto err_out;
5bf944f24129cb Bob Pearson        2023-03-03  1107  	}
8700e3e7c4857d Moni Shoua         2016-06-16  1108  
ff23dfa134576e Shamir Rabinovitch 2019-03-31  1109  	err = rxe_cq_from_init(rxe, cq, attr->cqe, attr->comp_vector, udata,
ff23dfa134576e Shamir Rabinovitch 2019-03-31  1110  			       uresp);
5bf944f24129cb Bob Pearson        2023-03-03  1111  	if (err) {
6482718086bf69 Li Zhijian         2024-01-09  1112  		rxe_dbg_cq(cq, "create cq failed, err = %d\n", err);
5bf944f24129cb Bob Pearson        2023-03-03  1113  		goto err_cleanup;
8700e3e7c4857d Moni Shoua         2016-06-16  1114  	}
8700e3e7c4857d Moni Shoua         2016-06-16  1115  
43d781b9fa562f Leon Romanovsky    2020-09-07  1116  	return 0;
5bf944f24129cb Bob Pearson        2023-03-03  1117  
5bf944f24129cb Bob Pearson        2023-03-03  1118  err_cleanup:
5bf944f24129cb Bob Pearson        2023-03-03  1119  	cleanup_err = rxe_cleanup(cq);
5bf944f24129cb Bob Pearson        2023-03-03  1120  	if (cleanup_err)
6482718086bf69 Li Zhijian         2024-01-09  1121  		rxe_err_cq(cq, "cleanup failed, err = %d\n", cleanup_err);
5bf944f24129cb Bob Pearson        2023-03-03  1122  err_out:
6482718086bf69 Li Zhijian         2024-01-09  1123  	rxe_err_dev(rxe, "returned err = %d\n", err);
5bf944f24129cb Bob Pearson        2023-03-03  1124  	return err;
8700e3e7c4857d Moni Shoua         2016-06-16  1125  }
8700e3e7c4857d Moni Shoua         2016-06-16  1126  
dc76086a2d94d0 Leon Romanovsky    2026-03-19  1127  static int rxe_resize_cq(struct ib_cq *ibcq, unsigned int cqe,
dc76086a2d94d0 Leon Romanovsky    2026-03-19  1128  			 struct ib_udata *udata)
8700e3e7c4857d Moni Shoua         2016-06-16  1129  {
8700e3e7c4857d Moni Shoua         2016-06-16  1130  	struct rxe_cq *cq = to_rcq(ibcq);
8700e3e7c4857d Moni Shoua         2016-06-16  1131  	struct rxe_dev *rxe = to_rdev(ibcq->device);
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1132  	struct rxe_resize_cq_resp __user *uresp = NULL;
5bf944f24129cb Bob Pearson        2023-03-03  1133  	int err;
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1134  
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1135  	if (udata) {
5bf944f24129cb Bob Pearson        2023-03-03  1136  		if (udata->outlen < sizeof(*uresp)) {
5bf944f24129cb Bob Pearson        2023-03-03  1137  			err = -EINVAL;
6482718086bf69 Li Zhijian         2024-01-09  1138  			rxe_dbg_cq(cq, "malformed udata\n");
5bf944f24129cb Bob Pearson        2023-03-03  1139  			goto err_out;
5bf944f24129cb Bob Pearson        2023-03-03  1140  		}
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1141  		uresp = udata->outbuf;
0c43ab371bcb07 Jason Gunthorpe    2018-03-13  1142  	}
8700e3e7c4857d Moni Shoua         2016-06-16  1143  
dc76086a2d94d0 Leon Romanovsky    2026-03-19  1144  	if (cqe > rxe->attr.max_cqe ||
dc76086a2d94d0 Leon Romanovsky    2026-03-19  1145  	    cqe < queue_count(cq->queue, QUEUE_TYPE_TO_CLIENT))
dc76086a2d94d0 Leon Romanovsky    2026-03-19 @1146  		return -EINVAL;
5bf944f24129cb Bob Pearson        2023-03-03  1147  
5bf944f24129cb Bob Pearson        2023-03-03  1148  	err = rxe_cq_resize_queue(cq, cqe, uresp, udata);
5bf944f24129cb Bob Pearson        2023-03-03  1149  	if (err) {
6482718086bf69 Li Zhijian         2024-01-09  1150  		rxe_dbg_cq(cq, "resize cq failed, err = %d\n", err);
5bf944f24129cb Bob Pearson        2023-03-03  1151  		goto err_out;
5bf944f24129cb Bob Pearson        2023-03-03  1152  	}
5bf944f24129cb Bob Pearson        2023-03-03  1153  
5bf944f24129cb Bob Pearson        2023-03-03  1154  	return 0;
692373d186205d Yunsheng Lin       2022-10-28  1155  
5bf944f24129cb Bob Pearson        2023-03-03  1156  err_out:
6482718086bf69 Li Zhijian         2024-01-09  1157  	rxe_err_cq(cq, "returned err = %d\n", err);
5bf944f24129cb Bob Pearson        2023-03-03  1158  	return err;
8700e3e7c4857d Moni Shoua         2016-06-16  1159  }
8700e3e7c4857d Moni Shoua         2016-06-16  1160  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
