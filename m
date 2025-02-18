Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB0286294
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Feb 2025 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739913698; cv=none; b=u+m5gh14087SUChhZph4Gvnia0vjKQSYIMkWgU3lTDXm0LTBdGl34VZjVP75RXncC7c+8nFiJJgOeKTxsw4OAMkdsE2trwbI0Aa22uhrQGNuWtIQp8ycWRIOQ7F7xLCNyHXf5WdPnFbu6Hf3ctsyOtYctdYCilPuKxFwizNq/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739913698; c=relaxed/simple;
	bh=eTjFxnjmas3je1AhVuTbOZ6cZg0QgdCbCeOSx5nt11w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4wBQEJN4JQ0v/gBniS2MVZFH3YWAEQ4ftTy7f8mbEKYnbTJkHa4Z2NH6e0XLWYLDbSVoYDIHWr2cym70JD9N+HYgWy0gI+rORSBT7wZHes9vKcPH61L/FKW9clMQEAT1Qtz/urmNlMW7AK2BrNfc5DdT7guGHvq+9V6XxRqXxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IM/AOME1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IM/AOME1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739913696; x=1771449696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTjFxnjmas3je1AhVuTbOZ6cZg0QgdCbCeOSx5nt11w=;
  b=IM/AOME1YzGNRtpdFOhU2URsnwhQ5HxRL/xB9Vap2Cd4b/jon3O9pRlv
   3FNuzgCSGq9+Be4zfcDlr9lOpa9Gc+f4wDBxDIbrjNfqslfvMrzWAfkML
   rmmsce6chhPcPK/ol23hxRxbLcaNKqRM6osnuZPwcXMvSHq1X/QdKFfJ+
   5K4pxlqJFUnBX4HjF8U8dI3qAlGgmz09CJMUY33CfR1iNy4KopZRQ0FvG
   GpKTr16f22fnNuVV7M3s7urkFYrKMBm8tpWfdKJUrMKi8Z78emoaqSJ3E
   dUhPi50PyAErkScXeHKHAddJ2lYqIDoUz/z/l6DBL2ilubcfsgdfKMxYz
   A==;
X-CSE-ConnectionGUID: aVrluch0RH+GgqAA91d2kQ==
X-CSE-MsgGUID: ulIEq+umRjOuXkCYwZtQjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51615908"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="51615908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 13:21:35 -0800
X-CSE-ConnectionGUID: tINWCgvgSJml3c6jnnuh4g==
X-CSE-MsgGUID: wWXgm5NCTQ6rv/ZD25jHoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="119498249"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2025 13:21:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkV1z-0000tP-0n;
	Tue, 18 Feb 2025 21:21:28 +0000
Date: Wed, 19 Feb 2025 05:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3999/4377] io_uring/zcrx.c:223
 io_register_zcrx_ifq() warn: missing unwind goto?
Message-ID: <202502190532.W7NnmyiP-lkp@intel.com>
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
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: David Wei <dw@davidwei.uk>

Hi Pavel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
commit: 035af94b39fd13751abf5f0a2948c9eddede55d0 [3999/4377] io_uring/zcrx: grab a net device
:::::: branch date: 16 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-141-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190532.W7NnmyiP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502190532.W7NnmyiP-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:223 io_register_zcrx_ifq() warn: missing unwind goto?

vim +223 io_uring/zcrx.c

