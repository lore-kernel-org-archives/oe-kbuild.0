Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE07EEB3
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204614; cv=none; b=k8rZ5j2KCPZKeVKoZQMEwZgfB1Xzt8brgihq/TiIWpKG+Ug/Qot9hZQXWFf3kOYqzVLrNWhhVzJ/ttdKR1AkS3Dy7k82Rz/06fXYBUB5ikvkoTRfBqqczuomSOGgDXw4qBx+V8vD8+pLEfIc90SBigmmdJ74nL5rWL4OTefoxF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204614; c=relaxed/simple;
	bh=0G9Zy2KHNgPEcuN5dvm8WiyCfHjj1FrlU4P7aQPQBnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZhIQFGYZU8crpIO67MQY+g2jKkqnzd4CHW+Gk1dNmvlTzMvnIoZSuF7XGV0+cugtLIs0AFdzbEqbNj5WS+ZBThqpOyvCUgBIZj70vYXw8jAxMgCLvAU+W8f15/OHjLFJ0vRySGI8sM3pyilGf/Eqk8hiKwGcKD29Z7OOf+GjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCOU1CO+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCOU1CO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761204612; x=1792740612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0G9Zy2KHNgPEcuN5dvm8WiyCfHjj1FrlU4P7aQPQBnc=;
  b=dCOU1CO+cnJ7Ioe8UOZRy3ktGkDQiulStNw/9YYIm9xNv7CkTIIDnZo1
   akj4+m9LA/GSjn79WlNbTQop0YpE1pSbZ3lNDJOoMlf3K+OUt59WqXM3X
   DgSebbAQeFpfVeNz19S9lqxG1xW6AbmFjQ6q67E73oRvReaywG4Ywp1e7
   DeASRabYOBRdT7AZsaEt2HL5wc8VyPGo1q6Z322uNEBqNmtuxUShQgAXT
   uUgxZA1mKcs5U1/1+UD3WAsF8hSdsHdCTMvVHITRp/9AkoywLCUGot9TP
   8QsPgo2wxvaAQhpe2rPP68KMZ/8ozkm9LBZ4LAGOco7T86YICQZRgcKFK
   Q==;
X-CSE-ConnectionGUID: Hq/Uo90oQjy71YKuoyZUUg==
X-CSE-MsgGUID: 4O/tQFMjRhisQif+VdhALA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67011189"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="67011189"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:30:11 -0700
X-CSE-ConnectionGUID: wDA61SY/QJeOnJjw8UwJtQ==
X-CSE-MsgGUID: i3lqUHrJQm6PQIyuCQ6HtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183686747"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2025 00:30:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBplv-000D9n-1q;
	Thu, 23 Oct 2025 07:30:07 +0000
Date: Thu, 23 Oct 2025 15:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/proc/base.c:3279:4-39: opportunity for str_yes_no(mm_flags_test (
 MMF_VM_MERGE_ANY , mm ))
Message-ID: <202510231541.uVpbrSce-lkp@intel.com>
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
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43e9ad0c55a369ecc84a4788d06a8a6bfa634f1c
commit: d14d3f535e13ff0661b9a74133a8d6b9f9950712 mm: convert remaining users to mm_flags_*() accessors
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: m68k-randconfig-r063-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231541.uVpbrSce-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510231541.uVpbrSce-lkp@intel.com/

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
