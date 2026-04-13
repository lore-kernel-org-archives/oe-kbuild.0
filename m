Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F7382F39
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102749; cv=none; b=mTzw9hNPqPSPtB5S/MQ6jCWbjTKDr+loTz3GuO15fPbvG750f33uX8OU5Kh8EUs09hpdSCTffxEaLu6QHkmivYGXm94rYiRV8959FfL/Hy+L2NvoyFqEMaJrzV4cw8AFEOUrR7esXysR7j8/kHMgwg1glBETzYmr49Xfhs2A3KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102749; c=relaxed/simple;
	bh=6JuM+3Z2ivv/BLxkloMFwuUnAXHSX9qXn4CosPXb0d4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ousaHw4c4Qzmic3eeT0w5NNlfViaspcCsXNJ7zEr5woZfiWJKHL7ytBFZ16bhEcV2ZVbhxICd1uBo7MWFzfVa4YMsW85cDOQaIUyjeNQ/Uh4GR0bK7QQCmCtbZEHaNOsWVx+cvA3IPN8RFXCpUz4Pq/TlAptqzjQVu0Pq5M1k90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxHHJnJI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxHHJnJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776102748; x=1807638748;
  h=date:from:to:cc:subject:message-id;
  bh=6JuM+3Z2ivv/BLxkloMFwuUnAXHSX9qXn4CosPXb0d4=;
  b=FxHHJnJI/laUwDxgbOpf18meBEFiddwiFnSo/Cl2yqJP7g1XbfQ5suzN
   VT/w3kNIxs4wjprDFEUiachDXjgzWcGX2x28WBDDp7TKLs4xE4SSjka91
   S96GEXJTp6gSSbATHUiSAF4tMpXnuyRJhjHyAEt//Qrhy6bkPHJRd6vnF
   zAVcIIfPBjKkXLUVzG8CQU1hp/AZA8dI6corebREu/8EN8sBoJMcmBCrS
   Oqccf+Bo6KVDAYkO4Gq0tO1sOkP7FJRsN4Dgq+rE/07Aewky2dlZYRv6a
   kXEMfB+l/AanslhW78Ld2/beb3rZ/BMHOjj3I4YGidCbUCeOkljRjrhpv
   A==;
X-CSE-ConnectionGUID: grGHCTJ3Qi21lNCObKQ9tQ==
X-CSE-MsgGUID: JPczfJcOSfqH3gjzwuV+0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="99690849"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="99690849"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 10:52:27 -0700
X-CSE-ConnectionGUID: 3UD5K7qwQgWJl5A23RSJtw==
X-CSE-MsgGUID: nHzHGKD5Ts27myoca7eFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="227175298"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Apr 2026 10:52:24 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCLSQ-000000000id-2WYl;
	Mon, 13 Apr 2026 17:52:22 +0000
Date: Tue, 14 Apr 2026 01:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/test_hmm.c:1175:15-16: WARNING kvmalloc is used to
 allocate this memory at line 1110
