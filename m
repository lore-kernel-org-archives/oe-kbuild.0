Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFE41DF748
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743312; cv=none; b=rex2wCMDsneLopu2g+cpT2IZIoYwNyEw7Pc5rf3nt2y0i6Av+tsvTyHY6G8LwzDuLPYLWfGglWmIzPIN+APCDBTmKmPd2b7cPWhE+6mxKQon76b227ahTwSF27OOks35kZxUEnUe50qBMZXa0bnfkxEHeIj9nWg3AS0tLwt+KVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743312; c=relaxed/simple;
	bh=+kOgPtsnVlXZqtMEinCk7E96RQQmPFv58ehGOHHlqSw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bqLhy5Gd34uQQQPyOcthpAff/ruYzKCWfkpnQkaA19UCRgAnO8LfY84ryPALMsBHWHzdGvyTnGFFxlX8G/HV5n4pdI5qR+XRP0avN+/RkJsngzRS/N1dKV3r8W22QIdjVZaRUwwFqlN59n6HD5ut022+8luA7Loq1MPtVe+4Bzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKolR6dU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKolR6dU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778743310; x=1810279310;
  h=date:from:to:cc:subject:message-id;
  bh=+kOgPtsnVlXZqtMEinCk7E96RQQmPFv58ehGOHHlqSw=;
  b=nKolR6dU3dy/UTCuhUxjInY9GE02yg3D4KAg+H+qU5ETutEFU3V9cteV
   OxxC/lxnS+ne0xpgBhfXs6kxmw3iErGuB6JSyppXx5HtgDG3UkLSuPlKP
   KLdK0UB7ZBjOb08LkprfLBIAaXTEsLzQQ+pg4ow1mM+nyWhN6+KEJXuJH
   VO7rCsfdzKDbAu8+wptWdomxxeD+43HitxD70VCZhmEjbNmIOBas+0JU9
   TXoxZ6MuYxYwwV61Hsw+W5sVFOkxcBdK2uXjr1qLlm42tWvXNBnmQYMi3
   U1lNvssMjZBT2erFrshKTXIfvSrckW97ElWwx0i8eNKXIvkJI7PwNte6U
   Q==;
X-CSE-ConnectionGUID: a1eOEQczTLmz9tov7rHbdA==
X-CSE-MsgGUID: BJJQwUGXSl6D7c14deQffQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90374502"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90374502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 00:21:50 -0700
X-CSE-ConnectionGUID: aJjIn4gOSfaD8Qy9Pe4+uw==
X-CSE-MsgGUID: cuGT/wLZSmmm53FZzQX0MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="276396410"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2026 00:21:48 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNQO9-0000000061H-1KwO;
	Thu, 14 May 2026 07:21:45 +0000
Date: Thu, 14 May 2026 15:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave-btrfs-devel:ext/dv/fscrypt 34/43]
 fs/btrfs/super.c:659 btrfs_parse_param() warn: statement has no effect 'int'
Message-ID: <202605141536.bcB7XV37-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>
CC: Daniel Vacek <neelx@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
commit: 69bb73593025c83c008129a68acd562e97870998 [34/43] btrfs: add test_dummy_encryption support
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260514/202605141536.bcB7XV37-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141536.bcB7XV37-lkp@intel.com/

smatch warnings:
fs/btrfs/super.c:659 btrfs_parse_param() warn: statement has no effect 'int'

vim +/int +659 fs/btrfs/super.c

