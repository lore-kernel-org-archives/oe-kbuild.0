Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83E32B989
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 12:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778331432; cv=none; b=jkEt3N0KdEarZMj+uQhDeV98C+zJ6VsidzDXISVyTl9Z2ZhnAGdRIbJBoYAMERD+0LYm8vVl6uNpl29Ne/b6V8SsbnJtqQhNcEyKcQwr0hSVs4C1sB5NBmntF80+Rdh8BS3RzJcFUViU8UhQSE+M0JOXwcOLTj3YfY/gX6HStS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778331432; c=relaxed/simple;
	bh=f4imruHz2EjkD0WGVOW1PjmGuXXkaZw72rF6cp0+5eM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oWJRHwNdocyRHnLdqpx5YZ90YAwaN1IvlimIHiV+A8cJ73sph5b3QjaPGbKKUth49udVgHOcglApOZK6XvX9GGmsYMq3XlFZIBYeHRCtI8SPmqoZ93dk+D34q6uFxDuH9LpuYJOs8FfocLzrRb61oG94Rx3yHWDjw7140kyiQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEckAKrK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEckAKrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778331430; x=1809867430;
  h=date:from:to:cc:subject:message-id;
  bh=f4imruHz2EjkD0WGVOW1PjmGuXXkaZw72rF6cp0+5eM=;
  b=nEckAKrKbYfX5mn9Qjci/1l8DZkpmZJH+xzwJaeXsJlUQGY2A7M8P+Bo
   utXPPK20+jN4al/FBhy/wxuLvpu4+ZRJOmKRWTHSu0veZ/4XsSTGyaKr0
   A2YkJ1WQ4lGvhsfdL/quieCSThH+VY60Fzdyc02oJhXARpcgwz/08SBv2
   UdoaVYh5U9nj5ZZ2PvIuvV7Gn1h/Q2unP1TulW9urwsdlQJqNNETjqptS
   Yt4yHrQjFM8fzk4wtbFHa9AqR2MPfc2Fkhe28TCdGHWufSeXab2HRJKsV
   n/KCWbmZjSoLz/BOPGHGhUFh+qxiEg4GuxEUol2R1NVKjDIhQ29J2akQa
   w==;
X-CSE-ConnectionGUID: RWnuRYWbSuq264AV6WXlvg==
X-CSE-MsgGUID: aAY4kMJzS2icFTSGEEkYOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79327924"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79327924"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 05:57:09 -0700
X-CSE-ConnectionGUID: rgSa5be9QaqPkkEPUNh8jg==
X-CSE-MsgGUID: bIW2DWRCRxK7WpG2N4XlEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="237120865"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2026 05:57:08 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLhEv-000000000zd-16sP;
	Sat, 09 May 2026 12:57:05 +0000
Date: Sat, 09 May 2026 20:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4172/4394] drivers/block/loop.c:413
 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)
Message-ID: <202605092030.FAH71Jou-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 1a83d226268cfb9ea546febe6515f39584df8fd2 [4172/4394] loop: check refcount in __loop_clr_fd() and lo_rw_aio()
:::::: branch date: 24 hours ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r073-20260509 (https://download.01.org/0day-ci/archive/20260509/202605092030.FAH71Jou-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605092030.FAH71Jou-lkp@intel.com/

New smatch warnings:
drivers/block/loop.c:413 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)

Old smatch warnings:
drivers/block/loop.c:676 loop_attr_backing_file_show() warn: passing zero to 'PTR_ERR'

vim +/file +413 drivers/block/loop.c

