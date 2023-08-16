Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBECD50F
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Aug 2023 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692218034; x=1723754034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7m+Naa9voFuqk6411H5zIRdYtcJbPeJ76JAlnbXx00=;
  b=CgsTXqP2MVPE52P6slvsJLqST54YU8igXSnoaIaptU2YJB8NnVzC45+O
   YnU04gZXHerItgQIcD6o3NemYbTfFhKJvPlqR9dlAkuCPrikrtqI6tIYa
   KVkCXW22wU8cbSdTuZNPFbPLYJW4u3eIxG/ufZP3wUjXOrAavj17pw3N7
   e4RfkjAYL9iDLcyy3wQ7aSDLGw+l16YG3RjlmJjgDaCKle5q81hSSe9Dh
   Wpkg1RRqDGRGpNHq7cQghdsKWw8Q2G2665Py8D8a7tvuhRT03x4jPTewB
   uWSUtW2HVEhEa/dVGVgYbpaZa+9AhsMr/cJJho9KM3r0+zPvtx6QMC57H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403610216"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="403610216"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 13:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804363512"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="804363512"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2023 13:33:51 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWNDC-0000Y9-3A;
	Wed, 16 Aug 2023 20:33:50 +0000
Date: Thu, 17 Aug 2023 04:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/soc/fsl/qe/qmc.c:334:12: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202308170402.zaDuhNz7-lkp@intel.com>
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
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 3178d58e0b9772d690456c0bdf8c9f5e191d45f1 soc: fsl: cpm1: Add support for QMC
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-r093-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170402.zaDuhNz7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170402.zaDuhNz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308170402.zaDuhNz7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/fsl/qe/qmc.c:334:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbd_free @@
   drivers/soc/fsl/qe/qmc.c:334:12: sparse:     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd
   drivers/soc/fsl/qe/qmc.c:334:12: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbd_free
>> drivers/soc/fsl/qe/qmc.c:346:39: sparse: sparse: subtraction of different types can't work (different address spaces)
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
>> drivers/soc/fsl/qe/qmc.c:1104:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1104:30: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1104:30: sparse:     got unsigned short [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1107:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1107:22: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1107:22: sparse:     got unsigned short [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1116:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1116:30: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1116:30: sparse:     got unsigned short [noderef] __iomem *
   drivers/soc/fsl/qe/qmc.c:1119:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1119:22: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1119:22: sparse:     got unsigned short [noderef] __iomem *
>> drivers/soc/fsl/qe/qmc.c:1172:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1172:44: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1172:44: sparse:     got unsigned short [noderef] [usertype] __iomem *
>> drivers/soc/fsl/qe/qmc.c:1177:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem *[assigned] last @@
   drivers/soc/fsl/qe/qmc.c:1177:29: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1177:29: sparse:     got unsigned short [noderef] [usertype] __iomem *[assigned] last
>> drivers/soc/fsl/qe/qmc.c:1190:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem *int_curr @@
   drivers/soc/fsl/qe/qmc.c:1190:35: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1190:35: sparse:     got unsigned short [noderef] [usertype] __iomem *int_curr
   drivers/soc/fsl/qe/qmc.c:1193:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem *int_curr @@
   drivers/soc/fsl/qe/qmc.c:1193:32: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1193:32: sparse:     got unsigned short [noderef] [usertype] __iomem *int_curr
   drivers/soc/fsl/qe/qmc.c:1238:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *[noderef] __iomem addr @@     got unsigned short [noderef] [usertype] __iomem *int_curr @@
   drivers/soc/fsl/qe/qmc.c:1238:43: sparse:     expected void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:1238:43: sparse:     got unsigned short [noderef] [usertype] __iomem *int_curr
>> drivers/soc/fsl/qe/qmc.c:1282:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] scc_regs @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1282:23: sparse:     expected void *[noderef] scc_regs
   drivers/soc/fsl/qe/qmc.c:1282:23: sparse:     got void [noderef] __iomem *
>> drivers/soc/fsl/qe/qmc.c:1291:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] scc_pram @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1291:23: sparse:     expected void *[noderef] scc_pram
   drivers/soc/fsl/qe/qmc.c:1291:23: sparse:     got void [noderef] __iomem *
