Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73A92FFDDE
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768519167; cv=none; b=WSdNzVjpGO8tWGvdeUR4nTzFkqSaDuwi2FZlfh7B4QeVlKzfvq+Lz5/qX6cdjyghsrjEIZOQp3aFOQ6VXo6UYnIxjgbsLuMjUnU1OJ6MwELKss98D7hQm4k2su7NCkyxRlFYncMzk8a0voH80HoxoogdEupETcZCixyia0qc9mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768519167; c=relaxed/simple;
	bh=MpZLOJIvZSMu9u156R5F9M8L+tIH/AkURU8JAfy5sGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J8BWDt7Y4mES09wyYQuJV24VJKTsCQJiGrQQX152zZqfW2exWTdcqQNkL5lZvs5YUlxH/uqpJkmt2gvbE68JuD3WqIBs47qW+LFIK6h8BcQmVEIHYU569J9jMNfZFqgh6bHaeXs3iED/Xf0DypW0fwidfAdjt/tuTjVRVRLcaao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ym9Jjb83; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ym9Jjb83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768519165; x=1800055165;
  h=date:from:to:cc:subject:message-id;
  bh=MpZLOJIvZSMu9u156R5F9M8L+tIH/AkURU8JAfy5sGk=;
  b=Ym9Jjb83YEdSh08RSpYhFC7CHTdh7QQ9IBP/Ulxoi9E9GvwBGOSxT7FR
   7n3nv1dW2GMmhjehd0cheeBzSqjTR54vA0eY5S9F5ZohG2smMeSWO1Gfc
   DJTeg9xbwznEw9yMWFxmhUDAY2B6FYglFZgeBuKaZT2x6XBakATuIKJm/
   Q1tQi1Qyge1Vaxhhr9R/0i2RHYTuOmaqQzpu/Ut8ubrTVJ/O8h+M4cVDT
   546V/0pbOuQuhx5pe94UxlS2M4cEmIz15Tyoj8JBZvroJDDNjsh0HKkdR
   pW/yZu32xuwgw8gIBBmtnLqAw9URjTUFI6JeUcBL89z09zyLfc2/5ci8k
   A==;
X-CSE-ConnectionGUID: 2J6sF0BITWe+fxtQif+Yvg==
X-CSE-MsgGUID: U/wckaT7RMCHPSZ9hO+tfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80947673"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80947673"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 15:19:23 -0800
X-CSE-ConnectionGUID: 1xLwzIXrQdSkZvyvjMEcfw==
X-CSE-MsgGUID: ANXlkV2rQYefMFqQHQEGPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="210114794"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2026 15:19:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgWcZ-00000000K6M-0o6L;
	Thu, 15 Jan 2026 23:19:19 +0000
Date: Fri, 16 Jan 2026 07:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android16-6.12-lts 1/1]
 drivers/infiniband/ulp/rtrs/rtrs-clt.c:444:7-32: opportunity for
 str_write_read(req -> dir == DMA_TO_DEVICE)
Message-ID: <202601160700.rDuEdLIG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   d8df691c15ecca8cee9b28ff82915c7034e90794
commit: ff7395890580447507b27851c06e396f75913443 [1/1] RDMA/rtrs-clt: Print request type for errors
:::::: branch date: 31 hours ago
:::::: commit date: 1 year, 5 months ago
config: arm-randconfig-r053-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160700.rDuEdLIG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601160700.rDuEdLIG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/ulp/rtrs/rtrs-clt.c:444:7-32: opportunity for str_write_read(req -> dir == DMA_TO_DEVICE)

vim +444 drivers/infiniband/ulp/rtrs/rtrs-clt.c

