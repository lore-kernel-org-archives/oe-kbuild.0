Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F37E
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674380724; x=1705916724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7D7c/1/wl2WdrtZGEMCS9Uh1R0RhvwNlv2u9fGdnmGo=;
  b=IsjFzd6m43w4zc7C+zR0bMj3cwbvgVnUOm4SOuHDQ/+uQrDSvL8iCF4t
   yu3nY9uG8JrrTkVSrZ/y+j8Bzmw//fu5E6igg0kP3gEETCpv5ZkPQ1t9J
   vRLpBRpfPqiKZ26TuLhD+p3E/UrZRMRylLOIPG8EMyPJXIp5y5Z+UP6Qu
   7+hNlxqtuEVV+rVuKLNcCa3UFe46dW56CEyvIwutwI4miHuwBJ+UtHLE8
   EIsHMmodoskSGcyifQYUPee9m8dfZ4UCxyMIgeVAEjUdMYY3+DlY79CQy
   KaHtONg6f34ZfSJlCoTcrNBHVDazP7Cjv8XYCnxiaSyhMO5FdErBG6KAp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="313772428"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="313772428"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 01:45:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="803571669"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="803571669"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Jan 2023 01:45:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJWuf-0004vw-2P;
	Sun, 22 Jan 2023 09:45:21 +0000
Date: Sun, 22 Jan 2023 17:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/nand/ecc-mxic.c:466:17: warning: Value stored to 'dev'
 during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301221729.l7IKo4nl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mtd/nand/ecc-mxic.c:466:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
