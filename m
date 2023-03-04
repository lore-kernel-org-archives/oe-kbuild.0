Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C423A9
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 20:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677962587; x=1709498587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JdWs2rVUrb/xvSZjE8YBCTbzWaG75xFtNJdGbtLQBpU=;
  b=hzGCvoJvxIOqSjbcdViQcHXAWqXH04aKGVSNbDPB0Igef4aX4dFI6xte
   bor0PRvzIPyuzQVPnKPgabvnKjLct9vukM31VeG0MkgmHzm96LnjF+HZb
   vZmr7mdux4f/hBMd3BEuKVNU1jQFWw8hXGtQqloakEfk4FLCNYSxJ11Ry
   zFvh6eqMxF2ItRSwM03ZedqJyn8p1QiJ+/mHoo86NY4XwSUDdpspmjNMl
   oJf8p8Q5dCCxrN4wnMbgIOhs0CBMm+W9udzLc5R79AkBMTC4GOnEdW5tv
   6+XhKdKLPTABka+R+xZ41vFxnbcr+VJdzfAJCdYgOhKqrWvcdQ7kwX18C
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="336822282"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="336822282"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 12:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="675723831"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="675723831"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 12:43:05 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYYif-0002M0-14;
	Sat, 04 Mar 2023 20:43:05 +0000
Date: Sun, 5 Mar 2023 04:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/ceph/mdsmap.h:56:9: warning: Dereference of null
 pointer [clang-analyzer-core.NullDereference]
