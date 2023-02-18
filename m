Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27EC33C5
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Feb 2023 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676730246; x=1708266246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=69mni5G5bsYbGdAfB35aDNtlZRrEQ3ed2kyORmqpyOo=;
  b=Eer0hoQMuZmp9Bt2ML+DAad0eeTCWzNlmmzwev0USqIwNdVEQwrfKGQW
   Qa4YPkF1+h5hdUROS5dLp6k/h9BFtbGPH7CZXM2PxHT9FtZvdiywf3BxI
   m6TxUdw8FehK1wM4/Gvz2AVUD3ETYZt7Fbbl6RZS+mrHqNN6Xze9MS/ps
   aCOkMgRbbWFDI2kfxUh/f9Gg1/O2q/4Tx/GtztV9OXYJq0c6iB7TiZsGt
   CR9bJ/hz77UGzw5g4Uili3MSN2N9kpm1ZZZbvZmS25SevM0GHtTdpkBtF
   eezfmDoOgc99dmy/iKh7H6GaPuPIG7svrZhmHffTM/5f0AiwKEqNT4E4n
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="312537723"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="312537723"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 06:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="916399085"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="916399085"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Feb 2023 06:24:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTO8A-000CSl-2C;
	Sat, 18 Feb 2023 14:24:02 +0000
Date: Sat, 18 Feb 2023 22:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_stolen.c:173 request_smem_stolen()
 warn: consider using resource_size() here
Message-ID: <202302182250.KJRCvS90-lkp@intel.com>
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
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Wayne Boyer <wayne.boyer@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   38f8ccde04a3fa317b51b05e63c3cb57e1641931
commit: 3d99597c6496b9319f7522e0d073afab314d518a drm/i915: Split i915_gem_init_stolen()
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230218/202302182250.KJRCvS90-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302182250.KJRCvS90-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_stolen.c:173 request_smem_stolen() warn: consider using resource_size() here
drivers/gpu/drm/i915/gem/i915_gem_stolen.c:455 init_reserved_stolen() warn: missing error code 'ret'

vim +173 drivers/gpu/drm/i915/gem/i915_gem_stolen.c

