Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC35D111BF
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 04:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740629383; cv=none; b=jgM6HOojoI+yWy68K9XVFObX/NKTVU2xW/m63Kjx1oqbHw0VUI/2hiRHTTkgVdIOM3DpXwD5W8j7DQY4yyhYCOeSnZEfWj1Foj8mnNgGiBwTOqMTrOgvh/TI4AR8IyRKruzz4mhoEpp/sGF6Uo0LaNVX6i/eqaAON5ik1SuqYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740629383; c=relaxed/simple;
	bh=SqmCDBot/kBTKfjfrzWlNQRwLHFVLecjJaPIKlRJuHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDl62d74ffZ3E2odZMctgbt/IgLxMUfSJEZm38hKpo6tpd9XZJJXHv7rfC4nOHNRx6kLELIJEZ7iD0nk8M5rR+XSzAJHVaUoAzD+NBzPTo426stZnnTRN4NnQu4tozBl/rRmkggBMeq3kXa4Qvzi3UAQQHPeyvCfYJvOKPnHNwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuyjjX+C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuyjjX+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740629380; x=1772165380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqmCDBot/kBTKfjfrzWlNQRwLHFVLecjJaPIKlRJuHM=;
  b=EuyjjX+CRDl27szjPY6YViqWaOz0OExJJ10K/0q7gVYgBx+lyX+lYYoB
   gljrCY0NP1b60+B6oL1owe0Spm/4P5MK9UxGfoglqGGRvJqt5xvqScZvf
   xBX2mKGYVnYs3WujZAEDSObBnA3TMHX3hvgMfR5qoLxkCZ7dNgDRKsjmk
   UNy84WumFnar2iiWHtXfJV73Qx3n6RCASii0kf7pvH4OVBUDh5aIGjSzH
   fjrNE4hXUf86T8GB5JWZtg7qn4HeTFnUnDoJ5mqMq0uhp9ma5oNGBrOVG
   l2i3Tn0PWMJ2Zv0Qwjmr8314zfRBmzxC98XBNpxVO0RU84+rktDQLSXJo
   A==;
X-CSE-ConnectionGUID: 9+3s7sArQMCvFCq1l2/O9Q==
X-CSE-MsgGUID: mBIfOqKuRwmPqnZq1JsjUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52141708"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52141708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 20:09:40 -0800
X-CSE-ConnectionGUID: CQIlxtkdSkW4L9uzIFE3+w==
X-CSE-MsgGUID: O3hN5odQSBq+8bO52rYdhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="147728657"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2025 20:09:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnVDM-000CpK-1N;
	Thu, 27 Feb 2025 04:09:36 +0000
Date: Thu, 27 Feb 2025 12:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:for-6.15/io_uring 43/57] io_uring/rw.c:299 io_prep_rw()
 error: uninitialized symbol 'ret'.
