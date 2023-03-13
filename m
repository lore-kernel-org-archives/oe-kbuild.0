Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69FE28F2
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Mar 2023 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678722928; x=1710258928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVSiK6lfmjxtrePJNOhq4tClRUC71mQcz0IBjN3eRSg=;
  b=h+Qsp5vp4tZmbeNIlhQK8N0Obi8ZrCWH3UsVO0hoyZDO13LYzdVp2K70
   5jJRGujQ0sJlD/QoUlS99TvbCp/v2350Ru9d6RAM9ARcwgW6uHMXgLOVv
   WDY+vkUsYAkJjs6fvwR3sfBkkjGv1QyBSnqEviTaFZhyxTAvYRFjY9G/4
   goSSqXQedgXDz0CGcrYu706syjdWSnsOzdA+OjwFgRN2agdDS/ouxtQAZ
   PbUUolLPAETFKmJb4mvUu6T4fd9PDS+vd28oONdNuaLob6RGorY5Zwn4c
   CyyXrAQHIFa3I5dZcE1GzL68Y5hevyU0zHlCo3A1v/EiunKY4EhXfMIK5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321036798"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="321036798"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 08:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="656019763"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="656019763"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Mar 2023 08:54:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbkVH-0005qW-2X;
	Mon, 13 Mar 2023 15:54:27 +0000
Date: Mon, 13 Mar 2023 23:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2216:9: warning:
 Array subscript is undefined
 [clang-analyzer-core.uninitialized.ArraySubscript]
