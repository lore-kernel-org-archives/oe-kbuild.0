Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC43C00
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678978774; x=1710514774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3BpVLafCfq8Wt05sTkmAjYmQfXCNOL7Rj/IEnliic88=;
  b=TipAgmn3zJ5ukso/pAjyNdDUkCe3i++/7/F4tu1hsy4nVMOZREqseXwq
   /sX853geUulS0y1LFrf/dWg+NzKEdX++3ceTgs/pZbI/khtgYMaGdDuXo
   YEQJU2qStCGA5pQBcc7J2nNhq2knXMbmLJfmXt0LGoLepzH8LTbIp+du8
   MqDK1ElAguVYmLWUbUfqgSsarpTWETvq+14xZiVTPSmgUfoEEgt5LTt72
   rpx6MRR5gnN+fE/2OPpOL7/gWDvSAOLtZZfre9c9NEVLa08PB6SBL+Dwk
   aGMLM90u9FnnOlbteZLIYHc9WsRTLi72yNryk0FkOmgyyifdHj4uG58gL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317664920"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="317664920"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 07:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="682337751"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="682337751"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2023 07:59:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcp4m-0008ac-1q;
	Thu, 16 Mar 2023 14:59:32 +0000
Date: Thu, 16 Mar 2023 22:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/input/keyboard/cap11xx.c:90:8: warning: Excessive padding in
 'struct cap11xx_hw_model' (6 padding bytes, where 2 is optimal). Optimal
 fields order: num_channels, num_leds, product_id, no_gain, consider
 reordering the fields or adding explicit padd...
