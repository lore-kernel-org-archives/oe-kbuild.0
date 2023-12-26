Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3739A28
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Dec 2023 01:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCTt9AnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703553926; x=1735089926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X/NGr+g2v+Y4gtk/N7IaSMO/WVexWq3aRunuNx7TtGY=;
  b=LCTt9AnFncNqiw2TdwT+jTmm1VnuvQOKO8UGz/2E5W3/XQJc2sdRd1zW
   yZF7ygxndbiwIpf+X53CW5uOU5+5sbFvVDd4MftjsNmLjRPCZ3EpOrROa
   II+RABVpdehu/KFJ1591edPtfJ5pho69PECYusQKPsamoG75S+r1MN/3Z
   EhicX/vfQXIm7M87OFYKv1YS53AaDmxAR3s/Ojkj6ZYv8Am9l3NXZk1gZ
   4nnLkJie8uCtjpBCzqavo8aOwuL6C5gw8++Ggs7sD5au1vJ6y6t8SYxrP
   DqN64/2oolpKqm1JTClWFoqlrKStqRyewBfP+LGNF+NBHiMW3/DzcCE97
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3143121"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="3143121"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 17:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="806753653"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="806753653"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Dec 2023 17:25:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHwC9-000DqF-1g;
	Tue, 26 Dec 2023 01:25:21 +0000
Date: Tue, 26 Dec 2023 09:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] btrfs: migrate to the newer memparse_safe() helper
Message-ID: <202312260953.igCSOI51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/btrfs/super.c:403:17: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <6dfa53ded887caa2269c1beeaedcff086342339a.1703324146.git.wqu@suse.com>
References: <6dfa53ded887caa2269c1beeaedcff086342339a.1703324146.git.wqu@suse.com>
TO: Qu Wenruo <wqu@suse.com>
TO: linux-btrfs@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: akpm@linux-foundation.org
TO: christophe.jaillet@wanadoo.fr
TO: andriy.shevchenko@linux.intel.com
TO: David.Laight@ACULAB.COM
TO: ddiss@suse.de