Message-ID: <202303132314.3FSmQsb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2216:9: warning: Array subscript is undefined [clang-analyzer-core.uninitialized.ArraySubscript]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eeac8ede17557680855031c6f305ece2378af326
commit: ad7489d5262d2aa775b5e5a1782793925fa90065 mm: uninline copy_overflow()
date:   12 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-c003-20230305 (https://download.01.org/0day-ci/archive/20230313/202303132314.3FSmQsb2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ad7489d5262d2aa775b5e5a1782793925fa90065
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ad7489d5262d2aa775b5e5a1782793925fa90065
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303132314.3FSmQsb2-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:960:2: note: Value stored to 'dst' is never read
           dst = atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:979:2: warning: Value stored to 'dst' is never read [clang-analyzer-deadcode.DeadStores]
           dst = atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:979:2: note: Value stored to 'dst' is never read
           dst = atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:1386:2: warning: Value stored to 'str_off' is never read [clang-analyzer-deadcode.DeadStores]
           str_off = 0;
           ^         ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1386:2: note: Value stored to 'str_off' is never read
           str_off = 0;
           ^         ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1409:2: warning: Value stored to 'off_to_vbios_str' is never read [clang-analyzer-deadcode.DeadStores]
           off_to_vbios_str = 0;
           ^                  ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1409:2: note: Value stored to 'off_to_vbios_str' is never read
           off_to_vbios_str = 0;
           ^                  ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:657:4: warning: Value stored to 'hi' is never read [clang-analyzer-deadcode.DeadStores]
                           hi = t4_read_reg(padap, LE_DB_TID_HASHBASE_A) / 4;
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:657:4: note: Value stored to 'hi' is never read
                           hi = t4_read_reg(padap, LE_DB_TID_HASHBASE_A) / 4;
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:660:4: warning: Value stored to 'hi' is never read [clang-analyzer-deadcode.DeadStores]
                           hi = t4_read_reg(padap, LE_DB_HASH_TID_BASE_A);
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:660:4: note: Value stored to 'hi' is never read
                           hi = t4_read_reg(padap, LE_DB_HASH_TID_BASE_A);
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3598:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return rc;
           ^      ~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3572:2: note: 'rc' declared without an initial value
           int rc;
           ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3576:14: note: Assuming 'i' is >= 'count'
           for (i = 0; i < count; i += SF_PAGE_SIZE) {
                       ^~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3576:2: note: Loop condition is false. Execution continues on line 3598
           for (i = 0; i < count; i += SF_PAGE_SIZE) {
           ^
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3598:2: note: Undefined or garbage value returned to caller
           return rc;
           ^      ~~
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
   8 warnings generated.
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:1579:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = kstrtouint(end, 10, &j);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:1579:4: note: Value stored to 'ret' is never read
                           ret = kstrtouint(end, 10, &j);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2216:9: warning: Array subscript is undefined [clang-analyzer-core.uninitialized.ArraySubscript]
                           if (!isxdigit(*p))
                                ^
   include/linux/ctype.h:35:23: note: expanded from macro 'isxdigit'
   #define isxdigit(c)     ((__ismask(c)&(_D|_X)) != 0)
                             ^~~~~~~~~~~
   include/linux/ctype.h:23:22: note: expanded from macro '__ismask'
   #define __ismask(x) (_ctype[(int)(unsigned char)(x)])
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2205:6: note: Assuming the condition is false
           if (count > sizeof(s) - 1)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2205:2: note: Taking false branch
           if (count > sizeof(s) - 1)
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2207:6: note: Calling 'copy_from_user'
           if (copy_from_user(s, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2207:6: note: Returning from 'copy_from_user'
           if (copy_from_user(s, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2207:6: note: Assuming the condition is false
           if (copy_from_user(s, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2207:2: note: Taking false branch
           if (copy_from_user(s, buf, count))
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2209:18: note: 'i' is <= 0
           for (i = count; i > 0 && isspace(s[i - 1]); i--)
                           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2209:24: note: Left side of '&&' is false
           for (i = count; i > 0 && isspace(s[i - 1]); i--)
                                 ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2213:2: note: Loop condition is true.  Entering loop body
           for (p = s, i = 9; i >= 0; i--) {
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2215:3: note: Loop condition is true.  Entering loop body
                   for (j = 0; j < 8; j++, p++) {
                   ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2216:9: note: Assuming the condition is true
                           if (!isxdigit(*p))
                                ^
   include/linux/ctype.h:35:22: note: expanded from macro 'isxdigit'
   #define isxdigit(c)     ((__ismask(c)&(_D|_X)) != 0)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2216:4: note: Taking false branch
                           if (!isxdigit(*p))
                           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2215:3: note: Loop condition is true.  Entering loop body
                   for (j = 0; j < 8; j++, p++) {
                   ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2216:9: note: Array subscript is undefined
                           if (!isxdigit(*p))
                                ^
   include/linux/ctype.h:35:23: note: expanded from macro 'isxdigit'
   #define isxdigit(c)     ((__ismask(c)&(_D|_X)) != 0)
                             ^~~~~~~~~~~
   include/linux/ctype.h:23:22: note: expanded from macro '__ismask'
   #define __ismask(x) (_ctype[(int)(unsigned char)(x)])
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2920:15: warning: Array access (via field 'uld_txq_info') results in a null pointer dereference [clang-analyzer-core.NullDereference]
                   utxq_info = s->uld_txq_info[CXGB4_TX_OFLD];
                               ^  ~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2666:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2666:2: note: Taking false branch
           if (r)
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2684:6: note: Assuming 'r' is >= 'eth_entries'
           if (r < eth_entries) {
               ^~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2684:2: note: Taking false branch
           if (r < eth_entries) {
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2745:22: note: Assuming 'j' is >= field 'nports'
           for_each_port(adap, j) {
                               ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4.h:1651:17: note: expanded from macro 'for_each_port'
           for (iter = 0; iter < (adapter)->params.nports; ++iter)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2745:2: note: Loop condition is false. Execution continues on line 2797
           for_each_port(adap, j) {
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4.h:1651:2: note: expanded from macro 'for_each_port'
           for (iter = 0; iter < (adapter)->params.nports; ++iter)
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2797:6: note: Assuming field 'tc_mqprio' is null
           if (!adap->tc_mqprio)
               ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2797:2: note: Taking true branch
           if (!adap->tc_mqprio)
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2798:3: note: Control jumps to line 2902
                   goto skip_mqprio;
                   ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2902:2: note: Taking false branch
           if (!is_uld(adap))

vim +2216 drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c

688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2196  
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2197  static ssize_t rss_key_write(struct file *file, const char __user *buf,
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2198  			     size_t count, loff_t *pos)
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2199  {
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2200  	int i, j;
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2201  	u32 key[10];
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2202  	char s[100], *p;
c1d81b1cf93702 David Howells     2015-03-06  2203  	struct adapter *adap = file_inode(file)->i_private;
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2204  
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2205  	if (count > sizeof(s) - 1)
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2206  		return -EINVAL;
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2207  	if (copy_from_user(s, buf, count))
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2208  		return -EFAULT;
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2209  	for (i = count; i > 0 && isspace(s[i - 1]); i--)
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2210  		;
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2211  	s[i] = '\0';
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2212  
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2213  	for (p = s, i = 9; i >= 0; i--) {
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2214  		key[i] = 0;
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2215  		for (j = 0; j < 8; j++, p++) {
688ea5fe7f5727 Hariprasad Shenai 2015-01-20 @2216  			if (!isxdigit(*p))
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2217  				return -EINVAL;
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2218  			key[i] = (key[i] << 4) | hex2val(*p);
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2219  		}
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2220  	}
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2221  
5ccf9d04961599 Rahul Lakkireddy  2017-10-13  2222  	t4_write_rss_key(adap, key, -1, true);
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2223  	return count;
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2224  }
688ea5fe7f5727 Hariprasad Shenai 2015-01-20  2225  

:::::: The code at line 2216 was first introduced by commit
:::::: 688ea5fe7f57272af0e26e271892cead098ef934 cxgb4: Add debugfs options to dump the rss key, config for PF, VF, etc

:::::: TO: Hariprasad Shenai <hariprasad@chelsio.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
