Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C23C38C2C7
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261204; cv=none; b=N4U6xWKHSUkWeC+0UnZbmXPy/Us1m520zQl/7QLtbhASnLrKeLVkUpyBirGm+YKjQrlfY6j6K6SfWKKnAcUjFTeDYIG0nLinyPi07zmyjuOhtGtH0FEamAVMUzcTNxZLSao4E38j3LlnqXJCOd389VC8ZvvpziMbVXUiN6I0YJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261204; c=relaxed/simple;
	bh=kBJ12wupTIDoG+k1EdbkDUnf2Qp3A1VQwj6KPilhfqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FqYQp22wRVqA2TVNRO/ayqAUBFkSBF+E3InJ9ma3M5YhDts6qswhQp2W+/bPY5655GVqb73z2dXe3+Wpdot7PlJ0Z2lJVvSJfepvkQT7pIpAIlXTa4PkoBzMM+YYydL6iuIv+N6iJ3nl5F70L6kQ91h0/mzOGRNahJp0HrZ7Pwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXYwq8k9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXYwq8k9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774261202; x=1805797202;
  h=date:from:to:cc:subject:message-id;
  bh=kBJ12wupTIDoG+k1EdbkDUnf2Qp3A1VQwj6KPilhfqM=;
  b=fXYwq8k9gacdWOc+VDt0/outniqPB+uIJV7q+U57Xd4z2Le5QgRxe0v0
   q5+75+t2vS0NFo9Vgy7D/XsucuOzyLCyATvq5Sad5U4vGChQT8aVIUIcw
   g3Kbb3cU2JCBEfsS8Bm4Zc/mYfGsR5mW0Dc0VtKcg+Q2o2oEqkckdVBLo
   G78wN50g7ANElVd9WYB7rSi4IXTaIEBNxiiXTy09Tuy6ZNZBQru6dItIh
   t4yqc3bWEFnJLhLfCYShzsY6G/9f4mnSNptS+7gBQtlr37MBumR1pSKZf
   bnCV8YyKCSGX+07reqHyIW/lBDqnsvropys9kMHLSZilqm9AtpehHTIO6
   Q==;
X-CSE-ConnectionGUID: HySly0cfSK2xHFP7jQg7GA==
X-CSE-MsgGUID: blGEdtMtRo6xE98Pk+h46w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74433419"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74433419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:20:01 -0700
X-CSE-ConnectionGUID: 3XGRAw0ERkSjbOQm+gISTA==
X-CSE-MsgGUID: xYLhTUVQTsGSxo227KJ9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228707874"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 03:20:01 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4cO6-000000000LL-0XKC;
	Mon, 23 Mar 2026 10:19:58 +0000
Date: Mon, 23 Mar 2026 18:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:block-for-next 17/31] block/bfq-cgroup.c:1083:2:
 warning: releasing spinlock 'bdev_get_queue(ctx.bdev).queue_lock' that was
 not held