Hi Qu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20231222]
[cannot apply to akpm-mm/mm-nonmm-unstable akpm-mm/mm-everything linus/master v6.7-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/kstrtox-introduce-a-safer-version-of-memparse/20231225-151921
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/6dfa53ded887caa2269c1beeaedcff086342339a.1703324146.git.wqu%40suse.com
patch subject: [PATCH 3/3] btrfs: migrate to the newer memparse_safe() helper
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: s390-randconfig-r112-20231226 (https://download.01.org/0day-ci/archive/20231226/202312260953.igCSOI51-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231226/202312260953.igCSOI51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312260953.igCSOI51-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/super.c:403:17: sparse: sparse: typename in expression
   fs/btrfs/super.c:403:21: sparse: sparse: Expected ; at end of statement
   fs/btrfs/super.c:403:21: sparse: sparse: got ret
   fs/btrfs/super.c:403:17: sparse: sparse: undefined identifier 'int'
   fs/btrfs/super.c:405:17: sparse: sparse: undefined identifier 'ret'
   fs/btrfs/super.c:407:21: sparse: sparse: undefined identifier 'ret'
   fs/btrfs/super.c:409:32: sparse: sparse: undefined identifier 'ret'

vim +403 fs/btrfs/super.c

15ddcdd34ebfe7 Josef Bacik 2023-11-22  261  
17b3612022fe53 Josef Bacik 2023-11-22  262  static int btrfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
17b3612022fe53 Josef Bacik 2023-11-22  263  {
17b3612022fe53 Josef Bacik 2023-11-22  264  	struct btrfs_fs_context *ctx = fc->fs_private;
17b3612022fe53 Josef Bacik 2023-11-22  265  	struct fs_parse_result result;
17b3612022fe53 Josef Bacik 2023-11-22  266  	int opt;
17b3612022fe53 Josef Bacik 2023-11-22  267  
17b3612022fe53 Josef Bacik 2023-11-22  268  	opt = fs_parse(fc, btrfs_fs_parameters, param, &result);
17b3612022fe53 Josef Bacik 2023-11-22  269  	if (opt < 0)
17b3612022fe53 Josef Bacik 2023-11-22  270  		return opt;
17b3612022fe53 Josef Bacik 2023-11-22  271  
17b3612022fe53 Josef Bacik 2023-11-22  272  	switch (opt) {
17b3612022fe53 Josef Bacik 2023-11-22  273  	case Opt_degraded:
17b3612022fe53 Josef Bacik 2023-11-22  274  		btrfs_set_opt(ctx->mount_opt, DEGRADED);
17b3612022fe53 Josef Bacik 2023-11-22  275  		break;
17b3612022fe53 Josef Bacik 2023-11-22  276  	case Opt_subvol_empty:
17b3612022fe53 Josef Bacik 2023-11-22  277  		/*
17b3612022fe53 Josef Bacik 2023-11-22  278  		 * This exists because we used to allow it on accident, so we're
17b3612022fe53 Josef Bacik 2023-11-22  279  		 * keeping it to maintain ABI.  See 37becec95ac3 ("Btrfs: allow
17b3612022fe53 Josef Bacik 2023-11-22  280  		 * empty subvol= again").
17b3612022fe53 Josef Bacik 2023-11-22  281  		 */
17b3612022fe53 Josef Bacik 2023-11-22  282  		break;
17b3612022fe53 Josef Bacik 2023-11-22  283  	case Opt_subvol:
17b3612022fe53 Josef Bacik 2023-11-22  284  		kfree(ctx->subvol_name);
17b3612022fe53 Josef Bacik 2023-11-22  285  		ctx->subvol_name = kstrdup(param->string, GFP_KERNEL);
17b3612022fe53 Josef Bacik 2023-11-22  286  		if (!ctx->subvol_name)
17b3612022fe53 Josef Bacik 2023-11-22  287  			return -ENOMEM;
17b3612022fe53 Josef Bacik 2023-11-22  288  		break;
17b3612022fe53 Josef Bacik 2023-11-22  289  	case Opt_subvolid:
17b3612022fe53 Josef Bacik 2023-11-22  290  		ctx->subvol_objectid = result.uint_64;
17b3612022fe53 Josef Bacik 2023-11-22  291  
17b3612022fe53 Josef Bacik 2023-11-22  292  		/* subvolid=0 means give me the original fs_tree. */
17b3612022fe53 Josef Bacik 2023-11-22  293  		if (!ctx->subvol_objectid)
17b3612022fe53 Josef Bacik 2023-11-22  294  			ctx->subvol_objectid = BTRFS_FS_TREE_OBJECTID;
17b3612022fe53 Josef Bacik 2023-11-22  295  		break;
17b3612022fe53 Josef Bacik 2023-11-22  296  	case Opt_device: {
17b3612022fe53 Josef Bacik 2023-11-22  297  		struct btrfs_device *device;
17b3612022fe53 Josef Bacik 2023-11-22  298  		blk_mode_t mode = sb_open_mode(fc->sb_flags);
17b3612022fe53 Josef Bacik 2023-11-22  299  
17b3612022fe53 Josef Bacik 2023-11-22  300  		mutex_lock(&uuid_mutex);
17b3612022fe53 Josef Bacik 2023-11-22  301  		device = btrfs_scan_one_device(param->string, mode, false);
17b3612022fe53 Josef Bacik 2023-11-22  302  		mutex_unlock(&uuid_mutex);
17b3612022fe53 Josef Bacik 2023-11-22  303  		if (IS_ERR(device))
17b3612022fe53 Josef Bacik 2023-11-22  304  			return PTR_ERR(device);
17b3612022fe53 Josef Bacik 2023-11-22  305  		break;
17b3612022fe53 Josef Bacik 2023-11-22  306  	}
17b3612022fe53 Josef Bacik 2023-11-22  307  	case Opt_datasum:
17b3612022fe53 Josef Bacik 2023-11-22  308  		if (result.negated) {
17b3612022fe53 Josef Bacik 2023-11-22  309  			btrfs_set_opt(ctx->mount_opt, NODATASUM);
17b3612022fe53 Josef Bacik 2023-11-22  310  		} else {
17b3612022fe53 Josef Bacik 2023-11-22  311  			btrfs_clear_opt(ctx->mount_opt, NODATACOW);
17b3612022fe53 Josef Bacik 2023-11-22  312  			btrfs_clear_opt(ctx->mount_opt, NODATASUM);
17b3612022fe53 Josef Bacik 2023-11-22  313  		}
17b3612022fe53 Josef Bacik 2023-11-22  314  		break;
17b3612022fe53 Josef Bacik 2023-11-22  315  	case Opt_datacow:
17b3612022fe53 Josef Bacik 2023-11-22  316  		if (result.negated) {
17b3612022fe53 Josef Bacik 2023-11-22  317  			btrfs_clear_opt(ctx->mount_opt, COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  318  			btrfs_clear_opt(ctx->mount_opt, FORCE_COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  319  			btrfs_set_opt(ctx->mount_opt, NODATACOW);
17b3612022fe53 Josef Bacik 2023-11-22  320  			btrfs_set_opt(ctx->mount_opt, NODATASUM);
17b3612022fe53 Josef Bacik 2023-11-22  321  		} else {
17b3612022fe53 Josef Bacik 2023-11-22  322  			btrfs_clear_opt(ctx->mount_opt, NODATACOW);
17b3612022fe53 Josef Bacik 2023-11-22  323  		}
17b3612022fe53 Josef Bacik 2023-11-22  324  		break;
17b3612022fe53 Josef Bacik 2023-11-22  325  	case Opt_compress_force:
17b3612022fe53 Josef Bacik 2023-11-22  326  	case Opt_compress_force_type:
17b3612022fe53 Josef Bacik 2023-11-22  327  		btrfs_set_opt(ctx->mount_opt, FORCE_COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  328  		fallthrough;
17b3612022fe53 Josef Bacik 2023-11-22  329  	case Opt_compress:
17b3612022fe53 Josef Bacik 2023-11-22  330  	case Opt_compress_type:
17b3612022fe53 Josef Bacik 2023-11-22  331  		if (opt == Opt_compress || opt == Opt_compress_force) {
17b3612022fe53 Josef Bacik 2023-11-22  332  			ctx->compress_type = BTRFS_COMPRESS_ZLIB;
17b3612022fe53 Josef Bacik 2023-11-22  333  			ctx->compress_level = BTRFS_ZLIB_DEFAULT_LEVEL;
17b3612022fe53 Josef Bacik 2023-11-22  334  			btrfs_set_opt(ctx->mount_opt, COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  335  			btrfs_clear_opt(ctx->mount_opt, NODATACOW);
17b3612022fe53 Josef Bacik 2023-11-22  336  			btrfs_clear_opt(ctx->mount_opt, NODATASUM);
17b3612022fe53 Josef Bacik 2023-11-22  337  		} else if (strncmp(param->string, "zlib", 4) == 0) {
17b3612022fe53 Josef Bacik 2023-11-22  338  			ctx->compress_type = BTRFS_COMPRESS_ZLIB;
17b3612022fe53 Josef Bacik 2023-11-22  339  			ctx->compress_level =
17b3612022fe53 Josef Bacik 2023-11-22  340  				btrfs_compress_str2level(BTRFS_COMPRESS_ZLIB,
17b3612022fe53 Josef Bacik 2023-11-22  341  							 param->string + 4);
17b3612022fe53 Josef Bacik 2023-11-22  342  			btrfs_set_opt(ctx->mount_opt, COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  343  			btrfs_clear_opt(ctx->mount_opt, NODATACOW);
17b3612022fe53 Josef Bacik 2023-11-22  344  			btrfs_clear_opt(ctx->mount_opt, NODATASUM);
17b3612022fe53 Josef Bacik 2023-11-22  345  		} else if (strncmp(param->string, "lzo", 3) == 0) {
17b3612022fe53 Josef Bacik 2023-11-22  346  			ctx->compress_type = BTRFS_COMPRESS_LZO;
17b3612022fe53 Josef Bacik 2023-11-22  347  			ctx->compress_level = 0;
17b3612022fe53 Josef Bacik 2023-11-22  348  			btrfs_set_opt(ctx->mount_opt, COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  349  			btrfs_clear_opt(ctx->mount_opt, NODATACOW);
17b3612022fe53 Josef Bacik 2023-11-22  350  			btrfs_clear_opt(ctx->mount_opt, NODATASUM);
17b3612022fe53 Josef Bacik 2023-11-22  351  		} else if (strncmp(param->string, "zstd", 4) == 0) {
17b3612022fe53 Josef Bacik 2023-11-22  352  			ctx->compress_type = BTRFS_COMPRESS_ZSTD;
17b3612022fe53 Josef Bacik 2023-11-22  353  			ctx->compress_level =
17b3612022fe53 Josef Bacik 2023-11-22  354  				btrfs_compress_str2level(BTRFS_COMPRESS_ZSTD,
17b3612022fe53 Josef Bacik 2023-11-22  355  							 param->string + 4);
17b3612022fe53 Josef Bacik 2023-11-22  356  			btrfs_set_opt(ctx->mount_opt, COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  357  			btrfs_clear_opt(ctx->mount_opt, NODATACOW);
17b3612022fe53 Josef Bacik 2023-11-22  358  			btrfs_clear_opt(ctx->mount_opt, NODATASUM);
17b3612022fe53 Josef Bacik 2023-11-22  359  		} else if (strncmp(param->string, "no", 2) == 0) {
17b3612022fe53 Josef Bacik 2023-11-22  360  			ctx->compress_level = 0;
17b3612022fe53 Josef Bacik 2023-11-22  361  			ctx->compress_type = 0;
17b3612022fe53 Josef Bacik 2023-11-22  362  			btrfs_clear_opt(ctx->mount_opt, COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  363  			btrfs_clear_opt(ctx->mount_opt, FORCE_COMPRESS);
17b3612022fe53 Josef Bacik 2023-11-22  364  		} else {
17b3612022fe53 Josef Bacik 2023-11-22  365  			btrfs_err(NULL, "unrecognized compression value %s",
17b3612022fe53 Josef Bacik 2023-11-22  366  				  param->string);
17b3612022fe53 Josef Bacik 2023-11-22  367  			return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  368  		}
17b3612022fe53 Josef Bacik 2023-11-22  369  		break;
17b3612022fe53 Josef Bacik 2023-11-22  370  	case Opt_ssd:
17b3612022fe53 Josef Bacik 2023-11-22  371  		if (result.negated) {
17b3612022fe53 Josef Bacik 2023-11-22  372  			btrfs_set_opt(ctx->mount_opt, NOSSD);
17b3612022fe53 Josef Bacik 2023-11-22  373  			btrfs_clear_opt(ctx->mount_opt, SSD);
17b3612022fe53 Josef Bacik 2023-11-22  374  			btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
17b3612022fe53 Josef Bacik 2023-11-22  375  		} else {
17b3612022fe53 Josef Bacik 2023-11-22  376  			btrfs_set_opt(ctx->mount_opt, SSD);
17b3612022fe53 Josef Bacik 2023-11-22  377  			btrfs_clear_opt(ctx->mount_opt, NOSSD);
17b3612022fe53 Josef Bacik 2023-11-22  378  		}
17b3612022fe53 Josef Bacik 2023-11-22  379  		break;
17b3612022fe53 Josef Bacik 2023-11-22  380  	case Opt_ssd_spread:
17b3612022fe53 Josef Bacik 2023-11-22  381  		if (result.negated) {
17b3612022fe53 Josef Bacik 2023-11-22  382  			btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
17b3612022fe53 Josef Bacik 2023-11-22  383  		} else {
17b3612022fe53 Josef Bacik 2023-11-22  384  			btrfs_set_opt(ctx->mount_opt, SSD);
17b3612022fe53 Josef Bacik 2023-11-22  385  			btrfs_set_opt(ctx->mount_opt, SSD_SPREAD);
17b3612022fe53 Josef Bacik 2023-11-22  386  			btrfs_clear_opt(ctx->mount_opt, NOSSD);
17b3612022fe53 Josef Bacik 2023-11-22  387  		}
17b3612022fe53 Josef Bacik 2023-11-22  388  		break;
17b3612022fe53 Josef Bacik 2023-11-22  389  	case Opt_barrier:
17b3612022fe53 Josef Bacik 2023-11-22  390  		if (result.negated)
17b3612022fe53 Josef Bacik 2023-11-22  391  			btrfs_set_opt(ctx->mount_opt, NOBARRIER);
17b3612022fe53 Josef Bacik 2023-11-22  392  		else
17b3612022fe53 Josef Bacik 2023-11-22  393  			btrfs_clear_opt(ctx->mount_opt, NOBARRIER);
17b3612022fe53 Josef Bacik 2023-11-22  394  		break;
17b3612022fe53 Josef Bacik 2023-11-22  395  	case Opt_thread_pool:
17b3612022fe53 Josef Bacik 2023-11-22  396  		if (result.uint_32 == 0) {
17b3612022fe53 Josef Bacik 2023-11-22  397  			btrfs_err(NULL, "invalid value 0 for thread_pool");
17b3612022fe53 Josef Bacik 2023-11-22  398  			return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  399  		}
17b3612022fe53 Josef Bacik 2023-11-22  400  		ctx->thread_pool_size = result.uint_32;
17b3612022fe53 Josef Bacik 2023-11-22  401  		break;
17b3612022fe53 Josef Bacik 2023-11-22  402  	case Opt_max_inline:
eb3fb8b856cc42 Qu Wenruo   2023-12-23 @403  		int ret;
eb3fb8b856cc42 Qu Wenruo   2023-12-23  404  
eb3fb8b856cc42 Qu Wenruo   2023-12-23  405  		ret = memparse_safe(param->string, MEMPARSE_SUFFIXES_DEFAULT,
eb3fb8b856cc42 Qu Wenruo   2023-12-23  406  				    &ctx->max_inline, NULL);
eb3fb8b856cc42 Qu Wenruo   2023-12-23  407  		if (ret < 0) {
eb3fb8b856cc42 Qu Wenruo   2023-12-23  408  			btrfs_err(NULL, "invalid string \"%s\"", param->string);
eb3fb8b856cc42 Qu Wenruo   2023-12-23  409  			return ret;
eb3fb8b856cc42 Qu Wenruo   2023-12-23  410  		}
17b3612022fe53 Josef Bacik 2023-11-22  411  		ctx->max_inline = memparse(param->string, NULL);
17b3612022fe53 Josef Bacik 2023-11-22  412  		break;
17b3612022fe53 Josef Bacik 2023-11-22  413  	case Opt_acl:
17b3612022fe53 Josef Bacik 2023-11-22  414  		if (result.negated) {
17b3612022fe53 Josef Bacik 2023-11-22  415  			fc->sb_flags &= ~SB_POSIXACL;
17b3612022fe53 Josef Bacik 2023-11-22  416  		} else {
17b3612022fe53 Josef Bacik 2023-11-22  417  #ifdef CONFIG_BTRFS_FS_POSIX_ACL
17b3612022fe53 Josef Bacik 2023-11-22  418  			fc->sb_flags |= SB_POSIXACL;
17b3612022fe53 Josef Bacik 2023-11-22  419  #else
17b3612022fe53 Josef Bacik 2023-11-22  420  			btrfs_err(NULL, "support for ACL not compiled in");
17b3612022fe53 Josef Bacik 2023-11-22  421  			return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  422  #endif
17b3612022fe53 Josef Bacik 2023-11-22  423  		}
17b3612022fe53 Josef Bacik 2023-11-22  424  		/*
17b3612022fe53 Josef Bacik 2023-11-22  425  		 * VFS limits the ability to toggle ACL on and off via remount,
17b3612022fe53 Josef Bacik 2023-11-22  426  		 * despite every file system allowing this.  This seems to be
17b3612022fe53 Josef Bacik 2023-11-22  427  		 * an oversight since we all do, but it'll fail if we're
17b3612022fe53 Josef Bacik 2023-11-22  428  		 * remounting.  So don't set the mask here, we'll check it in
17b3612022fe53 Josef Bacik 2023-11-22  429  		 * btrfs_reconfigure and do the toggling ourselves.
17b3612022fe53 Josef Bacik 2023-11-22  430  		 */
17b3612022fe53 Josef Bacik 2023-11-22  431  		if (fc->purpose != FS_CONTEXT_FOR_RECONFIGURE)
17b3612022fe53 Josef Bacik 2023-11-22  432  			fc->sb_flags_mask |= SB_POSIXACL;
17b3612022fe53 Josef Bacik 2023-11-22  433  		break;
17b3612022fe53 Josef Bacik 2023-11-22  434  	case Opt_treelog:
17b3612022fe53 Josef Bacik 2023-11-22  435  		if (result.negated)
17b3612022fe53 Josef Bacik 2023-11-22  436  			btrfs_set_opt(ctx->mount_opt, NOTREELOG);
17b3612022fe53 Josef Bacik 2023-11-22  437  		else
17b3612022fe53 Josef Bacik 2023-11-22  438  			btrfs_clear_opt(ctx->mount_opt, NOTREELOG);
17b3612022fe53 Josef Bacik 2023-11-22  439  		break;
17b3612022fe53 Josef Bacik 2023-11-22  440  	case Opt_nologreplay:
17b3612022fe53 Josef Bacik 2023-11-22  441  		btrfs_warn(NULL,
17b3612022fe53 Josef Bacik 2023-11-22  442  		"'nologreplay' is deprecated, use 'rescue=nologreplay' instead");
17b3612022fe53 Josef Bacik 2023-11-22  443  		btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
17b3612022fe53 Josef Bacik 2023-11-22  444  		break;
17b3612022fe53 Josef Bacik 2023-11-22  445  	case Opt_flushoncommit:
17b3612022fe53 Josef Bacik 2023-11-22  446  		if (result.negated)
17b3612022fe53 Josef Bacik 2023-11-22  447  			btrfs_clear_opt(ctx->mount_opt, FLUSHONCOMMIT);
17b3612022fe53 Josef Bacik 2023-11-22  448  		else
17b3612022fe53 Josef Bacik 2023-11-22  449  			btrfs_set_opt(ctx->mount_opt, FLUSHONCOMMIT);
17b3612022fe53 Josef Bacik 2023-11-22  450  		break;
17b3612022fe53 Josef Bacik 2023-11-22  451  	case Opt_ratio:
17b3612022fe53 Josef Bacik 2023-11-22  452  		ctx->metadata_ratio = result.uint_32;
17b3612022fe53 Josef Bacik 2023-11-22  453  		break;
17b3612022fe53 Josef Bacik 2023-11-22  454  	case Opt_discard:
17b3612022fe53 Josef Bacik 2023-11-22  455  		if (result.negated) {
17b3612022fe53 Josef Bacik 2023-11-22  456  			btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
17b3612022fe53 Josef Bacik 2023-11-22  457  			btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
17b3612022fe53 Josef Bacik 2023-11-22  458  			btrfs_set_opt(ctx->mount_opt, NODISCARD);
17b3612022fe53 Josef Bacik 2023-11-22  459  		} else {
17b3612022fe53 Josef Bacik 2023-11-22  460  			btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
17b3612022fe53 Josef Bacik 2023-11-22  461  			btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
17b3612022fe53 Josef Bacik 2023-11-22  462  		}
17b3612022fe53 Josef Bacik 2023-11-22  463  		break;
17b3612022fe53 Josef Bacik 2023-11-22  464  	case Opt_discard_mode:
17b3612022fe53 Josef Bacik 2023-11-22  465  		switch (result.uint_32) {
17b3612022fe53 Josef Bacik 2023-11-22  466  		case Opt_discard_sync:
17b3612022fe53 Josef Bacik 2023-11-22  467  			btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
17b3612022fe53 Josef Bacik 2023-11-22  468  			btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
17b3612022fe53 Josef Bacik 2023-11-22  469  			break;
17b3612022fe53 Josef Bacik 2023-11-22  470  		case Opt_discard_async:
17b3612022fe53 Josef Bacik 2023-11-22  471  			btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
17b3612022fe53 Josef Bacik 2023-11-22  472  			btrfs_set_opt(ctx->mount_opt, DISCARD_ASYNC);
17b3612022fe53 Josef Bacik 2023-11-22  473  			break;
17b3612022fe53 Josef Bacik 2023-11-22  474  		default:
17b3612022fe53 Josef Bacik 2023-11-22  475  			btrfs_err(NULL, "unrecognized discard mode value %s",
17b3612022fe53 Josef Bacik 2023-11-22  476  				  param->key);
17b3612022fe53 Josef Bacik 2023-11-22  477  			return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  478  		}
17b3612022fe53 Josef Bacik 2023-11-22  479  		btrfs_clear_opt(ctx->mount_opt, NODISCARD);
17b3612022fe53 Josef Bacik 2023-11-22  480  		break;
17b3612022fe53 Josef Bacik 2023-11-22  481  	case Opt_space_cache:
17b3612022fe53 Josef Bacik 2023-11-22  482  		if (result.negated) {
17b3612022fe53 Josef Bacik 2023-11-22  483  			btrfs_set_opt(ctx->mount_opt, NOSPACECACHE);
17b3612022fe53 Josef Bacik 2023-11-22  484  			btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
17b3612022fe53 Josef Bacik 2023-11-22  485  			btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
17b3612022fe53 Josef Bacik 2023-11-22  486  		} else {
17b3612022fe53 Josef Bacik 2023-11-22  487  			btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
17b3612022fe53 Josef Bacik 2023-11-22  488  			btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
17b3612022fe53 Josef Bacik 2023-11-22  489  		}
17b3612022fe53 Josef Bacik 2023-11-22  490  		break;
17b3612022fe53 Josef Bacik 2023-11-22  491  	case Opt_space_cache_version:
17b3612022fe53 Josef Bacik 2023-11-22  492  		switch (result.uint_32) {
17b3612022fe53 Josef Bacik 2023-11-22  493  		case Opt_space_cache_v1:
17b3612022fe53 Josef Bacik 2023-11-22  494  			btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
17b3612022fe53 Josef Bacik 2023-11-22  495  			btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
17b3612022fe53 Josef Bacik 2023-11-22  496  			break;
17b3612022fe53 Josef Bacik 2023-11-22  497  		case Opt_space_cache_v2:
17b3612022fe53 Josef Bacik 2023-11-22  498  			btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
17b3612022fe53 Josef Bacik 2023-11-22  499  			btrfs_set_opt(ctx->mount_opt, FREE_SPACE_TREE);
17b3612022fe53 Josef Bacik 2023-11-22  500  			break;
17b3612022fe53 Josef Bacik 2023-11-22  501  		default:
17b3612022fe53 Josef Bacik 2023-11-22  502  			btrfs_err(NULL, "unrecognized space_cache value %s",
17b3612022fe53 Josef Bacik 2023-11-22  503  				  param->key);
17b3612022fe53 Josef Bacik 2023-11-22  504  			return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  505  		}
17b3612022fe53 Josef Bacik 2023-11-22  506  		break;
17b3612022fe53 Josef Bacik 2023-11-22  507  	case Opt_rescan_uuid_tree:
17b3612022fe53 Josef Bacik 2023-11-22  508  		btrfs_set_opt(ctx->mount_opt, RESCAN_UUID_TREE);
17b3612022fe53 Josef Bacik 2023-11-22  509  		break;
17b3612022fe53 Josef Bacik 2023-11-22  510  	case Opt_clear_cache:
17b3612022fe53 Josef Bacik 2023-11-22  511  		btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
17b3612022fe53 Josef Bacik 2023-11-22  512  		break;
17b3612022fe53 Josef Bacik 2023-11-22  513  	case Opt_user_subvol_rm_allowed:
17b3612022fe53 Josef Bacik 2023-11-22  514  		btrfs_set_opt(ctx->mount_opt, USER_SUBVOL_RM_ALLOWED);
17b3612022fe53 Josef Bacik 2023-11-22  515  		break;
17b3612022fe53 Josef Bacik 2023-11-22  516  	case Opt_enospc_debug:
17b3612022fe53 Josef Bacik 2023-11-22  517  		if (result.negated)
17b3612022fe53 Josef Bacik 2023-11-22  518  			btrfs_clear_opt(ctx->mount_opt, ENOSPC_DEBUG);
17b3612022fe53 Josef Bacik 2023-11-22  519  		else
17b3612022fe53 Josef Bacik 2023-11-22  520  			btrfs_set_opt(ctx->mount_opt, ENOSPC_DEBUG);
17b3612022fe53 Josef Bacik 2023-11-22  521  		break;
17b3612022fe53 Josef Bacik 2023-11-22  522  	case Opt_defrag:
17b3612022fe53 Josef Bacik 2023-11-22  523  		if (result.negated)
17b3612022fe53 Josef Bacik 2023-11-22  524  			btrfs_clear_opt(ctx->mount_opt, AUTO_DEFRAG);
17b3612022fe53 Josef Bacik 2023-11-22  525  		else
17b3612022fe53 Josef Bacik 2023-11-22  526  			btrfs_set_opt(ctx->mount_opt, AUTO_DEFRAG);
17b3612022fe53 Josef Bacik 2023-11-22  527  		break;
17b3612022fe53 Josef Bacik 2023-11-22  528  	case Opt_usebackuproot:
17b3612022fe53 Josef Bacik 2023-11-22  529  		btrfs_warn(NULL,
17b3612022fe53 Josef Bacik 2023-11-22  530  			   "'usebackuproot' is deprecated, use 'rescue=usebackuproot' instead");
17b3612022fe53 Josef Bacik 2023-11-22  531  		btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
9fb3b1a7fed796 Josef Bacik 2023-11-22  532  
9fb3b1a7fed796 Josef Bacik 2023-11-22  533  		/* If we're loading the backup roots we can't trust the space cache. */
9fb3b1a7fed796 Josef Bacik 2023-11-22  534  		btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
17b3612022fe53 Josef Bacik 2023-11-22  535  		break;
17b3612022fe53 Josef Bacik 2023-11-22  536  	case Opt_skip_balance:
17b3612022fe53 Josef Bacik 2023-11-22  537  		btrfs_set_opt(ctx->mount_opt, SKIP_BALANCE);
17b3612022fe53 Josef Bacik 2023-11-22  538  		break;
17b3612022fe53 Josef Bacik 2023-11-22  539  	case Opt_fatal_errors:
17b3612022fe53 Josef Bacik 2023-11-22  540  		switch (result.uint_32) {
17b3612022fe53 Josef Bacik 2023-11-22  541  		case Opt_fatal_errors_panic:
17b3612022fe53 Josef Bacik 2023-11-22  542  			btrfs_set_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
17b3612022fe53 Josef Bacik 2023-11-22  543  			break;
17b3612022fe53 Josef Bacik 2023-11-22  544  		case Opt_fatal_errors_bug:
17b3612022fe53 Josef Bacik 2023-11-22  545  			btrfs_clear_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
17b3612022fe53 Josef Bacik 2023-11-22  546  			break;
17b3612022fe53 Josef Bacik 2023-11-22  547  		default:
17b3612022fe53 Josef Bacik 2023-11-22  548  			btrfs_err(NULL, "unrecognized fatal_errors value %s",
17b3612022fe53 Josef Bacik 2023-11-22  549  				  param->key);
17b3612022fe53 Josef Bacik 2023-11-22  550  			return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  551  		}
17b3612022fe53 Josef Bacik 2023-11-22  552  		break;
17b3612022fe53 Josef Bacik 2023-11-22  553  	case Opt_commit_interval:
17b3612022fe53 Josef Bacik 2023-11-22  554  		ctx->commit_interval = result.uint_32;
17b3612022fe53 Josef Bacik 2023-11-22  555  		if (ctx->commit_interval == 0)
17b3612022fe53 Josef Bacik 2023-11-22  556  			ctx->commit_interval = BTRFS_DEFAULT_COMMIT_INTERVAL;
17b3612022fe53 Josef Bacik 2023-11-22  557  		break;
17b3612022fe53 Josef Bacik 2023-11-22  558  	case Opt_rescue:
17b3612022fe53 Josef Bacik 2023-11-22  559  		switch (result.uint_32) {
17b3612022fe53 Josef Bacik 2023-11-22  560  		case Opt_rescue_usebackuproot:
17b3612022fe53 Josef Bacik 2023-11-22  561  			btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
17b3612022fe53 Josef Bacik 2023-11-22  562  			break;
17b3612022fe53 Josef Bacik 2023-11-22  563  		case Opt_rescue_nologreplay:
17b3612022fe53 Josef Bacik 2023-11-22  564  			btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
17b3612022fe53 Josef Bacik 2023-11-22  565  			break;
17b3612022fe53 Josef Bacik 2023-11-22  566  		case Opt_rescue_ignorebadroots:
17b3612022fe53 Josef Bacik 2023-11-22  567  			btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
17b3612022fe53 Josef Bacik 2023-11-22  568  			break;
17b3612022fe53 Josef Bacik 2023-11-22  569  		case Opt_rescue_ignoredatacsums:
17b3612022fe53 Josef Bacik 2023-11-22  570  			btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
17b3612022fe53 Josef Bacik 2023-11-22  571  			break;
17b3612022fe53 Josef Bacik 2023-11-22  572  		case Opt_rescue_parameter_all:
17b3612022fe53 Josef Bacik 2023-11-22  573  			btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
17b3612022fe53 Josef Bacik 2023-11-22  574  			btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
17b3612022fe53 Josef Bacik 2023-11-22  575  			btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
17b3612022fe53 Josef Bacik 2023-11-22  576  			break;
17b3612022fe53 Josef Bacik 2023-11-22  577  		default:
17b3612022fe53 Josef Bacik 2023-11-22  578  			btrfs_info(NULL, "unrecognized rescue option '%s'",
17b3612022fe53 Josef Bacik 2023-11-22  579  				   param->key);
17b3612022fe53 Josef Bacik 2023-11-22  580  			return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  581  		}
17b3612022fe53 Josef Bacik 2023-11-22  582  		break;
17b3612022fe53 Josef Bacik 2023-11-22  583  #ifdef CONFIG_BTRFS_DEBUG
17b3612022fe53 Josef Bacik 2023-11-22  584  	case Opt_fragment:
17b3612022fe53 Josef Bacik 2023-11-22  585  		switch (result.uint_32) {
17b3612022fe53 Josef Bacik 2023-11-22  586  		case Opt_fragment_parameter_all:
17b3612022fe53 Josef Bacik 2023-11-22  587  			btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
17b3612022fe53 Josef Bacik 2023-11-22  588  			btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
17b3612022fe53 Josef Bacik 2023-11-22  589  			break;
17b3612022fe53 Josef Bacik 2023-11-22  590  		case Opt_fragment_parameter_metadata:
17b3612022fe53 Josef Bacik 2023-11-22  591  			btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
17b3612022fe53 Josef Bacik 2023-11-22  592  			break;
17b3612022fe53 Josef Bacik 2023-11-22  593  		case Opt_fragment_parameter_data:
17b3612022fe53 Josef Bacik 2023-11-22  594  			btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
17b3612022fe53 Josef Bacik 2023-11-22  595  			break;
17b3612022fe53 Josef Bacik 2023-11-22  596  		default:
17b3612022fe53 Josef Bacik 2023-11-22  597  			btrfs_info(NULL, "unrecognized fragment option '%s'",
17b3612022fe53 Josef Bacik 2023-11-22  598  				   param->key);
17b3612022fe53 Josef Bacik 2023-11-22  599  			return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  600  		}
17b3612022fe53 Josef Bacik 2023-11-22  601  		break;
17b3612022fe53 Josef Bacik 2023-11-22  602  #endif
17b3612022fe53 Josef Bacik 2023-11-22  603  #ifdef CONFIG_BTRFS_FS_REF_VERIFY
17b3612022fe53 Josef Bacik 2023-11-22  604  	case Opt_ref_verify:
17b3612022fe53 Josef Bacik 2023-11-22  605  		btrfs_set_opt(ctx->mount_opt, REF_VERIFY);
17b3612022fe53 Josef Bacik 2023-11-22  606  		break;
17b3612022fe53 Josef Bacik 2023-11-22  607  #endif
17b3612022fe53 Josef Bacik 2023-11-22  608  	default:
17b3612022fe53 Josef Bacik 2023-11-22  609  		btrfs_err(NULL, "unrecognized mount option '%s'", param->key);
17b3612022fe53 Josef Bacik 2023-11-22  610  		return -EINVAL;
17b3612022fe53 Josef Bacik 2023-11-22  611  	}
17b3612022fe53 Josef Bacik 2023-11-22  612  
17b3612022fe53 Josef Bacik 2023-11-22  613  	return 0;
17b3612022fe53 Josef Bacik 2023-11-22  614  }
17b3612022fe53 Josef Bacik 2023-11-22  615  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
