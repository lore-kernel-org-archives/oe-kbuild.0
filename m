Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC3215F56
	for <oe-kbuild@lists.linux.dev>; Fri, 16 May 2025 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747379837; cv=none; b=hLdeNqkjfoN0UjeAAdBZ21wSMcLpZzXTVBoQ9GV3Nb3Lp+ZpC9Q0t86wDh9ebVE9EskgZ24dYTb1fK8lt9KsQzBoHz8GSmK8napNvONYOL7oTuWI2xIaZerGXYp37d6wf7Xxmh3JqaPFniMZOEHfYRJlJK9mTx2QSIFGMnq75o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747379837; c=relaxed/simple;
	bh=9gXjwGfaCXsCooPOofxWrpbdd7w+2+ZzKUNNyiOP3S0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofoTncdZPRaPG5fbzHEbKTMZlW9WeRdcVmVE4/iUkeKOdl5m90CzqTk2mBkNa60k0K/xAleeWJAcy7fr+3P/pN3IYv19lH1ZT/95WhEVWqSPBDIoRVlLHMF4Tg+drQGak6j1xkJy0+4I4TBuWcxogLmiXTAzbPyph/R18oQxV9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCfiX2bD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCfiX2bD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747379835; x=1778915835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9gXjwGfaCXsCooPOofxWrpbdd7w+2+ZzKUNNyiOP3S0=;
  b=iCfiX2bDUGY6bqb81RReL9GRfVf/bwGDdYvu3q6Y9yBUyjj0gTsivcZ+
   EnXmGRV+eyGVeXxmhBjc1Tj1XSm2zttrzCQcBrZb8d3cMC5fKfrfKlbLx
   453cte4GInvcCBFghA1Rwn//RdtI+ugT2OKfYmH41XENjor5jokIf54AH
   ouhyeeKPdp6pZHl9JsKQ2ha6Z51/thCngD+rvvh8BXoI7E9sjxYjckTi0
   qhHsF9h/TPm5LOc41qDhOomD+/AJOlMlADsKEEdoAUXAnb1sOUvBcE9ly
   WORUizIZ8FUO0/0u2PpPBZ3mnLNLpsnivfUYh0u8j2pPhL/K1eUBcp03h
   w==;
X-CSE-ConnectionGUID: CTyggUmrT5irpus7YYXgJg==
X-CSE-MsgGUID: zE7PCKa7SuqABXR29slMbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59996768"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="59996768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 00:17:14 -0700
X-CSE-ConnectionGUID: G4voOi44QPeKnBs1bk+/1w==
X-CSE-MsgGUID: uG4tJWobSsubGmmjMNJVJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="169666889"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 00:17:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFpJe-000J5V-1d;
	Fri, 16 May 2025 07:17:10 +0000
Date: Fri, 16 May 2025 15:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jaegeuk-f2fs:dev-test 187/191] fs/f2fs/super.c:858
 f2fs_parse_param() warn: impossible condition '(result.int_32 > ((~0 >> 1)))
 => (s32min-s32max > s32max)'
