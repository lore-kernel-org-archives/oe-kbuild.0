Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957121;
	b=marVKbzaW7cr3umet256MKfPwb2P/6aYIDwqgJH1rOCLEYV2xnncktmmyTX1SAMDmoGt
	 tJQuzvoRWTllOafejLDJydod5N7nUmVTkikP+EIKy8tm8gNITr1bR1pC1F/IIy74loQ6S
	 wgokkAtj/B+BAz8VLG2krShU4L4nHRQED1G6F7WV5VY5pagsicRPvXIin5ws8kmuh7Cov
	 ikuuaqrt2KKX2V9647NL0RI4eqASj2CvvmxtqYl7Qpc7gE8F2lM4P1LXkiLwdzzFaHL2Q
	 gRSn1+iRB5IyViFR5L1HsJReXVcyyK8RRNDaSsxaUr3l4/uGnCofK6TZlqYPFEuOZug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957121;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=46KRM/CIuHyGs4YrpXpIYkx+MGQ2HBXQr0JEhW0lK2A=;
	b=iOhEuNORhuipW44Jgcqgrr0tiuaQODMpK3Et1uK0CAoszx8rBYcJC5LGI/1OZ8U8Wtid
	 6Sz1Igb64B/+j4eFWpzISsY3wuPK/mKiDPm2IS27NKhQtlqD570Z3xQ7tVBi0x3ENuub8
	 QW+5MOD06OXLxjPvso2NP0fSsQUm7ype2sY6BpY7t6kk7Y8I3t4fLWYn0m8nx0tUOk7/t
	 gNWc09gQHpbxPh/YAmS2FjqfBYdJsUwvTwMGKOQgRpqryMOAzQiUGX/hZyS++kkyeHz/M
	 DkhgzpohOdLT4LRL84rJdeWNHaLrikTlD2PQXWM4dgbP5wTGfvkwSZBooemZmqf5omQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c+ny4aBL;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10F1606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 09:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10F1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c+ny4aBL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793957120; x=1825493120;
  h=date:from:to:cc:subject:message-id;
  bh=Wqtu2gV0ndm8xcsn98S0V8d+v9+4EuLCJK8v5HdYS4s=;
  b=c+ny4aBLTvWk6RIeey0nXbEjE1PB23gNoUj2rqKNM0MdPU/1NpUvjl0a
   tE3bodkTqGlmQ532EX3Hg6bk2nMRAxFnRyO8sSJv7tB9ZQ8FRF1Du7Ebi
   TtKvLMD0p3s7c4Cv6bBfMZGX8YO/ENZNkhu3oZAS24wQDam0uH7rIPHo5
   obvOu8L2Mswjvmmre9mIUFFev88obTmQRWkzfWNPz/7WstlZ0ZUkqBZgg
   NXYNL02l0QkpSB5ogNqyLw1rAWbquLJRf+Ou8pdl/laT8NLm6f/0pPUFh
   kxhIeC/KU3c2V00FC36R9jCSaNjyxdsLe/OpjIYNik4LWyoNJFVGLWWCl
   Q==;
X-CSE-ConnectionGUID: DZMMmj7sT4OCEjVVAsKZBg==
X-CSE-MsgGUID: ltYDVb3+S/qshyZRz7UivQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2794527"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2794527"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 01:25:20 -0800
X-CSE-ConnectionGUID: BOxXNvYjRfqGjFcpovZE9A==
X-CSE-MsgGUID: XbfihWmsR1S0xEAEB5rq9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7133380"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2026 01:25:18 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPGC9-00000000AB5-3PY6;
	Fri, 06 Nov 2026 09:25:13 +0000
Date: Fri, 06 Nov 2026 10:24:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 303/303]
 io_uring/io_uring.c:8215 io_sqe_files_register() error: we previously assumed
 'ctx->file_data' could be null (see line 8146)
Message-ID: <202611061053.YfJUqRfL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   f012a641c30644ec5bf95cf64d8835854b997f86
commit: 5e6347b58643f36c00336c0a477ff3aa08d1f27a [303/303] UPSTREAM: io_uring: import 5.15-stable io_uring
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 9 months ago
config: arm-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611061053.YfJUqRfL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611061053.YfJUqRfL-lkp@intel.com/

New smatch warnings:
io_uring/io_uring.c:8215 io_sqe_files_register() error: we previously assumed 'ctx->file_data' could be null (see line 8146)

Old smatch warnings:
io_uring/io_uring.c:2707 io_fixup_rw_res() warn: unsigned 'res' is never less than zero.

vim +8215 io_uring/io_uring.c

