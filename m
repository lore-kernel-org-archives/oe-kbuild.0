Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C647F
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Aug 2023 03:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692674755; x=1724210755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iik1z5x4LKnl/kzYfZyhfJ5BpVOhnBZvtT6OAqHzVKU=;
  b=dOUG0LvnpUYOW4bhFTCrZg7FK0c4SxG4ehNK5D40DPKQ5wUtBbMOzabY
   0ngJnArwIamQ0YODrQd7uT4rPWf9sF+jFhE77MOgU5XNQvOYaB+9W3amA
   rhddipqd341rF5ZYQqg8K1wdEQAhO4pnbTi8DVsrjlDAkQ/6BmKrrTxp1
   cDv+JOvNQEYRJMmmkvulhMlXKGtRzlufkpXcQEkXaoXa6oSxeowG9G0DS
   Y1QfKrdY2nHafcPlDitOqiTBs4OawvfXk+c1Z3ylKBdOXMl27oh6HbM9d
   KgMoPjeYoMVzZYGxaMV4xdbngoeaVrbLS2db7alD5yTf/XQCTg1E4orKO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354094248"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="354094248"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 20:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826174184"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="826174184"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 20:25:50 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYI1P-0001IG-1W;
	Tue, 22 Aug 2023 03:25:39 +0000
Date: Tue, 22 Aug 2023 11:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/soc/fsl/qe/qmc.c:1342:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202308221100.AWNAqJ7i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Herve Codina <herve.codina@bootlin.com>
CC: Mark Brown <broonie@kernel.org>