bc07c10a3603a5 Ming Lei           2015-08-17  339  
96f03c8cb29f2e Jens Axboe         2025-11-24  340  static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
96f03c8cb29f2e Jens Axboe         2025-11-24  341  		     loff_t pos, int rw)
c3e6c11147f6f0 Ming Lei           2025-10-15  342  {
96f03c8cb29f2e Jens Axboe         2025-11-24  343  	struct iov_iter iter;
c3e6c11147f6f0 Ming Lei           2025-10-15  344  	struct req_iterator rq_iter;
96f03c8cb29f2e Jens Axboe         2025-11-24  345  	struct bio_vec *bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  346  	struct request *rq = blk_mq_rq_from_pdu(cmd);
96f03c8cb29f2e Jens Axboe         2025-11-24  347  	struct bio *bio = rq->bio;
96f03c8cb29f2e Jens Axboe         2025-11-24  348  	struct file *file = lo->lo_backing_file;
c3e6c11147f6f0 Ming Lei           2025-10-15  349  	struct bio_vec tmp;
96f03c8cb29f2e Jens Axboe         2025-11-24  350  	unsigned int offset;
71075d25ca5cae Chaitanya Kulkarni 2025-12-02  351  	unsigned int nr_bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  352  	int ret;
c3e6c11147f6f0 Ming Lei           2025-10-15  353  
71075d25ca5cae Chaitanya Kulkarni 2025-12-02  354  	nr_bvec = blk_rq_nr_bvec(rq);
c3e6c11147f6f0 Ming Lei           2025-10-15  355  
40326d8a33d5b7 Shaohua Li         2017-08-31  356  	if (rq->bio != rq->biotail) {
bc07c10a3603a5 Ming Lei           2015-08-17  357  
69050f8d6d075d Kees Cook          2026-02-20  358  		bvec = kmalloc_objs(struct bio_vec, nr_bvec, GFP_NOIO);
40326d8a33d5b7 Shaohua Li         2017-08-31  359  		if (!bvec)
40326d8a33d5b7 Shaohua Li         2017-08-31  360  			return -EIO;
40326d8a33d5b7 Shaohua Li         2017-08-31  361  		cmd->bvec = bvec;
40326d8a33d5b7 Shaohua Li         2017-08-31  362  
40326d8a33d5b7 Shaohua Li         2017-08-31  363  		/*
40326d8a33d5b7 Shaohua Li         2017-08-31  364  		 * The bios of the request may be started from the middle of
40326d8a33d5b7 Shaohua Li         2017-08-31  365  		 * the 'bvec' because of bio splitting, so we can't directly
86af5952a8470f Ming Lei           2019-02-15  366  		 * copy bio->bi_iov_vec to new bvec. The rq_for_each_bvec
40326d8a33d5b7 Shaohua Li         2017-08-31  367  		 * API will take care of all details for us.
40326d8a33d5b7 Shaohua Li         2017-08-31  368  		 */
86af5952a8470f Ming Lei           2019-02-15  369  		rq_for_each_bvec(tmp, rq, rq_iter) {
40326d8a33d5b7 Shaohua Li         2017-08-31  370  			*bvec = tmp;
40326d8a33d5b7 Shaohua Li         2017-08-31  371  			bvec++;
40326d8a33d5b7 Shaohua Li         2017-08-31  372  		}
96f03c8cb29f2e Jens Axboe         2025-11-24  373  		bvec = cmd->bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  374  		offset = 0;
fd858d1ca9694c Ming Lei           2025-10-15  375  	} else {
96f03c8cb29f2e Jens Axboe         2025-11-24  376  		/*
96f03c8cb29f2e Jens Axboe         2025-11-24  377  		 * Same here, this bio may be started from the middle of the
96f03c8cb29f2e Jens Axboe         2025-11-24  378  		 * 'bvec' because of bio splitting, so offset from the bvec
96f03c8cb29f2e Jens Axboe         2025-11-24  379  		 * must be passed to iov iterator
96f03c8cb29f2e Jens Axboe         2025-11-24  380  		 */
96f03c8cb29f2e Jens Axboe         2025-11-24  381  		offset = bio->bi_iter.bi_bvec_done;
96f03c8cb29f2e Jens Axboe         2025-11-24  382  		bvec = __bvec_iter_bvec(bio->bi_io_vec, bio->bi_iter);
fd858d1ca9694c Ming Lei           2025-10-15  383  	}
96f03c8cb29f2e Jens Axboe         2025-11-24  384  	atomic_set(&cmd->ref, 2);
96f03c8cb29f2e Jens Axboe         2025-11-24  385  
96f03c8cb29f2e Jens Axboe         2025-11-24  386  	iov_iter_bvec(&iter, rw, bvec, nr_bvec, blk_rq_bytes(rq));
96f03c8cb29f2e Jens Axboe         2025-11-24  387  	iter.iov_offset = offset;
fd858d1ca9694c Ming Lei           2025-10-15  388  
fd858d1ca9694c Ming Lei           2025-10-15  389  	cmd->iocb.ki_pos = pos;
96f03c8cb29f2e Jens Axboe         2025-11-24  390  	cmd->iocb.ki_filp = file;
fd858d1ca9694c Ming Lei           2025-10-15  391  	cmd->iocb.ki_ioprio = req_get_ioprio(rq);
fd858d1ca9694c Ming Lei           2025-10-15  392  	if (cmd->use_aio) {
fd858d1ca9694c Ming Lei           2025-10-15  393  		cmd->iocb.ki_complete = lo_rw_aio_complete;
fd858d1ca9694c Ming Lei           2025-10-15  394  		cmd->iocb.ki_flags = IOCB_DIRECT;
fd858d1ca9694c Ming Lei           2025-10-15  395  	} else {
fd858d1ca9694c Ming Lei           2025-10-15  396  		cmd->iocb.ki_complete = NULL;
fd858d1ca9694c Ming Lei           2025-10-15  397  		cmd->iocb.ki_flags = 0;
fd858d1ca9694c Ming Lei           2025-10-15  398  	}
bc07c10a3603a5 Ming Lei           2015-08-17  399  
1a83d226268cfb Tetsuo Handa       2026-05-08 @400  	if (!file)
1a83d226268cfb Tetsuo Handa       2026-05-08  401  		pr_err("%s(loop%d) starting %s with NULL file (already cleared?)\n",
1a83d226268cfb Tetsuo Handa       2026-05-08  402  		       __func__, lo->lo_number, rw == ITER_SOURCE ? "write" : "read");
1a83d226268cfb Tetsuo Handa       2026-05-08  403  	else if (!file_count(file))
1a83d226268cfb Tetsuo Handa       2026-05-08  404  		pr_err("%s(loop%d) starting %s with raw_refcnt=0x%lx (already released?)\n",
1a83d226268cfb Tetsuo Handa       2026-05-08  405  		       __func__, lo->lo_number, rw == ITER_SOURCE ? "write" : "read",
1a83d226268cfb Tetsuo Handa       2026-05-08  406  		       __file_ref_read_raw(&file->f_ref));
1a83d226268cfb Tetsuo Handa       2026-05-08  407  	else if (IS_ENABLED(CONFIG_DEBUG_AID_FOR_SYZBOT))
1a83d226268cfb Tetsuo Handa       2026-05-08  408  		pr_info("%s(loop%d) starting %s with raw_refcnt=0x%lx, refcnt=%lu\n",
1a83d226268cfb Tetsuo Handa       2026-05-08  409  			__func__, lo->lo_number, rw == ITER_SOURCE ? "write" : "read",
1a83d226268cfb Tetsuo Handa       2026-05-08  410  			__file_ref_read_raw(&file->f_ref), file_count(file));
39d86db34e41b9 Ming Lei           2025-05-27  411  	if (rw == ITER_SOURCE) {
c4706c5058a7bd Ming Lei           2025-07-16  412  		kiocb_start_write(&cmd->iocb);
7c98f7cb8fda96 Miklos Szeredi     2023-08-28 @413  		ret = file->f_op->write_iter(&cmd->iocb, &iter);
39d86db34e41b9 Ming Lei           2025-05-27  414  	} else
7c98f7cb8fda96 Miklos Szeredi     2023-08-28  415  		ret = file->f_op->read_iter(&cmd->iocb, &iter);
bc07c10a3603a5 Ming Lei           2015-08-17  416  
92d773324b7edb Shaohua Li         2017-09-01  417  	lo_rw_aio_do_completion(cmd);
92d773324b7edb Shaohua Li         2017-09-01  418  
bc07c10a3603a5 Ming Lei           2015-08-17  419  	if (ret != -EIOCBQUEUED)
6b19b766e8f077 Jens Axboe         2021-10-21  420  		lo_rw_aio_complete(&cmd->iocb, ret);
f2fed441c69b92 Christoph Hellwig  2025-04-09  421  	return -EIOCBQUEUED;
bc07c10a3603a5 Ming Lei           2015-08-17  422  }
bc07c10a3603a5 Ming Lei           2015-08-17  423  

:::::: The code at line 413 was first introduced by commit
:::::: 7c98f7cb8fda964fbc60b9307ad35e94735fa35f remove call_{read,write}_iter() functions

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
