Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A42588
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Mar 2023 12:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677674842; x=1709210842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PFyczJq1etpIkHI3J4IwWhx3t8NTjIqE2RDH3kK7ig=;
  b=bU1A0BGm1isa8+39V6GCLEZsE9yXTormjbu1HkvzPPzh/N06h833WJCj
   r6fQpmB5ZEDdc1soEydDxDuEFkEWznJz8rsC7zMLauUTY7RdFvMQPV+1B
   4yM+F7XBwjUIngEc0obqah0WOyUEuwW53CtvwOE3J6URCMsyk+NSOh/HY
   KSTJmiCAtxikA4sMsVlmVCrzttUp80bNBU5E4TsZ6HT/lGKBZ98wpYxM+
   nY9VqJfOmUbxMS4aVD4YE04pCPyxfEOWsps9it432w6hunFmjT3LPVF73
   0ipNRppjC5eNQYFojvt/OArfNcx4Y1sDdDj+QD/abyxmLddDrD/GbndUF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="399180274"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="399180274"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 04:47:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676746426"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="676746426"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2023 04:47:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXLrZ-00069L-0I;
	Wed, 01 Mar 2023 12:47:17 +0000
Date: Wed, 1 Mar 2023 20:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/media/av7110/sp8870.c:381:2: warning: Value stored
 to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303012020.QQnimk4N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/staging/media/av7110/sp8870.c:381:2: warning: Value stored to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0927a7a5391f7d8e593e5e50ead7505a23cadf9