>> drivers/soc/fsl/qe/qmc.c:1295:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] dpram @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/qmc.c:1295:21: sparse:     expected void *[noderef] dpram
   drivers/soc/fsl/qe/qmc.c:1295:21: sparse:     got void [noderef] __iomem *
>> drivers/soc/fsl/qe/qmc.c:1331:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@     got void * @@
   drivers/soc/fsl/qe/qmc.c:1331:23: sparse:     expected struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
   drivers/soc/fsl/qe/qmc.c:1331:23: sparse:     got void *
>> drivers/soc/fsl/qe/qmc.c:1338:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@
   drivers/soc/fsl/qe/qmc.c:1338:9: sparse:     expected void const *
   drivers/soc/fsl/qe/qmc.c:1338:9: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
>> drivers/soc/fsl/qe/qmc.c:1338:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@
   drivers/soc/fsl/qe/qmc.c:1338:9: sparse:     expected void const *
   drivers/soc/fsl/qe/qmc.c:1338:9: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
>> drivers/soc/fsl/qe/qmc.c:1338:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@
   drivers/soc/fsl/qe/qmc.c:1338:9: sparse:     expected void *
   drivers/soc/fsl/qe/qmc.c:1338:9: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
>> drivers/soc/fsl/qe/qmc.c:1344:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] [usertype] __iomem *int_table @@     got void * @@
   drivers/soc/fsl/qe/qmc.c:1344:24: sparse:     expected unsigned short [noderef] [usertype] __iomem *int_table
   drivers/soc/fsl/qe/qmc.c:1344:24: sparse:     got void *
>> drivers/soc/fsl/qe/qmc.c:1351:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned short [noderef] [usertype] __iomem *int_table @@
   drivers/soc/fsl/qe/qmc.c:1351:9: sparse:     expected void const *
   drivers/soc/fsl/qe/qmc.c:1351:9: sparse:     got unsigned short [noderef] [usertype] __iomem *int_table
>> drivers/soc/fsl/qe/qmc.c:1351:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned short [noderef] [usertype] __iomem *int_table @@
   drivers/soc/fsl/qe/qmc.c:1351:9: sparse:     expected void const *
   drivers/soc/fsl/qe/qmc.c:1351:9: sparse:     got unsigned short [noderef] [usertype] __iomem *int_table
>> drivers/soc/fsl/qe/qmc.c:1351:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned short [noderef] [usertype] __iomem *int_table @@
   drivers/soc/fsl/qe/qmc.c:1351:9: sparse:     expected void *
   drivers/soc/fsl/qe/qmc.c:1351:9: sparse:     got unsigned short [noderef] [usertype] __iomem *int_table
>> drivers/soc/fsl/qe/qmc.c:290:33: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
>> drivers/soc/fsl/qe/qmc.c:290:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:292:29: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:292:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:295:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:295:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
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
>> drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:238:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:238:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:238:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:304:29: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:304:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:336:28: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:336:28: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:343:22: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
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
>> drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:353:22: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:356:31: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:356:31: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:228:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:233:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/qmc.c:228:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/qmc.c:223:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/qmc.c:223:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/qmc.c:233:21: sparse: sparse: too many warnings

vim +334 drivers/soc/fsl/qe/qmc.c

