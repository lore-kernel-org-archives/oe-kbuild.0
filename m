Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C561ECA
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 00:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgRtUzde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702427300; x=1733963300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Sipn/fjDchwnln1ZhgAzjNYs/ykGqqlGqLZgaZjDe0=;
  b=OgRtUzdeADzmxD/iVVnY5T2jYQYTRFd+cmoqQbWsanhCt7iIsd1ehKHw
   ghlMTbRzjF9xZNvz9oNbF3xK/MCY7tV2qmOtqDxMxSBJVxigjlKi7Vg6B
   hppXmfFGE7lAuDnJ4tfW9tp2iAC2mpfgjSU2f8VouSYg9jYFQfz56dZC5
   SIL6QWs+YwXkHLVr5wsFuDVaZY92lYHU6QMaqK4P0O03mFyVxOTFptdp0
   eR5O16cTZOwynHzMdAZnIw/+oosF5aFsK8lSb/DasLf+C5lZnU+bEAppo
   LpQF3w9w2bkg6o4fPP8T4VS80XqzplP6/xnkIRuB5FjNw0rPMpdRPg7Ei
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="392068174"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="392068174"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 16:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1020915462"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1020915462"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2023 16:28:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDD6i-000Ju4-0I;
	Wed, 13 Dec 2023 00:28:12 +0000
Date: Wed, 13 Dec 2023 08:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:testing 40/41] drivers/media/i2c/imx415.c:402:30:
 sparse: sparse: decimal constant 2376000000 is between LONG_MAX and
 ULONG_MAX. For C99 that means long long, C90 compilers are very likely to
 produce unsigned long (and a warning) here
