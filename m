Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593317AD2
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Aug 2023 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691599005; x=1723135005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erXZtzZdzaxo7WOhu+BlNY8cG5cd9If+WaK8XwHk4Tk=;
  b=bwXg3AaaXaMMxs6vxYQ7WzBq0lba9q2nwb+OPZffmNi5MdEzLW+NQmD9
   xztST3ys7YkiaE+iM8n/fStZK67Sa516ZzjlRTYczY/eEajgOBYkJ0K/Y
   F/8Bv5tiWJ2MlrzS/g46zVSzozVPckenMX0oMU1bF+xgZFqtA5xxiJMQH
   oDPo++ZJF66z/mnM6PsPVY/FEl42P/R9/2cGMF6XVGjQZ4FaLl9JI8laL
   QKsfOzSoxy8jhsKxKJC8KFhuNZMxNPbiHlV+Vw59eJTy0Zn72gLzVFYII
   pqZPWy0yJmCb/2tvqe1KXH39z0SYdLuLyLFP6eM32KwJbdTNEBBceVzGp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="371160767"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="371160767"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="735072543"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="735072543"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2023 09:36:39 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTmAp-0006GI-0U;
	Wed, 09 Aug 2023 16:36:39 +0000
Date: Thu, 10 Aug 2023 00:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 423/8441]
 drivers/video/fbdev/core/fb_chrdev.c:239 do_fscreeninfo_to_user() warn:
 ignoring unreachable code.
Message-ID: <202308100023.4D0PLLaB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Sam Ravnborg <sam@ravnborg.org>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 588b35634a5aabce1aef3297a048e42279f62dec [423/8441] fbdev/core: Move file-I/O code into separate file
:::::: branch date: 11 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-m041-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100023.4D0PLLaB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100023.4D0PLLaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308100023.4D0PLLaB-lkp@intel.com/

smatch warnings:
drivers/video/fbdev/core/fb_chrdev.c:239 do_fscreeninfo_to_user() warn: ignoring unreachable code.

vim +239 drivers/video/fbdev/core/fb_chrdev.c

588b35634a5aabc Thomas Zimmermann 2023-06-13  227  
588b35634a5aabc Thomas Zimmermann 2023-06-13  228  static int do_fscreeninfo_to_user(struct fb_fix_screeninfo *fix,
588b35634a5aabc Thomas Zimmermann 2023-06-13  229  				  struct fb_fix_screeninfo32 __user *fix32)
588b35634a5aabc Thomas Zimmermann 2023-06-13  230  {
588b35634a5aabc Thomas Zimmermann 2023-06-13  231  	__u32 data;
588b35634a5aabc Thomas Zimmermann 2023-06-13  232  	int err;
588b35634a5aabc Thomas Zimmermann 2023-06-13  233  
588b35634a5aabc Thomas Zimmermann 2023-06-13  234  	err = copy_to_user(&fix32->id, &fix->id, sizeof(fix32->id));
588b35634a5aabc Thomas Zimmermann 2023-06-13  235  
588b35634a5aabc Thomas Zimmermann 2023-06-13  236  	data = (__u32) (unsigned long) fix->smem_start;
588b35634a5aabc Thomas Zimmermann 2023-06-13  237  	err |= put_user(data, &fix32->smem_start);
588b35634a5aabc Thomas Zimmermann 2023-06-13  238  
588b35634a5aabc Thomas Zimmermann 2023-06-13 @239  	err |= put_user(fix->smem_len, &fix32->smem_len);
588b35634a5aabc Thomas Zimmermann 2023-06-13  240  	err |= put_user(fix->type, &fix32->type);
588b35634a5aabc Thomas Zimmermann 2023-06-13  241  	err |= put_user(fix->type_aux, &fix32->type_aux);
588b35634a5aabc Thomas Zimmermann 2023-06-13  242  	err |= put_user(fix->visual, &fix32->visual);
588b35634a5aabc Thomas Zimmermann 2023-06-13  243  	err |= put_user(fix->xpanstep, &fix32->xpanstep);
588b35634a5aabc Thomas Zimmermann 2023-06-13  244  	err |= put_user(fix->ypanstep, &fix32->ypanstep);
588b35634a5aabc Thomas Zimmermann 2023-06-13  245  	err |= put_user(fix->ywrapstep, &fix32->ywrapstep);
588b35634a5aabc Thomas Zimmermann 2023-06-13  246  	err |= put_user(fix->line_length, &fix32->line_length);
588b35634a5aabc Thomas Zimmermann 2023-06-13  247  
588b35634a5aabc Thomas Zimmermann 2023-06-13  248  	data = (__u32) (unsigned long) fix->mmio_start;
588b35634a5aabc Thomas Zimmermann 2023-06-13  249  	err |= put_user(data, &fix32->mmio_start);
588b35634a5aabc Thomas Zimmermann 2023-06-13  250  
588b35634a5aabc Thomas Zimmermann 2023-06-13  251  	err |= put_user(fix->mmio_len, &fix32->mmio_len);
588b35634a5aabc Thomas Zimmermann 2023-06-13  252  	err |= put_user(fix->accel, &fix32->accel);
588b35634a5aabc Thomas Zimmermann 2023-06-13  253  	err |= copy_to_user(fix32->reserved, fix->reserved,
588b35634a5aabc Thomas Zimmermann 2023-06-13  254  			    sizeof(fix->reserved));
588b35634a5aabc Thomas Zimmermann 2023-06-13  255  
588b35634a5aabc Thomas Zimmermann 2023-06-13  256  	if (err)
588b35634a5aabc Thomas Zimmermann 2023-06-13  257  		return -EFAULT;
588b35634a5aabc Thomas Zimmermann 2023-06-13  258  	return 0;
588b35634a5aabc Thomas Zimmermann 2023-06-13  259  }
588b35634a5aabc Thomas Zimmermann 2023-06-13  260  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
