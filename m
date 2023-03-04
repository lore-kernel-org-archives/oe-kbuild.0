Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691512CAB
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 21:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677966309; x=1709502309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HktUDOtdhSDrMcpt24EWJPGPSm+TU4f83sp7+2pxXQw=;
  b=DYw54WXKJiuNWaMGSwiZxPmsyYEAPj7nOobAOIP43r5r/7/zyDE7BPIG
   fervg1RwqdFoQNsrSLkC4CUvogmvGHo6M8FQCEmriCCJsndBwneSevIQ4
   X4ziXx8gh1l34bTebVcmyK3duvzkN6eXQRjNq0PyPHfRO86nj5BKrsy9a
   HRth86oWIM7RUNwzR8laut9E6VNBHy6X87GiGHugNgH2nfr0RRmSTaD3E
   hi3E9FwhurFGtBHCXXUIjKY+K8Q8HawH8LOgPQrYHpj9W3NLXMQppUqqI
   5joDpoKpvoUKL0lZeBfnv4dnq2rA5bn6Vgesv8X9uQNNw49bscNqMMXYn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="323616088"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="323616088"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 13:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="744621730"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="744621730"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2023 13:45:07 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYZgg-0002NW-2G;
	Sat, 04 Mar 2023 21:45:06 +0000
Date: Sun, 5 Mar 2023 05:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 2/4] Bluetooth: Add vhci devcoredump support
Message-ID: <202303050505.mZjJnVJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/bluetooth/hci_vhci.c:306:2: warning: Value stored to 'ptr' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230302151413.v7.2.Ief9a81a3643d2291f6db2b3695c3a6e0159467dc@changeid>
References: <20230302151413.v7.2.Ief9a81a3643d2291f6db2b3695c3a6e0159467dc@changeid>
TO: Manish Mandlik <mmandlik@google.com>
TO: marcel@holtmann.org
TO: luiz.dentz@gmail.com
CC: chromeos-bluetooth-upstreaming@chromium.org
CC: linux-bluetooth@vger.kernel.org
CC: Manish Mandlik <mmandlik@google.com>
CC: Johan Hedberg <johan.hedberg@gmail.com>
CC: linux-kernel@vger.kernel.org

