Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D1C10E5
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Mar 2023 01:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679363228; x=1710899228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JfCgP2u97mYYXHJtVWFOVHMam7rdU35xphecg1HGkTU=;
  b=bUzcSb6heD3TmKrmERCD3Bp5QKIwPLs/a+kP98cfGhOhSrOubwxFx4Sn
   h7gt3AEygX6i6xcbbILIsRFY78yzJpb/8KYKFTDRlmuyH/oaGcYwFycXE
   8K4d5rL94Vpll1aQsxBF71wuCqgpSkDJjajwc4pW16syFcDZlYhHjswIZ
   h4PUkKSGV8lxtkE4NgybxO4BGPts7Ca3LUdVfmYkMP3uXwk+54wd1nLDZ
   d5ZN8idEqWqHzGIk8EG2dKmxKeZoWL/Gb8M0tgWWqobTHYmijMDWPxWO2
   nmLbxa4ehQQ5+6EhIUNoy4JuajJHuGD30h1EaZsdPGf7tRl0RP4iXZWTe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="337542572"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="337542572"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 18:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750347096"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="750347096"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2023 18:47:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peR5e-000BTy-08;
	Tue, 21 Mar 2023 01:47:06 +0000
Date: Tue, 21 Mar 2023 09:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mcgrof:20230308-larger-bs-then-ps-xfs-v2 2/2]
 fs/xfs/xfs_mount.c:139:3: warning: Value stored to 'shift' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303210925.Sr38o1VC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/xfs_mount.c:139:3: warning: Value stored to 'shift' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Chinner <dchinner@redhat.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230308-larger-bs-then-ps-xfs-v2
head:   5a1c5b3d6cb9ff1bec46a42d2109f1dab2a9d74c
commit: 5a1c5b3d6cb9ff1bec46a42d2109f1dab2a9d74c [2/2] xfs: enable block size larger than page size support
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: riscv-randconfig-c006-20230312 (https://download.01.org/0day-ci/archive/20230321/202303210925.Sr38o1VC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=5a1c5b3d6cb9ff1bec46a42d2109f1dab2a9d74c
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230308-larger-bs-then-ps-xfs-v2
        git checkout 5a1c5b3d6cb9ff1bec46a42d2109f1dab2a9d74c
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303210925.Sr38o1VC-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   ^
   include/linux/page-flags.h:426:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^
   include/linux/page-flags.h:381:10: note: expanded from macro 'TESTPAGEFLAG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   include/linux/page-flags.h:509:1: note: Passing null pointer value via 2nd parameter 'addr'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:426:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:381:31: note: expanded from macro 'TESTPAGEFLAG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   include/linux/page-flags.h:509:1: note: Calling 'generic_test_bit'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:426:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:381:10: note: expanded from macro 'TESTPAGEFLAG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:35: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:14:20: note: expanded from macro '_test_bit'
   #define _test_bit               arch_test_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:15:23: note: expanded from macro 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:128:16: note: Array access (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (12 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   27 warnings generated.
   fs/xfs/xfs_icache.c:735:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
           error = 0;
           ^       ~
   fs/xfs/xfs_icache.c:735:2: note: Value stored to 'error' is never read
           error = 0;
           ^       ~
   fs/xfs/xfs_icache.c:1665:2: warning: Value stored to 'nr_found' is never read [clang-analyzer-deadcode.DeadStores]
           nr_found = 0;
           ^          ~
   fs/xfs/xfs_icache.c:1665:2: note: Value stored to 'nr_found' is never read
           nr_found = 0;
           ^          ~
   Suppressed 25 warnings (12 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (12 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
>> fs/xfs/xfs_mount.c:139:3: warning: Value stored to 'shift' is never read [clang-analyzer-deadcode.DeadStores]
                   shift = 0;
                   ^       ~
   fs/xfs/xfs_mount.c:139:3: note: Value stored to 'shift' is never read
                   shift = 0;
                   ^       ~
   Suppressed 25 warnings (12 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_t.c:14:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:14:21: note: Value stored to 'client' during its initialization is never read
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:130:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:130:21: note: Value stored to 'client' during its initialization is never read
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:250:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:250:21: note: Value stored to 'client' during its initialization is never read
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:375:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:375:21: note: Value stored to 'client' during its initialization is never read
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:393:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:393:21: note: Value stored to 'client' during its initialization is never read
           struct i2c_client *client = priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (6 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/shift +139 fs/xfs/xfs_mount.c

27174203f570b9 Christoph Hellwig  2009-03-30  123  
4cc929ee305c69 Nathan Scott       2007-05-14  124  /*
4cc929ee305c69 Nathan Scott       2007-05-14  125   * Check size of device based on the (data/realtime) block count.
4cc929ee305c69 Nathan Scott       2007-05-14  126   * Note: this check is used by the growfs code as well as mount.
4cc929ee305c69 Nathan Scott       2007-05-14  127   */
4cc929ee305c69 Nathan Scott       2007-05-14  128  int
4cc929ee305c69 Nathan Scott       2007-05-14  129  xfs_sb_validate_fsb_count(
4cc929ee305c69 Nathan Scott       2007-05-14  130  	xfs_sb_t	*sbp,
c8ce540db5f67d Darrick J. Wong    2017-06-16  131  	uint64_t	nblocks)
4cc929ee305c69 Nathan Scott       2007-05-14  132  {
5a1c5b3d6cb9ff Dave Chinner       2023-03-07  133  	int		shift = PAGE_SHIFT - sbp->sb_blocklog;
5a1c5b3d6cb9ff Dave Chinner       2023-03-07  134  	/*
5a1c5b3d6cb9ff Dave Chinner       2023-03-07  135  	 * block size larger than page size still limited to page cache
5a1c5b3d6cb9ff Dave Chinner       2023-03-07  136  	 * page size limits.
5a1c5b3d6cb9ff Dave Chinner       2023-03-07  137  	 */
5a1c5b3d6cb9ff Dave Chinner       2023-03-07  138  	if (shift < 0)
5a1c5b3d6cb9ff Dave Chinner       2023-03-07 @139  		shift = 0;
5a1c5b3d6cb9ff Dave Chinner       2023-03-07  140  
5a1c5b3d6cb9ff Dave Chinner       2023-03-07  141  	//ASSERT(PAGE_SHIFT >= sbp->sb_blocklog);
4cc929ee305c69 Nathan Scott       2007-05-14  142  	ASSERT(sbp->sb_blocklog >= BBSHIFT);
4cc929ee305c69 Nathan Scott       2007-05-14  143  
d5cf09baced0ef Christoph Hellwig  2014-07-30  144  	/* Limited by ULONG_MAX of page cache index */
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  145  	if (nblocks >> (PAGE_SHIFT - sbp->sb_blocklog) > ULONG_MAX)
2451337dd04390 Dave Chinner       2014-06-25  146  		return -EFBIG;
4cc929ee305c69 Nathan Scott       2007-05-14  147  	return 0;
4cc929ee305c69 Nathan Scott       2007-05-14  148  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
