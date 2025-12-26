Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8F313266
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766717036; cv=none; b=Wt0NPdrd5buhNuj00m1OdR6FOxP5jb3NufvXnj2uSaCiCtOXAF/+nwjLTTxUm5v8LyBUsnWIW64Dmn/MQ2ieEX6rErvGHINu0c9k8J/yYUpYChvsz29FvV25ESCzirLfs8ypjuhEQOb8mvojQUJQ1yyROBHPAXbF7pHpkg83jPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766717036; c=relaxed/simple;
	bh=zsJgbWdLRwXHp5N5iX89XfOwg01sesJBGP9AGBvlFSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XOsiT0fpZ4QwAEqd89VNa/aIyvrMiPBh3bkCxChm/qMT2U1SOYrTUYCKRgjNwN6opMrWGqgRResIJua+fPVO31fMoG4JAoiFi9pGIu3TF1h7nsFDIUzOenH4mSh4SMvAzxSzcOGVI9KxUIaOftnw5RBRvwfIwdNEd0/RxVgZdp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ls46/j7l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ls46/j7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766717034; x=1798253034;
  h=date:from:to:cc:subject:message-id;
  bh=zsJgbWdLRwXHp5N5iX89XfOwg01sesJBGP9AGBvlFSM=;
  b=Ls46/j7lx0AEJtO0UgFdvK2g3Kx1pUsbAYmkS5kXbPlMmCDAy/DdDqkt
   +XSmR+g8i4LR2GyLoJ32Xtjn5D9WKyVWn0P2WtMKt3fl8lKY/kjaF7I2H
   yHNpJoFbaBn657Nax3K9mUYgJIz7xnnuw3p/BuqOll0Dd1ByQbgsq021E
   z5TXBrZ6tQp+0CEgMlMYpe8Pj3gHSdMJB6Uzb6jpy9cwstAq8WwjHB9rr
   ao5Df6XY2oRDApQPI15DQp4/dVLgz9ylT/ppQCoqO8zDBu2Gp/SizIyvy
   g655rBboUNu6yTLnNV6m3KTrjsM8TmBHD0nafg1yM+Qbvzw3oZa3Fkpws
   A==;
X-CSE-ConnectionGUID: eSXGHImETZm8tcXypC22gQ==
X-CSE-MsgGUID: aXr8Dj63Q2KNyMSeuTs8Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79213417"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79213417"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 18:43:54 -0800
X-CSE-ConnectionGUID: 7Q3lyCsWRpef4WHQOKkU/A==
X-CSE-MsgGUID: QNDy2SJrRVCG8+zNaK1rLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200796616"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Dec 2025 18:43:53 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYxnx-000000004dF-2l08;
	Fri, 26 Dec 2025 02:43:49 +0000
Date: Fri, 26 Dec 2025 10:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/s390/kernel/vdso/vdso.so.dbg: dynamic relocations are
 not supported
Message-ID: <202512261016.ALVJ0hax-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dynamic relocations are not supported"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Jens Remus <jremus@linux.ibm.com>

Hi Heiko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: c0087d807ae86cc82cc356e366d2dccf0e3bb225 s390/vdso: Rename vdso64 to vdso
date:   4 weeks ago
:::::: branch date: 33 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-r071-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261016.ALVJ0hax-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261016.ALVJ0hax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512261016.ALVJ0hax-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h: In function 'mm_cid_get':
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
     struct cpumask *cpumask;
                     ^~~~~~~
>> arch/s390/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/s390/kernel/vdso/Makefile:54: arch/s390/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:154: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