Message-ID: <202303050428.GG4qwbwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/ceph/mdsmap.h:56:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0988a0ea791999ebbf95693f2676381825b05033
commit: b03fc1173c0c2bb8fad61902a862985cecdc4b1b bitops: let optimize out non-atomic bitops on compile-time constants
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20230302 (https://download.01.org/0day-ci/archive/20230305/202303050428.GG4qwbwY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b03fc1173c0c2bb8fad61902a862985cecdc4b1b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b03fc1173c0c2bb8fad61902a862985cecdc4b1b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303050428.GG4qwbwY-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   fs/ceph/mds_client.c:4920:16: note: Assuming 'mds' is < field 'max_sessions'
           for (mds = 0; mds < mdsc->max_sessions; mds++) {
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4920:2: note: Loop condition is true.  Entering loop body
           for (mds = 0; mds < mdsc->max_sessions; mds++) {
           ^
   fs/ceph/mds_client.c:4922:8: note: 'session' is non-null
                   if (!session)
                        ^~~~~~~
   fs/ceph/mds_client.c:4922:3: note: Taking false branch
                   if (!session)
                   ^
   fs/ceph/mds_client.c:4925:7: note: Assuming field 's_state' is equal to CEPH_MDS_SESSION_REJECTED
                   if (session->s_state == CEPH_MDS_SESSION_REJECTED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4925:3: note: Taking true branch
                   if (session->s_state == CEPH_MDS_SESSION_REJECTED)
                   ^
   fs/ceph/mds_client.c:4926:4: note: Calling '__unregister_session'
                           __unregister_session(mdsc, session);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:803:2: note: Taking false branch
           dout("__unregister_session mds%d %p\n", s->s_mds, s);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:610:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/mds_client.c:804:2: note: Assuming the condition is false
           BUG_ON(mdsc->sessions[s->s_mds] != s);
           ^
   include/asm-generic/bug.h:71:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:804:2: note: Taking false branch
           BUG_ON(mdsc->sessions[s->s_mds] != s);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   fs/ceph/mds_client.c:804:2: note: Loop condition is false.  Exiting loop
           BUG_ON(mdsc->sessions[s->s_mds] != s);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   fs/ceph/mds_client.c:807:2: note: Calling 'ceph_put_mds_session'
           ceph_put_mds_session(s);
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:687:2: note: Taking false branch
           if (IS_ERR_OR_NULL(s))
           ^
   fs/ceph/mds_client.c:690:2: note: Taking true branch
           if (refcount_dec_and_test(&s->s_ref)) {
           ^
   fs/ceph/mds_client.c:691:7: note: Assuming field 'authorizer' is null
                   if (s->s_auth.authorizer)
                       ^~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:691:3: note: Taking false branch
                   if (s->s_auth.authorizer)
                   ^
   fs/ceph/mds_client.c:693:3: note: Assuming the condition is true
                   WARN_ON(mutex_is_locked(&s->s_mutex));
                   ^
   include/asm-generic/bug.h:122:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                ^~~~~~~~~~~~
   fs/ceph/mds_client.c:693:3: note: Taking false branch
                   WARN_ON(mutex_is_locked(&s->s_mutex));
                   ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/ceph/mds_client.c:695:3: note: Memory is released
                   kfree(s);
                   ^~~~~~~~
   fs/ceph/mds_client.c:807:2: note: Returning; memory was released via 1st parameter
           ceph_put_mds_session(s);
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4926:4: note: Returning; memory was released via 2nd parameter
                           __unregister_session(mdsc, session);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4931:3: note: Use of memory after it is freed
                   __close_session(mdsc, session);
                   ^                     ~~~~~~~
   fs/ceph/mds_client.c:5072:2: warning: Value stored to 'maplen' is never read [clang-analyzer-deadcode.DeadStores]
           maplen = ceph_decode_32(&p);
           ^        ~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:5072:2: note: Value stored to 'maplen' is never read
           maplen = ceph_decode_32(&p);
           ^        ~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/mdsmap.h:56:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return m->m_info[w].state;
                  ^
   fs/ceph/mds_client.c:4156:2: note: Taking false branch
           dout("check_new_map new %u old %u\n",
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:610:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/mds_client.c:4159:6: note: Assuming field 'm_info' is null
           if (newmap->m_info) {
               ^~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4159:2: note: Taking false branch
           if (newmap->m_info) {
           ^
   fs/ceph/mds_client.c:4166:14: note: Assuming 'i' is >= field 'possible_max_rank'
           for (i = 0; i < oldmap->possible_max_rank && i < mdsc->max_sessions; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4166:44: note: Left side of '&&' is false
           for (i = 0; i < oldmap->possible_max_rank && i < mdsc->max_sessions; i++) {
                                                     ^
   fs/ceph/mds_client.c:4245:14: note: Assuming 'i' is < field 'possible_max_rank'
           for (i = 0; i < newmap->possible_max_rank; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4245:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < newmap->possible_max_rank; i++) {
           ^
   fs/ceph/mds_client.c:4258:14: note: Calling 'ceph_mdsmap_get_state'
                   newstate = ceph_mdsmap_get_state(newmap, i);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/mdsmap.h:53:2: note: Taking false branch
           BUG_ON(w < 0);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   include/linux/ceph/mdsmap.h:53:2: note: Loop condition is false.  Exiting loop
           BUG_ON(w < 0);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   include/linux/ceph/mdsmap.h:54:6: note: 'w' is < field 'possible_max_rank'
           if (w >= m->possible_max_rank)
               ^
   include/linux/ceph/mdsmap.h:54:2: note: Taking false branch
           if (w >= m->possible_max_rank)
           ^
   include/linux/ceph/mdsmap.h:56:9: note: Dereference of null pointer
           return m->m_info[w].state;
                  ^~~~~~~~~~~~~~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/hwmon/shtc1.c:146:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temperature);
                  ^~~~~~~
   drivers/hwmon/shtc1.c:146:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temperature);
                  ^~~~~~~
   drivers/hwmon/shtc1.c:156:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->humidity);
                  ^~~~~~~
   drivers/hwmon/shtc1.c:156:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->humidity);
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/hwmon/smsc47b397.c:164:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp_from_reg(data->temp[attr->index]));
                  ^~~~~~~
   drivers/hwmon/smsc47b397.c:164:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp_from_reg(data->temp[attr->index]));
                  ^~~~~~~
   drivers/hwmon/smsc47b397.c:188:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", fan_from_reg(data->fan[attr->index]));
                  ^~~~~~~
   drivers/hwmon/smsc47b397.c:188:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", fan_from_reg(data->fan[attr->index]));
                  ^~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/hwmon/smsc47m1.c:213:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rpm);
                  ^~~~~~~
   drivers/hwmon/smsc47m1.c:213:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rpm);
                  ^~~~~~~
   drivers/hwmon/smsc47m1.c:224:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rpm);
                  ^~~~~~~
   drivers/hwmon/smsc47m1.c:224:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rpm);

vim +56 include/linux/ceph/mdsmap.h

2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  50  
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  51  static inline int ceph_mdsmap_get_state(struct ceph_mdsmap *m, int w)
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  52  {
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  53  	BUG_ON(w < 0);
b38c9eb4757d5b include/linux/ceph/mdsmap.h Xiubo Li  2019-12-04  54  	if (w >= m->possible_max_rank)
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  55  		return CEPH_MDS_STATE_DNE;
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06 @56  	return m->m_info[w].state;
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  57  }
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  58  

:::::: The code at line 56 was first introduced by commit
:::::: 2f2dc053404febedc9c273452d9d518fb31fde72 ceph: MDS client

:::::: TO: Sage Weil <sage@newdream.net>
:::::: CC: Sage Weil <sage@newdream.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
