Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069EF2D9797
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765646652; cv=none; b=ql5MSWwDbPJUir8cTnoCsYxmkMIVnP+V4ruwZCekFFzkeIy+rgGrvS6c+vbNM7XQK3TBjM6cgqWRMhSz5ubZhvn2ngxuxcjPBrzS+2CVP2IyWwLl1JsxPRyMGFpWC1QeWVvYWzz4nB8vY5qL8rI9/4WikZBHL1ODh5G4xdv/RVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765646652; c=relaxed/simple;
	bh=2qymi6iMalzvrwIiPhwvNwNB+NTl6rnqOPpeoBZw4cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ObgGROJ0RYh8malevNNbXafHesyjyld8KCsG/kmduFcWSZxRe8Gj/QEAuyZzvhrZAvHeeCdq7KDnfRJi6J8AnKnYTs98R6pcSgUKqltDfdSl9LwOFt/Lu9SYd+CuXT6pbeRWt8uWlE4DbY3AcLy+3BPMHMxdZC1IEMzyhpzNFXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdnJf+C6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdnJf+C6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765646651; x=1797182651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2qymi6iMalzvrwIiPhwvNwNB+NTl6rnqOPpeoBZw4cI=;
  b=PdnJf+C64CgpG9h1BHhrrOUYXy9RlxK+cd+p0LXaSa/Z7gfZ8lZjJcJ9
   gVvxIRVXMUuId6l3tCZMSMG3h/Ai1QQzr0yVNChnjc/23cCLjF4Y3JbI3
   xfQwlo319g8u2xW5KxLqCMp9X1D7aiIxDfOoDdyufKx3yjlJm0TKR68uq
   gBX16wo0w5n/5ukAJonm2pdSLot3Uou1gB9FFK6T8IgvaTFFvnw4e07yD
   DApCX+/dSNnjcyEMNo4k2S/1dSZtAvZTfgh+/YwxXu/BmM4QG4D8Tq7xG
   8f3L5T3Ck0f9cOCI/noHvPbCUT1a1VTn93E3lMmjubhaU9o/W3xekA4zz
   w==;
X-CSE-ConnectionGUID: afiFX98aSheQ2pZgByLQkw==
X-CSE-MsgGUID: E0njcxpaSf6VG+cnwwVD7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85211063"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85211063"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:24:09 -0800
X-CSE-ConnectionGUID: 96OeaUSkTK6sbo3ogtF3Lw==
X-CSE-MsgGUID: +SbLyVhBSnWEoYLcj0lo4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197405041"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 09:24:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUTLg-000000007z9-2Wwf;
	Sat, 13 Dec 2025 17:24:04 +0000
Date: Sun, 14 Dec 2025 01:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dpll/dpll_core.c:134 dpll_xa_ref_pin_del() warn: iterator
 'i' not incremented
Message-ID: <202512140134.dBnS0mxh-lkp@intel.com>
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
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 2df8e64e01c10a4b75ea7797629f9e764a840eb0 dpll: Add basic Microchip ZL3073x support
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251214/202512140134.dBnS0mxh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140134.dBnS0mxh-lkp@intel.com/

New smatch warnings:
drivers/dpll/dpll_core.c:134 dpll_xa_ref_pin_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:568 dpll_pin_get() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/dpll/dpll_core.c:82 dpll_xa_ref_pin_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:163 dpll_xa_ref_dpll_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:215 dpll_xa_ref_dpll_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:235 dpll_xa_ref_dpll_first() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:670 dpll_pin_ref_sync_pair_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:764 dpll_pin_on_pin_register() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:798 dpll_pin_on_pin_unregister() warn: iterator 'i' not incremented

vim +/i +134 drivers/dpll/dpll_core.c

9431063ad323ac Vadim Fedorenko      2023-09-13  125  
9431063ad323ac Vadim Fedorenko      2023-09-13  126  static int dpll_xa_ref_pin_del(struct xarray *xa_pins, struct dpll_pin *pin,
38d7b94e81d068 Arkadiusz Kubalewski 2024-04-24  127  			       const struct dpll_pin_ops *ops, void *priv,
38d7b94e81d068 Arkadiusz Kubalewski 2024-04-24  128  			       void *cookie)
9431063ad323ac Vadim Fedorenko      2023-09-13  129  {
9431063ad323ac Vadim Fedorenko      2023-09-13  130  	struct dpll_pin_registration *reg;
9431063ad323ac Vadim Fedorenko      2023-09-13  131  	struct dpll_pin_ref *ref;
9431063ad323ac Vadim Fedorenko      2023-09-13  132  	unsigned long i;
9431063ad323ac Vadim Fedorenko      2023-09-13  133  
9431063ad323ac Vadim Fedorenko      2023-09-13 @134  	xa_for_each(xa_pins, i, ref) {
9431063ad323ac Vadim Fedorenko      2023-09-13  135  		if (ref->pin != pin)
9431063ad323ac Vadim Fedorenko      2023-09-13  136  			continue;
38d7b94e81d068 Arkadiusz Kubalewski 2024-04-24  137  		reg = dpll_pin_registration_find(ref, ops, priv, cookie);
9431063ad323ac Vadim Fedorenko      2023-09-13  138  		if (WARN_ON(!reg))
9431063ad323ac Vadim Fedorenko      2023-09-13  139  			return -EINVAL;
9431063ad323ac Vadim Fedorenko      2023-09-13  140  		list_del(&reg->list);
9431063ad323ac Vadim Fedorenko      2023-09-13  141  		kfree(reg);
b446631f355ece Jiri Pirko           2024-03-06  142  		if (refcount_dec_and_test(&ref->refcount)) {
9431063ad323ac Vadim Fedorenko      2023-09-13  143  			xa_erase(xa_pins, i);
9431063ad323ac Vadim Fedorenko      2023-09-13  144  			WARN_ON(!list_empty(&ref->registration_list));
9431063ad323ac Vadim Fedorenko      2023-09-13  145  			kfree(ref);
9431063ad323ac Vadim Fedorenko      2023-09-13  146  		}
9431063ad323ac Vadim Fedorenko      2023-09-13  147  		return 0;
9431063ad323ac Vadim Fedorenko      2023-09-13  148  	}
9431063ad323ac Vadim Fedorenko      2023-09-13  149  
9431063ad323ac Vadim Fedorenko      2023-09-13  150  	return -EINVAL;
9431063ad323ac Vadim Fedorenko      2023-09-13  151  }
9431063ad323ac Vadim Fedorenko      2023-09-13  152  

:::::: The code at line 134 was first introduced by commit
:::::: 9431063ad323ac864750aeba4d304389bc42ca4e dpll: core: Add DPLL framework base functions

:::::: TO: Vadim Fedorenko <vadim.fedorenko@linux.dev>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
