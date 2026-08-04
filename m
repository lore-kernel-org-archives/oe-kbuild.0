Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799533D505
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823448; cv=none; b=ji6JdRI5+37E6napJNd9VwsVfLqWjJr1CCiz+cRmyaZ9al5TBXgmmCO5vXmWEcKgkYDwO6DhIuwPbjQI4DQpDa6RSV7b3IcfzIqQZbwy4shgHDIktnABZ88HXaD7oBe5sKGFTUsJQPlLRYkX+6ChBgVvTafmU9un7NvtyCaQ56U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823448; c=relaxed/simple;
	bh=CbAC7Ht7PGyanLt+VhEH9s2SZ+Nu5MaBl8Z0+mBbgps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pnBRk1zpVGiZXSRUtJlLgQCSWu3kjVJ28LJCcu4n8cr7hTTBC8GJyNyHrmUuXapH6nTe5B1EkHlQ7dvkj49Nm/KTsgCN/BBTkE2itJ00ZNiMXTze3OEnT5GF2WutneuceHQUjwZTkELJVdRosnrbaAv8v/4VOJE3x+8FBLGjYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5WdkHp7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5WdkHp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785823446; x=1817359446;
  h=date:from:to:cc:subject:message-id;
  bh=CbAC7Ht7PGyanLt+VhEH9s2SZ+Nu5MaBl8Z0+mBbgps=;
  b=F5WdkHp7r+wyE/IQEyLANWondn//trpms1v45QACJyXQfFAZ7p1K4ReZ
   vdAvUAuylTDamlmMz01fHMp1URJzEkPe9hmPvVUqys/lckH2+ZeIDDlpU
   4s8a640a1qOED3yzkjiArEeoNcjsE9C43iGvtwNeyX1DCATnHHtktdPa0
   QwrMEX06l/EouoEnClDbJZnr2P6aA4uEkMlsrFGoHqh/nbY9Es9jElIpR
   thuulP/2oBvdmuZCwZ3CjbBXaOA4GoZiD4CgS+JEoSANxEwOLkE8dPBTU
   nlIXr1Mpba3oT5HR3I0b8RZbH407vufZeUAkt9qcBTdiCVh4GexwOOkg9
   g==;
X-CSE-ConnectionGUID: TUa39zIPQtawhMn8uHeHGg==
X-CSE-MsgGUID: /LoC6ESjRHm1Oexom0RuiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86400524"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="86400524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 23:04:06 -0700
X-CSE-ConnectionGUID: 4P5c+Ka/TD+AgfzFlyZZIg==
X-CSE-MsgGUID: D9lk2zHmTa6H01MyE4+Fmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="261482793"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 03 Aug 2026 23:04:05 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr8Fu-0000000048M-29IS;
	Tue, 04 Aug 2026 06:04:02 +0000
Date: Tue, 04 Aug 2026 08:03:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 445/451]
 tools/testing/selftests/mm/.gitignore: warning: ignored by one of the
 .gitignore files
Message-ID: <202608040727.Jnjxktqh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Pratyush Mallick <pratmal@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Lorenzo Stoakes <ljs@kernel.org>
CC: SJ Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   e47602c51d20a93fa1711ed896dc9480de4374d9
commit: 1d8d77cdce9b8bdb5969aa93cad7dd9a8e023560 [445/451] selftests/mm: use pattern matching in .gitignore
:::::: branch date: 2 hours ago
:::::: commit date: 4 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260804/202608040727.Jnjxktqh-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040727.Jnjxktqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608040727.Jnjxktqh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/.gitignore: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/Makefile: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/charge_reserved_hugetlb.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/check_config.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/config: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/hugepage_settings.h: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/hugetlb_reparenting_test.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_compaction.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_cow.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_gup_test.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_hmm.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_hugetlb.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_hugevm.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_kmemleak_confirm.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_kmemleak_dedup.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_ksm.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_ksm_numa.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_madv_guard.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_madv_populate.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_mdwe.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_memfd_secret.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_memory_failure.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_migration.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_mkdirty.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_mlock.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_mmap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_mremap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_page_frag.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_pagemap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_pfnmap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_pkey.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_process_madv.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_process_mrelease.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_rmap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_soft_dirty.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_thp.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_userfaultfd.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_vma_merge.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_vmalloc.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/mlock2.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/mseal_helpers.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/page_frag/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/pkey-arm64.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/pkey-helpers.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/pkey-powerpc.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/pkey-x86.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/run_vmtests.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/settings: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/test_hmm.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/test_page_frag.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/test_vmalloc.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/uffd-common.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/va_high_addr_switch.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/vm_util.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/write_hugetlb_memory.sh: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