4a38aed2a0a729 fs/io_uring.c       Jens Axboe     2020-05-14  8137  
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8138  static int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8139  				 unsigned nr_args, u64 __user *tags)
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8140  {
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8141  	__s32 __user *fds = (__s32 __user *) arg;
05f3fb3c539752 fs/io_uring.c       Jens Axboe     2019-12-09  8142  	struct file *file;
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8143  	int fd, ret;
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8144  	unsigned i;
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8145  
05f3fb3c539752 fs/io_uring.c       Jens Axboe     2019-12-09 @8146  	if (ctx->file_data)
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8147  		return -EBUSY;
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8148  	if (!nr_args)
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8149  		return -EINVAL;
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8150  	if (nr_args > IORING_MAX_FIXED_FILES)
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8151  		return -EMFILE;
5103b733348e2d fs/io_uring.c       Pavel Begunkov 2021-09-13  8152  	if (nr_args > rlimit(RLIMIT_NOFILE))
5103b733348e2d fs/io_uring.c       Pavel Begunkov 2021-09-13  8153  		return -EMFILE;
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8154  	ret = io_rsrc_node_switch_start(ctx);
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8155  	if (ret)
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8156  		return ret;
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8157  	ret = io_rsrc_data_alloc(ctx, io_rsrc_file_put, tags, nr_args,
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8158  				 &ctx->file_data);
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8159  	if (ret)
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8160  		return ret;
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8161  
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8162  	ret = -ENOMEM;
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8163  	if (!io_alloc_file_tables(&ctx->file_table, nr_args))
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8164  		goto out_free;
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8165  
08a451739a9b57 fs/io_uring.c       Jens Axboe     2019-10-03  8166  	for (i = 0; i < nr_args; i++, ctx->nr_user_files++) {
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8167  		if (copy_from_user(&fd, &fds[i], sizeof(fd))) {
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8168  			ret = -EFAULT;
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8169  			goto out_fput;
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8170  		}
08a451739a9b57 fs/io_uring.c       Jens Axboe     2019-10-03  8171  		/* allow sparse sets */
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8172  		if (fd == -1) {
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8173  			ret = -EINVAL;
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8174  			if (unlikely(*io_get_tag_slot(ctx->file_data, i)))
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8175  				goto out_fput;
08a451739a9b57 fs/io_uring.c       Jens Axboe     2019-10-03  8176  			continue;
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8177  		}
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8178  
05f3fb3c539752 fs/io_uring.c       Jens Axboe     2019-12-09  8179  		file = fget(fd);
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8180  		ret = -EBADF;
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8181  		if (unlikely(!file))
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8182  			goto out_fput;
05f3fb3c539752 fs/io_uring.c       Jens Axboe     2019-12-09  8183  
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8184  		/*
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8185  		 * Don't allow io_uring instances to be registered. If UNIX
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8186  		 * isn't enabled, then this causes a reference cycle and this
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8187  		 * instance can never get freed. If UNIX is enabled we'll
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8188  		 * handle it just fine, but there's still no point in allowing
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8189  		 * a ring fd as it doesn't support regular read/write anyway.
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8190  		 */
05f3fb3c539752 fs/io_uring.c       Jens Axboe     2019-12-09  8191  		if (file->f_op == &io_uring_fops) {
05f3fb3c539752 fs/io_uring.c       Jens Axboe     2019-12-09  8192  			fput(file);
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8193  			goto out_fput;
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8194  		}
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8195  		io_fixed_file_set(io_fixed_file_slot(&ctx->file_table, i), file);
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8196  	}
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8197  
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8198  	ret = io_sqe_files_scm(ctx);
0558955373023b fs/io_uring.c       Xiaoguang Wang 2020-03-31  8199  	if (ret) {
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8200  		__io_sqe_files_unregister(ctx);
0558955373023b fs/io_uring.c       Xiaoguang Wang 2020-03-31  8201  		return ret;
0558955373023b fs/io_uring.c       Xiaoguang Wang 2020-03-31  8202  	}
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8203  
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8204  	io_rsrc_node_switch(ctx, NULL);
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8205  	return ret;
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8206  out_fput:
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8207  	for (i = 0; i < ctx->nr_user_files; i++) {
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8208  		file = io_file_from_index(ctx, i);
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8209  		if (file)
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8210  			fput(file);
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8211  	}
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22  8212  	io_free_file_tables(&ctx->file_table);
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8213  	ctx->nr_user_files = 0;
600cf3f8b3f68a fs/io_uring.c       Pavel Begunkov 2020-10-10  8214  out_free:
5e6347b58643f3 io_uring/io_uring.c Jens Axboe     2022-12-22 @8215  	io_rsrc_data_free(ctx->file_data);
55cbc2564ab2fd fs/io_uring.c       Jens Axboe     2020-10-14  8216  	ctx->file_data = NULL;
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8217  	return ret;
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8218  }
6b06314c47e141 fs/io_uring.c       Jens Axboe     2019-01-10  8219  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