Message-ID: <202505161519.EW2OO7Cw-lkp@intel.com>
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
CC: linux-f2fs-devel@lists.sourceforge.net
TO: Hongbo Li <lihongbo22@huawei.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Eric Sandeen <sandeen@redhat.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   869734b9a4ef9440e80dba629c688ed3277a7779
commit: 33c0363d5e5bbd712480e048a1ff67a3bca84ba1 [187/191] f2fs: introduce fs_context_operation structure
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250515 (https://download.01.org/0day-ci/archive/20250516/202505161519.EW2OO7Cw-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505161519.EW2OO7Cw-lkp@intel.com/

smatch warnings:
fs/f2fs/super.c:858 f2fs_parse_param() warn: impossible condition '(result.int_32 > ((~0 >> 1))) => (s32min-s32max > s32max)'

vim +858 fs/f2fs/super.c

3fde13f817e23f Chao Yu          2021-01-22   710  
33c0363d5e5bbd Hongbo Li        2025-04-23   711  static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
696c018c7718f5 Namjae Jeon      2013-06-16   712  {
419819cc34ee43 Hongbo Li        2025-04-23   713  	struct f2fs_fs_context *ctx = fc->fs_private;
1f0b067b6e4927 Chao Yu          2020-07-29   714  #ifdef CONFIG_F2FS_FS_COMPRESSION
4c8ff7095bef64 Chao Yu          2019-11-01   715  	unsigned char (*ext)[F2FS_EXTENSION_LEN];
151b1982be5d9f Fengnan Chang    2021-06-08   716  	unsigned char (*noext)[F2FS_EXTENSION_LEN];
151b1982be5d9f Fengnan Chang    2021-06-08   717  	int ext_cnt, noext_cnt;
d829bc9eace9cc Hongbo Li        2025-04-23   718  	char *name;
1f0b067b6e4927 Chao Yu          2020-07-29   719  #endif
d829bc9eace9cc Hongbo Li        2025-04-23   720  	substring_t args[MAX_OPT_ARGS];
d829bc9eace9cc Hongbo Li        2025-04-23   721  	struct fs_parse_result result;
d829bc9eace9cc Hongbo Li        2025-04-23   722  	int token, ret, arg;
696c018c7718f5 Namjae Jeon      2013-06-16   723  
d829bc9eace9cc Hongbo Li        2025-04-23   724  	token = fs_parse(fc, f2fs_param_specs, param, &result);
d829bc9eace9cc Hongbo Li        2025-04-23   725  	if (token < 0)
d829bc9eace9cc Hongbo Li        2025-04-23   726  		return token;
5f029c045c948b Yi Zhuang        2021-04-06   727  
696c018c7718f5 Namjae Jeon      2013-06-16   728  	switch (token) {
696c018c7718f5 Namjae Jeon      2013-06-16   729  	case Opt_gc_background:
419819cc34ee43 Hongbo Li        2025-04-23   730  		F2FS_CTX_INFO(ctx).bggc_mode = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23   731  		ctx->spec_mask |= F2FS_SPEC_background_gc;
696c018c7718f5 Namjae Jeon      2013-06-16   732  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   733  	case Opt_disable_roll_forward:
419819cc34ee43 Hongbo Li        2025-04-23   734  		ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_ROLL_FORWARD);
696c018c7718f5 Namjae Jeon      2013-06-16   735  		break;
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23   736  	case Opt_norecovery:
d829bc9eace9cc Hongbo Li        2025-04-23   737  		/* requires ro mount, checked in f2fs_validate_options */
419819cc34ee43 Hongbo Li        2025-04-23   738  		ctx_set_opt(ctx, F2FS_MOUNT_NORECOVERY);
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23   739  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   740  	case Opt_discard:
5cefc0eae8b492 Hongbo Li        2025-04-23   741  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   742  			ctx_clear_opt(ctx, F2FS_MOUNT_DISCARD);
5cefc0eae8b492 Hongbo Li        2025-04-23   743  		else
419819cc34ee43 Hongbo Li        2025-04-23   744  			ctx_set_opt(ctx, F2FS_MOUNT_DISCARD);
487df616dec332 Damien Le Moal   2016-10-28   745  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   746  	case Opt_noheap:
7a20b8a61eff81 Jaegeuk Kim      2017-03-24   747  	case Opt_heap:
45385082b789b3 Hongbo Li        2025-04-23   748  		f2fs_warn(NULL, "heap/no_heap options were deprecated");
7a20b8a61eff81 Jaegeuk Kim      2017-03-24   749  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   750  #ifdef CONFIG_F2FS_FS_XATTR
4058c5117d6d8a Kelly Anderson   2013-10-07   751  	case Opt_user_xattr:
d829bc9eace9cc Hongbo Li        2025-04-23   752  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   753  			ctx_clear_opt(ctx, F2FS_MOUNT_XATTR_USER);
d829bc9eace9cc Hongbo Li        2025-04-23   754  		else
419819cc34ee43 Hongbo Li        2025-04-23   755  			ctx_set_opt(ctx, F2FS_MOUNT_XATTR_USER);
696c018c7718f5 Namjae Jeon      2013-06-16   756  		break;
444c580f7e9ad2 Jaegeuk Kim      2013-08-08   757  	case Opt_inline_xattr:
d829bc9eace9cc Hongbo Li        2025-04-23   758  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   759  			ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_XATTR);
d829bc9eace9cc Hongbo Li        2025-04-23   760  		else
419819cc34ee43 Hongbo Li        2025-04-23   761  			ctx_set_opt(ctx, F2FS_MOUNT_INLINE_XATTR);
23cf7212a1cae2 Chao Yu          2017-02-15   762  		break;
6afc662e68b5f9 Chao Yu          2017-09-06   763  	case Opt_inline_xattr_size:
5cefc0eae8b492 Hongbo Li        2025-04-23   764  		if (result.int_32 < MIN_INLINE_XATTR_SIZE ||
5cefc0eae8b492 Hongbo Li        2025-04-23   765  			result.int_32 > MAX_INLINE_XATTR_SIZE) {
5cefc0eae8b492 Hongbo Li        2025-04-23   766  			f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
5cefc0eae8b492 Hongbo Li        2025-04-23   767  				MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
5cefc0eae8b492 Hongbo Li        2025-04-23   768  			return -EINVAL;
5cefc0eae8b492 Hongbo Li        2025-04-23   769  		}
419819cc34ee43 Hongbo Li        2025-04-23   770  		ctx_set_opt(ctx, F2FS_MOUNT_INLINE_XATTR_SIZE);
419819cc34ee43 Hongbo Li        2025-04-23   771  		F2FS_CTX_INFO(ctx).inline_xattr_size = result.int_32;
419819cc34ee43 Hongbo Li        2025-04-23   772  		ctx->spec_mask |= F2FS_SPEC_inline_xattr_size;
6afc662e68b5f9 Chao Yu          2017-09-06   773  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   774  #else
4058c5117d6d8a Kelly Anderson   2013-10-07   775  	case Opt_user_xattr:
444c580f7e9ad2 Jaegeuk Kim      2013-08-08   776  	case Opt_inline_xattr:
277352b6cbeda5 Eric Sandeen     2025-03-03   777  	case Opt_inline_xattr_size:
45385082b789b3 Hongbo Li        2025-04-23   778  		f2fs_info(NULL, "%s options not supported", param->key);
23cf7212a1cae2 Chao Yu          2017-02-15   779  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   780  #endif
696c018c7718f5 Namjae Jeon      2013-06-16   781  #ifdef CONFIG_F2FS_FS_POSIX_ACL
4058c5117d6d8a Kelly Anderson   2013-10-07   782  	case Opt_acl:
d829bc9eace9cc Hongbo Li        2025-04-23   783  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   784  			ctx_clear_opt(ctx, F2FS_MOUNT_POSIX_ACL);
d829bc9eace9cc Hongbo Li        2025-04-23   785  		else
419819cc34ee43 Hongbo Li        2025-04-23   786  			ctx_set_opt(ctx, F2FS_MOUNT_POSIX_ACL);
696c018c7718f5 Namjae Jeon      2013-06-16   787  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   788  #else
4058c5117d6d8a Kelly Anderson   2013-10-07   789  	case Opt_acl:
45385082b789b3 Hongbo Li        2025-04-23   790  		f2fs_info(NULL, "%s options not supported", param->key);
696c018c7718f5 Namjae Jeon      2013-06-16   791  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   792  #endif
696c018c7718f5 Namjae Jeon      2013-06-16   793  	case Opt_active_logs:
d829bc9eace9cc Hongbo Li        2025-04-23   794  		if (result.int_32 != 2 && result.int_32 != 4 &&
d829bc9eace9cc Hongbo Li        2025-04-23   795  			result.int_32 != NR_CURSEG_PERSIST_TYPE)
696c018c7718f5 Namjae Jeon      2013-06-16   796  			return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23   797  		ctx->spec_mask |= F2FS_SPEC_active_logs;
419819cc34ee43 Hongbo Li        2025-04-23   798  		F2FS_CTX_INFO(ctx).active_logs = result.int_32;
696c018c7718f5 Namjae Jeon      2013-06-16   799  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   800  	case Opt_disable_ext_identify:
419819cc34ee43 Hongbo Li        2025-04-23   801  		ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_EXT_IDENTIFY);
696c018c7718f5 Namjae Jeon      2013-06-16   802  		break;
8274de77b7072d Huajun Li        2013-11-10   803  	case Opt_inline_data:
d829bc9eace9cc Hongbo Li        2025-04-23   804  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   805  			ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_DATA);
d829bc9eace9cc Hongbo Li        2025-04-23   806  		else
419819cc34ee43 Hongbo Li        2025-04-23   807  			ctx_set_opt(ctx, F2FS_MOUNT_INLINE_DATA);
8274de77b7072d Huajun Li        2013-11-10   808  		break;
5efd3c6f1be9cf Chao Yu          2014-09-24   809  	case Opt_inline_dentry:
d829bc9eace9cc Hongbo Li        2025-04-23   810  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   811  			ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_DENTRY);
d829bc9eace9cc Hongbo Li        2025-04-23   812  		else
419819cc34ee43 Hongbo Li        2025-04-23   813  			ctx_set_opt(ctx, F2FS_MOUNT_INLINE_DENTRY);
97c1794a5dc160 Chao Yu          2016-05-09   814  		break;
6b4afdd794783f Jaegeuk Kim      2014-04-02   815  	case Opt_flush_merge:
d829bc9eace9cc Hongbo Li        2025-04-23   816  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   817  			ctx_clear_opt(ctx, F2FS_MOUNT_FLUSH_MERGE);
d829bc9eace9cc Hongbo Li        2025-04-23   818  		else
419819cc34ee43 Hongbo Li        2025-04-23   819  			ctx_set_opt(ctx, F2FS_MOUNT_FLUSH_MERGE);
0f7b2abd188089 Jaegeuk Kim      2014-07-23   820  		break;
6047de5482c33d Yangtao Li       2022-10-25   821  	case Opt_barrier:
d829bc9eace9cc Hongbo Li        2025-04-23   822  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   823  			ctx_set_opt(ctx, F2FS_MOUNT_NOBARRIER);
d829bc9eace9cc Hongbo Li        2025-04-23   824  		else
419819cc34ee43 Hongbo Li        2025-04-23   825  			ctx_clear_opt(ctx, F2FS_MOUNT_NOBARRIER);
6047de5482c33d Yangtao Li       2022-10-25   826  		break;
d5053a34a9cc79 Jaegeuk Kim      2014-10-30   827  	case Opt_fastboot:
419819cc34ee43 Hongbo Li        2025-04-23   828  		ctx_set_opt(ctx, F2FS_MOUNT_FASTBOOT);
d5053a34a9cc79 Jaegeuk Kim      2014-10-30   829  		break;
8967215954a509 Chao Yu          2015-02-05   830  	case Opt_extent_cache:
5cefc0eae8b492 Hongbo Li        2025-04-23   831  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   832  			ctx_clear_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE);
5cefc0eae8b492 Hongbo Li        2025-04-23   833  		else
419819cc34ee43 Hongbo Li        2025-04-23   834  			ctx_set_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE);
75342797988a0f Wanpeng Li       2015-03-24   835  		break;
343f40f0a70eb7 Chao Yu          2015-12-16   836  	case Opt_data_flush:
419819cc34ee43 Hongbo Li        2025-04-23   837  		ctx_set_opt(ctx, F2FS_MOUNT_DATA_FLUSH);
343f40f0a70eb7 Chao Yu          2015-12-16   838  		break;
7e65be49ed94f8 Jaegeuk Kim      2017-12-27   839  	case Opt_reserve_root:
419819cc34ee43 Hongbo Li        2025-04-23   840  		ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
419819cc34ee43 Hongbo Li        2025-04-23   841  		F2FS_CTX_INFO(ctx).root_reserved_blocks = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23   842  		ctx->spec_mask |= F2FS_SPEC_reserve_root;
7e65be49ed94f8 Jaegeuk Kim      2017-12-27   843  		break;
7c2e59632b846a Jaegeuk Kim      2018-01-04   844  	case Opt_resuid:
419819cc34ee43 Hongbo Li        2025-04-23   845  		F2FS_CTX_INFO(ctx).s_resuid = result.uid;
419819cc34ee43 Hongbo Li        2025-04-23   846  		ctx->spec_mask |= F2FS_SPEC_resuid;
7c2e59632b846a Jaegeuk Kim      2018-01-04   847  		break;
7c2e59632b846a Jaegeuk Kim      2018-01-04   848  	case Opt_resgid:
419819cc34ee43 Hongbo Li        2025-04-23   849  		F2FS_CTX_INFO(ctx).s_resgid = result.gid;
419819cc34ee43 Hongbo Li        2025-04-23   850  		ctx->spec_mask |= F2FS_SPEC_resgid;
7c2e59632b846a Jaegeuk Kim      2018-01-04   851  		break;
36abef4e796d38 Jaegeuk Kim      2016-06-03   852  	case Opt_mode:
419819cc34ee43 Hongbo Li        2025-04-23   853  		F2FS_CTX_INFO(ctx).fs_mode = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23   854  		ctx->spec_mask |= F2FS_SPEC_mode;
36abef4e796d38 Jaegeuk Kim      2016-06-03   855  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   856  #ifdef CONFIG_F2FS_FAULT_INJECTION
73faec4d99358b Jaegeuk Kim      2016-04-29   857  	case Opt_fault_injection:
5cefc0eae8b492 Hongbo Li        2025-04-23  @858  		if (result.int_32 > INT_MAX)
4ed886b187f474 Chao Yu          2024-05-07   859  			return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23   860  		F2FS_CTX_INFO(ctx).fault_info.inject_rate = result.int_32;
419819cc34ee43 Hongbo Li        2025-04-23   861  		ctx->spec_mask |= F2FS_SPEC_fault_injection;
419819cc34ee43 Hongbo Li        2025-04-23   862  		ctx_set_opt(ctx, F2FS_MOUNT_FAULT_INJECTION);
d494500a704342 Chao Yu          2018-08-08   863  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   864  
d494500a704342 Chao Yu          2018-08-08   865  	case Opt_fault_type:
5cefc0eae8b492 Hongbo Li        2025-04-23   866  		if (result.uint_32 > BIT(FAULT_MAX))
4ed886b187f474 Chao Yu          2024-05-07   867  			return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23   868  		F2FS_CTX_INFO(ctx).fault_info.inject_type = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23   869  		ctx->spec_mask |= F2FS_SPEC_fault_type;
419819cc34ee43 Hongbo Li        2025-04-23   870  		ctx_set_opt(ctx, F2FS_MOUNT_FAULT_INJECTION);
4cb037ec3f754f Chengguang Xu    2018-09-12   871  		break;
73faec4d99358b Jaegeuk Kim      2016-04-29   872  #else
4cb037ec3f754f Chengguang Xu    2018-09-12   873  	case Opt_fault_injection:
4cb037ec3f754f Chengguang Xu    2018-09-12   874  	case Opt_fault_type:
45385082b789b3 Hongbo Li        2025-04-23   875  		f2fs_info(NULL, "%s options not supported", param->key);
4cb037ec3f754f Chengguang Xu    2018-09-12   876  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   877  #endif
acff9409dd40be Jaegeuk Kim      2024-11-12   878  	case Opt_lazytime:
d829bc9eace9cc Hongbo Li        2025-04-23   879  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23   880  			ctx_clear_opt(ctx, F2FS_MOUNT_LAZYTIME);
d829bc9eace9cc Hongbo Li        2025-04-23   881  		else
419819cc34ee43 Hongbo Li        2025-04-23   882  			ctx_set_opt(ctx, F2FS_MOUNT_LAZYTIME);
acff9409dd40be Jaegeuk Kim      2024-11-12   883  		break;
0abd675e97e60d Chao Yu          2017-07-09   884  #ifdef CONFIG_QUOTA
4b2414d04e9912 Chao Yu          2017-08-08   885  	case Opt_quota:
d829bc9eace9cc Hongbo Li        2025-04-23   886  		if (result.negated) {
419819cc34ee43 Hongbo Li        2025-04-23   887  			ctx_clear_opt(ctx, F2FS_MOUNT_QUOTA);
419819cc34ee43 Hongbo Li        2025-04-23   888  			ctx_clear_opt(ctx, F2FS_MOUNT_USRQUOTA);
419819cc34ee43 Hongbo Li        2025-04-23   889  			ctx_clear_opt(ctx, F2FS_MOUNT_GRPQUOTA);
419819cc34ee43 Hongbo Li        2025-04-23   890  			ctx_clear_opt(ctx, F2FS_MOUNT_PRJQUOTA);
d829bc9eace9cc Hongbo Li        2025-04-23   891  		} else
419819cc34ee43 Hongbo Li        2025-04-23   892  			ctx_set_opt(ctx, F2FS_MOUNT_USRQUOTA);
d829bc9eace9cc Hongbo Li        2025-04-23   893  		break;
0abd675e97e60d Chao Yu          2017-07-09   894  	case Opt_usrquota:
419819cc34ee43 Hongbo Li        2025-04-23   895  		ctx_set_opt(ctx, F2FS_MOUNT_USRQUOTA);
0abd675e97e60d Chao Yu          2017-07-09   896  		break;
0abd675e97e60d Chao Yu          2017-07-09   897  	case Opt_grpquota:
419819cc34ee43 Hongbo Li        2025-04-23   898  		ctx_set_opt(ctx, F2FS_MOUNT_GRPQUOTA);
0abd675e97e60d Chao Yu          2017-07-09   899  		break;
5c57132eaf5265 Chao Yu          2017-07-26   900  	case Opt_prjquota:
419819cc34ee43 Hongbo Li        2025-04-23   901  		ctx_set_opt(ctx, F2FS_MOUNT_PRJQUOTA);
5c57132eaf5265 Chao Yu          2017-07-26   902  		break;
4b2414d04e9912 Chao Yu          2017-08-08   903  	case Opt_usrjquota:
d829bc9eace9cc Hongbo Li        2025-04-23   904  		if (!*param->string)
419819cc34ee43 Hongbo Li        2025-04-23   905  			ret = f2fs_unnote_qf_name(fc, USRQUOTA);
d829bc9eace9cc Hongbo Li        2025-04-23   906  		else
419819cc34ee43 Hongbo Li        2025-04-23   907  			ret = f2fs_note_qf_name(fc, USRQUOTA, param);
4b2414d04e9912 Chao Yu          2017-08-08   908  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   909  			return ret;
4b2414d04e9912 Chao Yu          2017-08-08   910  		break;
d829bc9eace9cc Hongbo Li        2025-04-23   911  	case Opt_grpjquota:
d829bc9eace9cc Hongbo Li        2025-04-23   912  		if (!*param->string)
419819cc34ee43 Hongbo Li        2025-04-23   913  			ret = f2fs_unnote_qf_name(fc, GRPQUOTA);
d829bc9eace9cc Hongbo Li        2025-04-23   914  		else
419819cc34ee43 Hongbo Li        2025-04-23   915  			ret = f2fs_note_qf_name(fc, GRPQUOTA, param);
4b2414d04e9912 Chao Yu          2017-08-08   916  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   917  			return ret;
4b2414d04e9912 Chao Yu          2017-08-08   918  		break;
d829bc9eace9cc Hongbo Li        2025-04-23   919  	case Opt_prjjquota:
d829bc9eace9cc Hongbo Li        2025-04-23   920  		if (!*param->string)
419819cc34ee43 Hongbo Li        2025-04-23   921  			ret = f2fs_unnote_qf_name(fc, PRJQUOTA);
d829bc9eace9cc Hongbo Li        2025-04-23   922  		else
419819cc34ee43 Hongbo Li        2025-04-23   923  			ret = f2fs_note_qf_name(fc, PRJQUOTA, param);
4b2414d04e9912 Chao Yu          2017-08-08   924  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   925  			return ret;
4b2414d04e9912 Chao Yu          2017-08-08   926  		break;
d829bc9eace9cc Hongbo Li        2025-04-23   927  	case Opt_jqfmt:
419819cc34ee43 Hongbo Li        2025-04-23   928  		F2FS_CTX_INFO(ctx).s_jquota_fmt = result.int_32;
419819cc34ee43 Hongbo Li        2025-04-23   929  		ctx->spec_mask |= F2FS_SPEC_jqfmt;
4b2414d04e9912 Chao Yu          2017-08-08   930  		break;
0abd675e97e60d Chao Yu          2017-07-09   931  #else
4b2414d04e9912 Chao Yu          2017-08-08   932  	case Opt_quota:
0abd675e97e60d Chao Yu          2017-07-09   933  	case Opt_usrquota:
0abd675e97e60d Chao Yu          2017-07-09   934  	case Opt_grpquota:
5c57132eaf5265 Chao Yu          2017-07-26   935  	case Opt_prjquota:
4b2414d04e9912 Chao Yu          2017-08-08   936  	case Opt_usrjquota:
4b2414d04e9912 Chao Yu          2017-08-08   937  	case Opt_grpjquota:
4b2414d04e9912 Chao Yu          2017-08-08   938  	case Opt_prjjquota:
45385082b789b3 Hongbo Li        2025-04-23   939  		f2fs_info(NULL, "quota operations not supported");
0abd675e97e60d Chao Yu          2017-07-09   940  		break;
0abd675e97e60d Chao Yu          2017-07-09   941  #endif
079396270b0f1e Jaegeuk Kim      2018-02-18   942  	case Opt_alloc:
419819cc34ee43 Hongbo Li        2025-04-23   943  		F2FS_CTX_INFO(ctx).alloc_mode = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23   944  		ctx->spec_mask |= F2FS_SPEC_alloc_mode;
079396270b0f1e Jaegeuk Kim      2018-02-18   945  		break;
93cf93f17c8ef7 Junling Zheng    2018-03-07   946  	case Opt_fsync:
419819cc34ee43 Hongbo Li        2025-04-23   947  		F2FS_CTX_INFO(ctx).fsync_mode = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23   948  		ctx->spec_mask |= F2FS_SPEC_fsync_mode;
93cf93f17c8ef7 Junling Zheng    2018-03-07   949  		break;
ff62af200b94e0 Sheng Yong       2018-03-15   950  	case Opt_test_dummy_encryption:
419819cc34ee43 Hongbo Li        2025-04-23   951  		ret = f2fs_parse_test_dummy_encryption(param, ctx);
ed318a6cc0b620 Eric Biggers     2020-05-12   952  		if (ret)
ed318a6cc0b620 Eric Biggers     2020-05-12   953  			return ret;
ff62af200b94e0 Sheng Yong       2018-03-15   954  		break;
27aacd28ea3b89 Satya Tangirala  2020-07-02   955  	case Opt_inlinecrypt:
27aacd28ea3b89 Satya Tangirala  2020-07-02   956  #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
419819cc34ee43 Hongbo Li        2025-04-23   957  		ctx_set_opt(ctx, F2FS_MOUNT_INLINECRYPT);
27aacd28ea3b89 Satya Tangirala  2020-07-02   958  #else
45385082b789b3 Hongbo Li        2025-04-23   959  		f2fs_info(NULL, "inline encryption not supported");
27aacd28ea3b89 Satya Tangirala  2020-07-02   960  #endif
27aacd28ea3b89 Satya Tangirala  2020-07-02   961  		break;
d829bc9eace9cc Hongbo Li        2025-04-23   962  	case Opt_checkpoint:
d829bc9eace9cc Hongbo Li        2025-04-23   963  		/*
d829bc9eace9cc Hongbo Li        2025-04-23   964  		 * Initialize args struct so we know whether arg was
d829bc9eace9cc Hongbo Li        2025-04-23   965  		 * found; some options take optional arguments.
d829bc9eace9cc Hongbo Li        2025-04-23   966  		 */
d829bc9eace9cc Hongbo Li        2025-04-23   967  		args[0].from = args[0].to = NULL;
d829bc9eace9cc Hongbo Li        2025-04-23   968  		arg = 0;
d829bc9eace9cc Hongbo Li        2025-04-23   969  
d829bc9eace9cc Hongbo Li        2025-04-23   970  		/* revert to match_table for checkpoint= options */
d829bc9eace9cc Hongbo Li        2025-04-23   971  		token = match_token(param->string, f2fs_checkpoint_tokens, args);
d829bc9eace9cc Hongbo Li        2025-04-23   972  		switch (token) {
4d3aed70902f29 Daniel Rosenberg 2019-05-29   973  		case Opt_checkpoint_disable_cap_perc:
4d3aed70902f29 Daniel Rosenberg 2019-05-29   974  			if (args->from && match_int(args, &arg))
4d3aed70902f29 Daniel Rosenberg 2019-05-29   975  				return -EINVAL;
4d3aed70902f29 Daniel Rosenberg 2019-05-29   976  			if (arg < 0 || arg > 100)
4d3aed70902f29 Daniel Rosenberg 2019-05-29   977  				return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23   978  			F2FS_CTX_INFO(ctx).unusable_cap_perc = arg;
419819cc34ee43 Hongbo Li        2025-04-23   979  			ctx->spec_mask |= F2FS_SPEC_checkpoint_disable_cap_perc;
419819cc34ee43 Hongbo Li        2025-04-23   980  			ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29   981  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29   982  		case Opt_checkpoint_disable_cap:
4d3aed70902f29 Daniel Rosenberg 2019-05-29   983  			if (args->from && match_int(args, &arg))
4354994f097d06 Daniel Rosenberg 2018-08-20   984  				return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23   985  			F2FS_CTX_INFO(ctx).unusable_cap = arg;
419819cc34ee43 Hongbo Li        2025-04-23   986  			ctx->spec_mask |= F2FS_SPEC_checkpoint_disable_cap;
419819cc34ee43 Hongbo Li        2025-04-23   987  			ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29   988  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29   989  		case Opt_checkpoint_disable:
419819cc34ee43 Hongbo Li        2025-04-23   990  			ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29   991  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29   992  		case Opt_checkpoint_enable:
419819cc34ee43 Hongbo Li        2025-04-23   993  			ctx_clear_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
4354994f097d06 Daniel Rosenberg 2018-08-20   994  			break;
d829bc9eace9cc Hongbo Li        2025-04-23   995  		default:
d829bc9eace9cc Hongbo Li        2025-04-23   996  			return -EINVAL;
d829bc9eace9cc Hongbo Li        2025-04-23   997  		}
261eeb9c1585de Daeho Jeong      2021-01-19   998  		break;
d829bc9eace9cc Hongbo Li        2025-04-23   999  	case Opt_checkpoint_merge:
d829bc9eace9cc Hongbo Li        2025-04-23  1000  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23  1001  			ctx_clear_opt(ctx, F2FS_MOUNT_MERGE_CHECKPOINT);
d829bc9eace9cc Hongbo Li        2025-04-23  1002  		else
419819cc34ee43 Hongbo Li        2025-04-23  1003  			ctx_set_opt(ctx, F2FS_MOUNT_MERGE_CHECKPOINT);
261eeb9c1585de Daeho Jeong      2021-01-19  1004  		break;
1f0b067b6e4927 Chao Yu          2020-07-29  1005  #ifdef CONFIG_F2FS_FS_COMPRESSION
4c8ff7095bef64 Chao Yu          2019-11-01  1006  	case Opt_compress_algorithm:
d829bc9eace9cc Hongbo Li        2025-04-23  1007  		name = param->string;
3c57f75182452c Eric Biggers     2020-05-01  1008  		if (!strcmp(name, "lzo")) {
32be0e97c71366 Chao Yu          2021-01-22  1009  #ifdef CONFIG_F2FS_FS_LZO
419819cc34ee43 Hongbo Li        2025-04-23  1010  			F2FS_CTX_INFO(ctx).compress_level = 0;
419819cc34ee43 Hongbo Li        2025-04-23  1011  			F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZO;
419819cc34ee43 Hongbo Li        2025-04-23  1012  			ctx->spec_mask |= F2FS_SPEC_compress_level;
419819cc34ee43 Hongbo Li        2025-04-23  1013  			ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
32be0e97c71366 Chao Yu          2021-01-22  1014  #else
45385082b789b3 Hongbo Li        2025-04-23  1015  			f2fs_info(NULL, "kernel doesn't support lzo compression");
32be0e97c71366 Chao Yu          2021-01-22  1016  #endif
3fde13f817e23f Chao Yu          2021-01-22  1017  		} else if (!strncmp(name, "lz4", 3)) {
32be0e97c71366 Chao Yu          2021-01-22  1018  #ifdef CONFIG_F2FS_FS_LZ4
419819cc34ee43 Hongbo Li        2025-04-23  1019  			ret = f2fs_set_lz4hc_level(ctx, name);
d829bc9eace9cc Hongbo Li        2025-04-23  1020  			if (ret)
3fde13f817e23f Chao Yu          2021-01-22  1021  				return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23  1022  			F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZ4;
419819cc34ee43 Hongbo Li        2025-04-23  1023  			ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
32be0e97c71366 Chao Yu          2021-01-22  1024  #else
45385082b789b3 Hongbo Li        2025-04-23  1025  			f2fs_info(NULL, "kernel doesn't support lz4 compression");
32be0e97c71366 Chao Yu          2021-01-22  1026  #endif
3fde13f817e23f Chao Yu          2021-01-22  1027  		} else if (!strncmp(name, "zstd", 4)) {
32be0e97c71366 Chao Yu          2021-01-22  1028  #ifdef CONFIG_F2FS_FS_ZSTD
419819cc34ee43 Hongbo Li        2025-04-23  1029  			ret = f2fs_set_zstd_level(ctx, name);
d829bc9eace9cc Hongbo Li        2025-04-23  1030  			if (ret)
3fde13f817e23f Chao Yu          2021-01-22  1031  				return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23  1032  			F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_ZSTD;
419819cc34ee43 Hongbo Li        2025-04-23  1033  			ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
32be0e97c71366 Chao Yu          2021-01-22  1034  #else
45385082b789b3 Hongbo Li        2025-04-23  1035  			f2fs_info(NULL, "kernel doesn't support zstd compression");
32be0e97c71366 Chao Yu          2021-01-22  1036  #endif
6d92b201035dfe Chao Yu          2020-04-08  1037  		} else if (!strcmp(name, "lzo-rle")) {
32be0e97c71366 Chao Yu          2021-01-22  1038  #ifdef CONFIG_F2FS_FS_LZORLE
419819cc34ee43 Hongbo Li        2025-04-23  1039  			F2FS_CTX_INFO(ctx).compress_level = 0;
419819cc34ee43 Hongbo Li        2025-04-23  1040  			F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZORLE;
419819cc34ee43 Hongbo Li        2025-04-23  1041  			ctx->spec_mask |= F2FS_SPEC_compress_level;
419819cc34ee43 Hongbo Li        2025-04-23  1042  			ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
32be0e97c71366 Chao Yu          2021-01-22  1043  #else
45385082b789b3 Hongbo Li        2025-04-23  1044  			f2fs_info(NULL, "kernel doesn't support lzorle compression");
32be0e97c71366 Chao Yu          2021-01-22  1045  #endif
d829bc9eace9cc Hongbo Li        2025-04-23  1046  		} else
4c8ff7095bef64 Chao Yu          2019-11-01  1047  			return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  1048  		break;
4c8ff7095bef64 Chao Yu          2019-11-01  1049  	case Opt_compress_log_size:
d829bc9eace9cc Hongbo Li        2025-04-23  1050  		if (result.uint_32 < MIN_COMPRESS_LOG_SIZE ||
d829bc9eace9cc Hongbo Li        2025-04-23  1051  		    result.uint_32 > MAX_COMPRESS_LOG_SIZE) {
45385082b789b3 Hongbo Li        2025-04-23  1052  			f2fs_err(NULL,
4c8ff7095bef64 Chao Yu          2019-11-01  1053  				"Compress cluster log size is out of range");
4c8ff7095bef64 Chao Yu          2019-11-01  1054  			return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  1055  		}
419819cc34ee43 Hongbo Li        2025-04-23  1056  		F2FS_CTX_INFO(ctx).compress_log_size = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23  1057  		ctx->spec_mask |= F2FS_SPEC_compress_log_size;
4c8ff7095bef64 Chao Yu          2019-11-01  1058  		break;
4c8ff7095bef64 Chao Yu          2019-11-01  1059  	case Opt_compress_extension:
d829bc9eace9cc Hongbo Li        2025-04-23  1060  		name = param->string;
419819cc34ee43 Hongbo Li        2025-04-23  1061  		ext = F2FS_CTX_INFO(ctx).extensions;
419819cc34ee43 Hongbo Li        2025-04-23  1062  		ext_cnt = F2FS_CTX_INFO(ctx).compress_ext_cnt;
4c8ff7095bef64 Chao Yu          2019-11-01  1063  
4c8ff7095bef64 Chao Yu          2019-11-01  1064  		if (strlen(name) >= F2FS_EXTENSION_LEN ||
4c8ff7095bef64 Chao Yu          2019-11-01  1065  		    ext_cnt >= COMPRESS_EXT_NUM) {
45385082b789b3 Hongbo Li        2025-04-23  1066  			f2fs_err(NULL, "invalid extension length/number");
4c8ff7095bef64 Chao Yu          2019-11-01  1067  			return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  1068  		}
4c8ff7095bef64 Chao Yu          2019-11-01  1069  
419819cc34ee43 Hongbo Li        2025-04-23  1070  		if (is_compress_extension_exist(&ctx->info, name, true))
7e1b150fece033 Chao Yu          2023-08-28  1071  			break;
7e1b150fece033 Chao Yu          2023-08-28  1072  
d829bc9eace9cc Hongbo Li        2025-04-23  1073  		ret = strscpy(ext[ext_cnt], name, F2FS_EXTENSION_LEN);
d829bc9eace9cc Hongbo Li        2025-04-23  1074  		if (ret < 0)
789ca0eb47f778 Daniel Yang      2024-11-17  1075  			return ret;
419819cc34ee43 Hongbo Li        2025-04-23  1076  		F2FS_CTX_INFO(ctx).compress_ext_cnt++;
419819cc34ee43 Hongbo Li        2025-04-23  1077  		ctx->spec_mask |= F2FS_SPEC_compress_extension;
4c8ff7095bef64 Chao Yu          2019-11-01  1078  		break;
151b1982be5d9f Fengnan Chang    2021-06-08  1079  	case Opt_nocompress_extension:
d829bc9eace9cc Hongbo Li        2025-04-23  1080  		name = param->string;
419819cc34ee43 Hongbo Li        2025-04-23  1081  		noext = F2FS_CTX_INFO(ctx).noextensions;
419819cc34ee43 Hongbo Li        2025-04-23  1082  		noext_cnt = F2FS_CTX_INFO(ctx).nocompress_ext_cnt;
151b1982be5d9f Fengnan Chang    2021-06-08  1083  
151b1982be5d9f Fengnan Chang    2021-06-08  1084  		if (strlen(name) >= F2FS_EXTENSION_LEN ||
151b1982be5d9f Fengnan Chang    2021-06-08  1085  			noext_cnt >= COMPRESS_EXT_NUM) {
45385082b789b3 Hongbo Li        2025-04-23  1086  			f2fs_err(NULL, "invalid extension length/number");
151b1982be5d9f Fengnan Chang    2021-06-08  1087  			return -EINVAL;
151b1982be5d9f Fengnan Chang    2021-06-08  1088  		}
151b1982be5d9f Fengnan Chang    2021-06-08  1089  
419819cc34ee43 Hongbo Li        2025-04-23  1090  		if (is_compress_extension_exist(&ctx->info, name, false))
7e1b150fece033 Chao Yu          2023-08-28  1091  			break;
7e1b150fece033 Chao Yu          2023-08-28  1092  
d829bc9eace9cc Hongbo Li        2025-04-23  1093  		ret = strscpy(noext[noext_cnt], name, F2FS_EXTENSION_LEN);
d829bc9eace9cc Hongbo Li        2025-04-23  1094  		if (ret < 0)
789ca0eb47f778 Daniel Yang      2024-11-17  1095  			return ret;
419819cc34ee43 Hongbo Li        2025-04-23  1096  		F2FS_CTX_INFO(ctx).nocompress_ext_cnt++;
419819cc34ee43 Hongbo Li        2025-04-23  1097  		ctx->spec_mask |= F2FS_SPEC_nocompress_extension;
151b1982be5d9f Fengnan Chang    2021-06-08  1098  		break;
b28f047b28c51d Chao Yu          2020-11-26  1099  	case Opt_compress_chksum:
419819cc34ee43 Hongbo Li        2025-04-23  1100  		F2FS_CTX_INFO(ctx).compress_chksum = true;
419819cc34ee43 Hongbo Li        2025-04-23  1101  		ctx->spec_mask |= F2FS_SPEC_compress_chksum;
b28f047b28c51d Chao Yu          2020-11-26  1102  		break;
602a16d58e9aab Daeho Jeong      2020-12-01  1103  	case Opt_compress_mode:
419819cc34ee43 Hongbo Li        2025-04-23  1104  		F2FS_CTX_INFO(ctx).compress_mode = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23  1105  		ctx->spec_mask |= F2FS_SPEC_compress_mode;
602a16d58e9aab Daeho Jeong      2020-12-01  1106  		break;
6ce19aff0b8cd3 Chao Yu          2021-05-20  1107  	case Opt_compress_cache:
419819cc34ee43 Hongbo Li        2025-04-23  1108  		ctx_set_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE);
6ce19aff0b8cd3 Chao Yu          2021-05-20  1109  		break;
1f0b067b6e4927 Chao Yu          2020-07-29  1110  #else
1f0b067b6e4927 Chao Yu          2020-07-29  1111  	case Opt_compress_algorithm:
1f0b067b6e4927 Chao Yu          2020-07-29  1112  	case Opt_compress_log_size:
1f0b067b6e4927 Chao Yu          2020-07-29  1113  	case Opt_compress_extension:
151b1982be5d9f Fengnan Chang    2021-06-08  1114  	case Opt_nocompress_extension:
b28f047b28c51d Chao Yu          2020-11-26  1115  	case Opt_compress_chksum:
602a16d58e9aab Daeho Jeong      2020-12-01  1116  	case Opt_compress_mode:
6ce19aff0b8cd3 Chao Yu          2021-05-20  1117  	case Opt_compress_cache:
45385082b789b3 Hongbo Li        2025-04-23  1118  		f2fs_info(NULL, "compression options not supported");
1f0b067b6e4927 Chao Yu          2020-07-29  1119  		break;
1f0b067b6e4927 Chao Yu          2020-07-29  1120  #endif
093749e296e29a Chao Yu          2020-08-04  1121  	case Opt_atgc:
419819cc34ee43 Hongbo Li        2025-04-23  1122  		ctx_set_opt(ctx, F2FS_MOUNT_ATGC);
093749e296e29a Chao Yu          2020-08-04  1123  		break;
5911d2d1d1a38b Chao Yu          2021-03-27  1124  	case Opt_gc_merge:
d829bc9eace9cc Hongbo Li        2025-04-23  1125  		if (result.negated)
419819cc34ee43 Hongbo Li        2025-04-23  1126  			ctx_clear_opt(ctx, F2FS_MOUNT_GC_MERGE);
d829bc9eace9cc Hongbo Li        2025-04-23  1127  		else
419819cc34ee43 Hongbo Li        2025-04-23  1128  			ctx_set_opt(ctx, F2FS_MOUNT_GC_MERGE);
5911d2d1d1a38b Chao Yu          2021-03-27  1129  		break;
4f993264fe2965 Chao Yu          2021-08-03  1130  	case Opt_discard_unit:
419819cc34ee43 Hongbo Li        2025-04-23  1131  		F2FS_CTX_INFO(ctx).discard_unit = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23  1132  		ctx->spec_mask |= F2FS_SPEC_discard_unit;
4f993264fe2965 Chao Yu          2021-08-03  1133  		break;
7a8fc586180d8c Daeho Jeong      2022-06-20  1134  	case Opt_memory_mode:
419819cc34ee43 Hongbo Li        2025-04-23  1135  		F2FS_CTX_INFO(ctx).memory_mode = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23  1136  		ctx->spec_mask |= F2FS_SPEC_memory_mode;
7a8fc586180d8c Daeho Jeong      2022-06-20  1137  		break;
71644dff481180 Jaegeuk Kim      2022-12-01  1138  	case Opt_age_extent_cache:
419819cc34ee43 Hongbo Li        2025-04-23  1139  		ctx_set_opt(ctx, F2FS_MOUNT_AGE_EXTENT_CACHE);
71644dff481180 Jaegeuk Kim      2022-12-01  1140  		break;
b62e71be2110d8 Chao Yu          2023-04-23  1141  	case Opt_errors:
419819cc34ee43 Hongbo Li        2025-04-23  1142  		F2FS_CTX_INFO(ctx).errors = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23  1143  		ctx->spec_mask |= F2FS_SPEC_errors;
b62e71be2110d8 Chao Yu          2023-04-23  1144  		break;
c2ecba026586cd Chao Yu          2025-03-08  1145  	case Opt_nat_bits:
419819cc34ee43 Hongbo Li        2025-04-23  1146  		ctx_set_opt(ctx, F2FS_MOUNT_NAT_BITS);
c2ecba026586cd Chao Yu          2025-03-08  1147  		break;
d829bc9eace9cc Hongbo Li        2025-04-23  1148  	}
d829bc9eace9cc Hongbo Li        2025-04-23  1149  	return 0;
d829bc9eace9cc Hongbo Li        2025-04-23  1150  }
d829bc9eace9cc Hongbo Li        2025-04-23  1151  

:::::: The code at line 858 was first introduced by commit
:::::: 5cefc0eae8b492a1eaa645f11d0dbe362d8d8700 f2fs: separate the options parsing and options checking

:::::: TO: Hongbo Li <lihongbo22@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