Hi Manish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on v6.2 next-20230303]
[cannot apply to bluetooth/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manish-Mandlik/Bluetooth-Add-vhci-devcoredump-support/20230303-071806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20230302151413.v7.2.Ief9a81a3643d2291f6db2b3695c3a6e0159467dc%40changeid
patch subject: [PATCH v7 2/4] Bluetooth: Add vhci devcoredump support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20230302 (https://download.01.org/0day-ci/archive/20230305/202303050505.mZjJnVJW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f7880b2804b595a12f5d3f7437f75d5ffd3e6420
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Manish-Mandlik/Bluetooth-Add-vhci-devcoredump-support/20230303-071806
        git checkout f7880b2804b595a12f5d3f7437f75d5ffd3e6420
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303050505.mZjJnVJW-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
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
   6 warnings generated.
   drivers/gpu/drm/drm_framebuffer.c:855:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(fb->comm, current->comm);
           ^~~~~~
   drivers/gpu/drm/drm_framebuffer.c:855:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(fb->comm, current->comm);
           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (3 in non-user code, 3 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/gpu/drm/drm_mode_config.c:444:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = drm_modeset_backoff(&modeset_ctx);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mode_config.c:444:4: note: Value stored to 'ret' is never read
                           ret = drm_modeset_backoff(&modeset_ctx);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
>> drivers/bluetooth/hci_vhci.c:306:2: warning: Value stored to 'ptr' is never read [clang-analyzer-deadcode.DeadStores]
           ptr += read;
           ^      ~~~~
   drivers/bluetooth/hci_vhci.c:306:2: note: Value stored to 'ptr' is never read
           ptr += read;
           ^      ~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/bluetooth/btmrvl_sdio.c:1267:5: warning: Value stored to 'ptr' is never read [clang-analyzer-deadcode.DeadStores]
                                   ptr += sprintf(ptr, "ERR");
                                   ^      ~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btmrvl_sdio.c:1267:5: note: Value stored to 'ptr' is never read
                                   ptr += sprintf(ptr, "ERR");
                                   ^      ~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/hwtracing/intel_th/sth.c:73:15: warning: Value stored to 'outp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u64 __iomem *outp = &out->Dn;
                        ^~~~   ~~~~~~~~
   drivers/hwtracing/intel_th/sth.c:73:15: note: Value stored to 'outp' during its initialization is never read
           u64 __iomem *outp = &out->Dn;
                        ^~~~   ~~~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/hwtracing/intel_th/sth.c:81:9: note: '?' condition is false
           size = rounddown_pow_of_two(size);
                  ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/hwtracing/intel_th/sth.c:81:9: note: Calling '__rounddown_pow_of_two'
           size = rounddown_pow_of_two(size);
                  ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/ax25/ax25_dev.c:141:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           ax25_dev_put(ax25_dev);
           ^            ~~~~~~~~
   net/ax25/ax25_dev.c:100:6: note: Assuming the condition is false
           if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:100:2: note: Taking false branch
           if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
           ^
   net/ax25/ax25_dev.c:114:26: note: Assuming 's' is not equal to NULL
           for (s = ax25_dev_list; s != NULL; s = s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:114:2: note: Loop condition is true.  Entering loop body
           for (s = ax25_dev_list; s != NULL; s = s->next)

vim +/ptr +306 drivers/bluetooth/hci_vhci.c

f7880b2804b595 Manish Mandlik 2023-03-02  285  
f7880b2804b595 Manish Mandlik 2023-03-02  286  static int vhci_coredump_hdr(struct hci_dev *hdev, char *buf, size_t size)
f7880b2804b595 Manish Mandlik 2023-03-02  287  {
f7880b2804b595 Manish Mandlik 2023-03-02  288  	char *ptr = buf;
f7880b2804b595 Manish Mandlik 2023-03-02  289  	size_t rem = size;
f7880b2804b595 Manish Mandlik 2023-03-02  290  	size_t read = 0;
f7880b2804b595 Manish Mandlik 2023-03-02  291  
f7880b2804b595 Manish Mandlik 2023-03-02  292  	read = snprintf(ptr, rem, "Controller Name: vhci_ctrl\n");
f7880b2804b595 Manish Mandlik 2023-03-02  293  	rem -= read;
f7880b2804b595 Manish Mandlik 2023-03-02  294  	ptr += read;
f7880b2804b595 Manish Mandlik 2023-03-02  295  
f7880b2804b595 Manish Mandlik 2023-03-02  296  	read = snprintf(ptr, rem, "Firmware Version: vhci_fw\n");
f7880b2804b595 Manish Mandlik 2023-03-02  297  	rem -= read;
f7880b2804b595 Manish Mandlik 2023-03-02  298  	ptr += read;
f7880b2804b595 Manish Mandlik 2023-03-02  299  
f7880b2804b595 Manish Mandlik 2023-03-02  300  	read = snprintf(ptr, rem, "Driver: vhci_drv\n");
f7880b2804b595 Manish Mandlik 2023-03-02  301  	rem -= read;
f7880b2804b595 Manish Mandlik 2023-03-02  302  	ptr += read;
f7880b2804b595 Manish Mandlik 2023-03-02  303  
f7880b2804b595 Manish Mandlik 2023-03-02  304  	read = snprintf(ptr, rem, "Vendor: vhci\n");
f7880b2804b595 Manish Mandlik 2023-03-02  305  	rem -= read;
f7880b2804b595 Manish Mandlik 2023-03-02 @306  	ptr += read;
f7880b2804b595 Manish Mandlik 2023-03-02  307  
f7880b2804b595 Manish Mandlik 2023-03-02  308  	return size - rem;
f7880b2804b595 Manish Mandlik 2023-03-02  309  }
f7880b2804b595 Manish Mandlik 2023-03-02  310  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
