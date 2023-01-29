Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91DBD3F
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 09:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674985681; x=1706521681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XL+KSsW5vpxfV4ZMO7VKU/zvVhDR+14YB7y7xovM5w=;
  b=UE/7hL7BxXkq2cTZIt9pqJ6CfZpoSj61JklKNcFptWkTnp+9z61pmm2j
   zb7BAe6P2DOFev9PS1zlPDFO626gNSG89B+knE+FRDmemb/ZZtVwEjqlT
   KwURFhsd3JOSbx9sUi1tbC25w5QEj2Apily44gYXeK3G1YSiDGR/IaFdi
   WG/fM/gmG+Qgl3uoKSlJLpBLgVPZQdJMMo6XyITvKRgtHl3Er1Q8ocbx8
   845MH1W6mmavyj7wmNMGPPkADMQGdCq8zgk37BQ/dKDgpYurajJBCxPVi
   QRnZzoG9rkhD1nFuwteKQj7keOkDBHuVB6KvnNO/IcLu5VeWtyfhAXPbx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="315339541"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="315339541"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 01:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="641217824"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="641217824"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Jan 2023 01:47:59 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM4I2-0002gG-2i;
	Sun, 29 Jan 2023 09:47:58 +0000
Date: Sun, 29 Jan 2023 17:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/iommu.c:1902:18: warning: Dereference of null pointer
 [clang-analyzer-core.NullDereference]
