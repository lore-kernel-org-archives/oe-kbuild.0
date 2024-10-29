Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762EF20B201
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 23:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245434; cv=none; b=inp/3ekSb8idrOekDUiYVLteg4gOcaNCO2P5jKG7kmsCFbHlDUX9PBkV5z+IxCFdJe1xbVhQ6P4zdU5pwiBIFH6Y1TVz34FZhNUWdCdnYIUn6bsZhzxe5Qh3jFiEF4wjMy0dCWjIfW6UyCGAtc55YwmqtLKLz2rIDUJaaPs/hQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245434; c=relaxed/simple;
	bh=mckT86TCQ8jzwLJzhG3x1ZSYw5bHMaF/qKxv2jcxg7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mEIOtx2unRT5nIKPU1FXVFC1z1OWLQ35LLstIogTYSsun6XktdpkDDUz156mYuih6LRL1j86FLSH8pZCQBXD6QAGTFZTRXfBhK7tHWLAxE2Spw/LPbJtfOIqGi5/KhDE+gIfEIVUJzTXPNK19DCuxeFoOSsCI9b5ZObBgQM6rN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zkiky8Ai; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zkiky8Ai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730245432; x=1761781432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mckT86TCQ8jzwLJzhG3x1ZSYw5bHMaF/qKxv2jcxg7c=;
  b=Zkiky8AiBPGaJy/40BTqftvpJybbhlPVD7dE2t0Hhih6Fmbucm90wi0l
   WS+6Bc3UhIYxGHaIBJKwL1bWdrUNuUYMOfe2pFQDSDDC7hQSnNwRvguEH
   zEIgKXjtH44yepRESQLGNLZbwBp4i1q0P4F9XhrlierEhZCHN3aE7JN4C
   zLeq/tN2//rdvVvohQAIP+qmuBJChVNsKkMbxrTEzgR0kSpqshbWLSqXd
   8XvE2dgZALxE1hoDKE+Mk5B6GqCSFDEDLKGX8fzOgVz/SeK8XwqWR5VtI
   KWDzXqJcCU5zPYp4EjTPuR5xJdy4i+wDRIDn6iYoeyc4LmB1UcvhD0QF0
   w==;
X-CSE-ConnectionGUID: 9WAaQrq7SeOZJ47cds+l9A==
X-CSE-MsgGUID: nY3hR4uRSq6QPX/fnZN7mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33847063"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="33847063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 16:43:52 -0700
X-CSE-ConnectionGUID: 59zrjrFnQFiTgE8GFCjnrA==
X-CSE-MsgGUID: ep3tirZIQBGhww28CQuJDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="112960023"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Oct 2024 16:36:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5vlJ-000eGw-11;
	Tue, 29 Oct 2024 23:36:33 +0000
Date: Wed, 30 Oct 2024 07:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [axboe-block:io_uring-sendzc-provided 8/20]
 io_uring/rsrc.c:1066:2-8: preceding lock on line 1061
Message-ID: <202410300741.HBi7H6nM-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-sendzc-provided
head:   419691af8909c1e22ab09a1ac2bb7322e1633d1f
commit: 519cfa2fe3f1d9ff213448d3beeecd6cb64daba1 [8/20] io_uring/rsrc: get rid of per-ring io_rsrc_node list
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm-randconfig-r061-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300741.HBi7H6nM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410300741.HBi7H6nM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/rsrc.c:1066:2-8: preceding lock on line 1061

vim +1066 io_uring/rsrc.c

7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1014  
636119af94f2fb Jens Axboe 2024-09-14  1015  static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx)
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1016  {
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1017  	struct io_rsrc_node **user_bufs;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1018  	struct io_rsrc_data *data;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1019  	int i, ret, nbufs;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1020  
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1021  	/*
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1022  	 * Drop our own lock here. We'll setup the data we need and reference
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1023  	 * the source buffers, then re-grab, check, and assign at the end.
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1024  	 */
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1025  	mutex_unlock(&ctx->uring_lock);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1026  
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1027  	mutex_lock(&src_ctx->uring_lock);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1028  	ret = -ENXIO;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1029  	nbufs = src_ctx->nr_user_bufs;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1030  	if (!nbufs)
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1031  		goto out_unlock;
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1032  	ret = io_rsrc_data_alloc(ctx, nbufs, &data);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1033  	if (ret)
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1034  		goto out_unlock;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1035  
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1036  	ret = -ENOMEM;
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1037  	user_bufs = kvmalloc_array(nbufs, sizeof(struct io_rsrc_node *),
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1038  					GFP_KERNEL | __GFP_ZERO);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1039  	if (!user_bufs)
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1040  		goto out_free_data;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1041  
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1042  	for (i = 0; i < nbufs; i++) {
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1043  		struct io_mapped_ubuf *imu = src_ctx->user_bufs[i]->buf;
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1044  		struct io_rsrc_node *dst_node;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1045  
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1046  		dst_node = io_rsrc_node_alloc(ctx, data, i, IORING_RSRC_BUFFER);
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1047  		if (!dst_node)
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1048  			goto out_put_free;
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1049  
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1050  		if (imu == &dummy_ubuf) {
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1051  			dst_node->buf = (struct io_mapped_ubuf *) &dummy_ubuf;
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1052  		} else {
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1053  			refcount_inc(&imu->refs);
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1054  			dst_node->buf = imu;
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1055  		}
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1056  		user_bufs[i] = dst_node;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1057  	}
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1058  
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1059  	/* Have a ref on the bufs now, drop src lock and re-grab our own lock */
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1060  	mutex_unlock(&src_ctx->uring_lock);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11 @1061  	mutex_lock(&ctx->uring_lock);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1062  	if (!ctx->user_bufs) {
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1063  		ctx->user_bufs = user_bufs;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1064  		ctx->buf_data = data;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1065  		ctx->nr_user_bufs = nbufs;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11 @1066  		return 0;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1067  	}
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1068  
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1069  	mutex_unlock(&ctx->uring_lock);
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1070  	mutex_lock(&src_ctx->uring_lock);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1071  	/* someone raced setting up buffers, dump ours */
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1072  	ret = -EBUSY;
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1073  	i = nbufs;
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1074  out_put_free:
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1075  	while (i--) {
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1076  		io_buffer_unmap(src_ctx, user_bufs[i]);
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1077  		kfree(user_bufs[i]);
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1078  	}
519cfa2fe3f1d9 Jens Axboe 2024-10-25  1079  	kvfree(user_bufs);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1080  out_free_data:
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1081  	io_rsrc_data_free(data);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1082  out_unlock:
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1083  	mutex_unlock(&src_ctx->uring_lock);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1084  	mutex_lock(&ctx->uring_lock);
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1085  	return ret;
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1086  }
7cc2a6eadcd7a5 Jens Axboe 2024-09-11  1087  

:::::: The code at line 1066 was first introduced by commit
:::::: 7cc2a6eadcd7a5aa36ac63e6659f5c6138c7f4d2 io_uring: add IORING_REGISTER_COPY_BUFFERS method

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
