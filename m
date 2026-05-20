Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BBF3CFF5D
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 23:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321085; cv=none; b=gwWkepohxc0GapqC/gWEk7vV08+M1FuPYt9oZ6t2AxJ0f83OGvtTkkVvNQJpzZht/EEGKXLxc5NY7FnDrgkv+t6NCY26XpL93nfq2LYtTkS0xbt53DflHYXr8addO273CRbYelCPNVUcx3WSqUCSQLtrziaKJ6lURyJbSPyjUyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321085; c=relaxed/simple;
	bh=OYxGrH9tnubfom6rIPdDbd2723FXKljta6qatW97GuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=foOn9j73U/aC5C/D+W+DXr+jReoXjNjehaxxM1u5JaNOn5Lj+ZB9wM4qbH6app3qFf9kyOBsioquUi+cz6YFg9F8+EM7MEIMsWW7fgkxr5pS+rMEo1MBsFAD5BCGccl6whGgd7G9RgT5QGbpJUPAZ+qIvrN/lGYpSrELSAlPvds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NM6PEVI1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NM6PEVI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779321082; x=1810857082;
  h=date:from:to:cc:subject:message-id;
  bh=OYxGrH9tnubfom6rIPdDbd2723FXKljta6qatW97GuA=;
  b=NM6PEVI1O86lnslqcIjosHTkm5yk8Brc5EvWf4jPNdL8ESDj46cT/VI6
   9VXIO2pZQAI59r6NDCoPuJt3jcplCkrcWA9w8IxL+iiFatommc4AFk51x
   TBWFcfqA8Db4R0SLdDkBzzv1uuHxjgC3U1e5JAGbo88gTQfFYiIbvY3Fl
   BfvWgm4iZqxiT3Frx1GQLEmboqmszdl5VfWS0uxVUUc7xxElaxcxdnxlV
   gCuAGQ/8IrPsDe0ltPEAsAlvjPM6oq0fF9KI380vpIZU3n6EsAl/jWvGR
   rVxAyfDtxTaHbbcu0831J4YCtkncpgi5pKvxrPh++FZL+hde6Ra4iynrJ
   w==;
X-CSE-ConnectionGUID: 6ZoFHsOkS3Wq32rQxirkOg==
X-CSE-MsgGUID: 3AHbPKugSoqGj06ndNN0FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80290037"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80290037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:51:21 -0700
X-CSE-ConnectionGUID: UOQIEub6TaqiZQYs6h7Ibg==
X-CSE-MsgGUID: 8vD5NIl8REyx5RBa2cUymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="270709516"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2026 16:51:19 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPqgc-0000000041F-09WQ;
	Wed, 20 May 2026 23:50:56 +0000
Date: Thu, 21 May 2026 07:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android17-6.18-2026-04 0/1]
 fs/proc/base.c:3279:4-39: opportunity for str_yes_no(mm_flags_test (
 MMF_VM_MERGE_ANY , mm ))
