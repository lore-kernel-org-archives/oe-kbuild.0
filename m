Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4F1E3DC6
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730283670; cv=none; b=Lj3YEu5nuYgIdclyhvxpfjtJHAzpweqCFHPLURv+E8IVFDkumuxy4Js1c6JeR0xw9IGnsDXYfBaVoysyi4psFfjLPBMJaYBLeu4RRxED8yoboDaPEgFPNTE1EJSvcfp7Q6/tXLMCyodb4mRuxxmAR9i+dXEmXGJNeom5ag5TWkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730283670; c=relaxed/simple;
	bh=n2e8Dl0sWW/J2ZEwkVID2i496bkIOs/NQJFmIjntQB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYthFKzWBSKy0nQSbq88tY1plRokD4uSO2ErFFAW+rM93t2665TKx0ycme7C5jQN673/BHuQHdeJpdigV6afpyHmYdFAtL9yjPx8hBOdTYQrPE4buniJHw6qTG/dVJQtDSesz9ewYRvJLjBsK2dri/woGdwGPoMqqM7OCB/PQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUIVvTip; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUIVvTip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730283667; x=1761819667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n2e8Dl0sWW/J2ZEwkVID2i496bkIOs/NQJFmIjntQB8=;
  b=BUIVvTipZhXDARLPGfPJ79FIY9cQsi6BktgnGuhcd/akQK6SKgHHp+XL
   3aWWHLu35/QjJ6VcKRDRjzAUaWJl1ObjHxw1wXZmQzMlMDb8ABfE/XV2n
   D/bk7WV/4MXr1w4OPnao0zQKh56GMyjbx/k0B2rf5qgntZeeiSxDHxnlf
   ivaX/kLUKrzVSSZjUNK429pW5c9f4KNhoQ6OE9bLIn2cI/nzk8lRvX8PZ
   o4ES7mMJ0nNfD+bVmME+dmp5oRwYFZbhoJbArVxZdNyVY9rqkGN2twoxJ
   wfJLNFhtIx/aB07ZaKHckSSEsrrxo3qGrFH95yPjNWthlBdYa0jo3yKs8
   Q==;
X-CSE-ConnectionGUID: jxg0kT4NSLyyh+21sbJ/Hg==
X-CSE-MsgGUID: AzwoD3IWS6usVgoQq3VOlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30189451"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="30189451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 03:21:06 -0700
X-CSE-ConnectionGUID: E8SvJVkhRmCnpe0WgI2R1Q==
X-CSE-MsgGUID: p7ibp5acSFq2e6eSyCUJJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="81918382"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2024 03:21:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t65p1-000ejo-0E;
	Wed, 30 Oct 2024 10:21:03 +0000
Date: Wed, 30 Oct 2024 18:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:timers/vdso 11/13] drivers/xen/gntdev.c:813 gntdev_get_page()
 warn: mask and shift to zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <202410301852.NT8UnfFo-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20241030 (https://download.01.org/0day-ci/archive/20241030/202410301852.NT8UnfFo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410301852.NT8UnfFo-lkp@intel.com/

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
