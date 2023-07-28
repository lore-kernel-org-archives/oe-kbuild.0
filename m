Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6C618E
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 00:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690503104; x=1722039104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dOL2n0dFH3ApkMz19pfnJYdtXfPF4lXEx+bVuLrp7sU=;
  b=P2I71/tybA3FT7AeSOxFKNgFVIOS35GyISqRx+VUz8R+dtMH8/ZSnpPA
   RfDvumFfqBjc03AUFPKRpG/n4AuDlQu5Adw03VvoK2VABXRR0zjB5BBxo
   Li5hAcpALDz0WEzTdA0kaLRozz21FUJ8GPOhL2ROkjJP9fPS0A3qjcvhX
   ffJx8O9vWXV8Wtp1pfvDDi1IAHWgD0vbtDQleJON1HCrRS/f8/K1kILv+
   5Ytlf+C6GSE3juokv1JbpZ0Phe3ymaXoSMruekd2/vHgnAKzVDSZyWlaV
   8eTbNEylk1P0MHFpvdDBWTcUYsTpCB+707ZbBQl5bzkF3f60vKOkl3uG4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372091047"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="372091047"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 17:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="677326317"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="677326317"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Jul 2023 17:11:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPB4A-0002id-1X;
	Fri, 28 Jul 2023 00:11:15 +0000
Date: Fri, 28 Jul 2023 08:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/6] regulator: pca9450: register restart handlers
Message-ID: <202307280701.6zRp2wF2-lkp@intel.com>
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
In-Reply-To: <20230727-pca9450-reboot-v1-6-c8edb27bf404@skidata.com>
References: <20230727-pca9450-reboot-v1-6-c8edb27bf404@skidata.com>
TO: Benjamin Bara <bbara93@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: Robin Gong <yibin.gong@nxp.com>
TO: Jerome Neanne <jneanne@baylibre.com>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: Benjamin Bara <benjamin.bara@skidata.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Bara/kernel-reboot-distinguish-between-cold-and-warm/20230727-233435
base:   4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
patch link:    https://lore.kernel.org/r/20230727-pca9450-reboot-v1-6-c8edb27bf404%40skidata.com
patch subject: [PATCH 6/6] regulator: pca9450: register restart handlers
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: hexagon-randconfig-r011-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280701.6zRp2wF2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280701.6zRp2wF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307280701.6zRp2wF2-lkp@intel.com/

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

fec8096c9c3753 Benjamin Bara 2023-07-27  254  
fec8096c9c3753 Benjamin Bara 2023-07-27 @255  static int pca9450_restart_handler(struct sys_off_data *data)
fec8096c9c3753 Benjamin Bara 2023-07-27  256  {
fec8096c9c3753 Benjamin Bara 2023-07-27 @257  	int (*handler)(struct pca9450 *) = data->cb_data;
fec8096c9c3753 Benjamin Bara 2023-07-27 @258  	struct pca9450 *pca9450 = dev_to_pca9450(data->dev);
fec8096c9c3753 Benjamin Bara 2023-07-27  259  
fec8096c9c3753 Benjamin Bara 2023-07-27  260  	return handler(pca9450);
fec8096c9c3753 Benjamin Bara 2023-07-27  261  }
fec8096c9c3753 Benjamin Bara 2023-07-27  262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