6a98d71daea1862 Jack Wang        2020-05-11  379  
6a98d71daea1862 Jack Wang        2020-05-11  380  static void complete_rdma_req(struct rtrs_clt_io_req *req, int errno,
6a98d71daea1862 Jack Wang        2020-05-11  381  			      bool notify, bool can_wait)
6a98d71daea1862 Jack Wang        2020-05-11  382  {
6a98d71daea1862 Jack Wang        2020-05-11  383  	struct rtrs_clt_con *con = req->con;
caa84d95c78f351 Vaishali Thakkar 2022-01-05  384  	struct rtrs_clt_path *clt_path;
6a98d71daea1862 Jack Wang        2020-05-11  385  	int err;
6a98d71daea1862 Jack Wang        2020-05-11  386  
0c8bb6eb70ca410 Jack Wang        2023-11-20  387  	if (!req->in_use)
6a98d71daea1862 Jack Wang        2020-05-11  388  		return;
6a98d71daea1862 Jack Wang        2020-05-11  389  	if (WARN_ON(!req->con))
6a98d71daea1862 Jack Wang        2020-05-11  390  		return;
caa84d95c78f351 Vaishali Thakkar 2022-01-05  391  	clt_path = to_clt_path(con->c.path);
6a98d71daea1862 Jack Wang        2020-05-11  392  
6a98d71daea1862 Jack Wang        2020-05-11  393  	if (req->sg_cnt) {
6793f9581f75d98 Jack Wang        2024-08-21  394  		if (req->mr->need_inval) {
6a98d71daea1862 Jack Wang        2020-05-11  395  			/*
8c8dd4e13bd5a71 Jack Wang        2024-08-21  396  			 * We are here to invalidate read/write requests
6a98d71daea1862 Jack Wang        2020-05-11  397  			 * ourselves.  In normal scenario server should
8c8dd4e13bd5a71 Jack Wang        2024-08-21  398  			 * send INV for all read requests, we do chained local
8c8dd4e13bd5a71 Jack Wang        2024-08-21  399  			 * invalidate for write requests, but
6a98d71daea1862 Jack Wang        2020-05-11  400  			 * we are here, thus two things could happen:
6a98d71daea1862 Jack Wang        2020-05-11  401  			 *
6a98d71daea1862 Jack Wang        2020-05-11  402  			 *    1.  this is failover, when errno != 0
6a98d71daea1862 Jack Wang        2020-05-11  403  			 *        and can_wait == 1,
6a98d71daea1862 Jack Wang        2020-05-11  404  			 *
6a98d71daea1862 Jack Wang        2020-05-11  405  			 *    2.  something totally bad happened and
6a98d71daea1862 Jack Wang        2020-05-11  406  			 *        server forgot to send INV, so we
6a98d71daea1862 Jack Wang        2020-05-11  407  			 *        should do that ourselves.
6a98d71daea1862 Jack Wang        2020-05-11  408  			 */
6a98d71daea1862 Jack Wang        2020-05-11  409  
4693d6b767d6cab Gioh Kim         2021-08-06  410  			if (can_wait) {
6a98d71daea1862 Jack Wang        2020-05-11  411  				req->need_inv_comp = true;
6a98d71daea1862 Jack Wang        2020-05-11  412  			} else {
6a98d71daea1862 Jack Wang        2020-05-11  413  				/* This should be IO path, so always notify */
6a98d71daea1862 Jack Wang        2020-05-11  414  				WARN_ON(!notify);
6a98d71daea1862 Jack Wang        2020-05-11  415  				/* Save errno for INV callback */
6a98d71daea1862 Jack Wang        2020-05-11  416  				req->inv_errno = errno;
6a98d71daea1862 Jack Wang        2020-05-11  417  			}
6a98d71daea1862 Jack Wang        2020-05-11  418  
2ece9ec62e5b276 Jack Wang        2021-06-21  419  			refcount_inc(&req->ref);
6a98d71daea1862 Jack Wang        2020-05-11  420  			err = rtrs_inv_rkey(req);
4693d6b767d6cab Gioh Kim         2021-08-06  421  			if (err) {
53c26f3ecd59e80 Jack Wang        2024-08-21  422  				rtrs_err_rl(con->c.path, "Send INV WR key=%#x: %d\n",
6a98d71daea1862 Jack Wang        2020-05-11  423  					  req->mr->rkey, err);
4693d6b767d6cab Gioh Kim         2021-08-06  424  			} else if (can_wait) {
6a98d71daea1862 Jack Wang        2020-05-11  425  				wait_for_completion(&req->inv_comp);
6a98d71daea1862 Jack Wang        2020-05-11  426  			}
2ece9ec62e5b276 Jack Wang        2021-06-21  427  			if (!refcount_dec_and_test(&req->ref))
2ece9ec62e5b276 Jack Wang        2021-06-21  428  				return;
6a98d71daea1862 Jack Wang        2020-05-11  429  		}
caa84d95c78f351 Vaishali Thakkar 2022-01-05  430  		ib_dma_unmap_sg(clt_path->s.dev->ib_dev, req->sglist,
6a98d71daea1862 Jack Wang        2020-05-11  431  				req->sg_cnt, req->dir);
6a98d71daea1862 Jack Wang        2020-05-11  432  	}
2ece9ec62e5b276 Jack Wang        2021-06-21  433  	if (!refcount_dec_and_test(&req->ref))
2ece9ec62e5b276 Jack Wang        2021-06-21  434  		return;
0d8f2cfa23f04ca Gioh Kim         2021-08-06  435  	if (req->mp_policy == MP_POLICY_MIN_INFLIGHT)
caa84d95c78f351 Vaishali Thakkar 2022-01-05  436  		atomic_dec(&clt_path->stats->inflight);
6a98d71daea1862 Jack Wang        2020-05-11  437  
6a98d71daea1862 Jack Wang        2020-05-11  438  	req->in_use = false;
6a98d71daea1862 Jack Wang        2020-05-11  439  	req->con = NULL;
6a98d71daea1862 Jack Wang        2020-05-11  440  
2f37b01725382cd Gioh Kim         2021-04-06  441  	if (errno) {
ff7395890580447 Jack Wang        2024-08-21  442  		rtrs_err_rl(con->c.path,
ff7395890580447 Jack Wang        2024-08-21  443  			    "IO %s request failed: error=%d path=%s [%s:%u] notify=%d\n",
ff7395890580447 Jack Wang        2024-08-21 @444  			    req->dir == DMA_TO_DEVICE ? "write" : "read", errno,
ff7395890580447 Jack Wang        2024-08-21  445  			    kobject_name(&clt_path->kobj), clt_path->hca_name,
caa84d95c78f351 Vaishali Thakkar 2022-01-05  446  			    clt_path->hca_port, notify);
2f37b01725382cd Gioh Kim         2021-04-06  447  	}
2f37b01725382cd Gioh Kim         2021-04-06  448  
6a98d71daea1862 Jack Wang        2020-05-11  449  	if (notify)
6a98d71daea1862 Jack Wang        2020-05-11  450  		req->conf(req->priv, errno);
6a98d71daea1862 Jack Wang        2020-05-11  451  }
6a98d71daea1862 Jack Wang        2020-05-11  452  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
