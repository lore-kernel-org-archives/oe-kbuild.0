Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735730EF62
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 23:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769383266; cv=none; b=eQnd6HyWnIF1Pdqgn1GOjgB7mVukKVhmPM+zuJfBQkcw8aDO+9UN+v7n5iqxZcpoUC5bvNG1OSgmOqfUoOI9KDv7X9XfX3hV376QovUEn010gHKA/1epJ/0IbDxQsZEnWG/eqxM0897ClwytZjgbi9ek+RKDitDUtWTMFHJLWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769383266; c=relaxed/simple;
	bh=NPHU7ykBjcEaZ4MQ5PD6DtiKC+7hmpnIwvheu+QmfPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6XKn0p6UbkqFObtz02niwYY3RjJpJMsst06aNrOc+EtngG+g7vv1kBiDd9kaDxmAqI3RcEBh589Al8GtDTmEdlnU5l0OnWYxwfEcHwWECZK4Ml4SVAGXDFBorA0i9rlrDGfcXPPrI3cgz+VAJze4vV1bMEKCbtDwDGMv/vtArk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG5vZSpi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG5vZSpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769383264; x=1800919264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NPHU7ykBjcEaZ4MQ5PD6DtiKC+7hmpnIwvheu+QmfPg=;
  b=NG5vZSpinR2m9ztf9hKAiYv6Y2Ab+psQ36zVriduxQCxBdZH0K1uz05M
   ZNH/InBDVfk85YpAUEjJNKennR/8VoOQFM6iuN6thXPi7FCPC+mDJq/tD
   ntocQqSYrb1Yyh03SajPrfs4V04ud3BQth6CxVAP0CzT0ybsRT8cGm0Uo
   Tizmw1Gr0d3D2AM7zWcGvG32z0glxTRCJn93hZ1/GjlZZ1nS63dE5XGdU
   /nc7XBRRCpOuNUzYWnOtEo454Wn+Dyqlxp0XhKZSW19RQza0KaRAQXBhq
   TLaVj8zDXqYWQo7u2OhnR+bKBjIXAlnHncr82bJwJTygiYAbwSOr/TTot
   w==;
X-CSE-ConnectionGUID: Txq72F13QdaeyAJ1yEfDwA==
X-CSE-MsgGUID: wUd78uneSTWn8EO4Mb124A==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81284506"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="81284506"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 15:21:03 -0800
X-CSE-ConnectionGUID: QSVZJZoaQtCNyEXuk0nTpQ==
X-CSE-MsgGUID: xIJik+szSwOj/OJWPS+gqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207794805"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jan 2026 15:21:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk9Pf-00000000Wiw-37tf;
	Sun, 25 Jan 2026 23:20:59 +0000
Date: Mon, 26 Jan 2026 07:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] open: new O_REGULAR flag support
Message-ID: <202601260755.37CjFfW9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260125141518.59493-2-dorjoychy111@gmail.com>
References: <20260125141518.59493-2-dorjoychy111@gmail.com>
TO: Dorjoy Chowdhury <dorjoychy111@gmail.com>
TO: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: viro@zeniv.linux.org.uk
CC: brauner@kernel.org
CC: jack@suse.cz
CC: jlayton@kernel.org
CC: chuck.lever@oracle.com
CC: alex.aring@gmail.com
CC: arnd@arndb.de

Hi Dorjoy,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on shuah-kselftest/next shuah-kselftest/fixes linus/master arnd-asm-generic/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dorjoy-Chowdhury/open-new-O_REGULAR-flag-support/20260125-221826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260125141518.59493-2-dorjoychy111%40gmail.com
patch subject: [PATCH 1/2] open: new O_REGULAR flag support
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260126/202601260755.37CjFfW9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260755.37CjFfW9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601260755.37CjFfW9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fcntl.c:1172:2: error: call to '__compiletime_assert_451' declared with 'error' attribute: BUILD_BUG_ON failed: 21 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC)
    1172 |         BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:631:2: note: expanded from macro 'compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:612:4: note: expanded from macro '__compiletime_assert'
     612 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:147:1: note: expanded from here
     147 | __compiletime_assert_451
         | ^
   1 error generated.


vim +1172 fs/fcntl.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1164  
454eedb8901da8 Wu Fengguang      2010-08-10  1165  static int __init fcntl_init(void)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1166  {
3ab04d5cf9736b James Bottomley   2010-09-09  1167  	/*
3ab04d5cf9736b James Bottomley   2010-09-09  1168  	 * Please add new bits here to ensure allocation uniqueness.
3ab04d5cf9736b James Bottomley   2010-09-09  1169  	 * Exceptions: O_NONBLOCK is a two bit define on parisc; O_NDELAY
3ab04d5cf9736b James Bottomley   2010-09-09  1170  	 * is defined as O_NONBLOCK on some platforms and not on others.
3ab04d5cf9736b James Bottomley   2010-09-09  1171  	 */
6ad7d1fbad4d31 Dorjoy Chowdhury  2026-01-25 @1172  	BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=
80f18379a7c350 Christoph Hellwig 2017-04-27  1173  		HWEIGHT32(
80f18379a7c350 Christoph Hellwig 2017-04-27  1174  			(VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) |
ebe559609d7829 Al Viro           2024-11-15  1175  			__FMODE_EXEC));
454eedb8901da8 Wu Fengguang      2010-08-10  1176  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1177  	fasync_cache = kmem_cache_create("fasync_cache",
839d68206de869 Vasily Averin     2021-09-02  1178  					 sizeof(struct fasync_struct), 0,
839d68206de869 Vasily Averin     2021-09-02  1179  					 SLAB_PANIC | SLAB_ACCOUNT, NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1180  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1181  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