Hi Herve,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 6ffa0da5c63f8408101d01075709981005eb66ec soc: fsl: cpm1: qmc: Fix test dependency
date:   5 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-r111-20230821 (https://download.01.org/0day-ci/archive/20230822/202308221100.AWNAqJ7i-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221100.AWNAqJ7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308221100.AWNAqJ7i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/soc/fsl/qe/qmc.c:334:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbd_free @@
   drivers/soc/fsl/qe/qmc.c:334:12: sparse:     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd
   drivers/soc/fsl/qe/qmc.c:334:12: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbd_free
   drivers/soc/fsl/qe/qmc.c:346:39: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/fsl/qe/qmc.c:389:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbd_done @@
   drivers/soc/fsl/qe/qmc.c:389:12: sparse:     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd
   drivers/soc/fsl/qe/qmc.c:389:12: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbd_done
   drivers/soc/fsl/qe/qmc.c:396:47: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/fsl/qe/qmc.c:441:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *rxbd_free @@
   drivers/soc/fsl/qe/qmc.c:453:39: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/fsl/qe/qmc.c:505:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *rxbd_done @@
   drivers/soc/fsl/qe/qmc.c:505:12: sparse:     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd
   drivers/soc/fsl/qe/qmc.c:505:12: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *rxbd_done
   drivers/soc/fsl/qe/qmc.c:512:47: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/fsl/qe/qmc.c:670:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *rxbds @@
   drivers/soc/fsl/qe/qmc.c:675:47: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/fsl/qe/qmc.c:705:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbds @@
   drivers/soc/fsl/qe/qmc.c:705:12: sparse:     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd
   drivers/soc/fsl/qe/qmc.c:705:12: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbds
   drivers/soc/fsl/qe/qmc.c:710:47: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/fsl/qe/qmc.c:1108:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1108:30: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1108:30: sparse:     got unsigned short [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1111:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1111:22: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1111:22: sparse:     got unsigned short [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1120:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1120:30: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1120:30: sparse:     got unsigned short [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1123:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1123:22: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1123:22: sparse:     got unsigned short [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1176:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1176:44: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1176:44: sparse:     got unsigned short [noderef] [usertype] __iomem *
   drivers/soc/fsl/qe/qmc.c:1181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem *[assigned] last @@
   drivers/soc/fsl/qe/qmc.c:1181:29: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1181:29: sparse:     got unsigned short [noderef] [usertype] __iomem *[assigned] last
   drivers/soc/fsl/qe/qmc.c:1194:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem *int_curr @@
   drivers/soc/fsl/qe/qmc.c:1194:35: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1194:35: sparse:     got unsigned short [noderef] [usertype] __iomem *int_curr
   drivers/soc/fsl/qe/qmc.c:1197:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem *int_curr @@
   drivers/soc/fsl/qe/qmc.c:1197:32: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1197:32: sparse:     got unsigned short [noderef] [usertype] __iomem *int_curr
   drivers/soc/fsl/qe/qmc.c:1242:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem *int_curr @@
   drivers/soc/fsl/qe/qmc.c:1242:43: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1242:43: sparse:     got unsigned short [noderef] [usertype] __iomem *int_curr
   drivers/soc/fsl/qe/qmc.c:1286:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] scc_regs @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1286:23: sparse:     expected void *[noderef] scc_regs
   drivers/soc/fsl/qe/qmc.c:1286:23: sparse:     got void [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1295:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] scc_pram @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1295:23: sparse:     expected void *[noderef] scc_pram
   drivers/soc/fsl/qe/qmc.c:1295:23: sparse:     got void [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1299:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] dpram @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1299:21: sparse:     expected void *[noderef] dpram
   drivers/soc/fsl/qe/qmc.c:1299:21: sparse:     got void [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1335:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@     got void * @@
   drivers/soc/fsl/qe/qmc.c:1335:23: sparse:     expected struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
   drivers/soc/fsl/qe/qmc.c:1335:23: sparse:     got void *
>> drivers/soc/fsl/qe/qmc.c:1342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *s @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@
   drivers/soc/fsl/qe/qmc.c:1342:9: sparse:     expected void *s
   drivers/soc/fsl/qe/qmc.c:1342:9: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
   drivers/soc/fsl/qe/qmc.c:1348:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] [usertype] __iomem *int_table @@     got void * @@
   drivers/soc/fsl/qe/qmc.c:1348:24: sparse:     expected unsigned short [noderef] [usertype] __iomem *int_table
   drivers/soc/fsl/qe/qmc.c:1348:24: sparse:     got void *
>> drivers/soc/fsl/qe/qmc.c:1355:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *s @@     got unsigned short [noderef] [usertype] __iomem *int_table @@
   drivers/soc/fsl/qe/qmc.c:1355:9: sparse:     expected void *s
   drivers/soc/fsl/qe/qmc.c:1355:9: sparse:     got unsigned short [noderef] [usertype] __iomem *int_table
   drivers/soc/fsl/qe/qmc.c:290:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:290:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:292:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:292:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:295:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:295:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:233:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:298:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:298:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:238:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:238:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:238:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:238:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:238:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:304:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:304:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:336:28: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:336:28: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:343:22: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:343:22: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:344:22: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:243:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:243:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:243:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:344:22: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:243:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:243:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:346:36: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:353:22: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:353:22: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:356:31: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:356:31: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
--
>> sound/soc/fsl/fsl_qmc_audio.c:387:26: sparse: sparse: restricted snd_pcm_format_t degrades to integer
>> sound/soc/fsl/fsl_qmc_audio.c:389:59: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [assigned] i @@
   sound/soc/fsl/fsl_qmc_audio.c:389:59: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/soc/fsl/fsl_qmc_audio.c:389:59: sparse:     got unsigned int [assigned] i
   sound/soc/fsl/fsl_qmc_audio.c:564:26: sparse: sparse: restricted snd_pcm_format_t degrades to integer
>> sound/soc/fsl/fsl_qmc_audio.c:569:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int [assigned] i @@
   sound/soc/fsl/fsl_qmc_audio.c:569:50: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/soc/fsl/fsl_qmc_audio.c:569:50: sparse:     got int [assigned] i
   sound/soc/fsl/fsl_qmc_audio.c:573:62: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int [assigned] i @@
   sound/soc/fsl/fsl_qmc_audio.c:573:62: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/soc/fsl/fsl_qmc_audio.c:573:62: sparse:     got int [assigned] i

vim +1342 drivers/soc/fsl/qe/qmc.c

3178d58e0b9772 Herve Codina 2023-02-17  1269  
3178d58e0b9772 Herve Codina 2023-02-17  1270  static int qmc_probe(struct platform_device *pdev)
3178d58e0b9772 Herve Codina 2023-02-17  1271  {
3178d58e0b9772 Herve Codina 2023-02-17  1272  	struct device_node *np = pdev->dev.of_node;
3178d58e0b9772 Herve Codina 2023-02-17  1273  	unsigned int nb_chans;
3178d58e0b9772 Herve Codina 2023-02-17  1274  	struct resource *res;
3178d58e0b9772 Herve Codina 2023-02-17  1275  	struct qmc *qmc;
3178d58e0b9772 Herve Codina 2023-02-17  1276  	int irq;
3178d58e0b9772 Herve Codina 2023-02-17  1277  	int ret;
3178d58e0b9772 Herve Codina 2023-02-17  1278  
3178d58e0b9772 Herve Codina 2023-02-17  1279  	qmc = devm_kzalloc(&pdev->dev, sizeof(*qmc), GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1280  	if (!qmc)
3178d58e0b9772 Herve Codina 2023-02-17  1281  		return -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1282  
3178d58e0b9772 Herve Codina 2023-02-17  1283  	qmc->dev = &pdev->dev;
3178d58e0b9772 Herve Codina 2023-02-17  1284  	INIT_LIST_HEAD(&qmc->chan_head);
3178d58e0b9772 Herve Codina 2023-02-17  1285  
3178d58e0b9772 Herve Codina 2023-02-17  1286  	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
3178d58e0b9772 Herve Codina 2023-02-17  1287  	if (IS_ERR(qmc->scc_regs))
3178d58e0b9772 Herve Codina 2023-02-17  1288  		return PTR_ERR(qmc->scc_regs);
3178d58e0b9772 Herve Codina 2023-02-17  1289  
3178d58e0b9772 Herve Codina 2023-02-17  1290  
3178d58e0b9772 Herve Codina 2023-02-17  1291  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scc_pram");
3178d58e0b9772 Herve Codina 2023-02-17  1292  	if (!res)
3178d58e0b9772 Herve Codina 2023-02-17  1293  		return -EINVAL;
3178d58e0b9772 Herve Codina 2023-02-17  1294  	qmc->scc_pram_offset = res->start - get_immrbase();
3178d58e0b9772 Herve Codina 2023-02-17  1295  	qmc->scc_pram = devm_ioremap_resource(qmc->dev, res);
3178d58e0b9772 Herve Codina 2023-02-17  1296  	if (IS_ERR(qmc->scc_pram))
3178d58e0b9772 Herve Codina 2023-02-17  1297  		return PTR_ERR(qmc->scc_pram);
3178d58e0b9772 Herve Codina 2023-02-17  1298  
3178d58e0b9772 Herve Codina 2023-02-17  1299  	qmc->dpram  = devm_platform_ioremap_resource_byname(pdev, "dpram");
3178d58e0b9772 Herve Codina 2023-02-17  1300  	if (IS_ERR(qmc->dpram))
3178d58e0b9772 Herve Codina 2023-02-17  1301  		return PTR_ERR(qmc->dpram);
3178d58e0b9772 Herve Codina 2023-02-17  1302  
3178d58e0b9772 Herve Codina 2023-02-17  1303  	qmc->tsa_serial = devm_tsa_serial_get_byphandle(qmc->dev, np, "fsl,tsa-serial");
3178d58e0b9772 Herve Codina 2023-02-17  1304  	if (IS_ERR(qmc->tsa_serial)) {
3178d58e0b9772 Herve Codina 2023-02-17  1305  		return dev_err_probe(qmc->dev, PTR_ERR(qmc->tsa_serial),
3178d58e0b9772 Herve Codina 2023-02-17  1306  				     "Failed to get TSA serial\n");
3178d58e0b9772 Herve Codina 2023-02-17  1307  	}
3178d58e0b9772 Herve Codina 2023-02-17  1308  
3178d58e0b9772 Herve Codina 2023-02-17  1309  	/* Connect the serial (SCC) to TSA */
3178d58e0b9772 Herve Codina 2023-02-17  1310  	ret = tsa_serial_connect(qmc->tsa_serial);
3178d58e0b9772 Herve Codina 2023-02-17  1311  	if (ret) {
3178d58e0b9772 Herve Codina 2023-02-17  1312  		dev_err(qmc->dev, "Failed to connect TSA serial\n");
3178d58e0b9772 Herve Codina 2023-02-17  1313  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1314  	}
3178d58e0b9772 Herve Codina 2023-02-17  1315  
3178d58e0b9772 Herve Codina 2023-02-17  1316  	/* Parse channels informationss */
3178d58e0b9772 Herve Codina 2023-02-17  1317  	ret = qmc_of_parse_chans(qmc, np);
3178d58e0b9772 Herve Codina 2023-02-17  1318  	if (ret)
3178d58e0b9772 Herve Codina 2023-02-17  1319  		goto err_tsa_serial_disconnect;
3178d58e0b9772 Herve Codina 2023-02-17  1320  
3178d58e0b9772 Herve Codina 2023-02-17  1321  	nb_chans = qmc_nb_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1322  
3178d58e0b9772 Herve Codina 2023-02-17  1323  	/* Init GMSR_H and GMSR_L registers */
3178d58e0b9772 Herve Codina 2023-02-17  1324  	qmc_write32(qmc->scc_regs + SCC_GSMRH,
3178d58e0b9772 Herve Codina 2023-02-17  1325  		    SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP);
3178d58e0b9772 Herve Codina 2023-02-17  1326  
3178d58e0b9772 Herve Codina 2023-02-17  1327  	/* enable QMC mode */
3178d58e0b9772 Herve Codina 2023-02-17  1328  	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
3178d58e0b9772 Herve Codina 2023-02-17  1329  
3178d58e0b9772 Herve Codina 2023-02-17  1330  	/*
3178d58e0b9772 Herve Codina 2023-02-17  1331  	 * Allocate the buffer descriptor table
3178d58e0b9772 Herve Codina 2023-02-17  1332  	 * 8 rx and 8 tx descriptors per channel
3178d58e0b9772 Herve Codina 2023-02-17  1333  	 */
3178d58e0b9772 Herve Codina 2023-02-17  1334  	qmc->bd_size = (nb_chans * (QMC_NB_TXBDS + QMC_NB_RXBDS)) * sizeof(cbd_t);
3178d58e0b9772 Herve Codina 2023-02-17  1335  	qmc->bd_table = dmam_alloc_coherent(qmc->dev, qmc->bd_size,
3178d58e0b9772 Herve Codina 2023-02-17  1336  		&qmc->bd_dma_addr, GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1337  	if (!qmc->bd_table) {
3178d58e0b9772 Herve Codina 2023-02-17  1338  		dev_err(qmc->dev, "Failed to allocate bd table\n");
3178d58e0b9772 Herve Codina 2023-02-17  1339  		ret = -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1340  		goto err_tsa_serial_disconnect;
3178d58e0b9772 Herve Codina 2023-02-17  1341  	}
3178d58e0b9772 Herve Codina 2023-02-17 @1342  	memset(qmc->bd_table, 0, qmc->bd_size);
3178d58e0b9772 Herve Codina 2023-02-17  1343  
3178d58e0b9772 Herve Codina 2023-02-17  1344  	qmc_write32(qmc->scc_pram + QMC_GBL_MCBASE, qmc->bd_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1345  
3178d58e0b9772 Herve Codina 2023-02-17  1346  	/* Allocate the interrupt table */
3178d58e0b9772 Herve Codina 2023-02-17  1347  	qmc->int_size = QMC_NB_INTS * sizeof(u16);
3178d58e0b9772 Herve Codina 2023-02-17  1348  	qmc->int_table = dmam_alloc_coherent(qmc->dev, qmc->int_size,
3178d58e0b9772 Herve Codina 2023-02-17  1349  		&qmc->int_dma_addr, GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1350  	if (!qmc->int_table) {
3178d58e0b9772 Herve Codina 2023-02-17  1351  		dev_err(qmc->dev, "Failed to allocate interrupt table\n");
3178d58e0b9772 Herve Codina 2023-02-17  1352  		ret = -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1353  		goto err_tsa_serial_disconnect;
3178d58e0b9772 Herve Codina 2023-02-17  1354  	}
3178d58e0b9772 Herve Codina 2023-02-17 @1355  	memset(qmc->int_table, 0, qmc->int_size);
3178d58e0b9772 Herve Codina 2023-02-17  1356  
3178d58e0b9772 Herve Codina 2023-02-17  1357  	qmc->int_curr = qmc->int_table;
3178d58e0b9772 Herve Codina 2023-02-17  1358  	qmc_write32(qmc->scc_pram + QMC_GBL_INTBASE, qmc->int_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1359  	qmc_write32(qmc->scc_pram + QMC_GBL_INTPTR, qmc->int_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1360  
3178d58e0b9772 Herve Codina 2023-02-17  1361  	/* Set MRBLR (valid for HDLC only) max MRU + max CRC */
3178d58e0b9772 Herve Codina 2023-02-17  1362  	qmc_write16(qmc->scc_pram + QMC_GBL_MRBLR, HDLC_MAX_MRU + 4);
3178d58e0b9772 Herve Codina 2023-02-17  1363  
3178d58e0b9772 Herve Codina 2023-02-17  1364  	qmc_write16(qmc->scc_pram + QMC_GBL_GRFTHR, 1);
3178d58e0b9772 Herve Codina 2023-02-17  1365  	qmc_write16(qmc->scc_pram + QMC_GBL_GRFCNT, 1);
3178d58e0b9772 Herve Codina 2023-02-17  1366  
3178d58e0b9772 Herve Codina 2023-02-17  1367  	qmc_write32(qmc->scc_pram + QMC_GBL_C_MASK32, 0xDEBB20E3);
3178d58e0b9772 Herve Codina 2023-02-17  1368  	qmc_write16(qmc->scc_pram + QMC_GBL_C_MASK16, 0xF0B8);
3178d58e0b9772 Herve Codina 2023-02-17  1369  
3178d58e0b9772 Herve Codina 2023-02-17  1370  	ret = qmc_setup_tsa(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1371  	if (ret)
3178d58e0b9772 Herve Codina 2023-02-17  1372  		goto err_tsa_serial_disconnect;
3178d58e0b9772 Herve Codina 2023-02-17  1373  
3178d58e0b9772 Herve Codina 2023-02-17  1374  	qmc_write16(qmc->scc_pram + QMC_GBL_QMCSTATE, 0x8000);
3178d58e0b9772 Herve Codina 2023-02-17  1375  
3178d58e0b9772 Herve Codina 2023-02-17  1376  	ret = qmc_setup_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1377  	if (ret)
3178d58e0b9772 Herve Codina 2023-02-17  1378  		goto err_tsa_serial_disconnect;
3178d58e0b9772 Herve Codina 2023-02-17  1379  
3178d58e0b9772 Herve Codina 2023-02-17  1380  	/* Init interrupts table */
3178d58e0b9772 Herve Codina 2023-02-17  1381  	ret = qmc_setup_ints(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1382  	if (ret)
3178d58e0b9772 Herve Codina 2023-02-17  1383  		goto err_tsa_serial_disconnect;
3178d58e0b9772 Herve Codina 2023-02-17  1384  
3178d58e0b9772 Herve Codina 2023-02-17  1385  	/* Disable and clear interrupts,  set the irq handler */
3178d58e0b9772 Herve Codina 2023-02-17  1386  	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
3178d58e0b9772 Herve Codina 2023-02-17  1387  	qmc_write16(qmc->scc_regs + SCC_SCCE, 0x000F);
3178d58e0b9772 Herve Codina 2023-02-17  1388  	irq = platform_get_irq(pdev, 0);
3178d58e0b9772 Herve Codina 2023-02-17  1389  	if (irq < 0)
3178d58e0b9772 Herve Codina 2023-02-17  1390  		goto err_tsa_serial_disconnect;
3178d58e0b9772 Herve Codina 2023-02-17  1391  	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1392  	if (ret < 0)
3178d58e0b9772 Herve Codina 2023-02-17  1393  		goto err_tsa_serial_disconnect;
3178d58e0b9772 Herve Codina 2023-02-17  1394  
3178d58e0b9772 Herve Codina 2023-02-17  1395  	/* Enable interrupts */
3178d58e0b9772 Herve Codina 2023-02-17  1396  	qmc_write16(qmc->scc_regs + SCC_SCCM,
3178d58e0b9772 Herve Codina 2023-02-17  1397  		SCC_SCCE_IQOV | SCC_SCCE_GINT | SCC_SCCE_GUN | SCC_SCCE_GOV);
3178d58e0b9772 Herve Codina 2023-02-17  1398  
3178d58e0b9772 Herve Codina 2023-02-17  1399  	ret = qmc_finalize_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1400  	if (ret < 0)
3178d58e0b9772 Herve Codina 2023-02-17  1401  		goto err_disable_intr;
3178d58e0b9772 Herve Codina 2023-02-17  1402  
3178d58e0b9772 Herve Codina 2023-02-17  1403  	/* Enable transmiter and receiver */
3178d58e0b9772 Herve Codina 2023-02-17  1404  	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
3178d58e0b9772 Herve Codina 2023-02-17  1405  
3178d58e0b9772 Herve Codina 2023-02-17  1406  	platform_set_drvdata(pdev, qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1407  
3178d58e0b9772 Herve Codina 2023-02-17  1408  	return 0;
3178d58e0b9772 Herve Codina 2023-02-17  1409  
3178d58e0b9772 Herve Codina 2023-02-17  1410  err_disable_intr:
3178d58e0b9772 Herve Codina 2023-02-17  1411  	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
3178d58e0b9772 Herve Codina 2023-02-17  1412  
3178d58e0b9772 Herve Codina 2023-02-17  1413  err_tsa_serial_disconnect:
3178d58e0b9772 Herve Codina 2023-02-17  1414  	tsa_serial_disconnect(qmc->tsa_serial);
3178d58e0b9772 Herve Codina 2023-02-17  1415  	return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1416  }
3178d58e0b9772 Herve Codina 2023-02-17  1417  

:::::: The code at line 1342 was first introduced by commit
:::::: 3178d58e0b9772d690456c0bdf8c9f5e191d45f1 soc: fsl: cpm1: Add support for QMC

:::::: TO: Herve Codina <herve.codina@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
