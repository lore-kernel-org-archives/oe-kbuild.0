Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB32F7F17
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095048; cv=none; b=GREL5v1MrqU2kSVLqcEvqtyu5993dLH0jH4eTYiLRlWAY2xN7z5Dci305UGm5Is88r5xFBNMNBFGh2ZczsVEkRMlFEaRyCMRBrILBQSElBhU3U8HrZusiNThuzf4zTktXEqPOALgvIcYe01OOmG8GRjNvtXHcidfBYA+GOLTtlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095048; c=relaxed/simple;
	bh=cTYrKf3IRGVBonB4OYqONq1c7wlV10xsiFcPUH4nXrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VV9itRjfYi6TF5PlTyZ22UQLMCRe8fUPsyQIfpPLYttz3F7AtBsM7fxHqY53AtOGbY/VxHGRVgNxB6HEoPcGig+K6d1z96etPhVeGiC9yf2va2m9gRy9n8XjXErWkWStTsHpbae6xH0spGp4FvxCLs8lsgcbmxW+jyWMlsyajpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4hcERr7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4hcERr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783095046; x=1814631046;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cTYrKf3IRGVBonB4OYqONq1c7wlV10xsiFcPUH4nXrY=;
  b=k4hcERr79LHi+Tf7KVIUObILYbvEnYFO3GPzslPZWFN4QtuiidpovYQL
   ZHDfXfDhJ/qVp/cg0Lcb8EjpbOTrEcFdfxOitklUVar0u7+wDBstmulZc
   Rdgs+QLSLIgJzB49tNUrJd48C6mdnOcIk0QOZ4iEDBOztAvSLslbFgFqf
   iq9df3s74J7a+GhBAnLkAcxISa0XlIDUkz2IHhxwKgSkLKXNu0oMZRP/y
   Tva0YTMj/WvfpqpBCcITAzsqfcc85zKd/jLxwH1XPZAysXTa4Du2v4QEP
   0MuKmqafDhcOML+lcxLJ/rDHC+0KcwwZbjekfUJF66Bsp0R011IgMHh4c
   A==;
X-CSE-ConnectionGUID: 4cKCEk8RQ5eAsjPxtge+QA==
X-CSE-MsgGUID: e2dsIkX5TqqBIpuQm4aAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83942645"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83942645"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 09:10:28 -0700
X-CSE-ConnectionGUID: zJ4ir4OAQpG6TRii5U/7zg==
X-CSE-MsgGUID: JfdTmFq/Qm+hibRK0O8X0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="251419917"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Jul 2026 09:10:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfgT5-00000000CKr-2K6P;
	Fri, 03 Jul 2026 16:10:20 +0000
Date: Sat, 04 Jul 2026 00:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/cros_ec-hwmon-overflow 4/4]
 drivers/hwmon/cros_ec_hwmon.c:163:3: error: call to
 '__compiletime_assert_341' declared with 'error' attribute: BUILD_BUG_ON
 failed: sizeof(long) == 8
Message-ID: <202607032358.AmYWPM8s-lkp@intel.com>
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
head:   f509e4c5cf112ac16f4d049c2ef6eb6dfdb6e6ad
commit: f509e4c5cf112ac16f4d049c2ef6eb6dfdb6e6ad [4/4] x
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260=
703/202607032358.AmYWPM8s-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260703/202607032358.AmYWPM8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607032358.AmYWPM8s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/cros_ec_hwmon.c:163:3: error: call to '__compiletime_asser=
t_341' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(long) =
=3D=3D 8
     163 |                 BUILD_BUG_ON(sizeof(long) =3D=3D 8);
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
   <scratch space>:73:1: note: expanded from here
      73 | __compiletime_assert_341
         | ^
   drivers/hwmon/cros_ec_hwmon.c:158:3: error: call to '__compiletime_asser=
t_340' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(long) =
=3D=3D 8
     158 |                 BUILD_BUG_ON(sizeof(long) =3D=3D 8);
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
   <scratch space>:69:1: note: expanded from here
      69 | __compiletime_assert_340
         | ^
   2 errors generated.


vim +163 drivers/hwmon/cros_ec_hwmon.c

a810e1aa11bf6f Thomas Wei=C3=9Fschuh 2026-06-30  154 =20
a8d51fb8a1ad25 Thomas Wei=C3=9Fschuh 2026-06-15  155  static bool cros_ec_h=
wmon_kelvin_to_millicelsius_overflow(long t, long *ret)
a810e1aa11bf6f Thomas Wei=C3=9Fschuh 2026-06-30  156  {
f509e4c5cf112a Thomas Wei=C3=9Fschuh 2026-07-03  157  	if (check_mul_overfl=
ow(t, MILLIDEGREE_PER_DEGREE, ret)) {
f509e4c5cf112a Thomas Wei=C3=9Fschuh 2026-07-03  158  		BUILD_BUG_ON(sizeof=
(long) =3D=3D 8);
a8d51fb8a1ad25 Thomas Wei=C3=9Fschuh 2026-06-15  159  		return true;
f509e4c5cf112a Thomas Wei=C3=9Fschuh 2026-07-03  160  	}
a8d51fb8a1ad25 Thomas Wei=C3=9Fschuh 2026-06-15  161 =20
f509e4c5cf112a Thomas Wei=C3=9Fschuh 2026-07-03  162  	if (check_add_overfl=
ow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret)) {
f509e4c5cf112a Thomas Wei=C3=9Fschuh 2026-07-03 @163  		BUILD_BUG_ON(sizeof=
(long) =3D=3D 8);
a8d51fb8a1ad25 Thomas Wei=C3=9Fschuh 2026-06-15  164  		return true;
f509e4c5cf112a Thomas Wei=C3=9Fschuh 2026-07-03  165  	}
a8d51fb8a1ad25 Thomas Wei=C3=9Fschuh 2026-06-15  166 =20
a8d51fb8a1ad25 Thomas Wei=C3=9Fschuh 2026-06-15  167  	return false;
a810e1aa11bf6f Thomas Wei=C3=9Fschuh 2026-06-30  168  }
a810e1aa11bf6f Thomas Wei=C3=9Fschuh 2026-06-30  169 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
