Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A7386
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jan 2023 04:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674274332; x=1705810332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/iZqWaPuQTzVvB4pFg+hS1h4iqZ42BXQg0+H0QXHr4A=;
  b=BvArLzCgMoeo7tpLFdNHAX7R5S8H2aVzvjIsJRtPMuI+a/SZ/RLpams5
   ciicpxeFXxjLJ2aO2KzBwma8YdpKca5dV2a5+FNhoATHwXVRstiyDi8Vf
   yq7dJDu0CveYwiNkesTitA8DpgG5MYYh339bCgrX1gqRUveci1pyfE70u
   6uCUfhZGy8fTAT4rlpI44WK/8e3h1ulNx0QEW3b12xr5zAtbUhZg0awO/
   7KDtbx62jJUzMgmPGm98s4Q5HQ28nw5+KbGdRR341+EepdGFi92/cVWIH
   mGmtdSQ7JjVKTNXE9pEAiJnZ9P0X47snRiv5WMLDwlvUZhHM/g9ednMkL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309331180"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="309331180"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 20:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="768923397"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="768923397"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2023 20:11:53 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ5EJ-0003Pw-18;
	Sat, 21 Jan 2023 04:11:47 +0000
Date: Sat, 21 Jan 2023 12:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cel:topic-rpcsec-gss-krb5-enhancements 83/109]
 net/sunrpc/auth_gss/gss_krb5_mech.c:187:3: warning: Call to function
 'strcat' is insecure as it does not provide bounding of the memory buffer.
 Replace unbounded copy functions with analogous functions that support
 length arguments such as 'strlcat'. CWE-...
