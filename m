Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32F41BDCF
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742656535; cv=none; b=ma922M6bHfm/vc5pThbTm8QeZfmQFJt9g2G+0ObcaOMc7qPHGpGSBOMBEkoZzNdMPouzzMNCisBs27RfioJ8Lsn+65dxrvqwnTALw+0CZ/XCskQcJ1xI2Z6Ax/8vwD1lY06ArdBGQsUx1KPQCVahD7y+anPsLDuVyKYMfulh0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742656535; c=relaxed/simple;
	bh=oI9LrDlsFC4QdclBtsQu+M6q9DyM8kmDbjy2RHZ8yew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SpX9P5CAVdHwegG5gwHESMbuyOIuGjDT4Mu1poKmDRJpiRYUVUhF3/Ks2zSfaGg7d81KibpxYs/c9HOgeICQFUwjjM2MdJt4eN8lbF6P+rmU+uyz41BZEmx5Y1Xc8qDe4O/A+TeS/pT93qd9mMI6OIl8+8jPQFdciJ7xKyFaAiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDuMsmnq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDuMsmnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742656532; x=1774192532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oI9LrDlsFC4QdclBtsQu+M6q9DyM8kmDbjy2RHZ8yew=;
  b=MDuMsmnqWYOJ01buo3VJg30S8lqftmbUm9ockaV/UiWxMB0NZCvMhUiQ
   Kr9XWSqFPtIleRBQTj4tZ6ZE2zpzGCcucdRMTh4ia0xaMX+I7T259Rksq
   qmbtVCm0FOxrxvzEnfk2hA1GkmhyEAfJKLA6J9h6igFFYWJLyBPmhrfOK
   oL+1BCp4u/HSy6up/8Ar6cqssX+S8zVBfBqSH4qkEdaZNofierDKmEfNJ
   Qu+Zv5XYvTItv9CePHfXLZpnJ29Cr9hiTLmee+Bug51LfnKbsZT0Sdukg
   z3nZCBDXzn22wgJeGLwcAXna91/JELyq6pf+OxU31Bgt/jLHKiSl5mJAf
   w==;
X-CSE-ConnectionGUID: gZXod/UJSWGBmFor8aWNnQ==
X-CSE-MsgGUID: vBhoLrHUS2K9jLpAF2f3CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="47684881"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="47684881"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 08:15:32 -0700
X-CSE-ConnectionGUID: rBlFLuqdSzekl49mx2gkZA==
X-CSE-MsgGUID: bUN5waqeTpWE3YntUAjgJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="128762587"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Mar 2025 08:15:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw0ZM-0002D3-1r;
	Sat, 22 Mar 2025 15:15:28 +0000
Date: Sat, 22 Mar 2025 23:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline-rust 2/2]
 drivers/infiniband/ulp/rtrs/rtrs-clt.c:444:7-32: opportunity for
 str_write_read(req -> dir == DMA_TO_DEVICE)
