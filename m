Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680FA198
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675010178; x=1706546178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Og8qMsV1LYI24PWpqFM9QinM4a+JBLDS9gnFnFklrPs=;
  b=Z3DX8Jh9x4ODgVmyyfDLwQhhfWCzKYdInbscNBkbxCR6dRMwEgQL4wa1
   a6XgAgjhvXQ67Cgj+8cwvKxpdUTsYyqD5s2QrP7VcvSmetbRES7YfaiQO
   pYS3oYi8S2VmegksFGjAE2p6GJL0Fa6AWb8s5Tp6QO7m3BHufin4Jd6C/
   hJUHbVerUq+BN/Cq9MzdNSip/qRmDQBSBXrMkfuKuvduqnEy8xjezm4R5
   ue2TWhqqkcgKSPsRZ4s+WXEEkCogrwm+8qCXuRGm9twudg40R903VtqaX
   3+d4PsGFfJl36lqcmuRmmm8arZUaJslYC4dlwOHz80RNfBlnjQ+kNakEq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="311029989"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="311029989"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 08:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="787761960"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="787761960"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Jan 2023 08:36:16 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMAf9-0002wY-1M;
	Sun, 29 Jan 2023 16:36:15 +0000
Date: Mon, 30 Jan 2023 00:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc2-nesting 11/41]
 drivers/vfio/vfio_main.c:1242:6: warning: Branch condition evaluates to a
 garbage value [clang-analyzer-core.uninitialized.Branch]
