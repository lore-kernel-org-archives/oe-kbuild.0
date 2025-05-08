Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3540C28373
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746746581; cv=none; b=A2emPxnlc9KkiXCDQ6GFdFeq7TSyjHDJ3JsXYJn4Nicx9fbakhoH8wkVtOSMAq2hV5diUYcSVXPnaX88PvGN5ASONKYUHsqQ16uzMcqA+3Ahyg9RDu7M1ehl/IJIOnQCKTjos5FAccXGvGxUypU2q00ob5vweOmErRmtFRzHSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746746581; c=relaxed/simple;
	bh=S8dxf/7T8S6WY/D6TtJgR5OBAAr1Yz09UMc9HNI4sRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UctBxfGjVK5kchjdTS8p4twsQNpEpp7N6FFLyhkOVrZjkfuAz1iPCEjtxKcIyrVMugAiufE5H/HjwOj8eYltAqXcn57kJIr1rHKXOBbifntD3zik5S587FubGl/PPxqdPz0ESDL/McG+r+OMeCAWtwIm2xq8hxoCCYXWzZiVfe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNZpAlKu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNZpAlKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746746579; x=1778282579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S8dxf/7T8S6WY/D6TtJgR5OBAAr1Yz09UMc9HNI4sRI=;
  b=FNZpAlKuA9o655XlXBBaj2UfaNpSaKXJ4ExUwspiri0I9S9EbeNStgBG
   olwuqsEi/QcN1fbQ6CqHSIH9cPoi0KtoqTQ1wHleoBtAKy43SV7MMBjHE
   XZEyRDIPDYQ/WNF36AvRGOwNwnYHBClaBJs5cObYO1qS9WbKFk7gKus6C
   QyzV2S0MHKwWthtW72r5EBXsAdk8M5RJfYUO09VILgo1/+kIUQVRtjELD
   vxZ93dlkI0GVPEyUuyhe1upXmPjaco8ZuRrHwJdOjy0Pb+RraflHMseQF
   h6l6+Z8alm5nG8T6fGBv/Nw/Rll0uX62XxKf+GlXu4d86rt2abVq+HoZB
   g==;
X-CSE-ConnectionGUID: m69RpCbLQE60mAxxw5ezXA==
X-CSE-MsgGUID: cL3jDZ+DR9q6VKSGCs4pnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36184674"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="36184674"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:22:59 -0700
X-CSE-ConnectionGUID: vlIg3iZXQgqRnZFcwVr47Q==
X-CSE-MsgGUID: dDU8uPIYTwmNMrB7I0LE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136400992"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2025 16:22:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDAZr-000BSl-0J;
	Thu, 08 May 2025 23:22:55 +0000
Date: Fri, 9 May 2025 07:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:io_uring-handle 5/5] io_uring/openclose.c:549
 __io_open_by_handle() error: uninitialized symbol 'fd'.
Message-ID: <202505090740.2eoaBqyg-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-handle
head:   2e7136592b64216af1c397e3ea26811a4ed103d5
commit: 2e7136592b64216af1c397e3ea26811a4ed103d5 [5/5] io_uring: add support for IORING_OP_OPEN_BY_HANDLE
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: nios2-randconfig-r073-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090740.2eoaBqyg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505090740.2eoaBqyg-lkp@intel.com/

New smatch warnings:
io_uring/openclose.c:549 __io_open_by_handle() error: uninitialized symbol 'fd'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/fd +549 io_uring/openclose.c