Message-ID: <202301291728.lXcLpa41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/iommu/iommu.c:1902:18: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Jason Gunthorpe <jgg@nvidia.com>

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c96618275234ad03d44eafe9f8844305bb44fda4
commit: 90337f526c98129b0b180fc52dc5f57d8e7a8614 Merge tag 'v6.1-rc7' into iommufd.git for-next
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: mips-randconfig-c004-20230123 (https://download.01.org/0day-ci/archive/20230129/202301291728.lXcLpa41-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=90337f526c98129b0b180fc52dc5f57d8e7a8614
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 90337f526c98129b0b180fc52dc5f57d8e7a8614
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/thermal/gov_fair_share.c:103:21: warning: Division by zero [clang-analyzer-core.DivideZero]
                           percentage = 100 / total_instance;
                                        ~~~~^~~~~~~~~~~~~~~~
   drivers/thermal/gov_fair_share.c:82:2: note: 'total_instance' initialized to 0
           int total_instance = 0;
           ^~~~~~~~~~~~~~~~~~
   drivers/thermal/gov_fair_share.c:85:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&tz->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:313:15: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/thermal/gov_fair_share.c:85:2: note: Left side of '&&' is false
           lockdep_assert_held(&tz->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:27: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/thermal/gov_fair_share.c:85:2: note: Taking false branch
           lockdep_assert_held(&tz->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/thermal/gov_fair_share.c:85:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&tz->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/thermal/gov_fair_share.c:87:2: note: Loop condition is false. Execution continues on line 95
           list_for_each_entry(instance, &tz->thermal_instances, tz_node) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   drivers/thermal/gov_fair_share.c:95:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(instance, &tz->thermal_instances, tz_node) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   drivers/thermal/gov_fair_share.c:99:7: note: Assuming 'trip' is equal to field 'trip'
                   if (instance->trip != trip)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/gov_fair_share.c:99:3: note: Taking false branch
                   if (instance->trip != trip)
                   ^
   drivers/thermal/gov_fair_share.c:102:8: note: 'total_weight' is 0
                   if (!total_weight)
                        ^~~~~~~~~~~~
   drivers/thermal/gov_fair_share.c:102:3: note: Taking true branch
                   if (!total_weight)
                   ^
   drivers/thermal/gov_fair_share.c:103:21: note: Division by zero
                           percentage = 100 / total_instance;
                                        ~~~~^~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iommu/iommu.c:668:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:668:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(buf, type);
           ^~~~~~
>> drivers/iommu/iommu.c:1902:18: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           domain->handler = handler;
           ~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/iommu/iommu.c:1900:9: note: Assuming 'domain' is null
           BUG_ON(!domain);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/iommu/iommu.c:1902:18: note: Dereference of null pointer
           domain->handler = handler;
           ~~~~~~~~~~~~~~~~^~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/dvb-frontends/dib8000.c:623:3: warning: Value stored to 'bw' is never read [clang-analyzer-deadcode.DeadStores]
                   bw = 6000;
                   ^    ~~~~
   drivers/media/dvb-frontends/dib8000.c:623:3: note: Value stored to 'bw' is never read
                   bw = 6000;
                   ^    ~~~~
   drivers/media/dvb-frontends/dib8000.c:962:2: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]
           value = dib8000_i2c_read16(client, 896);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:962:2: note: Value stored to 'value' is never read
           value = dib8000_i2c_read16(client, 896);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2705:30: warning: Division by zero [clang-analyzer-core.DivideZero]
                   unit_khz_dds_val = (1<<26) / (dib8000_read32(state, 23) / 1000);
                                              ^
   drivers/media/dvb-frontends/dib8000.c:3042:2: note: Control jumps to 'case CT_DEMOD_START:'  at line 3043
           switch (*tune_state) {
           ^
   drivers/media/dvb-frontends/dib8000.c:3046:7: note: Assuming field 'revision' is not equal to 32912
                   if (state->revision == 0x8090)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:3046:3: note: Taking false branch
                   if (state->revision == 0x8090)
                   ^
   drivers/media/dvb-frontends/dib8000.c:3051:3: note: Assuming 'debug' is 0
                   dprintk("Tuning channel on %s search mode\n",
                   ^
   drivers/media/dvb-frontends/dib8000.c:35:6: note: expanded from macro 'dprintk'
           if (debug)                                                      \
               ^~~~~
   drivers/media/dvb-frontends/dib8000.c:3051:3: note: Taking false branch
                   dprintk("Tuning channel on %s search mode\n",
                   ^
   drivers/media/dvb-frontends/dib8000.c:35:2: note: expanded from macro 'dprintk'
           if (debug)                                                      \
           ^
   drivers/media/dvb-frontends/dib8000.c:3051:3: note: Loop condition is false.  Exiting loop
                   dprintk("Tuning channel on %s search mode\n",
                   ^
   drivers/media/dvb-frontends/dib8000.c:34:30: note: expanded from macro 'dprintk'
   #define dprintk(fmt, arg...) do {                                       \
                                ^
   drivers/media/dvb-frontends/dib8000.c:3059:3: note: Calling 'dib8000_set_frequency_offset'
                   dib8000_set_frequency_offset(state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2744:6: note: Assuming field 'get_frequency' is null
           if (state->fe[0]->ops.tuner_ops.get_frequency)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2744:2: note: Taking false branch
           if (state->fe[0]->ops.tuner_ops.get_frequency)
           ^
   drivers/media/dvb-frontends/dib8000.c:2751:6: note: Assuming field 'isdbt_sb_mode' is 0
           if (c->isdbt_sb_mode) {
               ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2751:2: note: Taking false branch
           if (c->isdbt_sb_mode) {
           ^
   drivers/media/dvb-frontends/dib8000.c:2766:2: note: Assuming 'debug' is 0
           dprintk("%dkhz tuner offset (frequency = %dHz & current_rf = %dHz) total_dds_offset_hz = %d\n", c->frequency - current_rf, c->frequency, current_rf, total_dds_offset_khz);
--
                   for (i = 0; i < max && regions[i].offset <= child->part.offset;
                   ^
   drivers/mtd/mtdpart.c:154:7: note: 'i' is <= 0
                   if (i > 0)
                       ^
   drivers/mtd/mtdpart.c:154:3: note: Taking false branch
                   if (i > 0)
                   ^
   drivers/mtd/mtdpart.c:158:10: note: 'i' is < 'max'
                   for (; i < max && regions[i].offset < end; i++) {
                          ^
   drivers/mtd/mtdpart.c:158:10: note: Left side of '&&' is true
   drivers/mtd/mtdpart.c:158:21: note: Assuming 'end' is <= field 'offset'
                   for (; i < max && regions[i].offset < end; i++) {
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:158:3: note: Loop condition is false. Execution continues on line 162
                   for (; i < max && regions[i].offset < end; i++) {
                   ^
   drivers/mtd/mtdpart.c:162:10: note: Assuming field 'erasesize' is equal to 0
                   BUG_ON(child->erasesize == 0);
                          ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/mtd/mtdpart.c:173:6: note: Assuming the condition is true
           if (!(child->flags & MTD_NO_ERASE))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:173:2: note: Taking true branch
           if (!(child->flags & MTD_NO_ERASE))
           ^
   drivers/mtd/mtdpart.c:174:3: note: The value 0 is assigned to 'wr_alignment'
                   wr_alignment = child->erasesize;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:177:14: note: '__base' initialized to 0
           remainder = do_div(tmp, wr_alignment);
                       ^
   include/asm-generic/div64.h:220:2: note: expanded from macro 'do_div'
           uint32_t __base = (base);                       \
           ^~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:177:14: note: Left side of '&&' is false
           remainder = do_div(tmp, wr_alignment);
                       ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/mtd/mtdpart.c:177:14: note: Left side of '&&' is false
           remainder = do_div(tmp, wr_alignment);
                       ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/mtd/mtdpart.c:177:14: note: Assuming the condition is true
           remainder = do_div(tmp, wr_alignment);
                       ^
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/mtd/mtdpart.c:177:14: note: Taking true branch
           remainder = do_div(tmp, wr_alignment);
                       ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                  ^
   drivers/mtd/mtdpart.c:177:14: note: Division by zero
           remainder = do_div(tmp, wr_alignment);
                       ^
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem = (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/char/xillybus/xillyusb.c:1154:4: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                           rc = wait_event_interruptible_timeout(chan->flushq,
                           ^
   drivers/char/xillybus/xillyusb.c:1154:4: note: Value stored to 'rc' is never read
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iommu/iommu.c:668:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:668:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(buf, type);
           ^~~~~~
>> drivers/iommu/iommu.c:1902:18: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           domain->handler = handler;
           ~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/iommu/iommu.c:1900:9: note: Assuming 'domain' is null
           BUG_ON(!domain);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/iommu/iommu.c:1902:18: note: Dereference of null pointer
           domain->handler = handler;
           ~~~~~~~~~~~~~~~~^~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/i2c/ad9389b.c:399:7: warning: Value stored to 'N' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   u32 N = (ad9389b_rd(sd, 0x01) & 0xf) << 16 |
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ad9389b.c:399:7: note: Value stored to 'N' during its initialization is never read
                   u32 N = (ad9389b_rd(sd, 0x01) & 0xf) << 16 |
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/bus/mhi/host/boot.c:147:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/host/boot.c:147:2: note: Value stored to 'ret' is never read
           ret = mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/phy/phy-core.c:337:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = 0; /* Override possible ret == -ENOTSUPP */
           ^     ~
   drivers/phy/phy-core.c:337:2: note: Value stored to 'ret' is never read
           ret = 0; /* Override possible ret == -ENOTSUPP */
           ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +1902 drivers/iommu/iommu.c

ed36d04e8f8d7b Robin Murphy   2022-04-25  1883  
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1884  /**
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1885   * iommu_set_fault_handler() - set a fault handler for an iommu domain
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1886   * @domain: iommu domain
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1887   * @handler: fault handler
77ca2332359458 Ohad Ben-Cohen 2012-05-21  1888   * @token: user data, will be passed back to the fault handler
0ed6d2d27bcc2a Ohad Ben-Cohen 2011-09-27  1889   *
0ed6d2d27bcc2a Ohad Ben-Cohen 2011-09-27  1890   * This function should be used by IOMMU users which want to be notified
0ed6d2d27bcc2a Ohad Ben-Cohen 2011-09-27  1891   * whenever an IOMMU fault happens.
0ed6d2d27bcc2a Ohad Ben-Cohen 2011-09-27  1892   *
0ed6d2d27bcc2a Ohad Ben-Cohen 2011-09-27  1893   * The fault handler itself should return 0 on success, and an appropriate
0ed6d2d27bcc2a Ohad Ben-Cohen 2011-09-27  1894   * error code otherwise.
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1895   */
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1896  void iommu_set_fault_handler(struct iommu_domain *domain,
77ca2332359458 Ohad Ben-Cohen 2012-05-21  1897  					iommu_fault_handler_t handler,
77ca2332359458 Ohad Ben-Cohen 2012-05-21  1898  					void *token)
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1899  {
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1900  	BUG_ON(!domain);
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1901  
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13 @1902  	domain->handler = handler;
77ca2332359458 Ohad Ben-Cohen 2012-05-21  1903  	domain->handler_token = token;
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1904  }
30bd918c7132ad Ohad Ben-Cohen 2011-09-26  1905  EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
4f3f8d9db359bb Ohad Ben-Cohen 2011-09-13  1906  

:::::: The code at line 1902 was first introduced by commit
:::::: 4f3f8d9db359bbc780d482849f2a9c8b12f910b6 iommu/core: Add fault reporting mechanism

:::::: TO: Ohad Ben-Cohen <ohad@wizery.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
