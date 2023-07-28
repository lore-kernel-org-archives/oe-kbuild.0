Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D838A101C9
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690538110; x=1722074110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QanT6OfdMTQN8NpGPi2P4SybArs7DzTqADoftaisfto=;
  b=YmYRBk9qGH3OH4l/UbhD8Ehdt1TaM4XCoTT7/u0xeKSd9fzv5FFd1hkE
   yKNdSqTQEJc9Rm+g9ETHOAbXRhACt07WIHkNhtJJiy5DkRMVS831LskiB
   c82JdqEwMVD4/NOU+2Go+omJGzovfTTe5gPjo2C5wp1S+pxhq8oyfo1ZI
   zYIZ+WbO5itJi6pPWcT5LMIH268G1k14QXWbhh3t4KFMuueDIG3DJwQDL
   4ZyNwC9YJKxhEaL66/7lbMnT1iTTRAtW4X5rTxoXgTz/y0yHYfpFUycG+
   CWFKtLgV/2VK67/ajUpwqxO/FfpTZs3m8KgVcSmG+py1zNRe9U2PIZpGF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="366014834"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="366014834"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 02:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="974020550"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="974020550"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2023 02:55:08 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPKBN-00034x-2J;
	Fri, 28 Jul 2023 09:55:04 +0000
Date: Fri, 28 Jul 2023 17:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307281720.mbvQspFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/clk/baikal-t1/ccu-div.c:227:16: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230728]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r092-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281720.mbvQspFC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281720.mbvQspFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307281720.mbvQspFC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/baikal-t1/ccu-div.c:227:16: sparse: sparse: bad integer constant expression
>> drivers/clk/baikal-t1/ccu-div.c:227:16: sparse: sparse: static assertion failed: "clamp() low limit (unsigned long)(0) greater than high limit (unsigned long)(((mask) >> 4))"
--
>> drivers/clk/ingenic/jz4760-cgu.c:67:13: sparse: sparse: bad integer constant expression
>> drivers/clk/ingenic/jz4760-cgu.c:67:13: sparse: sparse: static assertion failed: "clamp() low limit (typeof(n))(2) greater than high limit (typeof(n))(1 << pll_info->n_bits)"
--
>> drivers/media/radio/dsbr100.c:209:39: sparse: sparse: bad integer constant expression
>> drivers/media/radio/dsbr100.c:209:39: sparse: sparse: static assertion failed: "clamp() low limit (unsigned)(87.5 * 16000) greater than high limit (unsigned)(108.0 * 16000)"
--
>> drivers/clk/renesas/rcar-gen2-cpg.c:78:16: sparse: sparse: bad integer constant expression
>> drivers/clk/renesas/rcar-gen2-cpg.c:78:16: sparse: sparse: static assertion failed: "clamp() low limit min_mult greater than high limit max_mult"
--
>> drivers/clk/renesas/rcar-gen3-cpg.c:79:16: sparse: sparse: bad integer constant expression
>> drivers/clk/renesas/rcar-gen3-cpg.c:79:16: sparse: sparse: static assertion failed: "clamp() low limit min_mult greater than high limit max_mult"
   drivers/clk/renesas/rcar-gen3-cpg.c:214:16: sparse: sparse: bad integer constant expression
   drivers/clk/renesas/rcar-gen3-cpg.c:214:16: sparse: sparse: static assertion failed: "clamp() low limit min_mult greater than high limit max_mult"
--
>> drivers/clk/renesas/rcar-gen4-cpg.c:94:16: sparse: sparse: bad integer constant expression
>> drivers/clk/renesas/rcar-gen4-cpg.c:94:16: sparse: sparse: static assertion failed: "clamp() low limit min_mult greater than high limit max_mult"
   drivers/clk/renesas/rcar-gen4-cpg.c:234:16: sparse: sparse: bad integer constant expression
   drivers/clk/renesas/rcar-gen4-cpg.c:234:16: sparse: sparse: static assertion failed: "clamp() low limit min_mult greater than high limit max_mult"
--
>> drivers/clk/renesas/clk-div6.c:127:23: sparse: sparse: bad integer constant expression
>> drivers/clk/renesas/clk-div6.c:127:23: sparse: sparse: static assertion failed: "clamp() low limit min_div greater than high limit max_div"
--
>> drivers/net/phy/bcm54140.c:311:15: sparse: sparse: bad integer constant expression
>> drivers/net/phy/bcm54140.c:311:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))((413350L - (mask) * 491)) greater than high limit (typeof(val))((413350L - (0) * 491))"
   drivers/net/phy/bcm54140.c:336:15: sparse: sparse: bad integer constant expression
>> drivers/net/phy/bcm54140.c:336:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(((channel) ? ((mask) * 4400 >> 12) : ((mask) * 2514 >> 11)))"
--
>> drivers/media/usb/airspy/airspy.c:758:28: sparse: sparse: bad integer constant expression
>> drivers/media/usb/airspy/airspy.c:758:28: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(bands[0].rangelow) greater than high limit (unsigned int)(bands[0].rangehigh)"
   drivers/media/usb/airspy/airspy.c:764:27: sparse: sparse: bad integer constant expression
>> drivers/media/usb/airspy/airspy.c:764:27: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(bands_rf[0].rangelow) greater than high limit (unsigned int)(bands_rf[0].rangehigh)"
--
>> drivers/media/usb/hackrf/hackrf.c:1098:25: sparse: sparse: bad integer constant expression
>> drivers/media/usb/hackrf/hackrf.c:1098:25: sparse: sparse: static assertion failed: "clamp() low limit bands_adc_dac[0].rangelow greater than high limit bands_adc_dac[0].rangehigh"
   drivers/media/usb/hackrf/hackrf.c:1108:25: sparse: sparse: bad integer constant expression
>> drivers/media/usb/hackrf/hackrf.c:1108:25: sparse: sparse: static assertion failed: "clamp() low limit bands_rx_tx[0].rangelow greater than high limit bands_rx_tx[0].rangehigh"

vim +227 drivers/clk/baikal-t1/ccu-div.c

353afa3a8d2ef4a Serge Semin 2020-05-27  219  
353afa3a8d2ef4a Serge Semin 2020-05-27  220  static inline unsigned long ccu_div_var_calc_divider(unsigned long rate,
353afa3a8d2ef4a Serge Semin 2020-05-27  221  						     unsigned long parent_rate,
353afa3a8d2ef4a Serge Semin 2020-05-27  222  						     unsigned int mask)
353afa3a8d2ef4a Serge Semin 2020-05-27  223  {
353afa3a8d2ef4a Serge Semin 2020-05-27  224  	unsigned long divider;
353afa3a8d2ef4a Serge Semin 2020-05-27  225  
353afa3a8d2ef4a Serge Semin 2020-05-27  226  	divider = parent_rate / rate;
353afa3a8d2ef4a Serge Semin 2020-05-27 @227  	return clamp_t(unsigned long, divider, CCU_DIV_CLKDIV_MIN,
353afa3a8d2ef4a Serge Semin 2020-05-27  228  		       CCU_DIV_CLKDIV_MAX(mask));
353afa3a8d2ef4a Serge Semin 2020-05-27  229  }
353afa3a8d2ef4a Serge Semin 2020-05-27  230  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
