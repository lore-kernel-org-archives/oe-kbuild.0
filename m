Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8766D19
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067254; x=1710603254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwLtwccHpiN3SoGwxyHfYn5fIGpEOnZm2V+QHer0Jew=;
  b=MNjOLQ8oHq3HgKT44iwZyVNPXOdIYDXU9gV3UiJz26NtbyrA7vzzlBiQ
   9qXmPNVOAHlYc26uaC7mbpe1nnkEeccEG4eDjuf7ghD0+J+4upKHbwA6F
   eemg372qmMlzj9j/hdGiuoWcFNs6I/nPW/p7wXyMnrEN5itAZOKtB/Yck
   0NNkT2qkOYc17Qz5zUybzewh3+FlPeoSkhGxqtZxppP3NnOlDQK0S8LZu
   ggQsy3QCWUwh88Pyv8sm1TH/Q2a1c1E4Ag1qIJRaW3PfDilezJ4xCZp75
   M9gvpnHsBPPs2HlBQiytXz3eLGJamGAmRU9Do0fWHK1D5SnXBIN2vc9Sm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339826385"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="339826385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="657598371"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="657598371"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Mar 2023 08:34:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdC5r-0009RW-2Z;
	Fri, 17 Mar 2023 15:34:11 +0000
Date: Fri, 17 Mar 2023 23:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 5/6] cxl/trace: Add an HPA to cxl_poison trace events
Message-ID: <202303172341.wQUY5Y6X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/cxl/core/trace.c:26:11: warning: Division by zero [clang-analyzer-core.DivideZero]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <b784c7320da183bca8b2c0c0346f3006d88bc4aa.1678468593.git.alison.schofield@intel.com>
References: <b784c7320da183bca8b2c0c0346f3006d88bc4aa.1678468593.git.alison.schofield@intel.com>
TO: alison.schofield@intel.com

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on e686c32590f40bffc45f105c04c836ffad3e531a]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-schofield-intel-com/cxl-mbox-Add-GET_POISON_LIST-mailbox-command/20230311-015849
base:   e686c32590f40bffc45f105c04c836ffad3e531a
patch link:    https://lore.kernel.org/r/b784c7320da183bca8b2c0c0346f3006d88bc4aa.1678468593.git.alison.schofield%40intel.com
patch subject: [PATCH v8 5/6] cxl/trace: Add an HPA to cxl_poison trace events
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: s390-randconfig-c005-20230312 (https://download.01.org/0day-ci/archive/20230317/202303172341.wQUY5Y6X-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4aa396abd805d9b94057c5c1088124899356f5ca
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review alison-schofield-intel-com/cxl-mbox-Add-GET_POISON_LIST-mailbox-command/20230311-015849
        git checkout 4aa396abd805d9b94057c5c1088124899356f5ca
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303172341.wQUY5Y6X-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                    ^~~~~~~~~~~
   include/linux/preempt.h:101:22: note: expanded from macro 'nmi_count'
   #define nmi_count()     (preempt_count() & NMI_MASK)
                            ^~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is true
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:326:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   arch/s390/include/asm/preempt.h:17:9: note: Taking false branch
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Dereference of null pointer
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/async.c:125:2: warning: Value stored to 'calltime' is never read [clang-analyzer-deadcode.DeadStores]
           calltime = ktime_get();
           ^          ~~~~~~~~~~~
   kernel/async.c:125:2: note: Value stored to 'calltime' is never read
           calltime = ktime_get();
           ^          ~~~~~~~~~~~
   kernel/async.c:272:2: warning: Value stored to 'starttime' is never read [clang-analyzer-deadcode.DeadStores]
           starttime = ktime_get();
           ^           ~~~~~~~~~~~
   kernel/async.c:272:2: note: Value stored to 'starttime' is never read
           starttime = ktime_get();
           ^           ~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/cxl/core/trace.c:26:11: warning: Division by zero [clang-analyzer-core.DivideZero]
           offset = do_div(offset, gran * ways);
                    ^
   include/asm-generic/div64.h:48:26: note: expanded from macro 'do_div'
           __rem = ((uint64_t)(n)) % __base;                       \
                                   ^
   drivers/cxl/core/trace.c:90:18: note: Assuming 'i' is < field 'nr_targets'
           for (int i = 0; i <  p->nr_targets; i++) {
                           ^~~~~~~~~~~~~~~~~~
   drivers/cxl/core/trace.c:90:2: note: Loop condition is true.  Entering loop body
           for (int i = 0; i <  p->nr_targets; i++) {
           ^
   drivers/cxl/core/trace.c:92:7: note: Assuming the condition is true
                   if (cxlmd == cxled_to_memdev(cxled))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/trace.c:92:3: note: Taking true branch
                   if (cxlmd == cxled_to_memdev(cxled))
                   ^
   drivers/cxl/core/trace.c:93:4: note:  Execution continues on line 95
                           break;
                           ^
   drivers/cxl/core/trace.c:95:7: note: 'cxled' is non-null
           if (!cxled || cxlmd != cxled_to_memdev(cxled))
                ^~~~~
   drivers/cxl/core/trace.c:95:6: note: Left side of '||' is false
           if (!cxled || cxlmd != cxled_to_memdev(cxled))
               ^
   drivers/cxl/core/trace.c:95:16: note: Assuming the condition is false
           if (!cxled || cxlmd != cxled_to_memdev(cxled))
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/trace.c:95:2: note: Taking false branch
           if (!cxled || cxlmd != cxled_to_memdev(cxled))
           ^
   drivers/cxl/core/trace.c:98:9: note: Calling 'cxl_dpa_to_hpa'
           return cxl_dpa_to_hpa(dpa, cxlr, cxled);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/trace.c:63:6: note: 'eiw' is < 8
           if (eiw < 8) {
               ^~~
   drivers/cxl/core/trace.c:63:2: note: Taking true branch
           if (eiw < 8) {
           ^
   drivers/cxl/core/trace.c:78:7: note: Calling 'cxl_is_hpa_in_range'
           if (!cxl_is_hpa_in_range(hpa, cxlr, cxled->pos))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/trace.c:18:6: note: Assuming 'hpa' is >= field 'start'
           if (hpa < p->res->start || hpa > p->res->end) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/trace.c:18:6: note: Left side of '||' is false
   drivers/cxl/core/trace.c:18:29: note: Assuming 'hpa' is <= field 'end'
           if (hpa < p->res->start || hpa > p->res->end) {
                                      ^~~~~~~~~~~~~~~~~
   drivers/cxl/core/trace.c:18:2: note: Taking false branch
           if (hpa < p->res->start || hpa > p->res->end) {
           ^
   drivers/cxl/core/trace.c:26:11: note: '__base' initialized to 0
           offset = do_div(offset, gran * ways);
                    ^
   include/asm-generic/div64.h:46:2: note: expanded from macro 'do_div'
           uint32_t __base = (base);                               \
           ^~~~~~~~~~~~~~~
   drivers/cxl/core/trace.c:26:11: note: Division by zero
           offset = do_div(offset, gran * ways);
                    ^
   include/asm-generic/div64.h:48:26: note: expanded from macro 'do_div'
           __rem = ((uint64_t)(n)) % __base;                       \
                   ~~~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/posix_acl.c:135:35: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           sentinel = uncached_acl_sentinel(current);
                                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/posix_acl.c:1006:10: note: Calling 'posix_acl_create'
           error = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/posix_acl.c:644:6: note: Assuming the condition is false
           if (S_ISLNK(*mode) || !IS_POSIXACL(dir))
               ^
   include/uapi/linux/stat.h:21:21: note: expanded from macro 'S_ISLNK'
   #define S_ISLNK(m)      (((m) & S_IFMT) == S_IFLNK)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/posix_acl.c:644:6: note: Left side of '||' is false
           if (S_ISLNK(*mode) || !IS_POSIXACL(dir))
               ^
   include/uapi/linux/stat.h:21:20: note: expanded from macro 'S_ISLNK'
   #define S_ISLNK(m)      (((m) & S_IFMT) == S_IFLNK)
                           ^
   fs/posix_acl.c:644:24: note: Assuming the condition is false
           if (S_ISLNK(*mode) || !IS_POSIXACL(dir))
                                 ^~~~~~~~~~~~~~~~~
   fs/posix_acl.c:644:2: note: Taking false branch
           if (S_ISLNK(*mode) || !IS_POSIXACL(dir))
           ^
   fs/posix_acl.c:647:6: note: Calling 'get_inode_acl'

vim +26 drivers/cxl/core/trace.c

4aa396abd805d9 Alison Schofield 2023-03-10   9  
4aa396abd805d9 Alison Schofield 2023-03-10  10  static bool cxl_is_hpa_in_range(u64 hpa, struct cxl_region *cxlr, int pos)
4aa396abd805d9 Alison Schofield 2023-03-10  11  {
4aa396abd805d9 Alison Schofield 2023-03-10  12  	struct cxl_region_params *p = &cxlr->params;
4aa396abd805d9 Alison Schofield 2023-03-10  13  	int gran = p->interleave_granularity;
4aa396abd805d9 Alison Schofield 2023-03-10  14  	int ways = p->interleave_ways;
4aa396abd805d9 Alison Schofield 2023-03-10  15  	u64 offset;
4aa396abd805d9 Alison Schofield 2023-03-10  16  
4aa396abd805d9 Alison Schofield 2023-03-10  17  	/* Is the hpa within this region at all */
4aa396abd805d9 Alison Schofield 2023-03-10  18  	if (hpa < p->res->start || hpa > p->res->end) {
4aa396abd805d9 Alison Schofield 2023-03-10  19  		dev_dbg(&cxlr->dev,
4aa396abd805d9 Alison Schofield 2023-03-10  20  			"Addr trans fail: hpa 0x%llx not in region\n", hpa);
4aa396abd805d9 Alison Schofield 2023-03-10  21  		return false;
4aa396abd805d9 Alison Schofield 2023-03-10  22  	}
4aa396abd805d9 Alison Schofield 2023-03-10  23  
4aa396abd805d9 Alison Schofield 2023-03-10  24  	/* Is the hpa in an expected chunk for its pos(-ition) */
4aa396abd805d9 Alison Schofield 2023-03-10  25  	offset = hpa - p->res->start;
4aa396abd805d9 Alison Schofield 2023-03-10 @26  	offset = do_div(offset, gran * ways);
4aa396abd805d9 Alison Schofield 2023-03-10  27  	if ((offset >= pos * gran) && (offset < (pos + 1) * gran))
4aa396abd805d9 Alison Schofield 2023-03-10  28  		return true;
4aa396abd805d9 Alison Schofield 2023-03-10  29  
4aa396abd805d9 Alison Schofield 2023-03-10  30  	dev_dbg(&cxlr->dev,
4aa396abd805d9 Alison Schofield 2023-03-10  31  		"Addr trans fail: hpa 0x%llx not in expected chunk\n", hpa);
4aa396abd805d9 Alison Schofield 2023-03-10  32  
4aa396abd805d9 Alison Schofield 2023-03-10  33  	return false;
4aa396abd805d9 Alison Schofield 2023-03-10  34  }
4aa396abd805d9 Alison Schofield 2023-03-10  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