6f377873cb2390 David Wei      2025-02-14  159  
6f377873cb2390 David Wei      2025-02-14  160  int io_register_zcrx_ifq(struct io_ring_ctx *ctx,
6f377873cb2390 David Wei      2025-02-14  161  			  struct io_uring_zcrx_ifq_reg __user *arg)
6f377873cb2390 David Wei      2025-02-14  162  {
cf96310c5f9a0d David Wei      2025-02-14  163  	struct io_uring_zcrx_area_reg area;
6f377873cb2390 David Wei      2025-02-14  164  	struct io_uring_zcrx_ifq_reg reg;
6f377873cb2390 David Wei      2025-02-14  165  	struct io_uring_region_desc rd;
6f377873cb2390 David Wei      2025-02-14  166  	struct io_zcrx_ifq *ifq;
6f377873cb2390 David Wei      2025-02-14  167  	int ret;
6f377873cb2390 David Wei      2025-02-14  168  
6f377873cb2390 David Wei      2025-02-14  169  	/*
6f377873cb2390 David Wei      2025-02-14  170  	 * 1. Interface queue allocation.
6f377873cb2390 David Wei      2025-02-14  171  	 * 2. It can observe data destined for sockets of other tasks.
6f377873cb2390 David Wei      2025-02-14  172  	 */
6f377873cb2390 David Wei      2025-02-14  173  	if (!capable(CAP_NET_ADMIN))
6f377873cb2390 David Wei      2025-02-14  174  		return -EPERM;
6f377873cb2390 David Wei      2025-02-14  175  
6f377873cb2390 David Wei      2025-02-14  176  	/* mandatory io_uring features for zc rx */
6f377873cb2390 David Wei      2025-02-14  177  	if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN &&
6f377873cb2390 David Wei      2025-02-14  178  	      ctx->flags & IORING_SETUP_CQE32))
6f377873cb2390 David Wei      2025-02-14  179  		return -EINVAL;
6f377873cb2390 David Wei      2025-02-14  180  	if (ctx->ifq)
6f377873cb2390 David Wei      2025-02-14  181  		return -EBUSY;
6f377873cb2390 David Wei      2025-02-14  182  	if (copy_from_user(&reg, arg, sizeof(reg)))
6f377873cb2390 David Wei      2025-02-14  183  		return -EFAULT;
6f377873cb2390 David Wei      2025-02-14  184  	if (copy_from_user(&rd, u64_to_user_ptr(reg.region_ptr), sizeof(rd)))
6f377873cb2390 David Wei      2025-02-14  185  		return -EFAULT;
6f377873cb2390 David Wei      2025-02-14  186  	if (memchr_inv(&reg.__resv, 0, sizeof(reg.__resv)))
6f377873cb2390 David Wei      2025-02-14  187  		return -EINVAL;
6f377873cb2390 David Wei      2025-02-14  188  	if (reg.if_rxq == -1 || !reg.rq_entries || reg.flags)
6f377873cb2390 David Wei      2025-02-14  189  		return -EINVAL;
6f377873cb2390 David Wei      2025-02-14  190  	if (reg.rq_entries > IO_RQ_MAX_ENTRIES) {
6f377873cb2390 David Wei      2025-02-14  191  		if (!(ctx->flags & IORING_SETUP_CLAMP))
6f377873cb2390 David Wei      2025-02-14  192  			return -EINVAL;
6f377873cb2390 David Wei      2025-02-14  193  		reg.rq_entries = IO_RQ_MAX_ENTRIES;
6f377873cb2390 David Wei      2025-02-14  194  	}
6f377873cb2390 David Wei      2025-02-14  195  	reg.rq_entries = roundup_pow_of_two(reg.rq_entries);
6f377873cb2390 David Wei      2025-02-14  196  
cf96310c5f9a0d David Wei      2025-02-14  197  	if (copy_from_user(&area, u64_to_user_ptr(reg.area_ptr), sizeof(area)))
6f377873cb2390 David Wei      2025-02-14  198  		return -EFAULT;
6f377873cb2390 David Wei      2025-02-14  199  
6f377873cb2390 David Wei      2025-02-14  200  	ifq = io_zcrx_ifq_alloc(ctx);
6f377873cb2390 David Wei      2025-02-14  201  	if (!ifq)
6f377873cb2390 David Wei      2025-02-14  202  		return -ENOMEM;
6f377873cb2390 David Wei      2025-02-14  203  
6f377873cb2390 David Wei      2025-02-14  204  	ret = io_allocate_rbuf_ring(ifq, &reg, &rd);
6f377873cb2390 David Wei      2025-02-14  205  	if (ret)
6f377873cb2390 David Wei      2025-02-14  206  		goto err;
6f377873cb2390 David Wei      2025-02-14  207  
cf96310c5f9a0d David Wei      2025-02-14  208  	ret = io_zcrx_create_area(ifq, &ifq->area, &area);
cf96310c5f9a0d David Wei      2025-02-14  209  	if (ret)
cf96310c5f9a0d David Wei      2025-02-14  210  		goto err;
cf96310c5f9a0d David Wei      2025-02-14  211  
6f377873cb2390 David Wei      2025-02-14  212  	ifq->rq_entries = reg.rq_entries;
6f377873cb2390 David Wei      2025-02-14  213  	ifq->if_rxq = reg.if_rxq;
6f377873cb2390 David Wei      2025-02-14  214  
035af94b39fd13 Pavel Begunkov 2025-02-14  215  	ret = -ENODEV;
035af94b39fd13 Pavel Begunkov 2025-02-14  216  	ifq->netdev = netdev_get_by_index(current->nsproxy->net_ns, reg.if_idx,
035af94b39fd13 Pavel Begunkov 2025-02-14  217  					  &ifq->netdev_tracker, GFP_KERNEL);
035af94b39fd13 Pavel Begunkov 2025-02-14  218  	if (!ifq->netdev)
035af94b39fd13 Pavel Begunkov 2025-02-14  219  		goto err;
035af94b39fd13 Pavel Begunkov 2025-02-14  220  
035af94b39fd13 Pavel Begunkov 2025-02-14  221  	ifq->dev = ifq->netdev->dev.parent;
035af94b39fd13 Pavel Begunkov 2025-02-14  222  	if (!ifq->dev)
035af94b39fd13 Pavel Begunkov 2025-02-14 @223  		return -EOPNOTSUPP;
035af94b39fd13 Pavel Begunkov 2025-02-14  224  	get_device(ifq->dev);
035af94b39fd13 Pavel Begunkov 2025-02-14  225  
6f377873cb2390 David Wei      2025-02-14  226  	reg.offsets.rqes = sizeof(struct io_uring);
6f377873cb2390 David Wei      2025-02-14  227  	reg.offsets.head = offsetof(struct io_uring, head);
6f377873cb2390 David Wei      2025-02-14  228  	reg.offsets.tail = offsetof(struct io_uring, tail);
6f377873cb2390 David Wei      2025-02-14  229  
6f377873cb2390 David Wei      2025-02-14  230  	if (copy_to_user(arg, &reg, sizeof(reg)) ||
6f377873cb2390 David Wei      2025-02-14  231  	    copy_to_user(u64_to_user_ptr(reg.region_ptr), &rd, sizeof(rd))) {
6f377873cb2390 David Wei      2025-02-14  232  		ret = -EFAULT;
6f377873cb2390 David Wei      2025-02-14  233  		goto err;
6f377873cb2390 David Wei      2025-02-14  234  	}
cf96310c5f9a0d David Wei      2025-02-14  235  	if (copy_to_user(u64_to_user_ptr(reg.area_ptr), &area, sizeof(area))) {
cf96310c5f9a0d David Wei      2025-02-14  236  		ret = -EFAULT;
cf96310c5f9a0d David Wei      2025-02-14  237  		goto err;
cf96310c5f9a0d David Wei      2025-02-14  238  	}
6f377873cb2390 David Wei      2025-02-14  239  	ctx->ifq = ifq;
6f377873cb2390 David Wei      2025-02-14  240  	return 0;
6f377873cb2390 David Wei      2025-02-14  241  err:
6f377873cb2390 David Wei      2025-02-14  242  	io_zcrx_ifq_free(ifq);
6f377873cb2390 David Wei      2025-02-14  243  	return ret;
6f377873cb2390 David Wei      2025-02-14  244  }
6f377873cb2390 David Wei      2025-02-14  245  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