3f0e865ae61ed8c Daniel Vacek          2025-06-02  344  
17b3612022fe533 Josef Bacik           2023-11-22  345  static int btrfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
17b3612022fe533 Josef Bacik           2023-11-22  346  {
17b3612022fe533 Josef Bacik           2023-11-22  347  	struct btrfs_fs_context *ctx = fc->fs_private;
17b3612022fe533 Josef Bacik           2023-11-22  348  	struct fs_parse_result result;
17b3612022fe533 Josef Bacik           2023-11-22  349  	int opt;
95e0528919cb0c7 Chris Mason           2007-08-29  350  
17b3612022fe533 Josef Bacik           2023-11-22  351  	opt = fs_parse(fc, btrfs_fs_parameters, param, &result);
17b3612022fe533 Josef Bacik           2023-11-22  352  	if (opt < 0)
17b3612022fe533 Josef Bacik           2023-11-22  353  		return opt;
95e0528919cb0c7 Chris Mason           2007-08-29  354  
17b3612022fe533 Josef Bacik           2023-11-22  355  	switch (opt) {
dfe25020689bb2d Chris Mason           2008-05-13  356  	case Opt_degraded:
17b3612022fe533 Josef Bacik           2023-11-22  357  		btrfs_set_opt(ctx->mount_opt, DEGRADED);
dfe25020689bb2d Chris Mason           2008-05-13  358  		break;
37becec95ac31b2 Omar Sandoval         2018-05-21  359  	case Opt_subvol_empty:
edf24abe51493cc Christoph Hellwig     2008-06-10  360  		/*
17b3612022fe533 Josef Bacik           2023-11-22  361  		 * This exists because we used to allow it on accident, so we're
17b3612022fe533 Josef Bacik           2023-11-22  362  		 * keeping it to maintain ABI.  See 37becec95ac3 ("Btrfs: allow
17b3612022fe533 Josef Bacik           2023-11-22  363  		 * empty subvol= again").
edf24abe51493cc Christoph Hellwig     2008-06-10  364  		 */
95e0528919cb0c7 Chris Mason           2007-08-29  365  		break;
17b3612022fe533 Josef Bacik           2023-11-22  366  	case Opt_subvol:
17b3612022fe533 Josef Bacik           2023-11-22  367  		kfree(ctx->subvol_name);
17b3612022fe533 Josef Bacik           2023-11-22  368  		ctx->subvol_name = kstrdup(param->string, GFP_KERNEL);
17b3612022fe533 Josef Bacik           2023-11-22  369  		if (!ctx->subvol_name)
17b3612022fe533 Josef Bacik           2023-11-22  370  			return -ENOMEM;
be20aa9dbadc8c0 Chris Mason           2007-12-17  371  		break;
17b3612022fe533 Josef Bacik           2023-11-22  372  	case Opt_subvolid:
17b3612022fe533 Josef Bacik           2023-11-22  373  		ctx->subvol_objectid = result.uint_64;
17b3612022fe533 Josef Bacik           2023-11-22  374  
17b3612022fe533 Josef Bacik           2023-11-22  375  		/* subvolid=0 means give me the original fs_tree. */
17b3612022fe533 Josef Bacik           2023-11-22  376  		if (!ctx->subvol_objectid)
17b3612022fe533 Josef Bacik           2023-11-22  377  			ctx->subvol_objectid = BTRFS_FS_TREE_OBJECTID;
17b3612022fe533 Josef Bacik           2023-11-22  378  		break;
17b3612022fe533 Josef Bacik           2023-11-22  379  	case Opt_device: {
17b3612022fe533 Josef Bacik           2023-11-22  380  		struct btrfs_device *device;
17b3612022fe533 Josef Bacik           2023-11-22  381  
17b3612022fe533 Josef Bacik           2023-11-22  382  		mutex_lock(&uuid_mutex);
ae818824a203958 Christoph Hellwig     2025-06-11  383  		device = btrfs_scan_one_device(param->string, false);
17b3612022fe533 Josef Bacik           2023-11-22  384  		mutex_unlock(&uuid_mutex);
17b3612022fe533 Josef Bacik           2023-11-22  385  		if (IS_ERR(device))
17b3612022fe533 Josef Bacik           2023-11-22  386  			return PTR_ERR(device);
d399167d88ea535 Qu Wenruo             2014-01-06  387  		break;
bedb2cca7252d08 Andrei Popa           2012-09-20  388  	}
17b3612022fe533 Josef Bacik           2023-11-22  389  	case Opt_datasum:
17b3612022fe533 Josef Bacik           2023-11-22  390  		if (result.negated) {
17b3612022fe533 Josef Bacik           2023-11-22  391  			btrfs_set_opt(ctx->mount_opt, NODATASUM);
17b3612022fe533 Josef Bacik           2023-11-22  392  		} else {
17b3612022fe533 Josef Bacik           2023-11-22  393  			btrfs_clear_opt(ctx->mount_opt, NODATACOW);
17b3612022fe533 Josef Bacik           2023-11-22  394  			btrfs_clear_opt(ctx->mount_opt, NODATASUM);
078025347c8ed43 Qu Wenruo             2014-01-13  395  		}
b6cda9bcb4df754 Chris Mason           2007-12-14  396  		break;
a258af7a3e395a1 Qu Wenruo             2014-01-06  397  	case Opt_datacow:
17b3612022fe533 Josef Bacik           2023-11-22  398  		if (result.negated) {
17b3612022fe533 Josef Bacik           2023-11-22  399  			btrfs_clear_opt(ctx->mount_opt, COMPRESS);
17b3612022fe533 Josef Bacik           2023-11-22  400  			btrfs_clear_opt(ctx->mount_opt, FORCE_COMPRESS);
17b3612022fe533 Josef Bacik           2023-11-22  401  			btrfs_set_opt(ctx->mount_opt, NODATACOW);
17b3612022fe533 Josef Bacik           2023-11-22  402  			btrfs_set_opt(ctx->mount_opt, NODATASUM);
17b3612022fe533 Josef Bacik           2023-11-22  403  		} else {
17b3612022fe533 Josef Bacik           2023-11-22  404  			btrfs_clear_opt(ctx->mount_opt, NODATACOW);
17b3612022fe533 Josef Bacik           2023-11-22  405  		}
a258af7a3e395a1 Qu Wenruo             2014-01-06  406  		break;
261507a02ccba9a Li Zefan              2010-12-17  407  	case Opt_compress_force:
261507a02ccba9a Li Zefan              2010-12-17  408  	case Opt_compress_force_type:
17b3612022fe533 Josef Bacik           2023-11-22  409  		btrfs_set_opt(ctx->mount_opt, FORCE_COMPRESS);
c730ae0c6bb3125 Marcos Paulo de Souza 2020-06-16  410  		fallthrough;
c8b978188c9a0fd Chris Mason           2008-10-29  411  	case Opt_compress:
261507a02ccba9a Li Zefan              2010-12-17  412  	case Opt_compress_type:
3f0e865ae61ed8c Daniel Vacek          2025-06-02  413  		if (btrfs_parse_compress(ctx, param, opt))
17b3612022fe533 Josef Bacik           2023-11-22  414  			return -EINVAL;
a555f810af6d63e Chris Mason           2010-01-28  415  		break;
e18e4809b10e6c9 Chris Mason           2008-01-18  416  	case Opt_ssd:
17b3612022fe533 Josef Bacik           2023-11-22  417  		if (result.negated) {
17b3612022fe533 Josef Bacik           2023-11-22  418  			btrfs_set_opt(ctx->mount_opt, NOSSD);
17b3612022fe533 Josef Bacik           2023-11-22  419  			btrfs_clear_opt(ctx->mount_opt, SSD);
17b3612022fe533 Josef Bacik           2023-11-22  420  			btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
17b3612022fe533 Josef Bacik           2023-11-22  421  		} else {
17b3612022fe533 Josef Bacik           2023-11-22  422  			btrfs_set_opt(ctx->mount_opt, SSD);
17b3612022fe533 Josef Bacik           2023-11-22  423  			btrfs_clear_opt(ctx->mount_opt, NOSSD);
17b3612022fe533 Josef Bacik           2023-11-22  424  		}
e18e4809b10e6c9 Chris Mason           2008-01-18  425  		break;
451d7585a8bb1b9 Chris Mason           2009-06-09  426  	case Opt_ssd_spread:
17b3612022fe533 Josef Bacik           2023-11-22  427  		if (result.negated) {
17b3612022fe533 Josef Bacik           2023-11-22  428  			btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
17b3612022fe533 Josef Bacik           2023-11-22  429  		} else {
17b3612022fe533 Josef Bacik           2023-11-22  430  			btrfs_set_opt(ctx->mount_opt, SSD);
17b3612022fe533 Josef Bacik           2023-11-22  431  			btrfs_set_opt(ctx->mount_opt, SSD_SPREAD);
17b3612022fe533 Josef Bacik           2023-11-22  432  			btrfs_clear_opt(ctx->mount_opt, NOSSD);
17b3612022fe533 Josef Bacik           2023-11-22  433  		}
3b30c22f64a6bb2 Chris Mason           2009-06-09  434  		break;
842bef5891aaf13 Qu Wenruo             2014-01-06  435  	case Opt_barrier:
17b3612022fe533 Josef Bacik           2023-11-22  436  		if (result.negated)
17b3612022fe533 Josef Bacik           2023-11-22  437  			btrfs_set_opt(ctx->mount_opt, NOBARRIER);
17b3612022fe533 Josef Bacik           2023-11-22  438  		else
17b3612022fe533 Josef Bacik           2023-11-22  439  			btrfs_clear_opt(ctx->mount_opt, NOBARRIER);
21ad10cf3e9c1ef Chris Mason           2008-01-09  440  		break;
4543df7ecc8ae49 Chris Mason           2008-06-11  441  	case Opt_thread_pool:
17b3612022fe533 Josef Bacik           2023-11-22  442  		if (result.uint_32 == 0) {
17b3612022fe533 Josef Bacik           2023-11-22  443  			btrfs_err(NULL, "invalid value 0 for thread_pool");
17b3612022fe533 Josef Bacik           2023-11-22  444  			return -EINVAL;
2c334e87f31783c Wang Shilong          2013-07-24  445  		}
17b3612022fe533 Josef Bacik           2023-11-22  446  		ctx->thread_pool_size = result.uint_32;
4543df7ecc8ae49 Chris Mason           2008-06-11  447  		break;
6f568d35a045dbb Chris Mason           2008-01-29  448  	case Opt_max_inline:
17b3612022fe533 Josef Bacik           2023-11-22  449  		ctx->max_inline = memparse(param->string, NULL);
6f568d35a045dbb Chris Mason           2008-01-29  450  		break;
bd0330ad2174d1a Qu Wenruo             2014-01-06  451  	case Opt_acl:
17b3612022fe533 Josef Bacik           2023-11-22  452  		if (result.negated) {
17b3612022fe533 Josef Bacik           2023-11-22  453  			fc->sb_flags &= ~SB_POSIXACL;
17b3612022fe533 Josef Bacik           2023-11-22  454  		} else {
45ff35d6b9f301c Guangliang Zhao       2014-05-12  455  #ifdef CONFIG_BTRFS_FS_POSIX_ACL
17b3612022fe533 Josef Bacik           2023-11-22  456  			fc->sb_flags |= SB_POSIXACL;
45ff35d6b9f301c Guangliang Zhao       2014-05-12  457  #else
17b3612022fe533 Josef Bacik           2023-11-22  458  			btrfs_err(NULL, "support for ACL not compiled in");
17b3612022fe533 Josef Bacik           2023-11-22  459  			return -EINVAL;
45ff35d6b9f301c Guangliang Zhao       2014-05-12  460  #endif
17b3612022fe533 Josef Bacik           2023-11-22  461  		}
17b3612022fe533 Josef Bacik           2023-11-22  462  		/*
17b3612022fe533 Josef Bacik           2023-11-22  463  		 * VFS limits the ability to toggle ACL on and off via remount,
17b3612022fe533 Josef Bacik           2023-11-22  464  		 * despite every file system allowing this.  This seems to be
17b3612022fe533 Josef Bacik           2023-11-22  465  		 * an oversight since we all do, but it'll fail if we're
17b3612022fe533 Josef Bacik           2023-11-22  466  		 * remounting.  So don't set the mask here, we'll check it in
17b3612022fe533 Josef Bacik           2023-11-22  467  		 * btrfs_reconfigure and do the toggling ourselves.
17b3612022fe533 Josef Bacik           2023-11-22  468  		 */
17b3612022fe533 Josef Bacik           2023-11-22  469  		if (fc->purpose != FS_CONTEXT_FOR_RECONFIGURE)
17b3612022fe533 Josef Bacik           2023-11-22  470  			fc->sb_flags_mask |= SB_POSIXACL;
a88998f291fc707 Qu Wenruo             2014-01-06  471  		break;
a88998f291fc707 Qu Wenruo             2014-01-06  472  	case Opt_treelog:
17b3612022fe533 Josef Bacik           2023-11-22  473  		if (result.negated)
17b3612022fe533 Josef Bacik           2023-11-22  474  			btrfs_set_opt(ctx->mount_opt, NOTREELOG);
17b3612022fe533 Josef Bacik           2023-11-22  475  		else
17b3612022fe533 Josef Bacik           2023-11-22  476  			btrfs_clear_opt(ctx->mount_opt, NOTREELOG);
3a5e14048a0a812 Sage Weil             2009-04-02  477  		break;
440861b1a03c72c Qu Wenruo             2024-05-21  478  	case Opt_norecovery:
440861b1a03c72c Qu Wenruo             2024-05-21  479  		btrfs_info(NULL,
440861b1a03c72c Qu Wenruo             2024-05-21  480  "'norecovery' is for compatibility only, recommended to use 'rescue=nologreplay'");
440861b1a03c72c Qu Wenruo             2024-05-21  481  		btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
440861b1a03c72c Qu Wenruo             2024-05-21  482  		break;
dccae9999508964 Sage Weil             2009-04-02  483  	case Opt_flushoncommit:
17b3612022fe533 Josef Bacik           2023-11-22  484  		if (result.negated)
17b3612022fe533 Josef Bacik           2023-11-22  485  			btrfs_clear_opt(ctx->mount_opt, FLUSHONCOMMIT);
17b3612022fe533 Josef Bacik           2023-11-22  486  		else
17b3612022fe533 Josef Bacik           2023-11-22  487  			btrfs_set_opt(ctx->mount_opt, FLUSHONCOMMIT);
2c9ee85671f66cd Qu Wenruo             2014-01-06  488  		break;
97e728d4353f38c Josef Bacik           2009-04-21  489  	case Opt_ratio:
17b3612022fe533 Josef Bacik           2023-11-22  490  		ctx->metadata_ratio = result.uint_32;
97e728d4353f38c Josef Bacik           2009-04-21  491  		break;
e244a0aeb6a599c Christoph Hellwig     2009-10-14  492  	case Opt_discard:
17b3612022fe533 Josef Bacik           2023-11-22  493  		if (result.negated) {
17b3612022fe533 Josef Bacik           2023-11-22  494  			btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
17b3612022fe533 Josef Bacik           2023-11-22  495  			btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
17b3612022fe533 Josef Bacik           2023-11-22  496  			btrfs_set_opt(ctx->mount_opt, NODISCARD);
b0643e59cfa609c Dennis Zhou           2019-12-13  497  		} else {
17b3612022fe533 Josef Bacik           2023-11-22  498  			btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
17b3612022fe533 Josef Bacik           2023-11-22  499  			btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
b0643e59cfa609c Dennis Zhou           2019-12-13  500  		}
e244a0aeb6a599c Christoph Hellwig     2009-10-14  501  		break;
17b3612022fe533 Josef Bacik           2023-11-22  502  	case Opt_discard_mode:
17b3612022fe533 Josef Bacik           2023-11-22  503  		switch (result.uint_32) {
17b3612022fe533 Josef Bacik           2023-11-22  504  		case Opt_discard_sync:
17b3612022fe533 Josef Bacik           2023-11-22  505  			btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
17b3612022fe533 Josef Bacik           2023-11-22  506  			btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
e07a2ade4426a2c Qu Wenruo             2014-01-06  507  			break;
17b3612022fe533 Josef Bacik           2023-11-22  508  		case Opt_discard_async:
17b3612022fe533 Josef Bacik           2023-11-22  509  			btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
17b3612022fe533 Josef Bacik           2023-11-22  510  			btrfs_set_opt(ctx->mount_opt, DISCARD_ASYNC);
63cd070decb15f5 Josef Bacik           2021-12-15  511  			break;
17b3612022fe533 Josef Bacik           2023-11-22  512  		default:
17b3612022fe533 Josef Bacik           2023-11-22  513  			btrfs_err(NULL, "unrecognized discard mode value %s",
17b3612022fe533 Josef Bacik           2023-11-22  514  				  param->key);
17b3612022fe533 Josef Bacik           2023-11-22  515  			return -EINVAL;
17b3612022fe533 Josef Bacik           2023-11-22  516  		}
17b3612022fe533 Josef Bacik           2023-11-22  517  		btrfs_clear_opt(ctx->mount_opt, NODISCARD);
17b3612022fe533 Josef Bacik           2023-11-22  518  		break;
17b3612022fe533 Josef Bacik           2023-11-22  519  	case Opt_space_cache:
17b3612022fe533 Josef Bacik           2023-11-22  520  		if (result.negated) {
17b3612022fe533 Josef Bacik           2023-11-22  521  			btrfs_set_opt(ctx->mount_opt, NOSPACECACHE);
17b3612022fe533 Josef Bacik           2023-11-22  522  			btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
17b3612022fe533 Josef Bacik           2023-11-22  523  			btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
70f6d82ec73c3ae Omar Sandoval         2015-09-29  524  		} else {
17b3612022fe533 Josef Bacik           2023-11-22  525  			btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
17b3612022fe533 Josef Bacik           2023-11-22  526  			btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
70f6d82ec73c3ae Omar Sandoval         2015-09-29  527  		}
0de90876c6cb774 Josef Bacik           2010-11-19  528  		break;
17b3612022fe533 Josef Bacik           2023-11-22  529  	case Opt_space_cache_version:
17b3612022fe533 Josef Bacik           2023-11-22  530  		switch (result.uint_32) {
17b3612022fe533 Josef Bacik           2023-11-22  531  		case Opt_space_cache_v1:
17b3612022fe533 Josef Bacik           2023-11-22  532  			btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
17b3612022fe533 Josef Bacik           2023-11-22  533  			btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
f420ee1e923b931 Stefan Behrens        2013-08-15  534  			break;
17b3612022fe533 Josef Bacik           2023-11-22  535  		case Opt_space_cache_v2:
17b3612022fe533 Josef Bacik           2023-11-22  536  			btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
17b3612022fe533 Josef Bacik           2023-11-22  537  			btrfs_set_opt(ctx->mount_opt, FREE_SPACE_TREE);
63cd070decb15f5 Josef Bacik           2021-12-15  538  			break;
17b3612022fe533 Josef Bacik           2023-11-22  539  		default:
17b3612022fe533 Josef Bacik           2023-11-22  540  			btrfs_err(NULL, "unrecognized space_cache value %s",
17b3612022fe533 Josef Bacik           2023-11-22  541  				  param->key);
17b3612022fe533 Josef Bacik           2023-11-22  542  			return -EINVAL;
70f6d82ec73c3ae Omar Sandoval         2015-09-29  543  		}
73bc187680f94be Josef Bacik           2011-10-03  544  		break;
17b3612022fe533 Josef Bacik           2023-11-22  545  	case Opt_rescan_uuid_tree:
17b3612022fe533 Josef Bacik           2023-11-22  546  		btrfs_set_opt(ctx->mount_opt, RESCAN_UUID_TREE);
4b9465cb9e38591 Chris Mason           2011-06-03  547  		break;
88c2ba3b069f1e0 Josef Bacik           2010-09-21  548  	case Opt_clear_cache:
17b3612022fe533 Josef Bacik           2023-11-22  549  		btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
0af3d00bad38d3b Josef Bacik           2010-06-21  550  		break;
4260f7c7516f4c2 Sage Weil             2010-10-29  551  	case Opt_user_subvol_rm_allowed:
17b3612022fe533 Josef Bacik           2023-11-22  552  		btrfs_set_opt(ctx->mount_opt, USER_SUBVOL_RM_ALLOWED);
4260f7c7516f4c2 Sage Weil             2010-10-29  553  		break;
91435650c233b93 Chris Mason           2011-02-16  554  	case Opt_enospc_debug:
17b3612022fe533 Josef Bacik           2023-11-22  555  		if (result.negated)
17b3612022fe533 Josef Bacik           2023-11-22  556  			btrfs_clear_opt(ctx->mount_opt, ENOSPC_DEBUG);
17b3612022fe533 Josef Bacik           2023-11-22  557  		else
17b3612022fe533 Josef Bacik           2023-11-22  558  			btrfs_set_opt(ctx->mount_opt, ENOSPC_DEBUG);
530362934332e4e Qu Wenruo             2014-01-06  559  		break;
4cb5300bc839b8a Chris Mason           2011-05-24  560  	case Opt_defrag:
17b3612022fe533 Josef Bacik           2023-11-22  561  		if (result.negated)
17b3612022fe533 Josef Bacik           2023-11-22  562  			btrfs_clear_opt(ctx->mount_opt, AUTO_DEFRAG);
17b3612022fe533 Josef Bacik           2023-11-22  563  		else
17b3612022fe533 Josef Bacik           2023-11-22  564  			btrfs_set_opt(ctx->mount_opt, AUTO_DEFRAG);
fc0ca9af180b91a Qu Wenruo             2014-01-06  565  		break;
8dcddfa048de637 Qu Wenruo             2016-01-19  566  	case Opt_usebackuproot:
17b3612022fe533 Josef Bacik           2023-11-22  567  		btrfs_warn(NULL,
17b3612022fe533 Josef Bacik           2023-11-22  568  			   "'usebackuproot' is deprecated, use 'rescue=usebackuproot' instead");
17b3612022fe533 Josef Bacik           2023-11-22  569  		btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
9fb3b1a7fed7965 Josef Bacik           2023-11-22  570  
9fb3b1a7fed7965 Josef Bacik           2023-11-22  571  		/* If we're loading the backup roots we can't trust the space cache. */
9fb3b1a7fed7965 Josef Bacik           2023-11-22  572  		btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
af31f5e5b84b5bf Chris Mason           2011-11-03  573  		break;
9555c6c180600b4 Ilya Dryomov          2012-01-16  574  	case Opt_skip_balance:
17b3612022fe533 Josef Bacik           2023-11-22  575  		btrfs_set_opt(ctx->mount_opt, SKIP_BALANCE);
9555c6c180600b4 Ilya Dryomov          2012-01-16  576  		break;
8c3429300181be4 Jeff Mahoney          2011-10-03  577  	case Opt_fatal_errors:
17b3612022fe533 Josef Bacik           2023-11-22  578  		switch (result.uint_32) {
17b3612022fe533 Josef Bacik           2023-11-22  579  		case Opt_fatal_errors_panic:
17b3612022fe533 Josef Bacik           2023-11-22  580  			btrfs_set_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
17b3612022fe533 Josef Bacik           2023-11-22  581  			break;
17b3612022fe533 Josef Bacik           2023-11-22  582  		case Opt_fatal_errors_bug:
17b3612022fe533 Josef Bacik           2023-11-22  583  			btrfs_clear_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
17b3612022fe533 Josef Bacik           2023-11-22  584  			break;
17b3612022fe533 Josef Bacik           2023-11-22  585  		default:
17b3612022fe533 Josef Bacik           2023-11-22  586  			btrfs_err(NULL, "unrecognized fatal_errors value %s",
17b3612022fe533 Josef Bacik           2023-11-22  587  				  param->key);
17b3612022fe533 Josef Bacik           2023-11-22  588  			return -EINVAL;
8c3429300181be4 Jeff Mahoney          2011-10-03  589  		}
8c3429300181be4 Jeff Mahoney          2011-10-03  590  		break;
8b87dc17fbc7443 David Sterba          2013-08-01  591  	case Opt_commit_interval:
17b3612022fe533 Josef Bacik           2023-11-22  592  		ctx->commit_interval = result.uint_32;
4ce2affc6ef9f84 Kyoji Ogasawara       2025-05-09  593  		if (ctx->commit_interval > BTRFS_WARNING_COMMIT_INTERVAL) {
4ce2affc6ef9f84 Kyoji Ogasawara       2025-05-09  594  			btrfs_warn(NULL, "excessive commit interval %u, use with care",
4ce2affc6ef9f84 Kyoji Ogasawara       2025-05-09  595  				   ctx->commit_interval);
4ce2affc6ef9f84 Kyoji Ogasawara       2025-05-09  596  		}
17b3612022fe533 Josef Bacik           2023-11-22  597  		if (ctx->commit_interval == 0)
17b3612022fe533 Josef Bacik           2023-11-22  598  			ctx->commit_interval = BTRFS_DEFAULT_COMMIT_INTERVAL;
8b87dc17fbc7443 David Sterba          2013-08-01  599  		break;
74ef00185eb8642 Qu Wenruo             2020-06-04  600  	case Opt_rescue:
17b3612022fe533 Josef Bacik           2023-11-22  601  		switch (result.uint_32) {
17b3612022fe533 Josef Bacik           2023-11-22  602  		case Opt_rescue_usebackuproot:
17b3612022fe533 Josef Bacik           2023-11-22  603  			btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
17b3612022fe533 Josef Bacik           2023-11-22  604  			break;
17b3612022fe533 Josef Bacik           2023-11-22  605  		case Opt_rescue_nologreplay:
17b3612022fe533 Josef Bacik           2023-11-22  606  			btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
17b3612022fe533 Josef Bacik           2023-11-22  607  			break;
17b3612022fe533 Josef Bacik           2023-11-22  608  		case Opt_rescue_ignorebadroots:
17b3612022fe533 Josef Bacik           2023-11-22  609  			btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
17b3612022fe533 Josef Bacik           2023-11-22  610  			break;
17b3612022fe533 Josef Bacik           2023-11-22  611  		case Opt_rescue_ignoredatacsums:
17b3612022fe533 Josef Bacik           2023-11-22  612  			btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
17b3612022fe533 Josef Bacik           2023-11-22  613  			break;
169aaaf2e0be615 Qu Wenruo             2024-06-14  614  		case Opt_rescue_ignoremetacsums:
169aaaf2e0be615 Qu Wenruo             2024-06-14  615  			btrfs_set_opt(ctx->mount_opt, IGNOREMETACSUMS);
169aaaf2e0be615 Qu Wenruo             2024-06-14  616  			break;
32e6216512b4119 Qu Wenruo             2024-06-14  617  		case Opt_rescue_ignoresuperflags:
32e6216512b4119 Qu Wenruo             2024-06-14  618  			btrfs_set_opt(ctx->mount_opt, IGNORESUPERFLAGS);
32e6216512b4119 Qu Wenruo             2024-06-14  619  			break;
17b3612022fe533 Josef Bacik           2023-11-22  620  		case Opt_rescue_parameter_all:
17b3612022fe533 Josef Bacik           2023-11-22  621  			btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
169aaaf2e0be615 Qu Wenruo             2024-06-14  622  			btrfs_set_opt(ctx->mount_opt, IGNOREMETACSUMS);
32e6216512b4119 Qu Wenruo             2024-06-14  623  			btrfs_set_opt(ctx->mount_opt, IGNORESUPERFLAGS);
17b3612022fe533 Josef Bacik           2023-11-22  624  			btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
17b3612022fe533 Josef Bacik           2023-11-22  625  			btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
17b3612022fe533 Josef Bacik           2023-11-22  626  			break;
17b3612022fe533 Josef Bacik           2023-11-22  627  		default:
17b3612022fe533 Josef Bacik           2023-11-22  628  			btrfs_info(NULL, "unrecognized rescue option '%s'",
17b3612022fe533 Josef Bacik           2023-11-22  629  				   param->key);
17b3612022fe533 Josef Bacik           2023-11-22  630  			return -EINVAL;
e3a4167c880cf88 David Sterba          2022-06-02  631  		}
74ef00185eb8642 Qu Wenruo             2020-06-04  632  		break;
d0bd456074dca08 Josef Bacik           2015-09-23  633  #ifdef CONFIG_BTRFS_DEBUG
17b3612022fe533 Josef Bacik           2023-11-22  634  	case Opt_fragment:
17b3612022fe533 Josef Bacik           2023-11-22  635  		switch (result.uint_32) {
17b3612022fe533 Josef Bacik           2023-11-22  636  		case Opt_fragment_parameter_all:
17b3612022fe533 Josef Bacik           2023-11-22  637  			btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
17b3612022fe533 Josef Bacik           2023-11-22  638  			btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
17b3612022fe533 Josef Bacik           2023-11-22  639  			break;
17b3612022fe533 Josef Bacik           2023-11-22  640  		case Opt_fragment_parameter_metadata:
17b3612022fe533 Josef Bacik           2023-11-22  641  			btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
d0bd456074dca08 Josef Bacik           2015-09-23  642  			break;
17b3612022fe533 Josef Bacik           2023-11-22  643  		case Opt_fragment_parameter_data:
17b3612022fe533 Josef Bacik           2023-11-22  644  			btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
d0bd456074dca08 Josef Bacik           2015-09-23  645  			break;
17b3612022fe533 Josef Bacik           2023-11-22  646  		default:
17b3612022fe533 Josef Bacik           2023-11-22  647  			btrfs_info(NULL, "unrecognized fragment option '%s'",
17b3612022fe533 Josef Bacik           2023-11-22  648  				   param->key);
17b3612022fe533 Josef Bacik           2023-11-22  649  			return -EINVAL;
17b3612022fe533 Josef Bacik           2023-11-22  650  		}
d0bd456074dca08 Josef Bacik           2015-09-23  651  		break;
fb592373cddeb4e Josef Bacik           2017-09-29  652  	case Opt_ref_verify:
17b3612022fe533 Josef Bacik           2023-11-22  653  		btrfs_set_opt(ctx->mount_opt, REF_VERIFY);
fb592373cddeb4e Josef Bacik           2017-09-29  654  		break;
46d33a0cc484ceb Leo Martins           2025-08-12  655  	case Opt_ref_tracker:
46d33a0cc484ceb Leo Martins           2025-08-12  656  		btrfs_set_opt(ctx->mount_opt, REF_TRACKER);
46d33a0cc484ceb Leo Martins           2025-08-12  657  		break;
69bb73593025c83 Josef Bacik           2026-05-13  658  	case Opt_test_dummy_encryption:
69bb73593025c83 Josef Bacik           2026-05-13 @659  		int ret;
69bb73593025c83 Josef Bacik           2026-05-13  660  
69bb73593025c83 Josef Bacik           2026-05-13  661  		/*
69bb73593025c83 Josef Bacik           2026-05-13  662  		 * We only support v2, so reject any v1 policies.
69bb73593025c83 Josef Bacik           2026-05-13  663  		 */
69bb73593025c83 Josef Bacik           2026-05-13  664  		if (param->type == fs_value_is_string && *param->string &&
69bb73593025c83 Josef Bacik           2026-05-13  665  		    !strcmp(param->string, "v1")) {
69bb73593025c83 Josef Bacik           2026-05-13  666  			btrfs_info(NULL, "v1 encryption isn't supported");
69bb73593025c83 Josef Bacik           2026-05-13  667  			return -EINVAL;
69bb73593025c83 Josef Bacik           2026-05-13  668  		}
69bb73593025c83 Josef Bacik           2026-05-13  669  
69bb73593025c83 Josef Bacik           2026-05-13  670  		btrfs_set_opt(ctx->mount_opt, TEST_DUMMY_ENCRYPTION);
69bb73593025c83 Josef Bacik           2026-05-13  671  		ret = fscrypt_parse_test_dummy_encryption(param, &ctx->dummy_enc_policy);
69bb73593025c83 Josef Bacik           2026-05-13  672  		if (ret)
69bb73593025c83 Josef Bacik           2026-05-13  673  			return ret;
69bb73593025c83 Josef Bacik           2026-05-13  674  		break;
d0bd456074dca08 Josef Bacik           2015-09-23  675  #endif
95e0528919cb0c7 Chris Mason           2007-08-29  676  	default:
17b3612022fe533 Josef Bacik           2023-11-22  677  		btrfs_err(NULL, "unrecognized mount option '%s'", param->key);
17b3612022fe533 Josef Bacik           2023-11-22  678  		return -EINVAL;
95e0528919cb0c7 Chris Mason           2007-08-29  679  	}
d70bf7484f72870 Josef Bacik           2020-10-16  680  
17b3612022fe533 Josef Bacik           2023-11-22  681  	return 0;
edf24abe51493cc Christoph Hellwig     2008-06-10  682  }
edf24abe51493cc Christoph Hellwig     2008-06-10  683  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
