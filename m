Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B77D186E
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679827961; x=1711363961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g3PtPx6Qu4FFnE9RrRbxWHRrLsKsRFqcCAxD1rT69dk=;
  b=GP3/02CR3rWOMLhIiSPjFJOndiGF0NV+r9JsNnryIsjJZMWF4XSNV/k/
   R9WonTUDmiiK8H+CY9Bfmq/D1rJ9wRkJs6Rzdyx/ZPC6MXswanqM0g6hB
   xfPmsJZzxVR6UAKWxETqiKcHhZZuv2TNEgunJieC1Ec3BPfDjXL4WUqvY
   PcarRmzBbD6E1BhkgmALfVxyb0+I4udBonPt9y4yRaUb+mRJgV7ek2fZQ
   dQu5V89LeEUlxt40xmzmResEX2jhJsRRvPircAaCh8n89tbosM/JWIadD
   abFFtn4eVzxNJ74Uy7kJDsf3HEgPICctyupXAboauP/bZuG32L7DWTtFt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="404994148"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="404994148"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 03:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="685687793"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="685687793"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Mar 2023 03:52:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgNzJ-000H4B-0R;
	Sun, 26 Mar 2023 10:52:37 +0000
Date: Sun, 26 Mar 2023 18:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvalo-ath:pending 5/49]
 drivers/net/wireless/legacy/rndis_wlan.c:3437:2: warning: Value stored to
 'retval' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303261838.mGRpwF0r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wireless/legacy/rndis_wlan.c:3437:2: warning: Value stored to 'retval' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k@lists.infradead.org