Message-ID: <202503222318.fhbd89NL-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   69e641afed13f4ee53e66be0464646d326f9b5b1
commit: ff7395890580447507b27851c06e396f75913443 [2/2] RDMA/rtrs-clt: Print request type for errors
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-103-20250322 (https://download.01.org/0day-ci/archive/20250322/202503222318.fhbd89NL-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503222318.fhbd89NL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/ulp/rtrs/rtrs-clt.c:444:7-32: opportunity for str_write_read(req -> dir == DMA_TO_DEVICE)

vim +444 drivers/infiniband/ulp/rtrs/rtrs-clt.c

6a98d71daea186 Jack Wang        2020-05-11  379  
6a98d71daea186 Jack Wang        2020-05-11  380  static void complete_rdma_req(struct rtrs_clt_io_req *req, int errno,
6a98d71daea186 Jack Wang        2020-05-11  381  			      bool notify, bool can_wait)
6a98d71daea186 Jack Wang        2020-05-11  382  {
6a98d71daea186 Jack Wang        2020-05-11  383  	struct rtrs_clt_con *con = req->con;
caa84d95c78f35 Vaishali Thakkar 2022-01-05  384  	struct rtrs_clt_path *clt_path;
6a98d71daea186 Jack Wang        2020-05-11  385  	int err;
6a98d71daea186 Jack Wang        2020-05-11  386  
0c8bb6eb70ca41 Jack Wang        2023-11-20  387  	if (!req->in_use)
6a98d71daea186 Jack Wang        2020-05-11  388  		return;
6a98d71daea186 Jack Wang        2020-05-11  389  	if (WARN_ON(!req->con))
6a98d71daea186 Jack Wang        2020-05-11  390  		return;
caa84d95c78f35 Vaishali Thakkar 2022-01-05  391  	clt_path = to_clt_path(con->c.path);
6a98d71daea186 Jack Wang        2020-05-11  392  
6a98d71daea186 Jack Wang        2020-05-11  393  	if (req->sg_cnt) {
6793f9581f75d9 Jack Wang        2024-08-21  394  		if (req->mr->need_inval) {
6a98d71daea186 Jack Wang        2020-05-11  395  			/*
8c8dd4e13bd5a7 Jack Wang        2024-08-21  396  			 * We are here to invalidate read/write requests
6a98d71daea186 Jack Wang        2020-05-11  397  			 * ourselves.  In normal scenario server should
8c8dd4e13bd5a7 Jack Wang        2024-08-21  398  			 * send INV for all read requests, we do chained local
8c8dd4e13bd5a7 Jack Wang        2024-08-21  399  			 * invalidate for write requests, but
6a98d71daea186 Jack Wang        2020-05-11  400  			 * we are here, thus two things could happen:
6a98d71daea186 Jack Wang        2020-05-11  401  			 *
6a98d71daea186 Jack Wang        2020-05-11  402  			 *    1.  this is failover, when errno != 0
6a98d71daea186 Jack Wang        2020-05-11  403  			 *        and can_wait == 1,
6a98d71daea186 Jack Wang        2020-05-11  404  			 *
6a98d71daea186 Jack Wang        2020-05-11  405  			 *    2.  something totally bad happened and
6a98d71daea186 Jack Wang        2020-05-11  406  			 *        server forgot to send INV, so we
6a98d71daea186 Jack Wang        2020-05-11  407  			 *        should do that ourselves.
6a98d71daea186 Jack Wang        2020-05-11  408  			 */
6a98d71daea186 Jack Wang        2020-05-11  409  
4693d6b767d6ca Gioh Kim         2021-08-06  410  			if (can_wait) {
6a98d71daea186 Jack Wang        2020-05-11  411  				req->need_inv_comp = true;
6a98d71daea186 Jack Wang        2020-05-11  412  			} else {
6a98d71daea186 Jack Wang        2020-05-11  413  				/* This should be IO path, so always notify */
6a98d71daea186 Jack Wang        2020-05-11  414  				WARN_ON(!notify);
6a98d71daea186 Jack Wang        2020-05-11  415  				/* Save errno for INV callback */
6a98d71daea186 Jack Wang        2020-05-11  416  				req->inv_errno = errno;
6a98d71daea186 Jack Wang        2020-05-11  417  			}
6a98d71daea186 Jack Wang        2020-05-11  418  
2ece9ec62e5b27 Jack Wang        2021-06-21  419  			refcount_inc(&req->ref);
6a98d71daea186 Jack Wang        2020-05-11  420  			err = rtrs_inv_rkey(req);
4693d6b767d6ca Gioh Kim         2021-08-06  421  			if (err) {
53c26f3ecd59e8 Jack Wang        2024-08-21  422  				rtrs_err_rl(con->c.path, "Send INV WR key=%#x: %d\n",
6a98d71daea186 Jack Wang        2020-05-11  423  					  req->mr->rkey, err);
4693d6b767d6ca Gioh Kim         2021-08-06  424  			} else if (can_wait) {
6a98d71daea186 Jack Wang        2020-05-11  425  				wait_for_completion(&req->inv_comp);
6a98d71daea186 Jack Wang        2020-05-11  426  			}
2ece9ec62e5b27 Jack Wang        2021-06-21  427  			if (!refcount_dec_and_test(&req->ref))
2ece9ec62e5b27 Jack Wang        2021-06-21  428  				return;
6a98d71daea186 Jack Wang        2020-05-11  429  		}
caa84d95c78f35 Vaishali Thakkar 2022-01-05  430  		ib_dma_unmap_sg(clt_path->s.dev->ib_dev, req->sglist,
6a98d71daea186 Jack Wang        2020-05-11  431  				req->sg_cnt, req->dir);
6a98d71daea186 Jack Wang        2020-05-11  432  	}
2ece9ec62e5b27 Jack Wang        2021-06-21  433  	if (!refcount_dec_and_test(&req->ref))
2ece9ec62e5b27 Jack Wang        2021-06-21  434  		return;
0d8f2cfa23f04c Gioh Kim         2021-08-06  435  	if (req->mp_policy == MP_POLICY_MIN_INFLIGHT)
caa84d95c78f35 Vaishali Thakkar 2022-01-05  436  		atomic_dec(&clt_path->stats->inflight);
6a98d71daea186 Jack Wang        2020-05-11  437  
6a98d71daea186 Jack Wang        2020-05-11  438  	req->in_use = false;
6a98d71daea186 Jack Wang        2020-05-11  439  	req->con = NULL;
6a98d71daea186 Jack Wang        2020-05-11  440  
2f37b01725382c Gioh Kim         2021-04-06  441  	if (errno) {
ff739589058044 Jack Wang        2024-08-21  442  		rtrs_err_rl(con->c.path,
ff739589058044 Jack Wang        2024-08-21  443  			    "IO %s request failed: error=%d path=%s [%s:%u] notify=%d\n",
ff739589058044 Jack Wang        2024-08-21 @444  			    req->dir == DMA_TO_DEVICE ? "write" : "read", errno,
ff739589058044 Jack Wang        2024-08-21  445  			    kobject_name(&clt_path->kobj), clt_path->hca_name,
caa84d95c78f35 Vaishali Thakkar 2022-01-05  446  			    clt_path->hca_port, notify);
2f37b01725382c Gioh Kim         2021-04-06  447  	}
2f37b01725382c Gioh Kim         2021-04-06  448  
6a98d71daea186 Jack Wang        2020-05-11  449  	if (notify)
6a98d71daea186 Jack Wang        2020-05-11  450  		req->conf(req->priv, errno);
6a98d71daea186 Jack Wang        2020-05-11  451  }
6a98d71daea186 Jack Wang        2020-05-11  452  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
