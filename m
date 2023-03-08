Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2E7474
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Mar 2023 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678286450; x=1709822450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0cNdgShgbLCEPiMWV7rDf7Ki7P9vkKi9CazCESgUgoQ=;
  b=kbn9MSR7ltxd5/A6s+wLrmYM/Os0XUkgXjP26lHGjo7LR3ELIMprk5XZ
   PqSOZXUjsuoDZSejYg/Zk/wf/gTl2Eb84tVKI87hzFbMQXFRLWQEih53s
   BpMtDmpb4UsJfUCB9iavVb7592cGz+SxBjUgVRfGtYrE9WCv4OgA1ylVK
   oeWLOGA8fc0wdgghm40alFEUJ+UynjeNOKWXQeem4+Qb7buN0c6DtlUkw
   3epnbGYgEN/7H7sppV2dCd7T1HWQi7spDaa4BARW1O0shw+lYOmtfg0F6
   pgQ/w6lyo8aClMickXmZP7Glu1SdXQH8A0CALg0l6+RsQAVEdMyE8tqV/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337685027"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="337685027"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 06:40:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676994099"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="676994099"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 06:40:47 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZuyE-0002BT-2f;
	Wed, 08 Mar 2023 14:40:46 +0000
Date: Wed, 8 Mar 2023 22:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/qca/qca8k-8xxx.c:1397:21: warning: Value stored to
 'priv' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303082231.H5LYcAtQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/dsa/qca/qca8k-8xxx.c:1397:21: warning: Value stored to 'priv' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christian Marangi <ansuelsmth@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Vladimir Oltean <olteanv@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63355b9884b3d1677de6bd1517cd2b8a9bf53978