2e7136592b6421 Jens Axboe 2025-04-29  501  
2e7136592b6421 Jens Axboe 2025-04-29  502  static int __io_open_by_handle(struct io_kiocb *req, unsigned int issue_flags,
2e7136592b6421 Jens Axboe 2025-04-29  503  			       const struct export_operations *eops)
2e7136592b6421 Jens Axboe 2025-04-29  504  {
2e7136592b6421 Jens Axboe 2025-04-29  505  	struct io_open_handle *h = io_kiocb_to_cmd(req, struct io_open_handle);
2e7136592b6421 Jens Axboe 2025-04-29  506  	struct io_open_handle_async *ah = req->async_data;
2e7136592b6421 Jens Axboe 2025-04-29  507  	struct path path __free(path_put) = { };
2e7136592b6421 Jens Axboe 2025-04-29  508  	struct file *file;
2e7136592b6421 Jens Axboe 2025-04-29  509  	int ret, fd;
2e7136592b6421 Jens Axboe 2025-04-29  510  
2e7136592b6421 Jens Axboe 2025-04-29  511  	ret = do_handle_to_path(&ah->handle, &path, &h->ctx);
2e7136592b6421 Jens Axboe 2025-04-29  512  	path_put(&h->ctx.root);
2e7136592b6421 Jens Axboe 2025-04-29  513  	if (ret < 0)
2e7136592b6421 Jens Axboe 2025-04-29  514  		return ret;
2e7136592b6421 Jens Axboe 2025-04-29  515  
2e7136592b6421 Jens Axboe 2025-04-29  516  	if (!(h->flags & IORING_OPEN_HANDLE_FIXED)) {
2e7136592b6421 Jens Axboe 2025-04-29  517  		fd = get_unused_fd_flags(O_CLOEXEC);
2e7136592b6421 Jens Axboe 2025-04-29  518  		if (fd < 0)
2e7136592b6421 Jens Axboe 2025-04-29  519  			return fd;
2e7136592b6421 Jens Axboe 2025-04-29  520  	}
2e7136592b6421 Jens Axboe 2025-04-29  521  
2e7136592b6421 Jens Axboe 2025-04-29  522  	if (eops->open) {
2e7136592b6421 Jens Axboe 2025-04-29  523  		if (issue_flags & IO_URING_F_NONBLOCK) {
2e7136592b6421 Jens Axboe 2025-04-29  524  			file = ERR_PTR(-EAGAIN);
2e7136592b6421 Jens Axboe 2025-04-29  525  			goto err;
2e7136592b6421 Jens Axboe 2025-04-29  526  		}
2e7136592b6421 Jens Axboe 2025-04-29  527  		file = eops->open(&path, h->open_flags);
2e7136592b6421 Jens Axboe 2025-04-29  528  	} else {
2e7136592b6421 Jens Axboe 2025-04-29  529  		struct open_flags op;
2e7136592b6421 Jens Axboe 2025-04-29  530  		struct open_how how = build_open_how(h->open_flags, 0);
2e7136592b6421 Jens Axboe 2025-04-29  531  
2e7136592b6421 Jens Axboe 2025-04-29  532  		ret = build_open_flags(&how, &op);
2e7136592b6421 Jens Axboe 2025-04-29  533  		if (ret)
2e7136592b6421 Jens Axboe 2025-04-29  534  			return ret;
2e7136592b6421 Jens Axboe 2025-04-29  535  		if (issue_flags & IO_URING_F_NONBLOCK) {
2e7136592b6421 Jens Axboe 2025-04-29  536  			op.lookup_flags |= LOOKUP_CACHED;
2e7136592b6421 Jens Axboe 2025-04-29  537  			op.open_flag |= O_NONBLOCK;
2e7136592b6421 Jens Axboe 2025-04-29  538  		}
2e7136592b6421 Jens Axboe 2025-04-29  539  		file = do_file_open_root(&path, "", &op);
2e7136592b6421 Jens Axboe 2025-04-29  540  	}
2e7136592b6421 Jens Axboe 2025-04-29  541  	if (IS_ERR(file)) {
2e7136592b6421 Jens Axboe 2025-04-29  542  err:
2e7136592b6421 Jens Axboe 2025-04-29  543  		if (!(h->flags & IORING_OPEN_HANDLE_FIXED))
2e7136592b6421 Jens Axboe 2025-04-29  544  			put_unused_fd(fd);
2e7136592b6421 Jens Axboe 2025-04-29  545  		return PTR_ERR(file);
2e7136592b6421 Jens Axboe 2025-04-29  546  	}
2e7136592b6421 Jens Axboe 2025-04-29  547  
2e7136592b6421 Jens Axboe 2025-04-29  548  	if (!(h->flags & IORING_OPEN_HANDLE_FIXED)) {
2e7136592b6421 Jens Axboe 2025-04-29 @549  		fd_install(fd, file);
2e7136592b6421 Jens Axboe 2025-04-29  550  		return fd;
2e7136592b6421 Jens Axboe 2025-04-29  551  	}
2e7136592b6421 Jens Axboe 2025-04-29  552  
2e7136592b6421 Jens Axboe 2025-04-29  553  	return io_fixed_fd_install(req, issue_flags, file, h->file_slot);
2e7136592b6421 Jens Axboe 2025-04-29  554  }
2e7136592b6421 Jens Axboe 2025-04-29  555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
