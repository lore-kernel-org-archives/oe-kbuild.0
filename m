Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E843615CB
	for <oe-kbuild@lists.linux.dev>; Sun, 26 May 2024 06:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716704543; cv=none; b=e7OZgFA6NxPxuD3GLfJIYRIlO5oScRahQU0PkVKzR1grsY4gagreq1AzsrJ2mb0itXgJvFmSobKU65j5aDvdtes9agE4VwoHU2C1oajL1VHG8TGbjVrNa7Uc7d9SY6P2bB/nJ/Hsf4vQ3c12HrBTdn8UN6b61WVuX0NXA45Zia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716704543; c=relaxed/simple;
	bh=o5x9PxtD5jL8sFatHqvk7gGH1m5twu/iQPf+qp9Cvr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JrDgoLZqsYt4KM6NY9mmjz3cnCZ2Jbvkn42i/iQfa9POsPYeAKaK40nfPEdHNp6pfKd7vy7MxOElGFFMKUc2W1u9/srIRk0N7kUVtAqia/VDFXvTRH7dhenoHq8EqkcYVogbfpeTve/oV7R+Pldv9/eWTJXkdZSlm3A9a20BrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwnrLYTp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwnrLYTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716704541; x=1748240541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5x9PxtD5jL8sFatHqvk7gGH1m5twu/iQPf+qp9Cvr4=;
  b=OwnrLYTpmeAino0ZmnvBOF8Kk5Z9aouZl/ZIhBT63kxIeISTlj3EHMml
   L9doIwGXgwSSSaJkUDQ5UWitmgOUpJiG2G8/b6NuInh5J52985wLo5fyH
   BGpzLHVBr8E0TnmNNEcPQfHK8thd/hQccN27DRcbiamU2XtQAJGTEYiVF
   CN1T/3uFUlHFKS/Us0laxiI6fADG8lqioP3oYLmPHTfXou1S2rcN4BGyH
   t4cjEm9XmEQW2ugKzfQSJlN4L/3iWuy4ltdAAz99WXrjbcmaycYbBkm4C
   K+nOeuk/09nc6PkUM8uwtLIIvnjP+Y2KWFwvizaNYxp+oLOCXFyJwKYKA
   g==;
X-CSE-ConnectionGUID: ZsP323QmR66kjadaUq4zQA==
X-CSE-MsgGUID: 72op1/AHSOCksUXDH5ua9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="35554273"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="35554273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 23:22:21 -0700
X-CSE-ConnectionGUID: sr7W7+tlRAOCFtz87y9zpg==
X-CSE-MsgGUID: trsjJONOSay6HKP+GsJyog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="39288836"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 May 2024 23:22:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB7Gq-0007nn-26;
	Sun, 26 May 2024 06:22:16 +0000
Date: Sun, 26 May 2024 14:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:io_uring-msg_ring 5/6] io_uring/msg_ring.c:133
 io_msg_fill_remote() error: uninitialized symbol 'ocqe'.
