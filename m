Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2443569C
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jan 2023 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675097953; x=1706633953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJBJ3OPcQHaSehKfBs5nvxc65Vg3QrGLY/Fc5O0ohQQ=;
  b=ju/sFPGjgpYQdyRy6UPAqTzKkwUUmOMwMPJvVf2lezxZzPuilcCACLxt
   MW2hjrxh6Ta5q/FBT1EK1motF98coRhyoYV9TIhHvrQ+WBGbN3t8KoS0h
   sZ0z8x5Tojz47YZAHJF8ewPrr0WQhmmfj1ffi6GKQRnTkuvbQpQXOnqMk
   NIjiFoCDEbHZ/m6cJ99gsPl4LIsLQ5Me+cOnieUcFz/Pmz4o+TLGrQ2je
   kglVeoi4J4A+amcERq+MPACvNosR5u+9Fca6XT79Vb4K5TaPzjRFzpwek
   Cw8wFAUcCX5Fi9Pdth3n3T/utrLr/fwR+nuVFxAqsRMaYGV55xmgWEz09
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392157816"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="392157816"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 08:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="992967714"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="992967714"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 08:59:11 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMXUs-0003m2-2e;
	Mon, 30 Jan 2023 16:59:10 +0000
Date: Tue, 31 Jan 2023 00:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mmc/host/sunplus-mmc.c:673:3: warning: Value stored to 'ret'
 is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301310024.YE6B69VI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mmc/host/sunplus-mmc.c:673:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tony Huang <tonyhuang.sunplus@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d796c50f84ca79f1722bb131799e5a5710c4700
