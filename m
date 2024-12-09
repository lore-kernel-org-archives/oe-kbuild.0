Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D9A74068
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 03:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733715486; cv=none; b=ILRCVARBvRUucOB2YjD/FQopgVEdOhndcxzYZUyQLFVV1F5U2bav1xsJJBEZJTDDcb1FZsed9ze+xhPlSfkOlJLz03LhYukDg2rXvUBE7R18E+pm1BTPQh+oxi55PREnSVBZo0pL/zS5SuPgby8ztBDliRewEmvyfQsAByEBTAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733715486; c=relaxed/simple;
	bh=/Zs+Gcfxy9DT7B3RNuYFfMXk9TqRyzJwtj4ocw2kApE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mk2JEWOPMYHuJBqI8BPJvw68P72CxKJD0bEQTI6K3xlo/6jhME+p/Gh+RWsvWoUvW0H0Xt36kRLd0HjijBM4L5tSfMtM8jGGESm2i7yRCXKfCA8DK3hT0h+8DZaY0zVAN6uOlQK9z7oIgwb6ib5ub4/FepeTqJaKSE10bYNQxGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8S+DG4m; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8S+DG4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733715484; x=1765251484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Zs+Gcfxy9DT7B3RNuYFfMXk9TqRyzJwtj4ocw2kApE=;
  b=d8S+DG4mCWt8QXbrat5l+gpN0VcdJ/JrkwXiS9h9Ikj0el50YzxGgx76
   XqSeFl4MB1TS0/K8r4FUOGo3v118KzUbFI35OIvoxKVq4ossj6y9OhC5J
   ej0HXGEJfjs6Vid1zwHpGXQtwdL64rxor1iqQrLBKABBdmzaBLJxurBXR
   bbz7WludEsPZmqGETraYtitHLlPVCNjXKxd2dvkIga0GHPKw9DVQdafLx
   Ipcx34eJY8KFlltaP7tv/bY8Z9lM5RovN+wGYDIyN16vRVr+nlvc7ICCq
   hMMLkYp2ID/T/iXGvv2whKcuqqowwb15+6lqjoRYvUlFp0JheCcyDeFPw
   A==;
X-CSE-ConnectionGUID: zmYl4uv5RUSfRPkukMSi8g==
X-CSE-MsgGUID: YVXWDro5SDCVwM8rDn2l3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51413039"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51413039"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:38:02 -0800
X-CSE-ConnectionGUID: vwBL8NSQQcSD1NqoPoKw8A==
X-CSE-MsgGUID: wNYbCFY1QxO8p4/JsC3i0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95422827"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2024 19:38:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUas-0003jx-2S;
	Mon, 09 Dec 2024 03:37:58 +0000
