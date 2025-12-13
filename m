Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29AB12DDA1
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765659624; cv=none; b=J0qlV+nNc8a3mrn9NNefpZqIVzKzhNfJLb/0fUNieKvxzaWOA3mBto8yw3hL0mPLfvSRSDaG5nqUi2WmUPjMcWas1jYt+/mAoP0Lcom9MD0nNiry6PHJjOXjpo/WyZ+lrAzA07EvRoATlh1lWgzKrr07OhqMw+7fQ+08JFfo5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765659624; c=relaxed/simple;
	bh=AgSGZG7N2Bu/rQ4kRzJ1ifARQuH7TuBk+hj5G3mspnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzID3yDsxESY/e41SN3xugyD7nOsgqNSyRYt/HqhZXZvIooAKMjNQtVfSNfT10liSPwzS5cqwTvtpZOByBhz2EE8SBwh7P5W5/AVltIzXKVNFDhXz5K+S8pk9zz/i9qlWbUeWEES2nID5yHFH+HjSLkP2XYbz4kAoBttuSRKGB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4rQlCLw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4rQlCLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765659623; x=1797195623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgSGZG7N2Bu/rQ4kRzJ1ifARQuH7TuBk+hj5G3mspnI=;
  b=d4rQlCLwh8JM4q0ydYrGV1uwy+5oNxUfkUscqFIEMpUxRmSH5fp4RoB0
   BhKLto+x+/hJiUzmA6hECnFYZ0S5R/tb3oRDQgaYgkcNPTbJE4rhJHL51
   7tINbe9tgVaMgcDwAlC3L98qPGu+eVrDUnJXpiUQtXEwzGg4/MmdPcqwj
   PYkp3Cx8lUMgGcM6bJBVGVxg4Q07MdCoRlooTipsHfoKB0RnpzVbx4WLr
   tT5cbKiCViTPR7Ykpd4odKgq1eqWfGQHLYGQ+sys2ma1wzH6M390eJ8Nl
   oZAC5t2NKBElGAI64gOFy1O5drrTIjH7i2fzch9X+5WCyufklxgRWDGLQ
   w==;
X-CSE-ConnectionGUID: D1X0dqQfSdWexZJD8FwSEA==
X-CSE-MsgGUID: HFx4Xx6zRDS0nJnIY6qSKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79077859"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79077859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 13:00:23 -0800
X-CSE-ConnectionGUID: VNc41OQyQRy01Qrix/b2FA==
X-CSE-MsgGUID: LXLFsxQZS1SKDp8/LgDUtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197642651"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 13:00:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUWiw-000000008Cj-3e7B;
	Sat, 13 Dec 2025 21:00:18 +0000
Date: Sun, 14 Dec 2025 05:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/pxa_dma.c:1266 pxad_init_phys() error: uninitialized
 symbol 'ret'.
Message-ID: <202512140423.NHUDKey7-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

Hi Krzysztof,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 9fc2f03e85952ee52558ab844473a8284d924a56 dmaengine: pxa: Enable compile test
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: nios2-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140423.NHUDKey7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140423.NHUDKey7-lkp@intel.com/

smatch warnings:
drivers/dma/pxa_dma.c:1266 pxad_init_phys() error: uninitialized symbol 'ret'.

vim +/ret +1266 drivers/dma/pxa_dma.c

