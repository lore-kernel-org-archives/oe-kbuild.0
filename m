Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC3E31E0F2
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367746; cv=none; b=llXIUc0/c5GQLkboISXnB02P11mYjZFMlZfCdOlPWzWPptjo7tPqPKvL8jBf8lxuiazcbIBSplKXnjsuHzfYG+5tInBRDO5NBgUYaTnUqggKmvlyJv8AHttQN12AToIVF65+yHzdCdY/l5Msf79RKjIHRtAiM+IPXaUflLlPNMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367746; c=relaxed/simple;
	bh=NltLfvGFGtMesXERxSxeZWBXCmNmIL1Gh2QHz7hN/Gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uqOpG6dYqI/EHiOPa2BunzYP9TwMmEhYwOOI2i7o9L8+ZIBNfbDIFxJifEMZKHT+zULR8XuEk8Kns/GkwS/GDuGmyArydTmtxE1KeXm1muKWiNgSDNMMNvP9WkIiYU1hQ6ZgiLGP1RAHwjT8x57Qmo+Pf/akqkcAaIotxBQygPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEfj5j7i; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEfj5j7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766367744; x=1797903744;
  h=date:from:to:cc:subject:message-id;
  bh=NltLfvGFGtMesXERxSxeZWBXCmNmIL1Gh2QHz7hN/Gs=;
  b=TEfj5j7iEprFow/Lw3craD4G7QK31Pzp7Fh1UWSWZSE3kIsFmqT0clGn
   pWlYd8ybbogNihiARReyvcWUeykmxzGx7OcTIIk6dN2HIXr27479hnnEm
   Ut8sK1yMR4Xm44t6lS417U4EXIKtNYRtb2533IP1vdKKqWbMKJSPdJhv8
   3l4QFwt47KGo4mKCFifkIE/8dQwcGvIgNZ3wkR7sg2ff3iO4ipv6i+1k7
   YXGdb5GjSNDmbB28C/da1Wmk0y51XXf4duAwT7dz4E8OAdau4OUgh3b4C
   Oalg2g3DgzeZa5XSD3jStmxeSxkbQIDnEGXvqB+R18924gHrUVdVTEs6x
   Q==;
X-CSE-ConnectionGUID: xMLUZvbKSTqoz9PYI0hrqA==
X-CSE-MsgGUID: 60KDSoTnQ3Kg4XI77w7I2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72074158"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72074158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:42:24 -0800
X-CSE-ConnectionGUID: JEq5gCZcQDyzTUFriKLHlQ==
X-CSE-MsgGUID: vtIrxkKdSnmLQsrIBUEsWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199302409"
Received: from lkp-server02.sh.intel.com (HELO 9d662e18a02b) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 17:42:23 -0800
Received: from kbuild by 9d662e18a02b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXUw4-0000000001Y-26go;
	Mon, 22 Dec 2025 01:42:12 +0000
Date: Mon, 22 Dec 2025 09:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/proc/base.c:3288:4-29: opportunity for
 str_yes_no(ksm_process_mergeable ( mm ))
Message-ID: <202512220929.pRWjLAXB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: xu xin <xu.xin16@zte.com.cn>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 3ab76c767bc783c122a8dfe105fbc10a0b029b42 ksm: add ksm involvement information for each process
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-r064-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220929.pRWjLAXB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512220929.pRWjLAXB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/proc/base.c:3288:4-29: opportunity for str_yes_no(ksm_process_mergeable ( mm ))
   fs/proc/base.c:3281:4-42: opportunity for str_yes_no(test_bit ( MMF_VM_MERGE_ANY , & mm -> flags ))

vim +3288 fs/proc/base.c

