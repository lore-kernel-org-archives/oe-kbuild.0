Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8D154B2
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYXvHWfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702221156; x=1733757156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESRkRsGcDU4+iIMNaQRtTkfnRf6lw8G4TbUUd97gVbI=;
  b=LYXvHWfYrVRCQXUXp6adjD60BqBbNLY8yKnr4Aj1io1Ehe6IQJ2hXsdF
   o7cSvB6zaKnDU6fRRBsHxJn3DOxK+v0siTgqxzOf1d4Cy45oSyGNK7O3o
   hpdEiw8bU4Mm4sSb+vNluL/mQIPqfYmIJSzj6FXTeDH+cESuALWIGH1cC
   PaoAkFOystckNxfRVNfDx5ZbYCLcjsliJ2L3VyyXtEDAnuDy87qQ7Er8X
   t5DNfTaraQmdDpCP40FIXFK5SH3IVwp4kvJDygSz/MqasauIJnMox2H7v
   TBNCaTEqSUK2WSdn8uGaLNWnFNCs8FQdb9jjCoIEoviXbPUurkOi3EB8Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="393423990"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="393423990"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 07:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="772712596"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="772712596"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Dec 2023 07:12:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCLTr-000Gxi-2n;
	Sun, 10 Dec 2023 15:12:31 +0000
Date: Sun, 10 Dec 2023 23:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/renesas/core.c:77 sh_pfc_map_resources() error: we
 previously assumed 'res' could be null (see line 43)
Message-ID: <202312102325.44Tk7VDw-lkp@intel.com>
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
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 5376e3d904532e657fd7ca1a9b1ff3d351527b90 pinctrl: renesas: core: Fix possible null-ptr-deref in sh_pfc_map_resources()
date:   1 year, 7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 7 months ago
config: riscv-randconfig-r071-20231112 (https://download.01.org/0day-ci/archive/20231210/202312102325.44Tk7VDw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312102325.44Tk7VDw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312102325.44Tk7VDw-lkp@intel.com/

smatch warnings:
drivers/pinctrl/renesas/core.c:77 sh_pfc_map_resources() error: we previously assumed 'res' could be null (see line 43)

vim +/res +77 drivers/pinctrl/renesas/core.c

f9165132c5ee68 drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15  29  
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  30  static int sh_pfc_map_resources(struct sh_pfc *pfc,
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  31  				struct platform_device *pdev)
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  32  {
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  33  	struct sh_pfc_window *windows;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  34  	unsigned int *irqs = NULL;
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16  35  	unsigned int num_windows;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  36  	struct resource *res;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  37  	unsigned int i;
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16  38  	int num_irqs;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  39  
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  40  	/* Count the MEM and IRQ resources. */
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25  41  	for (num_windows = 0;; num_windows++) {
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25  42  		res = platform_get_resource(pdev, IORESOURCE_MEM, num_windows);
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25 @43  		if (!res)
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  44  			break;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  45  	}
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  46  	if (num_windows == 0)
bee9f22ba196b0 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-02-16  47  		return -EINVAL;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  48  
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16  49  	num_irqs = platform_irq_count(pdev);
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16  50  	if (num_irqs < 0)
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16  51  		return num_irqs;
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16  52  
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  53  	/* Allocate memory windows and IRQs arrays. */
a86854d0c599b3 drivers/pinctrl/sh-pfc/core.c  Kees Cook          2018-06-12  54  	windows = devm_kcalloc(pfc->dev, num_windows, sizeof(*windows),
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  55  			       GFP_KERNEL);
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  56  	if (windows == NULL)
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  57  		return -ENOMEM;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  58  
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  59  	pfc->num_windows = num_windows;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  60  	pfc->windows = windows;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  61  
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  62  	if (num_irqs) {
a86854d0c599b3 drivers/pinctrl/sh-pfc/core.c  Kees Cook          2018-06-12  63  		irqs = devm_kcalloc(pfc->dev, num_irqs, sizeof(*irqs),
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  64  				    GFP_KERNEL);
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  65  		if (irqs == NULL)
1724acfd598bdf drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15  66  			return -ENOMEM;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  67  
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  68  		pfc->num_irqs = num_irqs;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  69  		pfc->irqs = irqs;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  70  	}
973931ae0a2dad drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15  71  
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  72  	/* Fill them. */
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25  73  	for (i = 0; i < num_windows; i++) {
5376e3d904532e drivers/pinctrl/renesas/core.c Yang Yingliang     2022-04-29  74  		windows->virt = devm_platform_get_and_ioremap_resource(pdev, i, &res);
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  75  		if (IS_ERR(windows->virt))
1724acfd598bdf drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15  76  			return -ENOMEM;
5376e3d904532e drivers/pinctrl/renesas/core.c Yang Yingliang     2022-04-29 @77  		windows->phys = res->start;
5376e3d904532e drivers/pinctrl/renesas/core.c Yang Yingliang     2022-04-29  78  		windows->size = resource_size(res);
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11  79  		windows++;
1724acfd598bdf drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15  80  	}
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25  81  	for (i = 0; i < num_irqs; i++)
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25  82  		*irqs++ = platform_get_irq(pdev, i);
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  83  
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  84  	return 0;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  85  }
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09  86  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
