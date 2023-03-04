Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D5184F
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677936176; x=1709472176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVJmQsx92fbH1TJpfhKSfVMJDEYu9C1WyQzin8F8igE=;
  b=bngAEIOAznMTO8ERcWDEXUdQTStYTlT+Ik0W9pbXWg0nxNig5zlJfv6j
   fPpVOAQ/DP7YgICneWiEDQBfQk6m2R1RvwyGvKwTmGpKybjy1mqFsgT3t
   mIUQgQ3AcqkjS1eZNm2GJXnFr2cXpFZ+I3VLc+tMzPEvr5108PlbXVmMR
   Un0qCSfKB6WYWjmWZeQUUgRW0muYj9Mtb21JZkUIPnax26tGnzD71O2ln
   WJEP+nFLtIXmBSTaDRIRGAEMrRC1x8BgecyyH1cJElPPEV9/4JLMPGjVe
   Xg+FpF0QegnQ4g0KmmxLqNrPETv2BWE4/gZ/mFypkmKafzryrthXXnn9R
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="397846030"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="397846030"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 05:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="668959854"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="668959854"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Mar 2023 05:22:54 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYRqf-0002BU-2Q;
	Sat, 04 Mar 2023 13:22:53 +0000
Date: Sat, 4 Mar 2023 21:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/verity/enable.c:29:2: warning: Null pointer passed as 1st
 argument to memory set function [clang-analyzer-unix.cstring.NullArg]