a57e16cf03339c Robert Jarzmik 2015-05-25  1232  
a57e16cf03339c Robert Jarzmik 2015-05-25  1233  static int pxad_init_phys(struct platform_device *op,
a57e16cf03339c Robert Jarzmik 2015-05-25  1234  			  struct pxad_device *pdev,
a57e16cf03339c Robert Jarzmik 2015-05-25  1235  			  unsigned int nb_phy_chans)
a57e16cf03339c Robert Jarzmik 2015-05-25  1236  {
a57e16cf03339c Robert Jarzmik 2015-05-25  1237  	int irq0, irq, nr_irq = 0, i, ret;
a57e16cf03339c Robert Jarzmik 2015-05-25  1238  	struct pxad_phy *phy;
a57e16cf03339c Robert Jarzmik 2015-05-25  1239  
a57e16cf03339c Robert Jarzmik 2015-05-25  1240  	irq0 = platform_get_irq(op, 0);
a57e16cf03339c Robert Jarzmik 2015-05-25  1241  	if (irq0 < 0)
a57e16cf03339c Robert Jarzmik 2015-05-25  1242  		return irq0;
a57e16cf03339c Robert Jarzmik 2015-05-25  1243  
a57e16cf03339c Robert Jarzmik 2015-05-25  1244  	pdev->phys = devm_kcalloc(&op->dev, nb_phy_chans,
a57e16cf03339c Robert Jarzmik 2015-05-25  1245  				  sizeof(pdev->phys[0]), GFP_KERNEL);
a57e16cf03339c Robert Jarzmik 2015-05-25  1246  	if (!pdev->phys)
a57e16cf03339c Robert Jarzmik 2015-05-25  1247  		return -ENOMEM;
a57e16cf03339c Robert Jarzmik 2015-05-25  1248  
a57e16cf03339c Robert Jarzmik 2015-05-25  1249  	for (i = 0; i < nb_phy_chans; i++)
b3d726cb8497c6 Doug Brown     2022-09-05  1250  		if (platform_get_irq_optional(op, i) > 0)
a57e16cf03339c Robert Jarzmik 2015-05-25  1251  			nr_irq++;
a57e16cf03339c Robert Jarzmik 2015-05-25  1252  
a57e16cf03339c Robert Jarzmik 2015-05-25  1253  	for (i = 0; i < nb_phy_chans; i++) {
a57e16cf03339c Robert Jarzmik 2015-05-25  1254  		phy = &pdev->phys[i];
a57e16cf03339c Robert Jarzmik 2015-05-25  1255  		phy->base = pdev->base;
a57e16cf03339c Robert Jarzmik 2015-05-25  1256  		phy->idx = i;
b3d726cb8497c6 Doug Brown     2022-09-05  1257  		irq = platform_get_irq_optional(op, i);
a57e16cf03339c Robert Jarzmik 2015-05-25  1258  		if ((nr_irq > 1) && (irq > 0))
a57e16cf03339c Robert Jarzmik 2015-05-25  1259  			ret = devm_request_irq(&op->dev, irq,
a57e16cf03339c Robert Jarzmik 2015-05-25  1260  					       pxad_chan_handler,
a57e16cf03339c Robert Jarzmik 2015-05-25  1261  					       IRQF_SHARED, "pxa-dma", phy);
a57e16cf03339c Robert Jarzmik 2015-05-25  1262  		if ((nr_irq == 1) && (i == 0))
a57e16cf03339c Robert Jarzmik 2015-05-25  1263  			ret = devm_request_irq(&op->dev, irq0,
a57e16cf03339c Robert Jarzmik 2015-05-25  1264  					       pxad_int_handler,
a57e16cf03339c Robert Jarzmik 2015-05-25  1265  					       IRQF_SHARED, "pxa-dma", pdev);
a57e16cf03339c Robert Jarzmik 2015-05-25 @1266  		if (ret) {
a57e16cf03339c Robert Jarzmik 2015-05-25  1267  			dev_err(pdev->slave.dev,
a57e16cf03339c Robert Jarzmik 2015-05-25  1268  				"%s(): can't request irq %d:%d\n", __func__,
a57e16cf03339c Robert Jarzmik 2015-05-25  1269  				irq, ret);
a57e16cf03339c Robert Jarzmik 2015-05-25  1270  			return ret;
a57e16cf03339c Robert Jarzmik 2015-05-25  1271  		}
a57e16cf03339c Robert Jarzmik 2015-05-25  1272  	}
a57e16cf03339c Robert Jarzmik 2015-05-25  1273  
a57e16cf03339c Robert Jarzmik 2015-05-25  1274  	return 0;
a57e16cf03339c Robert Jarzmik 2015-05-25  1275  }
a57e16cf03339c Robert Jarzmik 2015-05-25  1276  

:::::: The code at line 1266 was first introduced by commit
:::::: a57e16cf03339c20b09642f46f60190069ff70c7 dmaengine: pxa: add pxa dmaengine driver

:::::: TO: Robert Jarzmik <robert.jarzmik@free.fr>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