7c23b330011690 Josh Poimboeuf 2017-02-13  3253  
7609385337a4fe xu xin         2022-04-28  3254  #ifdef CONFIG_KSM
7609385337a4fe xu xin         2022-04-28  3255  static int proc_pid_ksm_merging_pages(struct seq_file *m, struct pid_namespace *ns,
7609385337a4fe xu xin         2022-04-28  3256  				struct pid *pid, struct task_struct *task)
7609385337a4fe xu xin         2022-04-28  3257  {
7609385337a4fe xu xin         2022-04-28  3258  	struct mm_struct *mm;
7609385337a4fe xu xin         2022-04-28  3259  
7609385337a4fe xu xin         2022-04-28  3260  	mm = get_task_mm(task);
7609385337a4fe xu xin         2022-04-28  3261  	if (mm) {
7609385337a4fe xu xin         2022-04-28  3262  		seq_printf(m, "%lu\n", mm->ksm_merging_pages);
7609385337a4fe xu xin         2022-04-28  3263  		mmput(mm);
7609385337a4fe xu xin         2022-04-28  3264  	}
7609385337a4fe xu xin         2022-04-28  3265  
7609385337a4fe xu xin         2022-04-28  3266  	return 0;
7609385337a4fe xu xin         2022-04-28  3267  }
cb4df4cae4f2bd xu xin         2022-08-30  3268  static int proc_pid_ksm_stat(struct seq_file *m, struct pid_namespace *ns,
cb4df4cae4f2bd xu xin         2022-08-30  3269  				struct pid *pid, struct task_struct *task)
cb4df4cae4f2bd xu xin         2022-08-30  3270  {
cb4df4cae4f2bd xu xin         2022-08-30  3271  	struct mm_struct *mm;
3ab76c767bc783 xu xin         2025-01-10  3272  	int ret = 0;
cb4df4cae4f2bd xu xin         2022-08-30  3273  
cb4df4cae4f2bd xu xin         2022-08-30  3274  	mm = get_task_mm(task);
cb4df4cae4f2bd xu xin         2022-08-30  3275  	if (mm) {
cb4df4cae4f2bd xu xin         2022-08-30  3276  		seq_printf(m, "ksm_rmap_items %lu\n", mm->ksm_rmap_items);
c2dc78b86e0821 Chengming Zhou 2024-05-28  3277  		seq_printf(m, "ksm_zero_pages %ld\n", mm_ksm_zero_pages(mm));
d21077fbc2fc98 Stefan Roesch  2023-04-17  3278  		seq_printf(m, "ksm_merging_pages %lu\n", mm->ksm_merging_pages);
d21077fbc2fc98 Stefan Roesch  2023-04-17  3279  		seq_printf(m, "ksm_process_profit %ld\n", ksm_process_profit(mm));
3ab76c767bc783 xu xin         2025-01-10  3280  		seq_printf(m, "ksm_merge_any: %s\n",
3ab76c767bc783 xu xin         2025-01-10  3281  				test_bit(MMF_VM_MERGE_ANY, &mm->flags) ? "yes" : "no");
3ab76c767bc783 xu xin         2025-01-10  3282  		ret = mmap_read_lock_killable(mm);
3ab76c767bc783 xu xin         2025-01-10  3283  		if (ret) {
3ab76c767bc783 xu xin         2025-01-10  3284  			mmput(mm);
3ab76c767bc783 xu xin         2025-01-10  3285  			return ret;
3ab76c767bc783 xu xin         2025-01-10  3286  		}
3ab76c767bc783 xu xin         2025-01-10  3287  		seq_printf(m, "ksm_mergeable: %s\n",
3ab76c767bc783 xu xin         2025-01-10 @3288  				ksm_process_mergeable(mm) ? "yes" : "no");
3ab76c767bc783 xu xin         2025-01-10  3289  		mmap_read_unlock(mm);
cb4df4cae4f2bd xu xin         2022-08-30  3290  		mmput(mm);
cb4df4cae4f2bd xu xin         2022-08-30  3291  	}
cb4df4cae4f2bd xu xin         2022-08-30  3292  
cb4df4cae4f2bd xu xin         2022-08-30  3293  	return 0;
cb4df4cae4f2bd xu xin         2022-08-30  3294  }
7609385337a4fe xu xin         2022-04-28  3295  #endif /* CONFIG_KSM */
7609385337a4fe xu xin         2022-04-28  3296  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
