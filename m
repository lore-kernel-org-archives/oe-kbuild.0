Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9D2236E5
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765606994; cv=none; b=m1au/cx4howMinQY1m3sAXMSkpRzlFYb7tG+803J7d7+9kXHL8GIfwGbvaSiEk6oeRvW03ZLf0hqOjzYgNRg60/o2td5OX4gxOYzgt25EZ2ulzKcY4M5mENbshbAQ3LG4T0zW5w+uiC9s5oTas6VwA5MfmokJXbS9vN5PzoFpQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765606994; c=relaxed/simple;
	bh=0+Ym+29DRUVc0ULvUnrYpS+Y6Fxw/wEgQ65LtxU+9/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1jW0T/u4rZF5mwN69WHOS8eA3d82STbrDm0qFkxS6C2ySqT6xtB0BJR4NU+d3MuDVhZdzZD0E4VHowElT8+uQUzH7YpjqO7xcGDE3G3tRD7fbo5SY2uF9FJUqVYIVFm3CZ3LKh9QiCaQU7u0rcKxlrg81qfbiLYv3+cg35dh5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR6JiGSA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR6JiGSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765606993; x=1797142993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+Ym+29DRUVc0ULvUnrYpS+Y6Fxw/wEgQ65LtxU+9/s=;
  b=KR6JiGSAYOsxrzZVA4jqrLSPnaxtTLc9kHr3z0uIgTqXKfHQNS9VJsng
   n7XAeoP+e1slEQydrlbufEVggxPqhxxKozLsH2tNstpqG3Jx/WDAm5eDo
   76/uBvCwhPO5v4pqIqW4fDNjOtO249El65vhNfsQtJSRqMM6XGw5OkOvP
   UFDnqmv9IvFSaXQmHbKvDhSSPzj0Av8aRwADeNCrd2bUrwd2kHRAWEBkp
   nWGDYDmuVSYxQoVI1B+fjkYjpBA20KtXXlkoR1uNJstLUhCgX3B9N1SV6
   chJ2xCCJAcXvyBQ6LaKYr5FBdEyw4y3TRPiCN0QlKCY+scpJvfdrt0dQn
   w==;
X-CSE-ConnectionGUID: rxN+XWLDTm293g5EvIVk0A==
X-CSE-MsgGUID: qAXsnsh0SXOu696Gyndxbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85195464"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85195464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:23:09 -0800
X-CSE-ConnectionGUID: Ox88km96QkKFx6Hs02MZbw==
X-CSE-MsgGUID: F/AqfPbbTEC2fDF52Mph/w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2025 22:23:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJ22-000000007AF-1EZJ;
	Sat, 13 Dec 2025 06:23:06 +0000
Date: Sat, 13 Dec 2025 14:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dpll/dpll_core.c:798 dpll_pin_on_pin_unregister() warn:
 iterator 'i' not incremented
Message-ID: <202512131459.frWkBa7g-lkp@intel.com>
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
head:   a919610db43b34621d0c3b333e12db9002caf5da
commit: 2df8e64e01c10a4b75ea7797629f9e764a840eb0 dpll: Add basic Microchip ZL3073x support
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131459.frWkBa7g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131459.frWkBa7g-lkp@intel.com/

New smatch warnings:
drivers/dpll/dpll_core.c:798 dpll_pin_on_pin_unregister() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/dpll/dpll_core.c:82 dpll_xa_ref_pin_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:134 dpll_xa_ref_pin_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:163 dpll_xa_ref_dpll_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:215 dpll_xa_ref_dpll_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:235 dpll_xa_ref_dpll_first() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:568 dpll_pin_get() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:670 dpll_pin_ref_sync_pair_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:764 dpll_pin_on_pin_register() warn: iterator 'i' not incremented

vim +/i +798 drivers/dpll/dpll_core.c

9431063ad323ac8 Vadim Fedorenko      2023-09-13  777  
9431063ad323ac8 Vadim Fedorenko      2023-09-13  778  /**
9431063ad323ac8 Vadim Fedorenko      2023-09-13  779   * dpll_pin_on_pin_unregister - unregister dpll pin from a parent pin
9431063ad323ac8 Vadim Fedorenko      2023-09-13  780   * @parent: pointer to a parent pin
9431063ad323ac8 Vadim Fedorenko      2023-09-13  781   * @pin: pointer to a pin
9431063ad323ac8 Vadim Fedorenko      2023-09-13  782   * @ops: ops for a dpll pin
9431063ad323ac8 Vadim Fedorenko      2023-09-13  783   * @priv: pointer to private information of owner
9431063ad323ac8 Vadim Fedorenko      2023-09-13  784   *
9431063ad323ac8 Vadim Fedorenko      2023-09-13  785   * Context: Acquires a lock (dpll_lock)
9431063ad323ac8 Vadim Fedorenko      2023-09-13  786   * Note: It does not free the memory
9431063ad323ac8 Vadim Fedorenko      2023-09-13  787   */
9431063ad323ac8 Vadim Fedorenko      2023-09-13  788  void dpll_pin_on_pin_unregister(struct dpll_pin *parent, struct dpll_pin *pin,
9431063ad323ac8 Vadim Fedorenko      2023-09-13  789  				const struct dpll_pin_ops *ops, void *priv)
9431063ad323ac8 Vadim Fedorenko      2023-09-13  790  {
9431063ad323ac8 Vadim Fedorenko      2023-09-13  791  	struct dpll_pin_ref *ref;
9431063ad323ac8 Vadim Fedorenko      2023-09-13  792  	unsigned long i;
9431063ad323ac8 Vadim Fedorenko      2023-09-13  793  
9431063ad323ac8 Vadim Fedorenko      2023-09-13  794  	mutex_lock(&dpll_lock);
9d71b54b65b1fb6 Vadim Fedorenko      2023-09-13  795  	dpll_pin_delete_ntf(pin);
38d7b94e81d068b Arkadiusz Kubalewski 2024-04-24  796  	dpll_xa_ref_pin_del(&pin->parent_refs, parent, ops, priv, pin);
9431063ad323ac8 Vadim Fedorenko      2023-09-13  797  	refcount_dec(&pin->refcount);
9431063ad323ac8 Vadim Fedorenko      2023-09-13 @798  	xa_for_each(&pin->dpll_refs, i, ref)
38d7b94e81d068b Arkadiusz Kubalewski 2024-04-24  799  		__dpll_pin_unregister(ref->dpll, pin, ops, priv, parent);
9431063ad323ac8 Vadim Fedorenko      2023-09-13  800  	mutex_unlock(&dpll_lock);
9431063ad323ac8 Vadim Fedorenko      2023-09-13  801  }
9431063ad323ac8 Vadim Fedorenko      2023-09-13  802  EXPORT_SYMBOL_GPL(dpll_pin_on_pin_unregister);
9431063ad323ac8 Vadim Fedorenko      2023-09-13  803  

:::::: The code at line 798 was first introduced by commit
:::::: 9431063ad323ac864750aeba4d304389bc42ca4e dpll: core: Add DPLL framework base functions

:::::: TO: Vadim Fedorenko <vadim.fedorenko@linux.dev>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
