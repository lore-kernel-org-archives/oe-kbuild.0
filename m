Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59F25771
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782413190; cv=none; b=rskownzr8XfAD1kBjyxrGUSo5fVklun1KAp6UACYzZdef4bR4bqO8ypdampJf3YEYKpBNx+hTWlWy0fJJ+MkiEpn5mfjI6d/Hdn+RlPlSyaKmkFVkzmGb38FMeS7yu64Ct50ZTAHI8Xw097jjifRYBVUrgUooTcCRLSsHiMLLjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782413190; c=relaxed/simple;
	bh=Yh9T2yhWBenJa/1xop+IridfMHbn+Vebl3bCmr2FCJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uq0XQSUtuf+30+4QjvB9fXkw4HHk2rXb3C6jr+FPSfcrL1lkskcLOyynID11HDPH54OrLDa6Z6+oDhuJPCO75xCy0b73DxnvhuNQIDJ01BI9MyYKNT4IShhyk/qhnwAfJmcKa7MIR5u9XIPauqU9HT+3v9uLOUStBnvjqwJzyxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glD3EB3a; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glD3EB3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782413189; x=1813949189;
  h=date:from:to:cc:subject:message-id;
  bh=Yh9T2yhWBenJa/1xop+IridfMHbn+Vebl3bCmr2FCJ0=;
  b=glD3EB3astCIq3vrT5Vhf1++QNEo9m5KPu5q8XBG408RbPGQbBexcnh7
   b7UoKRL+yZxdpNzP1alhhqC0S/OPuqKgrg/1jTKrrK86SLJxHEPJW+6ev
   34VMuvsqfDpfEHIugEH3+04DFhW6igZllLggezr7ySh5UPEpzxw73cY8S
   2Za4OhBL1hM7FY3hYepCypoKnoEgHAs40AI/7pL0aDPJGuGztA2Xx6abT
   t645Kh+Wq3PiBGM95XYHNpFcvNsQyyimeSHPYkzmCVlyxi2BiLu7qsSPH
   u4ZrDnpbklVkCNpqCyvgdmWPLORmG3hyZoX8GoVXdWyVCU6T7lRzaONq7
   Q==;
X-CSE-ConnectionGUID: pGhCndBuSNqb8G2YG/DqCQ==
X-CSE-MsgGUID: 83iQQbGpQDKKVHnwcyYkpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="70711343"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="70711343"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 11:46:28 -0700
X-CSE-ConnectionGUID: bBLNMc4PRtOTClZl1KbmQA==
X-CSE-MsgGUID: RxhJyFB9TuWAL7Mi4hFXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="246544901"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jun 2026 11:46:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcp5k-000000004Of-2A96;
	Thu, 25 Jun 2026 18:46:24 +0000
Date: Fri, 26 Jun 2026 02:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/migrate.c:445 pmd_migration_entry_wait() warn:
 inconsistent returns 'ptl'.
Message-ID: <202606260236.YopQx3ft-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab9de95c9cf952332ab79453b4b5d1bfca8e514f
commit: 10dd5a0009898ba35eafeb6087e5c83b84742ff1 s390/mm: Enable THP_SWAP and THP_MIGRATION
date:   11 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r072-20260625 (https://download.01.org/0day-ci/archive/20260626/202606260236.YopQx3ft-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 10dd5a000989 ("s390/mm: Enable THP_SWAP and THP_MIGRATION")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606260236.YopQx3ft-lkp@intel.com/

smatch warnings:
mm/migrate.c:445 pmd_migration_entry_wait() warn: inconsistent returns 'ptl'.

vim +/ptl +445 mm/migrate.c

30dad30922ccc7 Naoya Horiguchi 2013-06-12  433  
616b8371539a6c Zi Yan          2017-09-08  434  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
616b8371539a6c Zi Yan          2017-09-08  435  void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
616b8371539a6c Zi Yan          2017-09-08  436  {
616b8371539a6c Zi Yan          2017-09-08  437  	spinlock_t *ptl;
616b8371539a6c Zi Yan          2017-09-08  438  
616b8371539a6c Zi Yan          2017-09-08  439  	ptl = pmd_lock(mm, pmd);
616b8371539a6c Zi Yan          2017-09-08  440  	if (!is_pmd_migration_entry(*pmd))
616b8371539a6c Zi Yan          2017-09-08  441  		goto unlock;
0cb8fd4d14165a Hugh Dickins    2023-06-08  442  	migration_entry_wait_on_locked(pmd_to_swp_entry(*pmd), ptl);
616b8371539a6c Zi Yan          2017-09-08  443  	return;
616b8371539a6c Zi Yan          2017-09-08  444  unlock:
616b8371539a6c Zi Yan          2017-09-08 @445  	spin_unlock(ptl);
616b8371539a6c Zi Yan          2017-09-08  446  }
616b8371539a6c Zi Yan          2017-09-08  447  #endif
616b8371539a6c Zi Yan          2017-09-08  448  

:::::: The code at line 445 was first introduced by commit
:::::: 616b8371539a6c487404c3b8fb04078016dab4ba mm: thp: enable thp migration in generic path

:::::: TO: Zi Yan <zi.yan@cs.rutgers.edu>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