Message-ID: <202405261421.LEU6xUnr-lkp@intel.com>
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
head:   558d3cfd371df365ab388a0cc86b410a6e2d305c
commit: fb2eeb0dbfa4112219f87a805ddaa15967dc57c6 [5/6] io_uring/msg_ring: add an alloc cache for CQE entries
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20240526 (https://download.01.org/0day-ci/archive/20240526/202405261421.LEU6xUnr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405261421.LEU6xUnr-lkp@intel.com/

New smatch warnings:
io_uring/msg_ring.c:133 io_msg_fill_remote() error: uninitialized symbol 'ocqe'.
io_uring/msg_ring.c:142 io_msg_fill_remote() warn: inconsistent returns '&target_ctx->uring_lock'.
io_uring/msg_ring.c:265 io_msg_install_remote() warn: inconsistent returns '&target_ctx->uring_lock'.

Old smatch warnings:
io_uring/msg_ring.c:245 io_msg_install_remote() error: uninitialized symbol 'ocqe'.
io_uring/msg_ring.c:264 io_msg_install_remote() error: uninitialized symbol 'ocqe'.

vim +/ocqe +133 io_uring/msg_ring.c

6d043ee1164ca3 Pavel Begunkov    2022-12-07  126  
1d04718b61b885 Jens Axboe        2024-05-24  127  static int io_msg_fill_remote(struct io_msg *msg, unsigned int issue_flags,
1d04718b61b885 Jens Axboe        2024-05-24  128  			      struct io_ring_ctx *target_ctx, u32 flags)
1d04718b61b885 Jens Axboe        2024-05-24  129  {
1d04718b61b885 Jens Axboe        2024-05-24  130  	struct io_overflow_cqe *ocqe;
1d04718b61b885 Jens Axboe        2024-05-24  131  
1d04718b61b885 Jens Axboe        2024-05-24  132  	if (unlikely(io_double_lock_ctx(target_ctx, issue_flags))) {
1d04718b61b885 Jens Axboe        2024-05-24 @133  		kfree(ocqe);
1d04718b61b885 Jens Axboe        2024-05-24  134  		return -EAGAIN;
1d04718b61b885 Jens Axboe        2024-05-24  135  	}
1d04718b61b885 Jens Axboe        2024-05-24  136  
fb2eeb0dbfa411 Jens Axboe        2024-05-25  137  	ocqe = io_alloc_overflow(target_ctx);
fb2eeb0dbfa411 Jens Axboe        2024-05-25  138  	if (!ocqe)
fb2eeb0dbfa411 Jens Axboe        2024-05-25  139  		return -ENOMEM;
fb2eeb0dbfa411 Jens Axboe        2024-05-25  140  
1d04718b61b885 Jens Axboe        2024-05-24  141  	io_msg_add_overflow(msg, target_ctx, ocqe, msg->len, flags);
1d04718b61b885 Jens Axboe        2024-05-24 @142  	return 0;
6d043ee1164ca3 Pavel Begunkov    2022-12-07  143  }
6d043ee1164ca3 Pavel Begunkov    2022-12-07  144  
e12d7a46f65ae4 Jens Axboe        2023-01-19  145  static int io_msg_ring_data(struct io_kiocb *req, unsigned int issue_flags)
e6130eba8a848a Jens Axboe        2022-06-13  146  {
e6130eba8a848a Jens Axboe        2022-06-13  147  	struct io_ring_ctx *target_ctx = req->file->private_data;
f2ccb5aed7bce1 Stefan Metzmacher 2022-08-11  148  	struct io_msg *msg = io_kiocb_to_cmd(req, struct io_msg);
cbeb47a7b5f003 Breno Leitao      2023-01-03  149  	u32 flags = 0;
e12d7a46f65ae4 Jens Axboe        2023-01-19  150  	int ret;
e6130eba8a848a Jens Axboe        2022-06-13  151  
cbeb47a7b5f003 Breno Leitao      2023-01-03  152  	if (msg->src_fd || msg->flags & ~IORING_MSG_RING_FLAGS_PASS)
cbeb47a7b5f003 Breno Leitao      2023-01-03  153  		return -EINVAL;
cbeb47a7b5f003 Breno Leitao      2023-01-03  154  	if (!(msg->flags & IORING_MSG_RING_FLAGS_PASS) && msg->dst_fd)
e6130eba8a848a Jens Axboe        2022-06-13  155  		return -EINVAL;
8579538c89e33c Pavel Begunkov    2023-01-20  156  	if (target_ctx->flags & IORING_SETUP_R_DISABLED)
8579538c89e33c Pavel Begunkov    2023-01-20  157  		return -EBADFD;
e6130eba8a848a Jens Axboe        2022-06-13  158  
cbeb47a7b5f003 Breno Leitao      2023-01-03  159  	if (msg->flags & IORING_MSG_RING_FLAGS_PASS)
cbeb47a7b5f003 Breno Leitao      2023-01-03  160  		flags = msg->cqe_flags;
cbeb47a7b5f003 Breno Leitao      2023-01-03  161  
1d04718b61b885 Jens Axboe        2024-05-24  162  	if (io_msg_need_remote(target_ctx))
1d04718b61b885 Jens Axboe        2024-05-24  163  		return io_msg_fill_remote(msg, issue_flags, target_ctx, flags);
1d04718b61b885 Jens Axboe        2024-05-24  164  
e12d7a46f65ae4 Jens Axboe        2023-01-19  165  	ret = -EOVERFLOW;
e12d7a46f65ae4 Jens Axboe        2023-01-19  166  	if (target_ctx->flags & IORING_SETUP_IOPOLL) {
e12d7a46f65ae4 Jens Axboe        2023-01-19  167  		if (unlikely(io_double_lock_ctx(target_ctx, issue_flags)))
e12d7a46f65ae4 Jens Axboe        2023-01-19  168  			return -EAGAIN;
59b28a6e37e650 Jens Axboe        2024-03-28  169  	}
cbeb47a7b5f003 Breno Leitao      2023-01-03  170  	if (io_post_aux_cqe(target_ctx, msg->user_data, msg->len, flags))
e12d7a46f65ae4 Jens Axboe        2023-01-19  171  		ret = 0;
59b28a6e37e650 Jens Axboe        2024-03-28  172  	if (target_ctx->flags & IORING_SETUP_IOPOLL)
e12d7a46f65ae4 Jens Axboe        2023-01-19  173  		io_double_unlock_ctx(target_ctx);
e12d7a46f65ae4 Jens Axboe        2023-01-19  174  	return ret;
e6130eba8a848a Jens Axboe        2022-06-13  175  }
e6130eba8a848a Jens Axboe        2022-06-13  176  
11373026f29603 Pavel Begunkov    2022-12-07  177  static struct file *io_msg_grab_file(struct io_kiocb *req, unsigned int issue_flags)
11373026f29603 Pavel Begunkov    2022-12-07  178  {
11373026f29603 Pavel Begunkov    2022-12-07  179  	struct io_msg *msg = io_kiocb_to_cmd(req, struct io_msg);
11373026f29603 Pavel Begunkov    2022-12-07  180  	struct io_ring_ctx *ctx = req->ctx;
11373026f29603 Pavel Begunkov    2022-12-07  181  	struct file *file = NULL;
11373026f29603 Pavel Begunkov    2022-12-07  182  	int idx = msg->src_fd;
11373026f29603 Pavel Begunkov    2022-12-07  183  
11373026f29603 Pavel Begunkov    2022-12-07  184  	io_ring_submit_lock(ctx, issue_flags);
11373026f29603 Pavel Begunkov    2022-12-07  185  	if (likely(idx < ctx->nr_user_files)) {
11373026f29603 Pavel Begunkov    2022-12-07  186  		idx = array_index_nospec(idx, ctx->nr_user_files);
f432c8c8c12b84 Christoph Hellwig 2023-06-20  187  		file = io_file_from_index(&ctx->file_table, idx);
11373026f29603 Pavel Begunkov    2022-12-07  188  		if (file)
11373026f29603 Pavel Begunkov    2022-12-07  189  			get_file(file);
11373026f29603 Pavel Begunkov    2022-12-07  190  	}
11373026f29603 Pavel Begunkov    2022-12-07  191  	io_ring_submit_unlock(ctx, issue_flags);
11373026f29603 Pavel Begunkov    2022-12-07  192  	return file;
e6130eba8a848a Jens Axboe        2022-06-13  193  }
e6130eba8a848a Jens Axboe        2022-06-13  194  
b1f60309eb4a03 Jens Axboe        2024-03-29  195  static int __io_msg_install_complete(struct io_kiocb *req)
e6130eba8a848a Jens Axboe        2022-06-13  196  {
e6130eba8a848a Jens Axboe        2022-06-13  197  	struct io_ring_ctx *target_ctx = req->file->private_data;
f2ccb5aed7bce1 Stefan Metzmacher 2022-08-11  198  	struct io_msg *msg = io_kiocb_to_cmd(req, struct io_msg);
11373026f29603 Pavel Begunkov    2022-12-07  199  	struct file *src_file = msg->src_file;
e6130eba8a848a Jens Axboe        2022-06-13  200  	int ret;
e6130eba8a848a Jens Axboe        2022-06-13  201  
e6130eba8a848a Jens Axboe        2022-06-13  202  	ret = __io_fixed_fd_install(target_ctx, src_file, msg->dst_fd);
11373026f29603 Pavel Begunkov    2022-12-07  203  	if (ret < 0)
b1f60309eb4a03 Jens Axboe        2024-03-29  204  		return ret;
172113101641cf Pavel Begunkov    2022-12-07  205  
11373026f29603 Pavel Begunkov    2022-12-07  206  	msg->src_file = NULL;
11373026f29603 Pavel Begunkov    2022-12-07  207  	req->flags &= ~REQ_F_NEED_CLEANUP;
e6130eba8a848a Jens Axboe        2022-06-13  208  
e6130eba8a848a Jens Axboe        2022-06-13  209  	if (msg->flags & IORING_MSG_RING_CQE_SKIP)
b1f60309eb4a03 Jens Axboe        2024-03-29  210  		return ret;
b1f60309eb4a03 Jens Axboe        2024-03-29  211  
e6130eba8a848a Jens Axboe        2022-06-13  212  	/*
e6130eba8a848a Jens Axboe        2022-06-13  213  	 * If this fails, the target still received the file descriptor but
e6130eba8a848a Jens Axboe        2022-06-13  214  	 * wasn't notified of the fact. This means that if this request
e6130eba8a848a Jens Axboe        2022-06-13  215  	 * completes with -EOVERFLOW, then the sender must ensure that a
e6130eba8a848a Jens Axboe        2022-06-13  216  	 * later IORING_OP_MSG_RING delivers the message.
e6130eba8a848a Jens Axboe        2022-06-13  217  	 */
5da28edd7bd551 Pavel Begunkov    2023-03-16  218  	if (!io_post_aux_cqe(target_ctx, msg->user_data, ret, 0))
b1f60309eb4a03 Jens Axboe        2024-03-29  219  		return -EOVERFLOW;
b1f60309eb4a03 Jens Axboe        2024-03-29  220  
b1f60309eb4a03 Jens Axboe        2024-03-29  221  	return ret;
b1f60309eb4a03 Jens Axboe        2024-03-29  222  }
b1f60309eb4a03 Jens Axboe        2024-03-29  223  
b1f60309eb4a03 Jens Axboe        2024-03-29  224  static int io_msg_install_complete(struct io_kiocb *req, unsigned int issue_flags)
b1f60309eb4a03 Jens Axboe        2024-03-29  225  {
b1f60309eb4a03 Jens Axboe        2024-03-29  226  	struct io_ring_ctx *target_ctx = req->file->private_data;
b1f60309eb4a03 Jens Axboe        2024-03-29  227  	int ret;
b1f60309eb4a03 Jens Axboe        2024-03-29  228  
b1f60309eb4a03 Jens Axboe        2024-03-29  229  	if (unlikely(io_double_lock_ctx(target_ctx, issue_flags)))
b1f60309eb4a03 Jens Axboe        2024-03-29  230  		return -EAGAIN;
b1f60309eb4a03 Jens Axboe        2024-03-29  231  
b1f60309eb4a03 Jens Axboe        2024-03-29  232  	ret = __io_msg_install_complete(req);
423d5081d0451f Jens Axboe        2023-01-19  233  	io_double_unlock_ctx(target_ctx);
e6130eba8a848a Jens Axboe        2022-06-13  234  	return ret;
e6130eba8a848a Jens Axboe        2022-06-13  235  }
e6130eba8a848a Jens Axboe        2022-06-13  236  
37501cb5c8a5bc Jens Axboe        2024-05-24  237  static int io_msg_install_remote(struct io_msg *msg, unsigned int issue_flags,
37501cb5c8a5bc Jens Axboe        2024-05-24  238  				 struct io_ring_ctx *target_ctx)
6d043ee1164ca3 Pavel Begunkov    2022-12-07  239  {
37501cb5c8a5bc Jens Axboe        2024-05-24  240  	bool skip_cqe = msg->flags & IORING_MSG_RING_CQE_SKIP;
37501cb5c8a5bc Jens Axboe        2024-05-24  241  	struct io_overflow_cqe *ocqe;
37501cb5c8a5bc Jens Axboe        2024-05-24  242  	int ret;
6d043ee1164ca3 Pavel Begunkov    2022-12-07  243  
fb2eeb0dbfa411 Jens Axboe        2024-05-25  244  	if (unlikely(io_double_lock_ctx(target_ctx, issue_flags))) {
fb2eeb0dbfa411 Jens Axboe        2024-05-25  245  		kfree(ocqe);
fb2eeb0dbfa411 Jens Axboe        2024-05-25  246  		return -EAGAIN;
fb2eeb0dbfa411 Jens Axboe        2024-05-25  247  	}
fb2eeb0dbfa411 Jens Axboe        2024-05-25  248  
37501cb5c8a5bc Jens Axboe        2024-05-24  249  	if (!skip_cqe) {
37501cb5c8a5bc Jens Axboe        2024-05-24  250  		ocqe = io_alloc_overflow(target_ctx);
37501cb5c8a5bc Jens Axboe        2024-05-24  251  		if (!ocqe)
37501cb5c8a5bc Jens Axboe        2024-05-24  252  			return -ENOMEM;
37501cb5c8a5bc Jens Axboe        2024-05-24  253  	}
37501cb5c8a5bc Jens Axboe        2024-05-24  254  
37501cb5c8a5bc Jens Axboe        2024-05-24  255  	ret = __io_fixed_fd_install(target_ctx, msg->src_file, msg->dst_fd);
37501cb5c8a5bc Jens Axboe        2024-05-24  256  	if (ret >= 0) {
37501cb5c8a5bc Jens Axboe        2024-05-24  257  		msg->src_file = NULL;
37501cb5c8a5bc Jens Axboe        2024-05-24  258  		if (!skip_cqe) {
37501cb5c8a5bc Jens Axboe        2024-05-24  259  			io_msg_add_overflow(msg, target_ctx, ocqe, ret, 0);
37501cb5c8a5bc Jens Axboe        2024-05-24  260  			return 0;
37501cb5c8a5bc Jens Axboe        2024-05-24  261  		}
37501cb5c8a5bc Jens Axboe        2024-05-24  262  	}
37501cb5c8a5bc Jens Axboe        2024-05-24  263  	mutex_unlock(&target_ctx->uring_lock);
37501cb5c8a5bc Jens Axboe        2024-05-24  264  	kfree(ocqe);
37501cb5c8a5bc Jens Axboe        2024-05-24 @265  	return ret;
6d043ee1164ca3 Pavel Begunkov    2022-12-07  266  }
6d043ee1164ca3 Pavel Begunkov    2022-12-07  267  

:::::: The code at line 133 was first introduced by commit
:::::: 1d04718b61b8853af466954574b682245b67e387 io_uring/msg_ring: avoid double indirection task_work for data messages

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
