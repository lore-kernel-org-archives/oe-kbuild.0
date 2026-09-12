Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1205360EE9
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226720; cv=none; b=CHR0XkiZsf1Oz+0xO7auqM6mmIeh6v2ovYZPecl41Sd8341NgMqQ9PhsR+RFngBszDE5PrUnbxMOhJhrciVQkI0wUyLzbyXctTwcP0bH9+yPh1LO2Z2qTfwqmw0iic6fBndcUONitIFGxhBF0SzkR8Vn+dL0KNO8eOp2HidSOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226720; c=relaxed/simple;
	bh=1Upg9fFQyFgIV7ich0XmKoPMEL2hjPUB27TOFV4HCFI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fI31gSiJDhOS2di6r2nft3a9n+6jqHoLELnGzz5aCZMFY5M/+VKcVYqBMGPwZWfkGPvFNCZdd5DnBLRaLAAAWMxDsC3o1dH74hygizyggDn0sgIZN4NL9ZTdOKQHZdrxRUULqFSQZccM9c3iLbwc1sLBL+FDgOURqBNOohLDZHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCvg5ejF; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCvg5ejF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789226717; x=1820762717;
  h=date:from:to:cc:subject:message-id;
  bh=1Upg9fFQyFgIV7ich0XmKoPMEL2hjPUB27TOFV4HCFI=;
  b=KCvg5ejF4ZLwHmVbZvo7VYtSzVSudR5BdE3dO/7F8WqIXUUG5M0UweF8
   ZLhzGZvHvaCqlm7KdTIjR3n4Tnvvg8fxhFI91NTcS/q1GSS7JbVxGc6H+
   ekYUSvy1VD8/P4bVRcgRlQScH6i6MXpCiQvdayQZfo50AAYE53nl25wba
   k84DDjNiFK1mY+IMrGb/l0daJ8/fwY726z9a/Qk7KHkHf6yU/lRAks+hQ
   vpdPfgF8UC6f5oHwmSLFCzZAadeGDXW5Qyfk3dxwvTFM/LBlT86jngKcN
   160c6QjUCj8RnmPgp8hme6we1EOC6HfTQqsEFWnrrc5KyQ3guzndZorU5
   Q==;
X-CSE-ConnectionGUID: AhZweakcRqaAitZiiqrrCw==
X-CSE-MsgGUID: NuGzm4taSrGaqEHU9ksKNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="168165"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="168165"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 08:25:15 -0700
X-CSE-ConnectionGUID: ZpZNzmGXROOw/qKLcJ00Kg==
X-CSE-MsgGUID: WAwNukuuRZ6fFQ0GLYqqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="275731925"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Sep 2026 08:25:13 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5PbL-000000001AN-2PtW;
	Sat, 12 Sep 2026 15:25:11 +0000
Date: Sat, 12 Sep 2026 17:24:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 443/459] fs/proc/task_mmu.c:1425
 show_smaps_rollup() warn: 'vma' is an error pointer or valid
Message-ID: <202609121707.Hya5cxAX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   383fc05d4650b021f3c17e36a145106dcc61a294
commit: 69a7a3a45cf34c8bcc7552221d1ee62b001ec2a1 [443/459] proc/task_mmu: read proc/pid/smaps_rollup under per-vma lock
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: riscv-randconfig-r073-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121707.Hya5cxAX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 707c032dae3bee24eae29c6f4c459a6d6dc6556d)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609121707.Hya5cxAX-lkp@intel.com/

New smatch warnings:
fs/proc/task_mmu.c:1425 show_smaps_rollup() warn: 'vma' is an error pointer or valid

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/vma +1425 fs/proc/task_mmu.c

