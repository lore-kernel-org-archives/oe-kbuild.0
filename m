Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9461113
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 06:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691648708; x=1723184708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rTHxdDgR36AcgIwH9cvqFcgMxQnnbmhiD6K+FRq5/vA=;
  b=Ni3cpc3v0b9+nrFI0cYUlsTxlrDhwdCag90CYMQ7Qj34418XbE/Rw3p6
   WWqG+Dt2lJwlTmLdBxoi/XBpZfnHJmF0dpHxivb5ZMqydDFxa66ZRilLS
   NaxbvjN/LrdfZR1sHiRR+vzWqKwWk5TpltzgNMQClOYAs+ucnFMjuX8h7
   FEcKw7wsFo9o/XSqbXk4cwPIrjWE95y+2mAqyy8zn/GlmZQyK9k3TcZyV
   rjM7YSvtxwuyEgGFFN/YpEItwyJUf5EzAklHyaN1pJzLycH3FUeO2qvs1
   4JzYjIxoi5jZVHPUta+ncz0qU84f3LIts6qc3TcCKkT38SYsQ7UcM78oB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375026232"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="375026232"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 23:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="855814133"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="855814133"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Aug 2023 23:25:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTz6T-0006ni-25;
	Thu, 10 Aug 2023 06:25:01 +0000
Date: Thu, 10 Aug 2023 14:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 6/6] regulator: pca9450: register restart handlers
Message-ID: <202308101403.rZTxk0pZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230809-pca9450-reboot-v2-6-b98b4f8139d5@skidata.com>
References: <20230809-pca9450-reboot-v2-6-b98b4f8139d5@skidata.com>
TO: Benjamin Bara <bbara93@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: peng.fan@oss.nxp.com
TO: rafael.j.wysocki@intel.com
TO: Jerome Neanne <jneanne@baylibre.com>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: Benjamin Bara <benjamin.bara@skidata.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 21ef7b1e17d039053edaeaf41142423810572741]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Bara/kernel-reboot-distinguish-between-cold-and-warm/20230810-032740
base:   21ef7b1e17d039053edaeaf41142423810572741
patch link:    https://lore.kernel.org/r/20230809-pca9450-reboot-v2-6-b98b4f8139d5%40skidata.com
patch subject: [PATCH v2 6/6] regulator: pca9450: register restart handlers
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: hexagon-randconfig-r045-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101403.rZTxk0pZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101403.rZTxk0pZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308101403.rZTxk0pZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/regulator/pca9450-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/regulator/pca9450-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/regulator/pca9450-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/regulator/pca9450-regulator.c:255:43: warning: declaration of 'struct sys_off_data' will not be visible outside of this function [-Wvisibility]
     255 | static int pca9450_restart_handler(struct sys_off_data *data)
         |                                           ^
>> drivers/regulator/pca9450-regulator.c:257:41: error: incomplete definition of type 'struct sys_off_data'
     257 |         int (*handler)(struct pca9450 *) = data->cb_data;
         |                                            ~~~~^
   drivers/regulator/pca9450-regulator.c:255:43: note: forward declaration of 'struct sys_off_data'
     255 | static int pca9450_restart_handler(struct sys_off_data *data)
         |                                           ^
   drivers/regulator/pca9450-regulator.c:258:47: error: incomplete definition of type 'struct sys_off_data'
     258 |         struct pca9450 *pca9450 = dev_to_pca9450(data->dev);
         |                                                  ~~~~^
   drivers/regulator/pca9450-regulator.c:255:43: note: forward declaration of 'struct sys_off_data'
     255 | static int pca9450_restart_handler(struct sys_off_data *data)
         |                                           ^
>> drivers/regulator/pca9450-regulator.c:889:8: error: call to undeclared function 'devm_register_cold_restart_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     889 |         ret = devm_register_cold_restart_handler(pca9450->dev,
         |               ^
>> drivers/regulator/pca9450-regulator.c:898:8: error: call to undeclared function 'devm_register_warm_restart_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     898 |         ret = devm_register_warm_restart_handler(pca9450->dev,
         |               ^
   7 warnings and 4 errors generated.


vim +257 drivers/regulator/pca9450-regulator.c

d5856c66c005da Benjamin Bara 2023-08-09  254  
d5856c66c005da Benjamin Bara 2023-08-09 @255  static int pca9450_restart_handler(struct sys_off_data *data)
d5856c66c005da Benjamin Bara 2023-08-09  256  {
d5856c66c005da Benjamin Bara 2023-08-09 @257  	int (*handler)(struct pca9450 *) = data->cb_data;
d5856c66c005da Benjamin Bara 2023-08-09 @258  	struct pca9450 *pca9450 = dev_to_pca9450(data->dev);
d5856c66c005da Benjamin Bara 2023-08-09  259  
d5856c66c005da Benjamin Bara 2023-08-09  260  	return handler(pca9450);
d5856c66c005da Benjamin Bara 2023-08-09  261  }
d5856c66c005da Benjamin Bara 2023-08-09  262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