commit: 0fcb867718519060c90afea2d9af0a7cc1c3bd36 media: Revert "media: av7110: move to staging/media/deprecated/saa7146"
date:   3 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230226 (https://download.01.org/0day-ci/archive/20230301/202303012020.QQnimk4N-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fcb867718519060c90afea2d9af0a7cc1c3bd36
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0fcb867718519060c90afea2d9af0a7cc1c3bd36
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303012020.QQnimk4N-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   21 warnings generated.
   drivers/staging/sm750fb/sm750.c:370:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750.c:370:2: note: Value stored to 'ret' is never read
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750.c:487:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750.c:487:2: note: Value stored to 'ret' is never read
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750.c:706:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750.c:706:2: note: Value stored to 'ret' is never read
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750.c:1136:4: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(tmp, opt);
                           ^~~~~~
   drivers/staging/sm750fb/sm750.c:1136:4: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                           strcat(tmp, opt);
                           ^~~~~~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/staging/sm750fb/sm750_hw.c:33:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750_hw.c:33:2: note: Value stored to 'ret' is never read
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750_hw.c:262:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = 0;
           ^     ~
   drivers/staging/sm750fb/sm750_hw.c:262:2: note: Value stored to 'ret' is never read
           ret = 0;
           ^     ~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/char/pcmcia/cm4000_cs.c:1570:4: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                           rc = 0;
                           ^    ~
   drivers/char/pcmcia/cm4000_cs.c:1570:4: note: Value stored to 'rc' is never read
                           rc = 0;
                           ^    ~
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (5 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c:122:2: warning: Value stored to 'xacm' is never read [clang-analyzer-deadcode.DeadStores]
           xacm = 0;
           ^      ~
   drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c:122:2: note: Value stored to 'xacm' is never read
           xacm = 0;
           ^      ~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (5 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/staging/media/av7110/sp8870.c:381:2: warning: Value stored to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp = ret & 0x3F;
           ^     ~~~~~~~~~~
   drivers/staging/media/av7110/sp8870.c:381:2: note: Value stored to 'tmp' is never read
           tmp = ret & 0x3F;
           ^     ~~~~~~~~~~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/media/i2c/st-mipid02.c:943:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = -EINVAL;
                   ^     ~~~~~~~
   drivers/media/i2c/st-mipid02.c:943:3: note: Value stored to 'ret' is never read
                   ret = -EINVAL;
                   ^     ~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/media/i2c/tda1997x.c:1037:2: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg = io_write(sd, REG_RATE_CTRL, reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tda1997x.c:1037:2: note: Value stored to 'reg' is never read
           reg = io_write(sd, REG_RATE_CTRL, reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tda1997x.c:1520:3: warning: Value stored to 'source' is never read [clang-analyzer-deadcode.DeadStores]
                   source &= ~MASK_AVI_IF;
                   ^         ~~~~~~~~~~~~
   drivers/media/i2c/tda1997x.c:1520:3: note: Value stored to 'source' is never read
                   source &= ~MASK_AVI_IF;
                   ^         ~~~~~~~~~~~~
   drivers/media/i2c/tda1997x.c:2123:2: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg = io_read(sd, REG_VERSION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tda1997x.c:2123:2: note: Value stored to 'reg' is never read
           reg = io_read(sd, REG_VERSION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tda1997x.c:2125:2: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg = io_read(sd, REG_CMTP_REG10);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tda1997x.c:2125:2: note: Value stored to 'reg' is never read
           reg = io_read(sd, REG_CMTP_REG10);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
--
   17 warnings generated.
   include/linux/sched/mm.h:290:23: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           unsigned int flags = current->flags & PF_MEMALLOC_NOIO;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/ceph/crypto.c:74:9: note: Calling 'set_secret'
           return set_secret(dst, src->key);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/crypto.c:31:2: note: Control jumps to 'case 1:'  at line 34
           switch (key->type) {
           ^
   net/ceph/crypto.c:35:3: note:  Execution continues on line 40
                   break;
                   ^
   net/ceph/crypto.c:40:6: note: Assuming field 'len' is not equal to 0
           if (!key->len)
               ^~~~~~~~~
   net/ceph/crypto.c:40:2: note: Taking false branch
           if (!key->len)
           ^
   net/ceph/crypto.c:44:6: note: Assuming field 'key' is non-null
           if (!key->key) {
               ^~~~~~~~~
   net/ceph/crypto.c:44:2: note: Taking false branch
           if (!key->key) {
           ^
   net/ceph/crypto.c:50:14: note: Calling 'memalloc_noio_save'
           noio_flag = memalloc_noio_save();
                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:290:23: note: Dereference of null pointer
           unsigned int flags = current->flags & PF_MEMALLOC_NOIO;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   net/core/gro_cells.c:18:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:762:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:94:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   Suppressed 25 warnings (13 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (4 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
>> drivers/staging/media/av7110/av7110_av.c:638:2: warning: Value stored to 'c2' is never read [clang-analyzer-deadcode.DeadStores]
           c2 = 0;
           ^    ~
   drivers/staging/media/av7110/av7110_av.c:638:2: note: Value stored to 'c2' is never read
           c2 = 0;
           ^    ~
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   27 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   net/ipv6/output_core.c:107:6: note: Assuming 'hoplimit' is equal to 0
           if (hoplimit == 0) {
               ^~~~~~~~~~~~~
   net/ipv6/output_core.c:107:2: note: Taking true branch
           if (hoplimit == 0) {
           ^
   net/ipv6/output_core.c:111:3: note: Calling 'rcu_read_lock'
                   rcu_read_lock();
                   ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:762:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:94:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
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
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/tmp +381 drivers/staging/media/av7110/sp8870.c

^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  368  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  369  static int sp8870_read_ber (struct dvb_frontend* fe, u32 * ber)
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  370  {
b8742700f13163 drivers/media/dvb/frontends/sp8870.c Johannes Stezenbach 2005-05-16  371  	struct sp8870_state* state = fe->demodulator_priv;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  372  	int ret;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  373  	u32 tmp;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  374  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  375  	*ber = 0;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  376  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  377  	ret = sp8870_readreg(state, 0xC08);
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  378  	if (ret < 0)
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  379  		return -EIO;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  380  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16 @381  	tmp = ret & 0x3F;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  382  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  383  	ret = sp8870_readreg(state, 0xC07);
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  384  	if (ret < 0)
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  385  		return -EIO;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  386  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  387  	tmp = ret << 6;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  388  	if (tmp >= 0x3FFF0)
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  389  		tmp = ~0;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  390  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  391  	*ber = tmp;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  392  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  393  	return 0;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  394  }
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  395  

:::::: The code at line 381 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
