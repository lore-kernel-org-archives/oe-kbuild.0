Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1EB3A900B
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199854; cv=none; b=evuoOkgILsC6oi/e8m/LKLdx08EAwRUJWeCP+mkPfFoQ2hfxUM1yJzHnZt+xHQMZm9kmTazIiOH+Sh6oxbMDsQlSQZ+P27qsfBeiMVIAgQNZkZNU2QxH3NhPKLRTZv1Sl9XM0k3GqlJzf+XxOKSWIJsP6EX/Rvnd+Swuba/C8+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199854; c=relaxed/simple;
	bh=TpBAultzycBZwCZ1SJIVgSffLoq6qcKgRM84uufJsiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VRQtS1qSNOw9wOcE6CeMQsXmw8HJM8GGAitR3lubz0twLYrz1sm/0IMvnHZ1wy5vmkHQ9N+kZT+q9qm6Bz9yKhkBIiwPCdBIVE4Re1zT4MWIUsJBN1b8UcmLTeFsWXrSwFmsXB8adaScueoXSPkgNftcqtW20LPcUCHBjYV2z2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nc6JPhd2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nc6JPhd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788199852; x=1819735852;
  h=date:from:to:cc:subject:message-id;
  bh=TpBAultzycBZwCZ1SJIVgSffLoq6qcKgRM84uufJsiA=;
  b=nc6JPhd25w0H3e8TsAGz4uutZPDYFxFD3JFwoZwKnYzIbmxQMS9/AN4j
   chC/JjLQj/3hFlfaOBb98qEb06tsv4qkIGWXJEuRAjU1RfPf8ZrOoLatB
   c+ncwBo0Lt8Izz7wXyNdfAguhK66xAL5eP+7RE8UIxfMPy3elSiCC8eOM
   Mz1CKKFfmFD7sSYjjWqu7NJfNUmpB0zVB4bD0cey0DXKbHz+FzgRwpuYP
   SgJTHWyiNq3RnA2KtuozfBxoJeICZLnuwdVigXPem2uoR1OCQ/Mn/xJXi
   sH6rggtiQ69TLPdN5fkM8ykCIgvbWsjpxdj4imRd4ohbf4/ZVsp4xAiU1
   g==;
X-CSE-ConnectionGUID: ZBiU11gwSfSl2rTCJwfivw==
X-CSE-MsgGUID: I++7bxXOTGWP1jpxaNXg1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100127836"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="100127836"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 11:10:51 -0700
X-CSE-ConnectionGUID: TRuOkF7ZSC62tRNjAa1QsA==
X-CSE-MsgGUID: hFxahqXFSIeRt4Jcgu/zvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="292359270"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2026 11:10:50 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x16T1-000000000zF-350a;
	Mon, 31 Aug 2026 18:10:47 +0000
Date: Tue, 01 Sep 2026 02:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/proc/base.c:3279:4-39: opportunity for
 str_yes_no(mm_flags_test ( MMF_VM_MERGE_ANY , mm ))
Message-ID: <202609010248.vFbMtF1I-lkp@intel.com>
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
head:   cee9395acd8043be0644b25c34bfa86623f2b935
commit: d14d3f535e13ff0661b9a74133a8d6b9f9950712 mm: convert remaining users to mm_flags_*() accessors
date:   12 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 12 months ago
config: arc-randconfig-r053-20260831 (https://download.01.org/0day-ci/archive/20260901/202609010248.vFbMtF1I-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d14d3f535e13 ("mm: convert remaining users to mm_flags_*() accessors")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609010248.vFbMtF1I-lkp@intel.com/

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
