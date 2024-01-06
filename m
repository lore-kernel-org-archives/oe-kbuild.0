Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C1882A
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jan 2024 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYXnQRZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704560932; x=1736096932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Os5l5V24hsafdLMPPuNNFAIwvgYFgHk7aazLEiU1PSo=;
  b=VYXnQRZrZp5SfMmlejR6LVywRd5o/yv3SEas9kFKwGQ4WAtlfuDmz1Ja
   +GhAgFSSwZ6zGienfPRRsZhO/vSiWSdeq1eKtnnW1vAXBovroDjOQgsVZ
   FZZdE5adtBJcTvn/A22Sxgg3wkIEkyxn7D8ib1isSbysPo1SAYEvx+Aku
   nTqP64xKK8E4pg2jW/QgBwYymKJGscBVO3wodWkXKCRfPKY1MVMogy87Y
   Pq8E3CBM+lnGlGx6rkg6FxwDvxzwkL/LT5YrZFLtsDmBZiorQBbiwAwJH
   Wz3iCogJ2PEcG3LjK1e7yO/25zoYMdOoBSoWKarrAnCd/wG2JhqYgdbHR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="382638562"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="382638562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 09:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="924486239"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="924486239"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2024 09:08:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMAA9-0002mI-1o;
	Sat, 06 Jan 2024 17:08:45 +0000
Date: Sun, 7 Jan 2024 01:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/video/fbdev/core/fb_logo.c:67:41-42: WARNING opportunity for
 min()
Message-ID: <202401070139.WLAW0SFL-lkp@intel.com>
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
TO: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95c8a35f1c017327eab3b6a2ff5c04255737c856
commit: 8887086ef2e0047ec321103a15e7d766be3a3874 fbdev/core: Move logo functions into separate source file
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: hexagon-randconfig-r052-20231228 (https://download.01.org/0day-ci/archive/20240107/202401070139.WLAW0SFL-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401070139.WLAW0SFL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/core/fb_logo.c:67:41-42: WARNING opportunity for min()
   drivers/video/fbdev/core/fb_logo.c:68:41-42: WARNING opportunity for min()
   drivers/video/fbdev/core/fb_logo.c:69:41-42: WARNING opportunity for min()

vim +67 drivers/video/fbdev/core/fb_logo.c

8887086ef2e004 Thomas Zimmermann 2023-09-07  49  
8887086ef2e004 Thomas Zimmermann 2023-09-07  50  static void  fb_set_logo_truepalette(struct fb_info *info,
8887086ef2e004 Thomas Zimmermann 2023-09-07  51  					    const struct linux_logo *logo,
8887086ef2e004 Thomas Zimmermann 2023-09-07  52  					    u32 *palette)
8887086ef2e004 Thomas Zimmermann 2023-09-07  53  {
8887086ef2e004 Thomas Zimmermann 2023-09-07  54  	static const unsigned char mask[] = {
8887086ef2e004 Thomas Zimmermann 2023-09-07  55  		0, 0x80, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc, 0xfe, 0xff
8887086ef2e004 Thomas Zimmermann 2023-09-07  56  	};
8887086ef2e004 Thomas Zimmermann 2023-09-07  57  	unsigned char redmask, greenmask, bluemask;
8887086ef2e004 Thomas Zimmermann 2023-09-07  58  	int redshift, greenshift, blueshift;
8887086ef2e004 Thomas Zimmermann 2023-09-07  59  	int i;
8887086ef2e004 Thomas Zimmermann 2023-09-07  60  	const unsigned char *clut = logo->clut;
8887086ef2e004 Thomas Zimmermann 2023-09-07  61  
8887086ef2e004 Thomas Zimmermann 2023-09-07  62  	/*
8887086ef2e004 Thomas Zimmermann 2023-09-07  63  	 * We have to create a temporary palette since console palette is only
8887086ef2e004 Thomas Zimmermann 2023-09-07  64  	 * 16 colors long.
8887086ef2e004 Thomas Zimmermann 2023-09-07  65  	 */
8887086ef2e004 Thomas Zimmermann 2023-09-07  66  	/* Bug: Doesn't obey msb_right ... (who needs that?) */
8887086ef2e004 Thomas Zimmermann 2023-09-07 @67  	redmask   = mask[info->var.red.length   < 8 ? info->var.red.length   : 8];
8887086ef2e004 Thomas Zimmermann 2023-09-07  68  	greenmask = mask[info->var.green.length < 8 ? info->var.green.length : 8];
8887086ef2e004 Thomas Zimmermann 2023-09-07  69  	bluemask  = mask[info->var.blue.length  < 8 ? info->var.blue.length  : 8];
8887086ef2e004 Thomas Zimmermann 2023-09-07  70  	redshift   = info->var.red.offset   - (8 - info->var.red.length);
8887086ef2e004 Thomas Zimmermann 2023-09-07  71  	greenshift = info->var.green.offset - (8 - info->var.green.length);
8887086ef2e004 Thomas Zimmermann 2023-09-07  72  	blueshift  = info->var.blue.offset  - (8 - info->var.blue.length);
8887086ef2e004 Thomas Zimmermann 2023-09-07  73  
8887086ef2e004 Thomas Zimmermann 2023-09-07  74  	for (i = 0; i < logo->clutsize; i++) {
8887086ef2e004 Thomas Zimmermann 2023-09-07  75  		palette[i+32] = (safe_shift((clut[0] & redmask), redshift) |
8887086ef2e004 Thomas Zimmermann 2023-09-07  76  				 safe_shift((clut[1] & greenmask), greenshift) |
8887086ef2e004 Thomas Zimmermann 2023-09-07  77  				 safe_shift((clut[2] & bluemask), blueshift));
8887086ef2e004 Thomas Zimmermann 2023-09-07  78  		clut += 3;
8887086ef2e004 Thomas Zimmermann 2023-09-07  79  	}
8887086ef2e004 Thomas Zimmermann 2023-09-07  80  }
8887086ef2e004 Thomas Zimmermann 2023-09-07  81  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
