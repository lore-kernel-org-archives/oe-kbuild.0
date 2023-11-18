Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9816418
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Nov 2023 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmvzCb0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700329702; x=1731865702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwC1UU46uMAtNTRFUOmohbQ/w/Zrd9JRDlg0Kwm5oD8=;
  b=DmvzCb0L4HonwQFlaWbhre1CoO3zuV5DzFxcWO3jNEFHIwV2e3XG/b+6
   p0rQQukUNC8Rfy+AUVUXuY805A8xJeOhIKbwGoOqUlCwiw8kf1bqOtPCD
   a3LQDADr1aAOZByyGg/d6QLoqLNMbr62+W7b7fJZ1MksaA3ipF4Ezl0lu
   v6efxjdRKbpz46svk/b3g65WY8/QZdS1lvzlu8qqPuBK4oHJexoOWR3i5
   e7oG+5uBp/OZ7+vHbnLIb9J9nCOOWf9ulDTRvLoctseHZaen2dr4UgdWu
   HDlZ86JO1eme1DC0OwpZla0bU6DjFljyw3MuDa5dnoFyBtkBuTb6y5/Ya
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="457945229"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="457945229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 09:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="13783161"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2023 09:48:20 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4PQX-00049X-1X;
	Sat, 18 Nov 2023 17:48:17 +0000
Date: Sun, 19 Nov 2023 01:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] phy: starfive: Add mipi dphy tx support
Message-ID: <202311190100.o7J8Bkef-lkp@intel.com>
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
In-Reply-To: <20231117130421.79261-3-shengyang.chen@starfivetech.com>
References: <20231117130421.79261-3-shengyang.chen@starfivetech.com>
TO: Shengyang Chen <shengyang.chen@starfivetech.com>
TO: devicetree@vger.kernel.org
TO: linux-phy@lists.infradead.org
CC: vkoul@kernel.org
CC: kishon@kernel.org
CC: robh+dt@kernel.org
CC: krzysztof.kozlowski+dt@linaro.org
CC: conor+dt@kernel.org
CC: p.zabel@pengutronix.de
CC: minda.chen@starfivetech.com
CC: changhuang.liang@starfivetech.com
CC: rogerq@kernel.org
CC: geert+renesas@glider.be
CC: keith.zhao@starfivetech.com
CC: shengyang.chen@starfivetech.com
CC: linux-kernel@vger.kernel.org

