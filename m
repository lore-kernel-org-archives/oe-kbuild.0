Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A123817F
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765615945; cv=none; b=GsFIjWaOU+1EAqLrtxPutTgkunXOmi5WlwHoeMUOWUw/hhiGLkCjTHx/y8L5HG99k5U4kCXj4VH5pSzM6VrojftUXUa52vF5+ZChJHKvZklB2UIrus4B03bDJienkKa9tRoDOSYfieZ8t70m8e/3IMWpFbdGF/JW0sTtlyHG1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765615945; c=relaxed/simple;
	bh=0ZM1Pf1ExwUKZ+GdAIpJy4zbzSxNLhgaAeua3M4OFz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKDVL3tIGQS+M6Hdh5/0bg+OIunMDiKjijgfRYJJXMLHE1nYO5v1uoqnJEPZay1XjJtNwtYu7fPBcOHVWvrEpkhLQg9e+tU2ouWr8KGudeDJp2ejCrz0SlC//pELSUbbh5s+/d7odTcJ2QT7g6UPXnzI0Na408kTjQ7S6w3bsrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNVEaAQ6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNVEaAQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765615944; x=1797151944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZM1Pf1ExwUKZ+GdAIpJy4zbzSxNLhgaAeua3M4OFz0=;
  b=nNVEaAQ6ucgfFfQffebc1/Rsz+ZZTu9UuRhrR/Cc0nLIWIGSj5c7u4R3
   9Y2u6ghFQK5fQseVNofGsP1Mk/zbBxl+qxRRRE/a2GSFqdF0nVcchwmcl
   fxrPzDMBfLkSX0zN+x1Hn8zQ6Lhp6GIblGDb4YLFEj5BkQLQNTkEv5Lhb
   NXJI9dvCLCGKpA1BNPTbKy5f9PZbzBSBPf0KDbcRwG6Otx91/bRQfguV9
   b7sTt7FSmtkf/I1QhCQAP2g00Yh3tPqRXPGg+/pWFMfJT/APv91Z7T4nM
   zh22lpYH8tHAidA6HmxXdMHSVRvuE5khDdFw9VFq9uoRVMI2EXoL8yvUI
   w==;
X-CSE-ConnectionGUID: ydv68Pj9RHm6A4Se3otKQA==
X-CSE-MsgGUID: QObc8rIaTZGMwyyLZNoDxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78309132"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78309132"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:52:23 -0800
X-CSE-ConnectionGUID: EWODEP96RKymSYUYjlxsMg==
X-CSE-MsgGUID: knZmds9AQB2kJ5KkDvY6aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="220663809"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 00:52:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULMR-000000007NT-2E8M;
	Sat, 13 Dec 2025 08:52:19 +0000
Date: Sat, 13 Dec 2025 16:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dpll/dpll_core.c:82 dpll_xa_ref_pin_add() warn: iterator 'i'
 not incremented
Message-ID: <202512131625.Exm6CWwW-lkp@intel.com>
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
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 2df8e64e01c10a4b75ea7797629f9e764a840eb0 dpll: Add basic Microchip ZL3073x support
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131625.Exm6CWwW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131625.Exm6CWwW-lkp@intel.com/

New smatch warnings:
drivers/dpll/dpll_core.c:82 dpll_xa_ref_pin_add() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/dpll/dpll_core.c:134 dpll_xa_ref_pin_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:163 dpll_xa_ref_dpll_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:215 dpll_xa_ref_dpll_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:235 dpll_xa_ref_dpll_first() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:568 dpll_pin_get() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:670 dpll_pin_ref_sync_pair_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:764 dpll_pin_on_pin_register() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:798 dpll_pin_on_pin_unregister() warn: iterator 'i' not incremented

vim +/i +82 drivers/dpll/dpll_core.c

