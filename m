Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A9B1662EF
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914536; cv=none; b=QQUHk7RzarJbBue6/QeVyx+z7jQecFqEvKuKKx66KG5Rs/7ltBkfAxxTB21aAywz4fCK/xOGq0Nf+EPuaizxt0yhdF8w0IoOGhvBGQU4eRy5bE6c4zp2mAr5uTqK8Z+elfh3H8ggGm0BrpG4zDGgc00T/EdvQlBXz8xsh0Lae3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914536; c=relaxed/simple;
	bh=ucfxjVSx1lErp3BAfD5OXX8+jLKVfx6JatZrbP1+X+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U7OypSynHLb0FgqDX8IZn4i6z7eEB79LUsCypIF05ZhB+P0PVAZ2Ufv/JZkvwiJI1nh/v/jkBaETwN9VGZLUzQoVWoVHjhAhhps1pCfFz+Z/1X0Ab9IPek7qMi3n3gayx/HVAn3U6V3ouRJlJ/Y7mIFoBDyprIDbLhbiRS3ojas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vz0QtHsj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vz0QtHsj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436345cc17bso12336445e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 06 Feb 2025 23:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738914532; x=1739519332; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4r3MbEJQxAFUsHbptMTBFAx9aBvOKWKrr3oy+Ilncjc=;
        b=vz0QtHsj3gsnVpoWtyRANgV/geRKHvpDLVKk/IwKcJ5Moo3fffl34iZmi1O1u5vQ8m
         D7pfATOb44ZoOE4k+GZFYaKN4aTrga4ZFPXi3kU39L4Po2pIUVW4dRquDVEa6F1gm6cE
         f1IxQ450BKAF145eXHDrnLRGAanSJHoQV4XcKVQaAsHeL+jhtoxmzPz7xDd+mh4lq9tU
         frA8ssm6HR4kOzIOQElxnJNF3f+AbZ9Tqb3mTFkls+oMsYSJZmWKi4dLdyKXHfgbFZ0g
         4lJtY3qtULWfMRuoiSBddPx6o6BJgl3HSTRZw4GVsyxK4X/YVpOYCdP8m7ehLzfuhuRK
         0j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738914532; x=1739519332;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4r3MbEJQxAFUsHbptMTBFAx9aBvOKWKrr3oy+Ilncjc=;
        b=JS+5QPSrCvcsfKxxEDqzb7rhhFPkxfZZrPqb0TmmgNraEcoYZF45KFzsxeG9g5XWNn
         3mvuZNxWnP3nj/tKjXqYqzpnlwvG6tVZYjncRdQKTNXUCD43VFye8qYxlcpZkoECP4CK
         d803lIujjYYeTHF8VoeArjOQJkt2dKsurM2339QmQqea99soi2tdWETwKFVIDL0ErWPK
         8cmxVhBChaZDOvChPmumhZQxps0GbfJk0lHEUKhwWZ29nWQpXI8ME+tHXMOAGWoxPThl
         PEVzB+f5Tx8dxIge7KBehF6Jlfo5I5p8bMyBXPYr+Q9GxgWVwj2YJ4HwFhth/CDUjJXC
         icYQ==
X-Gm-Message-State: AOJu0YyvsoZCBhOF5UfbsrGfBJt+fM6khSpPrTVcbi/aLwm5UcOHsM5O
	3bTeZkUQPIneM+AutkpEB0iyleZU+gtlyMHZ3TW0EzOl7ZrxGUyUh4M/j+Y8oKfDIXwtESpYCPc
	A
X-Gm-Gg: ASbGncss1jsTrGdQQtTyYE0/TB63xdYYhwlXVR61B0ixIX9gGqQIjGth1VrMh/dXy2/
	uidZTpX8+gnIkyiNioQbUQEHACIfvGYHPgHt1lr7R/sK+wVkjYYZ3N5Z2MLNT66c5AJvo1SDMXK
	urjrfJDInXVZD94n0O8T0W48HTASpprTf5lh3+5uMKlS5w1hm0qg+Ce6j+3COfsZp7GK48WB8Du
	l0heFo1j1c8Q0I63VlXQvxezSkQjSvscBiXZdNfxEsXqzeBK1rssZugX9Fr3J/FGTAi+tJ9eZs9
	05Lj+dPqXtTrd4Kym3o+
X-Google-Smtp-Source: AGHT+IFmsp/uMFW2sRxN2GlFm+sYPRDvu0bq7nondZ0bFcrSxY/FEyb3hTlMkBWFR+jRhMFpAhRC/w==
X-Received: by 2002:a05:6000:2af:b0:38d:b325:471f with SMTP id ffacd0b85a97d-38dc90ffcaemr1271663f8f.15.1738914532021;
        Thu, 06 Feb 2025 23:48:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbde0fd18sm3755002f8f.72.2025.02.06.23.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:48:51 -0800 (PST)
Date: Fri, 7 Feb 2025 10:48:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Maher Sanalla <msanalla@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 76/77]
 drivers/infiniband/core/uverbs_cmd.c:1492 create_qp() error: 'pd'
 dereferencing possible ERR_PTR()
Message-ID: <1ae70453-f983-4e0d-9707-02e041da0789@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   98119a2a0f09ec10bf3a35026f43a0e5732be742
commit: 84633f80b89acfaa55e09c273f27843a2277143e [76/77] RDMA/uverbs: Propagate errors from rdma_lookup_get_uobject()
config: i386-randconfig-141-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070936.x78bftbK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502070936.x78bftbK-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/uverbs_cmd.c:1492 create_qp() error: 'pd' dereferencing possible ERR_PTR()
drivers/infiniband/core/uverbs_cmd.c:1494 create_qp() error: 'scq' dereferencing possible ERR_PTR()
drivers/infiniband/core/uverbs_cmd.c:1497 create_qp() error: 'rcq' dereferencing possible ERR_PTR()
drivers/infiniband/core/uverbs_cmd.c:1500 create_qp() error: 'srq' dereferencing possible ERR_PTR()
drivers/infiniband/core/uverbs_cmd.c:1503 create_qp() error: 'ind_tbl' dereferencing possible ERR_PTR()

vim +/pd +1492 drivers/infiniband/core/uverbs_cmd.c

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

pd is an error pointer.

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
                                                                                  ^^
Dead.  Same for the rest.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