Hi Shengyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengyang-Chen/dt-bindings-phy-Add-starfive-jh7110-dphy-tx/20231117-210751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231117130421.79261-3-shengyang.chen%40starfivetech.com
patch subject: [PATCH v1 2/2] phy: starfive: Add mipi dphy tx support
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: csky-randconfig-r111-20231118 (https://download.01.org/0day-ci/archive/20231119/202311190100.o7J8Bkef-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311190100.o7J8Bkef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311190100.o7J8Bkef-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:189:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:189:40: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:189:40: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:197:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:197:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:197:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:222:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:222:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:222:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:224:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:224:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:224:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:226:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:226:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:226:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse:     got void [noderef] __iomem *topsys
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *io_addr @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:15: sparse:     got void *io_addr
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: too many warnings

vim +189 drivers/phy/starfive/phy-jh7110-dphy-tx.c

c1e89a3b23e556 Shengyang Chen 2023-11-17  167  
c1e89a3b23e556 Shengyang Chen 2023-11-17  168  static inline u32 stf_dphy_get_reg(void *io_addr, u32 addr, u32 shift, u32 mask)
c1e89a3b23e556 Shengyang Chen 2023-11-17  169  {
c1e89a3b23e556 Shengyang Chen 2023-11-17  170  	u32 tmp;
c1e89a3b23e556 Shengyang Chen 2023-11-17  171  
c1e89a3b23e556 Shengyang Chen 2023-11-17 @172  	tmp = readl(io_addr);
c1e89a3b23e556 Shengyang Chen 2023-11-17  173  	tmp = (tmp & mask) >> shift;
c1e89a3b23e556 Shengyang Chen 2023-11-17  174  	return tmp;
c1e89a3b23e556 Shengyang Chen 2023-11-17  175  }
c1e89a3b23e556 Shengyang Chen 2023-11-17  176  
c1e89a3b23e556 Shengyang Chen 2023-11-17  177  static inline void stf_dphy_set_reg(void *io_addr, u32 addr, u32 data, u32 shift, u32 mask)
c1e89a3b23e556 Shengyang Chen 2023-11-17  178  {
c1e89a3b23e556 Shengyang Chen 2023-11-17  179  	u32 tmp;
c1e89a3b23e556 Shengyang Chen 2023-11-17  180  
c1e89a3b23e556 Shengyang Chen 2023-11-17 @181  	tmp = readl(io_addr + addr);
c1e89a3b23e556 Shengyang Chen 2023-11-17  182  	tmp &= ~mask;
c1e89a3b23e556 Shengyang Chen 2023-11-17  183  	tmp |= (data << shift) & mask;
c1e89a3b23e556 Shengyang Chen 2023-11-17 @184  	writel(tmp, (io_addr + addr));
c1e89a3b23e556 Shengyang Chen 2023-11-17  185  }
c1e89a3b23e556 Shengyang Chen 2023-11-17  186  
c1e89a3b23e556 Shengyang Chen 2023-11-17  187  static int is_pll_locked(struct stf_dphy *dphy)
c1e89a3b23e556 Shengyang Chen 2023-11-17  188  {
c1e89a3b23e556 Shengyang Chen 2023-11-17 @189  	int tmp = stf_dphy_get_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(8),
c1e89a3b23e556 Shengyang Chen 2023-11-17  190  				  STF_DPHY_RGS_CDTX_PLL_UNLOCK_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  191  				  STF_DPHY_RGS_CDTX_PLL_UNLOCK_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  192  	return !tmp;
c1e89a3b23e556 Shengyang Chen 2023-11-17  193  }
c1e89a3b23e556 Shengyang Chen 2023-11-17  194  
c1e89a3b23e556 Shengyang Chen 2023-11-17  195  static void stf_dphy_hw_reset(struct stf_dphy *dphy, int assert)
c1e89a3b23e556 Shengyang Chen 2023-11-17  196  {
c1e89a3b23e556 Shengyang Chen 2023-11-17  197  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(100),
c1e89a3b23e556 Shengyang Chen 2023-11-17  198  			 !assert, STF_DPHY_RESETB_SHIFT, STF_DPHY_RESETB_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  199  
c1e89a3b23e556 Shengyang Chen 2023-11-17  200  	if (!assert) {
c1e89a3b23e556 Shengyang Chen 2023-11-17  201  		/*the lock-in time of pll of M31 is 20us-50ms*/
c1e89a3b23e556 Shengyang Chen 2023-11-17  202  		while ((!is_pll_locked(dphy)) && msecs_to_jiffies(50))
c1e89a3b23e556 Shengyang Chen 2023-11-17  203  			;
c1e89a3b23e556 Shengyang Chen 2023-11-17  204  		dev_err(dphy->dev, "MIPI dphy-tx # PLL Locked\n");
c1e89a3b23e556 Shengyang Chen 2023-11-17  205  	}
c1e89a3b23e556 Shengyang Chen 2023-11-17  206  }
c1e89a3b23e556 Shengyang Chen 2023-11-17  207  
c1e89a3b23e556 Shengyang Chen 2023-11-17  208  static int stf_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
c1e89a3b23e556 Shengyang Chen 2023-11-17  209  {
c1e89a3b23e556 Shengyang Chen 2023-11-17  210  	struct stf_dphy *dphy;
c1e89a3b23e556 Shengyang Chen 2023-11-17  211  	u32 bitrate;
c1e89a3b23e556 Shengyang Chen 2023-11-17  212  	unsigned long alignment;
c1e89a3b23e556 Shengyang Chen 2023-11-17  213  	int i;
c1e89a3b23e556 Shengyang Chen 2023-11-17  214  	const struct m31_dphy_config *p;
c1e89a3b23e556 Shengyang Chen 2023-11-17  215  	const u32 STF_DPHY_AON_POWER_READY_N_active = 0;
c1e89a3b23e556 Shengyang Chen 2023-11-17  216  	const struct stf_dphy_info *info;
c1e89a3b23e556 Shengyang Chen 2023-11-17  217  
c1e89a3b23e556 Shengyang Chen 2023-11-17  218  	dphy = phy_get_drvdata(phy);
c1e89a3b23e556 Shengyang Chen 2023-11-17  219  	info = dphy->info;
c1e89a3b23e556 Shengyang Chen 2023-11-17  220  	bitrate = opts->mipi_dphy.hs_clk_rate;
c1e89a3b23e556 Shengyang Chen 2023-11-17  221  
c1e89a3b23e556 Shengyang Chen 2023-11-17  222  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(8), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  223  			 STF_DPHY_RG_CDTX_L0N_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L0N_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  224  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(12), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  225  			 STF_DPHY_RG_CDTX_L0N_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L0N_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  226  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(12), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  227  			 STF_DPHY_RG_CDTX_L2N_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L2N_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  228  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(12), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  229  			 STF_DPHY_RG_CDTX_L3N_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L3N_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  230  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(16), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  231  			 STF_DPHY_RG_CDTX_L4N_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L4N_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  232  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(8), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  233  			 STF_DPHY_RG_CDTX_L0P_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L0P_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  234  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(12), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  235  			 STF_DPHY_RG_CDTX_L1P_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L1P_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  236  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(12), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  237  			 STF_DPHY_RG_CDTX_L2P_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L2P_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  238  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(12), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  239  			 STF_DPHY_RG_CDTX_L3P_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L3P_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  240  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(16), 0x10,
c1e89a3b23e556 Shengyang Chen 2023-11-17  241  			 STF_DPHY_RG_CDTX_L4P_HSTX_RES_SHIFT, STF_DPHY_RG_CDTX_L4P_HSTX_RES_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  242  
c1e89a3b23e556 Shengyang Chen 2023-11-17  243  	alignment = STF_DPHY_BITRATE_ALIGN;
c1e89a3b23e556 Shengyang Chen 2023-11-17  244  	if (bitrate % alignment)
c1e89a3b23e556 Shengyang Chen 2023-11-17  245  		bitrate += alignment - (bitrate % alignment);
c1e89a3b23e556 Shengyang Chen 2023-11-17  246  
c1e89a3b23e556 Shengyang Chen 2023-11-17  247  	p = m31_dphy_configs;
c1e89a3b23e556 Shengyang Chen 2023-11-17  248  	for (i = 0; i < ARRAY_SIZE(m31_dphy_configs); i++, p++) {
c1e89a3b23e556 Shengyang Chen 2023-11-17  249  		if (p->bitrate == bitrate) {
c1e89a3b23e556 Shengyang Chen 2023-11-17  250  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(100),
c1e89a3b23e556 Shengyang Chen 2023-11-17  251  					 STF_DPHY_REFCLK_12M, STF_DPHY_REFCLK_IN_SEL_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  252  					 STF_DPHY_REFCLK_IN_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  253  
c1e89a3b23e556 Shengyang Chen 2023-11-17  254  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(0),
c1e89a3b23e556 Shengyang Chen 2023-11-17  255  					 STF_DPHY_AON_POWER_READY_N_active,
c1e89a3b23e556 Shengyang Chen 2023-11-17  256  					 STF_DPHY_AON_POWER_READY_N_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  257  					 STF_DPHY_AON_POWER_READY_N_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  258  
c1e89a3b23e556 Shengyang Chen 2023-11-17  259  			/*Lane setting*/
c1e89a3b23e556 Shengyang Chen 2023-11-17  260  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(0), info->maps[0],
c1e89a3b23e556 Shengyang Chen 2023-11-17  261  					 STF_DPHY_CFG_L0_SWAP_SEL_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  262  					 STF_DPHY_CFG_L0_SWAP_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  263  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(0), info->maps[1],
c1e89a3b23e556 Shengyang Chen 2023-11-17  264  					 STF_DPHY_CFG_L1_SWAP_SEL_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  265  					 STF_DPHY_CFG_L1_SWAP_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  266  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(0), info->maps[2],
c1e89a3b23e556 Shengyang Chen 2023-11-17  267  					 STF_DPHY_CFG_L2_SWAP_SEL_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  268  					 STF_DPHY_CFG_L2_SWAP_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  269  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(0), info->maps[3],
c1e89a3b23e556 Shengyang Chen 2023-11-17  270  					 STF_DPHY_CFG_L3_SWAP_SEL_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  271  					 STF_DPHY_CFG_L3_SWAP_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  272  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(0), info->maps[4],
c1e89a3b23e556 Shengyang Chen 2023-11-17  273  					 STF_DPHY_CFG_L4_SWAP_SEL_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  274  					 STF_DPHY_CFG_L4_SWAP_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  275  			/*PLL setting*/
c1e89a3b23e556 Shengyang Chen 2023-11-17  276  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(28), 0x0,
c1e89a3b23e556 Shengyang Chen 2023-11-17  277  					 STF_DPHY_RG_CDTX_PLL_SSC_EN_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  278  					 STF_DPHY_RG_CDTX_PLL_SSC_EN_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  279  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(24), 0x1,
c1e89a3b23e556 Shengyang Chen 2023-11-17  280  					 STF_DPHY_RG_CDTX_PLL_LDO_STB_X2_EN_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  281  					 STF_DPHY_RG_CDTX_PLL_LDO_STB_X2_EN_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  282  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(24), 0x1,
c1e89a3b23e556 Shengyang Chen 2023-11-17  283  					 STF_DPHY_RG_CDTX_PLL_FM_EN_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  284  					 STF_DPHY_RG_CDTX_PLL_FM_EN_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  285  
c1e89a3b23e556 Shengyang Chen 2023-11-17  286  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(24),
c1e89a3b23e556 Shengyang Chen 2023-11-17  287  					 p->pll_prev_div, STF_DPHY_RG_CDTX_PLL_PRE_DIV_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  288  					 STF_DPHY_RG_CDTX_PLL_PRE_DIV_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  289  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(24),
c1e89a3b23e556 Shengyang Chen 2023-11-17  290  					 p->pll_fbk_int, STF_DPHY_RG_CDTX_PLL_FBK_INT_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  291  					 STF_DPHY_RG_CDTX_PLL_FBK_INT_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  292  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(20),
c1e89a3b23e556 Shengyang Chen 2023-11-17  293  					 p->pll_fbk_fra, STF_DPHY_RG_CDTX_PLL_FBK_FRA_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  294  					 STF_DPHY_RG_CDTX_PLL_FBK_FRA_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  295  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(40),
c1e89a3b23e556 Shengyang Chen 2023-11-17  296  					 p->extd_cycle_sel, STF_DPHY_RG_EXTD_CYCLE_SEL_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  297  					 STF_DPHY_RG_EXTD_CYCLE_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  298  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(36),
c1e89a3b23e556 Shengyang Chen 2023-11-17  299  					 p->dlane_hs_pre_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  300  					 STF_DPHY_RG_DLANE_HS_PRE_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  301  					 STF_DPHY_RG_DLANE_HS_PRE_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  302  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(36),
c1e89a3b23e556 Shengyang Chen 2023-11-17  303  					 p->dlane_hs_pre_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  304  					 STF_DPHY_RG_DLANE_HS_PRE_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  305  					 STF_DPHY_RG_DLANE_HS_PRE_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  306  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(36),
c1e89a3b23e556 Shengyang Chen 2023-11-17  307  					 p->dlane_hs_zero_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  308  					 STF_DPHY_RG_DLANE_HS_ZERO_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  309  					 STF_DPHY_RG_DLANE_HS_ZERO_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  310  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(36),
c1e89a3b23e556 Shengyang Chen 2023-11-17  311  					 p->dlane_hs_trail_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  312  					 STF_DPHY_RG_DLANE_HS_TRAIL_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  313  					 STF_DPHY_RG_DLANE_HS_TRAIL_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  314  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(32),
c1e89a3b23e556 Shengyang Chen 2023-11-17  315  					 p->clane_hs_pre_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  316  					 STF_DPHY_RG_CLANE_HS_PRE_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  317  					 STF_DPHY_RG_CLANE_HS_PRE_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  318  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(36),
c1e89a3b23e556 Shengyang Chen 2023-11-17  319  					 p->clane_hs_zero_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  320  					 STF_DPHY_RG_CLANE_HS_ZERO_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  321  					 STF_DPHY_RG_CLANE_HS_ZERO_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  322  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(32),
c1e89a3b23e556 Shengyang Chen 2023-11-17  323  					 p->clane_hs_trail_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  324  					 STF_DPHY_RG_CLANE_HS_TRAIL_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  325  					 STF_DPHY_RG_CLANE_HS_TRAIL_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  326  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(32),
c1e89a3b23e556 Shengyang Chen 2023-11-17  327  					 p->clane_hs_clk_pre_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  328  					 STF_DPHY_RG_CLANE_HS_CLK_PRE_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  329  					 STF_DPHY_RG_CLANE_HS_CLK_PRE_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  330  			stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(32),
c1e89a3b23e556 Shengyang Chen 2023-11-17  331  					 p->clane_hs_clk_post_time,
c1e89a3b23e556 Shengyang Chen 2023-11-17  332  					 STF_DPHY_RG_CLANE_HS_CLK_POST_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  333  					 STF_DPHY_RG_CLANE_HS_CLK_POST_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  334  
c1e89a3b23e556 Shengyang Chen 2023-11-17  335  			break;
c1e89a3b23e556 Shengyang Chen 2023-11-17  336  		}
c1e89a3b23e556 Shengyang Chen 2023-11-17  337  	}
c1e89a3b23e556 Shengyang Chen 2023-11-17  338  
c1e89a3b23e556 Shengyang Chen 2023-11-17  339  	return 0;
c1e89a3b23e556 Shengyang Chen 2023-11-17  340  }
c1e89a3b23e556 Shengyang Chen 2023-11-17  341  
c1e89a3b23e556 Shengyang Chen 2023-11-17  342  static int stf_dphy_init(struct phy *phy)
c1e89a3b23e556 Shengyang Chen 2023-11-17  343  {
c1e89a3b23e556 Shengyang Chen 2023-11-17  344  	struct stf_dphy *dphy = phy_get_drvdata(phy);
c1e89a3b23e556 Shengyang Chen 2023-11-17  345  	int ret;
c1e89a3b23e556 Shengyang Chen 2023-11-17  346  
c1e89a3b23e556 Shengyang Chen 2023-11-17  347  	stf_dphy_hw_reset(dphy, 0);
c1e89a3b23e556 Shengyang Chen 2023-11-17 @348  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(48), 0,
c1e89a3b23e556 Shengyang Chen 2023-11-17  349  			 STF_DPHY_SCFG_PPI_C_READY_SEL_SHIFT, STF_DPHY_SCFG_PPI_C_READY_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17 @350  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(48), 0,
c1e89a3b23e556 Shengyang Chen 2023-11-17  351  			 STF_DPHY_SCFG_DSI_TXREADY_ESC_SEL_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  352  			 STF_DPHY_SCFG_DSI_TXREADY_ESC_SEL_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17 @353  	stf_dphy_set_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(44), 0x30,
c1e89a3b23e556 Shengyang Chen 2023-11-17  354  			 STF_DPHY_SCFG_C_HS_PRE_ZERO_TIME_SHIFT,
c1e89a3b23e556 Shengyang Chen 2023-11-17  355  			 STF_DPHY_SCFG_C_HS_PRE_ZERO_TIME_MASK);
c1e89a3b23e556 Shengyang Chen 2023-11-17  356  
c1e89a3b23e556 Shengyang Chen 2023-11-17  357  	ret = clk_prepare_enable(dphy->txesc_clk);
c1e89a3b23e556 Shengyang Chen 2023-11-17  358  	if (ret) {
c1e89a3b23e556 Shengyang Chen 2023-11-17  359  		dev_err(dphy->dev, "Failed to prepare/enable txesc_clk\n");
c1e89a3b23e556 Shengyang Chen 2023-11-17  360  		return ret;
c1e89a3b23e556 Shengyang Chen 2023-11-17  361  	}
c1e89a3b23e556 Shengyang Chen 2023-11-17  362  
c1e89a3b23e556 Shengyang Chen 2023-11-17  363  	ret = reset_control_deassert(dphy->sys_rst);
c1e89a3b23e556 Shengyang Chen 2023-11-17  364  	if (ret) {
c1e89a3b23e556 Shengyang Chen 2023-11-17  365  		dev_err(dphy->dev, "Failed to deassert sys_rst\n");
c1e89a3b23e556 Shengyang Chen 2023-11-17  366  		return ret;
c1e89a3b23e556 Shengyang Chen 2023-11-17  367  	}
c1e89a3b23e556 Shengyang Chen 2023-11-17  368  
c1e89a3b23e556 Shengyang Chen 2023-11-17  369  	ret = reset_control_deassert(dphy->txbytehs_rst);
c1e89a3b23e556 Shengyang Chen 2023-11-17  370  	if (ret < 0) {
c1e89a3b23e556 Shengyang Chen 2023-11-17  371  		dev_err(dphy->dev, "Failed to deassert txbytehs_rst\n");
c1e89a3b23e556 Shengyang Chen 2023-11-17  372  		return ret;
c1e89a3b23e556 Shengyang Chen 2023-11-17  373  	}
c1e89a3b23e556 Shengyang Chen 2023-11-17  374  
c1e89a3b23e556 Shengyang Chen 2023-11-17  375  	return 0;
c1e89a3b23e556 Shengyang Chen 2023-11-17  376  }
c1e89a3b23e556 Shengyang Chen 2023-11-17  377  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
