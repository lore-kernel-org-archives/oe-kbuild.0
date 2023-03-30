Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F536C2ED
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680168707; x=1711704707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f+RE9+9RtxlyGdofYIO+OmUf1pK6awIEaDb1RlnvpsU=;
  b=jgKlW1GGBZK2ejcgpLe9A7cNwlcg8a9TtKnPc8VGwUvxv9q772CSLte6
   v7HWhTNK/jC8k3bild1g6NUHsN47VuVLEXV5hZw89fhVa7IQuHBPHsHSE
   9NzBC1i7ikBE2GpHcDvrGdcDKFPUywQ/UWckYd3eONVxK0OZKf6Z7KGjE
   m3o+Gc8O0surISPYTC8nD7zsVKIohIN4Y1eriS6NtlOyom8stGbth2wC8
   jgq2WworpSSpnrPsI5FQxB+0fEtWHvkl99jtCSjsG3R8o/YIQ3e6ZNAAo
   6/1ATAeq9eIWp6c0zBBdl9UllOiIa1UGbN9LN1CH0WAOs1AP/GMvDLo7O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338617174"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="338617174"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 02:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="795587691"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="795587691"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2023 02:31:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phodE-000Kgu-28;
	Thu, 30 Mar 2023 09:31:44 +0000
Date: Thu, 30 Mar 2023 17:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5035/7844] net/mac80211/mesh_pathtbl.c:616:24:
 warning: Value stored to 'cache' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303301711.LjiQ6GKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/mac80211/mesh_pathtbl.c:616:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Felix Fietkau <nbd@nbd.name>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Ryder Lee <ryder.lee@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6d9e3034536ba4b68ac34490c02267e6eec9c05
