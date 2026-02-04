Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC8026E173
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 05:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770183311; cv=none; b=AUrHirkFDz2/8pKv4rvHoMtoajdGJYTonhDW8J4FnGKAl0/rJ3SXzE4IWjZWs3QSBJXXXEilr1xtBtGV1/aJ0vrdorcNLYr/PaNAtOuDQw4GmcEP9DVrN29NWlh1YUwGAbF+QIhAlIWyrpMJTHdMDuY1ovUwDEEFsWboNAq7ovA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770183311; c=relaxed/simple;
	bh=TpN8o8QUiGxZFffthz3DYNJQHVHjqjvLhXy85NsMsqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eubrfiiUm2ZSyl6NgzLNu+S26QBhU/EHiTvyxstMLuLOLyZmbFuQO1//V33Pv8ftTesnbJo0QKY/R4CKUu3pxIVuPVc8GyaR6C+2sfGKvzTXl0wEFdverZJVrbHP2PF6GoNgAqm9LyvWMkszp2AWfKhvK0zhog7k/O+OTFkwMlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbP1cntm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbP1cntm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770183311; x=1801719311;
  h=date:from:to:cc:subject:message-id;
  bh=TpN8o8QUiGxZFffthz3DYNJQHVHjqjvLhXy85NsMsqo=;
  b=UbP1cntmTN2hwAEEhRuVzh92TRTmooMGewlEy+b/UOEZZE0dxsMXqZEB
   de3yNEKjj377KIXSmPb7iR8oqfNQGnw44S8V3dAHRRLtWKgx5RkjZA8Rh
   /TLvYS56QKl5uX8IcnA2X/tOrRzi4puINq+MB79A6KbbqZVYarKYmsTxV
   myPoauF/21NxjtgaWxqACnCziDo0iY8YGRHgn2Ey4OPSXTwMK9vl5B1AJ
   WiKr7gPTgP31lyBCaak3IVUh6jY3ZKY0O1lBaaTsNKsfNpJtWXY2kKpv0
   BTdHLQ4+qBwY2Ic1225wzMiSRONDuvCJPaKQc4n1s+1P24NRoEJqSeMLc
   A==;
X-CSE-ConnectionGUID: PT9RB+xURpO989pThGx5Rg==
X-CSE-MsgGUID: 5+1fWDEWTsqpNLRgSE90Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82475006"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82475006"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 21:35:10 -0800
X-CSE-ConnectionGUID: RkgME5rjQF2+hkTNwVl7sA==
X-CSE-MsgGUID: F8BlGui3TcGCtxFfLfBcEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209448067"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2026 21:35:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnVXc-00000000hTn-1WHV;
	Wed, 04 Feb 2026 05:35:04 +0000
Date: Wed, 04 Feb 2026 13:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/proc/base.c:3279:4-39: opportunity for
 str_yes_no(mm_flags_test ( MMF_VM_MERGE_ANY , mm ))
Message-ID: <202602041313.xxJ2J4v0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5fd0a1df5d05ad066e5618ccdd3d0fa6cb686c27
commit: d14d3f535e13ff0661b9a74133a8d6b9f9950712 mm: convert remaining users to mm_flags_*() accessors
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r063-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041313.xxJ2J4v0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602041313.xxJ2J4v0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   fs/proc/base.c:3286:4-29: opportunity for str_yes_no(ksm_process_mergeable ( mm ))
>> fs/proc/base.c:3279:4-39: opportunity for str_yes_no(mm_flags_test ( MMF_VM_MERGE_ANY , mm ))

vim +3279 fs/proc/base.c

