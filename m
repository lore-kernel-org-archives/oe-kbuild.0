Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA22217CD
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 04:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674102333; x=1705638333;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RDjwycyuQairx/GAlayFN/e5qwLP1nC3vbPw37czKDo=;
  b=Oq469DklWWeq8gSoMA+9QGPcIl9iT6EBA3ahL5l0CHX4AdES8YGN5Fi7
   B9xXSs92l43d4W1cU56I/YOXWZ/g3ooPqWppsDXsd/1j6cqJqrK85H+JX
   jvlTjQeow/SyCF/ywz+Y8Dikmo0xqhEsOk5NKIfU4Jd07kI4Pa+Ou1rTj
   71Mo+V47ok+CkRwu+Wcs/N9PfECD2FLlWT/bQ4knDSqam7YTzHsKtFhmb
   LC7fbx7AdCo7XMJ4aoHms2lxphejYN/zh5KHxU88kzRb+6p6++53yXGOl
   vhJ6ul9UvytE+nX650/Cfmgm03MV+2kfHTqy15CwIKJvno+uOy3kMTxgZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326452653"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="326452653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 20:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728505701"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="728505701"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 20:25:32 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIMUV-00014s-0w;
	Thu, 19 Jan 2023 04:25:31 +0000
Date: Thu, 19 Jan 2023 12:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pci/controller/pci-mvebu.c:745:34: warning: unused function
 'sys_to_pcie'
Message-ID: <202301191241.fxAPi07r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Pali Rohár" <pali@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

Hi Pali,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 0746ae1be12177ebda0666eefa82583cbaeeefd6 PCI: mvebu: Add support for compiling driver as module
date:   1 year ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year ago
config: arm-randconfig-r046-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191241.fxAPi07r-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0746ae1be12177ebda0666eefa82583cbaeeefd6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0746ae1be12177ebda0666eefa82583cbaeeefd6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-omap2/ arch/arm/mm/ drivers/bus/ drivers/clk/ti/ drivers/firmware/tegra/ drivers/gpu/drm/amd/amdgpu/ drivers/mailbox/ drivers/pci/controller/ drivers/pinctrl/ kernel/time/ net/rds/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pci-mvebu.c:745:34: warning: unused function 'sys_to_pcie' [-Wunused-function]
   static inline struct mvebu_pcie *sys_to_pcie(struct pci_sys_data *sys)
                                    ^
   1 warning generated.


vim +/sys_to_pcie +745 drivers/pci/controller/pci-mvebu.c

45361a4fe44641 drivers/pci/host/pci-mvebu.c Thomas Petazzoni 2013-05-16  744  
45361a4fe44641 drivers/pci/host/pci-mvebu.c Thomas Petazzoni 2013-05-16 @745  static inline struct mvebu_pcie *sys_to_pcie(struct pci_sys_data *sys)
45361a4fe44641 drivers/pci/host/pci-mvebu.c Thomas Petazzoni 2013-05-16  746  {
45361a4fe44641 drivers/pci/host/pci-mvebu.c Thomas Petazzoni 2013-05-16  747  	return sys->private_data;
45361a4fe44641 drivers/pci/host/pci-mvebu.c Thomas Petazzoni 2013-05-16  748  }
45361a4fe44641 drivers/pci/host/pci-mvebu.c Thomas Petazzoni 2013-05-16  749  

:::::: The code at line 745 was first introduced by commit
:::::: 45361a4fe4464180815157654aabbd2afb4848ad pci: PCIe driver for Marvell Armada 370/XP systems

:::::: TO: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
:::::: CC: Jason Cooper <jason@lakedaemon.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
