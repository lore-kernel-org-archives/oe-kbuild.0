Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750F01CFBE
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0jp6LN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700549426; x=1732085426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=boAqebPIaZ/hGUXcWs6ikq/wzimCUa1QL4GTp3PmnqQ=;
  b=J0jp6LN8uK3ynpHK36MwcekqhkxXzpjycyQlmLpSQ6hksL6mjaFDYisq
   ZEl7Pcx2uD60xtDTzTV9GN0/s6yTaBZHdDO9klIYHg7nIwiXVNwVP+YtY
   jRT8kInr/krB0R0+/oNGNNILVV3yb7Kuv/brH6qSJCDaPw6/mLIS4pZlc
   J6jxOvCytO+Z7gzx3QTkNN/0tJ1B5o12cNb5XEC2WMrPIhgWU+9sCYXHn
   j4u6hzvZptl1c4/V5OFMka3B7zppEtBXkoNi73eeHysvmig87L8M+22Sf
   zeRut5sBuG6zZonwW8aDJn/tBc6yyddKdni+1Uoy/281ry/bLAJ1GLp4P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371949824"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371949824"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 22:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="7801707"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2023 22:50:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5KaF-0007Sh-19;
	Tue, 21 Nov 2023 06:50:13 +0000
Date: Tue, 21 Nov 2023 14:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] phy: starfive: Add mipi dphy tx support
Message-ID: <202311211404.6xEYPvBy-lkp@intel.com>
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
[also build test WARNING on linus/master v6.7-rc2 next-20231120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengyang-Chen/dt-bindings-phy-Add-starfive-jh7110-dphy-tx/20231117-210751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231117130421.79261-3-shengyang.chen%40starfivetech.com
patch subject: [PATCH v1 2/2] phy: starfive: Add mipi dphy tx support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-r112-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211404.6xEYPvBy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211404.6xEYPvBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311211404.6xEYPvBy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *io_addr @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:21: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:21: sparse:     got void *io_addr
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: too many warnings

vim +172 drivers/phy/starfive/phy-jh7110-dphy-tx.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