Date: Mon, 9 Dec 2024 11:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: io_uring/rsrc.c:1060:2-8: preceding lock on line 1055
Message-ID: <202412070654.2UoRLjPm-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: 7029acd8a950393ee3a3d8e1a7ee1a9b77808a3b io_uring/rsrc: get rid of per-ring io_rsrc_node list
date:   5 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 weeks ago
config: csky-randconfig-r053-20241206 (https://download.01.org/0day-ci/archive/20241207/202412070654.2UoRLjPm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412070654.2UoRLjPm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/rsrc.c:1060:2-8: preceding lock on line 1055

vim +1060 io_uring/rsrc.c

7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1008  
636119af94f2fbf Jens Axboe 2024-09-14  1009  static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx)
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1010  {
7029acd8a950393 Jens Axboe 2024-10-25  1011  	struct io_rsrc_node **user_bufs;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1012  	struct io_rsrc_data *data;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1013  	int i, ret, nbufs;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1014  
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1015  	/*
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1016  	 * Drop our own lock here. We'll setup the data we need and reference
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1017  	 * the source buffers, then re-grab, check, and assign at the end.
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1018  	 */
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1019  	mutex_unlock(&ctx->uring_lock);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1020  
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1021  	mutex_lock(&src_ctx->uring_lock);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1022  	ret = -ENXIO;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1023  	nbufs = src_ctx->nr_user_bufs;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1024  	if (!nbufs)
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1025  		goto out_unlock;
7029acd8a950393 Jens Axboe 2024-10-25  1026  	ret = io_rsrc_data_alloc(ctx, nbufs, &data);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1027  	if (ret)
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1028  		goto out_unlock;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1029  
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1030  	ret = -ENOMEM;
7029acd8a950393 Jens Axboe 2024-10-25  1031  	user_bufs = kvmalloc_array(nbufs, sizeof(struct io_rsrc_node *),
7029acd8a950393 Jens Axboe 2024-10-25  1032  					GFP_KERNEL | __GFP_ZERO);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1033  	if (!user_bufs)
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1034  		goto out_free_data;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1035  
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1036  	for (i = 0; i < nbufs; i++) {
7029acd8a950393 Jens Axboe 2024-10-25  1037  		struct io_mapped_ubuf *imu = src_ctx->user_bufs[i]->buf;
7029acd8a950393 Jens Axboe 2024-10-25  1038  		struct io_rsrc_node *dst_node;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1039  
7029acd8a950393 Jens Axboe 2024-10-25  1040  		dst_node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
7029acd8a950393 Jens Axboe 2024-10-25  1041  		if (!dst_node)
7029acd8a950393 Jens Axboe 2024-10-25  1042  			goto out_put_free;
7029acd8a950393 Jens Axboe 2024-10-25  1043  
7029acd8a950393 Jens Axboe 2024-10-25  1044  		if (imu == &dummy_ubuf) {
7029acd8a950393 Jens Axboe 2024-10-25  1045  			dst_node->buf = (struct io_mapped_ubuf *) &dummy_ubuf;
7029acd8a950393 Jens Axboe 2024-10-25  1046  		} else {
7029acd8a950393 Jens Axboe 2024-10-25  1047  			refcount_inc(&imu->refs);
7029acd8a950393 Jens Axboe 2024-10-25  1048  			dst_node->buf = imu;
7029acd8a950393 Jens Axboe 2024-10-25  1049  		}
7029acd8a950393 Jens Axboe 2024-10-25  1050  		user_bufs[i] = dst_node;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1051  	}
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1052  
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1053  	/* Have a ref on the bufs now, drop src lock and re-grab our own lock */
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1054  	mutex_unlock(&src_ctx->uring_lock);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11 @1055  	mutex_lock(&ctx->uring_lock);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1056  	if (!ctx->user_bufs) {
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1057  		ctx->user_bufs = user_bufs;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1058  		ctx->buf_data = data;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1059  		ctx->nr_user_bufs = nbufs;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11 @1060  		return 0;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1061  	}
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1062  
7029acd8a950393 Jens Axboe 2024-10-25  1063  	mutex_unlock(&ctx->uring_lock);
7029acd8a950393 Jens Axboe 2024-10-25  1064  	mutex_lock(&src_ctx->uring_lock);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1065  	/* someone raced setting up buffers, dump ours */
7029acd8a950393 Jens Axboe 2024-10-25  1066  	ret = -EBUSY;
7029acd8a950393 Jens Axboe 2024-10-25  1067  	i = nbufs;
7029acd8a950393 Jens Axboe 2024-10-25  1068  out_put_free:
7029acd8a950393 Jens Axboe 2024-10-25  1069  	while (i--) {
7029acd8a950393 Jens Axboe 2024-10-25  1070  		io_buffer_unmap(src_ctx, user_bufs[i]);
7029acd8a950393 Jens Axboe 2024-10-25  1071  		kfree(user_bufs[i]);
7029acd8a950393 Jens Axboe 2024-10-25  1072  	}
7029acd8a950393 Jens Axboe 2024-10-25  1073  	kvfree(user_bufs);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1074  out_free_data:
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1075  	io_rsrc_data_free(data);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1076  out_unlock:
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1077  	mutex_unlock(&src_ctx->uring_lock);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1078  	mutex_lock(&ctx->uring_lock);
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1079  	return ret;
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1080  }
7cc2a6eadcd7a5a Jens Axboe 2024-09-11  1081  

:::::: The code at line 1060 was first introduced by commit
:::::: 7cc2a6eadcd7a5aa36ac63e6659f5c6138c7f4d2 io_uring: add IORING_REGISTER_COPY_BUFFERS method

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
