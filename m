Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7B46F4A5
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jul 2026 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658761; cv=none; b=L3F0mXbWRVFHKNJ4NkxrUZF8T9a9hkpFgdHiCMX8bAbpTFk3hqyJEOldqmu4mWmbqUd6hqVXfxlMhGYEGVo0GswUp/rnE5X4hxa4rifTZs/R0rQMC5hCSfy+eaRXtwuYbod4w0c4W4E4823TtWdJiKe7vAnzY6WlipnNCE/guA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658761; c=relaxed/simple;
	bh=w8O2LYXj8iJZirhFni8/fiNYPazEvtDHzTbXhydD9Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MA+dRHsJExdAR7ZHA4cn3cxZduaKbY0CZPrQiIzrqpL+r90A8GbU8/S+IteKVC4IPSK+ADFB7IGnWO5Oz1ryRwqfjbX9/3FXhBKGIwhtoLoEQ1I+kKvek3S5J4sBjDDgZZiyEiev7jsXYf6x4pVq+X9VX10iZi3n8s9n6u/ImXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdTZyiZE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdTZyiZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784658758; x=1816194758;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w8O2LYXj8iJZirhFni8/fiNYPazEvtDHzTbXhydD9Ec=;
  b=YdTZyiZEf37ToLE3xElfxbhkY74DsB/ZIIfKVHcQ1wnal7VxAEKgBCBd
   gwNPCmdkV3uArkFyMGV/mlH3dKn60Jha2H5LJWAjNlTgyl5XW6CZ4iyMD
   NdFt+4iEzIFnct3watPpyzheGUAamIHlPFYFJA3U27BGdwFk5a1OXQRcy
   Plu9G1Meh1sQCn52fAjxAWOuBCrNAqaXps9vgCx/0FVozuSRJtZENXTxG
   0ijGBJBfsccPGz47i7ujeNWs6ExcmSjpQYxWb2FDZuFUUtaS0JTqAQxjT
   KlDQfddKN0M2ZLmJUTefN6p75h+ryhqAYhgol4tq8Y4854M7TKWhQXyh+
   g==;
X-CSE-ConnectionGUID: 23BMz6nKT+KHSFDS9wnU8Q==
X-CSE-MsgGUID: raNcKieDTomS0SskZ6itnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95634212"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="95634212"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 11:32:38 -0700
X-CSE-ConnectionGUID: CwqDsuoaQ4C/GoTWFpXPNg==
X-CSE-MsgGUID: rk3iWbmWSHyaszMhz5A2Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="256052419"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2026 11:32:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmFGc-00000000XrC-2kZd;
	Tue, 21 Jul 2026 18:32:34 +0000
Date: Wed, 22 Jul 2026 02:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/cros_ec-hwmon-overflow 3/3]
 drivers/hwmon/cros_ec_hwmon.c:164:3: error: call to
 '__compiletime_assert_374' declared with 'error' attribute: BUILD_BUG_ON
 failed: sizeof(long) == 8
Message-ID: <202607220202.NuAude7m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/cros_ec-hwmon-overflow
head:   28e1174f3fb10673f8b21957788df92430073be0
commit: 28e1174f3fb10673f8b21957788df92430073be0 [3/3] x
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: s390-randconfig-002-20260721 (https://download.01.org/0day-ci/archi=
ve/20260722/202607220202.NuAude7m-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260722/202607220202.NuAude7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607220202.NuAude7m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/cros_ec_hwmon.c:164:3: error: call to '__compiletime_asser=
t_374' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(long) =
=3D=3D 8
     164 |                 BUILD_BUG_ON(sizeof(long) =3D=3D 8);
         |                 ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compile=
time_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compil=
etime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compi=
letime_assert'
     683 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:67:1: note: expanded from here
      67 | __compiletime_assert_374
         | ^
   1 error generated.


vim +164 drivers/hwmon/cros_ec_hwmon.c

40d2641468f659 Thomas Wei=C3=9Fschuh 2026-06-30  155 =20
28e1174f3fb106 Thomas Wei=C3=9Fschuh 2026-07-03  156  static __always_inlin=
e bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
40d2641468f659 Thomas Wei=C3=9Fschuh 2026-06-30  157  {
28e1174f3fb106 Thomas Wei=C3=9Fschuh 2026-07-03  158  	if (check_mul_overfl=
ow(t, MILLIDEGREE_PER_DEGREE, ret)) {
28e1174f3fb106 Thomas Wei=C3=9Fschuh 2026-07-03  159  		BUILD_BUG_ON(sizeof=
(long) =3D=3D 8);
2848afbe6714f7 Thomas Wei=C3=9Fschuh 2026-06-15  160  		return true;
28e1174f3fb106 Thomas Wei=C3=9Fschuh 2026-07-03  161  	}
2848afbe6714f7 Thomas Wei=C3=9Fschuh 2026-06-15  162 =20
28e1174f3fb106 Thomas Wei=C3=9Fschuh 2026-07-03  163  	if (check_add_overfl=
ow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret)) {
28e1174f3fb106 Thomas Wei=C3=9Fschuh 2026-07-03 @164  		BUILD_BUG_ON(sizeof=
(long) =3D=3D 8);
2848afbe6714f7 Thomas Wei=C3=9Fschuh 2026-06-15  165  		return true;
28e1174f3fb106 Thomas Wei=C3=9Fschuh 2026-07-03  166  	}
2848afbe6714f7 Thomas Wei=C3=9Fschuh 2026-06-15  167 =20
2848afbe6714f7 Thomas Wei=C3=9Fschuh 2026-06-15  168  	return false;
40d2641468f659 Thomas Wei=C3=9Fschuh 2026-06-30  169  }
40d2641468f659 Thomas Wei=C3=9Fschuh 2026-06-30  170 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