7c23b3300116907 Josh Poimboeuf  2017-02-13  3251  
7609385337a4feb xu xin          2022-04-28  3252  #ifdef CONFIG_KSM
7609385337a4feb xu xin          2022-04-28  3253  static int proc_pid_ksm_merging_pages(struct seq_file *m, struct pid_namespace *ns,
7609385337a4feb xu xin          2022-04-28  3254  				struct pid *pid, struct task_struct *task)
7609385337a4feb xu xin          2022-04-28  3255  {
7609385337a4feb xu xin          2022-04-28  3256  	struct mm_struct *mm;
7609385337a4feb xu xin          2022-04-28  3257  
7609385337a4feb xu xin          2022-04-28  3258  	mm = get_task_mm(task);
7609385337a4feb xu xin          2022-04-28  3259  	if (mm) {
7609385337a4feb xu xin          2022-04-28  3260  		seq_printf(m, "%lu\n", mm->ksm_merging_pages);
7609385337a4feb xu xin          2022-04-28  3261  		mmput(mm);
7609385337a4feb xu xin          2022-04-28  3262  	}
7609385337a4feb xu xin          2022-04-28  3263  
7609385337a4feb xu xin          2022-04-28  3264  	return 0;
7609385337a4feb xu xin          2022-04-28  3265  }
cb4df4cae4f2bd8 xu xin          2022-08-30  3266  static int proc_pid_ksm_stat(struct seq_file *m, struct pid_namespace *ns,
cb4df4cae4f2bd8 xu xin          2022-08-30  3267  				struct pid *pid, struct task_struct *task)
cb4df4cae4f2bd8 xu xin          2022-08-30  3268  {
cb4df4cae4f2bd8 xu xin          2022-08-30  3269  	struct mm_struct *mm;
3ab76c767bc783c xu xin          2025-01-10  3270  	int ret = 0;
cb4df4cae4f2bd8 xu xin          2022-08-30  3271  
cb4df4cae4f2bd8 xu xin          2022-08-30  3272  	mm = get_task_mm(task);
cb4df4cae4f2bd8 xu xin          2022-08-30  3273  	if (mm) {
cb4df4cae4f2bd8 xu xin          2022-08-30  3274  		seq_printf(m, "ksm_rmap_items %lu\n", mm->ksm_rmap_items);
c2dc78b86e0821e Chengming Zhou  2024-05-28  3275  		seq_printf(m, "ksm_zero_pages %ld\n", mm_ksm_zero_pages(mm));
d21077fbc2fc987 Stefan Roesch   2023-04-17  3276  		seq_printf(m, "ksm_merging_pages %lu\n", mm->ksm_merging_pages);
d21077fbc2fc987 Stefan Roesch   2023-04-17  3277  		seq_printf(m, "ksm_process_profit %ld\n", ksm_process_profit(mm));
3ab76c767bc783c xu xin          2025-01-10  3278  		seq_printf(m, "ksm_merge_any: %s\n",
d14d3f535e13ff0 Lorenzo Stoakes 2025-08-12 @3279  				mm_flags_test(MMF_VM_MERGE_ANY, mm) ? "yes" : "no");
3ab76c767bc783c xu xin          2025-01-10  3280  		ret = mmap_read_lock_killable(mm);
3ab76c767bc783c xu xin          2025-01-10  3281  		if (ret) {
3ab76c767bc783c xu xin          2025-01-10  3282  			mmput(mm);
3ab76c767bc783c xu xin          2025-01-10  3283  			return ret;
3ab76c767bc783c xu xin          2025-01-10  3284  		}
3ab76c767bc783c xu xin          2025-01-10  3285  		seq_printf(m, "ksm_mergeable: %s\n",
3ab76c767bc783c xu xin          2025-01-10  3286  				ksm_process_mergeable(mm) ? "yes" : "no");
3ab76c767bc783c xu xin          2025-01-10  3287  		mmap_read_unlock(mm);
cb4df4cae4f2bd8 xu xin          2022-08-30  3288  		mmput(mm);
cb4df4cae4f2bd8 xu xin          2022-08-30  3289  	}
cb4df4cae4f2bd8 xu xin          2022-08-30  3290  
cb4df4cae4f2bd8 xu xin          2022-08-30  3291  	return 0;
cb4df4cae4f2bd8 xu xin          2022-08-30  3292  }
7609385337a4feb xu xin          2022-04-28  3293  #endif /* CONFIG_KSM */
7609385337a4feb xu xin          2022-04-28  3294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
