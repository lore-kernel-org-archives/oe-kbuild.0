Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91567C
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Feb 2023 09:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677318689; x=1708854689;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XA2Du4C9Wjt0M9KlWGmQXtUWH//0MBblw7QJ03lRzxA=;
  b=M4bqI919FAHJ+RVv3V2/oZ7t1TngDYhuD9QcyJ+wjZ5BWTA/M1g15F4q
   HXerT3zchpLq7Ywg+muL3SoyY+ruOqRQHsVe4RwJXGM9fQ3NwfGUlGKS1
   A+McdyqMTvEk5a65sdEM5eaimXxmRg+NSF0hJDT2qv2G6iNOcbQ2GmsGG
   bO2ZkjnBaK/pK8h2rOLSsMY1zoZaXyiYe6dbHHtBy6UcnlPOpipLr3+Hp
   Xlry47IxnxDeAFTyvGbqoq9MISPkGXkX+1lEb5fzKgGu4bd2fOM9oC403
   mXdJ3JjvejxkRR2i16Fm9rUJiEtehdyQX5rRp5xtessn9/HqbfpBxPdZZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="317409680"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="317409680"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 01:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="622994347"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="622994347"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Feb 2023 01:51:25 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVrDB-00035r-0b;
	Sat, 25 Feb 2023 09:51:25 +0000
Date: Sat, 25 Feb 2023 17:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pci/ecam.c:62:2: warning: Value stored to 'bsz' is never
 read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302251749.ZpBdbdUh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/pci/ecam.c:62:2: warning: Value stored to 'bsz' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   489fa31ea873282b41046d412ec741f93946fc2d