Message-ID: <202603231818.WiRBknYm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux block-for-next
head:   9f0e2d950eb40285341043781f7e9fe8258f9ad6
commit: e9ca43430f52e1ed72d5da4f7b9ef71d85a7fc9d [17/31] block: Enable lock context analysis
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: um-defconfig (https://download.01.org/0day-ci/archive/20260323/202603231818.WiRBknYm-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603231818.WiRBknYm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603231818.WiRBknYm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bfq-cgroup.c:1083:2: warning: releasing spinlock 'bdev_get_queue(ctx.bdev).queue_lock' that was not held [-Wthread-safety-analysis]
    1083 |         blkg_conf_unprep(&ctx);
         |         ^
>> block/bfq-cgroup.c:1085:2: warning: spinlock 'ctx.bdev->bd_disk->queue->queue_lock' is not held on every path through here [-Wthread-safety-analysis]
    1085 |         blkg_conf_close_bdev(&ctx);
         |         ^
   block/bfq-cgroup.c:1058:8: note: spinlock acquired here
    1058 |         ret = blkg_conf_prep(blkcg, &blkcg_policy_bfq, &ctx);
         |               ^
   2 warnings generated.


vim +1083 block/bfq-cgroup.c

ea25da48086d3b Paolo Valente   2017-04-19  1041  
795fe54c2a8280 Fam Zheng       2019-08-28  1042  static ssize_t bfq_io_set_device_weight(struct kernfs_open_file *of,
ea25da48086d3b Paolo Valente   2017-04-19  1043  					char *buf, size_t nbytes,
ea25da48086d3b Paolo Valente   2017-04-19  1044  					loff_t off)
ea25da48086d3b Paolo Valente   2017-04-19  1045  {
795fe54c2a8280 Fam Zheng       2019-08-28  1046  	int ret;
795fe54c2a8280 Fam Zheng       2019-08-28  1047  	struct blkg_conf_ctx ctx;
795fe54c2a8280 Fam Zheng       2019-08-28  1048  	struct blkcg *blkcg = css_to_blkcg(of_css(of));
795fe54c2a8280 Fam Zheng       2019-08-28  1049  	struct bfq_group *bfqg;
795fe54c2a8280 Fam Zheng       2019-08-28  1050  	u64 v;
ea25da48086d3b Paolo Valente   2017-04-19  1051  
faffaab2895914 Tejun Heo       2023-04-12  1052  	blkg_conf_init(&ctx, buf);
faffaab2895914 Tejun Heo       2023-04-12  1053  
74103c4f12c415 Bart Van Assche 2026-03-18  1054  	ret = blkg_conf_open_bdev(&ctx);
74103c4f12c415 Bart Van Assche 2026-03-18  1055  	if (ret)
ab9ad25a727a61 Bart Van Assche 2026-03-18  1056  		return ret;
74103c4f12c415 Bart Van Assche 2026-03-18  1057  
faffaab2895914 Tejun Heo       2023-04-12  1058  	ret = blkg_conf_prep(blkcg, &blkcg_policy_bfq, &ctx);
ea25da48086d3b Paolo Valente   2017-04-19  1059  	if (ret)
ab9ad25a727a61 Bart Van Assche 2026-03-18  1060  		goto close_bdev;
ea25da48086d3b Paolo Valente   2017-04-19  1061  
795fe54c2a8280 Fam Zheng       2019-08-28  1062  	if (sscanf(ctx.body, "%llu", &v) == 1) {
795fe54c2a8280 Fam Zheng       2019-08-28  1063  		/* require "default" on dfl */
795fe54c2a8280 Fam Zheng       2019-08-28  1064  		ret = -ERANGE;
795fe54c2a8280 Fam Zheng       2019-08-28  1065  		if (!v)
795fe54c2a8280 Fam Zheng       2019-08-28  1066  			goto out;
795fe54c2a8280 Fam Zheng       2019-08-28  1067  	} else if (!strcmp(strim(ctx.body), "default")) {
795fe54c2a8280 Fam Zheng       2019-08-28  1068  		v = 0;
795fe54c2a8280 Fam Zheng       2019-08-28  1069  	} else {
795fe54c2a8280 Fam Zheng       2019-08-28  1070  		ret = -EINVAL;
795fe54c2a8280 Fam Zheng       2019-08-28  1071  		goto out;
795fe54c2a8280 Fam Zheng       2019-08-28  1072  	}
795fe54c2a8280 Fam Zheng       2019-08-28  1073  
795fe54c2a8280 Fam Zheng       2019-08-28  1074  	bfqg = blkg_to_bfqg(ctx.blkg);
795fe54c2a8280 Fam Zheng       2019-08-28  1075  
795fe54c2a8280 Fam Zheng       2019-08-28  1076  	ret = -ERANGE;
795fe54c2a8280 Fam Zheng       2019-08-28  1077  	if (!v || (v >= BFQ_MIN_WEIGHT && v <= BFQ_MAX_WEIGHT)) {
795fe54c2a8280 Fam Zheng       2019-08-28  1078  		bfq_group_set_weight(bfqg, bfqg->entity.weight, v);
795fe54c2a8280 Fam Zheng       2019-08-28  1079  		ret = 0;
795fe54c2a8280 Fam Zheng       2019-08-28  1080  	}
ab9ad25a727a61 Bart Van Assche 2026-03-18  1081  
795fe54c2a8280 Fam Zheng       2019-08-28  1082  out:
ab9ad25a727a61 Bart Van Assche 2026-03-18 @1083  	blkg_conf_unprep(&ctx);
ab9ad25a727a61 Bart Van Assche 2026-03-18  1084  close_bdev:
ab9ad25a727a61 Bart Van Assche 2026-03-18 @1085  	blkg_conf_close_bdev(&ctx);
795fe54c2a8280 Fam Zheng       2019-08-28  1086  	return ret ?: nbytes;
795fe54c2a8280 Fam Zheng       2019-08-28  1087  }
795fe54c2a8280 Fam Zheng       2019-08-28  1088  

:::::: The code at line 1083 was first introduced by commit
:::::: ab9ad25a727a61c0bddea103f63ecd24ba9c820c block/cgroup: Split blkg_conf_exit()

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Bart Van Assche <bvanassche@acm.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
