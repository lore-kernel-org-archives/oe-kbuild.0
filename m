Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47788BFB
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Mar 2023 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680017483; x=1711553483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2jxhv1ZY8nkSztwyEoBS/aXdQdWKVeBO78eCtxzlSk=;
  b=fd5F3WkNgMnj+EZSqM16My3V0N6VQ5xwmkCjTInla11ydUp6Upx6v47j
   gjmfQoACqpvDN+PntyR5rpfnPOiHqW2Xi+td0PgObVr+sjsRRYDsgN9AY
   FtVI6phJEHm+LVckkGHxUkD2+j50iRepxfT3CxFL984d1+rv0kqpYiIme
   Y7tN2gR9M/aoIw2InnQiodyNZLxwEfY4i4VrzDtiLWxa9MqoygEl+hAKI
   kl6c3qDD1rv1+0XlTbqML8IbeSC5uWgFLNQGD4EA8M7wA7Z6vQAjmZRsj
   3UxXNCV9J4Vj1GwPCgkRX7YilQ/ffdF6ykYV8Jn28nI3ro+Zek3lI1oP1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405540642"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="405540642"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 08:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773183669"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="773183669"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2023 08:31:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phBHx-000Ien-2H;
	Tue, 28 Mar 2023 15:31:09 +0000
Date: Tue, 28 Mar 2023 23:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/6] Input: cyttsp5: implement proper sleep and wakeup
 procedures
Message-ID: <202303282312.j5hmFKVi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/input/touchscreen/cyttsp5.c:1003:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230323135205.1160879-7-mweigand@mweigand.net>
References: <20230323135205.1160879-7-mweigand@mweigand.net>
TO: Maximilian Weigand <mweigand@mweigand.net>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: linux-input@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Maximilian Weigand <mweigand@mweigand.net>
CC: Alistair Francis <alistair@alistair23.me>

Hi Maximilian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus linus/master v6.3-rc4 next-20230328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maximilian-Weigand/Input-cyttsp5-fix-array-length/20230323-215957
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20230323135205.1160879-7-mweigand%40mweigand.net
patch subject: [PATCH 6/6] Input: cyttsp5: implement proper sleep and wakeup procedures
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20230322 (https://download.01.org/0day-ci/archive/20230328/202303282312.j5hmFKVi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/9988f8132aa9a4e8c9f0eb3093b06a9f02d90ec9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maximilian-Weigand/Input-cyttsp5-fix-array-length/20230323-215957
        git checkout 9988f8132aa9a4e8c9f0eb3093b06a9f02d90ec9
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303282312.j5hmFKVi-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/input/mouse/psmouse-base.c:712:6: note: 'set_properties' is true
           if (set_properties) {
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
   drivers/input/mouse/psmouse-base.c:712:2: note: '?' condition is true
           if (set_properties) {
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
   drivers/input/mouse/psmouse-base.c:712:2: note: Taking true branch
           if (set_properties) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/input/mouse/psmouse-base.c:716:3: note: Left side of '&&' is true
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   drivers/input/mouse/psmouse-base.c:716:3: note: Assuming field 'keybit' is equal to 0
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/psmouse-base.c:716:3: note: Left side of '&&' is false
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   drivers/input/mouse/psmouse-base.c:716:25: note: Passing null pointer value via 2nd parameter 'addr'
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                                         ^
   include/linux/bitops.h:55:52: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                                                 ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   drivers/input/mouse/psmouse-base.c:716:3: note: Calling 'generic___set_bit'
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                   ^
   include/linux/bitops.h:55:36: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:6:21: note: expanded from macro '___set_bit'
   #define ___set_bit              arch___set_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:7:24: note: expanded from macro 'arch___set_bit'
   #define arch___set_bit generic___set_bit
                          ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:31:2: note: 'p' initialized to a null pointer value
           unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
           ^~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:33:6: note: Dereference of null pointer (loaded from variable 'p')
           *p  |= mask;
            ~  ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/input/touchscreen/cyttsp5.c:1003:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client = to_i2c_client(dev);
                              ^~~~~~
   drivers/input/touchscreen/cyttsp5.c:1003:21: note: Value stored to 'client' during its initialization is never read
           struct i2c_client *client = to_i2c_client(dev);
                              ^~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:33:6: warning: Dereference of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDereference]
           *p  |= mask;
               ^
   drivers/input/touchscreen/cyttsp5.c:877:6: note: Assuming 'ts' is non-null
           if (!ts)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/input/touchscreen/cyttsp5.c:877:2: note: '?' condition is false
           if (!ts)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/input/touchscreen/cyttsp5.c:877:7: note: 'ts' is non-null
           if (!ts)
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
   drivers/input/touchscreen/cyttsp5.c:877:2: note: '?' condition is false
           if (!ts)
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
   drivers/input/touchscreen/cyttsp5.c:877:2: note: Taking false branch
           if (!ts)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/input/touchscreen/cyttsp5.c:891:2: note: '?' condition is false
           if (IS_ERR(ts->vdd)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/input/touchscreen/cyttsp5.c:891:2: note: '?' condition is false
           if (IS_ERR(ts->vdd)) {
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
   drivers/input/touchscreen/cyttsp5.c:891:2: note: Taking false branch
           if (IS_ERR(ts->vdd)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/input/touchscreen/cyttsp5.c:897:2: note: '?' condition is false
           if (error)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/input/touchscreen/cyttsp5.c:897:6: note: 'error' is 0
           if (error)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))

vim +/client +1003 drivers/input/touchscreen/cyttsp5.c

9988f8132aa9a4 Maximilian Weigand 2023-03-23   999  
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1000  static int __maybe_unused cyttsp5_resume(struct device *dev)
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1001  {
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1002  	struct cyttsp5 *ts = dev_get_drvdata(dev);
9988f8132aa9a4 Maximilian Weigand 2023-03-23 @1003  	struct i2c_client *client = to_i2c_client(dev);
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1004  	int error;
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1005  
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1006  	if (!ts->is_wakeup_source)
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1007  		cyttsp5_wakeup(ts);
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1008  
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1009  	return 0;
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1010  }
9988f8132aa9a4 Maximilian Weigand 2023-03-23  1011  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