commit: 027152b830434e3632ad5dd678cc5d4740358dbb net: dsa: qca8k: move mib struct to common code
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20230302 (https://download.01.org/0day-ci/archive/20230308/202303082231.H5LYcAtQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=027152b830434e3632ad5dd678cc5d4740358dbb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 027152b830434e3632ad5dd678cc5d4740358dbb
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303082231.H5LYcAtQ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:970:2: note: Taking false branch
           if (!clear_skb) {
           ^
   drivers/net/dsa/qca/qca8k-8xxx.c:977:6: note: Assuming 'read_skb' is non-null
           if (!read_skb) {
               ^~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:977:2: note: Taking false branch
           if (!read_skb) {
           ^
   drivers/net/dsa/qca/qca8k-8xxx.c:992:6: note: Assuming 'mgmt_master' is non-null
           if (!mgmt_master) {
               ^~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:992:2: note: Taking false branch
           if (!mgmt_master) {
           ^
   drivers/net/dsa/qca/qca8k-8xxx.c:1016:6: note: Assuming 'ret' is > 0
           if (ret <= 0) {
               ^~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1016:2: note: Taking false branch
           if (ret <= 0) {
           ^
   drivers/net/dsa/qca/qca8k-8xxx.c:1022:6: note: Assuming 'ack' is true
           if (!ack) {
               ^~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1022:2: note: Taking false branch
           if (!ack) {
           ^
   drivers/net/dsa/qca/qca8k-8xxx.c:1028:8: note: '__sleep_us' is equal to 0
           ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
                 ^
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeout'
           might_sleep_if((__sleep_us) != 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:193:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1028:8: note: Taking false branch
           ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
                 ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeout'
           might_sleep_if((__sleep_us) != 0); \
           ^
   include/linux/kernel.h:193:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/net/dsa/qca/qca8k-8xxx.c:1028:8: note: Loop condition is false.  Exiting loop
           ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
                 ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeout'
           might_sleep_if((__sleep_us) != 0); \
           ^
   include/linux/kernel.h:193:30: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                ^
   drivers/net/dsa/qca/qca8k-8xxx.c:1028:8: note: Left side of '&&' is false
           ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
                 ^
   include/linux/iopoll.h:43:24: note: expanded from macro 'read_poll_timeout'
           if (sleep_before_read && __sleep_us) \
                                 ^
   drivers/net/dsa/qca/qca8k-8xxx.c:1028:8: note: Loop condition is true.  Entering loop body
           ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
                 ^
   include/linux/iopoll.h:45:2: note: expanded from macro 'read_poll_timeout'
           for (;;) { \
           ^
   drivers/net/dsa/qca/qca8k-8xxx.c:1028:26: note: Calling 'qca8k_phy_eth_busy_wait'
           ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
                                   ^
   include/linux/iopoll.h:46:11: note: expanded from macro 'read_poll_timeout'
                   (val) = op(args); \
                           ^~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:924:6: note: Assuming 'ret' is <= 0
           if (ret <= 0)
               ^~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:924:2: note: Taking true branch
           if (ret <= 0)
           ^
   drivers/net/dsa/qca/qca8k-8xxx.c:925:3: note: Returning without writing to '*val'
                   return -ETIMEDOUT;
                   ^
   drivers/net/dsa/qca/qca8k-8xxx.c:1028:26: note: Returning from 'qca8k_phy_eth_busy_wait'
           ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
                                   ^
   include/linux/iopoll.h:46:11: note: expanded from macro 'read_poll_timeout'
                   (val) = op(args); \
                           ^~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1029:11: note: The left operand of '&' is a garbage value
                                   !(val & QCA8K_MDIO_MASTER_BUSY), 0,
                                         ^
   include/linux/iopoll.h:47:7: note: expanded from macro 'read_poll_timeout'
                   if (cond) \
                       ^~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1275:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(bus->id, MII_BUS_ID_SIZE, "qca8k-%d.%d",
           ^~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1275:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(bus->id, MII_BUS_ID_SIZE, "qca8k-%d.%d",
           ^~~~~~~~
>> drivers/net/dsa/qca/qca8k-8xxx.c:1397:21: warning: Value stored to 'priv' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct qca8k_priv *priv = ds->priv;
                              ^~~~   ~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1397:21: note: Value stored to 'priv' during its initialization is never read
           struct qca8k_priv *priv = ds->priv;
                              ^~~~   ~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1914:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = qca8k_rmw(priv, reg,
                   ^     ~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1914:3: note: Value stored to 'ret' is never read
                   ret = qca8k_rmw(priv, reg,
                   ^     ~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1953:3: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(data + i * ETH_GSTRING_LEN, ar8327_mib[i].name,
                   ^~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1953:3: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(data + i * ETH_GSTRING_LEN, ar8327_mib[i].name,
                   ^~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1995:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data + i, skb->data + offset, mib_len);
                   ^~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:1995:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data + i, skb->data + offset, mib_len);
                   ^~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:2679:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = regmap_update_bits(priv->regmap, QCA8K_REG_GOL_TRUNK_CTRL0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:2679:2: note: Value stored to 'ret' is never read
           ret = regmap_update_bits(priv->regmap, QCA8K_REG_GOL_TRUNK_CTRL0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 79 warnings (78 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   net/ceph/pagevec.c:98:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(page_address(pages[i]) + po, data, l);
                   ^~~~~~
   net/ceph/pagevec.c:98:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(page_address(pages[i]) + po, data, l);
                   ^~~~~~
   net/ceph/pagevec.c:121:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, page_address(pages[i]) + po, l);
                   ^~~~~~
   net/ceph/pagevec.c:121:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data, page_address(pages[i]) + po, l);
                   ^~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   net/ceph/string_table.c:46:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cs->str, str, len);
           ^~~~~~
   net/ceph/string_table.c:46:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cs->str, str, len);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   74 warnings generated.
   include/linux/ceph/decode.h:208:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           ts->tv_sec = (time64_t)le32_to_cpu(tv->tv_sec);
                      ^
   net/ceph/messenger_v1.c:1255:2: note: Taking false branch
           dout("try_read start %p state %d\n", con, con->state);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:594:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/ceph/messenger_v1.c:1256:6: note: Assuming field 'state' is not equal to CEPH_CON_S_V1_BANNER
           if (con->state != CEPH_CON_S_V1_BANNER &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1256:6: note: Left side of '&&' is true
   net/ceph/messenger_v1.c:1257:6: note: Assuming field 'state' is not equal to CEPH_CON_S_V1_CONNECT_MSG
               con->state != CEPH_CON_S_V1_CONNECT_MSG &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1256:6: note: Left side of '&&' is true
           if (con->state != CEPH_CON_S_V1_BANNER &&
               ^
   net/ceph/messenger_v1.c:1258:6: note: Assuming field 'state' is equal to CEPH_CON_S_OPEN
               con->state != CEPH_CON_S_OPEN)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1256:2: note: Taking false branch
           if (con->state != CEPH_CON_S_V1_BANNER &&
           ^
   net/ceph/messenger_v1.c:1261:9: note: Assuming field 'sock' is non-null
           BUG_ON(!con->sock);
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'

vim +/priv +1397 drivers/net/dsa/qca/qca8k-8xxx.c

db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1262  
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1263  static int
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1264  qca8k_mdio_register(struct qca8k_priv *priv)
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1265  {
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1266  	struct dsa_switch *ds = priv->ds;
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1267  	struct device_node *mdio;
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1268  	struct mii_bus *bus;
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1269  
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1270  	bus = devm_mdiobus_alloc(ds->dev);
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1271  	if (!bus)
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1272  		return -ENOMEM;
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1273  
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1274  	bus->priv = (void *)priv;
8d1af50842bf27 drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16 @1275  	snprintf(bus->id, MII_BUS_ID_SIZE, "qca8k-%d.%d",
8d1af50842bf27 drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1276  		 ds->dst->index, ds->index);
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1277  	bus->parent = ds->dev;
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1278  	bus->phy_mask = ~ds->phys_mii_mask;
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1279  	ds->slave_mii_bus = bus;
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1280  
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1281  	/* Check if the devicetree declare the port:phy mapping */
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1282  	mdio = of_get_child_by_name(priv->dev->of_node, "mdio");
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1283  	if (of_device_is_available(mdio)) {
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1284  		bus->name = "qca8k slave mii";
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1285  		bus->read = qca8k_internal_mdio_read;
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1286  		bus->write = qca8k_internal_mdio_write;
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1287  		return devm_of_mdiobus_register(priv->dev, bus, mdio);
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1288  	}
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1289  
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1290  	/* If a mapping can't be found the legacy mapping is used,
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1291  	 * using the qca8k_port_to_phy function
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1292  	 */
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1293  	bus->name = "qca8k-legacy slave mii";
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1294  	bus->read = qca8k_legacy_mdio_read;
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1295  	bus->write = qca8k_legacy_mdio_write;
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1296  	return devm_mdiobus_register(priv->dev, bus);
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1297  }
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1298  
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1299  static int
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1300  qca8k_setup_mdio_bus(struct qca8k_priv *priv)
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1301  {
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1302  	u32 internal_mdio_mask = 0, external_mdio_mask = 0, reg;
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1303  	struct device_node *ports, *port;
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1304  	phy_interface_t mode;
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1305  	int err;
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1306  
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1307  	ports = of_get_child_by_name(priv->dev->of_node, "ports");
1ee0591a1093c2 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1308  	if (!ports)
1ee0591a1093c2 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1309  		ports = of_get_child_by_name(priv->dev->of_node, "ethernet-ports");
1ee0591a1093c2 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1310  
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1311  	if (!ports)
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1312  		return -EINVAL;
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1313  
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1314  	for_each_available_child_of_node(ports, port) {
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1315  		err = of_property_read_u32(port, "reg", &reg);
f26e0cca14c949 drivers/net/dsa/qca8k.c Nishka Dasgupta     2019-08-04  1316  		if (err) {
f26e0cca14c949 drivers/net/dsa/qca8k.c Nishka Dasgupta     2019-08-04  1317  			of_node_put(port);
f26e0cca14c949 drivers/net/dsa/qca8k.c Nishka Dasgupta     2019-08-04  1318  			of_node_put(ports);
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1319  			return err;
f26e0cca14c949 drivers/net/dsa/qca8k.c Nishka Dasgupta     2019-08-04  1320  		}
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1321  
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1322  		if (!dsa_is_user_port(priv->ds, reg))
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1323  			continue;
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1324  
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1325  		of_get_phy_mode(port, &mode);
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1326  
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1327  		if (of_property_read_bool(port, "phy-handle") &&
759bafb8a32263 drivers/net/dsa/qca8k.c Christian Marangi   2021-05-14  1328  		    mode != PHY_INTERFACE_MODE_INTERNAL)
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1329  			external_mdio_mask |= BIT(reg);
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1330  		else
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1331  			internal_mdio_mask |= BIT(reg);
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1332  	}
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1333  
f26e0cca14c949 drivers/net/dsa/qca8k.c Nishka Dasgupta     2019-08-04  1334  	of_node_put(ports);
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1335  	if (!external_mdio_mask && !internal_mdio_mask) {
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1336  		dev_err(priv->dev, "no PHYs are defined.\n");
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1337  		return -EINVAL;
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1338  	}
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1339  
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1340  	/* The QCA8K_MDIO_MASTER_EN Bit, which grants access to PHYs through
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1341  	 * the MDIO_MASTER register also _disconnects_ the external MDC
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1342  	 * passthrough to the internal PHYs. It's not possible to use both
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1343  	 * configurations at the same time!
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1344  	 *
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1345  	 * Because this came up during the review process:
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1346  	 * If the external mdio-bus driver is capable magically disabling
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1347  	 * the QCA8K_MDIO_MASTER_EN and mutex/spin-locking out the qca8k's
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1348  	 * accessors for the time being, it would be possible to pull this
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1349  	 * off.
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1350  	 */
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1351  	if (!!external_mdio_mask && !!internal_mdio_mask) {
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1352  		dev_err(priv->dev, "either internal or external mdio bus configuration is supported.\n");
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1353  		return -EINVAL;
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1354  	}
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1355  
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1356  	if (external_mdio_mask) {
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1357  		/* Make sure to disable the internal mdio bus in cases
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1358  		 * a dt-overlay and driver reload changed the configuration
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1359  		 */
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1360  
8b5f3f29a81a71 drivers/net/dsa/qca8k.c Christian Marangi   2021-11-22  1361  		return regmap_clear_bits(priv->regmap, QCA8K_MDIO_MASTER_CTRL,
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1362  					 QCA8K_MDIO_MASTER_EN);
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1363  	}
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1364  
8255212e4130bd drivers/net/dsa/qca8k.c Christian Marangi   2022-04-16  1365  	return qca8k_mdio_register(priv);
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1366  }
db460c54b67fc2 drivers/net/dsa/qca8k.c Christian Lamparter 2019-03-22  1367  
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1368  static int
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1369  qca8k_setup_mac_pwr_sel(struct qca8k_priv *priv)
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1370  {
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1371  	u32 mask = 0;
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1372  	int ret = 0;
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1373  
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1374  	/* SoC specific settings for ipq8064.
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1375  	 * If more device require this consider adding
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1376  	 * a dedicated binding.
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1377  	 */
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1378  	if (of_machine_is_compatible("qcom,ipq8064"))
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1379  		mask |= QCA8K_MAC_PWR_RGMII0_1_8V;
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1380  
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1381  	/* SoC specific settings for ipq8065 */
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1382  	if (of_machine_is_compatible("qcom,ipq8065"))
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1383  		mask |= QCA8K_MAC_PWR_RGMII1_1_8V;
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1384  
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1385  	if (mask) {
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1386  		ret = qca8k_rmw(priv, QCA8K_REG_MAC_PWR_SEL,
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1387  				QCA8K_MAC_PWR_RGMII0_1_8V |
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1388  				QCA8K_MAC_PWR_RGMII1_1_8V,
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1389  				mask);
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1390  	}
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1391  
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1392  	return ret;
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1393  }
d8b6f5bae6d3b6 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1394  
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1395  static int qca8k_find_cpu_port(struct dsa_switch *ds)
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1396  {
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14 @1397  	struct qca8k_priv *priv = ds->priv;
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1398  
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1399  	/* Find the connected cpu port. Valid port are 0 or 6 */
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1400  	if (dsa_is_cpu_port(ds, 0))
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1401  		return 0;
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1402  
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1403  	dev_dbg(priv->dev, "port 0 is not the CPU port. Checking port 6");
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1404  
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1405  	if (dsa_is_cpu_port(ds, 6))
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1406  		return 6;
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1407  
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1408  	return -EINVAL;
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1409  }
3fcf734aa48248 drivers/net/dsa/qca8k.c Christian Marangi   2021-10-14  1410  

:::::: The code at line 1397 was first introduced by commit
:::::: 3fcf734aa482487df83cf8f18608438fcf59127f net: dsa: qca8k: add support for cpu port 6

:::::: TO: Ansuel Smith <ansuelsmth@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
