Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69B1367
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 04:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734670719; cv=none; b=ty2PDn020h3Bl2vdwt7ZWc1NsGZgBn0DKcgdM+Weh+kHE6TQJl29OgjtoA+0efd6inm9t+vCQA1MU68ofIWEYENbS7ikGkoPVuJ7kwUc7OTtbYDBSI1TM418FnrTUtHnwhPiF2Tvu2E1YkRO9cThFCdkXakPZ3UVLB5WDrFqfOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734670719; c=relaxed/simple;
	bh=UV6NhAPTXkKqotoa6QLxy8T0g/7XCBMAAot8AVFMLGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBNzFwZWpk5Oy6ixre1/lacst+Rj++ckPzhyIjk58KWDCxXt2R0QW6d8+K0RNrl3NmXEmUa++glJAaVB0QxB4caVWuvBUZ6X3L6yZpuCaKraAYrUV/jFhtNskQUJSJ89MlzwbBk2ch5DgHc1u7xQguYTTOg17cQKWD4iAKGERvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mST2Jegd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mST2Jegd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734670718; x=1766206718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UV6NhAPTXkKqotoa6QLxy8T0g/7XCBMAAot8AVFMLGg=;
  b=mST2Jegd0EpIuBdeAo3W3xKvGGlBHNT6wneDsPtmoc+Y7Ccfu9xm3TV7
   OSrUvihVs1JQu4o0XqqciRSm+IlEVu55ehUrvAkZCD4VpA8Yf4oFqbqCl
   KvfRvx+J7T7DyWAbklLWLU7q1Q9cBzHas+8+cXgTzESs3LMh5bzCC73FA
   Z66Kd4OWdaNCgz7cuDzZc41IMY2LO/JHCwgazgJfmn/xYpHj3k2a7Hkzk
   f7P0BL5QpP+tcDTQB7wvJ+JR3gC+Tr/XoqNMVOWW9NLa2eJJAs8EraBEl
   GlvdiVszECeSJ1M0vNY4Z7VmD+v9nNitCngkixctXcSRGmkjFvqr1COUn
   Q==;
X-CSE-ConnectionGUID: lnFPM68/TtSDzh6BJWeWeg==
X-CSE-MsgGUID: ohU5849WTEOXid1/Ud2tEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35376489"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35376489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 20:58:37 -0800
X-CSE-ConnectionGUID: U53/eGK2RUKM/0+wYv51uw==
X-CSE-MsgGUID: A/4DkVvbSc2xXy9R0X1BaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99231629"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Dec 2024 20:58:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOV5t-0000oB-1p;
	Fri, 20 Dec 2024 04:58:33 +0000
Date: Fri, 20 Dec 2024 12:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/xen/gntdev.c:813 gntdev_get_page() warn: mask and shift to
 zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <202412201259.cjBIQnxH-lkp@intel.com>
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
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: efe8419ae78d65e83edc31aad74b605c12e7d60c vdso: Introduce vdso/page.h
date:   9 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-141-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201259.cjBIQnxH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412201259.cjBIQnxH-lkp@intel.com/

smatch warnings:
drivers/xen/gntdev.c:813 gntdev_get_page() warn: mask and shift to zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'

vim +813 drivers/xen/gntdev.c

a4cdb556cae05c David Vrabel     2014-12-02  798  
a4cdb556cae05c David Vrabel     2014-12-02  799  static int gntdev_get_page(struct gntdev_copy_batch *batch, void __user *virt,
779055842da5b2 Souptick Joarder 2020-09-06  800  				unsigned long *gfn)
a4cdb556cae05c David Vrabel     2014-12-02  801  {
a4cdb556cae05c David Vrabel     2014-12-02  802  	unsigned long addr = (unsigned long)virt;
a4cdb556cae05c David Vrabel     2014-12-02  803  	struct page *page;
a4cdb556cae05c David Vrabel     2014-12-02  804  	unsigned long xen_pfn;
a4cdb556cae05c David Vrabel     2014-12-02  805  	int ret;
a4cdb556cae05c David Vrabel     2014-12-02  806  
d6bbc2ff68fd22 Souptick Joarder 2020-09-06  807  	ret = pin_user_pages_fast(addr, 1, batch->writeable ? FOLL_WRITE : 0, &page);
a4cdb556cae05c David Vrabel     2014-12-02  808  	if (ret < 0)
a4cdb556cae05c David Vrabel     2014-12-02  809  		return ret;
a4cdb556cae05c David Vrabel     2014-12-02  810  
a4cdb556cae05c David Vrabel     2014-12-02  811  	batch->pages[batch->nr_pages++] = page;
a4cdb556cae05c David Vrabel     2014-12-02  812  
a4cdb556cae05c David Vrabel     2014-12-02 @813  	xen_pfn = page_to_xen_pfn(page) + XEN_PFN_DOWN(addr & ~PAGE_MASK);
a4cdb556cae05c David Vrabel     2014-12-02  814  	*gfn = pfn_to_gfn(xen_pfn);
a4cdb556cae05c David Vrabel     2014-12-02  815  
a4cdb556cae05c David Vrabel     2014-12-02  816  	return 0;
a4cdb556cae05c David Vrabel     2014-12-02  817  }
a4cdb556cae05c David Vrabel     2014-12-02  818  

:::::: The code at line 813 was first introduced by commit
:::::: a4cdb556cae05cd3e7b602b3a44c01420c4e2258 xen/gntdev: add ioctl for grant copy

:::::: TO: David Vrabel <david.vrabel@citrix.com>
:::::: CC: David Vrabel <david.vrabel@citrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