Message-ID: <202502271201.3Eaa0Ych-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring
head:   047fa0ba8f1bed6b1c5d88e31c4fd187de16dbc1
commit: 61ed48b5fc63d1c6d9c3eb59ed2b46a2cbfc6039 [43/57] io_uring/rw: open code io_prep_rw_setup()
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250226 (https://download.01.org/0day-ci/archive/20250227/202502271201.3Eaa0Ych-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502271201.3Eaa0Ych-lkp@intel.com/

smatch warnings:
io_uring/rw.c:299 io_prep_rw() error: uninitialized symbol 'ret'.

vim +/ret +299 io_uring/rw.c

a9165b83c1937e Jens Axboe        2024-03-18  247  
a9165b83c1937e Jens Axboe        2024-03-18  248  static int io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *sqe,
a9165b83c1937e Jens Axboe        2024-03-18  249  		      int ddir, bool do_import)
f3b44f92e59a80 Jens Axboe        2022-06-13  250  {
f2ccb5aed7bce1 Stefan Metzmacher 2022-08-11  251  	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
f3b44f92e59a80 Jens Axboe        2022-06-13  252  	unsigned ioprio;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  253  	u64 attr_type_mask;
f3b44f92e59a80 Jens Axboe        2022-06-13  254  	int ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  255  
c72282dd865ee6 Pavel Begunkov    2025-02-24  256  	if (io_rw_alloc_async(req))
c72282dd865ee6 Pavel Begunkov    2025-02-24  257  		return -ENOMEM;
c72282dd865ee6 Pavel Begunkov    2025-02-24  258  
f3b44f92e59a80 Jens Axboe        2022-06-13  259  	rw->kiocb.ki_pos = READ_ONCE(sqe->off);
f3b44f92e59a80 Jens Axboe        2022-06-13  260  	/* used for fixed read/write too - just read unconditionally */
f3b44f92e59a80 Jens Axboe        2022-06-13  261  	req->buf_index = READ_ONCE(sqe->buf_index);
f3b44f92e59a80 Jens Axboe        2022-06-13  262  
f3b44f92e59a80 Jens Axboe        2022-06-13  263  	ioprio = READ_ONCE(sqe->ioprio);
f3b44f92e59a80 Jens Axboe        2022-06-13  264  	if (ioprio) {
f3b44f92e59a80 Jens Axboe        2022-06-13  265  		ret = ioprio_check_cap(ioprio);
f3b44f92e59a80 Jens Axboe        2022-06-13  266  		if (ret)
f3b44f92e59a80 Jens Axboe        2022-06-13  267  			return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  268  
f3b44f92e59a80 Jens Axboe        2022-06-13  269  		rw->kiocb.ki_ioprio = ioprio;
f3b44f92e59a80 Jens Axboe        2022-06-13  270  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  271  		rw->kiocb.ki_ioprio = get_current_ioprio();
f3b44f92e59a80 Jens Axboe        2022-06-13  272  	}
099ada2c87260e Jens Axboe        2023-07-08  273  	rw->kiocb.dio_complete = NULL;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  274  	rw->kiocb.ki_flags = 0;
f3b44f92e59a80 Jens Axboe        2022-06-13  275  
f3b44f92e59a80 Jens Axboe        2022-06-13  276  	rw->addr = READ_ONCE(sqe->addr);
f3b44f92e59a80 Jens Axboe        2022-06-13  277  	rw->len = READ_ONCE(sqe->len);
f3b44f92e59a80 Jens Axboe        2022-06-13  278  	rw->flags = READ_ONCE(sqe->rw_flags);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  279  
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  280  	if (do_import && !io_do_buffer_select(req)) {
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  281  		struct io_async_rw *io = req->async_data;
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  282  
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  283  		ret = io_import_rw_buffer(ddir, req, io, 0);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  284  		if (unlikely(ret))
59a7d12a7fb5ab Anuj Gupta        2024-11-28  285  			return ret;
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  286  	}
59a7d12a7fb5ab Anuj Gupta        2024-11-28  287  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  288  	attr_type_mask = READ_ONCE(sqe->attr_type_mask);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  289  	if (attr_type_mask) {
59a7d12a7fb5ab Anuj Gupta        2024-11-28  290  		u64 attr_ptr;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  291  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  292  		/* only PI attribute is supported currently */
59a7d12a7fb5ab Anuj Gupta        2024-11-28  293  		if (attr_type_mask != IORING_RW_ATTR_FLAG_PI)
59a7d12a7fb5ab Anuj Gupta        2024-11-28  294  			return -EINVAL;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  295  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  296  		attr_ptr = READ_ONCE(sqe->attr_ptr);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  297  		ret = io_prep_rw_pi(req, rw, ddir, attr_ptr, attr_type_mask);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  298  	}
59a7d12a7fb5ab Anuj Gupta        2024-11-28 @299  	return ret;
a9165b83c1937e Jens Axboe        2024-03-18  300  }
a9165b83c1937e Jens Axboe        2024-03-18  301  

:::::: The code at line 299 was first introduced by commit
:::::: 59a7d12a7fb5ab24efa893e6980a00ffc090c777 io_uring: introduce attributes for read/write and PI support

:::::: TO: Anuj Gupta <anuj20.g@samsung.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
