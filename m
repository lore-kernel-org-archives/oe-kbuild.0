Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA02D061C
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461850; cv=none; b=Nb+oy7Hc3tOKMIJSABowTTJ2qm22fNIpqVGKeUBkqjaHCMkrA5nE0r4Tn/VOXYNECCQp0ayUWOVrfnq2VI+roFWtmwqPy9G3qS9boMe+dUQqndGREelP1EGcQAPLe8q7K0Oua8T4YRrEE+HuBVntPOucSMH7VWz200NM1hgmSI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461850; c=relaxed/simple;
	bh=chnJRhieoLa9l5oRimgUbi/hrWBY56QUNwMPwIoWoaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYKG86diZs81LBbhQ/YG2MLxYN08ybYSEwQJncpzbr/egBv6mIf/Upp8G9/Qz75G51Kj19JNXA746GJP4dB8M1khIM9ifX9U5XceFs9snfNmBVq0sXhsY3FKX8CYDsC6303anIxwkkeK45a5Fxvcq587p8vNOqD4V54ZNHjbqUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp3nyIe6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp3nyIe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765461847; x=1796997847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=chnJRhieoLa9l5oRimgUbi/hrWBY56QUNwMPwIoWoaY=;
  b=Fp3nyIe6hCHE5iXqQbB/fZRRaGL5tXw36dlGb/8wAe7vGPwzQTIoDuMn
   xmrSx8H0mYQaLDlrTHSXDojiYiaPmXdoUVMm6vRrloH7WrOFMfKInRVqF
   ICoGzDsE7DoL6OfITGYkUOzLpLbRKSs/q1KdXe0b8K3eCRhNn+kLjLZRT
   BG73MyIn+gEPEjDK81eHezciWN5CCbOix3Ax5BgFzDmitCmlfHCHFalQI
   pgGr6L7xooM+ZGlq1X9/u+M1QeqypQ+vFXHcN92C8VAbe1Sn/YdBIA1LD
   KjYV/sZTD+imqoROsv1DYHKGDS5jRF7qaI2Y0w3LxdSOfP1W4IMkUaFPu
   w==;
X-CSE-ConnectionGUID: NDbp67YTR4Ox1578FJv56g==
X-CSE-MsgGUID: kD8aYM6lSPGpC4RVSBayrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="77757249"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="77757249"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 06:04:06 -0800
X-CSE-ConnectionGUID: vQ7g6ZxCQd2cH4W37Dz/dQ==
X-CSE-MsgGUID: +udP1aHZRxGIHpmXC3wgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197625514"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 06:04:05 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vThH0-000000004k9-42E1;
	Thu, 11 Dec 2025 14:04:02 +0000