Message-ID: <202604140103.G5wkFgUS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Balbir Singh <balbirs@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   028ef9c96e96197026887c0f092424679298aae8
commit: 775465fd26a325359887f9c3129444fcc76c6298 lib/test_hmm: add zone device private THP test infrastructure
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-r062-20260413 (https://download.01.org/0day-ci/archive/20260414/202604140103.G5wkFgUS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 775465fd26a3 ("lib/test_hmm: add zone device private THP test infrastructure")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604140103.G5wkFgUS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/test_hmm.c:1175:15-16: WARNING kvmalloc is used to allocate this memory at line 1110
   lib/test_hmm.c:1176:15-16: WARNING kvmalloc is used to allocate this memory at line 1115

vim +1175 lib/test_hmm.c

4c2e0f764eb444 Alex Sierra       2022-07-15  1084  
4c2e0f764eb444 Alex Sierra       2022-07-15  1085  static int dmirror_migrate_to_device(struct dmirror *dmirror,
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1086  				struct hmm_dmirror_cmd *cmd)
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1087  {
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1088  	unsigned long start, end, addr;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1089  	unsigned long size = cmd->npages << PAGE_SHIFT;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1090  	struct mm_struct *mm = dmirror->notifier.mm;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1091  	struct vm_area_struct *vma;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1092  	struct dmirror_bounce bounce;
16ce101db85db6 Alistair Popple   2022-09-28  1093  	struct migrate_vma args = { 0 };
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1094  	unsigned long next;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1095  	int ret;
775465fd26a325 Balbir Singh      2025-10-01  1096  	unsigned long *src_pfns = NULL;
775465fd26a325 Balbir Singh      2025-10-01  1097  	unsigned long *dst_pfns = NULL;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1098  
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1099  	start = cmd->addr;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1100  	end = start + size;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1101  	if (end < start)
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1102  		return -EINVAL;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1103  
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1104  	/* Since the mm is for the mirrored process, get a reference first. */
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1105  	if (!mmget_not_zero(mm))
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1106  		return -EINVAL;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1107  
775465fd26a325 Balbir Singh      2025-10-01  1108  	ret = -ENOMEM;
775465fd26a325 Balbir Singh      2025-10-01  1109  	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns),
775465fd26a325 Balbir Singh      2025-10-01 @1110  			  GFP_KERNEL | __GFP_NOFAIL);
775465fd26a325 Balbir Singh      2025-10-01  1111  	if (!src_pfns)
775465fd26a325 Balbir Singh      2025-10-01  1112  		goto free_mem;
775465fd26a325 Balbir Singh      2025-10-01  1113  
775465fd26a325 Balbir Singh      2025-10-01  1114  	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns),
775465fd26a325 Balbir Singh      2025-10-01  1115  			  GFP_KERNEL | __GFP_NOFAIL);
775465fd26a325 Balbir Singh      2025-10-01  1116  	if (!dst_pfns)
775465fd26a325 Balbir Singh      2025-10-01  1117  		goto free_mem;
775465fd26a325 Balbir Singh      2025-10-01  1118  
775465fd26a325 Balbir Singh      2025-10-01  1119  	ret = 0;
89154dd5313f77 Michel Lespinasse 2020-06-08  1120  	mmap_read_lock(mm);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1121  	for (addr = start; addr < end; addr = next) {
46e6b31d461761 Liam Howlett      2021-06-28  1122  		vma = vma_lookup(mm, addr);
46e6b31d461761 Liam Howlett      2021-06-28  1123  		if (!vma || !(vma->vm_flags & VM_READ)) {
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1124  			ret = -EINVAL;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1125  			goto out;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1126  		}
775465fd26a325 Balbir Singh      2025-10-01  1127  		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1128  		if (next > vma->vm_end)
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1129  			next = vma->vm_end;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1130  
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1131  		args.vma = vma;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1132  		args.src = src_pfns;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1133  		args.dst = dst_pfns;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1134  		args.start = addr;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1135  		args.end = next;
7d17e83abec1be Ralph Campbell    2020-07-23  1136  		args.pgmap_owner = dmirror->mdevice;
775465fd26a325 Balbir Singh      2025-10-01  1137  		args.flags = MIGRATE_VMA_SELECT_SYSTEM |
775465fd26a325 Balbir Singh      2025-10-01  1138  				MIGRATE_VMA_SELECT_COMPOUND;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1139  		ret = migrate_vma_setup(&args);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1140  		if (ret)
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1141  			goto out;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1142  
4c2e0f764eb444 Alex Sierra       2022-07-15  1143  		pr_debug("Migrating from sys mem to device mem\n");
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1144  		dmirror_migrate_alloc_and_copy(&args, dmirror);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1145  		migrate_vma_pages(&args);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1146  		dmirror_migrate_finalize_and_map(&args, dmirror);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1147  		migrate_vma_finalize(&args);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1148  	}
89154dd5313f77 Michel Lespinasse 2020-06-08  1149  	mmap_read_unlock(mm);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1150  	mmput(mm);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1151  
4c2e0f764eb444 Alex Sierra       2022-07-15  1152  	/*
4c2e0f764eb444 Alex Sierra       2022-07-15  1153  	 * Return the migrated data for verification.
4c2e0f764eb444 Alex Sierra       2022-07-15  1154  	 * Only for pages in device zone
4c2e0f764eb444 Alex Sierra       2022-07-15  1155  	 */
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1156  	ret = dmirror_bounce_init(&bounce, start, size);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1157  	if (ret)
775465fd26a325 Balbir Singh      2025-10-01  1158  		goto free_mem;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1159  	mutex_lock(&dmirror->mutex);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1160  	ret = dmirror_do_read(dmirror, start, end, &bounce);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1161  	mutex_unlock(&dmirror->mutex);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1162  	if (ret == 0) {
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1163  		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1164  				 bounce.size))
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1165  			ret = -EFAULT;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1166  	}
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1167  	cmd->cpages = bounce.cpages;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1168  	dmirror_bounce_fini(&bounce);
775465fd26a325 Balbir Singh      2025-10-01  1169  	goto free_mem;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1170  
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1171  out:
89154dd5313f77 Michel Lespinasse 2020-06-08  1172  	mmap_read_unlock(mm);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1173  	mmput(mm);
775465fd26a325 Balbir Singh      2025-10-01  1174  free_mem:
775465fd26a325 Balbir Singh      2025-10-01 @1175  	kfree(src_pfns);
775465fd26a325 Balbir Singh      2025-10-01  1176  	kfree(dst_pfns);
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1177  	return ret;
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1178  }
b2ef9f5a5cb376 Ralph Campbell    2020-04-22  1179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
