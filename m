Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2611FD3
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678008623; x=1709544623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jKPxnjXnULjGOeL49SXzgjf/8bOEkx1vY5RCxk81bG0=;
  b=lBfyhg5yY0imQI7cmFVpJ3+Lo79P9TgthXjNg2STwEDRagZNfPUESYL3
   tolY87Wl3rByzAdzMXwrb4pDKJbmz/dz9XtS5mRIKnXfrqkwUtNqXqt6+
   PdYSJkPsiJbg7ShT2kcfwX4tXyKVF6rtLI/cHIIn8dPbwraKwv48i90LU
   2nNcrn0mZAtNcaURgKLq6iShat4kcPD2DZXobJhBPGBHClu2FyrBzqn1Q
   YKr0p9V2r7dLlPtxKSR0fnJZIIUWB5pHy2TuHWMKC3LivVGa4BOYPTNO0
   ZpTRMJKhhR2Mg3EF9Jg+EE4aB43urgPAznXqVBAmmCk5V6T5gm4r918ZL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="337676663"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="337676663"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 01:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="785822969"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="785822969"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Mar 2023 01:30:21 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYkhA-0002eU-1X;
	Sun, 05 Mar 2023 09:30:20 +0000
Date: Sun, 5 Mar 2023 17:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/engleder/tsnep_rxnfc.c:186:21: warning: Value
 stored to 'dev' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303051700.dsC3gV4J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/engleder/tsnep_rxnfc.c:186:21: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gerhard Engleder <gerhard@engleder-embedded.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b01fe98d34f3bed944a93bd8119fed80c856fad8