3178d58e0b9772 Herve Codina 2023-02-17  220  
3178d58e0b9772 Herve Codina 2023-02-17  221  static inline void qmc_write16(void *__iomem addr, u16 val)
3178d58e0b9772 Herve Codina 2023-02-17  222  {
3178d58e0b9772 Herve Codina 2023-02-17 @223  	iowrite16be(val, addr);
3178d58e0b9772 Herve Codina 2023-02-17  224  }
3178d58e0b9772 Herve Codina 2023-02-17  225  
3178d58e0b9772 Herve Codina 2023-02-17  226  static inline u16 qmc_read16(void *__iomem addr)
3178d58e0b9772 Herve Codina 2023-02-17  227  {
3178d58e0b9772 Herve Codina 2023-02-17 @228  	return ioread16be(addr);
3178d58e0b9772 Herve Codina 2023-02-17  229  }
3178d58e0b9772 Herve Codina 2023-02-17  230  
3178d58e0b9772 Herve Codina 2023-02-17  231  static inline void qmc_setbits16(void *__iomem addr, u16 set)
3178d58e0b9772 Herve Codina 2023-02-17  232  {
3178d58e0b9772 Herve Codina 2023-02-17  233  	qmc_write16(addr, qmc_read16(addr) | set);
3178d58e0b9772 Herve Codina 2023-02-17  234  }
3178d58e0b9772 Herve Codina 2023-02-17  235  
3178d58e0b9772 Herve Codina 2023-02-17  236  static inline void qmc_clrbits16(void *__iomem addr, u16 clr)
3178d58e0b9772 Herve Codina 2023-02-17  237  {
3178d58e0b9772 Herve Codina 2023-02-17  238  	qmc_write16(addr, qmc_read16(addr) & ~clr);
3178d58e0b9772 Herve Codina 2023-02-17  239  }
3178d58e0b9772 Herve Codina 2023-02-17  240  
3178d58e0b9772 Herve Codina 2023-02-17  241  static inline void qmc_write32(void *__iomem addr, u32 val)
3178d58e0b9772 Herve Codina 2023-02-17  242  {
3178d58e0b9772 Herve Codina 2023-02-17  243  	iowrite32be(val, addr);
3178d58e0b9772 Herve Codina 2023-02-17  244  }
3178d58e0b9772 Herve Codina 2023-02-17  245  
3178d58e0b9772 Herve Codina 2023-02-17  246  static inline u32 qmc_read32(void *__iomem addr)
3178d58e0b9772 Herve Codina 2023-02-17  247  {
3178d58e0b9772 Herve Codina 2023-02-17  248  	return ioread32be(addr);
3178d58e0b9772 Herve Codina 2023-02-17  249  }
3178d58e0b9772 Herve Codina 2023-02-17  250  
3178d58e0b9772 Herve Codina 2023-02-17  251  static inline void qmc_setbits32(void *__iomem addr, u32 set)
3178d58e0b9772 Herve Codina 2023-02-17  252  {
3178d58e0b9772 Herve Codina 2023-02-17  253  	qmc_write32(addr, qmc_read32(addr) | set);
3178d58e0b9772 Herve Codina 2023-02-17  254  }
3178d58e0b9772 Herve Codina 2023-02-17  255  
3178d58e0b9772 Herve Codina 2023-02-17  256  
3178d58e0b9772 Herve Codina 2023-02-17  257  int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
3178d58e0b9772 Herve Codina 2023-02-17  258  {
3178d58e0b9772 Herve Codina 2023-02-17  259  	struct tsa_serial_info tsa_info;
3178d58e0b9772 Herve Codina 2023-02-17  260  	int ret;
3178d58e0b9772 Herve Codina 2023-02-17  261  
3178d58e0b9772 Herve Codina 2023-02-17  262  	/* Retrieve info from the TSA related serial */
3178d58e0b9772 Herve Codina 2023-02-17  263  	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &tsa_info);
3178d58e0b9772 Herve Codina 2023-02-17  264  	if (ret)
3178d58e0b9772 Herve Codina 2023-02-17  265  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  266  
3178d58e0b9772 Herve Codina 2023-02-17  267  	info->mode = chan->mode;
3178d58e0b9772 Herve Codina 2023-02-17  268  	info->rx_fs_rate = tsa_info.rx_fs_rate;
3178d58e0b9772 Herve Codina 2023-02-17  269  	info->rx_bit_rate = tsa_info.rx_bit_rate;
3178d58e0b9772 Herve Codina 2023-02-17  270  	info->nb_tx_ts = hweight64(chan->tx_ts_mask);
3178d58e0b9772 Herve Codina 2023-02-17  271  	info->tx_fs_rate = tsa_info.tx_fs_rate;
3178d58e0b9772 Herve Codina 2023-02-17  272  	info->tx_bit_rate = tsa_info.tx_bit_rate;
3178d58e0b9772 Herve Codina 2023-02-17  273  	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
3178d58e0b9772 Herve Codina 2023-02-17  274  
3178d58e0b9772 Herve Codina 2023-02-17  275  	return 0;
3178d58e0b9772 Herve Codina 2023-02-17  276  }
3178d58e0b9772 Herve Codina 2023-02-17  277  EXPORT_SYMBOL(qmc_chan_get_info);
3178d58e0b9772 Herve Codina 2023-02-17  278  
3178d58e0b9772 Herve Codina 2023-02-17  279  int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param)
3178d58e0b9772 Herve Codina 2023-02-17  280  {
3178d58e0b9772 Herve Codina 2023-02-17  281  	if (param->mode != chan->mode)
3178d58e0b9772 Herve Codina 2023-02-17  282  		return -EINVAL;
3178d58e0b9772 Herve Codina 2023-02-17  283  
3178d58e0b9772 Herve Codina 2023-02-17  284  	switch (param->mode) {
3178d58e0b9772 Herve Codina 2023-02-17  285  	case QMC_HDLC:
3178d58e0b9772 Herve Codina 2023-02-17  286  		if ((param->hdlc.max_rx_buf_size % 4) ||
3178d58e0b9772 Herve Codina 2023-02-17  287  		    (param->hdlc.max_rx_buf_size < 8))
3178d58e0b9772 Herve Codina 2023-02-17  288  			return -EINVAL;
3178d58e0b9772 Herve Codina 2023-02-17  289  
3178d58e0b9772 Herve Codina 2023-02-17 @290  		qmc_write16(chan->qmc->scc_pram + QMC_GBL_MRBLR,
3178d58e0b9772 Herve Codina 2023-02-17  291  			    param->hdlc.max_rx_buf_size - 8);
3178d58e0b9772 Herve Codina 2023-02-17  292  		qmc_write16(chan->s_param + QMC_SPE_MFLR,
3178d58e0b9772 Herve Codina 2023-02-17  293  			    param->hdlc.max_rx_frame_size);
3178d58e0b9772 Herve Codina 2023-02-17  294  		if (param->hdlc.is_crc32) {
3178d58e0b9772 Herve Codina 2023-02-17  295  			qmc_setbits16(chan->s_param + QMC_SPE_CHAMR,
3178d58e0b9772 Herve Codina 2023-02-17  296  				      QMC_SPE_CHAMR_HDLC_CRC);
3178d58e0b9772 Herve Codina 2023-02-17  297  		} else {
3178d58e0b9772 Herve Codina 2023-02-17  298  			qmc_clrbits16(chan->s_param + QMC_SPE_CHAMR,
3178d58e0b9772 Herve Codina 2023-02-17  299  				      QMC_SPE_CHAMR_HDLC_CRC);
3178d58e0b9772 Herve Codina 2023-02-17  300  		}
3178d58e0b9772 Herve Codina 2023-02-17  301  		break;
3178d58e0b9772 Herve Codina 2023-02-17  302  
3178d58e0b9772 Herve Codina 2023-02-17  303  	case QMC_TRANSPARENT:
3178d58e0b9772 Herve Codina 2023-02-17  304  		qmc_write16(chan->s_param + QMC_SPE_TMRBLR,
3178d58e0b9772 Herve Codina 2023-02-17  305  			    param->transp.max_rx_buf_size);
3178d58e0b9772 Herve Codina 2023-02-17  306  		break;
3178d58e0b9772 Herve Codina 2023-02-17  307  
3178d58e0b9772 Herve Codina 2023-02-17  308  	default:
3178d58e0b9772 Herve Codina 2023-02-17  309  		return -EINVAL;
3178d58e0b9772 Herve Codina 2023-02-17  310  	}
3178d58e0b9772 Herve Codina 2023-02-17  311  
3178d58e0b9772 Herve Codina 2023-02-17  312  	return 0;
3178d58e0b9772 Herve Codina 2023-02-17  313  }
3178d58e0b9772 Herve Codina 2023-02-17  314  EXPORT_SYMBOL(qmc_chan_set_param);
3178d58e0b9772 Herve Codina 2023-02-17  315  
3178d58e0b9772 Herve Codina 2023-02-17  316  int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
3178d58e0b9772 Herve Codina 2023-02-17  317  			  void (*complete)(void *context), void *context)
3178d58e0b9772 Herve Codina 2023-02-17  318  {
3178d58e0b9772 Herve Codina 2023-02-17  319  	struct qmc_xfer_desc *xfer_desc;
3178d58e0b9772 Herve Codina 2023-02-17  320  	unsigned long flags;
3178d58e0b9772 Herve Codina 2023-02-17  321  	cbd_t *__iomem bd;
3178d58e0b9772 Herve Codina 2023-02-17  322  	u16 ctrl;
3178d58e0b9772 Herve Codina 2023-02-17  323  	int ret;
3178d58e0b9772 Herve Codina 2023-02-17  324  
3178d58e0b9772 Herve Codina 2023-02-17  325  	/*
3178d58e0b9772 Herve Codina 2023-02-17  326  	 * R bit  UB bit
3178d58e0b9772 Herve Codina 2023-02-17  327  	 *   0       0  : The BD is free
3178d58e0b9772 Herve Codina 2023-02-17  328  	 *   1       1  : The BD is in used, waiting for transfer
3178d58e0b9772 Herve Codina 2023-02-17  329  	 *   0       1  : The BD is in used, waiting for completion
3178d58e0b9772 Herve Codina 2023-02-17  330  	 *   1       0  : Should not append
3178d58e0b9772 Herve Codina 2023-02-17  331  	 */
3178d58e0b9772 Herve Codina 2023-02-17  332  
3178d58e0b9772 Herve Codina 2023-02-17  333  	spin_lock_irqsave(&chan->tx_lock, flags);
3178d58e0b9772 Herve Codina 2023-02-17 @334  	bd = chan->txbd_free;
3178d58e0b9772 Herve Codina 2023-02-17  335  
3178d58e0b9772 Herve Codina 2023-02-17  336  	ctrl = qmc_read16(&bd->cbd_sc);
3178d58e0b9772 Herve Codina 2023-02-17  337  	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
3178d58e0b9772 Herve Codina 2023-02-17  338  		/* We are full ... */
3178d58e0b9772 Herve Codina 2023-02-17  339  		ret = -EBUSY;
3178d58e0b9772 Herve Codina 2023-02-17  340  		goto end;
3178d58e0b9772 Herve Codina 2023-02-17  341  	}
3178d58e0b9772 Herve Codina 2023-02-17  342  
3178d58e0b9772 Herve Codina 2023-02-17  343  	qmc_write16(&bd->cbd_datlen, length);
3178d58e0b9772 Herve Codina 2023-02-17  344  	qmc_write32(&bd->cbd_bufaddr, addr);
3178d58e0b9772 Herve Codina 2023-02-17  345  
3178d58e0b9772 Herve Codina 2023-02-17 @346  	xfer_desc = &chan->tx_desc[bd - chan->txbds];
3178d58e0b9772 Herve Codina 2023-02-17  347  	xfer_desc->tx_complete = complete;
3178d58e0b9772 Herve Codina 2023-02-17  348  	xfer_desc->context = context;
3178d58e0b9772 Herve Codina 2023-02-17  349  
3178d58e0b9772 Herve Codina 2023-02-17  350  	/* Activate the descriptor */
3178d58e0b9772 Herve Codina 2023-02-17  351  	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
3178d58e0b9772 Herve Codina 2023-02-17  352  	wmb(); /* Be sure to flush the descriptor before control update */
3178d58e0b9772 Herve Codina 2023-02-17  353  	qmc_write16(&bd->cbd_sc, ctrl);
3178d58e0b9772 Herve Codina 2023-02-17  354  
3178d58e0b9772 Herve Codina 2023-02-17  355  	if (!chan->is_tx_stopped)
3178d58e0b9772 Herve Codina 2023-02-17  356  		qmc_setbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_POL);
3178d58e0b9772 Herve Codina 2023-02-17  357  
3178d58e0b9772 Herve Codina 2023-02-17  358  	if (ctrl & QMC_BD_TX_W)
3178d58e0b9772 Herve Codina 2023-02-17  359  		chan->txbd_free = chan->txbds;
3178d58e0b9772 Herve Codina 2023-02-17  360  	else
3178d58e0b9772 Herve Codina 2023-02-17  361  		chan->txbd_free++;
3178d58e0b9772 Herve Codina 2023-02-17  362  
3178d58e0b9772 Herve Codina 2023-02-17  363  	ret = 0;
3178d58e0b9772 Herve Codina 2023-02-17  364  
3178d58e0b9772 Herve Codina 2023-02-17  365  end:
3178d58e0b9772 Herve Codina 2023-02-17  366  	spin_unlock_irqrestore(&chan->tx_lock, flags);
3178d58e0b9772 Herve Codina 2023-02-17  367  	return ret;
3178d58e0b9772 Herve Codina 2023-02-17  368  }
3178d58e0b9772 Herve Codina 2023-02-17  369  EXPORT_SYMBOL(qmc_chan_write_submit);
3178d58e0b9772 Herve Codina 2023-02-17  370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
