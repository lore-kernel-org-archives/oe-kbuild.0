Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D6942A8B
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 01:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730251335; cv=none; b=VHW3OMei2fwE4e9FSV7T7u7UDa006KQMVZQdAJ4rRXxyohu/4FFifCnY7YS567LqBi7jZ0V82wbSBX4x95YZm1x/AkwgwPbAisG3YrksvMC5JbFvt200e1otfHBzI/B+0+6s7dwNyJapb5becKicycB09dT6tlcTyz16RuEZE0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730251335; c=relaxed/simple;
	bh=8W0mPC1ThHSTJxucKiJfgUwsaCHHtx+lrO/gV6KRjow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OmQJHFbNvNSsRkZypqSZ0L0sEOTr7fBYSqduAkgUYCX/w2NcM+SFerOIYv4iy+BI/1kjym01dEJ0bUmRzaoKkK0/x3XJjhqw5Nvy5eVojEtQq6OzL2MkFSuhp0eFbu+SAGQE9scwjwBYKTK/zoOFT0f7JNEyRSaJTzgVmRjo8Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+rWofS8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+rWofS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730251333; x=1761787333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8W0mPC1ThHSTJxucKiJfgUwsaCHHtx+lrO/gV6KRjow=;
  b=N+rWofS8usXes89QYkSd0/2HTOULC/Ebofqv3ZozSsS4eWv2CRYIZ6az
   bibPlK88HLGQNNW+I0QPvlqnnu1LMIqnzZxci4lkrTLm6M2ByOT+/w1Z6
   BiHSciWgGTSDoYz5cWg6Y1fx8Q41Z22A/DgKV18HguaFSOk7vqGZrxTiz
   17AS2RKnyzIW4JM/3bRb/nu87JBed3SgWg/HJUy/qz9wYiOIb21QwEtND
   nl+Tydo/XpiK+1OYSjA95SzZHyCzpMR+eMkRlZAp1GjoIC13E1v6o5eT9
   zUlQ1OxAXsj+EL0rN14HrxRH8pDDziVVx8SVhfuATynhtrpkqBucuMvCT
   A==;
X-CSE-ConnectionGUID: WM2hda99RS2jgBbWzti+iw==
X-CSE-MsgGUID: guYB3ByZSF6ftE8J3UhK1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33729355"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="33729355"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 18:22:12 -0700
X-CSE-ConnectionGUID: ouwC65//SDWF8XAlvNbayQ==
X-CSE-MsgGUID: vW/vshPoQ8St3a9K5VZLSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82568372"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2024 18:20:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5xO0-000eMi-2j;
	Wed, 30 Oct 2024 01:20:36 +0000
Date: Wed, 30 Oct 2024 09:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:timers/vdso 11/13] drivers/xen/gntdev.c:813 gntdev_get_page()
 warn: mask and shift to zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <202410300949.cjYZl97v-lkp@intel.com>
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
CC: x86@kernel.org
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   d4a65302dd849fade9e2ca712826c35b8d068ecb
commit: efe8419ae78d65e83edc31aad74b605c12e7d60c [11/13] vdso: Introduce vdso/page.h
:::::: branch date: 33 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20241030 (https://download.01.org/0day-ci/archive/20241030/202410300949.cjYZl97v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410300949.cjYZl97v-lkp@intel.com/

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