commit: 48e6633a9fa2400b53a964358753769f291a7eb0 mtd: nand: mxic-ecc: Add Macronix external ECC engine support
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20230119 (https://download.01.org/0day-ci/archive/20230122/202301221729.l7IKo4nl-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=48e6633a9fa2400b53a964358753769f291a7eb0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 48e6633a9fa2400b53a964358753769f291a7eb0
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                               ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c:111:7: note: Assuming '__UNIQUE_ID___x277' is <= '__UNIQUE_ID___y278'
                       max_t(u8, T(18), 1) << 16 |
                       ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c:111:7: note: '?' condition is false
                       max_t(u8, T(18), 1) << 16 |
                       ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c:114:27: note: The result of the left shift is undefined because the left operand is negative
           timing[2] = (T(CWL) - 1) << 24 |
                       ~~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   kernel/async.c:125:2: warning: Value stored to 'calltime' is never read [clang-analyzer-deadcode.DeadStores]
           calltime = ktime_get();
           ^          ~~~~~~~~~~~
   kernel/async.c:125:2: note: Value stored to 'calltime' is never read
           calltime = ktime_get();
           ^          ~~~~~~~~~~~
   kernel/async.c:275:2: warning: Value stored to 'starttime' is never read [clang-analyzer-deadcode.DeadStores]
           starttime = ktime_get();
           ^           ~~~~~~~~~~~
   kernel/async.c:275:2: note: Value stored to 'starttime' is never read
           starttime = ktime_get();
           ^           ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/soc/generic/simple-card.c:259:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/simple-card.c:259:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = simple_priv_to_dev(priv);
                          ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/soc/generic/audio-graph-card.c:369:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:369:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = simple_priv_to_dev(priv);
                          ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/mtd/nand/ecc-mxic.c:466:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = mxic->dev;
                          ^~~   ~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:466:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = mxic->dev;
                          ^~~   ~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:538:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (ret)
               ^~~
   drivers/mtd/nand/ecc-mxic.c:500:27: note: 'ret' declared without an initial value
           int offset, nents, step, ret;
                                    ^~~
   drivers/mtd/nand/ecc-mxic.c:502:6: note: Assuming field 'mode' is not equal to MTD_OPS_RAW
           if (req->mode == MTD_OPS_RAW)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:502:2: note: Taking false branch
           if (req->mode == MTD_OPS_RAW)
           ^
   drivers/mtd/nand/ecc-mxic.c:508:6: note: Assuming field 'type' is not equal to NAND_PAGE_READ
           if (req->type == NAND_PAGE_READ)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:508:2: note: Taking false branch
           if (req->type == NAND_PAGE_READ)
           ^
   drivers/mtd/nand/ecc-mxic.c:519:6: note: Assuming 'nents' is not equal to 0
           if (!nents)
               ^~~~~~
   drivers/mtd/nand/ecc-mxic.c:519:2: note: Taking false branch
           if (!nents)
           ^
   drivers/mtd/nand/ecc-mxic.c:524:17: note: Assuming 'step' is >= field 'steps'
           for (step = 0; step < ctx->steps; step++) {
                          ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:524:2: note: Loop condition is false. Execution continues on line 534
           for (step = 0; step < ctx->steps; step++) {
           ^
   drivers/mtd/nand/ecc-mxic.c:538:6: note: Branch condition evaluates to a garbage value
           if (ret)
               ^~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
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
   9 warnings generated.
   drivers/char/ipmi/ipmi_watchdog.c:1204:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(outval, action);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1204:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(outval, action);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1219:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(action, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1219:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(action, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1226:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(outval, preaction);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1226:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(outval, preaction);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1243:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(preaction, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1243:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(preaction, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1250:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(outval, preop);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1250:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(outval, preop);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1263:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(preop, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1263:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(preop, inval);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/dev +466 drivers/mtd/nand/ecc-mxic.c

48e6633a9fa240 Miquel Raynal 2021-12-16  460  
48e6633a9fa240 Miquel Raynal 2021-12-16  461  static int mxic_ecc_count_biterrs(struct mxic_ecc_engine *mxic,
48e6633a9fa240 Miquel Raynal 2021-12-16  462  				  struct nand_device *nand)
48e6633a9fa240 Miquel Raynal 2021-12-16  463  {
48e6633a9fa240 Miquel Raynal 2021-12-16  464  	struct mxic_ecc_ctx *ctx = nand_to_ecc_ctx(nand);
48e6633a9fa240 Miquel Raynal 2021-12-16  465  	struct mtd_info *mtd = nanddev_to_mtd(nand);
48e6633a9fa240 Miquel Raynal 2021-12-16 @466  	struct device *dev = mxic->dev;
48e6633a9fa240 Miquel Raynal 2021-12-16  467  	unsigned int max_bf = 0;
48e6633a9fa240 Miquel Raynal 2021-12-16  468  	bool failure = false;
48e6633a9fa240 Miquel Raynal 2021-12-16  469  	int step;
48e6633a9fa240 Miquel Raynal 2021-12-16  470  
48e6633a9fa240 Miquel Raynal 2021-12-16  471  	for (step = 0; step < ctx->steps; step++) {
48e6633a9fa240 Miquel Raynal 2021-12-16  472  		u8 stat = ctx->status[step];
48e6633a9fa240 Miquel Raynal 2021-12-16  473  
48e6633a9fa240 Miquel Raynal 2021-12-16  474  		if (stat == NO_ERR) {
48e6633a9fa240 Miquel Raynal 2021-12-16  475  			dev_dbg(dev, "ECC step %d: no error\n", step);
48e6633a9fa240 Miquel Raynal 2021-12-16  476  		} else if (stat == ERASED_CHUNK) {
48e6633a9fa240 Miquel Raynal 2021-12-16  477  			dev_dbg(dev, "ECC step %d: erased\n", step);
48e6633a9fa240 Miquel Raynal 2021-12-16  478  		} else if (stat == UNCORR_ERR || stat > MAX_CORR_ERR) {
48e6633a9fa240 Miquel Raynal 2021-12-16  479  			dev_dbg(dev, "ECC step %d: uncorrectable\n", step);
48e6633a9fa240 Miquel Raynal 2021-12-16  480  			mtd->ecc_stats.failed++;
48e6633a9fa240 Miquel Raynal 2021-12-16  481  			failure = true;
48e6633a9fa240 Miquel Raynal 2021-12-16  482  		} else {
48e6633a9fa240 Miquel Raynal 2021-12-16  483  			dev_dbg(dev, "ECC step %d: %d bits corrected\n",
48e6633a9fa240 Miquel Raynal 2021-12-16  484  				step, stat);
48e6633a9fa240 Miquel Raynal 2021-12-16  485  			max_bf = max_t(unsigned int, max_bf, stat);
48e6633a9fa240 Miquel Raynal 2021-12-16  486  			mtd->ecc_stats.corrected += stat;
48e6633a9fa240 Miquel Raynal 2021-12-16  487  		}
48e6633a9fa240 Miquel Raynal 2021-12-16  488  	}
48e6633a9fa240 Miquel Raynal 2021-12-16  489  
48e6633a9fa240 Miquel Raynal 2021-12-16  490  	return failure ? -EBADMSG : max_bf;
48e6633a9fa240 Miquel Raynal 2021-12-16  491  }
48e6633a9fa240 Miquel Raynal 2021-12-16  492  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
