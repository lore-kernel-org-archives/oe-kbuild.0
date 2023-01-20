Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9617C8
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 04:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674189642; x=1705725642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JB/+j6y5hg/g45gsQhH6HGnI23wEGTadkcD/H+SXRFg=;
  b=mdX0k3IOMxsJaz6+dAsq9z/xQ27mxDS0K63biNXfy+0amfyry1F/Skzr
   gaxkTYs4oKVM9s+b2ECRvmE+biYd3xBqBraD4lxMCwjcMNyGTuCac/Whe
   3GGJi5ZaBXn1eJ0pVbD1gsep36sKYuLIoGb72Qlgy0W2oapFUuP1uwMd8
   sljDsx2Uw7UZEI40hpWuHSn5mOax/vGxyrunUpLmc0NC81KR8ZAxjyYZ/
   ggb3pP3bQtIhV3A54u4aFAR6nln+WNiT1Oicp0HF3ihXqPZZAiP1mxkrA
   vxoxGiq3s3l30sDf4keKsFexeaShQ7jBaGEEh+ZdIzkLXgbzW/SykBA6K
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352759244"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="352759244"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 20:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662416663"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="662416663"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 20:40:40 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIjCh-0002Bs-1z;
	Fri, 20 Jan 2023 04:40:39 +0000
Date: Fri, 20 Jan 2023 12:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:hf-5k-rc4 11/19] lib/dynamic_debug.c:1289:3: warning: Value
 stored to 'totct' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301201202.Ughhyfw8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/dynamic_debug.c:1289:3: warning: Value stored to 'totct' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git hf-5k-rc4
head:   d7f7d93b0503f516a9f0f4d0cddf7401e6203424
commit: 3f93ed4237bd288205221572826f0d16e9b7c526 [11/19] dyndbg-API: specialize DYNDBG_CLASSMAP_(DEFINE|USE)
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230120/202301201202.Ughhyfw8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/3f93ed4237bd288205221572826f0d16e9b7c526
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc hf-5k-rc4
        git checkout 3f93ed4237bd288205221572826f0d16e9b7c526
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                 ^
   security/apparmor/label.c:1100:12: note: 'k' is not equal to field 'size'
                   else if (k == b->size)
                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   security/apparmor/label.c:1100:8: note: '?' condition is false
                   else if (k == b->size)
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
   security/apparmor/label.c:1100:8: note: Taking false branch
                   else if (k == b->size)
                        ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/apparmor/label.c:1103:16: note: Calling 'accum_vec_flags'
           new->flags |= accum_vec_flags(new->vec, new->size);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/label.c:205:2: note: '?' condition is true
           AA_BUG(!vec);
           ^
   security/apparmor/include/lib.h:42:3: note: expanded from macro 'AA_BUG'
                   AA_BUG_FMT((X), "" args);                                   \
                   ^
   security/apparmor/include/lib.h:49:37: note: expanded from macro 'AA_BUG_FMT'
   #define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   security/apparmor/label.c:205:2: note: Taking false branch
           AA_BUG(!vec);
           ^
   security/apparmor/include/lib.h:42:3: note: expanded from macro 'AA_BUG'
                   AA_BUG_FMT((X), "" args);                                   \
                   ^
   security/apparmor/include/lib.h:49:37: note: expanded from macro 'AA_BUG_FMT'
   #define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/apparmor/label.c:205:2: note: Loop condition is false.  Exiting loop
           AA_BUG(!vec);
           ^
   security/apparmor/include/lib.h:40:2: note: expanded from macro 'AA_BUG'
           do {                                                                \
           ^
   security/apparmor/label.c:207:2: note: Loop condition is false. Execution continues on line 214
           for (i = 0; i < n; i++) {
           ^
   security/apparmor/label.c:1103:16: note: Returning from 'accum_vec_flags'
           new->flags |= accum_vec_flags(new->vec, new->size);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/label.c:1104:7: note: Access to field 'ns' results in a dereference of a null pointer
           ls = labels_set(new);
                ^
   security/apparmor/include/label.h:148:25: note: expanded from macro 'labels_set'
   #define labels_set(X) (&labels_ns(X)->labels)
                           ^~~~~~~~~~~~
   security/apparmor/include/label.h:147:22: note: expanded from macro 'labels_ns'
   #define labels_ns(X) (vec_ns(&((X)->vec[0]), (X)->size))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
>> lib/dynamic_debug.c:1289:3: warning: Value stored to 'totct' is never read [clang-analyzer-deadcode.DeadStores]
                   totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, cli_name);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1289:3: note: Value stored to 'totct' is never read
                   totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, cli_name);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/base/platform.c:582:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:582:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:502:2: note: expanded from macro 'PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^
   arch/x86/include/asm/paravirt_types.h:482:8: note: expanded from macro '__PVOP_VCALL'
           (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
                 ^
   arch/x86/include/asm/paravirt_types.h:439:3: note: expanded from macro '____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:370:16: note: expanded from macro 'PVOP_CALL_ARGS'
           unsigned long __eax = __eax, __edx = __edx, __ecx = __ecx;
                         ^
   drivers/block/floppy.c:4240:2: note: Calling 'output_byte'
           output_byte(fdc, FD_DUMPREGS);  /* 82072 and better know DUMPREGS */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/floppy.c:1136:15: note: Calling 'wait_til_ready'
           int status = wait_til_ready(fdc);
                        ^~~~~~~~~~~~~~~~~~~
   drivers/block/floppy.c:1118:2: note: Assuming field 'reset' is 0
           if (fdc_state[fdc].reset)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/block/floppy.c:1118:2: note: '?' condition is false
           if (fdc_state[fdc].reset)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))