Message-ID: <202303162227.9mMALXHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/input/keyboard/cap11xx.c:90:8: warning: Excessive padding in 'struct cap11xx_hw_model' (6 padding bytes, where 2 is optimal). Optimal fields order: num_channels, num_leds, product_id, no_gain, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jiri Valek - 2N" <jiriv@axis.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Mattijs Korpershoek <mkorpershoek@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c1bec9c0b08abeac72ed6214b723adc224013bf
commit: b4bb3310727e978fddcc444355a545966a9d10ea Input: cap11xx - add support for cap1203, cap1293 and cap1298
date:   6 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20230310 (https://download.01.org/0day-ci/archive/20230316/202303162227.9mMALXHO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4bb3310727e978fddcc444355a545966a9d10ea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b4bb3310727e978fddcc444355a545966a9d10ea
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303162227.9mMALXHO-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                ^~~~~~~
   net/ipv4/raw.c:606:2: note: Taking false branch
           if (!hdrincl) {
           ^
   net/ipv4/raw.c:617:2: note: Taking false branch
           if (IS_ERR(rt)) {
           ^
   net/ipv4/raw.c:624:6: note: Assuming the condition is false
           if (rt->rt_flags & RTCF_BROADCAST && !sock_flag(sk, SOCK_BROADCAST))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:624:36: note: Left side of '&&' is false
           if (rt->rt_flags & RTCF_BROADCAST && !sock_flag(sk, SOCK_BROADCAST))
                                             ^
   net/ipv4/raw.c:627:6: note: Assuming the condition is false
           if (msg->msg_flags & MSG_CONFIRM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:627:2: note: Taking false branch
           if (msg->msg_flags & MSG_CONFIRM)
           ^
   net/ipv4/raw.c:631:6: note: 'hdrincl' is not equal to 0
           if (hdrincl)
               ^~~~~~~
   net/ipv4/raw.c:631:2: note: Taking true branch
           if (hdrincl)
           ^
   net/ipv4/raw.c:632:9: note: Calling 'raw_send_hdrinc'
                   err = raw_send_hdrinc(sk, &fl4, msg, len,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:330:6: note: Assuming 'length' is <= field 'mtu'
           if (length > rt->dst.dev->mtu) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:330:2: note: Taking false branch
           if (length > rt->dst.dev->mtu) {
           ^
   net/ipv4/raw.c:335:6: note: Assuming the condition is false
           if (length < sizeof(struct iphdr))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:335:2: note: Taking false branch
           if (length < sizeof(struct iphdr))
           ^
   net/ipv4/raw.c:338:6: note: Assuming the condition is false
           if (flags&MSG_PROBE)
               ^~~~~~~~~~~~~~~
   net/ipv4/raw.c:338:2: note: Taking false branch
           if (flags&MSG_PROBE)
           ^
   net/ipv4/raw.c:346:6: note: Assuming 'skb' is non-null
           if (!skb)
               ^~~~
   net/ipv4/raw.c:346:2: note: Taking false branch
           if (!skb)
           ^
   net/ipv4/raw.c:358:2: note: Value assigned to field 'end'
           skb_put(skb, length);
           ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:362:2: note: Calling 'skb_setup_tx_timestamp'
           skb_setup_tx_timestamp(skb, sockc->tsflags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2767:39: note: Passing value via 3rd parameter 'tx_flags'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2767:2: note: Calling '_sock_tx_timestamp'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2749:6: note: Assuming 'tsflags' is not equal to 0
           if (unlikely(tsflags)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/net/sock.h:2749:2: note: Taking true branch
           if (unlikely(tsflags)) {
           ^
   include/net/sock.h:2751:7: note: Assuming the condition is true
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2751:7: note: Left side of '&&' is true
   include/net/sock.h:2751:44: note: Assuming 'tskey' is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                            ^~~~~
   include/net/sock.h:2751:7: note: Assuming pointer value is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2751:50: note: Left side of '&&' is false
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                                  ^
   include/net/sock.h:2755:6: note: Assuming the condition is false
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/net/sock.h:2755:2: note: Taking true branch
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
           ^
   include/net/sock.h:2756:13: note: Dereference of null pointer (loaded from variable 'tx_flags')
                   *tx_flags |= SKBTX_WIFI_STATUS;
                    ~~~~~~~~ ^
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/input/keyboard/cap11xx.c:90:8: warning: Excessive padding in 'struct cap11xx_hw_model' (6 padding bytes, where 2 is optimal). Optimal fields order: num_channels, num_leds, product_id, no_gain, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct cap11xx_hw_model {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/cap11xx.c:90:8: note: Excessive padding in 'struct cap11xx_hw_model' (6 padding bytes, where 2 is optimal). Optimal fields order: num_channels, num_leds, product_id, no_gain, consider reordering the fields or adding explicit padding members
   struct cap11xx_hw_model {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/input/keyboard/tca8418_keypad.c:241:15: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
           reg += (~(~0 << cols)) << 8;
                        ^
   drivers/input/keyboard/tca8418_keypad.c:272:2: note: Taking false branch
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE)) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:279:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:279:2: note: Taking false branch
           if (error)
           ^
   drivers/input/keyboard/tca8418_keypad.c:282:6: note: Assuming 'rows' is not equal to 0
           if (!rows || rows > TCA8418_MAX_ROWS) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:282:6: note: Left side of '||' is false
   drivers/input/keyboard/tca8418_keypad.c:282:15: note: Assuming 'rows' is <= TCA8418_MAX_ROWS
           if (!rows || rows > TCA8418_MAX_ROWS) {
                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:282:2: note: Taking false branch
           if (!rows || rows > TCA8418_MAX_ROWS) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:287:6: note: Assuming 'cols' is not equal to 0
           if (!cols || cols > TCA8418_MAX_COLS) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:287:6: note: Left side of '||' is false
   drivers/input/keyboard/tca8418_keypad.c:287:15: note: Assuming 'cols' is <= TCA8418_MAX_COLS
           if (!cols || cols > TCA8418_MAX_COLS) {
                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:287:2: note: Taking false branch
           if (!cols || cols > TCA8418_MAX_COLS) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:296:6: note: Assuming 'keypad_data' is non-null
           if (!keypad_data)
               ^~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:296:2: note: Taking false branch
           if (!keypad_data)
           ^
   drivers/input/keyboard/tca8418_keypad.c:304:6: note: 'error' is 0
           if (error)
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:304:2: note: Taking false branch
           if (error)
           ^
   drivers/input/keyboard/tca8418_keypad.c:309:6: note: Assuming 'input' is non-null
           if (!input)
               ^~~~~~
   drivers/input/keyboard/tca8418_keypad.c:309:2: note: Taking false branch
           if (!input)
           ^
   drivers/input/keyboard/tca8418_keypad.c:321:6: note: Assuming 'error' is 0
           if (error) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:321:2: note: Taking false branch
           if (error) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:326:6: note: Assuming the condition is false
           if (device_property_read_bool(dev, "keypad,autorepeat"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:326:2: note: Taking false branch
           if (device_property_read_bool(dev, "keypad,autorepeat"))
           ^
   drivers/input/keyboard/tca8418_keypad.c:335:6: note: Assuming 'error' is 0
           if (error) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:335:2: note: Taking false branch
           if (error) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:342:10: note: Calling 'tca8418_configure'
           error = tca8418_configure(keypad_data, rows, cols);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:241:15: note: The result of the left shift is undefined because the left operand is negative
           reg += (~(~0 << cols)) << 8;
                     ~~ ^
   2 warnings generated.
   drivers/clocksource/ingenic-timer.c:32:8: warning: Excessive padding in 'struct ingenic_tcu_timer' (44 padding bytes, where 12 is optimal). Optimal fields order: cevt, cpu, channel, clk, name, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct ingenic_tcu_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/clocksource/ingenic-timer.c:32:8: note: Excessive padding in 'struct ingenic_tcu_timer' (44 padding bytes, where 12 is optimal). Optimal fields order: cevt, cpu, channel, clk, name, consider reordering the fields or adding explicit padding members
   struct ingenic_tcu_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.

vim +90 drivers/input/keyboard/cap11xx.c

7609a5e973c43a Matt Ranostay 2014-10-31  89  
7609a5e973c43a Matt Ranostay 2014-10-31 @90  struct cap11xx_hw_model {
7609a5e973c43a Matt Ranostay 2014-10-31  91  	u8 product_id;
7609a5e973c43a Matt Ranostay 2014-10-31  92  	unsigned int num_channels;
efe3b616f88caa Matt Ranostay 2015-08-16  93  	unsigned int num_leds;
322a552e195508 Jesse Taube   2021-11-02  94  	bool no_gain;
7609a5e973c43a Matt Ranostay 2014-10-31  95  };
7609a5e973c43a Matt Ranostay 2014-10-31  96  

:::::: The code at line 90 was first introduced by commit
:::::: 7609a5e973c43a647c4e40184fc8404311fdb97c Input: cap11xx - add support for various cap11xx devices

:::::: TO: Matt Ranostay <mranostay@gmail.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
