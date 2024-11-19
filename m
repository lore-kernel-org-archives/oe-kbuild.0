Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053D1465BB
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Nov 2024 03:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985680; cv=none; b=it8zPnhZZoM6UUQ6O9dytxwqHQIf06lC29bSkW+e21sMP3a5DJIvRzZfPvDHHrrySBXaCTNYZAiVimUSrghtfZ5keRrE3Nv1jgnoPsa3aLDWIiBrPeFpeiijwOPKtWXPkKl1FWmSDGqD17rKxSw/RCh4h6Snyi2RqAbiENPDmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985680; c=relaxed/simple;
	bh=zX8CG+e10tPCyotWNIy/M7DS3EdbhyKTb/eWqKL/BDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=neWu3URE6kTc2R8N+AM5xtYj+GA1pTMFO/rkoMplyiGoCysGI/rc/GkuLYAmX13Dal2y9TZSQMG0RF72pQR+sPONyFAo4E7d6yf6SwzO0nbcMEca3JVr0YIq28LbUTj+4okkXxsmbV+Tg+eTl5EqNrtA8FERuR9F8cHtcBQCcQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8q7lv/x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8q7lv/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731985679; x=1763521679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zX8CG+e10tPCyotWNIy/M7DS3EdbhyKTb/eWqKL/BDg=;
  b=G8q7lv/xREB9TAmIBIE0rEWkv0Cyj9hI2gKKbo25COzoTpc41RaiBM/w
   GtQBT2TvvHrDAG52+jEZfQQa0N327CdXEraumX3xxr3q3ha/OL/5FenBV
   tDo4OLZerajC637WnuBk7tf2D6UHKlNFodIhvRwJFiZAcupRzsat7PqLR
   CysnpkdGW4a4mLcBtrN1b7krdSZIXfc2F2keTTcAJb4OFEdiJBDjvVRea
   6kOSRhP/xlEgu0/rYpt8AcBj1Pf5pXW1Hb4NqI37rN1Toezs21KeM/BqH
   OhMzXKQfqP9zdTTulKGKn4cYyThr86/Rq2ZrpEfTk2LSCxIJelBYwkeCb
   Q==;
X-CSE-ConnectionGUID: UIqq1ErrQTuwhM7luuuBDA==
X-CSE-MsgGUID: PehD1EUqRLaTFbLtI447Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31904570"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31904570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 19:07:56 -0800
X-CSE-ConnectionGUID: r1Fx3jFNQtWiAmUADKCWGg==
X-CSE-MsgGUID: W2F1vajQTU6XpTb9pIE7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89576908"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2024 19:07:55 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDEam-00004n-2V;
	Tue, 19 Nov 2024 03:07:52 +0000
Date: Tue, 19 Nov 2024 11:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11884/12140] .vmlinux.export.o: warning: objtool:
 gelf_getehdr: invalid `Elf' handle
Message-ID: <202411191031.ZoZpKpuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae58226b89ac0cffa05ba7357733776542e40216
commit: d8d3f6c6690c7ff31ff52e3f2b6110b682513975 [11884/12140] kbuild: enable objtool for *.mod.o and additional kernel objects
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241118 (https://download.01.org/0day-ci/archive/20241119/202411191031.ZoZpKpuJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191031.ZoZpKpuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411191031.ZoZpKpuJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .vmlinux.export.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> kernel/locking/locktorture.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> .module-common.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> kernel/locking/test-ww_mutex.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> kernel/rcu/rcutorture.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> kernel/rcu/rcuscale.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> kernel/rcu/refscale.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> kernel/time/clocksource-wdtest.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> kernel/torture.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> mm/dmapool_test.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> fs/nfs/nfsv4.mod.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