9431063ad323ac Vadim Fedorenko      2023-09-13   70  
9431063ad323ac Vadim Fedorenko      2023-09-13   71  static int
9431063ad323ac Vadim Fedorenko      2023-09-13   72  dpll_xa_ref_pin_add(struct xarray *xa_pins, struct dpll_pin *pin,
38d7b94e81d068 Arkadiusz Kubalewski 2024-04-24   73  		    const struct dpll_pin_ops *ops, void *priv,
38d7b94e81d068 Arkadiusz Kubalewski 2024-04-24   74  		    void *cookie)
9431063ad323ac Vadim Fedorenko      2023-09-13   75  {
9431063ad323ac Vadim Fedorenko      2023-09-13   76  	struct dpll_pin_registration *reg;
9431063ad323ac Vadim Fedorenko      2023-09-13   77  	struct dpll_pin_ref *ref;
9431063ad323ac Vadim Fedorenko      2023-09-13   78  	bool ref_exists = false;
9431063ad323ac Vadim Fedorenko      2023-09-13   79  	unsigned long i;
9431063ad323ac Vadim Fedorenko      2023-09-13   80  	int ret;
9431063ad323ac Vadim Fedorenko      2023-09-13   81  
9431063ad323ac Vadim Fedorenko      2023-09-13  @82  	xa_for_each(xa_pins, i, ref) {
9431063ad323ac Vadim Fedorenko      2023-09-13   83  		if (ref->pin != pin)
9431063ad323ac Vadim Fedorenko      2023-09-13   84  			continue;
38d7b94e81d068 Arkadiusz Kubalewski 2024-04-24   85  		reg = dpll_pin_registration_find(ref, ops, priv, cookie);
9431063ad323ac Vadim Fedorenko      2023-09-13   86  		if (reg) {
9431063ad323ac Vadim Fedorenko      2023-09-13   87  			refcount_inc(&ref->refcount);
9431063ad323ac Vadim Fedorenko      2023-09-13   88  			return 0;
9431063ad323ac Vadim Fedorenko      2023-09-13   89  		}
9431063ad323ac Vadim Fedorenko      2023-09-13   90  		ref_exists = true;
9431063ad323ac Vadim Fedorenko      2023-09-13   91  		break;
9431063ad323ac Vadim Fedorenko      2023-09-13   92  	}
9431063ad323ac Vadim Fedorenko      2023-09-13   93  
9431063ad323ac Vadim Fedorenko      2023-09-13   94  	if (!ref_exists) {
9431063ad323ac Vadim Fedorenko      2023-09-13   95  		ref = kzalloc(sizeof(*ref), GFP_KERNEL);
9431063ad323ac Vadim Fedorenko      2023-09-13   96  		if (!ref)
9431063ad323ac Vadim Fedorenko      2023-09-13   97  			return -ENOMEM;
9431063ad323ac Vadim Fedorenko      2023-09-13   98  		ref->pin = pin;
9431063ad323ac Vadim Fedorenko      2023-09-13   99  		INIT_LIST_HEAD(&ref->registration_list);
9431063ad323ac Vadim Fedorenko      2023-09-13  100  		ret = xa_insert(xa_pins, pin->pin_idx, ref, GFP_KERNEL);
9431063ad323ac Vadim Fedorenko      2023-09-13  101  		if (ret) {
9431063ad323ac Vadim Fedorenko      2023-09-13  102  			kfree(ref);
9431063ad323ac Vadim Fedorenko      2023-09-13  103  			return ret;
9431063ad323ac Vadim Fedorenko      2023-09-13  104  		}
9431063ad323ac Vadim Fedorenko      2023-09-13  105  		refcount_set(&ref->refcount, 1);
9431063ad323ac Vadim Fedorenko      2023-09-13  106  	}
9431063ad323ac Vadim Fedorenko      2023-09-13  107  
9431063ad323ac Vadim Fedorenko      2023-09-13  108  	reg = kzalloc(sizeof(*reg), GFP_KERNEL);
9431063ad323ac Vadim Fedorenko      2023-09-13  109  	if (!reg) {
9431063ad323ac Vadim Fedorenko      2023-09-13  110  		if (!ref_exists) {
9431063ad323ac Vadim Fedorenko      2023-09-13  111  			xa_erase(xa_pins, pin->pin_idx);
9431063ad323ac Vadim Fedorenko      2023-09-13  112  			kfree(ref);
9431063ad323ac Vadim Fedorenko      2023-09-13  113  		}
9431063ad323ac Vadim Fedorenko      2023-09-13  114  		return -ENOMEM;
9431063ad323ac Vadim Fedorenko      2023-09-13  115  	}
9431063ad323ac Vadim Fedorenko      2023-09-13  116  	reg->ops = ops;
9431063ad323ac Vadim Fedorenko      2023-09-13  117  	reg->priv = priv;
38d7b94e81d068 Arkadiusz Kubalewski 2024-04-24  118  	reg->cookie = cookie;
9431063ad323ac Vadim Fedorenko      2023-09-13  119  	if (ref_exists)
9431063ad323ac Vadim Fedorenko      2023-09-13  120  		refcount_inc(&ref->refcount);
9431063ad323ac Vadim Fedorenko      2023-09-13  121  	list_add_tail(&reg->list, &ref->registration_list);
9431063ad323ac Vadim Fedorenko      2023-09-13  122  
9431063ad323ac Vadim Fedorenko      2023-09-13  123  	return 0;
9431063ad323ac Vadim Fedorenko      2023-09-13  124  }
9431063ad323ac Vadim Fedorenko      2023-09-13  125  

:::::: The code at line 82 was first introduced by commit
:::::: 9431063ad323ac864750aeba4d304389bc42ca4e dpll: core: Add DPLL framework base functions

:::::: TO: Vadim Fedorenko <vadim.fedorenko@linux.dev>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