Message-ID: <202301300024.KgkvSBDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/vfio/vfio_main.c:1242:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd-v6.2-rc2-nesting
head:   f9c22cd2206b239919f6290e33e92cd53748dd0c
commit: 66388c66d9b989bea2c2580f717dabd1470bc36f [11/41] vfio: Add ioctls for device cdev iommufd
:::::: branch date: 2 weeks ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-c004-20230123 (https://download.01.org/0day-ci/archive/20230130/202301300024.KgkvSBDh-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/66388c66d9b989bea2c2580f717dabd1470bc36f
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc2-nesting
        git checkout 66388c66d9b989bea2c2580f717dabd1470bc36f
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to 'to->argsz'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to 'to->argsz'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to 'to->argsz'
           return n;
           ^
   drivers/vfio/vfio_main.c:1103:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&feature, arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1103:2: note: Taking false branch
           if (copy_from_user(&feature, arg, minsz))
           ^
   drivers/vfio/vfio_main.c:1106:20: note: The left operand of '<' is a garbage value
           if (feature.argsz < minsz)
               ~~~~~~~~~~~~~ ^
   drivers/vfio/vfio_main.c:1171:17: warning: The left operand of '<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (bind.argsz < minsz || bind.flags)
                          ^
   drivers/vfio/vfio_main.c:1281:6: note: Assuming the condition is true
           if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1281:2: note: Taking true branch
           if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
           ^
   drivers/vfio/vfio_main.c:1282:10: note: Calling 'vfio_device_ioctl_bind_iommufd'
                   return vfio_device_ioctl_bind_iommufd(df, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1168:6: note: Calling 'copy_from_user'
           if (copy_from_user(&bind, (void __user *)arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to 'to->argsz'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to 'to->argsz'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to 'to->argsz'
           return n;
           ^
   drivers/vfio/vfio_main.c:1168:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&bind, (void __user *)arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1168:2: note: Taking false branch
           if (copy_from_user(&bind, (void __user *)arg, minsz))
           ^
   drivers/vfio/vfio_main.c:1171:17: note: The left operand of '<' is a garbage value
           if (bind.argsz < minsz || bind.flags)
               ~~~~~~~~~~ ^
>> drivers/vfio/vfio_main.c:1242:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (attach.flags)
               ^
   drivers/vfio/vfio_main.c:1281:6: note: Assuming the condition is false
           if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1281:2: note: Taking false branch
           if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
           ^
   drivers/vfio/vfio_main.c:1285:11: note: Left side of '||' is true
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:205:37: note: expanded from macro 'smp_load_acquire'
           __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
                                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:29: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                      ^
   drivers/vfio/vfio_main.c:1285:11: note: Taking false branch
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:205:37: note: expanded from macro 'smp_load_acquire'
           __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
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
   drivers/vfio/vfio_main.c:1285:11: note: Loop condition is false.  Exiting loop
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:205:37: note: expanded from macro 'smp_load_acquire'
           __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
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
   drivers/vfio/vfio_main.c:1285:11: note: Left side of '||' is true
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:361:21: note: expanded from macro 'compiletime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
                              ^
   include/linux/compiler_types.h:325:29: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                      ^
   drivers/vfio/vfio_main.c:1285:11: note: Taking false branch
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:361:2: note: expanded from macro 'compiletime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
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
   drivers/vfio/vfio_main.c:1285:11: note: Loop condition is false.  Exiting loop
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
           compiletime_assert_atomic_type(*p);                             \
--
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to 'to->argsz'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to 'to->argsz'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to 'to->argsz'
           return n;
           ^
   drivers/vfio/vfio_main.c:1103:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&feature, arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1103:2: note: Taking false branch
           if (copy_from_user(&feature, arg, minsz))
           ^
   drivers/vfio/vfio_main.c:1106:20: note: The left operand of '<' is a garbage value
           if (feature.argsz < minsz)
               ~~~~~~~~~~~~~ ^
   drivers/vfio/vfio_main.c:1171:17: warning: The left operand of '<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (bind.argsz < minsz || bind.flags)
                          ^
   drivers/vfio/vfio_main.c:1281:6: note: Assuming the condition is true
           if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1281:2: note: Taking true branch
           if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
           ^
   drivers/vfio/vfio_main.c:1282:10: note: Calling 'vfio_device_ioctl_bind_iommufd'
                   return vfio_device_ioctl_bind_iommufd(df, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1168:6: note: Calling 'copy_from_user'
           if (copy_from_user(&bind, (void __user *)arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to 'to->argsz'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to 'to->argsz'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to 'to->argsz'
           return n;
           ^
   drivers/vfio/vfio_main.c:1168:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&bind, (void __user *)arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1168:2: note: Taking false branch
           if (copy_from_user(&bind, (void __user *)arg, minsz))
           ^
   drivers/vfio/vfio_main.c:1171:17: note: The left operand of '<' is a garbage value
           if (bind.argsz < minsz || bind.flags)
               ~~~~~~~~~~ ^
>> drivers/vfio/vfio_main.c:1242:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (attach.flags)
               ^
   drivers/vfio/vfio_main.c:1281:6: note: Assuming the condition is false
           if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c:1281:2: note: Taking false branch
           if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
           ^
   drivers/vfio/vfio_main.c:1285:11: note: Left side of '||' is true
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:205:37: note: expanded from macro 'smp_load_acquire'
           __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
                                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:29: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                      ^
   drivers/vfio/vfio_main.c:1285:11: note: Taking false branch
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:205:37: note: expanded from macro 'smp_load_acquire'
           __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
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
   drivers/vfio/vfio_main.c:1285:11: note: Loop condition is false.  Exiting loop
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:205:37: note: expanded from macro 'smp_load_acquire'
           __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
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
   drivers/vfio/vfio_main.c:1285:11: note: Left side of '||' is true
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:361:21: note: expanded from macro 'compiletime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
                              ^
   include/linux/compiler_types.h:325:29: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                      ^
   drivers/vfio/vfio_main.c:1285:11: note: Taking false branch
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:361:2: note: expanded from macro 'compiletime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
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
   drivers/vfio/vfio_main.c:1285:11: note: Loop condition is false.  Exiting loop
           access = smp_load_acquire(&df->access_granted);
                    ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
           compiletime_assert_atomic_type(*p);                             \

vim +1242 drivers/vfio/vfio_main.c

66388c66d9b989 Yi Liu 2022-12-02  1231  
66388c66d9b989 Yi Liu 2022-12-02  1232  static int vfio_ioctl_device_attach(struct vfio_device *device,
66388c66d9b989 Yi Liu 2022-12-02  1233  				    struct vfio_device_feature __user *arg)
66388c66d9b989 Yi Liu 2022-12-02  1234  {
66388c66d9b989 Yi Liu 2022-12-02  1235  	struct vfio_device_attach_iommufd_pt attach;
66388c66d9b989 Yi Liu 2022-12-02  1236  	u32 pt_id;
66388c66d9b989 Yi Liu 2022-12-02  1237  	int ret;
66388c66d9b989 Yi Liu 2022-12-02  1238  
66388c66d9b989 Yi Liu 2022-12-02  1239  	if (copy_from_user(&attach, (void __user *)arg, sizeof(attach)))
66388c66d9b989 Yi Liu 2022-12-02  1240  		return -EFAULT;
66388c66d9b989 Yi Liu 2022-12-02  1241  
66388c66d9b989 Yi Liu 2022-12-02 @1242  	if (attach.flags)
66388c66d9b989 Yi Liu 2022-12-02  1243  		return -EINVAL;
66388c66d9b989 Yi Liu 2022-12-02  1244  
66388c66d9b989 Yi Liu 2022-12-02  1245  	if (!device->ops->bind_iommufd)
66388c66d9b989 Yi Liu 2022-12-02  1246  		return -ENODEV;
66388c66d9b989 Yi Liu 2022-12-02  1247  
66388c66d9b989 Yi Liu 2022-12-02  1248  	mutex_lock(&device->dev_set->lock);
66388c66d9b989 Yi Liu 2022-12-02  1249  	pt_id = attach.pt_id;
66388c66d9b989 Yi Liu 2022-12-02  1250  	ret = vfio_iommufd_attach(device,
66388c66d9b989 Yi Liu 2022-12-02  1251  				  pt_id != IOMMUFD_INVALID_ID ? &pt_id : NULL);
66388c66d9b989 Yi Liu 2022-12-02  1252  	if (ret)
66388c66d9b989 Yi Liu 2022-12-02  1253  		goto out_unlock;
66388c66d9b989 Yi Liu 2022-12-02  1254  
66388c66d9b989 Yi Liu 2022-12-02  1255  	if (pt_id != IOMMUFD_INVALID_ID) {
66388c66d9b989 Yi Liu 2022-12-02  1256  		ret = copy_to_user((void __user *)arg + offsetofend(
66388c66d9b989 Yi Liu 2022-12-02  1257  				   struct vfio_device_attach_iommufd_pt, flags),
66388c66d9b989 Yi Liu 2022-12-02  1258  				   &pt_id,
66388c66d9b989 Yi Liu 2022-12-02  1259  				   sizeof(pt_id)) ? -EFAULT : 0;
66388c66d9b989 Yi Liu 2022-12-02  1260  		if (ret)
66388c66d9b989 Yi Liu 2022-12-02  1261  			goto out_detach;
66388c66d9b989 Yi Liu 2022-12-02  1262  	}
66388c66d9b989 Yi Liu 2022-12-02  1263  	mutex_unlock(&device->dev_set->lock);
66388c66d9b989 Yi Liu 2022-12-02  1264  	return 0;
66388c66d9b989 Yi Liu 2022-12-02  1265  
66388c66d9b989 Yi Liu 2022-12-02  1266  out_detach:
66388c66d9b989 Yi Liu 2022-12-02  1267  	vfio_iommufd_attach(device, NULL);
66388c66d9b989 Yi Liu 2022-12-02  1268  out_unlock:
66388c66d9b989 Yi Liu 2022-12-02  1269  	mutex_unlock(&device->dev_set->lock);
66388c66d9b989 Yi Liu 2022-12-02  1270  	return ret;
66388c66d9b989 Yi Liu 2022-12-02  1271  }
66388c66d9b989 Yi Liu 2022-12-02  1272  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
