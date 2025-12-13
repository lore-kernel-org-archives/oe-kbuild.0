Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1CC7FBAC
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 01:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765589993; cv=none; b=PXzmQsu5PeB2v8wfX2ehLHYObt5/xL4t7co1zcyfmiLvMdMsFWF4xGCWmH5ayYixcvDzaQbqV2O+OrCknlbzIOb1vUPGptXYrOtidnkNmoNzv1r/mvL/QiKS87nUd3TiMOtFoT29dsD/keMAJuJUyekaqi6QC3Mo+xY7nQYqF8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765589993; c=relaxed/simple;
	bh=RmpUb6E58QiY+LxijbeyKqDBtWPdEtatHNtfRnVjp/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rjT2QgQyR4/dMoBcgHvcdeCrNDPu4+IVQTpp4FakngkPfujZsWbpdkILx3/kU5B0bs9O0VKtecKSlwsuw5PceH8jeBeAE1/or6xqWSYi0LMDB49Sq10csE1tNUkkoSFPUt6KyrS7oY4Jhw1iymggdRzFmn5VfQMZc63BnPcBTH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fp7QcO3p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fp7QcO3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765589990; x=1797125990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmpUb6E58QiY+LxijbeyKqDBtWPdEtatHNtfRnVjp/0=;
  b=fp7QcO3pibdXVNCpiuw2HAZyTNFzGSGQBYHYJu4VR7BJ25JnRyHylEio
   AfXQk+zmHbX2mGYtDLKu35cqFhV4CNWUjYRc64Ul+Mkh8+vlORnf43JwC
   PXveUnWlNEx8HyjTDE8vgg4qar7zTpJAGk3wXig6FwRAFy5b/815RHebS
   NYjYJDwAYN1aPYlQ1n6UmYJcfcomrJsOZqS7Nb4rC4/u7lqvmNrn0Z5Yi
   VQ9q6xHmwXKLuFpdKz4NnvL7APrU79Pnel3GEZhdUbwow9OswFuhoHimx
   Y11hJJctU6JEWJzZs/0QF0Cva1BDHDFkLoIF8zto8LLVnvCJSyNyLTSo2
   A==;
X-CSE-ConnectionGUID: f9R0LCbVRJuH4QW0h1o5dg==
X-CSE-MsgGUID: sFDUyBImReOJ58xba6YyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85187712"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85187712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:39:48 -0800
X-CSE-ConnectionGUID: ixkyancwQEijdYZusO55mw==
X-CSE-MsgGUID: xzEW6l5mSoa+lDd7HhJrlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227888683"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 17:39:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUEbo-000000006tT-1cH0;
	Sat, 13 Dec 2025 01:39:44 +0000
Date: Sat, 13 Dec 2025 09:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dpll/dpll_core.c:235 dpll_xa_ref_dpll_first() warn: iterator
 'i' not incremented
Message-ID: <202512130914.rQu8NUGq-lkp@intel.com>
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
TO: Ivan Vecera <ivecera@redhat.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jiri Pirko <jiri@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 2df8e64e01c10a4b75ea7797629f9e764a840eb0 dpll: Add basic Microchip ZL3073x support
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130914.rQu8NUGq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130914.rQu8NUGq-lkp@intel.com/

New smatch warnings:
drivers/dpll/dpll_core.c:235 dpll_xa_ref_dpll_first() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1267 dpll_pin_phase_adj_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1414 dpll_pin_find() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1617 dpll_device_find() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/dpll/dpll_core.c:82 dpll_xa_ref_pin_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:134 dpll_xa_ref_pin_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:163 dpll_xa_ref_dpll_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:215 dpll_xa_ref_dpll_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:568 dpll_pin_get() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:670 dpll_pin_ref_sync_pair_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:764 dpll_pin_on_pin_register() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:798 dpll_pin_on_pin_unregister() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:62 dpll_pin_available() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:894 dpll_pin_freq_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1046 dpll_pin_ref_sync_state_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1109 dpll_pin_on_pin_state_set() warn: iterator 'i' not incremented

vim +/i +235 drivers/dpll/dpll_core.c

9431063ad323ac Vadim Fedorenko 2023-09-13  231  
9431063ad323ac Vadim Fedorenko 2023-09-13  232  struct dpll_pin_ref *dpll_xa_ref_dpll_first(struct xarray *xa_refs)
9431063ad323ac Vadim Fedorenko 2023-09-13  233  {
9431063ad323ac Vadim Fedorenko 2023-09-13  234  	struct dpll_pin_ref *ref;
9431063ad323ac Vadim Fedorenko 2023-09-13 @235  	unsigned long i = 0;
9431063ad323ac Vadim Fedorenko 2023-09-13  236  
9431063ad323ac Vadim Fedorenko 2023-09-13  237  	ref = xa_find(xa_refs, &i, ULONG_MAX, XA_PRESENT);
9431063ad323ac Vadim Fedorenko 2023-09-13  238  	WARN_ON(!ref);
9431063ad323ac Vadim Fedorenko 2023-09-13  239  	return ref;
9431063ad323ac Vadim Fedorenko 2023-09-13  240  }
9431063ad323ac Vadim Fedorenko 2023-09-13  241  

:::::: The code at line 235 was first introduced by commit
:::::: 9431063ad323ac864750aeba4d304389bc42ca4e dpll: core: Add DPLL framework base functions

:::::: TO: Vadim Fedorenko <vadim.fedorenko@linux.dev>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