commit: 6fd09c9afa49b343d17cecedd7879d097f37f2a9 ARM: Kconfig: clean up platform selection
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20230219 (https://download.01.org/0day-ci/archive/20230225/202302251749.ZpBdbdUh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6fd09c9afa49b343d17cecedd7879d097f37f2a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6fd09c9afa49b343d17cecedd7879d097f37f2a9
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302251749.ZpBdbdUh-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:994:14: note: Access to field 'flags' results in a dereference of a null pointer (loaded from variable 'new')
                           O_RDWR | (new->flags & UFFD_SHARED_FCNTL_FLAGS), inode);
                                     ^~~
   fs/userfaultfd.c:1960:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&uffdio_api, 0, sizeof(uffdio_api));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/userfaultfd.c:1960:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&uffdio_api, 0, sizeof(uffdio_api));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   lib/list-test.c:32:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(list5, 0xFF, sizeof(*list5));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/list-test.c:32:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(list5, 0xFF, sizeof(*list5));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/list-test.c:827:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(list5, 0xFF, sizeof(*list5));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/list-test.c:827:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(list5, 0xFF, sizeof(*list5));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/pci/pci-stub.c:65:12: warning: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   fields = sscanf(id, "%x:%x:%x:%x:%x:%x",
                            ^~~~~~
   drivers/pci/pci-stub.c:65:12: note: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11
                   fields = sscanf(id, "%x:%x:%x:%x:%x:%x",
                            ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
>> drivers/pci/ecam.c:62:2: warning: Value stored to 'bsz' is never read [clang-analyzer-deadcode.DeadStores]
           bsz = 1 << bus_shift;
           ^     ~~~~~~~~~~~~~~
   drivers/pci/ecam.c:62:2: note: Value stored to 'bsz' is never read
           bsz = 1 << bus_shift;
           ^     ~~~~~~~~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/pci/controller/cadence/pcie-cadence.c:34:16: warning: The result of the left shift is undefined due to shifting by '64', which is greater or equal to the width of type 'unsigned long long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           u64 sz = 1ULL << fls64(size - 1);
                         ^  ~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-cadence.c:34:19: note: Calling 'fls64'
           u64 sz = 1ULL << fls64(size - 1);
                            ^~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls64.h:22:6: note: Assuming 'h' is not equal to 0
           if (h)
               ^
   include/asm-generic/bitops/fls64.h:22:2: note: Taking true branch
           if (h)
           ^
   include/asm-generic/bitops/fls64.h:23:3: note: Returning the value 64
                   return fls(h) + 32;
                   ^~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-cadence.c:34:19: note: Returning from 'fls64'
           u64 sz = 1ULL << fls64(size - 1);
                            ^~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-cadence.c:34:16: note: The result of the left shift is undefined due to shifting by '64', which is greater or equal to the width of type 'unsigned long long'
           u64 sz = 1ULL << fls64(size - 1);
                         ^  ~~~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   kernel/power/qos.c:329:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(req, 0, sizeof(*req));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   kernel/power/qos.c:329:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(req, 0, sizeof(*req));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   kernel/power/main.c:581:8: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   s += sprintf(s, "disk ");
                        ^~~~~~~
   kernel/power/main.c:581:8: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   s += sprintf(s, "disk ");
                        ^~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (40 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/pci/controller/dwc/pcie-designware.c:584:24: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           pci->region_align = 1 << fls(min);
                                 ^
   drivers/pci/controller/dwc/pcie-designware.c:592:29: note: Calling 'dw_pcie_iatu_unroll_enabled'
           pci->iatu_unroll_enabled = dw_pcie_iatu_unroll_enabled(pci);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-designware.c:529:8: note: Calling 'dw_pcie_readl_dbi'
           val = dw_pcie_readl_dbi(pci, PCIE_ATU_VIEWPORT);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-designware.h:363:9: note: Calling 'dw_pcie_read_dbi'
           return dw_pcie_read_dbi(pci, reg, 0x4);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-designware.c:171:6: note: Assuming pointer value is null
           if (pci->ops && pci->ops->read_dbi)
               ^~~~~~~~
   drivers/pci/controller/dwc/pcie-designware.c:171:6: note: Assuming field 'ops' is null
           if (pci->ops && pci->ops->read_dbi)
               ^~~~~~~~
   drivers/pci/controller/dwc/pcie-designware.c:171:15: note: Left side of '&&' is false
           if (pci->ops && pci->ops->read_dbi)
                        ^
   drivers/pci/controller/dwc/pcie-designware.c:175:6: note: Assuming 'ret' is 0
           if (ret)
--
   drivers/rapidio/devices/tsi721.c:942:7: note: Assuming 'size' is <= field 'free'
                   if (priv->p2r_bar[i].free >= size) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/tsi721.c:942:3: note: Taking true branch
                   if (priv->p2r_bar[i].free >= size) {
                   ^
   drivers/rapidio/devices/tsi721.c:944:10: note: Value assigned to 'obw'
                           ret = tsi721_obw_alloc(priv, pbar, size, &obw);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/tsi721.c:945:8: note: Assuming 'ret' is 0
                           if (!ret)
                               ^~~~
   drivers/rapidio/devices/tsi721.c:945:4: note: Taking true branch
                           if (!ret)
                           ^
   drivers/rapidio/devices/tsi721.c:946:5: note:  Execution continues on line 950
                                   break;
                                   ^
   drivers/rapidio/devices/tsi721.c:950:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/rapidio/devices/tsi721.c:950:2: note: Taking false branch
           if (ret)
           ^
   drivers/rapidio/devices/tsi721.c:953:10: note: Assuming the condition is true
           WARN_ON(obw == -1);
                   ^
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/rapidio/devices/tsi721.c:957:2: note: Taking false branch
           tsi_debug(OBW, &priv->pdev->dev,
           ^
   drivers/rapidio/devices/tsi721.h:39:3: note: expanded from macro 'tsi_debug'
                   no_printk(KERN_DEBUG "%s: " fmt "\n", __func__, ##arg)
                   ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/rapidio/devices/tsi721.c:971:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < TSI721_PC2SR_ZONES; i++) {
           ^
   drivers/rapidio/devices/tsi721.c:973:3: note: Loop condition is false. Execution continues on line 978
                   while (ioread32(priv->regs + TSI721_ZONE_SEL) &
                   ^
   drivers/rapidio/devices/tsi721.c:986:36: note: The result of the left shift is undefined because the left operand is negative
                   rval = TSI721_ZONE_SEL_GO | (obw << 3) | i;
                                                ~~~ ^
   drivers/rapidio/devices/tsi721.c:1684:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(priv->omsg_ring[mbox].omq_base[tx_slot], buffer, len);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/rapidio/devices/tsi721.c:1684:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(priv->omsg_ring[mbox].omq_base[tx_slot], buffer, len);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/rapidio/devices/tsi721.c:2482:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, rx_virt, msg_size);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/rapidio/devices/tsi721.c:2482:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, rx_virt, msg_size);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> drivers/rapidio/devices/tsi721.c:2646:20: warning: Value stored to 'mport' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rio_mport *mport = to_rio_mport(dev);
                             ^~~~~
   drivers/rapidio/devices/tsi721.c:2646:20: note: Value stored to 'mport' during its initialization is never read
           struct rio_mport *mport = to_rio_mport(dev);
                             ^~~~~
   drivers/rapidio/devices/tsi721.c:2681:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mport->name, RIO_MAX_MPORT_NAME, "%s(%s)",
           ^~~~~~~~
   drivers/rapidio/devices/tsi721.c:2681:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(mport->name, RIO_MAX_MPORT_NAME, "%s(%s)",
           ^~~~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/rapidio/devices/tsi721.c:1093:17: note: Assuming 'lstart' is equal to 'rstart'
           bool direct = (lstart == rstart);
                          ^~~~~~~~~~~~~~~~
   drivers/rapidio/devices/tsi721.c:1101:6: note: Assuming 'size' is <= 17179869184
           if (size > 0x400000000UL)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/tsi721.c:1101:2: note: Taking false branch
           if (size > 0x400000000UL)
           ^
   drivers/rapidio/devices/tsi721.c:1104:6: note: 'direct' is true
           if (direct) {
               ^~~~~~
   drivers/rapidio/devices/tsi721.c:1104:2: note: Taking true branch
           if (direct) {
           ^
   drivers/rapidio/devices/tsi721.c:1107:14: note: '?' condition is false
                   ibw_size = roundup_pow_of_two(size);
                              ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/rapidio/devices/tsi721.c:1107:14: note: Calling '__roundup_pow_of_two'
                   ibw_size = roundup_pow_of_two(size);
                              ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_two'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:204:2: note: Taking true branch
           if (sizeof(l) == 4)
           ^
   include/linux/bitops.h:205:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r = 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal to 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is false
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is false
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is false
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is false
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is false
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loaded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:205:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:205:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
--
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   sound/core/timer.c:1960:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&status, 0, sizeof(status));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   sound/core/timer.c:2215:4: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&tread32, 0, sizeof(tread32));
                           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   sound/core/timer.c:2215:4: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                           memset(&tread32, 0, sizeof(tread32));
                           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
>> drivers/comedi/drivers/me_daq.c:351:2: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]
           value = readw(dev->mmio + XILINX_DOWNLOAD_RESET);
           ^
   drivers/comedi/drivers/me_daq.c:351:2: note: Value stored to 'value' is never read
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/comedi/drivers/ni_pcidio.c:750:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(s->async->prealloc_buf, 0xaa, s->async->prealloc_bufsz);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/comedi/drivers/ni_pcidio.c:750:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(s->async->prealloc_buf, 0xaa, s->async->prealloc_bufsz);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   fs/btrfs/zstd.c:444:4: warning: Value stored to 'tot_out' is never read [clang-analyzer-deadcode.DeadStores]
                           tot_out += workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:444:4: note: Value stored to 'tot_out' is never read
                           tot_out += workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:503:4: warning: Value stored to 'tot_out' is never read [clang-analyzer-deadcode.DeadStores]
                           tot_out += workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:503:4: note: Value stored to 'tot_out' is never read
                           tot_out += workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:253:23: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           unsigned long head = READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^
   fs/btrfs/zstd.c:381:2: note: 'in_page' initialized to a null pointer value
           struct page *in_page = NULL;  /* The current page to read */
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:398:6: note: Assuming 'stream' is null
           if (!stream) {
               ^~~~~~~
   fs/btrfs/zstd.c:398:2: note: Taking true branch
           if (!stream) {
           ^
   fs/btrfs/zstd.c:399:3: note: Loop condition is false.  Exiting loop
                   pr_warn("BTRFS: zstd_init_cstream failed\n");
                   ^
   include/linux/printk.h:517:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:410:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   fs/btrfs/zstd.c:401:3: note: Control jumps to line 534
                   goto out;
                   ^
   fs/btrfs/zstd.c:535:6: note: Assuming field 'src' is non-null
           if (workspace->in_buf.src) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:535:2: note: Taking true branch
--
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/ds3000.c:850:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &ds3000_ops,
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   sound/drivers/serial-generic.c:283:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, substream->number);
                   ^~~~~~~
   sound/drivers/serial-generic.c:283:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, substream->number);
                   ^~~~~~~
   sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:303:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:333:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:333:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev->ctrl->nr);
           ^~~~~~~
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/comedi/drivers.c:617:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(_data, 0, sizeof(_data));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/comedi/drivers.c:617:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(_data, 0, sizeof(_data));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/comedi/drivers.c:618:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&_insn, 0, sizeof(_insn));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/comedi/drivers.c:618:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&_insn, 0, sizeof(_insn));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
>> drivers/comedi/drivers/rtd520.c:679:2: warning: Value stored to 'fifo_status' is never read [clang-analyzer-deadcode.DeadStores]
           fifo_status = readl(dev->mmio + LAS0_ADC);
           ^
   drivers/comedi/drivers/rtd520.c:679:2: note: Value stored to 'fifo_status' is never read
>> drivers/comedi/drivers/rtd520.c:680:2: warning: Value stored to 'overrun' is never read [clang-analyzer-deadcode.DeadStores]
           overrun = readl(dev->mmio + LAS0_OVERRUN) & 0xffff;
           ^
   drivers/comedi/drivers/rtd520.c:680:2: note: Value stored to 'overrun' is never read
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/comedi/drivers/s626.c:1336:21: warning: The left operand of '<<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   local_ppl = (*ppl << 8) | (*ppl & 0x10 ? S626_GSEL_BIPOLAR5V :
                                     ^
   drivers/comedi/drivers/s626.c:1698:6: note: Assuming field 'ai_cmd_running' is 0
           if (devpriv->ai_cmd_running) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/s626.c:1698:2: note: Taking false branch
           if (devpriv->ai_cmd_running) {
           ^
   drivers/comedi/drivers/s626.c:1704:2: note: Loop condition is false.  Exiting loop
           writel(0, dev->mmio + S626_P_IER);
           ^
   arch/arm/include/asm/io.h:290:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:168:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/comedi/drivers/s626.c:1707:2: note: Loop condition is false.  Exiting loop
           writel(S626_IRQ_RPS1 | S626_IRQ_GPIO3, dev->mmio + S626_P_ISR);
           ^
   arch/arm/include/asm/io.h:290:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:168:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/comedi/drivers/s626.c:1716:2: note: Calling 's626_ai_load_polllist'
           s626_ai_load_polllist(ppl, cmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/s626.c:1590:14: note: Assuming 'n' is >= field 'chanlist_len'
           for (n = 0; n < cmd->chanlist_len; n++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/s626.c:1590:2: note: Loop condition is false. Execution continues on line 1596
           for (n = 0; n < cmd->chanlist_len; n++) {
           ^
   drivers/comedi/drivers/s626.c:1596:6: note: 'n' is equal to 0
           if (n != 0)
               ^
   drivers/comedi/drivers/s626.c:1596:2: note: Taking false branch
           if (n != 0)
           ^
   drivers/comedi/drivers/s626.c:1716:2: note: Returning from 's626_ai_load_polllist'
           s626_ai_load_polllist(ppl, cmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/s626.c:1720:2: note: 'Default' branch taken. Execution continues on line 1741
           switch (cmd->scan_begin_src) {
           ^
   drivers/comedi/drivers/s626.c:1741:2: note: 'Default' branch taken. Execution continues on line 1763
           switch (cmd->convert_src) {
           ^
   drivers/comedi/drivers/s626.c:1763:2: note: Calling 's626_reset_adc'
           s626_reset_adc(dev, ppl);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/s626.c:1292:2: note: Loop condition is false.  Exiting loop
           writel((u32)devpriv->rps_buf.physical_base,
           ^
   arch/arm/include/asm/io.h:290:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:168:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/comedi/drivers/s626.c:1296:6: note: Assuming field 'scan_begin_src' is equal to TRIG_FOLLOW
           if (cmd->scan_begin_src != TRIG_FOLLOW) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/s626.c:1296:2: note: Taking false branch
           if (cmd->scan_begin_src != TRIG_FOLLOW) {
           ^
   drivers/comedi/drivers/s626.c:1328:2: note: Loop condition is true.  Entering loop body
           for (devpriv->adc_items = 0; devpriv->adc_items < 16;
           ^
   drivers/comedi/drivers/s626.c:1336:21: note: The left operand of '<<' is a garbage value
                   local_ppl = (*ppl << 8) | (*ppl & 0x10 ? S626_GSEL_BIPOLAR5V :
                                ~~~~ ^
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/hid/hid-input.c:191:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ke->scancode, &scancode, sizeof(scancode));
                   ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/hid/hid-input.c:191:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ke->scancode, &scancode, sizeof(scancode));
                   ^
--
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/hwmon/ltc2945.c:286:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/ltc2945.c:286:2: note: Value stored to 'ret' is never read
           ret = regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
>> drivers/comedi/drivers/addi_apci_3xxx.c:744:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val = readl(dev->mmio + 28);
                   ^
   drivers/comedi/drivers/addi_apci_3xxx.c:744:3: note: Value stored to 'val' is never read
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/media/dvb-frontends/stv0900_core.c:1914:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &stv0900_ops,
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0900_core.c:1914:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &stv0900_ops,
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/media/dvb-frontends/stv0900_sw.c:1978:4: warning: Value stored to 'lock' is never read [clang-analyzer-deadcode.DeadStores]
                           lock = TRUE;
                           ^
   drivers/media/dvb-frontends/stv0900_sw.c:1978:4: note: Value stored to 'lock' is never read
   drivers/media/dvb-frontends/stv0900_sw.c:1993:4: warning: Value stored to 'lock' is never read [clang-analyzer-deadcode.DeadStores]
                           lock = FALSE;
                           ^
   drivers/media/dvb-frontends/stv0900_sw.c:1993:4: note: Value stored to 'lock' is never read
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/media/dvb-frontends/s5h1432.c:207:4: warning: Value stored to 'dvb_bandwidth' is never read [clang-analyzer-deadcode.DeadStores]
                           dvb_bandwidth = 6;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:207:4: note: Value stored to 'dvb_bandwidth' is never read
                           dvb_bandwidth = 6;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:211:4: warning: Value stored to 'dvb_bandwidth' is never read [clang-analyzer-deadcode.DeadStores]
                           dvb_bandwidth = 7;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:211:4: note: Value stored to 'dvb_bandwidth' is never read
                           dvb_bandwidth = 7;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:215:4: warning: Value stored to 'dvb_bandwidth' is never read [clang-analyzer-deadcode.DeadStores]
                           dvb_bandwidth = 8;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:215:4: note: Value stored to 'dvb_bandwidth' is never read
                           dvb_bandwidth = 8;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:351:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &s5h1432_ops,
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/s5h1432.c:351:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &s5h1432_ops,
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \

vim +/bsz +62 drivers/pci/ecam.c

35ff9477d88098 Jayachandran C       2016-05-10   20  
35ff9477d88098 Jayachandran C       2016-05-10   21  /*
35ff9477d88098 Jayachandran C       2016-05-10   22   * Create a PCI config space window
35ff9477d88098 Jayachandran C       2016-05-10   23   *  - reserve mem region
35ff9477d88098 Jayachandran C       2016-05-10   24   *  - alloc struct pci_config_window with space for all mappings
35ff9477d88098 Jayachandran C       2016-05-10   25   *  - ioremap the config space
35ff9477d88098 Jayachandran C       2016-05-10   26   */
35ff9477d88098 Jayachandran C       2016-05-10   27  struct pci_config_window *pci_ecam_create(struct device *dev,
35ff9477d88098 Jayachandran C       2016-05-10   28  		struct resource *cfgres, struct resource *busr,
0b104773b4f72c Rob Herring          2020-04-09   29  		const struct pci_ecam_ops *ops)
35ff9477d88098 Jayachandran C       2016-05-10   30  {
e7708f5b10e205 Krzysztof Wilczyński 2020-11-29   31  	unsigned int bus_shift = ops->bus_shift;
35ff9477d88098 Jayachandran C       2016-05-10   32  	struct pci_config_window *cfg;
35ff9477d88098 Jayachandran C       2016-05-10   33  	unsigned int bus_range, bus_range_max, bsz;
35ff9477d88098 Jayachandran C       2016-05-10   34  	struct resource *conflict;
8fe55ef23387ce Russell King         2021-05-13   35  	int err;
35ff9477d88098 Jayachandran C       2016-05-10   36  
35ff9477d88098 Jayachandran C       2016-05-10   37  	if (busr->start > busr->end)
35ff9477d88098 Jayachandran C       2016-05-10   38  		return ERR_PTR(-EINVAL);
35ff9477d88098 Jayachandran C       2016-05-10   39  
35ff9477d88098 Jayachandran C       2016-05-10   40  	cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
35ff9477d88098 Jayachandran C       2016-05-10   41  	if (!cfg)
35ff9477d88098 Jayachandran C       2016-05-10   42  		return ERR_PTR(-ENOMEM);
35ff9477d88098 Jayachandran C       2016-05-10   43  
e7708f5b10e205 Krzysztof Wilczyński 2020-11-29   44  	/* ECAM-compliant platforms need not supply ops->bus_shift */
e7708f5b10e205 Krzysztof Wilczyński 2020-11-29   45  	if (!bus_shift)
e7708f5b10e205 Krzysztof Wilczyński 2020-11-29   46  		bus_shift = PCIE_ECAM_BUS_SHIFT;
e7708f5b10e205 Krzysztof Wilczyński 2020-11-29   47  
5c3d14f76fccd1 Jayachandran C       2016-06-10   48  	cfg->parent = dev;
35ff9477d88098 Jayachandran C       2016-05-10   49  	cfg->ops = ops;
35ff9477d88098 Jayachandran C       2016-05-10   50  	cfg->busr.start = busr->start;
35ff9477d88098 Jayachandran C       2016-05-10   51  	cfg->busr.end = busr->end;
35ff9477d88098 Jayachandran C       2016-05-10   52  	cfg->busr.flags = IORESOURCE_BUS;
8fe55ef23387ce Russell King         2021-05-13   53  	cfg->bus_shift = bus_shift;
35ff9477d88098 Jayachandran C       2016-05-10   54  	bus_range = resource_size(&cfg->busr);
e7708f5b10e205 Krzysztof Wilczyński 2020-11-29   55  	bus_range_max = resource_size(cfgres) >> bus_shift;
35ff9477d88098 Jayachandran C       2016-05-10   56  	if (bus_range > bus_range_max) {
35ff9477d88098 Jayachandran C       2016-05-10   57  		bus_range = bus_range_max;
35ff9477d88098 Jayachandran C       2016-05-10   58  		cfg->busr.end = busr->start + bus_range - 1;
35ff9477d88098 Jayachandran C       2016-05-10   59  		dev_warn(dev, "ECAM area %pR can only accommodate %pR (reduced from %pR desired)\n",
35ff9477d88098 Jayachandran C       2016-05-10   60  			 cfgres, &cfg->busr, busr);
35ff9477d88098 Jayachandran C       2016-05-10   61  	}
e7708f5b10e205 Krzysztof Wilczyński 2020-11-29  @62  	bsz = 1 << bus_shift;
35ff9477d88098 Jayachandran C       2016-05-10   63  
35ff9477d88098 Jayachandran C       2016-05-10   64  	cfg->res.start = cfgres->start;
35ff9477d88098 Jayachandran C       2016-05-10   65  	cfg->res.end = cfgres->end;
35ff9477d88098 Jayachandran C       2016-05-10   66  	cfg->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
35ff9477d88098 Jayachandran C       2016-05-10   67  	cfg->res.name = "PCI ECAM";
35ff9477d88098 Jayachandran C       2016-05-10   68  
35ff9477d88098 Jayachandran C       2016-05-10   69  	conflict = request_resource_conflict(&iomem_resource, &cfg->res);
35ff9477d88098 Jayachandran C       2016-05-10   70  	if (conflict) {
35ff9477d88098 Jayachandran C       2016-05-10   71  		err = -EBUSY;
35ff9477d88098 Jayachandran C       2016-05-10   72  		dev_err(dev, "can't claim ECAM area %pR: address conflict with %s %pR\n",
35ff9477d88098 Jayachandran C       2016-05-10   73  			&cfg->res, conflict->name, conflict);
35ff9477d88098 Jayachandran C       2016-05-10   74  		goto err_exit;
35ff9477d88098 Jayachandran C       2016-05-10   75  	}
35ff9477d88098 Jayachandran C       2016-05-10   76  
35ff9477d88098 Jayachandran C       2016-05-10   77  	if (per_bus_mapping) {
35ff9477d88098 Jayachandran C       2016-05-10   78  		cfg->winp = kcalloc(bus_range, sizeof(*cfg->winp), GFP_KERNEL);
35ff9477d88098 Jayachandran C       2016-05-10   79  		if (!cfg->winp)
35ff9477d88098 Jayachandran C       2016-05-10   80  			goto err_exit_malloc;
35ff9477d88098 Jayachandran C       2016-05-10   81  	} else {
053497cec7daec Lorenzo Pieralisi    2017-04-19   82  		cfg->win = pci_remap_cfgspace(cfgres->start, bus_range * bsz);
35ff9477d88098 Jayachandran C       2016-05-10   83  		if (!cfg->win)
35ff9477d88098 Jayachandran C       2016-05-10   84  			goto err_exit_iomap;
35ff9477d88098 Jayachandran C       2016-05-10   85  	}
35ff9477d88098 Jayachandran C       2016-05-10   86  
35ff9477d88098 Jayachandran C       2016-05-10   87  	if (ops->init) {
5c3d14f76fccd1 Jayachandran C       2016-06-10   88  		err = ops->init(cfg);
35ff9477d88098 Jayachandran C       2016-05-10   89  		if (err)
35ff9477d88098 Jayachandran C       2016-05-10   90  			goto err_exit;
35ff9477d88098 Jayachandran C       2016-05-10   91  	}
35ff9477d88098 Jayachandran C       2016-05-10   92  	dev_info(dev, "ECAM at %pR for %pR\n", &cfg->res, &cfg->busr);
35ff9477d88098 Jayachandran C       2016-05-10   93  	return cfg;
35ff9477d88098 Jayachandran C       2016-05-10   94  
35ff9477d88098 Jayachandran C       2016-05-10   95  err_exit_iomap:
35ff9477d88098 Jayachandran C       2016-05-10   96  	dev_err(dev, "ECAM ioremap failed\n");
35ff9477d88098 Jayachandran C       2016-05-10   97  err_exit_malloc:
35ff9477d88098 Jayachandran C       2016-05-10   98  	err = -ENOMEM;
35ff9477d88098 Jayachandran C       2016-05-10   99  err_exit:
35ff9477d88098 Jayachandran C       2016-05-10  100  	pci_ecam_free(cfg);
35ff9477d88098 Jayachandran C       2016-05-10  101  	return ERR_PTR(err);
35ff9477d88098 Jayachandran C       2016-05-10  102  }
0c59c06a7c9039 Rob Herring          2020-04-09  103  EXPORT_SYMBOL_GPL(pci_ecam_create);
35ff9477d88098 Jayachandran C       2016-05-10  104  

:::::: The code at line 62 was first introduced by commit
:::::: e7708f5b10e205d6291bb495e645a03553b9768b PCI: Unify ECAM constants in native PCI Express drivers

:::::: TO: Krzysztof Wilczyński <kw@linux.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
