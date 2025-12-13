Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C162F1FD9
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765628861; cv=none; b=Btoqbd4TnhFGUCS+fy08r91/WT/WAF4D5ok1qelsOZrrqjctEfNezJXEUioVV0amLwHZg68LP/8MLOi4e4L7mH5tpXdo5ajgDkL4YQU2qCQMjnyF4TsrNMx/L+Gd6vvx91N4xRtCR+qkgrYWZ+GsRIl+6HqdJQU6fHTAXQ3GAoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765628861; c=relaxed/simple;
	bh=Uj1R+xnGyj/e38E7F4DlxO5ae/VMIIEdoKb//+RkPLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nRHqPb5Ij90IzOytRXtqXNvUCdibrLz0X4k4qG0XJWwUlbpzv0nBrrhIHTiq8ijbsfOW06HGCpXr0t3Iw9sd3s5RmBtU7/ULnEM7+A7+BKYva/IF5NpZFZilqsgZKAWPdkV9Fd9lx8cHdpoIARILo9D/i16znUt2gE/eP7cpIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iz2T25aO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iz2T25aO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765628860; x=1797164860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uj1R+xnGyj/e38E7F4DlxO5ae/VMIIEdoKb//+RkPLY=;
  b=Iz2T25aOMzNh26anbirfzFeqJKDlpMzfJIW3a7AZZCepSZOJjJwBuLkG
   PhIE+RkuiJzt8rEH/u4fHeQy+CvO2NI7DpNyQ8+Y/XiDZrMcMxbgaOZFE
   RHwxvIRyEETkwXGLi0q4Ky2fSvNJ2OwV7E18TE01KqwSwYYQC7PDhPtjQ
   2TCmMF4nzxW+wJ8FJOOk4Z85aoyf4lqzjNaj+9d5RVtNrtAAn5xu5/+F7
   VWNs+afA6wcymNi1iT2ibGGtzlSjbeo4GZTQQEq3rg2PV1EE3PTj1EZF6
   vpcxvLjXV2az0cMuHCHESe2ZZUe575OwgoZSIhOp7F6u/fj7xUZOoTfIk
   w==;
X-CSE-ConnectionGUID: w4E4BhMIQXWV2kb1SoZtsw==
X-CSE-MsgGUID: P7CrA/kvRvqBF5j4TGK9uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="70191690"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="70191690"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:27:39 -0800
X-CSE-ConnectionGUID: h9uY39IRQ3GMCdfuAQhbcw==
X-CSE-MsgGUID: TYrakG1bRFOx0O6Tp5O2Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197204196"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 04:27:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOim-000000007bs-1tho;
	Sat, 13 Dec 2025 12:27:36 +0000
Date: Sat, 13 Dec 2025 20:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/md.c:898 get_pers() warn: iterator 'i' not incremented
Message-ID: <202512132009.NIw9ipux-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yu Kuai <yukuai3@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 3d44e1d1575a877cf75a7776802506ce7ab8ecc4 md: switch personalities to use md_submodule_head
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512132009.NIw9ipux-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512132009.NIw9ipux-lkp@intel.com/

New smatch warnings:
drivers/md/md.c:898 get_pers() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/md/md.c:3777 analyze_sbs() warn: iterator 'i' not incremented
drivers/md/md.c:8183 status_personalities() warn: iterator 'i' not incremented

vim +/i +898 drivers/md/md.c

1ca69c4bc4b1ef8 NeilBrown 2012-10-11  890  
9faab548974e3eb Yu Kuai   2025-02-15  891  static struct md_personality *get_pers(int level, char *clevel)
2604b703b6b3db8 NeilBrown 2006-01-06  892  {
9faab548974e3eb Yu Kuai   2025-02-15  893  	struct md_personality *ret = NULL;
3d44e1d1575a877 Yu Kuai   2025-02-15  894  	struct md_submodule_head *head;
3d44e1d1575a877 Yu Kuai   2025-02-15  895  	unsigned long i;
9faab548974e3eb Yu Kuai   2025-02-15  896  
3d44e1d1575a877 Yu Kuai   2025-02-15  897  	xa_lock(&md_submodule);
3d44e1d1575a877 Yu Kuai   2025-02-15 @898  	xa_for_each(&md_submodule, i, head) {
3d44e1d1575a877 Yu Kuai   2025-02-15  899  		if (head->type != MD_PERSONALITY)
3d44e1d1575a877 Yu Kuai   2025-02-15  900  			continue;
3d44e1d1575a877 Yu Kuai   2025-02-15  901  		if ((level != LEVEL_NONE && head->id == level) ||
3d44e1d1575a877 Yu Kuai   2025-02-15  902  		    !strcmp(head->name, clevel)) {
3d44e1d1575a877 Yu Kuai   2025-02-15  903  			if (try_module_get(head->owner))
3d44e1d1575a877 Yu Kuai   2025-02-15  904  				ret = (void *)head;
9faab548974e3eb Yu Kuai   2025-02-15  905  			break;
d9d166c2a9d5d01 NeilBrown 2006-01-06  906  		}
9faab548974e3eb Yu Kuai   2025-02-15  907  	}
3d44e1d1575a877 Yu Kuai   2025-02-15  908  	xa_unlock(&md_submodule);
9faab548974e3eb Yu Kuai   2025-02-15  909  
9faab548974e3eb Yu Kuai   2025-02-15  910  	if (!ret) {
9faab548974e3eb Yu Kuai   2025-02-15  911  		if (level != LEVEL_NONE)
9faab548974e3eb Yu Kuai   2025-02-15  912  			pr_warn("md: personality for level %d is not loaded!\n",
9faab548974e3eb Yu Kuai   2025-02-15  913  				level);
9faab548974e3eb Yu Kuai   2025-02-15  914  		else
9faab548974e3eb Yu Kuai   2025-02-15  915  			pr_warn("md: personality for level %s is not loaded!\n",
9faab548974e3eb Yu Kuai   2025-02-15  916  				clevel);
9faab548974e3eb Yu Kuai   2025-02-15  917  	}
9faab548974e3eb Yu Kuai   2025-02-15  918  
9faab548974e3eb Yu Kuai   2025-02-15  919  	return ret;
9faab548974e3eb Yu Kuai   2025-02-15  920  }
9faab548974e3eb Yu Kuai   2025-02-15  921  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