Message-ID: <202301211258.7d85GeuP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/sunrpc/auth_gss/gss_krb5_mech.c:187:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpcsec-gss-krb5-enhancements
head:   3f681aeac65cc78e50b0a7330ad6fe9eb715f164
commit: 62bd0391bc803990b45e431efaabcefea9f7418c [83/109] SUNRPC: Enable rpcsec_gss_krb5.ko to be built without CRYPTO_DES
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20230121/202301211258.7d85GeuP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=62bd0391bc803990b45e431efaabcefea9f7418c
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpcsec-gss-krb5-enhancements
        git checkout 62bd0391bc803990b45e431efaabcefea9f7418c
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/timer.h:113:2: note: expanded from macro '__init_timer'
           do {                                                            \
           ^
   drivers/net/phy/sfp.c:2620:2: note: Loop condition is false.  Exiting loop
           INIT_DELAYED_WORK(&sfp->poll, sfp_poll);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:251:2: note: expanded from macro '__INIT_DELAYED_WORK'
           do {                                                            \
           ^
   drivers/net/phy/sfp.c:2621:2: note: Loop condition is false.  Exiting loop
           INIT_DELAYED_WORK(&sfp->timeout, sfp_timeout);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:252:3: note: expanded from macro '__INIT_DELAYED_WORK'
                   INIT_WORK(&(_work)->work, (_func));                     \
                   ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/net/phy/sfp.c:2621:2: note: Loop condition is false.  Exiting loop
           INIT_DELAYED_WORK(&sfp->timeout, sfp_timeout);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:253:3: note: expanded from macro '__INIT_DELAYED_WORK'
                   __init_timer(&(_work)->timer,                           \
                   ^
   include/linux/timer.h:113:2: note: expanded from macro '__init_timer'
           do {                                                            \
           ^
   drivers/net/phy/sfp.c:2621:2: note: Loop condition is false.  Exiting loop
           INIT_DELAYED_WORK(&sfp->timeout, sfp_timeout);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:251:2: note: expanded from macro '__INIT_DELAYED_WORK'
           do {                                                            \
           ^
   drivers/net/phy/sfp.c:2689:8: note: Returning from 'sfp_alloc'
           sfp = sfp_alloc(&pdev->dev);
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/sfp.c:2690:2: note: Taking false branch
           if (IS_ERR(sfp))
           ^
   drivers/net/phy/sfp.c:2695:8: note: Calling 'devm_add_action_or_reset'
           err = devm_add_action_or_reset(sfp->dev, sfp_cleanup, sfp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:256:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   include/linux/device.h:256:2: note: Taking true branch
           if (ret)
           ^
   include/linux/device.h:257:3: note: Calling 'sfp_cleanup'
                   action(data);
                   ^~~~~~~~~~~~
   drivers/net/phy/sfp.c:2636:6: note: Assuming field 'i2c_mii' is null
           if (sfp->i2c_mii) {
               ^~~~~~~~~~~~
   drivers/net/phy/sfp.c:2636:2: note: Taking false branch
           if (sfp->i2c_mii) {
           ^
   drivers/net/phy/sfp.c:2640:6: note: Assuming field 'i2c' is null
           if (sfp->i2c)
               ^~~~~~~~
   drivers/net/phy/sfp.c:2640:2: note: Taking false branch
           if (sfp->i2c)
           ^
   drivers/net/phy/sfp.c:2642:2: note: Memory is released
           kfree(sfp);
           ^~~~~~~~~~
   include/linux/device.h:257:3: note: Returning; memory was released via 1st parameter
                   action(data);
                   ^~~~~~~~~~~~
   drivers/net/phy/sfp.c:2695:8: note: Returning; memory was released via 3rd parameter
           err = devm_add_action_or_reset(sfp->dev, sfp_cleanup, sfp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/sfp.c:2696:6: note: Assuming 'err' is >= 0
           if (err < 0)
               ^~~~~~~
   drivers/net/phy/sfp.c:2696:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/net/phy/sfp.c:2699:18: note: Use of memory after it is freed
           sff = sfp->type = &sfp_data;
                 ~~~~~~~~~ ^
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> net/sunrpc/auth_gss/gss_krb5_mech.c:187:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(gss_krb5_enctype_priority_list, buf);
                   ^~~~~~
   net/sunrpc/auth_gss/gss_krb5_mech.c:187:3: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                   strcat(gss_krb5_enctype_priority_list, buf);
                   ^~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
   net/strparser/strparser.c:161:5: warning: Value stored to 'head' is never read [clang-analyzer-deadcode.DeadStores]
                                   head = skb;
                                   ^      ~~~
   net/strparser/strparser.c:161:5: note: Value stored to 'head' is never read
                                   head = skb;
                                   ^      ~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/input/misc/ad714x.c:206:20: warning: Division by zero [clang-analyzer-core.DivideZero]
           return (max_coord / (end_stage - start_stage)) * a_param / b_param;
                             ^
   drivers/input/misc/ad714x.c:948:14: note: Assuming 'i' is >= field 'button_num'
           for (i = 0; i < ad714x->hw->button_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:948:2: note: Loop condition is false. Execution continues on line 950
           for (i = 0; i < ad714x->hw->button_num; i++)
           ^
   drivers/input/misc/ad714x.c:950:14: note: Assuming 'i' is < field 'slider_num'
           for (i = 0; i < ad714x->hw->slider_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:950:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < ad714x->hw->slider_num; i++)
           ^
   drivers/input/misc/ad714x.c:951:3: note: Calling 'ad714x_slider_state_machine'
                   ad714x_slider_state_machine(ad714x, i);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:350:2: note: Control jumps to 'case JITTER:'  at line 362
           switch (sw->state) {
           ^
   drivers/input/misc/ad714x.c:363:7: note: Assuming 'c_state' is equal to 'mask'
                   if (c_state == mask) {
                       ^~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:363:3: note: Taking true branch
                   if (c_state == mask) {
                   ^
   drivers/input/misc/ad714x.c:366:4: note: Calling 'ad714x_slider_cal_abs_pos'
                           ad714x_slider_cal_abs_pos(ad714x, idx);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:296:16: note: Calling 'ad714x_cal_abs_pos'
           sw->abs_pos = ad714x_cal_abs_pos(ad714x, hw->start_stage, hw->end_stage,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:183:6: note: Assuming 'highest_stage' is equal to 'start_stage'
           if (highest_stage == start_stage) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:183:2: note: Taking true branch
           if (highest_stage == start_stage) {
           ^
   drivers/input/misc/ad714x.c:206:20: note: Division by zero
           return (max_coord / (end_stage - start_stage)) * a_param / b_param;
                   ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:1014:2: warning: Value stored to 'drv_mem' is never read [clang-analyzer-deadcode.DeadStores]
           drv_mem += sizeof(*bt_drv) * ad714x->hw->button_num;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ad714x.c:1014:2: note: Value stored to 'drv_mem' is never read
           drv_mem += sizeof(*bt_drv) * ad714x->hw->button_num;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +187 net/sunrpc/auth_gss/gss_krb5_mech.c

a3aec5dbe66ce4c Chuck Lever 2022-12-02  159  
a3aec5dbe66ce4c Chuck Lever 2022-12-02  160  static void gss_krb5_prepare_enctype_priority_list(void)
a3aec5dbe66ce4c Chuck Lever 2022-12-02  161  {
a3aec5dbe66ce4c Chuck Lever 2022-12-02  162  	static const u32 gss_krb5_enctypes[] = {
62bd0391bc80399 Chuck Lever 2022-11-28  163  #if defined(CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1)
a3aec5dbe66ce4c Chuck Lever 2022-12-02  164  		ENCTYPE_AES256_CTS_HMAC_SHA1_96,
a3aec5dbe66ce4c Chuck Lever 2022-12-02  165  		ENCTYPE_AES128_CTS_HMAC_SHA1_96,
62bd0391bc80399 Chuck Lever 2022-11-28  166  #endif
62bd0391bc80399 Chuck Lever 2022-11-28  167  #if defined(CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES)
a3aec5dbe66ce4c Chuck Lever 2022-12-02  168  		ENCTYPE_DES3_CBC_SHA1,
a3aec5dbe66ce4c Chuck Lever 2022-12-02  169  		ENCTYPE_DES_CBC_MD5,
a3aec5dbe66ce4c Chuck Lever 2022-12-02  170  		ENCTYPE_DES_CBC_CRC,
a3aec5dbe66ce4c Chuck Lever 2022-12-02  171  		ENCTYPE_DES_CBC_MD4,
a3aec5dbe66ce4c Chuck Lever 2022-12-02  172  #endif
a3aec5dbe66ce4c Chuck Lever 2022-12-02  173  	};
a3aec5dbe66ce4c Chuck Lever 2022-12-02  174  	size_t total, i;
a3aec5dbe66ce4c Chuck Lever 2022-12-02  175  	char buf[16];
a3aec5dbe66ce4c Chuck Lever 2022-12-02  176  	char *sep;
a3aec5dbe66ce4c Chuck Lever 2022-12-02  177  	int n;
a3aec5dbe66ce4c Chuck Lever 2022-12-02  178  
a3aec5dbe66ce4c Chuck Lever 2022-12-02  179  	sep = "";
a3aec5dbe66ce4c Chuck Lever 2022-12-02  180  	gss_krb5_enctype_priority_list[0] = '\0';
a3aec5dbe66ce4c Chuck Lever 2022-12-02  181  	for (total = 0, i = 0; i < ARRAY_SIZE(gss_krb5_enctypes); i++) {
a3aec5dbe66ce4c Chuck Lever 2022-12-02  182  		n = sprintf(buf, "%s%u", sep, gss_krb5_enctypes[i]);
a3aec5dbe66ce4c Chuck Lever 2022-12-02  183  		if (n < 0)
a3aec5dbe66ce4c Chuck Lever 2022-12-02  184  			break;
a3aec5dbe66ce4c Chuck Lever 2022-12-02  185  		if (total + n >= sizeof(gss_krb5_enctype_priority_list))
a3aec5dbe66ce4c Chuck Lever 2022-12-02  186  			break;
a3aec5dbe66ce4c Chuck Lever 2022-12-02 @187  		strcat(gss_krb5_enctype_priority_list, buf);
a3aec5dbe66ce4c Chuck Lever 2022-12-02  188  		sep = ",";
a3aec5dbe66ce4c Chuck Lever 2022-12-02  189  		total += n;
a3aec5dbe66ce4c Chuck Lever 2022-12-02  190  	}
a3aec5dbe66ce4c Chuck Lever 2022-12-02  191  }
a3aec5dbe66ce4c Chuck Lever 2022-12-02  192  

:::::: The code at line 187 was first introduced by commit
:::::: a3aec5dbe66ce4cc3fe1a67bb56a53fc1c37a2c0 SUNRPC: Replace KRB5_SUPPORTED_ENCTYPES macro

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