Date: Thu, 11 Dec 2025 22:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/9] bitfield: Update sanity checks
Message-ID: <202512112136.QAv8Vduf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse: sparse: __auto_type on self-init var"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251209100313.2867-7-david.laight.linux@gmail.com>
References: <20251209100313.2867-7-david.laight.linux@gmail.com>
TO: david.laight.linux@gmail.com
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: linux-kernel@vger.kernel.org
TO: linux-usb@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
TO: Crt Mori <cmo@melexis.com>
TO: Richard Genoud <richard.genoud@bootlin.com>
TO: Andy Shevchenko <andriy.shevchenko@intel.com>
TO: Luo Jie <quic_luoj@quicinc.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Jakub Kicinski <kuba@kernel.org>
TO: netdev@vger.kernel.org
TO: "David S . Miller" <davem@davemloft.net>
TO: Simon Horman <simon.horman@netronome.com>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
TO: Andreas Noever <andreas.noever@gmail.com>
TO: Yehezkel Bernat <YehezkelShB@gmail.com>
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: David Laight <david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20251211]
[cannot apply to westeri-thunderbolt/next v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/nfp-Call-FIELD_PREP-in-NFP_ETH_SET_BIT_CONFIG-wrapper/20251209-181248
base:   linus/master
patch link:    https://lore.kernel.org/r/20251209100313.2867-7-david.laight.linux%40gmail.com
patch subject: [PATCH 6/9] bitfield: Update sanity checks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r133-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112136.QAv8Vduf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112136.QAv8Vduf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512112136.QAv8Vduf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse: sparse: __auto_type on self-init var
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse: sparse: __auto_type on self-init var
   drivers/mmc/host/dw_mmc-rockchip.c:595:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/dw_mmc-rockchip.c:595:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mmc/host/dw_mmc-rockchip.c:596:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/dw_mmc-rockchip.c:596:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mmc/host/dw_mmc-rockchip.c:597:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/dw_mmc-rockchip.c:597:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   drivers/mmc/host/dw_mmc-rockchip.c:598:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/dw_mmc-rockchip.c:598:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mmc/host/dw_mmc-rockchip.c:598:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/dw_mmc-rockchip.c:598:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
>> drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse:    unsigned int
   drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse:    bad type
>> drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse: sparse: incompatible type for operation (-):
   drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse:    bad type _mask
>> drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse: sparse: incompatible types for operation (>>):
   drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse:    bad type _mask
   drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse:    int
   drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse: sparse: incompatible types for operation (<<):
   drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse:    bad type _val
   drivers/mmc/host/dw_mmc-rockchip.c:152:17: sparse:    int
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse:    unsigned int
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse:    bad type
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse: sparse: incompatible type for operation (-):
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse:    bad type _mask
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse: sparse: incompatible types for operation (>>):
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse:    bad type _mask
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse:    int
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse: sparse: incompatible types for operation (<<):
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse:    bad type _val
   drivers/mmc/host/dw_mmc-rockchip.c:155:17: sparse:    int

vim +152 drivers/mmc/host/dw_mmc-rockchip.c

59903441f5e49d Shawn Lin          2024-08-28   87  
59903441f5e49d Shawn Lin          2024-08-28   88  static int rockchip_mmc_set_internal_phase(struct dw_mci *host, bool sample, int degrees)
59903441f5e49d Shawn Lin          2024-08-28   89  {
739f04f4a46237 Shawn Lin          2025-11-04   90  	unsigned long rate = clk_get_rate(host->ciu_clk) / RK3288_CLKGEN_DIV;
59903441f5e49d Shawn Lin          2024-08-28   91  	u8 nineties, remainder;
59903441f5e49d Shawn Lin          2024-08-28   92  	u8 delay_num;
59903441f5e49d Shawn Lin          2024-08-28   93  	u32 raw_value;
59903441f5e49d Shawn Lin          2024-08-28   94  	u32 delay;
59903441f5e49d Shawn Lin          2024-08-28   95  
59903441f5e49d Shawn Lin          2024-08-28   96  	/*
59903441f5e49d Shawn Lin          2024-08-28   97  	 * The below calculation is based on the output clock from
59903441f5e49d Shawn Lin          2024-08-28   98  	 * MMC host to the card, which expects the phase clock inherits
59903441f5e49d Shawn Lin          2024-08-28   99  	 * the clock rate from its parent, namely the output clock
59903441f5e49d Shawn Lin          2024-08-28  100  	 * provider of MMC host. However, things may go wrong if
59903441f5e49d Shawn Lin          2024-08-28  101  	 * (1) It is orphan.
59903441f5e49d Shawn Lin          2024-08-28  102  	 * (2) It is assigned to the wrong parent.
59903441f5e49d Shawn Lin          2024-08-28  103  	 *
59903441f5e49d Shawn Lin          2024-08-28  104  	 * This check help debug the case (1), which seems to be the
59903441f5e49d Shawn Lin          2024-08-28  105  	 * most likely problem we often face and which makes it difficult
59903441f5e49d Shawn Lin          2024-08-28  106  	 * for people to debug unstable mmc tuning results.
59903441f5e49d Shawn Lin          2024-08-28  107  	 */
59903441f5e49d Shawn Lin          2024-08-28  108  	if (!rate) {
59903441f5e49d Shawn Lin          2024-08-28  109  		dev_err(host->dev, "%s: invalid clk rate\n", __func__);
59903441f5e49d Shawn Lin          2024-08-28  110  		return -EINVAL;
59903441f5e49d Shawn Lin          2024-08-28  111  	}
59903441f5e49d Shawn Lin          2024-08-28  112  
59903441f5e49d Shawn Lin          2024-08-28  113  	nineties = degrees / 90;
59903441f5e49d Shawn Lin          2024-08-28  114  	remainder = (degrees % 90);
59903441f5e49d Shawn Lin          2024-08-28  115  
59903441f5e49d Shawn Lin          2024-08-28  116  	/*
59903441f5e49d Shawn Lin          2024-08-28  117  	 * Due to the inexact nature of the "fine" delay, we might
59903441f5e49d Shawn Lin          2024-08-28  118  	 * actually go non-monotonic.  We don't go _too_ monotonic
59903441f5e49d Shawn Lin          2024-08-28  119  	 * though, so we should be OK.  Here are options of how we may
59903441f5e49d Shawn Lin          2024-08-28  120  	 * work:
59903441f5e49d Shawn Lin          2024-08-28  121  	 *
59903441f5e49d Shawn Lin          2024-08-28  122  	 * Ideally we end up with:
59903441f5e49d Shawn Lin          2024-08-28  123  	 *   1.0, 2.0, ..., 69.0, 70.0, ...,  89.0, 90.0
59903441f5e49d Shawn Lin          2024-08-28  124  	 *
59903441f5e49d Shawn Lin          2024-08-28  125  	 * On one extreme (if delay is actually 44ps):
59903441f5e49d Shawn Lin          2024-08-28  126  	 *   .73, 1.5, ..., 50.6, 51.3, ...,  65.3, 90.0
59903441f5e49d Shawn Lin          2024-08-28  127  	 * The other (if delay is actually 77ps):
59903441f5e49d Shawn Lin          2024-08-28  128  	 *   1.3, 2.6, ..., 88.6. 89.8, ..., 114.0, 90
59903441f5e49d Shawn Lin          2024-08-28  129  	 *
59903441f5e49d Shawn Lin          2024-08-28  130  	 * It's possible we might make a delay that is up to 25
59903441f5e49d Shawn Lin          2024-08-28  131  	 * degrees off from what we think we're making.  That's OK
59903441f5e49d Shawn Lin          2024-08-28  132  	 * though because we should be REALLY far from any bad range.
59903441f5e49d Shawn Lin          2024-08-28  133  	 */
59903441f5e49d Shawn Lin          2024-08-28  134  
59903441f5e49d Shawn Lin          2024-08-28  135  	/*
59903441f5e49d Shawn Lin          2024-08-28  136  	 * Convert to delay; do a little extra work to make sure we
59903441f5e49d Shawn Lin          2024-08-28  137  	 * don't overflow 32-bit / 64-bit numbers.
59903441f5e49d Shawn Lin          2024-08-28  138  	 */
59903441f5e49d Shawn Lin          2024-08-28  139  	delay = 10000000; /* PSECS_PER_SEC / 10000 / 10 */
59903441f5e49d Shawn Lin          2024-08-28  140  	delay *= remainder;
59903441f5e49d Shawn Lin          2024-08-28  141  	delay = DIV_ROUND_CLOSEST(delay,
59903441f5e49d Shawn Lin          2024-08-28  142  			(rate / 1000) * 36 *
59903441f5e49d Shawn Lin          2024-08-28  143  				(ROCKCHIP_MMC_DELAY_ELEMENT_PSEC / 10));
59903441f5e49d Shawn Lin          2024-08-28  144  
59903441f5e49d Shawn Lin          2024-08-28  145  	delay_num = (u8) min_t(u32, delay, 255);
59903441f5e49d Shawn Lin          2024-08-28  146  
59903441f5e49d Shawn Lin          2024-08-28  147  	raw_value = delay_num ? ROCKCHIP_MMC_DELAY_SEL : 0;
59903441f5e49d Shawn Lin          2024-08-28  148  	raw_value |= delay_num << ROCKCHIP_MMC_DELAYNUM_OFFSET;
59903441f5e49d Shawn Lin          2024-08-28  149  	raw_value |= nineties;
59903441f5e49d Shawn Lin          2024-08-28  150  
59903441f5e49d Shawn Lin          2024-08-28  151  	if (sample)
47975a878c0669 Nicolas Frattaroli 2025-08-25 @152  		mci_writel(host, TIMING_CON1,
47975a878c0669 Nicolas Frattaroli 2025-08-25  153  			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
59903441f5e49d Shawn Lin          2024-08-28  154  	else
47975a878c0669 Nicolas Frattaroli 2025-08-25  155  		mci_writel(host, TIMING_CON0,
47975a878c0669 Nicolas Frattaroli 2025-08-25  156  			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
59903441f5e49d Shawn Lin          2024-08-28  157  
59903441f5e49d Shawn Lin          2024-08-28  158  	dev_dbg(host->dev, "set %s_phase(%d) delay_nums=%u actual_degrees=%d\n",
59903441f5e49d Shawn Lin          2024-08-28  159  		sample ? "sample" : "drv", degrees, delay_num,
59903441f5e49d Shawn Lin          2024-08-28  160  		rockchip_mmc_get_phase(host, sample)
59903441f5e49d Shawn Lin          2024-08-28  161  	);
59903441f5e49d Shawn Lin          2024-08-28  162  
59903441f5e49d Shawn Lin          2024-08-28  163  	return 0;
59903441f5e49d Shawn Lin          2024-08-28  164  }
59903441f5e49d Shawn Lin          2024-08-28  165  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
