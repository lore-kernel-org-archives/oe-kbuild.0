Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD6223A6
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 01:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752369827; cv=none; b=KCRbt1z3NAbzrlxc4R/dScExG1yQLsVjwVRW0+egnMaWN/DUYnB8DutDDa+nZuCfbIgmRHzDejCAt/u7jgFt5bWFhKsq1PsL3ZFqf4G86RQqYBaSGwf0HRIucLfdvm7crXb7KnpNydMLAbu7Y7Mh8swYnLpqLl/FrKZZmGhA/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752369827; c=relaxed/simple;
	bh=rUYZgPdsBaesJO+GUJSZjkyTMZWsoIr/VuNbYf2zDSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnuAawroPrpgM6mBpZLNcEcgAZJsyeEnhvoaKKb273Dtfa9xC0d8SlRUD1vTyE+5OROaxGYy73ED+RzVzi9wbKgRbutAQva85M9KZmBTqqgWSOALCkHRjsWfTPAlbTA3+XoVHSQv4cLuUcf8kzbrVfSGMbKiXRSzB4zJVPCxnzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSL8Gqtq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSL8Gqtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752369825; x=1783905825;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rUYZgPdsBaesJO+GUJSZjkyTMZWsoIr/VuNbYf2zDSw=;
  b=bSL8GqtquKv1SQzwNS0jiWylKDwNvjHgvWcTdDh54OEu6e6mHmITh+9E
   6CFV+ErQGLJOHtF8pChp5IREQw/wy5wB/oHG86m70u9FM63qcTho4D98f
   GpYEbN5+8jx57QtS+GX3IjLGe+D8jXlzuXG7T8f+UX/jdlDTligx4ln71
   pZU/eTuPxKlmPlJbpI/koAJkDeqFpprpS2LirULqdoAJfY+nNI+NfjsC5
   xbxdBoLXGRWn0dMNS1YrmQMjIgW74YNBz9reGHAwN89tj88ud+jyhQpmL
   gvbE5fLUp006gFI9KOWZ/4Q22yc2Hucd9ier1e4OrI1RQyARuycredGcf
   g==;
X-CSE-ConnectionGUID: V/ggyarBSEmS6yLgJ9/6bQ==
X-CSE-MsgGUID: b5W6YQBtS/yKCxxl1zi53w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72058506"
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="72058506"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 18:23:45 -0700
X-CSE-ConnectionGUID: XwGRuvXcQr25M1rlLAOzqg==
X-CSE-MsgGUID: B9sjjB32RHaeRSphjEp+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="156057151"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jul 2025 18:23:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ualRN-0007oJ-1B;
	Sun, 13 Jul 2025 01:23:41 +0000