Message-ID: <202303042132.WsItO8Zc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/verity/enable.c:29:2: warning: Null pointer passed as 1st argument to memory set function [clang-analyzer-unix.cstring.NullArg]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Andrey Albershteyn <aalbersh@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0988a0ea791999ebbf95693f2676381825b05033
commit: 56124d6c87fd749477425110d2564166621a89c4 fsverity: support enabling with tree block size < PAGE_SIZE
date:   8 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-c005-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042132.WsItO8Zc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=56124d6c87fd749477425110d2564166621a89c4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 56124d6c87fd749477425110d2564166621a89c4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303042132.WsItO8Zc-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   21 warnings generated.
   include/linux/uaccess.h:188:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/futex/core.c:455:2: note: Calling 'pagefault_disable'
           pagefault_disable();
           ^~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:205:2: note: Calling 'pagefault_disabled_inc'
           pagefault_disabled_inc();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:188:2: note: Dereference of null pointer
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/futex/core.c:224:25: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct mm_struct *mm = current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/futex/core.c:224:25: note: Dereference of null pointer
           struct mm_struct *mm = current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/futex/core.c:411:25: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct mm_struct *mm = current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/futex/core.c:411:25: note: Dereference of null pointer
           struct mm_struct *mm = current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/futex/core.c:555:13: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           prio = min(current->normal_prio, MAX_RT_PRIO);
                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x = (x);               \
                                         ^
   kernel/futex/core.c:555:13: note: Dereference of null pointer
           prio = min(current->normal_prio, MAX_RT_PRIO);
                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x = (x);               \
                                         ^
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
>> fs/verity/enable.c:29:2: warning: Null pointer passed as 1st argument to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(&cur->data[cur->filled], 0, params->block_size - cur->filled);
           ^
   fs/verity/enable.c:322:2: note: Taking false branch
           if (copy_from_user(&arg, uarg, sizeof(arg)))
           ^
   fs/verity/enable.c:325:6: note: Assuming field 'version' is equal to 1
           if (arg.version != 1)
               ^~~~~~~~~~~~~~~~
   fs/verity/enable.c:325:2: note: Taking false branch
           if (arg.version != 1)
           ^
   fs/verity/enable.c:328:6: note: Assuming field '__reserved1' is 0
           if (arg.__reserved1 ||
               ^~~~~~~~~~~~~~~
   fs/verity/enable.c:328:6: note: Left side of '||' is false
   fs/verity/enable.c:329:6: note: Assuming the condition is false
               memchr_inv(arg.__reserved2, 0, sizeof(arg.__reserved2)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/enable.c:328:2: note: Taking false branch
           if (arg.__reserved1 ||
           ^
   fs/verity/enable.c:332:2: note: Taking false branch
           if (!is_power_of_2(arg.block_size))
           ^
   fs/verity/enable.c:335:6: note: Assuming the condition is false
           if (arg.salt_size > sizeof_field(struct fsverity_descriptor, salt))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/enable.c:335:2: note: Taking false branch
           if (arg.salt_size > sizeof_field(struct fsverity_descriptor, salt))
           ^
   fs/verity/enable.c:338:6: note: Assuming the condition is false
           if (arg.sig_size > FS_VERITY_MAX_SIGNATURE_SIZE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/enable.c:338:2: note: Taking false branch
           if (arg.sig_size > FS_VERITY_MAX_SIGNATURE_SIZE)
           ^
   fs/verity/enable.c:349:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/verity/enable.c:349:2: note: Taking false branch
           if (err)
           ^
   fs/verity/enable.c:352:6: note: Assuming the condition is false
           if (IS_APPEND(inode))
               ^
   include/linux/fs.h:2307:27: note: expanded from macro 'IS_APPEND'
   #define IS_APPEND(inode)        ((inode)->i_flags & S_APPEND)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/enable.c:352:2: note: Taking false branch
           if (IS_APPEND(inode))
           ^
   fs/verity/enable.c:355:6: note: Assuming the condition is false
           if (S_ISDIR(inode->i_mode))
               ^
   include/uapi/linux/stat.h:23:21: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) == S_IFDIR)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/enable.c:355:2: note: Taking false branch
           if (S_ISDIR(inode->i_mode))
           ^
   fs/verity/enable.c:358:7: note: Assuming the condition is true
           if (!S_ISREG(inode->i_mode))
                ^
   include/uapi/linux/stat.h:22:21: note: expanded from macro 'S_ISREG'
   #define S_ISREG(m)      (((m) & S_IFMT) == S_IFREG)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/enable.c:358:2: note: Taking false branch
           if (!S_ISREG(inode->i_mode))
           ^
   fs/verity/enable.c:362:6: note: Assuming 'err' is 0
           if (err) /* -EROFS */
               ^~~
   fs/verity/enable.c:362:2: note: Taking false branch
           if (err) /* -EROFS */
           ^
   fs/verity/enable.c:366:6: note: 'err' is 0
           if (err) /* -ETXTBSY */
               ^~~
   fs/verity/enable.c:366:2: note: Taking false branch
           if (err) /* -ETXTBSY */
           ^
   fs/verity/enable.c:369:8: note: Calling 'enable_verity'
           err = enable_verity(filp, &arg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/enable.c:194:6: note: Assuming 'desc' is non-null
           if (!desc)
               ^~~~~
   fs/verity/enable.c:194:2: note: Taking false branch
           if (!desc)
           ^
   fs/verity/enable.c:198:24: note: '?' condition is false
           desc->log_blocksize = ilog2(arg->block_size);
                                 ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   fs/verity/enable.c:198:24: note: '?' condition is true
           desc->log_blocksize = ilog2(arg->block_size);
                                 ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'

vim +29 fs/verity/enable.c

c22415d333fbab Eric Biggers 2020-01-06  19  
56124d6c87fd74 Eric Biggers 2022-12-23  20  /* Hash a block, writing the result to the next level's pending block buffer. */
56124d6c87fd74 Eric Biggers 2022-12-23  21  static int hash_one_block(struct inode *inode,
3fda4c617e84c2 Eric Biggers 2019-07-22  22  			  const struct merkle_tree_params *params,
56124d6c87fd74 Eric Biggers 2022-12-23  23  			  struct ahash_request *req, struct block_buffer *cur)
3fda4c617e84c2 Eric Biggers 2019-07-22  24  {
56124d6c87fd74 Eric Biggers 2022-12-23  25  	struct block_buffer *next = cur + 1;
3fda4c617e84c2 Eric Biggers 2019-07-22  26  	int err;
3fda4c617e84c2 Eric Biggers 2019-07-22  27  
56124d6c87fd74 Eric Biggers 2022-12-23  28  	/* Zero-pad the block if it's shorter than the block size. */
56124d6c87fd74 Eric Biggers 2022-12-23 @29  	memset(&cur->data[cur->filled], 0, params->block_size - cur->filled);
c22415d333fbab Eric Biggers 2020-01-06  30  
56124d6c87fd74 Eric Biggers 2022-12-23  31  	err = fsverity_hash_block(params, inode, req, virt_to_page(cur->data),
56124d6c87fd74 Eric Biggers 2022-12-23  32  				  offset_in_page(cur->data),
56124d6c87fd74 Eric Biggers 2022-12-23  33  				  &next->data[next->filled]);
3fda4c617e84c2 Eric Biggers 2019-07-22  34  	if (err)
3fda4c617e84c2 Eric Biggers 2019-07-22  35  		return err;
56124d6c87fd74 Eric Biggers 2022-12-23  36  	next->filled += params->digest_size;
56124d6c87fd74 Eric Biggers 2022-12-23  37  	cur->filled = 0;
3fda4c617e84c2 Eric Biggers 2019-07-22  38  	return 0;
56124d6c87fd74 Eric Biggers 2022-12-23  39  }
3fda4c617e84c2 Eric Biggers 2019-07-22  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