TO: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   d90137a547f80c39d755e9b88e049cc4b17a388f
commit: 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec [5/49] wifi: move raycs, wl3501 and rndis_wlan to legacy directory
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: riscv-randconfig-c006-20230322 (https://download.01.org/0day-ci/archive/20230326/202303261838.mGRpwF0r-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
        git fetch --no-tags kvalo-ath pending
        git checkout 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303261838.mGRpwF0r-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/extcon/extcon-sm5502.c:24:8: warning: Excessive padding in 'struct muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name, irq, virq, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-sm5502.c:24:8: note: Excessive padding in 'struct muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name, irq, virq, consider reordering the fields or adding explicit padding members
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/media/firewire/firedtv-avc.c:1122:2: warning: Value stored to 'pmt_cmd_id' is never read [clang-analyzer-deadcode.DeadStores]
           pmt_cmd_id = msg[6];
           ^            ~~~~~~
   drivers/media/firewire/firedtv-avc.c:1122:2: note: Value stored to 'pmt_cmd_id' is never read
           pmt_cmd_id = msg[6];
           ^            ~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/wireless/zydas/zd1201.c:1239:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(nick, "zd1201");
           ^~~~~~
   drivers/net/wireless/zydas/zd1201.c:1239:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(nick, "zd1201");
           ^~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/net/wireless/legacy/rndis_wlan.c:3437:2: warning: Value stored to 'retval' is never read [clang-analyzer-deadcode.DeadStores]
           retval = rndis_set_oid(usbdev,
           ^        ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/legacy/rndis_wlan.c:3437:2: note: Value stored to 'retval' is never read
           retval = rndis_set_oid(usbdev,
           ^        ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/net/virtio_net.c:467:2: warning: Value stored to 'buf' is never read [clang-analyzer-deadcode.DeadStores]
           buf = p;
           ^     ~
   drivers/net/virtio_net.c:467:2: note: Value stored to 'buf' is never read
           buf = p;
           ^     ~
   drivers/net/virtio_net.c:471:2: warning: Value stored to 'tailroom' is never read [clang-analyzer-deadcode.DeadStores]
           tailroom = truesize - hdr_padded_len - len;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/virtio_net.c:471:2: note: Value stored to 'tailroom' is never read
           tailroom = truesize - hdr_padded_len - len;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/virtio_net.c:473:2: warning: Value stored to 'shinfo_size' is never read [clang-analyzer-deadcode.DeadStores]
           shinfo_size = SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
           ^
   drivers/net/virtio_net.c:473:2: note: Value stored to 'shinfo_size' is never read
   drivers/net/virtio_net.c:1065:25: warning: Access to field 'nr_frags' results in a dereference of an undefined pointer value (loaded from variable 'shinfo') [clang-analyzer-core.NullDereference]
                   frag = &shinfo->frags[shinfo->nr_frags++];
                                         ^~~~~~
   drivers/net/virtio_net.c:1006:2: note: 'shinfo' declared without an initial value
           struct skb_shared_info *shinfo;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/virtio_net.c:1017:6: note: Assuming the condition is false
           if (!*num_buf)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/net/virtio_net.c:1017:2: note: '?' condition is false
           if (!*num_buf)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/net/virtio_net.c:1017:2: note: '?' condition is false
           if (!*num_buf)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   drivers/net/virtio_net.c:1017:2: note: Taking false branch
           if (!*num_buf)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/virtio_net.c:1020:6: note: Assuming the condition is false
           if (*num_buf > 1) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/net/virtio_net.c:1020:2: note: '?' condition is false
           if (*num_buf > 1) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/net/virtio_net.c:1020:2: note: '?' condition is false
           if (*num_buf > 1) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'

vim +/retval +3437 drivers/net/wireless/legacy/rndis_wlan.c

23d12e2bdd4f73 drivers/net/wireless/rndis_wlan.c David S. Miller  2009-03-25  3383  
582241a08409c8 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-04  3384  static int rndis_wlan_bind(struct usbnet *usbdev, struct usb_interface *intf)
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3385  {
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3386  	struct wiphy *wiphy;
582241a08409c8 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-04  3387  	struct rndis_wlan_private *priv;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3388  	int retval, len;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3389  	__le32 tmp;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3390  
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3391  	/* allocate wiphy and rndis private data
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3392  	 * NOTE: We only support a single virtual interface, so wiphy
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3393  	 * and wireless_dev are somewhat synonymous for this device.
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3394  	 */
582241a08409c8 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-04  3395  	wiphy = wiphy_new(&rndis_config_ops, sizeof(struct rndis_wlan_private));
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3396  	if (!wiphy)
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3397  		return -ENOMEM;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3398  
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3399  	priv = wiphy_priv(wiphy);
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3400  	usbdev->net->ieee80211_ptr = &priv->wdev;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3401  	priv->wdev.wiphy = wiphy;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3402  	priv->wdev.iftype = NL80211_IFTYPE_STATION;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3403  
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3404  	/* These have to be initialized before calling generic_rndis_bind().
582241a08409c8 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-04  3405  	 * Otherwise we'll be in big trouble in rndis_wlan_early_init().
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3406  	 */
a19d7292dc7f1c drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-06-02  3407  	usbdev->driver_priv = priv;
a19d7292dc7f1c drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-06-02  3408  	priv->usbdev = usbdev;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3409  
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3410  	mutex_init(&priv->command_lock);
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3411  
8d4d99ae89a884 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3412  	/* because rndis_command() sleeps we need to use workqueue */
8d4d99ae89a884 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3413  	priv->workqueue = create_singlethread_workqueue("rndis_wlan");
9dc7efd3978aa6 drivers/net/wireless/rndis_wlan.c Pan Bian         2017-04-24  3414  	if (!priv->workqueue) {
9dc7efd3978aa6 drivers/net/wireless/rndis_wlan.c Pan Bian         2017-04-24  3415  		wiphy_free(wiphy);
9dc7efd3978aa6 drivers/net/wireless/rndis_wlan.c Pan Bian         2017-04-24  3416  		return -ENOMEM;
9dc7efd3978aa6 drivers/net/wireless/rndis_wlan.c Pan Bian         2017-04-24  3417  	}
582241a08409c8 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-04  3418  	INIT_WORK(&priv->work, rndis_wlan_worker);
305e243e6868eb drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-08-28  3419  	INIT_DELAYED_WORK(&priv->dev_poller_work, rndis_device_poller);
8d4d99ae89a884 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3420  	INIT_DELAYED_WORK(&priv->scan_work, rndis_get_scan_results);
8d4d99ae89a884 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3421  
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3422  	/* try bind rndis_host */
a19d7292dc7f1c drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-06-02  3423  	retval = generic_rndis_bind(usbdev, intf, FLAG_RNDIS_PHYM_WIRELESS);
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3424  	if (retval < 0)
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3425  		goto fail;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3426  
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3427  	/* generic_rndis_bind set packet filter to multicast_all+
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3428  	 * promisc mode which doesn't work well for our devices (device
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3429  	 * picks up rssi to closest station instead of to access point).
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3430  	 *
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3431  	 * rndis_host wants to avoid all OID as much as possible
582241a08409c8 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-04  3432  	 * so do promisc/multicast handling in rndis_wlan.
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3433  	 */
582241a08409c8 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-04  3434  	usbdev->net->netdev_ops = &rndis_wlan_netdev_ops;
23d12e2bdd4f73 drivers/net/wireless/rndis_wlan.c David S. Miller  2009-03-25  3435  
7390e8b0dee778 drivers/net/wireless/rndis_wlan.c Linus Walleij    2012-05-11  3436  	tmp = cpu_to_le32(RNDIS_PACKET_TYPE_DIRECTED | RNDIS_PACKET_TYPE_BROADCAST);
7390e8b0dee778 drivers/net/wireless/rndis_wlan.c Linus Walleij    2012-05-11 @3437  	retval = rndis_set_oid(usbdev,
470f16c83ce5e4 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2012-05-11  3438  			       RNDIS_OID_GEN_CURRENT_PACKET_FILTER,
7390e8b0dee778 drivers/net/wireless/rndis_wlan.c Linus Walleij    2012-05-11  3439  			       &tmp, sizeof(tmp));
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3440  
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3441  	len = sizeof(tmp);
7390e8b0dee778 drivers/net/wireless/rndis_wlan.c Linus Walleij    2012-05-11  3442  	retval = rndis_query_oid(usbdev,
470f16c83ce5e4 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2012-05-11  3443  				 RNDIS_OID_802_3_MAXIMUM_LIST_SIZE,
7390e8b0dee778 drivers/net/wireless/rndis_wlan.c Linus Walleij    2012-05-11  3444  				 &tmp, &len);
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3445  	priv->multicast_size = le32_to_cpu(tmp);
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3446  	if (retval < 0 || priv->multicast_size < 0)
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3447  		priv->multicast_size = 0;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3448  	if (priv->multicast_size > 0)
a19d7292dc7f1c drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-06-02  3449  		usbdev->net->flags |= IFF_MULTICAST;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3450  	else
a19d7292dc7f1c drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-06-02  3451  		usbdev->net->flags &= ~IFF_MULTICAST;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3452  
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3453  	/* fill-out wiphy structure and register w/ cfg80211 */
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3454  	memcpy(wiphy->perm_addr, usbdev->net->dev_addr, ETH_ALEN);
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3455  	wiphy->privid = rndis_wiphy_privid;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3456  	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION)
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3457  					| BIT(NL80211_IFTYPE_ADHOC);
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3458  	wiphy->max_scan_ssids = 1;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3459  
4a7f13eef50801 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-08-26  3460  	/* TODO: fill-out band/encr information based on priv->caps */
0308383f9591c9 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2010-03-04  3461  	rndis_wlan_get_caps(usbdev, wiphy);
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3462  
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3463  	memcpy(priv->channels, rndis_channels, sizeof(rndis_channels));
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3464  	memcpy(priv->rates, rndis_rates, sizeof(rndis_rates));
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3465  	priv->band.channels = priv->channels;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3466  	priv->band.n_channels = ARRAY_SIZE(rndis_channels);
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3467  	priv->band.bitrates = priv->rates;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3468  	priv->band.n_bitrates = ARRAY_SIZE(rndis_rates);
57fbcce37be7c1 drivers/net/wireless/rndis_wlan.c Johannes Berg    2016-04-12  3469  	wiphy->bands[NL80211_BAND_2GHZ] = &priv->band;
4d2a369ec09167 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-03-26  3470  	wiphy->signal_type = CFG80211_SIGNAL_TYPE_UNSPEC;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3471  
4a7f13eef50801 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-08-26  3472  	memcpy(priv->cipher_suites, rndis_cipher_suites,
4a7f13eef50801 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-08-26  3473  						sizeof(rndis_cipher_suites));
4a7f13eef50801 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-08-26  3474  	wiphy->cipher_suites = priv->cipher_suites;
4a7f13eef50801 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-08-26  3475  	wiphy->n_cipher_suites = ARRAY_SIZE(rndis_cipher_suites);
4a7f13eef50801 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-08-26  3476  
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3477  	set_wiphy_dev(wiphy, &usbdev->udev->dev);
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3478  
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3479  	if (wiphy_register(wiphy)) {
eb1a685e07310b drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3480  		retval = -ENODEV;
eb1a685e07310b drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3481  		goto fail;
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3482  	}
5c8fa4f7e7fcce drivers/net/wireless/rndis_wlan.c John W. Linville 2009-03-26  3483  
a19d7292dc7f1c drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-06-02  3484  	set_default_iw_params(usbdev);
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3485  
40d70dd12200ff drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2010-12-21  3486  	priv->power_mode = -1;
40d70dd12200ff drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2010-12-21  3487  
d75ec2b7ec27fd drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-16  3488  	/* set default rts/frag */
d75ec2b7ec27fd drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-16  3489  	rndis_set_wiphy_params(wiphy,
d75ec2b7ec27fd drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-16  3490  			WIPHY_PARAM_FRAG_THRESHOLD | WIPHY_PARAM_RTS_THRESHOLD);
d75ec2b7ec27fd drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-06-16  3491  
21b27beca73ad7 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2010-12-21  3492  	/* turn radio off on init */
21b27beca73ad7 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2010-12-21  3493  	priv->radio_on = false;
21b27beca73ad7 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2010-12-21  3494  	disassociate(usbdev, false);
a19d7292dc7f1c drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-06-02  3495  	netif_carrier_off(usbdev->net);
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3496  
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3497  	return 0;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3498  
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3499  fail:
305e243e6868eb drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-08-28  3500  	cancel_delayed_work_sync(&priv->dev_poller_work);
8d4d99ae89a884 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3501  	cancel_delayed_work_sync(&priv->scan_work);
8d4d99ae89a884 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3502  	cancel_work_sync(&priv->work);
8d4d99ae89a884 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3503  	destroy_workqueue(priv->workqueue);
8d4d99ae89a884 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3504  
eb1a685e07310b drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2009-04-21  3505  	wiphy_free(wiphy);
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3506  	return retval;
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3507  }
bf164cc054d568 drivers/net/wireless/rndis_wlan.c Jussi Kivilinna  2008-01-26  3508  

:::::: The code at line 3437 was first introduced by commit
:::::: 7390e8b0dee778b0a964337558990a91094e679a usb/net: rndis: inline the cpu_to_le32() macro

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