3d99597c6496b93 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2022-09-16  141  
3d99597c6496b93 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2022-09-16  142  static int request_smem_stolen(struct drm_i915_private *i915,
3d99597c6496b93 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2022-09-16  143  			       struct resource *dsm)
3d99597c6496b93 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2022-09-16  144  {
3d99597c6496b93 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2022-09-16  145  	struct resource *r;
3d99597c6496b93 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2022-09-16  146  
d57d4a1daf5e839 drivers/gpu/drm/i915/gem/i915_gem_stolen.c CQ Tang         2021-04-21  147  	/*
3d99597c6496b93 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2022-09-16  148  	 * With stolen lmem, we don't need to request system memory for the
3d99597c6496b93 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2022-09-16  149  	 * address range since it's local to the gpu.
d57d4a1daf5e839 drivers/gpu/drm/i915/gem/i915_gem_stolen.c CQ Tang         2021-04-21  150  	 */
d57d4a1daf5e839 drivers/gpu/drm/i915/gem/i915_gem_stolen.c CQ Tang         2021-04-21  151  	if (HAS_LMEM(i915))
d57d4a1daf5e839 drivers/gpu/drm/i915/gem/i915_gem_stolen.c CQ Tang         2021-04-21  152  		return 0;
d57d4a1daf5e839 drivers/gpu/drm/i915/gem/i915_gem_stolen.c CQ Tang         2021-04-21  153  
7789422665f5998 drivers/gpu/drm/i915/i915_gem_stolen.c     Matthew Auld    2017-12-11  154  	/*
7789422665f5998 drivers/gpu/drm/i915/i915_gem_stolen.c     Matthew Auld    2017-12-11  155  	 * Verify that nothing else uses this physical address. Stolen
eaba1b8f3379b5d drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2013-07-04  156  	 * memory should be reserved by the BIOS and hidden from the
eaba1b8f3379b5d drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2013-07-04  157  	 * kernel. So if the region is already marked as busy, something
eaba1b8f3379b5d drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2013-07-04  158  	 * is seriously wrong.
eaba1b8f3379b5d drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2013-07-04  159  	 */
bdce2bea0f5e6bd drivers/gpu/drm/i915/gem/i915_gem_stolen.c Chris Wilson    2019-11-11  160  	r = devm_request_mem_region(i915->drm.dev, dsm->start,
7789422665f5998 drivers/gpu/drm/i915/i915_gem_stolen.c     Matthew Auld    2017-12-11  161  				    resource_size(dsm),
eaba1b8f3379b5d drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2013-07-04  162  				    "Graphics Stolen Memory");
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  163  	if (r == NULL) {
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  164  		/*
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  165  		 * One more attempt but this time requesting region from
7789422665f5998 drivers/gpu/drm/i915/i915_gem_stolen.c     Matthew Auld    2017-12-11  166  		 * start + 1, as we have seen that this resolves the region
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  167  		 * conflict with the PCI Bus.
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  168  		 * This is a BIOS w/a: Some BIOS wrap stolen in the root
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  169  		 * PCI bus, but have an off-by-one error. Hence retry the
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  170  		 * reservation starting from 1 instead of 0.
023f807989f4d6a drivers/gpu/drm/i915/i915_gem_stolen.c     Daniel Vetter   2017-07-19  171  		 * There's also BIOS with off-by-one on the other end.
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  172  		 */
bdce2bea0f5e6bd drivers/gpu/drm/i915/gem/i915_gem_stolen.c Chris Wilson    2019-11-11 @173  		r = devm_request_mem_region(i915->drm.dev, dsm->start + 1,
7789422665f5998 drivers/gpu/drm/i915/i915_gem_stolen.c     Matthew Auld    2017-12-11  174  					    resource_size(dsm) - 2,
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  175  					    "Graphics Stolen Memory");
0b6d24c01932db9 drivers/gpu/drm/i915/i915_gem_stolen.c     Daniel Vetter   2014-04-11  176  		/*
0b6d24c01932db9 drivers/gpu/drm/i915/i915_gem_stolen.c     Daniel Vetter   2014-04-11  177  		 * GEN3 firmware likes to smash pci bridges into the stolen
0b6d24c01932db9 drivers/gpu/drm/i915/i915_gem_stolen.c     Daniel Vetter   2014-04-11  178  		 * range. Apparently this works.
0b6d24c01932db9 drivers/gpu/drm/i915/i915_gem_stolen.c     Daniel Vetter   2014-04-11  179  		 */
40e1956ec505a1a drivers/gpu/drm/i915/gem/i915_gem_stolen.c Lucas De Marchi 2021-06-05  180  		if (!r && GRAPHICS_VER(i915) != 3) {
baa89ba3f1feda6 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Wambui Karuga   2020-01-22  181  			drm_err(&i915->drm,
baa89ba3f1feda6 drivers/gpu/drm/i915/gem/i915_gem_stolen.c Wambui Karuga   2020-01-22  182  				"conflict detected with stolen region: %pR\n",
7789422665f5998 drivers/gpu/drm/i915/i915_gem_stolen.c     Matthew Auld    2017-12-11  183  				dsm);
920bcd1820a6966 drivers/gpu/drm/i915/i915_gem_stolen.c     Paulo Zanoni    2017-01-26  184  
7789422665f5998 drivers/gpu/drm/i915/i915_gem_stolen.c     Matthew Auld    2017-12-11  185  			return -EBUSY;
eaba1b8f3379b5d drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2013-07-04  186  		}
3617dc9675f0184 drivers/gpu/drm/i915/i915_gem_stolen.c     Akash Goel      2014-01-13  187  	}
eaba1b8f3379b5d drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2013-07-04  188  
7789422665f5998 drivers/gpu/drm/i915/i915_gem_stolen.c     Matthew Auld    2017-12-11  189  	return 0;
9797fbfbcfe251b drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2012-04-24  190  }
9797fbfbcfe251b drivers/gpu/drm/i915/i915_gem_stolen.c     Chris Wilson    2012-04-24  191  

:::::: The code at line 173 was first introduced by commit
:::::: bdce2bea0f5e6bd3e3fa85278cc2fb8632f71572 drm/i915/gem: Replace implicit dev_priv->uncore for stolen init

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
