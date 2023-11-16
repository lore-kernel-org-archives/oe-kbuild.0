Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1269475
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 04:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POv/b8qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700107703; x=1731643703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VWM/XyMAi0YMazEvlrSCI22r/YI+7pli4CZORt3EjEs=;
  b=POv/b8qzRCPDLGNaGUx+Eb4lychQWh+rTmj6E1nA9/nI0Y3i7kqoXwt8
   XF5I0ioJw6ROBXggWXHpiZI2bpyKEmuHl1QfZaTZo3WjjR1hTwavBc+tt
   /sKtQut3Cz8ow3Qw8F9ojdXzCFXHEoIvTGzmjLPjNOq+lGRd66cTFucxg
   gTref6jOSC2HlAXkEy9YZ8tuMPoP7E6QkyIAIuAAUQWjMyHY4ce9FyN+i
   3svWpnosqb+qmdNGoSEb26T73t0RThzmquydUiVvaJI8Gx3oT+HClRiH/
   4E95YD2ZNOIphIPo0RZ8gXI0jhWh9bWa4ThU+Kk93MybFVIHsFAJIyRAR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="390801983"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="390801983"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 20:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="12987874"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2023 20:08:21 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Tfv-0001HJ-0J;
	Thu, 16 Nov 2023 04:08:19 +0000
Date: Thu, 16 Nov 2023 12:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:pr/645 132/15769]
 include/asm-generic/div64.h:238:36: error: passing argument 1 of
 '__div64_32' from incompatible pointer type
Message-ID: <202311161240.h8OnkbaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "fbc a876adc3ae12aec519af4b9cbb6ed25f542f6fb9 and parent 3f32e9bc3705560d951d23ce5dfb61d1c851c3d9 have different kconfig"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Otavio Salvador <otavio@ossystems.com.br>

Hi Adrian,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/645
head:   d9e9cb8ce9bc751887fd5ed53e0cfac82c8aae13
commit: a876adc3ae12aec519af4b9cbb6ed25f542f6fb9 [132/15769] MLK-24930-1: sound: soc: fsl: imx pcm512x: iqaudio dac
:::::: branch date: 3 weeks ago
:::::: commit date: 11 months ago
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231116/202311161240.h8OnkbaZ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161240.h8OnkbaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311161240.h8OnkbaZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/xtensa/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from sound/soc/fsl/imx-pcm512x.c:13:
   sound/soc/fsl/imx-pcm512x.c: In function 'imx_pcm512x_hw_params':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   sound/soc/fsl/imx-pcm512x.c:189:21: note: in expansion of macro 'do_div'
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   sound/soc/fsl/imx-pcm512x.c:189:21: note: in expansion of macro 'do_div'
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   sound/soc/fsl/imx-pcm512x.c:189:21: note: in expansion of macro 'do_div'
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   sound/soc/fsl/imx-pcm512x.c:193:33: error: 'PCM512x_SYSCLK_MCLK1' undeclared (first use in this function); did you mean 'PCM512x_SDAC_MCK'?
     193 |                                 PCM512x_SYSCLK_MCLK1, mclk_freq, SND_SOC_CLOCK_IN);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 PCM512x_SDAC_MCK
   sound/soc/fsl/imx-pcm512x.c:193:33: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/fsl/imx-pcm512x.c:198:33: error: 'PCM512x_SYSCLK_MCLK2' undeclared (first use in this function); did you mean 'PCM512x_SDAC_MCK'?
     198 |                                 PCM512x_SYSCLK_MCLK2, mclk_freq, SND_SOC_CLOCK_IN);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 PCM512x_SDAC_MCK
   cc1: some warnings being treated as errors


vim +/__div64_32 +238 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  223  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  224  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  225  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  226  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  227  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  228  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  229  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  230  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  231  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  232  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  233  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

:::::: The code at line 238 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