Date: Sun, 13 Jul 2025 09:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tytso-ext4:pu 34/35] fs/ext4/inode.c:5212:11: error: call to
 '__compiletime_assert_652' declared with 'error' attribute: min(({
 __auto_type __UNIQUE_ID_x_647 = (((0 ? 4 : 6) * 2 - 1)); __auto_type
 __UNIQUE_ID_y_648 = (((16 + __pte_index_size)-16)); do {
 __attribute__((__noret...
Message-ID: <202507130941.BXYdfzxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-ext4@vger.kernel.org
TO: Zhang Yi <yi.zhang@huawei.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   a3404072989e188560fb86c1116ef76bcb8a5c4d
commit: 9a1b41d82cfd73a02290c68c25158c25c2dc3209 [34/35] ext4: limit the ma=
ximum folio order
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: powerpc-ppc64_defconfig (https://download.01.org/0day-ci/archive/20=
250713/202507130941.BXYdfzxu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c=
97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250713/202507130941.BXYdfzxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507130941.BXYdfzxu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ext4/inode.c:5212:11: error: call to '__compiletime_assert_652' decla=
red with 'error' attribute: min(({ __auto_type __UNIQUE_ID_x_647 =3D (((0 ?=
 4 : 6) * 2 - 1)); __auto_type __UNIQUE_ID_y_648 =3D (((16 + __pte_index_si=
ze)-16)); do { __attribute__((__noreturn__)) extern void __compiletime_asse=
rt_649(void) __attribute__((__error__("min""(""((0 ? 4 : 6) * 2 - 1)"", ""(=
(16 + __pte_index_size)-16)"") signedness error"))); if (!(!(!(((((typeof(_=
_UNIQUE_ID_x_647))(-1)) < ( typeof(__UNIQUE_ID_x_647))1) ? (2 + (__builtin_=
constant_p((long long)(__UNIQUE_ID_x_647) >=3D 0) && ((long long)(__UNIQUE_=
ID_x_647) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_x_647) < 4))) & ((((type=
of(__UNIQUE_ID_y_648))(-1)) < ( typeof(__UNIQUE_ID_y_648))1) ? (2 + (__buil=
tin_constant_p((long long)(__UNIQUE_ID_y_648) >=3D 0) && ((long long)(__UNI=
QUE_ID_y_648) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_y_648) < 4))))))) __=
compiletime_assert_649(); } while (0); ((__UNIQUE_ID_x_647) < (__UNIQUE_ID_=
y_648) ? (__UNIQUE_ID_x_647) : (__UNIQUE_ID_y_648)); }), (11 + (inode)->i_b=
lkbits - 16)) signedness error
    5212 |                                       EXT4_MAX_PAGECACHE_ORDER(i=
node));
         |                                       ^
   fs/ext4/inode.c:5205:3: note: expanded from macro 'EXT4_MAX_PAGECACHE_OR=
DER'
    5205 |                 min(MAX_PAGECACHE_ORDER, (11 + (i)->i_blkbits - =
PAGE_SHIFT))
         |                 ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_I=
D(y_))
         |         ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compil=
etime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compi=
letime_assert'
     549 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:34:1: note: expanded from here
      34 | __compiletime_assert_652
         | ^
   1 error generated.


vim +5212 fs/ext4/inode.c

7ac67301e82f02 Zhang Yi 2025-05-12  5198 =20
9a1b41d82cfd73 Zhang Yi 2025-07-07  5199  /*
9a1b41d82cfd73 Zhang Yi 2025-07-07  5200   * Limit the maximum folio order =
to 2048 blocks to prevent overestimation
9a1b41d82cfd73 Zhang Yi 2025-07-07  5201   * of reserve handle credits duri=
ng the folio writeback in environments
9a1b41d82cfd73 Zhang Yi 2025-07-07  5202   * where the PAGE_SIZE exceeds 4K=
B.
9a1b41d82cfd73 Zhang Yi 2025-07-07  5203   */
9a1b41d82cfd73 Zhang Yi 2025-07-07  5204  #define EXT4_MAX_PAGECACHE_ORDER(=
i)		\
9a1b41d82cfd73 Zhang Yi 2025-07-07  5205  		min(MAX_PAGECACHE_ORDER, (11 + =
(i)->i_blkbits - PAGE_SHIFT))
9a1b41d82cfd73 Zhang Yi 2025-07-07  5206  void ext4_set_inode_mapping_order=
(struct inode *inode)
9a1b41d82cfd73 Zhang Yi 2025-07-07  5207  {
9a1b41d82cfd73 Zhang Yi 2025-07-07  5208  	if (!ext4_should_enable_large_fo=
lio(inode))
9a1b41d82cfd73 Zhang Yi 2025-07-07  5209  		return;
9a1b41d82cfd73 Zhang Yi 2025-07-07  5210 =20
9a1b41d82cfd73 Zhang Yi 2025-07-07  5211  	mapping_set_folio_order_range(in=
ode->i_mapping, 0,
9a1b41d82cfd73 Zhang Yi 2025-07-07 @5212  				      EXT4_MAX_PAGECACHE_ORDE=
R(inode));
9a1b41d82cfd73 Zhang Yi 2025-07-07  5213  }
9a1b41d82cfd73 Zhang Yi 2025-07-07  5214 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
