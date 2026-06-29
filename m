Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651C42248B4
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740544; cv=none; b=PcWI2yHRjO8nQmjQbbRPrbR0kbRVCwzlWJiNDK7y5WIrmNLCjgO8sTBMJKc26kZr19FMbfTU2jLyLirx7uJ0YrfRzn1tVipvb2i7TnLR6SKUYiYBt+tx/qWFKxR2Z9uKeXxes3CKLWSImw05u4MCL4MwsNndE3yXxEElqtrj4vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740544; c=relaxed/simple;
	bh=j9OkVYRbJ/YSNUfTbfHlXqCUaCu4/PZHY9XFLkwqPa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=clsStpNtJLIFEurNDUFBXAmKxNgiThLG0ZrrCiePCQOZjRr1LaV0yKQKMZwKL1c5Z+L6u3fl2yRu748QkWv2sW+FUM9pfE+Txd2UCeQ/abzIqgy4K3J0KQq69SsRycpWBQwDcypYymguy8zlTMnShQc84SkCjEv3ANT92m08Xx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2YKrSlV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2YKrSlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782740542; x=1814276542;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j9OkVYRbJ/YSNUfTbfHlXqCUaCu4/PZHY9XFLkwqPa4=;
  b=O2YKrSlVnuX0sOqgHCbbgsAfEWF5IAd9zFRiAAw3yHSRtloiDMEDyh/0
   71X0seXxgPYzAfM5XfcflYlW3ox7O2h5EuAG5HKIDzDkbFF0+X+RXmCD0
   zEGugEL1c1vL6MVpD9UqmcflZClTXmXXlPj9v4g32HXz+FjVvz8zMCwCu
   izJnhv84Qv2zJY8i/3Olzh8tcKzKmpW8g2zajA9f3oBFZuTG1iYKZTcmL
   WFSRqK/xfuAN/hQY+pegFIAYXXUWPZJakczn3K2nbo1BishbgeEzQntB8
   7nxAC9tEEX6aghz8/5f34RKcvAJVnP3fxfWMgILGZ7qAm46CDa1XHgQ+5
   A==;
X-CSE-ConnectionGUID: Cpoeb7czQ3OQ50i81CpHcA==
X-CSE-MsgGUID: mxmwGYb/RKOnwQxBZcbTCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="87337164"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="87337164"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 06:42:21 -0700
X-CSE-ConnectionGUID: m+ZnKSjpTmmacrw4zLSn2A==
X-CSE-MsgGUID: s5lcCPSmR6qF4uCA/yPVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="247508727"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 06:42:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weCFb-000000007QP-07Um;
	Mon, 29 Jun 2026 13:42:15 +0000
Date: Mon, 29 Jun 2026 21:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/cros_ec-hwmon-fan-curve 3/8]
 drivers/hwmon/cros_ec_hwmon.c:174:3: error: call to
 '__compiletime_assert_165' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202606292104.IVYGk6Hq-lkp@intel.com>
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
inux.git b4/cros_ec-hwmon-fan-curve
head:   6561c71e470a2b8d886c53091df197dfccea2b78
commit: 535be7581b9bedcd972e286bae5af754baa8c8cf [3/8] hwmon: (cros_ec) Han=
dle temperature conversion overflows
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: um-randconfig-002-20260629 (https://download.01.org/0day-ci/archive=
/20260629/202606292104.IVYGk6Hq-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260629/202606292104.IVYGk6Hq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606292104.IVYGk6Hq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/cros_ec_hwmon.c:174:3: error: call to '__compiletime_asser=
t_165' declared with 'error' attribute: BUILD_BUG failed
     174 |                 BUILD_BUG();
         |                 ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
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
   <scratch space>:26:1: note: expanded from here
      26 | __compiletime_assert_165
         | ^
   1 error generated.


vim +174 drivers/hwmon/cros_ec_hwmon.c

0baadfb1160c23 Thomas Wei=C3=9Fschuh 2026-05-29  165 =20
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  166  static long cros_ec_h=
wmon_temp_to_millicelsius(u8 temp)
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  167  {
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15  168  	long ret;
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15  169 =20
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15  170  	if (check_add_overfl=
ow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15  171  		BUILD_BUG();
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15  172 =20
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15  173  	if (cros_ec_hwmon_ke=
lvin_to_millicelsius_overflow(ret, &ret))
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15 @174  		BUILD_BUG();
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15  175 =20
535be7581b9bed Thomas Wei=C3=9Fschuh 2026-06-15  176  	return ret;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  177  }
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  178 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