258f669e7e88c1 Vlastimil Babka         2018-08-21  1391  
258f669e7e88c1 Vlastimil Babka         2018-08-21  1392  static int show_smaps_rollup(struct seq_file *m, void *v)
258f669e7e88c1 Vlastimil Babka         2018-08-21  1393  {
258f669e7e88c1 Vlastimil Babka         2018-08-21  1394  	struct proc_maps_private *priv = m->private;
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1395  	struct proc_maps_locking_ctx *lock_ctx = &priv->lock_ctx;
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1396  	struct mm_struct *mm = lock_ctx->mm;
860a2e7fa4a186 Alexey Dobriyan         2023-09-29  1397  	struct mem_size_stats mss = {};
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1398  	unsigned long last_vma_end = 0;
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1399  	unsigned long vma_start = 0;
258f669e7e88c1 Vlastimil Babka         2018-08-21  1400  	struct vm_area_struct *vma;
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1401  	loff_t pos = 0;
258f669e7e88c1 Vlastimil Babka         2018-08-21  1402  	int ret = 0;
258f669e7e88c1 Vlastimil Babka         2018-08-21  1403  
258f669e7e88c1 Vlastimil Babka         2018-08-21  1404  	priv->task = get_proc_task(priv->inode);
258f669e7e88c1 Vlastimil Babka         2018-08-21  1405  	if (!priv->task)
258f669e7e88c1 Vlastimil Babka         2018-08-21  1406  		return -ESRCH;
258f669e7e88c1 Vlastimil Babka         2018-08-21  1407  
258f669e7e88c1 Vlastimil Babka         2018-08-21  1408  	if (!mm || !mmget_not_zero(mm)) {
258f669e7e88c1 Vlastimil Babka         2018-08-21  1409  		ret = -ESRCH;
258f669e7e88c1 Vlastimil Babka         2018-08-21  1410  		goto out_put_task;
258f669e7e88c1 Vlastimil Babka         2018-08-21  1411  	}
258f669e7e88c1 Vlastimil Babka         2018-08-21  1412  
258f669e7e88c1 Vlastimil Babka         2018-08-21  1413  	hold_task_mempolicy(priv);
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1414  	rcu_read_lock();
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1415  	reset_lock_ctx(lock_ctx);
258f669e7e88c1 Vlastimil Babka         2018-08-21  1416  
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1417  	vma_iter_init(&priv->iter, mm, 0);
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1418  	vma = proc_get_vma(m, &pos);
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06  1419) 	if (unlikely(!vma))
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06  1420) 		goto empty_set;
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06  1421) 
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1422  	if (!IS_ERR(vma))
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06  1423) 		vma_start = vma->vm_start;
ff9f47f6f00cfe Chinwen Chang           2020-10-13  1424  
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11 @1425  	while (vma) {
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1426  		if (IS_ERR(vma)) {
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1427  			ret = PTR_ERR(vma);
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1428  			goto out_unlock;
ff9f47f6f00cfe Chinwen Chang           2020-10-13  1429  		}
ff9f47f6f00cfe Chinwen Chang           2020-10-13  1430  
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1431  		if (vma->vm_start < last_vma_end) {
ff9f47f6f00cfe Chinwen Chang           2020-10-13  1432  			/*
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1433  			 * After retaking the lock, already reported VMA grew
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1434  			 * or got merged with the next one and we found it
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1435  			 * again. Gather stats for the remaining portion by
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1436  			 * starting at last_vma_end.
ff9f47f6f00cfe Chinwen Chang           2020-10-13  1437  			 */
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1438  			smap_gather_stats_range(priv, vma, &mss, last_vma_end);
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1439  		} else {
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1440  			/* Found next unreported VMA, start from its beginning */
143ffc016ffd18 Suren Baghdasaryan      2026-09-11  1441  			smap_gather_stats(priv, vma, &mss);
6d065f507d8230 Yuanyuan Zhong          2024-05-23  1442  		}
6d065f507d8230 Yuanyuan Zhong          2024-05-23  1443  		last_vma_end = vma->vm_end;
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1444  
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1445  		/*
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1446  		 * If the VMA lock is not taken, we hold the often contended
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1447  		 * mmap lock. This can happen if we had to fall back to the
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1448  		 * mmap lock.
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1449  		 *
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1450  		 * To relieve pressure, check if it is indeed contended, then
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1451  		 * temporarily release it.
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1452  		 */
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1453  		if (lock_ctx->mmap_locked &&
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1454  		    mmap_lock_is_contended(lock_ctx->mm)) {
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1455  			unlock_ctx_mm(lock_ctx);
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1456  			/*
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1457  			 * Even though we previously fell back to mmap lock,
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1458  			 * we try taking VMA lock for the next VMA, since it
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1459  			 * might not be under modification. In the worst case
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1460  			 * we will fall back to mmap lock again.
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1461  			 */
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1462  			rcu_read_lock();
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1463  			reset_lock_ctx(lock_ctx);
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1464  			/* Resume from the last position. */
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1465  			pos = last_vma_end;
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1466  			vma_iter_init(&priv->iter, mm, pos);
6d065f507d8230 Yuanyuan Zhong          2024-05-23  1467  		}
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1468  		vma = proc_get_vma(m, &pos);
ff9f47f6f00cfe Chinwen Chang           2020-10-13  1469  	}
258f669e7e88c1 Vlastimil Babka         2018-08-21  1470  
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06  1471) empty_set:
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06  1472) 	show_vma_header_prefix(m, vma_start, last_vma_end, 0, 0, 0, 0);
258f669e7e88c1 Vlastimil Babka         2018-08-21  1473  	seq_pad(m, ' ');
258f669e7e88c1 Vlastimil Babka         2018-08-21  1474  	seq_puts(m, "[rollup]\n");
258f669e7e88c1 Vlastimil Babka         2018-08-21  1475  
ee2ad71b0756e9 Luigi Semenzato         2019-07-11  1476  	__show_smap(m, &mss, true);
258f669e7e88c1 Vlastimil Babka         2018-08-21  1477  
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1478  out_unlock:
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1479  	if (lock_ctx->mmap_locked) {
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1480  		unlock_ctx_mm(lock_ctx);
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1481  	} else {
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1482  		unlock_ctx_vma(lock_ctx);
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1483  		rcu_read_unlock();
69a7a3a45cf34c Suren Baghdasaryan      2026-09-11  1484  	}
258f669e7e88c1 Vlastimil Babka         2018-08-21  1485  	release_task_mempolicy(priv);
a26a9781554857 Konstantin Khlebnikov   2019-07-11  1486  	mmput(mm);
258f669e7e88c1 Vlastimil Babka         2018-08-21  1487  out_put_task:
258f669e7e88c1 Vlastimil Babka         2018-08-21  1488  	put_task_struct(priv->task);
258f669e7e88c1 Vlastimil Babka         2018-08-21  1489  	priv->task = NULL;
258f669e7e88c1 Vlastimil Babka         2018-08-21  1490  
493b0e9d945fa9 Daniel Colascione       2017-09-06  1491  	return ret;
e070ad49f31155 Mauricio Lin            2005-09-03  1492  }
d1be35cb6f9697 Andrei Vagin            2018-04-10  1493  #undef SEQ_PUT_DEC
e070ad49f31155 Mauricio Lin            2005-09-03  1494  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
