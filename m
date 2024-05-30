Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E95155381
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717061843; cv=none; b=CPEXO377l814ElWUpaqZ7bL1/Qd9MmRnmkBuiUX/sBwDyYiz4kzbqjbUYtkpVs8sKD0fNNqRHkV0l6hFFbrvJJ1lnu8yY8s4lw0kr3qvuQyuAzW5PcgwWz6tD59+gz8DonUKPya4QbXlagZ8T95t7mlrgJfnQOBzs1712TKWn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717061843; c=relaxed/simple;
	bh=mRhxpiR2bivQTLoUY6pWJrxO5tZMpOkkANsP+WTDXD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L9ntlmSRQVOfj8iUQ9jT4uIeaqpyYBhmVZFGQcYM2rvYPexD97q8zWylgwgzq/+b9rE7XVNcNHiURhqkF39ywj7k0dhsB+WldyI3LSo5sRlH0uhbZt0j+5xzySGBzJvdLFPG5GGHJ/1W/2DTgpQGKLHCJtBm/Auhh5sSX/XNzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6UkNd8v; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6UkNd8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717061842; x=1748597842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRhxpiR2bivQTLoUY6pWJrxO5tZMpOkkANsP+WTDXD4=;
  b=k6UkNd8vtRtLXRs/aZlldRzQHvd2QTCSAmLZAjdpexolHCCQ1bssol/r
   bxEtTcuMcCMgS1L1L8miPtLU0EGrf47j+L7bhC4+TcBm6utZT+6PNPp9E
   G5i+cE2ug0BXNIp5gVMaZ3K4crL78RhqiyvqnSQ/cC/IH4oCzHhQcxIKA
   FLYwwxUVZsAjiYI/ZXTcxIjH20J5VjUMfdgic/b11LqxTHpUsPFiKQ82M
   41z8P1GEN7CRPe2V3VWSzD1oz+JdJGR67TtvSyY+c0Soc1hV6xpwdl1qD
   YMQtU/SDUFsKIGyZeQN+A5cNSWioNbr9LAPBD6DdufH13Supp3CqhqpdG
   A==;
X-CSE-ConnectionGUID: nzO868CBSyemlGC5BvAVCg==
X-CSE-MsgGUID: yCjCbvfsRX2V2U7m8cYe7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17324240"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="17324240"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 02:37:21 -0700
X-CSE-ConnectionGUID: gaTJvejWTVmPYLdkMEys5w==
X-CSE-MsgGUID: ZcKod2wRSaOr7EMZXUy4cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="66627919"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 May 2024 02:37:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCcDl-000F5Q-21;
	Thu, 30 May 2024 09:37:17 +0000
Date: Thu, 30 May 2024 17:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:io_uring-msg_ring 7/8] io_uring/msg_ring.c:265
 io_msg_install_remote() warn: inconsistent returns
 '&target_ctx->completion_lock'.
Message-ID: <202405301746.Xf9GcmO6-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-msg_ring
head:   65da3761e984c6f5966670989265e80ee7badcfe
commit: a4d8cfb27bf653b0dc4050b02f80d8a690039493 [7/8] io_uring/msg_ring: add an alloc cache for CQE entries
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301746.Xf9GcmO6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405301746.Xf9GcmO6-lkp@intel.com/

New smatch warnings:
io_uring/msg_ring.c:265 io_msg_install_remote() warn: inconsistent returns '&target_ctx->completion_lock'.

Old smatch warnings:
io_uring/msg_ring.c:265 io_msg_install_remote() warn: inconsistent returns '&target_ctx->uring_lock'.

vim +265 io_uring/msg_ring.c

e6130eba8a848a7 Jens Axboe     2022-06-13  231  
c448c1b597e790b Jens Axboe     2024-05-24  232  static int io_msg_install_remote(struct io_kiocb *req, unsigned int issue_flags,
c448c1b597e790b Jens Axboe     2024-05-24  233  				 struct io_ring_ctx *target_ctx)
6d043ee1164ca33 Pavel Begunkov 2022-12-07  234  {
c448c1b597e790b Jens Axboe     2024-05-24  235  	struct io_msg *msg = io_kiocb_to_cmd(req, struct io_msg);
c448c1b597e790b Jens Axboe     2024-05-24  236  	bool skip_cqe = msg->flags & IORING_MSG_RING_CQE_SKIP;
c448c1b597e790b Jens Axboe     2024-05-24  237  	struct io_overflow_cqe *ocqe = NULL;
c448c1b597e790b Jens Axboe     2024-05-24  238  	int ret;
6d043ee1164ca33 Pavel Begunkov 2022-12-07  239  
a4d8cfb27bf653b Jens Axboe     2024-05-25  240  	if (unlikely(io_double_lock_ctx(target_ctx, issue_flags)))
a4d8cfb27bf653b Jens Axboe     2024-05-25  241  		return -EAGAIN;
a4d8cfb27bf653b Jens Axboe     2024-05-25  242  
c448c1b597e790b Jens Axboe     2024-05-24  243  	if (!skip_cqe) {
a4d8cfb27bf653b Jens Axboe     2024-05-25  244  		spin_lock(&target_ctx->completion_lock);
c448c1b597e790b Jens Axboe     2024-05-24  245  		ocqe = io_alloc_overflow(target_ctx);
c448c1b597e790b Jens Axboe     2024-05-24  246  		if (!ocqe)
c448c1b597e790b Jens Axboe     2024-05-24  247  			return -ENOMEM;
c448c1b597e790b Jens Axboe     2024-05-24  248  	}
c448c1b597e790b Jens Axboe     2024-05-24  249  
c448c1b597e790b Jens Axboe     2024-05-24  250  	ret = __io_fixed_fd_install(target_ctx, msg->src_file, msg->dst_fd);
c448c1b597e790b Jens Axboe     2024-05-24  251  	mutex_unlock(&target_ctx->uring_lock);
c448c1b597e790b Jens Axboe     2024-05-24  252  
c448c1b597e790b Jens Axboe     2024-05-24  253  	if (ret >= 0) {
c448c1b597e790b Jens Axboe     2024-05-24  254  		msg->src_file = NULL;
c448c1b597e790b Jens Axboe     2024-05-24  255  		req->flags &= ~REQ_F_NEED_CLEANUP;
c448c1b597e790b Jens Axboe     2024-05-24  256  		if (!skip_cqe) {
c448c1b597e790b Jens Axboe     2024-05-24  257  			io_msg_add_overflow(msg, target_ctx, ocqe, ret, 0);
c448c1b597e790b Jens Axboe     2024-05-24  258  			return 0;
c448c1b597e790b Jens Axboe     2024-05-24  259  		}
c448c1b597e790b Jens Axboe     2024-05-24  260  	}
a4d8cfb27bf653b Jens Axboe     2024-05-25  261  	if (ocqe) {
a4d8cfb27bf653b Jens Axboe     2024-05-25  262  		spin_unlock(&target_ctx->completion_lock);
c448c1b597e790b Jens Axboe     2024-05-24  263  		kfree(ocqe);
a4d8cfb27bf653b Jens Axboe     2024-05-25  264  	}
c448c1b597e790b Jens Axboe     2024-05-24 @265  	return ret;
6d043ee1164ca33 Pavel Begunkov 2022-12-07  266  }
6d043ee1164ca33 Pavel Begunkov 2022-12-07  267  

:::::: The code at line 265 was first introduced by commit
:::::: c448c1b597e790ba740d79c35be820031f01adb9 io_uring/msg_ring: avoid double indirection task_work for fd passing

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