commit: d5edb9ae8d568745f893c5c5fa3837d85311b131 [5035/7844] wifi: mac80211: mesh fast xmit support
:::::: branch date: 6 hours ago
:::::: commit date: 8 days ago
config: riscv-randconfig-c006-20230326 (https://download.01.org/0day-ci/archive/20230330/202303301711.LjiQ6GKs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d5edb9ae8d568745f893c5c5fa3837d85311b131
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d5edb9ae8d568745f893c5c5fa3837d85311b131
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303301711.LjiQ6GKs-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   arch/riscv/include/asm/mmio.h:120:67: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
                                                                        ^
   arch/riscv/include/asm/mmio.h:112:21: note: expanded from macro '__io_raw'
   #define __io_raw()              do {} while (0)
                                   ^
   drivers/mmc/host/dw_mmc.c:3567:2: note: Loop condition is false.  Exiting loop
           mci_writel(host, RINTSTS, 0xFFFFFFFF);
           ^
   drivers/mmc/host/dw_mmc.h:478:2: note: expanded from macro 'mci_writel'
           writel_relaxed((value), (dev)->regs + SDMMC_##reg)
           ^
   arch/riscv/include/asm/mmio.h:120:33: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
                                      ^
   arch/riscv/include/asm/mmio.h:111:21: note: expanded from macro '__io_rbw'
   #define __io_rbw()              do {} while (0)
                                   ^
   drivers/mmc/host/dw_mmc.c:3567:2: note: Loop condition is false.  Exiting loop
           mci_writel(host, RINTSTS, 0xFFFFFFFF);
           ^
   drivers/mmc/host/dw_mmc.h:478:2: note: expanded from macro 'mci_writel'
           writel_relaxed((value), (dev)->regs + SDMMC_##reg)
           ^
   arch/riscv/include/asm/mmio.h:120:67: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
                                                                        ^
   arch/riscv/include/asm/mmio.h:112:21: note: expanded from macro '__io_raw'
   #define __io_raw()              do {} while (0)
                                   ^
   drivers/mmc/host/dw_mmc.c:3568:2: note: Loop condition is false.  Exiting loop
           mci_writel(host, INTMASK, SDMMC_INT_CMD_DONE | SDMMC_INT_DATA_OVER |
           ^
   drivers/mmc/host/dw_mmc.h:478:2: note: expanded from macro 'mci_writel'
           writel_relaxed((value), (dev)->regs + SDMMC_##reg)
           ^
   arch/riscv/include/asm/mmio.h:120:33: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
                                      ^
   arch/riscv/include/asm/mmio.h:111:21: note: expanded from macro '__io_rbw'
   #define __io_rbw()              do {} while (0)
                                   ^
   drivers/mmc/host/dw_mmc.c:3568:2: note: Loop condition is false.  Exiting loop
           mci_writel(host, INTMASK, SDMMC_INT_CMD_DONE | SDMMC_INT_DATA_OVER |
           ^
   drivers/mmc/host/dw_mmc.h:478:2: note: expanded from macro 'mci_writel'
           writel_relaxed((value), (dev)->regs + SDMMC_##reg)
           ^
   arch/riscv/include/asm/mmio.h:120:67: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
                                                                        ^
   arch/riscv/include/asm/mmio.h:112:21: note: expanded from macro '__io_raw'
   #define __io_raw()              do {} while (0)
                                   ^
   drivers/mmc/host/dw_mmc.c:3571:2: note: Loop condition is false.  Exiting loop
           mci_writel(host, CTRL, SDMMC_CTRL_INT_ENABLE);
           ^
   drivers/mmc/host/dw_mmc.h:478:2: note: expanded from macro 'mci_writel'
           writel_relaxed((value), (dev)->regs + SDMMC_##reg)
           ^
   arch/riscv/include/asm/mmio.h:120:33: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
                                      ^
   arch/riscv/include/asm/mmio.h:111:21: note: expanded from macro '__io_rbw'
   #define __io_rbw()              do {} while (0)
                                   ^
   drivers/mmc/host/dw_mmc.c:3571:2: note: Loop condition is false.  Exiting loop
           mci_writel(host, CTRL, SDMMC_CTRL_INT_ENABLE);
           ^
   drivers/mmc/host/dw_mmc.h:478:2: note: expanded from macro 'mci_writel'
           writel_relaxed((value), (dev)->regs + SDMMC_##reg)
           ^
   arch/riscv/include/asm/mmio.h:120:67: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
                                                                        ^
   arch/riscv/include/asm/mmio.h:112:21: note: expanded from macro '__io_raw'
   #define __io_raw()              do {} while (0)
                                   ^
   drivers/mmc/host/dw_mmc.c:3574:12: note: Field 'slot' is null
           if (host->slot && host->slot->mmc->pm_flags & MMC_PM_KEEP_POWER)
                     ^
   drivers/mmc/host/dw_mmc.c:3574:17: note: Left side of '&&' is false
           if (host->slot && host->slot->mmc->pm_flags & MMC_PM_KEEP_POWER)
                          ^
   drivers/mmc/host/dw_mmc.c:3581:23: note: Access to field 'mmc' results in a dereference of a null pointer (loaded from field 'slot')
           if (sdio_irq_claimed(host->slot->mmc))
                                ^     ~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   net/mac80211/mesh.c:1004:3: warning: Value stored to 'pos' is never read [clang-analyzer-deadcode.DeadStores]
                   pos += 2;
                   ^      ~
   net/mac80211/mesh.c:1004:3: note: Value stored to 'pos' is never read
                   pos += 2;
                   ^      ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> net/mac80211/mesh_pathtbl.c:616:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:616:24: note: Value stored to 'cache' during its initialization is never read
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:631:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:631:24: note: Value stored to 'cache' during its initialization is never read
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:646:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:646:24: note: Value stored to 'cache' during its initialization is never read
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   include/asm-generic/bitops/generic-non-atomic.h:128:16: warning: Array access (from variable 'addr') results in a null pointer dereference [clang-analyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   net/bluetooth/hci_sync.c:6197:9: note: Calling 'hci_cmd_sync_queue'
           return hci_cmd_sync_queue(hdev, _update_adv_data_sync,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_sync.c:689:6: note: Left side of '&&' is true
           if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
               ^
   include/net/bluetooth/hci_core.h:822:48: note: expanded from macro 'hci_dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->dev_flags)
                                                  ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   net/bluetooth/hci_sync.c:689:6: note: Assuming field 'dev_flags' is equal to 0
           if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
               ^
   include/net/bluetooth/hci_core.h:822:48: note: expanded from macro 'hci_dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->dev_flags)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_sync.c:689:6: note: Left side of '&&' is false
           if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
               ^
   include/net/bluetooth/hci_core.h:822:48: note: expanded from macro 'hci_dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->dev_flags)
                                                  ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   net/bluetooth/hci_sync.c:689:6: note: Passing null pointer value via 2nd parameter 'addr'
           if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
               ^
   include/net/bluetooth/hci_core.h:822:63: note: expanded from macro 'hci_dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->dev_flags)
                                                  ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   net/bluetooth/hci_sync.c:689:6: note: Calling 'generic_test_bit'
           if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
               ^
   include/net/bluetooth/hci_core.h:822:48: note: expanded from macro 'hci_dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->dev_flags)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:35: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:14:20: note: expanded from macro '_test_bit'
   #define _test_bit               arch_test_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:15:23: note: expanded from macro 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:128:16: note: Array access (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   net/bluetooth/hci_sync.c:2367:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return err;
           ^
   net/bluetooth/hci_sync.c:5989:6: note: Assuming field 'role' is equal to HCI_ROLE_SLAVE
           if (conn->role == HCI_ROLE_SLAVE) {

vim +/cache +616 net/mac80211/mesh_pathtbl.c

d5edb9ae8d5687 Felix Fietkau 2023-03-14  612  
d5edb9ae8d5687 Felix Fietkau 2023-03-14  613  void mesh_fast_tx_flush_mpath(struct mesh_path *mpath)
d5edb9ae8d5687 Felix Fietkau 2023-03-14  614  {
d5edb9ae8d5687 Felix Fietkau 2023-03-14  615  	struct ieee80211_sub_if_data *sdata = mpath->sdata;
d5edb9ae8d5687 Felix Fietkau 2023-03-14 @616  	struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
d5edb9ae8d5687 Felix Fietkau 2023-03-14  617  	struct ieee80211_mesh_fast_tx *entry;
d5edb9ae8d5687 Felix Fietkau 2023-03-14  618  	struct hlist_node *n;
d5edb9ae8d5687 Felix Fietkau 2023-03-14  619  
d5edb9ae8d5687 Felix Fietkau 2023-03-14  620  	cache = &sdata->u.mesh.tx_cache;
d5edb9ae8d5687 Felix Fietkau 2023-03-14  621  	spin_lock_bh(&cache->walk_lock);
d5edb9ae8d5687 Felix Fietkau 2023-03-14  622  	hlist_for_each_entry_safe(entry, n, &cache->walk_head, walk_list)
d5edb9ae8d5687 Felix Fietkau 2023-03-14  623  		if (entry->mpath == mpath)
d5edb9ae8d5687 Felix Fietkau 2023-03-14  624  			mesh_fast_tx_entry_free(cache, entry);
d5edb9ae8d5687 Felix Fietkau 2023-03-14  625  	spin_unlock_bh(&cache->walk_lock);
d5edb9ae8d5687 Felix Fietkau 2023-03-14  626  }
d5edb9ae8d5687 Felix Fietkau 2023-03-14  627  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