Message-ID: <202605210751.KFEYbLMy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   6794f901dd75b16bbfd428ab3be1e510710da4c7
commit: d14d3f535e13ff0661b9a74133a8d6b9f9950712 [0/1] mm: convert remaining users to mm_flags_*() accessors
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-053-20260521 (https://download.01.org/0day-ci/archive/20260521/202605210751.KFEYbLMy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d14d3f535e13 ("mm: convert remaining users to mm_flags_*() accessors")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605210751.KFEYbLMy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   fs/proc/base.c:3286:4-29: opportunity for str_yes_no(ksm_process_mergeable ( mm ))
>> fs/proc/base.c:3279:4-39: opportunity for str_yes_no(mm_flags_test ( MMF_VM_MERGE_ANY , mm ))

vim +3279 fs/proc/base.c

7c23b330011690 Josh Poimboeuf  2017-02-13  3251  
7609385337a4fe xu xin          2022-04-28  3252  #ifdef CONFIG_KSM
7609385337a4fe xu xin          2022-04-28  3253  static int proc_pid_ksm_merging_pages(struct seq_file *m, struct pid_namespace *ns,
7609385337a4fe xu xin          2022-04-28  3254  				struct pid *pid, struct task_struct *task)
7609385337a4fe xu xin          2022-04-28  3255  {
7609385337a4fe xu xin          2022-04-28  3256  	struct mm_struct *mm;
7609385337a4fe xu xin          2022-04-28  3257  
7609385337a4fe xu xin          2022-04-28  3258  	mm = get_task_mm(task);
7609385337a4fe xu xin          2022-04-28  3259  	if (mm) {
7609385337a4fe xu xin          2022-04-28  3260  		seq_printf(m, "%lu\n", mm->ksm_merging_pages);
7609385337a4fe xu xin          2022-04-28  3261  		mmput(mm);
7609385337a4fe xu xin          2022-04-28  3262  	}
7609385337a4fe xu xin          2022-04-28  3263  
7609385337a4fe xu xin          2022-04-28  3264  	return 0;
7609385337a4fe xu xin          2022-04-28  3265  }
cb4df4cae4f2bd xu xin          2022-08-30  3266  static int proc_pid_ksm_stat(struct seq_file *m, struct pid_namespace *ns,
cb4df4cae4f2bd xu xin          2022-08-30  3267  				struct pid *pid, struct task_struct *task)
cb4df4cae4f2bd xu xin          2022-08-30  3268  {
cb4df4cae4f2bd xu xin          2022-08-30  3269  	struct mm_struct *mm;
3ab76c767bc783 xu xin          2025-01-10  3270  	int ret = 0;
cb4df4cae4f2bd xu xin          2022-08-30  3271  
cb4df4cae4f2bd xu xin          2022-08-30  3272  	mm = get_task_mm(task);
cb4df4cae4f2bd xu xin          2022-08-30  3273  	if (mm) {
cb4df4cae4f2bd xu xin          2022-08-30  3274  		seq_printf(m, "ksm_rmap_items %lu\n", mm->ksm_rmap_items);
c2dc78b86e0821 Chengming Zhou  2024-05-28  3275  		seq_printf(m, "ksm_zero_pages %ld\n", mm_ksm_zero_pages(mm));
d21077fbc2fc98 Stefan Roesch   2023-04-17  3276  		seq_printf(m, "ksm_merging_pages %lu\n", mm->ksm_merging_pages);
d21077fbc2fc98 Stefan Roesch   2023-04-17  3277  		seq_printf(m, "ksm_process_profit %ld\n", ksm_process_profit(mm));
3ab76c767bc783 xu xin          2025-01-10  3278  		seq_printf(m, "ksm_merge_any: %s\n",
d14d3f535e13ff Lorenzo Stoakes 2025-08-12 @3279  				mm_flags_test(MMF_VM_MERGE_ANY, mm) ? "yes" : "no");
3ab76c767bc783 xu xin          2025-01-10  3280  		ret = mmap_read_lock_killable(mm);
3ab76c767bc783 xu xin          2025-01-10  3281  		if (ret) {
3ab76c767bc783 xu xin          2025-01-10  3282  			mmput(mm);
3ab76c767bc783 xu xin          2025-01-10  3283  			return ret;
3ab76c767bc783 xu xin          2025-01-10  3284  		}
3ab76c767bc783 xu xin          2025-01-10  3285  		seq_printf(m, "ksm_mergeable: %s\n",
3ab76c767bc783 xu xin          2025-01-10  3286  				ksm_process_mergeable(mm) ? "yes" : "no");
3ab76c767bc783 xu xin          2025-01-10  3287  		mmap_read_unlock(mm);
cb4df4cae4f2bd xu xin          2022-08-30  3288  		mmput(mm);
cb4df4cae4f2bd xu xin          2022-08-30  3289  	}
cb4df4cae4f2bd xu xin          2022-08-30  3290  
cb4df4cae4f2bd xu xin          2022-08-30  3291  	return 0;
cb4df4cae4f2bd xu xin          2022-08-30  3292  }
7609385337a4fe xu xin          2022-04-28  3293  #endif /* CONFIG_KSM */
7609385337a4fe xu xin          2022-04-28  3294  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
