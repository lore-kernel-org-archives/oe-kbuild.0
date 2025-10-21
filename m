Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8815D1
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 01:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761011798; cv=none; b=Ug6P2Pjm4iQbroPlupSH/8aecllih21i/mIRxGfBuk4ciYTmTeap4yeP5q/UaSopEgYrUrGlrjHIj6W6GWipTkpncOLqNBpn4RqS0LchI9JjINUwIyNipyPjdUZQyXVA/uuVdUvIMugB7d5vKKRYWfXTKxpdtVSKDXnKD9wFH84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761011798; c=relaxed/simple;
	bh=Sd4FwrRAaP9p1t+flXO1Eh4r5RrEjaA6LJDN3svdoUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NJCSOGguytafSJFRzrWQrZAp0VBcYDh5esQDR8OOPoJAzuCaUgnF4yK5h/o3yw/f20X9Nc8v6sIAMvN/6Cejy/sLQwVin/4u14gfczqgm4T9+8ms/hETsPW5axfO7i52VXPIMJwHfA7If1Uu1nTpA3dlBq0WzTkAOzWO2tgMmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gag8Bfb4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gag8Bfb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761011796; x=1792547796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sd4FwrRAaP9p1t+flXO1Eh4r5RrEjaA6LJDN3svdoUM=;
  b=Gag8Bfb4nDt7cfDfhKNVzjxS6QSBgD48mhopSum2y7/+EcvQvRI4K0hm
   fZVYrV0y4+xg0uyT1vaQhkmCHJ9Odsx1ukhcfIjFM/LFLqwBfr7hl6ifg
   yLmll2NutVpgEywKp0sGDG9VgcEtn7OsJiuNLsEsFFiRUCuXwc1t3NsRf
   EJldHfKsu1b+wWgq8Cyn0c0ip4OkO26lk0pMtU4mCTvUAd64STT96O25D
   Oy1PokYL68C7fi9o+ARf4DfJeKr6xXcYJcmTOzuGm7jV45SN7572zCVqo
   L633T9LVMFmfAxlQTWJxLrSNeOXA1hGBq3fLtkT4rgY9P7SkpV4krmbWo
   Q==;
X-CSE-ConnectionGUID: t0SXY6aIS4yEDqlhLSrMlw==
X-CSE-MsgGUID: UyE2wzlbReOUgmJfVhuqjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63043531"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63043531"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 18:56:36 -0700
X-CSE-ConnectionGUID: fSc/r4rSS1u++fthLk5M2A==
X-CSE-MsgGUID: Vq+qj3Q/TjCkoDzmeJlnAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183419161"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Oct 2025 18:56:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB1c0-000AMn-2N;
	Tue, 21 Oct 2025 01:56:32 +0000
Date: Tue, 21 Oct 2025 09:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/agp/ali-agp.c:155:27: sparse: signed value source
Message-ID: <202510210917.RU2fYT6F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/char/agp/ali-agp.c:155:27: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Thomas Huth <thuth@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 3e25d5a49f99b75be2c6cfb165e4f77dc6d739a2 asm-generic: add an optional pfn_valid check to page_to_phys
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-062-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210917.RU2fYT6F-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210917.RU2fYT6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510210917.RU2fYT6F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/agp/ali-agp.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, ...):
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/char/agp/ali-agp.c:155:27: sparse: signed value source
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/char/agp/ali-agp.c:183:42: sparse: signed value source
--
   drivers/char/agp/sworks-agp.c:58:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __iomem *remapped @@     got unsigned long *real @@
   drivers/char/agp/sworks-agp.c:58:28: sparse:     expected unsigned long [noderef] __iomem *remapped
   drivers/char/agp/sworks-agp.c:58:28: sparse:     got unsigned long *real
   drivers/char/agp/sworks-agp.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, ...):
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/char/agp/sworks-agp.c:351:33: sparse: signed value source
--
   drivers/char/agp/backend.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, ...):
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/char/agp/backend.c:156:44: sparse: signed value source
--
   drivers/char/agp/ati-agp.c:70:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __iomem *remapped @@     got unsigned long *real @@
   drivers/char/agp/ati-agp.c:70:28: sparse:     expected unsigned long [noderef] __iomem *remapped
   drivers/char/agp/ati-agp.c:70:28: sparse:     got unsigned long *real
   drivers/char/agp/ati-agp.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, ...):
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/char/agp/ati-agp.c:298:56: sparse: signed value source
--
   drivers/char/agp/generic.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, ...):
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/char/agp/generic.c:1095:52: sparse: signed value source
--
   kernel/dma/swiotlb.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> kernel/dma/swiotlb.c:1780:32: sparse: signed value source

vim +155 drivers/char/agp/ali-agp.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  143  
07613ba2f464f5 Dave Airlie     2009-06-12  144  static struct page *m1541_alloc_page(struct agp_bridge_data *bridge)
^1da177e4c3f41 Linus Torvalds  2005-04-16  145  {
07613ba2f464f5 Dave Airlie     2009-06-12  146  	struct page *page = agp_generic_alloc_page(agp_bridge);
^1da177e4c3f41 Linus Torvalds  2005-04-16  147  	u32 temp;
^1da177e4c3f41 Linus Torvalds  2005-04-16  148  
07613ba2f464f5 Dave Airlie     2009-06-12  149  	if (!page)
^1da177e4c3f41 Linus Torvalds  2005-04-16  150  		return NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  151  
^1da177e4c3f41 Linus Torvalds  2005-04-16  152  	pci_read_config_dword(agp_bridge->dev, ALI_CACHE_FLUSH_CTRL, &temp);
^1da177e4c3f41 Linus Torvalds  2005-04-16  153  	pci_write_config_dword(agp_bridge->dev, ALI_CACHE_FLUSH_CTRL,
^1da177e4c3f41 Linus Torvalds  2005-04-16  154  			(((temp & ALI_CACHE_FLUSH_ADDR_MASK) |
6a12235c7d2d75 David Woodhouse 2009-07-29 @155  			  page_to_phys(page)) | ALI_CACHE_FLUSH_EN ));
07613ba2f464f5 Dave Airlie     2009-06-12  156  	return page;
^1da177e4c3f41 Linus Torvalds  2005-04-16  157  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  158  

:::::: The code at line 155 was first introduced by commit
:::::: 6a12235c7d2d75c7d94b9afcaaecd422ff845ce0 agp: kill phys_to_gart() and gart_to_phys()

:::::: TO: David Woodhouse <David.Woodhouse@intel.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
