Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE65250C0F
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285794; cv=none; b=HB8NKwqucG4RyGUcUa5LBUW7kseDNZGXz4v9OVKSD/bYD6qKN16pWDCDbWatECuleVH7/yb9L5AEf4o0QqCvuQrZCa8D/JljQBsv/0PvlfxP6PS+LT6xEYoFeMC33LCk3gUsbuI/JZ/RZL6ndLIbGsaolGRCEXGxaxbwwuwR5ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285794; c=relaxed/simple;
	bh=e8LyC8nsxNK333npNzZOvBhqvJ5mra7VjMDEPwlb6nA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FFGg1Xvm5+g0FETnzA3Bi075M4FKWyJ7wLpdREeyftjw1vjOKaJD8rjG02ADJlR3+JUlCwPrZCRKgygxFCmy9ze7B0E71GggPdBgyM7gsWkh9/UskGtzi5HATrMGpXp3R1MQuwuELncPXljSwI/49p5DTJH0NkAioir/bBxTtA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5SzltX9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5SzltX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739285793; x=1770821793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8LyC8nsxNK333npNzZOvBhqvJ5mra7VjMDEPwlb6nA=;
  b=W5SzltX9UTh0EVAC1FcRRPeOPMUUEq0yKt7bZm7j5OYaW1QlOfqNZJYw
   59IGG9RJKWy9LknzVsQOQ46L2W6lcyg89QZmWD7V4R3Cyiv1WDHYXUI8T
   JzDCiML5TaYsVeiYOt+EotgKks7M0YrhBMp8WSREBLi89ReYsy1mLKXFI
   DMKb5Ca3BqvWGMT2D8A5iK2MupOaBtpmUygIZ0rxV6kieyYAB+hwM3zzs
   Ye4zlgvinkBSTOdGVJKnMCSryj2/wn/lW17Bc77kO9yH5geJwC7O4N12D
   RUmcB+ceNfdz4OTW7ldczaCIkX1+okEGvGnoQ7noOGQ2ArmWp572rJHNL
   Q==;
X-CSE-ConnectionGUID: SDjex1ghQoCvRR25gFq5nA==
X-CSE-MsgGUID: TsnjBJRWRs2yytISNmqm5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39790329"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39790329"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:56:25 -0800
X-CSE-ConnectionGUID: QuwCBQNcQ2qIf2ZrOE3Uog==
X-CSE-MsgGUID: 15cV9C/vQQu0vpSte9U+vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="143383645"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 06:56:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thrgS-0014KD-1V;
	Tue, 11 Feb 2025 14:56:20 +0000
Date: Tue, 11 Feb 2025 22:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/proc/base.c:3288:4-29: opportunity for
 str_yes_no(ksm_process_mergeable ( mm ))
Message-ID: <202502112204.XRI8uTG4-lkp@intel.com>
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
TO: xu xin <xu.xin16@zte.com.cn>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   febbc555cf0fff895546ddb8ba2c9a523692fb55
commit: 3ab76c767bc783c122a8dfe105fbc10a0b029b42 ksm: add ksm involvement information for each process
date:   2 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 2 weeks ago
config: csky-randconfig-r062-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112204.XRI8uTG4-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502112204.XRI8uTG4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/proc/base.c:3288:4-29: opportunity for str_yes_no(ksm_process_mergeable ( mm ))
>> fs/proc/base.c:3281:4-42: opportunity for str_yes_no(test_bit ( MMF_VM_MERGE_ANY , & mm -> flags ))

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
3ab76c767bc783 xu xin         2025-01-10 @3281  				test_bit(MMF_VM_MERGE_ANY, &mm->flags) ? "yes" : "no");
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
