Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA0EA0
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Feb 2023 00:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677026633; x=1708562633;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z5bQYa1kzI5dk16pNSAUGS4t6HTtKBynSzYpRxKYpB0=;
  b=MqTD9G/Yi/hTZLi14u5EFTuAmFFdecowNsEuI6nRRA5f89aB7QFdl47B
   qXkEhKNk19pk49rEm004DCclb+RfHGYhNYYnY++e/SdLcfteUywiG8rzB
   S9rohAmcxYwN6Sd0C8yB/f621bYkh9pKKvUkLEXaLqzc4SsVniiT1CtIs
   Y1PNLglewVMEOxBDLwUozPw9gsPUkOXBY6zsSUBObvWcJPeJ9G5Bd4Y6W
   NJ3WqceYoVL4+/Fp37uLI4eSvK9AT9D3SFqB4V7pl4Thu3t4FDgejP0qV
   Kid/ur4thhHfcU0wba5KkBu5pAVCYyoGy7dsXYU8FLIUsj6zU8Vnf2BqG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="360277389"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="360277389"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 16:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="671876526"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="671876526"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Feb 2023 16:43:51 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUdEc-0000Pl-2w;
	Wed, 22 Feb 2023 00:43:50 +0000
Date: Wed, 22 Feb 2023 08:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [driver-core:class_cleanup 34/91] lib/kobject.c:35:9: warning:
 Called function pointer is null (null dereference)
 [clang-analyzer-core.CallAndMessage]
Message-ID: <202302220812.KDcnEGDf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/kobject.c:35:9: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: "Thomas Weiﬂschuh" <linux@weissschuh.net>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git class_cleanup
head:   512466823088e17b8bedd9a5edcc8a7a35e7e635
commit: dda6b81f17ad8e72f8bc151c876cd335a471e268 [34/91] kobject: make dynamic_kobj_ktype and kset_ktype const
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220812.KDcnEGDf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=dda6b81f17ad8e72f8bc151c876cd335a471e268
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core class_cleanup
        git checkout dda6b81f17ad8e72f8bc151c876cd335a471e268
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302220812.KDcnEGDf-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
            ^
   drivers/media/platform/renesas/rcar_drif.c:461:9: note: Left side of '||' is true
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                               ^
   drivers/media/platform/renesas/rcar_drif.c:461:9: note: Taking false branch
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/platform/renesas/rcar_drif.c:461:9: note: Loop condition is false.  Exiting loop
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/media/platform/renesas/rcar_drif.c:461:9: note: Assuming 'pos__' is not equal to 'head__', which participates in a condition later
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_or_null'
           pos__ != head__ ? list_entry(pos__, type, member) : NULL; \
           ^~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:461:9: note: '?' condition is true
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_or_null'
           pos__ != head__ ? list_entry(pos__, type, member) : NULL; \
           ^
   drivers/media/platform/renesas/rcar_drif.c:463:6: note: Assuming 'fbuf' is non-null, which participates in a condition later
           if (!fbuf) {
               ^~~~~
   drivers/media/platform/renesas/rcar_drif.c:463:2: note: Taking false branch
           if (!fbuf) {
           ^
   drivers/media/platform/renesas/rcar_drif.c:475:2: note: Returning pointer (loaded from 'fbuf'), which participates in a condition later
           return fbuf;
           ^~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:574:9: note: Returning from 'rcar_drif_get_fbuf'
           fbuf = rcar_drif_get_fbuf(sdr);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:575:7: note: 'fbuf' is non-null
           if (!fbuf)
                ^~~~
   drivers/media/platform/renesas/rcar_drif.c:575:2: note: Taking false branch
           if (!fbuf)
           ^
   drivers/media/platform/renesas/rcar_drif.c:578:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < RCAR_DRIF_MAX_CHANNEL; i++)
           ^
   drivers/media/platform/renesas/rcar_drif.c:578:41: note: The value 1 is assigned to 'i'
           for (i = 0; i < RCAR_DRIF_MAX_CHANNEL; i++)
                                                  ^~~
   drivers/media/platform/renesas/rcar_drif.c:578:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < RCAR_DRIF_MAX_CHANNEL; i++)
           ^
   drivers/media/platform/renesas/rcar_drif.c:580:31: note: Access to field 'addr' results in a dereference of an undefined pointer value
                          i * sdr->hwbuf_size, buf[i]->addr, sdr->hwbuf_size);
                                               ^~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