Message-ID: <202312130853.CgdSZyee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/i2c/imx415.c:402:30: sparse: sparse: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git testing
head:   f1986ff84b37d2c7d5fa3bfbac84cc29fdf8248f
commit: cb28f73de56204a6a54c913833b3580e15f4522c [40/41] media: i2c: imx415: Add more clock configurations
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-062-20231213 (https://download.01.org/0day-ci/archive/20231213/202312130853.CgdSZyee-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130853.CgdSZyee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312130853.CgdSZyee-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/imx415.c:402:30: sparse: sparse: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
   drivers/media/i2c/imx415.c:417:30: sparse: sparse: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
   drivers/media/i2c/imx415.c:432:30: sparse: sparse: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +402 drivers/media/i2c/imx415.c

14cd15e7a1e2a3 Gerald Loacker  2023-01-30  113  
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  114  /* INCK Settings - includes all lane rate and INCK dependent registers */
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  115  static const struct imx415_clk_params imx415_clk_params[] = {
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  116  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  117  		.lane_rate = 594000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  118  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  119  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  120  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  121  		.regs[2] = { IMX415_SYS_MODE, 0x7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  122  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  123  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  124  		.regs[5] = { IMX415_INCKSEL3, 0x084 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  125  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  126  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  127  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  128  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  129  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  130  	},
cb28f73de56204 Alexander Stein 2023-12-05  131  	{
cb28f73de56204 Alexander Stein 2023-12-05  132  		.lane_rate = 594000000,
cb28f73de56204 Alexander Stein 2023-12-05  133  		.inck = 37125000,
cb28f73de56204 Alexander Stein 2023-12-05  134  		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
cb28f73de56204 Alexander Stein 2023-12-05  135  		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
cb28f73de56204 Alexander Stein 2023-12-05  136  		.regs[2] = { IMX415_SYS_MODE, 0x7 },
cb28f73de56204 Alexander Stein 2023-12-05  137  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  138  		.regs[4] = { IMX415_INCKSEL2, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  139  		.regs[5] = { IMX415_INCKSEL3, 0x080 },
cb28f73de56204 Alexander Stein 2023-12-05  140  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  141  		.regs[7] = { IMX415_INCKSEL5, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  142  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  143  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  144  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0984 },
cb28f73de56204 Alexander Stein 2023-12-05  145  	},
cb28f73de56204 Alexander Stein 2023-12-05  146  	{
cb28f73de56204 Alexander Stein 2023-12-05  147  		.lane_rate = 594000000,
cb28f73de56204 Alexander Stein 2023-12-05  148  		.inck = 74250000,
cb28f73de56204 Alexander Stein 2023-12-05  149  		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
cb28f73de56204 Alexander Stein 2023-12-05  150  		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
cb28f73de56204 Alexander Stein 2023-12-05  151  		.regs[2] = { IMX415_SYS_MODE, 0x7 },
cb28f73de56204 Alexander Stein 2023-12-05  152  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  153  		.regs[4] = { IMX415_INCKSEL2, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  154  		.regs[5] = { IMX415_INCKSEL3, 0x080 },
cb28f73de56204 Alexander Stein 2023-12-05  155  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  156  		.regs[7] = { IMX415_INCKSEL5, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  157  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  158  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  159  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
cb28f73de56204 Alexander Stein 2023-12-05  160  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  161  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  162  		.lane_rate = 720000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  163  		.inck = 24000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  164  		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  165  		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  166  		.regs[2] = { IMX415_SYS_MODE, 0x9 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  167  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  168  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  169  		.regs[5] = { IMX415_INCKSEL3, 0x0B4 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  170  		.regs[6] = { IMX415_INCKSEL4, 0x0FC },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  171  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  172  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  173  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  174  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  175  	},
cb28f73de56204 Alexander Stein 2023-12-05  176  	{
cb28f73de56204 Alexander Stein 2023-12-05  177  		.lane_rate = 720000000,
cb28f73de56204 Alexander Stein 2023-12-05  178  		.inck = 72000000,
cb28f73de56204 Alexander Stein 2023-12-05  179  		.regs[0] = { IMX415_BCWAIT_TIME, 0x0F8 },
cb28f73de56204 Alexander Stein 2023-12-05  180  		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B0 },
cb28f73de56204 Alexander Stein 2023-12-05  181  		.regs[2] = { IMX415_SYS_MODE, 0x9 },
cb28f73de56204 Alexander Stein 2023-12-05  182  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  183  		.regs[4] = { IMX415_INCKSEL2, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  184  		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
cb28f73de56204 Alexander Stein 2023-12-05  185  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  186  		.regs[7] = { IMX415_INCKSEL5, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  187  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  188  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  189  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1200 },
cb28f73de56204 Alexander Stein 2023-12-05  190  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  191  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  192  		.lane_rate = 891000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  193  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  194  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  195  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  196  		.regs[2] = { IMX415_SYS_MODE, 0x5 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  197  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  198  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  199  		.regs[5] = { IMX415_INCKSEL3, 0x0C6 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  200  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  201  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  202  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  203  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  204  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  205  	},
cb28f73de56204 Alexander Stein 2023-12-05  206  	{
cb28f73de56204 Alexander Stein 2023-12-05  207  		.lane_rate = 891000000,
cb28f73de56204 Alexander Stein 2023-12-05  208  		.inck = 37125000,
cb28f73de56204 Alexander Stein 2023-12-05  209  		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
cb28f73de56204 Alexander Stein 2023-12-05  210  		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
cb28f73de56204 Alexander Stein 2023-12-05  211  		.regs[2] = { IMX415_SYS_MODE, 0x5 },
cb28f73de56204 Alexander Stein 2023-12-05  212  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  213  		.regs[4] = { IMX415_INCKSEL2, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  214  		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
cb28f73de56204 Alexander Stein 2023-12-05  215  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  216  		.regs[7] = { IMX415_INCKSEL5, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  217  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  218  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  219  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
cb28f73de56204 Alexander Stein 2023-12-05  220  	},
cb28f73de56204 Alexander Stein 2023-12-05  221  	{
cb28f73de56204 Alexander Stein 2023-12-05  222  		.lane_rate = 891000000,
cb28f73de56204 Alexander Stein 2023-12-05  223  		.inck = 74250000,
cb28f73de56204 Alexander Stein 2023-12-05  224  		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
cb28f73de56204 Alexander Stein 2023-12-05  225  		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
cb28f73de56204 Alexander Stein 2023-12-05  226  		.regs[2] = { IMX415_SYS_MODE, 0x5 },
cb28f73de56204 Alexander Stein 2023-12-05  227  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  228  		.regs[4] = { IMX415_INCKSEL2, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  229  		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
cb28f73de56204 Alexander Stein 2023-12-05  230  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  231  		.regs[7] = { IMX415_INCKSEL5, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  232  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  233  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  234  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
cb28f73de56204 Alexander Stein 2023-12-05  235  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  236  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  237  		.lane_rate = 1440000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  238  		.inck = 24000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  239  		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  240  		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  241  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  242  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  243  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  244  		.regs[5] = { IMX415_INCKSEL3, 0x0B4 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  245  		.regs[6] = { IMX415_INCKSEL4, 0x0FC },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  246  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  247  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  248  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  249  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  250  	},
cb28f73de56204 Alexander Stein 2023-12-05  251  	{
cb28f73de56204 Alexander Stein 2023-12-05  252  		.lane_rate = 1440000000,
cb28f73de56204 Alexander Stein 2023-12-05  253  		.inck = 72000000,
cb28f73de56204 Alexander Stein 2023-12-05  254  		.regs[0] = { IMX415_BCWAIT_TIME, 0x0F8 },
cb28f73de56204 Alexander Stein 2023-12-05  255  		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B0 },
cb28f73de56204 Alexander Stein 2023-12-05  256  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
cb28f73de56204 Alexander Stein 2023-12-05  257  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  258  		.regs[4] = { IMX415_INCKSEL2, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  259  		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
cb28f73de56204 Alexander Stein 2023-12-05  260  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  261  		.regs[7] = { IMX415_INCKSEL5, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  262  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  263  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  264  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1200 },
cb28f73de56204 Alexander Stein 2023-12-05  265  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  266  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  267  		.lane_rate = 1485000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  268  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  269  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  270  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  271  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  272  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  273  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  274  		.regs[5] = { IMX415_INCKSEL3, 0x0A5 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  275  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  276  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  277  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  278  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  279  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  280  	},
cb28f73de56204 Alexander Stein 2023-12-05  281  	{
cb28f73de56204 Alexander Stein 2023-12-05  282  		.lane_rate = 1485000000,
cb28f73de56204 Alexander Stein 2023-12-05  283  		.inck = 37125000,
cb28f73de56204 Alexander Stein 2023-12-05  284  		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
cb28f73de56204 Alexander Stein 2023-12-05  285  		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
cb28f73de56204 Alexander Stein 2023-12-05  286  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
cb28f73de56204 Alexander Stein 2023-12-05  287  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  288  		.regs[4] = { IMX415_INCKSEL2, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  289  		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
cb28f73de56204 Alexander Stein 2023-12-05  290  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  291  		.regs[7] = { IMX415_INCKSEL5, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  292  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  293  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  294  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
cb28f73de56204 Alexander Stein 2023-12-05  295  	},
cb28f73de56204 Alexander Stein 2023-12-05  296  	{
cb28f73de56204 Alexander Stein 2023-12-05  297  		.lane_rate = 1485000000,
cb28f73de56204 Alexander Stein 2023-12-05  298  		.inck = 74250000,
cb28f73de56204 Alexander Stein 2023-12-05  299  		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
cb28f73de56204 Alexander Stein 2023-12-05  300  		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
cb28f73de56204 Alexander Stein 2023-12-05  301  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
cb28f73de56204 Alexander Stein 2023-12-05  302  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  303  		.regs[4] = { IMX415_INCKSEL2, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  304  		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
cb28f73de56204 Alexander Stein 2023-12-05  305  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  306  		.regs[7] = { IMX415_INCKSEL5, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  307  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  308  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  309  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
cb28f73de56204 Alexander Stein 2023-12-05  310  	},
cb28f73de56204 Alexander Stein 2023-12-05  311  	{
cb28f73de56204 Alexander Stein 2023-12-05  312  		.lane_rate = 1782000000,
cb28f73de56204 Alexander Stein 2023-12-05  313  		.inck = 27000000,
cb28f73de56204 Alexander Stein 2023-12-05  314  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
cb28f73de56204 Alexander Stein 2023-12-05  315  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
cb28f73de56204 Alexander Stein 2023-12-05  316  		.regs[2] = { IMX415_SYS_MODE, 0x4 },
cb28f73de56204 Alexander Stein 2023-12-05  317  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  318  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
cb28f73de56204 Alexander Stein 2023-12-05  319  		.regs[5] = { IMX415_INCKSEL3, 0x0C6 },
cb28f73de56204 Alexander Stein 2023-12-05  320  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
cb28f73de56204 Alexander Stein 2023-12-05  321  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
cb28f73de56204 Alexander Stein 2023-12-05  322  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  323  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  324  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
cb28f73de56204 Alexander Stein 2023-12-05  325  	},
cb28f73de56204 Alexander Stein 2023-12-05  326  	{
cb28f73de56204 Alexander Stein 2023-12-05  327  		.lane_rate = 1782000000,
cb28f73de56204 Alexander Stein 2023-12-05  328  		.inck = 37125000,
cb28f73de56204 Alexander Stein 2023-12-05  329  		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
cb28f73de56204 Alexander Stein 2023-12-05  330  		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
cb28f73de56204 Alexander Stein 2023-12-05  331  		.regs[2] = { IMX415_SYS_MODE, 0x4 },
cb28f73de56204 Alexander Stein 2023-12-05  332  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  333  		.regs[4] = { IMX415_INCKSEL2, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  334  		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
cb28f73de56204 Alexander Stein 2023-12-05  335  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  336  		.regs[7] = { IMX415_INCKSEL5, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  337  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  338  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  339  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
cb28f73de56204 Alexander Stein 2023-12-05  340  	},
cb28f73de56204 Alexander Stein 2023-12-05  341  	{
cb28f73de56204 Alexander Stein 2023-12-05  342  		.lane_rate = 1782000000,
cb28f73de56204 Alexander Stein 2023-12-05  343  		.inck = 74250000,
cb28f73de56204 Alexander Stein 2023-12-05  344  		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
cb28f73de56204 Alexander Stein 2023-12-05  345  		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
cb28f73de56204 Alexander Stein 2023-12-05  346  		.regs[2] = { IMX415_SYS_MODE, 0x4 },
cb28f73de56204 Alexander Stein 2023-12-05  347  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  348  		.regs[4] = { IMX415_INCKSEL2, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  349  		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
cb28f73de56204 Alexander Stein 2023-12-05  350  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  351  		.regs[7] = { IMX415_INCKSEL5, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  352  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  353  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  354  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
cb28f73de56204 Alexander Stein 2023-12-05  355  	},
cb28f73de56204 Alexander Stein 2023-12-05  356  	{
cb28f73de56204 Alexander Stein 2023-12-05  357  		.lane_rate = 2079000000,
cb28f73de56204 Alexander Stein 2023-12-05  358  		.inck = 27000000,
cb28f73de56204 Alexander Stein 2023-12-05  359  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
cb28f73de56204 Alexander Stein 2023-12-05  360  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
cb28f73de56204 Alexander Stein 2023-12-05  361  		.regs[2] = { IMX415_SYS_MODE, 0x2 },
cb28f73de56204 Alexander Stein 2023-12-05  362  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  363  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
cb28f73de56204 Alexander Stein 2023-12-05  364  		.regs[5] = { IMX415_INCKSEL3, 0x0E7 },
cb28f73de56204 Alexander Stein 2023-12-05  365  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
cb28f73de56204 Alexander Stein 2023-12-05  366  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
cb28f73de56204 Alexander Stein 2023-12-05  367  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  368  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  369  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
cb28f73de56204 Alexander Stein 2023-12-05  370  	},
cb28f73de56204 Alexander Stein 2023-12-05  371  	{
cb28f73de56204 Alexander Stein 2023-12-05  372  		.lane_rate = 2079000000,
cb28f73de56204 Alexander Stein 2023-12-05  373  		.inck = 37125000,
cb28f73de56204 Alexander Stein 2023-12-05  374  		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
cb28f73de56204 Alexander Stein 2023-12-05  375  		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
cb28f73de56204 Alexander Stein 2023-12-05  376  		.regs[2] = { IMX415_SYS_MODE, 0x2 },
cb28f73de56204 Alexander Stein 2023-12-05  377  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  378  		.regs[4] = { IMX415_INCKSEL2, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  379  		.regs[5] = { IMX415_INCKSEL3, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  380  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  381  		.regs[7] = { IMX415_INCKSEL5, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  382  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  383  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  384  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
cb28f73de56204 Alexander Stein 2023-12-05  385  	},
cb28f73de56204 Alexander Stein 2023-12-05  386  	{
cb28f73de56204 Alexander Stein 2023-12-05  387  		.lane_rate = 2079000000,
cb28f73de56204 Alexander Stein 2023-12-05  388  		.inck = 74250000,
cb28f73de56204 Alexander Stein 2023-12-05  389  		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
cb28f73de56204 Alexander Stein 2023-12-05  390  		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
cb28f73de56204 Alexander Stein 2023-12-05  391  		.regs[2] = { IMX415_SYS_MODE, 0x2 },
cb28f73de56204 Alexander Stein 2023-12-05  392  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  393  		.regs[4] = { IMX415_INCKSEL2, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  394  		.regs[5] = { IMX415_INCKSEL3, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  395  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  396  		.regs[7] = { IMX415_INCKSEL5, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  397  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  398  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  399  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
cb28f73de56204 Alexander Stein 2023-12-05  400  	},
cb28f73de56204 Alexander Stein 2023-12-05  401  	{
cb28f73de56204 Alexander Stein 2023-12-05 @402  		.lane_rate = 2376000000,
cb28f73de56204 Alexander Stein 2023-12-05  403  		.inck = 27000000,
cb28f73de56204 Alexander Stein 2023-12-05  404  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
cb28f73de56204 Alexander Stein 2023-12-05  405  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
cb28f73de56204 Alexander Stein 2023-12-05  406  		.regs[2] = { IMX415_SYS_MODE, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  407  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  408  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
cb28f73de56204 Alexander Stein 2023-12-05  409  		.regs[5] = { IMX415_INCKSEL3, 0x108 },
cb28f73de56204 Alexander Stein 2023-12-05  410  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
cb28f73de56204 Alexander Stein 2023-12-05  411  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
cb28f73de56204 Alexander Stein 2023-12-05  412  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  413  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  414  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
cb28f73de56204 Alexander Stein 2023-12-05  415  	},
cb28f73de56204 Alexander Stein 2023-12-05  416  	{
cb28f73de56204 Alexander Stein 2023-12-05  417  		.lane_rate = 2376000000,
cb28f73de56204 Alexander Stein 2023-12-05  418  		.inck = 37125000,
cb28f73de56204 Alexander Stein 2023-12-05  419  		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
cb28f73de56204 Alexander Stein 2023-12-05  420  		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
cb28f73de56204 Alexander Stein 2023-12-05  421  		.regs[2] = { IMX415_SYS_MODE, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  422  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  423  		.regs[4] = { IMX415_INCKSEL2, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  424  		.regs[5] = { IMX415_INCKSEL3, 0x100 },
cb28f73de56204 Alexander Stein 2023-12-05  425  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  426  		.regs[7] = { IMX415_INCKSEL5, 0x24 },
cb28f73de56204 Alexander Stein 2023-12-05  427  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  428  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  429  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
cb28f73de56204 Alexander Stein 2023-12-05  430  	},
cb28f73de56204 Alexander Stein 2023-12-05  431  	{
cb28f73de56204 Alexander Stein 2023-12-05  432  		.lane_rate = 2376000000,
cb28f73de56204 Alexander Stein 2023-12-05  433  		.inck = 74250000,
cb28f73de56204 Alexander Stein 2023-12-05  434  		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
cb28f73de56204 Alexander Stein 2023-12-05  435  		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
cb28f73de56204 Alexander Stein 2023-12-05  436  		.regs[2] = { IMX415_SYS_MODE, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  437  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
cb28f73de56204 Alexander Stein 2023-12-05  438  		.regs[4] = { IMX415_INCKSEL2, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  439  		.regs[5] = { IMX415_INCKSEL3, 0x100 },
cb28f73de56204 Alexander Stein 2023-12-05  440  		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
cb28f73de56204 Alexander Stein 2023-12-05  441  		.regs[7] = { IMX415_INCKSEL5, 0x28 },
cb28f73de56204 Alexander Stein 2023-12-05  442  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
cb28f73de56204 Alexander Stein 2023-12-05  443  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
cb28f73de56204 Alexander Stein 2023-12-05  444  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
cb28f73de56204 Alexander Stein 2023-12-05  445  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  446  };
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
