Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5AE217716
	for <oe-kbuild@lists.linux.dev>; Fri, 16 May 2025 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747359469; cv=none; b=U5TEHhgs/CGZbdCaZ4Gzi65kWVfBuI9os/KQrMroppOeMokpY5E2VCW+CqcEh2Pl2KMEBMUiGGXOX+9QIOQPtTauXObr413N6G52A56ioMyEDeLXcaec/Wv+fntAuWtbnhkBuf8HxGxUoaSP52h4ueqJlJytTcCj1XpBsdS2xMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747359469; c=relaxed/simple;
	bh=k8dGDBEDpLdgH/ixWjzIqJhBYqF3dXoKnj+/PJrCwwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fu8pMZWptI77jHSAtx0ZC4buKfTTmRN3P4BP1ETXuKZISvhkMpuHgV2921FDHolR6aBIqEONoVQICkFgbf88j5Oy2i1ogpoM4uXqYKObgDAFlgR03PMWn/HitXLgBVY2W3mt8shQRoIil3UWRnhPNBGwKaWh+daIFcMF3RtRAM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cH/cK131; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cH/cK131"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747359468; x=1778895468;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k8dGDBEDpLdgH/ixWjzIqJhBYqF3dXoKnj+/PJrCwwo=;
  b=cH/cK131HAZehlIcMS8rVW+csZtRYW3GD6nCNNETk1Cvyp6F9iq0yOkw
   sCKMakRFc0aH4JGPBvTQWiwKQ4iLMALv6XXukcIx03BzLPBrDr7BwXHrr
   BiiRMebZPa4XNJoiKdpfxNmh157XhG9jsABCVsEc9XveiCXbuK/CH8A+z
   0Eg24nR5X3u5xbNzjYQisKXE5VwuSGlh+G/PONAWcMBVkRdXlLP4/UBi3
   dv13R8MCfFTbkcwJQkBLOrGhE5SI5iW/7NRtr6u57dUDvYHFZRvOAqqeC
   av2R9q56XBDuXIHUliyeQQlWNLvUZ/UqDT1XA/qLO+9eDuLGIlXx1Q5xy
   Q==;
X-CSE-ConnectionGUID: hSZa8fJST0yOzUXnRaYAFw==
X-CSE-MsgGUID: er9sQgB4ThuwztNFA2paGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60340379"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="60340379"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 18:37:47 -0700
X-CSE-ConnectionGUID: Zp/sl47/StiOBDSC908zqg==
X-CSE-MsgGUID: o868g7YAQpKGyJCrs10dig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="161849967"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 May 2025 18:37:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFk19-000Itz-2e;
	Fri, 16 May 2025 01:37:43 +0000
Date: Fri, 16 May 2025 09:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2963/11408] include/linux/mm.h:4300
 page_pool_page_is_pp() warn: masked condition '(page->pp_magic & ~(((0) +
 (((~((0))) << ((1 + __fls((64 + (6767463209352822784)) -
 (6767463209352822784))))) & (~((0)) >> (64 - 1 - ((((32) <
 (__ffs((6767463209352822784)) - (1 + __fl...
Message-ID: <202505160955.fY8P5Mnv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Toke Høiland-Jørgensen" <toke@redhat.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Mina Almasry <almasrymina@google.com>
CC: Jesper Dangaard Brouer <hawk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   484803582c77061b470ac64a634f25f89715be3f
commit: ee62ce7a1d909ccba0399680a03c2dee83bcae95 [2963/11408] page_pool: Track DMA-mapped pages and unmap them when destroying the pool
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: powerpc64-randconfig-r071-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160955.fY8P5Mnv-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505160955.fY8P5Mnv-lkp@intel.com/

smatch warnings:
include/linux/mm.h:4300 page_pool_page_is_pp() warn: masked condition '(page->pp_magic & ~(((0) + (((~((0))) << ((1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) & (~((0)) >> (64 - 1 - ((((32) < (__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) ?(32):(__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) + (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))) - 1))))) | 3)) == (64 + (6767463209352822784))' is always false.

vim +4300 include/linux/mm.h

cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4296  
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4297  #ifdef CONFIG_PAGE_POOL
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4298  static inline bool page_pool_page_is_pp(struct page *page)
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4299  {
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09 @4300  	return (page->pp_magic & PP_MAGIC_MASK) == PP_SIGNATURE;
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4301  }
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4302  #else
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4303  static inline bool page_pool_page_is_pp(struct page *page)
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4304  {
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4305  	return false;
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4306  }
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4307  #endif
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4308  

:::::: The code at line 4300 was first introduced by commit
:::::: cd3c93167da0e760b5819246eae7a4ea30fd014b page_pool: Move pp_magic check into helper functions

:::::: TO: Toke Høiland-Jørgensen <toke@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