commit: 4e268fed8b1861616af28f9cfb4eed8ca5d7af6c mmc: Add mmc driver for Sunplus SP7021
date:   8 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20230128 (https://download.01.org/0day-ci/archive/20230131/202301310024.YE6B69VI-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4e268fed8b1861616af28f9cfb4eed8ca5d7af6c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4e268fed8b1861616af28f9cfb4eed8ca5d7af6c
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                              ^~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/mmc/host/mtk-sd.c:713:2: warning: Value stored to 'sg' is never read [clang-analyzer-deadcode.DeadStores]
           sg = data->sg;
           ^    ~~~~~~~~
   drivers/mmc/host/mtk-sd.c:713:2: note: Value stored to 'sg' is never read
           sg = data->sg;
           ^    ~~~~~~~~
   drivers/mmc/host/mtk-sd.c:1089:2: warning: Value stored to 'read' is never read [clang-analyzer-deadcode.DeadStores]
           read = data->flags & MMC_DATA_READ;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:1089:2: note: Value stored to 'read' is never read
           read = data->flags & MMC_DATA_READ;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/mmc/host/mmc_spi.c:354:4: warning: Value stored to 'end' is never read [clang-analyzer-deadcode.DeadStores]
                           end = cp+1;
                           ^     ~~~~
   drivers/mmc/host/mmc_spi.c:354:4: note: Value stored to 'end' is never read
                           end = cp+1;
                           ^     ~~~~
   drivers/mmc/host/mmc_spi.c:866:15: warning: Value stored to 'write_or_read' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const char              *write_or_read = (direction == DMA_TO_DEVICE) ? "write" : "read";
                                    ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:866:15: note: Value stored to 'write_or_read' during its initialization is never read
           const char              *write_or_read = (direction == DMA_TO_DEVICE) ? "write" : "read";
                                    ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1076:4: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                           status = mmc_spi_command_send(host, mrq, &stop, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1076:4: note: Value stored to 'status' is never read
                           status = mmc_spi_command_send(host, mrq, &stop, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1083:4: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                           status = mmc_spi_command_send(host, mrq, mrq->stop, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1083:4: note: Value stored to 'status' is never read
                           status = mmc_spi_command_send(host, mrq, mrq->stop, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1238:3: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                   status = spi_setup(host->spi);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1238:3: note: Value stored to 'status' is never read
                   status = spi_setup(host->spi);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/mmc/host/bcm2835.c:195:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:195:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:210:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:210:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:713:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:713:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/mmc/host/sunplus-mmc.c:673:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = reset_control_deassert(host->rstc);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sunplus-mmc.c:673:3: note: Value stored to 'ret' is never read
                   ret = reset_control_deassert(host->rstc);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mmc/host/litex_mmc.c:436:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = mmc_dev(host->mmc);
                          ^~~
   drivers/mmc/host/litex_mmc.c:436:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = mmc_dev(host->mmc);
                          ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mmc/core/core.c:1953:19: warning: Value stored to 'host' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mmc_host *host = card->host;
                            ^~~~   ~~~~~~~~~~
   drivers/mmc/core/core.c:1953:19: note: Value stored to 'host' during its initialization is never read
           struct mmc_host *host = card->host;
                            ^~~~   ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/mmc/host/tmio_mmc_core.c:947:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/tmio_mmc_core.c:947:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mmc/host/renesas_sdhi_core.c:1077:41: warning: Access to field 'taps' results in a dereference of a null pointer (loaded from variable 'of_data') [clang-analyzer-core.NullDereference]
                   const struct renesas_sdhi_scc *taps = of_data->taps;
                                                         ^~~~~~~
   drivers/mmc/host/renesas_sdhi_core.c:919:6: note: Assuming 'res' is non-null
           if (!res)
               ^~~~
   drivers/mmc/host/renesas_sdhi_core.c:919:2: note: Taking false branch
           if (!res)
           ^
   drivers/mmc/host/renesas_sdhi_core.c:924:6: note: Assuming 'priv' is non-null
           if (!priv)
               ^~~~~
   drivers/mmc/host/renesas_sdhi_core.c:924:2: note: Taking false branch
           if (!priv)
           ^
   drivers/mmc/host/renesas_sdhi_core.c:932:2: note: Taking false branch
           if (IS_ERR(priv->clk))
           ^
   drivers/mmc/host/renesas_sdhi_core.c:936:2: note: Taking false branch
           if (IS_ERR(priv->clkh))
           ^
   drivers/mmc/host/renesas_sdhi_core.c:951:2: note: Taking false branch
           if (IS_ERR(priv->clk_cd))
           ^
   drivers/mmc/host/renesas_sdhi_core.c:955:2: note: Taking false branch
           if (IS_ERR(priv->rstc))
           ^
   drivers/mmc/host/renesas_sdhi_core.c:959:2: note: Taking false branch
           if (!IS_ERR(priv->pinctrl)) {
           ^
   drivers/mmc/host/renesas_sdhi_core.c:967:2: note: Taking false branch
           if (IS_ERR(host))
           ^
   drivers/mmc/host/renesas_sdhi_core.c:970:6: note: Assuming 'of_data' is null
           if (of_data) {
               ^~~~~~~
   drivers/mmc/host/renesas_sdhi_core.c:970:2: note: Taking false branch
           if (of_data) {
           ^
   drivers/mmc/host/renesas_sdhi_core.c:993:6: note: Assuming field 'quirks' is null
           if (sdhi_has_quirk(priv, hs400_disabled))
               ^
   drivers/mmc/host/renesas_sdhi.h:41:31: note: expanded from macro 'sdhi_has_quirk'
   #define sdhi_has_quirk(p, q) ((p)->quirks && (p)->quirks->q)
                                 ^~~~~~~~~~~
   drivers/mmc/host/renesas_sdhi_core.c:993:6: note: Left side of '&&' is false
           if (sdhi_has_quirk(priv, hs400_disabled))
               ^
   drivers/mmc/host/renesas_sdhi.h:41:43: note: expanded from macro 'sdhi_has_quirk'
   #define sdhi_has_quirk(p, q) ((p)->quirks && (p)->quirks->q)
                                             ^
   drivers/mmc/host/renesas_sdhi_core.c:997:6: note: Assuming the condition is false
           if (mmc_can_gpio_ro(host->mmc))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/renesas_sdhi_core.c:997:2: note: Taking false branch
           if (mmc_can_gpio_ro(host->mmc))

vim +/ret +673 drivers/mmc/host/sunplus-mmc.c

4e268fed8b1861 Tony Huang 2022-11-21  665  
4e268fed8b1861 Tony Huang 2022-11-21  666  static void spmmc_controller_init(struct spmmc_host *host)
4e268fed8b1861 Tony Huang 2022-11-21  667  {
4e268fed8b1861 Tony Huang 2022-11-21  668  	u32 value;
4e268fed8b1861 Tony Huang 2022-11-21  669  	int ret = reset_control_assert(host->rstc);
4e268fed8b1861 Tony Huang 2022-11-21  670  
4e268fed8b1861 Tony Huang 2022-11-21  671  	if (!ret) {
4e268fed8b1861 Tony Huang 2022-11-21  672  		usleep_range(1000, 1250);
4e268fed8b1861 Tony Huang 2022-11-21 @673  		ret = reset_control_deassert(host->rstc);
4e268fed8b1861 Tony Huang 2022-11-21  674  	}
4e268fed8b1861 Tony Huang 2022-11-21  675  
4e268fed8b1861 Tony Huang 2022-11-21  676  	value = readl(host->base + SPMMC_CARD_MEDIATYPE_SRCDST_REG);
4e268fed8b1861 Tony Huang 2022-11-21  677  	value &= ~SPMMC_MEDIA_TYPE;
4e268fed8b1861 Tony Huang 2022-11-21  678  	value |= FIELD_PREP(SPMMC_MEDIA_TYPE, SPMMC_MEDIA_SD);
4e268fed8b1861 Tony Huang 2022-11-21  679  	writel(value, host->base + SPMMC_CARD_MEDIATYPE_SRCDST_REG);
4e268fed8b1861 Tony Huang 2022-11-21  680  }
4e268fed8b1861 Tony Huang 2022-11-21  681  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