vim +/totct +1289 lib/dynamic_debug.c

3f93ed4237bd28 Jim Cromie 2022-11-14  1257  
3f93ed4237bd28 Jim Cromie 2022-11-14  1258  #define vpr_cm_info(cm, _msg, ...)					\
3f93ed4237bd28 Jim Cromie 2022-11-14  1259  	v2pr_info(_msg "module:%s base:%d len:%d type:%d\n", ##__VA_ARGS__, \
3f93ed4237bd28 Jim Cromie 2022-11-14  1260  		  cm->mod_name, cm->base, cm->length, cm->map_type)
3f93ed4237bd28 Jim Cromie 2022-11-14  1261  
3f93ed4237bd28 Jim Cromie 2022-11-14  1262  static void ddebug_match_apply_kparam(const struct kernel_param *kp,
3f93ed4237bd28 Jim Cromie 2022-11-14  1263  				      const struct ddebug_class_map *cm,
3f93ed4237bd28 Jim Cromie 2022-11-14  1264  				      const char *cli_name)
3f93ed4237bd28 Jim Cromie 2022-11-14  1265  {
3f93ed4237bd28 Jim Cromie 2022-11-14  1266  	struct ddebug_class_param *dcp;
3f93ed4237bd28 Jim Cromie 2022-11-14  1267  	unsigned long new_bits, old_bits = 0;
3f93ed4237bd28 Jim Cromie 2022-11-14  1268  	int totct = 0;
3f93ed4237bd28 Jim Cromie 2022-11-14  1269  
3f93ed4237bd28 Jim Cromie 2022-11-14  1270  	if (kp->ops != &param_ops_dyndbg_classes)
3f93ed4237bd28 Jim Cromie 2022-11-14  1271  		return;
3f93ed4237bd28 Jim Cromie 2022-11-14  1272  
3f93ed4237bd28 Jim Cromie 2022-11-14  1273  	dcp = (struct ddebug_class_param *)kp->arg;
3f93ed4237bd28 Jim Cromie 2022-11-14  1274  
3f93ed4237bd28 Jim Cromie 2022-11-14  1275  	if (cm == dcp->map) {
3f93ed4237bd28 Jim Cromie 2022-11-14  1276  		v2pr_info("found kp:%s =0x%lx", kp->name, *dcp->bits);
3f93ed4237bd28 Jim Cromie 2022-11-14  1277  		vpr_cm_info(cm, "mapped to:");
3f93ed4237bd28 Jim Cromie 2022-11-14  1278  		/*
3f93ed4237bd28 Jim Cromie 2022-11-14  1279  		 * using apply-bitmap is too low.
3f93ed4237bd28 Jim Cromie 2022-11-14  1280  		 * param_set_dyndbg_classes uses map_type to sort
3f93ed4237bd28 Jim Cromie 2022-11-14  1281  		 * levels-to-bits.
3f93ed4237bd28 Jim Cromie 2022-11-14  1282  		 * param_set_dyndbg_classes is too high, it takes
3f93ed4237bd28 Jim Cromie 2022-11-14  1283  		 * string inputs.
3f93ed4237bd28 Jim Cromie 2022-11-14  1284  		 * de-union-ing levels/bits might solve it (partly),
3f93ed4237bd28 Jim Cromie 2022-11-14  1285  		 * at least simplifying the translation, and possibly
3f93ed4237bd28 Jim Cromie 2022-11-14  1286  		 * the apply-bitmap fn/iface
3f93ed4237bd28 Jim Cromie 2022-11-14  1287  		 */
3f93ed4237bd28 Jim Cromie 2022-11-14  1288  		new_bits = *dcp->bits;
3f93ed4237bd28 Jim Cromie 2022-11-14 @1289  		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, cli_name);
3f93ed4237bd28 Jim Cromie 2022-11-14  1290  	}
3f93ed4237bd28 Jim Cromie 2022-11-14  1291  }
3f93ed4237bd28 Jim Cromie 2022-11-14  1292  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