>> lib/kobject.c:35:9: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]
           return kobj->ktype->namespace(kobj);
                  ^
   lib/kobject.c:996:7: note: 'kset' is non-null
           if (!kset)
                ^~~~
   lib/kobject.c:996:2: note: Taking false branch
           if (!kset)
           ^
   lib/kobject.c:998:10: note: Calling 'kset_register'
           error = kset_register(kset);
                   ^~~~~~~~~~~~~~~~~~~
   lib/kobject.c:853:7: note: 'k' is non-null
           if (!k)
                ^
   lib/kobject.c:853:2: note: Taking false branch
           if (!k)
           ^
   lib/kobject.c:857:8: note: Calling 'kobject_add_internal'
           err = kobject_add_internal(&k->kobj);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kobject.c:206:7: note: 'kobj' is non-null
           if (!kobj)
                ^~~~
   lib/kobject.c:206:2: note: Taking false branch
           if (!kobj)
           ^
   lib/kobject.c:209:6: note: Assuming field 'name' is non-null
           if (!kobj->name || !kobj->name[0]) {
               ^~~~~~~~~~~
   lib/kobject.c:209:6: note: Left side of '||' is false
   lib/kobject.c:209:21: note: Assuming the condition is false
           if (!kobj->name || !kobj->name[0]) {
                              ^~~~~~~~~~~~~~
   lib/kobject.c:209:2: note: Taking false branch
           if (!kobj->name || !kobj->name[0]) {
           ^
   lib/kobject.c:219:12: note: Field 'kset' is null
           if (kobj->kset) {
                     ^
   lib/kobject.c:219:2: note: Taking false branch
           if (kobj->kset) {
           ^
   lib/kobject.c:226:2: note: Taking false branch
           pr_debug("kobject: '%s' (%p): %s: parent: '%s', set: '%s'\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   lib/kobject.c:226:2: note: Loop condition is false.  Exiting loop
           pr_debug("kobject: '%s' (%p): %s: parent: '%s', set: '%s'\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   lib/kobject.c:226:2: note: Taking false branch
           pr_debug("kobject: '%s' (%p): %s: parent: '%s', set: '%s'\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)

vim +35 lib/kobject.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  19  
e34ff4906199d2e Tejun Heo          2013-09-11  20  /**
ed856349dc0886a Tobin C. Harding   2019-05-02  21   * kobject_namespace() - Return @kobj's namespace tag.
e34ff4906199d2e Tejun Heo          2013-09-11  22   * @kobj: kobject in question
e34ff4906199d2e Tejun Heo          2013-09-11  23   *
e34ff4906199d2e Tejun Heo          2013-09-11  24   * Returns namespace tag of @kobj if its parent has namespace ops enabled
e34ff4906199d2e Tejun Heo          2013-09-11  25   * and thus @kobj should have a namespace tag associated with it.  Returns
e34ff4906199d2e Tejun Heo          2013-09-11  26   * %NULL otherwise.
e34ff4906199d2e Tejun Heo          2013-09-11  27   */
542aa24646ca20c Greg Kroah-Hartman 2022-11-21  28  const void *kobject_namespace(const struct kobject *kobj)
e34ff4906199d2e Tejun Heo          2013-09-11  29  {
e34ff4906199d2e Tejun Heo          2013-09-11  30  	const struct kobj_ns_type_operations *ns_ops = kobj_ns_ops(kobj);
e34ff4906199d2e Tejun Heo          2013-09-11  31  
e34ff4906199d2e Tejun Heo          2013-09-11  32  	if (!ns_ops || ns_ops->type == KOBJ_NS_TYPE_NONE)
e34ff4906199d2e Tejun Heo          2013-09-11  33  		return NULL;
e34ff4906199d2e Tejun Heo          2013-09-11  34  
a1212d278c05ca0 Linus Torvalds     2013-11-07 @35  	return kobj->ktype->namespace(kobj);
e34ff4906199d2e Tejun Heo          2013-09-11  36  }
e34ff4906199d2e Tejun Heo          2013-09-11  37  

:::::: The code at line 35 was first introduced by commit
:::::: a1212d278c05ca0a38f5cbd7ae90ac2e367228a8 Revert "sysfs: drop kobj_ns_type handling"

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
