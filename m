Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC19E10E8
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 01:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+0evLzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700183767; x=1731719767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j++zybegwYHv2xCBbD6M8WSo0mFAIi18i6hL9t0fLQY=;
  b=l+0evLzdxN7PP3DgpAFtSdBQvAf8XJ6PAzCI1jn2pv+6HA0p0s9Va2tN
   ioqXyNqZb9U8RV0lSIfdQHw75ZuuVfADJCOytXqLCZYhsizmcjjFA3o/3
   PiTTgTZVFtq69DsZUJgw6qQZLhSWF0PJ4XFnKcX2gyW0v30WDvMWUXNaj
   Wqne4gfJtU5VSBn8mUk81FLMtnPqQmivTCpNh3x1sqWqYv3Q0YLOXLUp/
   rJ5ox4P0jRUkx1FSI2z/Rax5fvmTUuYYoMWSOXhIxxdjwC1fKwGkI7aP1
   gJjA3ovuGWEIIwIKQgRLgqRvvOamqk32pkFS4sx9gjX6ySn1qez6WfC9c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="9874474"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="9874474"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:16:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="13312255"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2023 17:16:05 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3nSk-0002Ej-1s;
	Fri, 17 Nov 2023 01:16:02 +0000
Date: Fri, 17 Nov 2023 09:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/platform_device.h:91:23: sparse: sparse: incorrect
 type in return expression (different address spaces)
Message-ID: <202311170948.rDwaXfji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Brown <broonie@kernel.org>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7475e51b87969e01a6812eac713a1c8310372e8a
commit: 512d092d78823f9813f4af38090b33c454137a4c ALSA: Enable build with UML
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-r122-20231117 (https://download.01.org/0day-ci/archive/20231117/202311170948.rDwaXfji-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311170948.rDwaXfji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311170948.rDwaXfji-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/codecs/inno_rk3036.c: note: in included file (through include/sound/soc.h):
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [noderef] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/msm8916-wcd-digital.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [noderef] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/rk3328_codec.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [noderef] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/lpass-wsa-macro.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [noderef] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/lpass-va-macro.c: note: in included file (through include/linux/of_device.h, include/linux/of_platform.h):
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [noderef] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/lpass-rx-macro.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [noderef] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *

vim +91 include/linux/platform_device.h

a0c74f6c9ea9ce Mark Brown 2023-07-18  85  
a0c74f6c9ea9ce Mark Brown 2023-07-18  86  
a0c74f6c9ea9ce Mark Brown 2023-07-18  87  static inline void __iomem *
a0c74f6c9ea9ce Mark Brown 2023-07-18  88  devm_platform_ioremap_resource(struct platform_device *pdev,
a0c74f6c9ea9ce Mark Brown 2023-07-18  89  			       unsigned int index)
a0c74f6c9ea9ce Mark Brown 2023-07-18  90  {
a0c74f6c9ea9ce Mark Brown 2023-07-18 @91  	return ERR_PTR(-EINVAL);
a0c74f6c9ea9ce Mark Brown 2023-07-18  92  }
a0c74f6c9ea9ce Mark Brown 2023-07-18  93  

:::::: The code at line 91 was first introduced by commit
:::::: a0c74f6c9ea9cebd7a8f38142bf87e7c12c2905d platform: Provide stubs for !HAS_IOMEM builds

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