commit: 308ce1426509c18b4203dcaa38b9da858312a765 tsnep: Add EtherType RX flow classification support
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20230302 (https://download.01.org/0day-ci/archive/20230305/202303051700.dsC3gV4J-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=308ce1426509c18b4203dcaa38b9da858312a765
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 308ce1426509c18b4203dcaa38b9da858312a765
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303051700.dsC3gV4J-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           strcpy(card->driver, f_midi_longname);
           ^~~~~~
   drivers/usb/gadget/function/f_midi.c:822:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->longname, f_midi_longname);
           ^~~~~~
   drivers/usb/gadget/function/f_midi.c:822:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(card->longname, f_midi_longname);
           ^~~~~~
   drivers/usb/gadget/function/f_midi.c:823:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, f_midi_shortname);
           ^~~~~~
   drivers/usb/gadget/function/f_midi.c:823:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(card->shortname, f_midi_shortname);
           ^~~~~~
   drivers/usb/gadget/function/f_midi.c:835:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, card->shortname);
           ^~~~~~
   drivers/usb/gadget/function/f_midi.c:835:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(rmidi->name, card->shortname);
           ^~~~~~
   1 warning generated.
   drivers/usb/gadget/function/f_printer.c:385:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           DBG(dev, "printer_close\n");
           ^
   include/linux/usb/composite.h:623:11: note: expanded from macro 'DBG'
           dev_dbg(&(d)->gadget->dev , fmt , ## args)
           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:158:25: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:22: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                      ^~~
   drivers/usb/gadget/function/f_printer.c:377:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&dev->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/usb/gadget/function/f_printer.c:377:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&dev->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/usb/gadget/function/f_printer.c:384:2: note: Calling 'kref_put'
           kref_put(&dev->kref, printer_dev_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'printer_dev_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/gadget/function/f_printer.c:228:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/gadget/function/f_printer.c:384:2: note: Returning; memory was released
           kref_put(&dev->kref, printer_dev_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_printer.c:385:2: note: Loop condition is false.  Exiting loop
           DBG(dev, "printer_close\n");
           ^
   include/linux/usb/composite.h:623:2: note: expanded from macro 'DBG'
           dev_dbg(&(d)->gadget->dev , fmt , ## args)
           ^
   include/linux/dev_printk.h:158:2: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:128:3: note: expanded from macro 'dev_printk'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:431:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:410:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/usb/gadget/function/f_printer.c:385:2: note: Use of memory after it is freed
           DBG(dev, "printer_close\n");
           ^
   include/linux/usb/composite.h:623:11: note: expanded from macro 'DBG'
           dev_dbg(&(d)->gadget->dev , fmt , ## args)
           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:158:25: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:22: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                      ^~~
   2 warnings generated.
>> drivers/net/ethernet/engleder/tsnep_rxnfc.c:186:21: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct net_device *dev = adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/engleder/tsnep_rxnfc.c:186:21: note: Value stored to 'dev' during its initialization is never read
           struct net_device *dev = adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/engleder/tsnep_rxnfc.c:204:21: warning: Value stored to 'netdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct net_device *netdev = adapter->netdev;
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/engleder/tsnep_rxnfc.c:204:21: note: Value stored to 'netdev' during its initialization is never read
           struct net_device *netdev = adapter->netdev;
                              ^~~~~~   ~~~~~~~~~~~~~~~
   6 warnings generated.
   drivers/net/ethernet/freescale/fec_main.c:1630:27: warning: Access to field 'ts' results in a dereference of a null pointer (loaded from variable 'ebdp') [clang-analyzer-core.NullDereference]
                           fec_enet_hwtstamp(fep, fec32_to_cpu(ebdp->ts),
                                                  ^
   drivers/net/ethernet/freescale/fec.h:207:22: note: expanded from macro 'fec32_to_cpu'
   #define fec32_to_cpu le32_to_cpu
                        ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:50: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^
   drivers/net/ethernet/freescale/fec_main.c:1748:11: note: Calling 'fec_enet_rx'
                   done += fec_enet_rx(ndev, budget - done);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/fec_main.c:1701:35: note: Assuming 'i' is >= 0
           for (i = fep->num_rx_queues - 1; i >= 0; i--)
                                            ^~~~~~
   drivers/net/ethernet/freescale/fec_main.c:1701:2: note: Loop condition is true.  Entering loop body
           for (i = fep->num_rx_queues - 1; i >= 0; i--)
           ^
   drivers/net/ethernet/freescale/fec_main.c:1702:11: note: Calling 'fec_enet_rx_queue'
                   done += fec_enet_rx_queue(ndev, budget - done, i);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/fec_main.c:1533:9: note: Assuming the condition is true
           while (!((status = fec16_to_cpu(bdp->cbd_sc)) & BD_ENET_RX_EMPTY)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/fec_main.c:1533:2: note: Loop condition is true.  Entering loop body
           while (!((status = fec16_to_cpu(bdp->cbd_sc)) & BD_ENET_RX_EMPTY)) {
           ^
   drivers/net/ethernet/freescale/fec_main.c:1535:7: note: Assuming 'pkt_received' is < 'budget'
                   if (pkt_received >= budget)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/fec_main.c:1535:3: note: Taking false branch
                   if (pkt_received >= budget)
                   ^
   drivers/net/ethernet/freescale/fec_main.c:1539:3: note: Loop condition is false.  Exiting loop
                   writel(FEC_ENET_RXF_GET(queue_id), fep->hwp + FEC_IEVENT);
                   ^
   arch/arm/include/asm/io.h:290:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:168:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/net/ethernet/freescale/fec_main.c:1539:10: note: Assuming 'queue_id' is not equal to 0
                   writel(FEC_ENET_RXF_GET(queue_id), fep->hwp + FEC_IEVENT);
                          ^
   drivers/net/ethernet/freescale/fec.h:383:31: note: expanded from macro 'FEC_ENET_RXF_GET'
   #define FEC_ENET_RXF_GET(X)     (((X) == 0) ? FEC_ENET_RXF_0 :  \
                                     ^
   arch/arm/include/asm/io.h:290:51: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                                 ~~~~~~~~~~~~~~~^~~~
   arch/arm/include/asm/io.h:282:68: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                              ~~~~~~~~~~~~^~
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/net/ethernet/freescale/fec_main.c:1539:10: note: '?' condition is false
                   writel(FEC_ENET_RXF_GET(queue_id), fep->hwp + FEC_IEVENT);
                          ^
   drivers/net/ethernet/freescale/fec.h:383:30: note: expanded from macro 'FEC_ENET_RXF_GET'
   #define FEC_ENET_RXF_GET(X)     (((X) == 0) ? FEC_ENET_RXF_0 :  \
                                    ^
   drivers/net/ethernet/freescale/fec_main.c:1539:10: note: Assuming 'queue_id' is not equal to 1
                   writel(FEC_ENET_RXF_GET(queue_id), fep->hwp + FEC_IEVENT);
                          ^
   drivers/net/ethernet/freescale/fec.h:384:7: note: expanded from macro 'FEC_ENET_RXF_GET'
                                   (((X) == 1) ? FEC_ENET_RXF_1 :  \
                                     ^
   arch/arm/include/asm/io.h:290:51: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                                 ~~~~~~~~~~~~~~~^~~~
   arch/arm/include/asm/io.h:282:68: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                              ~~~~~~~~~~~~^~
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/net/ethernet/freescale/fec_main.c:1539:10: note: '?' condition is false
                   writel(FEC_ENET_RXF_GET(queue_id), fep->hwp + FEC_IEVENT);
                          ^
   drivers/net/ethernet/freescale/fec.h:384:6: note: expanded from macro 'FEC_ENET_RXF_GET'
                                   (((X) == 1) ? FEC_ENET_RXF_1 :  \
                                    ^
   drivers/net/ethernet/freescale/fec_main.c:1543:7: note: Assuming the condition is false
                   if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_NO |
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/fec_main.c:1543:3: note: Taking false branch
                   if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_NO |
                   ^
   drivers/net/ethernet/freescale/fec_main.c:1579:18: note: Calling 'fec_enet_copybreak'

vim +/dev +186 drivers/net/ethernet/engleder/tsnep_rxnfc.c

308ce1426509c1 Gerhard Engleder 2022-09-27  182  
308ce1426509c1 Gerhard Engleder 2022-09-27  183  static int tsnep_rxnfc_check_rule(struct tsnep_adapter *adapter,
308ce1426509c1 Gerhard Engleder 2022-09-27  184  				  struct tsnep_rxnfc_rule *rule)
308ce1426509c1 Gerhard Engleder 2022-09-27  185  {
308ce1426509c1 Gerhard Engleder 2022-09-27 @186  	struct net_device *dev = adapter->netdev;
308ce1426509c1 Gerhard Engleder 2022-09-27  187  	struct tsnep_rxnfc_rule *tmp;
308ce1426509c1 Gerhard Engleder 2022-09-27  188  
308ce1426509c1 Gerhard Engleder 2022-09-27  189  	list_for_each_entry(tmp, &adapter->rxnfc_rules, list) {
308ce1426509c1 Gerhard Engleder 2022-09-27  190  		if (!memcmp(&rule->filter, &tmp->filter, sizeof(rule->filter)) &&
308ce1426509c1 Gerhard Engleder 2022-09-27  191  		    tmp->location != rule->location) {
308ce1426509c1 Gerhard Engleder 2022-09-27  192  			netdev_dbg(dev, "rule already exists\n");
308ce1426509c1 Gerhard Engleder 2022-09-27  193  
308ce1426509c1 Gerhard Engleder 2022-09-27  194  			return -EEXIST;
308ce1426509c1 Gerhard Engleder 2022-09-27  195  		}
308ce1426509c1 Gerhard Engleder 2022-09-27  196  	}
308ce1426509c1 Gerhard Engleder 2022-09-27  197  
308ce1426509c1 Gerhard Engleder 2022-09-27  198  	return 0;
308ce1426509c1 Gerhard Engleder 2022-09-27  199  }
308ce1426509c1 Gerhard Engleder 2022-09-27  200  
308ce1426509c1 Gerhard Engleder 2022-09-27  201  int tsnep_rxnfc_add_rule(struct tsnep_adapter *adapter,
308ce1426509c1 Gerhard Engleder 2022-09-27  202  			 struct ethtool_rxnfc *cmd)
308ce1426509c1 Gerhard Engleder 2022-09-27  203  {
308ce1426509c1 Gerhard Engleder 2022-09-27 @204  	struct net_device *netdev = adapter->netdev;
308ce1426509c1 Gerhard Engleder 2022-09-27  205  	struct ethtool_rx_flow_spec *fsp =
308ce1426509c1 Gerhard Engleder 2022-09-27  206  		(struct ethtool_rx_flow_spec *)&cmd->fs;
308ce1426509c1 Gerhard Engleder 2022-09-27  207  	struct tsnep_rxnfc_rule *rule, *old_rule;
308ce1426509c1 Gerhard Engleder 2022-09-27  208  	int retval;
308ce1426509c1 Gerhard Engleder 2022-09-27  209  
308ce1426509c1 Gerhard Engleder 2022-09-27  210  	/* only EtherType is supported */
308ce1426509c1 Gerhard Engleder 2022-09-27  211  	if (fsp->flow_type != ETHER_FLOW ||
308ce1426509c1 Gerhard Engleder 2022-09-27  212  	    !is_zero_ether_addr(fsp->m_u.ether_spec.h_dest) ||
308ce1426509c1 Gerhard Engleder 2022-09-27  213  	    !is_zero_ether_addr(fsp->m_u.ether_spec.h_source) ||
308ce1426509c1 Gerhard Engleder 2022-09-27  214  	    fsp->m_u.ether_spec.h_proto != ETHER_TYPE_FULL_MASK) {
308ce1426509c1 Gerhard Engleder 2022-09-27  215  		netdev_dbg(netdev, "only ethernet protocol is supported\n");
308ce1426509c1 Gerhard Engleder 2022-09-27  216  
308ce1426509c1 Gerhard Engleder 2022-09-27  217  		return -EOPNOTSUPP;
308ce1426509c1 Gerhard Engleder 2022-09-27  218  	}
308ce1426509c1 Gerhard Engleder 2022-09-27  219  
308ce1426509c1 Gerhard Engleder 2022-09-27  220  	if (fsp->ring_cookie >
308ce1426509c1 Gerhard Engleder 2022-09-27  221  	    (TSNEP_RX_ASSIGN_QUEUE_MASK >> TSNEP_RX_ASSIGN_QUEUE_SHIFT)) {
308ce1426509c1 Gerhard Engleder 2022-09-27  222  		netdev_dbg(netdev, "invalid action\n");
308ce1426509c1 Gerhard Engleder 2022-09-27  223  
308ce1426509c1 Gerhard Engleder 2022-09-27  224  		return -EINVAL;
308ce1426509c1 Gerhard Engleder 2022-09-27  225  	}
308ce1426509c1 Gerhard Engleder 2022-09-27  226  
308ce1426509c1 Gerhard Engleder 2022-09-27  227  	if (fsp->location != RX_CLS_LOC_ANY &&
308ce1426509c1 Gerhard Engleder 2022-09-27  228  	    fsp->location >= adapter->rxnfc_max) {
308ce1426509c1 Gerhard Engleder 2022-09-27  229  		netdev_dbg(netdev, "invalid location\n");
308ce1426509c1 Gerhard Engleder 2022-09-27  230  
308ce1426509c1 Gerhard Engleder 2022-09-27  231  		return -EINVAL;
308ce1426509c1 Gerhard Engleder 2022-09-27  232  	}
308ce1426509c1 Gerhard Engleder 2022-09-27  233  
308ce1426509c1 Gerhard Engleder 2022-09-27  234  	rule = kzalloc(sizeof(*rule), GFP_KERNEL);
308ce1426509c1 Gerhard Engleder 2022-09-27  235  	if (!rule)
308ce1426509c1 Gerhard Engleder 2022-09-27  236  		return -ENOMEM;
308ce1426509c1 Gerhard Engleder 2022-09-27  237  
308ce1426509c1 Gerhard Engleder 2022-09-27  238  	mutex_lock(&adapter->rxnfc_lock);
308ce1426509c1 Gerhard Engleder 2022-09-27  239  
308ce1426509c1 Gerhard Engleder 2022-09-27  240  	if (fsp->location == RX_CLS_LOC_ANY) {
308ce1426509c1 Gerhard Engleder 2022-09-27  241  		retval = tsnep_rxnfc_find_location(adapter);
308ce1426509c1 Gerhard Engleder 2022-09-27  242  		if (retval < 0)
308ce1426509c1 Gerhard Engleder 2022-09-27  243  			goto failed;
308ce1426509c1 Gerhard Engleder 2022-09-27  244  		fsp->location = retval;
308ce1426509c1 Gerhard Engleder 2022-09-27  245  	}
308ce1426509c1 Gerhard Engleder 2022-09-27  246  
308ce1426509c1 Gerhard Engleder 2022-09-27  247  	tsnep_rxnfc_init_rule(rule, fsp);
308ce1426509c1 Gerhard Engleder 2022-09-27  248  
308ce1426509c1 Gerhard Engleder 2022-09-27  249  	retval = tsnep_rxnfc_check_rule(adapter, rule);
308ce1426509c1 Gerhard Engleder 2022-09-27  250  	if (retval)
308ce1426509c1 Gerhard Engleder 2022-09-27  251  		goto failed;
308ce1426509c1 Gerhard Engleder 2022-09-27  252  
308ce1426509c1 Gerhard Engleder 2022-09-27  253  	old_rule = tsnep_get_rule(adapter, fsp->location);
308ce1426509c1 Gerhard Engleder 2022-09-27  254  	if (old_rule)
308ce1426509c1 Gerhard Engleder 2022-09-27  255  		tsnep_delete_rule(adapter, old_rule);
308ce1426509c1 Gerhard Engleder 2022-09-27  256  
308ce1426509c1 Gerhard Engleder 2022-09-27  257  	tsnep_add_rule(adapter, rule);
308ce1426509c1 Gerhard Engleder 2022-09-27  258  
308ce1426509c1 Gerhard Engleder 2022-09-27  259  	mutex_unlock(&adapter->rxnfc_lock);
308ce1426509c1 Gerhard Engleder 2022-09-27  260  
308ce1426509c1 Gerhard Engleder 2022-09-27  261  	return 0;
308ce1426509c1 Gerhard Engleder 2022-09-27  262  
308ce1426509c1 Gerhard Engleder 2022-09-27  263  failed:
308ce1426509c1 Gerhard Engleder 2022-09-27  264  	mutex_unlock(&adapter->rxnfc_lock);
308ce1426509c1 Gerhard Engleder 2022-09-27  265  	kfree(rule);
308ce1426509c1 Gerhard Engleder 2022-09-27  266  	return retval;
308ce1426509c1 Gerhard Engleder 2022-09-27  267  }
308ce1426509c1 Gerhard Engleder 2022-09-27  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
