Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA49179BF
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Nov 2023 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWMsiw9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698950227; x=1730486227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5IIB5/idLC+Vnk+WRVjRRQuK8UvIZ+AYS3R+C2o1pV4=;
  b=mWMsiw9YdkOGBQhDJqQk/u+ZDehkKkruWUiE+7HNYvutZ3o3uZjz8G2b
   3cYGJcjTu5v40Z7g6SlB1HsQCty5W7xr9yhs6Y+XaCl4qwqDz7n0R6uOe
   iDg5GWzNdGLkzsqCsgiXsnVvFc3HJvMCLbPNaCyRrvYoTVEAgaxRsfJUW
   3Dc1LE+dbqcjhdbAsOBjHM9uLbJmDKaydii1uMTguuQANqvRt+6ZlsiYp
   avMrM8V68h9eiV7M+xqkWlgkhXJSptTFUnpa3WTqtqFkxTKbehuzenjLZ
   WLVwqhToKMe5rCdh5JCra2wVWrnrla8EhsJpq4OHmG9AJCSmNRt9us3AI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373823545"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="373823545"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 11:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711249467"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="711249467"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 11:37:00 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qycYr-0001lg-1v;
	Thu, 02 Nov 2023 18:36:57 +0000
Date: Fri, 3 Nov 2023 02:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9848/16110]
 drivers/firmware/sysfb_simplefb.c:60:34: sparse: sparse: too long token
 expansion
Message-ID: <202311030210.Yyw0of5Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/firmware/sysfb_simplefb.c:60:34: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ab57716449b3438c0136f6f412a2e59e0cf037a9
commit: d03eba99f5bf7cbc6e2fdde3b6fa36954ad58e09 [9848/16110] minmax: allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-122-20231101 (https://download.01.org/0day-ci/archive/20231103/202311030210.Yyw0of5Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030210.Yyw0of5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311030210.Yyw0of5Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/sysfb_simplefb.c:60:34: sparse: sparse: too long token expansion
>> drivers/firmware/sysfb_simplefb.c:60:34: sparse: sparse: too long token expansion
--
>> arch/x86/kernel/cpu/cacheinfo.c:341:24: sparse: sparse: too long token expansion
>> arch/x86/kernel/cpu/cacheinfo.c:341:24: sparse: sparse: too long token expansion

vim +60 drivers/firmware/sysfb_simplefb.c

e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  25  
8633ef82f101c0 drivers/firmware/sysfb_simplefb.c Javier Martinez Canillas 2021-06-25  26  /* try parsing screen_info into a simple-framebuffer mode struct */
8633ef82f101c0 drivers/firmware/sysfb_simplefb.c Javier Martinez Canillas 2021-06-25  27  __init bool sysfb_parse_mode(const struct screen_info *si,
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  28  			     struct simplefb_platform_data *mode)
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  29  {
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  30  	__u8 type;
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  31  	u32 bits_per_pixel;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  32  	unsigned int i;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  33  
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  34  	type = si->orig_video_isVGA;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  35  	if (type != VIDEO_TYPE_VLFB && type != VIDEO_TYPE_EFI)
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  36  		return false;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  37  
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  38  	/*
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  39  	 * The meaning of depth and bpp for direct-color formats is
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  40  	 * inconsistent:
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  41  	 *
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  42  	 *  - DRM format info specifies depth as the number of color
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  43  	 *    bits; including alpha, but not including filler bits.
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  44  	 *  - Linux' EFI platform code computes lfb_depth from the
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  45  	 *    individual color channels, including the reserved bits.
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  46  	 *  - VBE 1.1 defines lfb_depth for XRGB1555 as 16, but later
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  47  	 *    versions use 15.
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  48  	 *  - On the kernel command line, 'bpp' of 32 is usually
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  49  	 *    XRGB8888 including the filler bits, but 15 is XRGB1555
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  50  	 *    not including the filler bit.
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  51  	 *
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  52  	 * It's not easily possible to fix this in struct screen_info,
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  53  	 * as this could break UAPI. The best solution is to compute
1b617bc9317891 drivers/firmware/sysfb_simplefb.c Pierre Asselin           2023-04-19  54  	 * bits_per_pixel from the color bits, reserved bits and
1b617bc9317891 drivers/firmware/sysfb_simplefb.c Pierre Asselin           2023-04-19  55  	 * reported lfb_depth, whichever is highest.  In the loop below,
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  56  	 * ignore simplefb formats with alpha bits, as EFI and VESA
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  57  	 * don't specify alpha channels.
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  58  	 */
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  59  	if (si->lfb_depth > 8) {
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02 @60  		bits_per_pixel = max(max3(si->red_size + si->red_pos,
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  61  					  si->green_size + si->green_pos,
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  62  					  si->blue_size + si->blue_pos),
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  63  				     si->rsvd_size + si->rsvd_pos);
1b617bc9317891 drivers/firmware/sysfb_simplefb.c Pierre Asselin           2023-04-19  64  		bits_per_pixel = max_t(u32, bits_per_pixel, si->lfb_depth);
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  65  	} else {
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  66  		bits_per_pixel = si->lfb_depth;
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  67  	}
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  68  
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  69  	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  70  		const struct simplefb_format *f = &formats[i];
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  71  
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  72  		if (f->transp.length)
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  73  			continue; /* transparent formats are unsupported by VESA/EFI */
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  74  
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  75  		if (bits_per_pixel == f->bits_per_pixel &&
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  76  		    si->red_size == f->red.length &&
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  77  		    si->red_pos == f->red.offset &&
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  78  		    si->green_size == f->green.length &&
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  79  		    si->green_pos == f->green.offset &&
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  80  		    si->blue_size == f->blue.length &&
f35cd3fa77293c drivers/firmware/sysfb_simplefb.c Thomas Zimmermann        2023-01-02  81  		    si->blue_pos == f->blue.offset) {
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  82  			mode->format = f->name;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  83  			mode->width = si->lfb_width;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  84  			mode->height = si->lfb_height;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  85  			mode->stride = si->lfb_linelength;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  86  			return true;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  87  		}
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  88  	}
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  89  
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  90  	return false;
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  91  }
e3263ab389a7bc arch/x86/kernel/sysfb_simplefb.c  David Rheinsberg         2013-08-02  92  

:::::: The code at line 60 was first introduced by commit
:::::: f35cd3fa77293c2cd03e94b6a6151e1a7d9309cf firmware/sysfb: Fix EFI/VESA format selection

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
