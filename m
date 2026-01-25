Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC618A6CF
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 05:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769318633; cv=none; b=e9tW6oYV6rWA7XahJG8haUQub/LPL7OvpAgpln4ZSQgLGLa6n/brMP0NXgu/0n+vMfLKjiDpAoXy8F7Mfcm86zoedsiHuSCpSpK3RfzCpsyOldD6oPyMLscFEIUmHEXkHZp6fb0+/l/bLBsVOs+xUdMOYNc70tvRzKCeIC+SRgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769318633; c=relaxed/simple;
	bh=uTNVxJzHoJc5kTjTrYSN0CixqbGo2HjkEae0IJhqsJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tOW8sSVJyAg+3sVaZVg74x6lJqpx/L6pk6gAaQwxbUwKeAxeQz7pXbCY8/P0oHqyoaxnYJEztEfWDzU9dxPG3DHvihLNFKMTDPcntyD3syHJN76WgykYbjF6StBiX/rK3dXSw5hXuVQXo/DwATNu0HmxIDk/qzECPRCED20Rn3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCgTTyH7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCgTTyH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769318631; x=1800854631;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uTNVxJzHoJc5kTjTrYSN0CixqbGo2HjkEae0IJhqsJA=;
  b=PCgTTyH7O3tUcwWfGqPMD2UW0SVuVCjYdR88Ur1A8vpnU1wk1EJ8uuyQ
   1SK4zaug70cGKGrql/v1a5GQZm+jI/MpeOIXXtARso7y1IHkVdoYa07jZ
   p93klha4GBYFD5LU+NucQrISBpWqgYIuF7M3fC8Y1yqAGlj8o7ABHyh2P
   B+nqH9xZ8ZnqInvG8mnpzmZaFNrV+lBnFiyTZWR8ZlrCzJH49E+YtM/ij
   mGlg/RYzqvt15kvE2Yc5Lli6nMIgP5zjo4QdcUq939/YNls7AvALcCsFO
   u+7FTOiuNsLxhc6LurAudis21H+ydcO4TzvV5rzUtlTlA9O08ch0RljmT
   w==;
X-CSE-ConnectionGUID: 1t2+sbfXRVK/JHxkTSZtIw==
X-CSE-MsgGUID: Hg+13tFbQMiXDzt+3MQy5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81957459"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="81957459"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 21:23:50 -0800
X-CSE-ConnectionGUID: seFx6n0ZQ1+NKtn7+0r2qQ==
X-CSE-MsgGUID: u8qjWeSPSFGyPj7RXVpEBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="206634163"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Jan 2026 21:23:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjsbD-00000000Vne-28gP;
	Sun, 25 Jan 2026 05:23:47 +0000
Date: Sun, 25 Jan 2026 13:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-libc 5/7]
 usr/dummy-include/string.h:1: error: header guard '_DUMMY_STRING_H' followed
 by '#define' of a different macro
Message-ID: <202601251331.LbuvwpRe-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-uapi-libc
head:   42f8899f5959bce93a899d194c5b14d2a809bd31
commit: dad08d57845cdf10080325af1084b1a1f6bfc05f [5/7] can compile
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260125=
/202601251331.LbuvwpRe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601251331.LbuvwpRe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601251331.LbuvwpRe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/string.h:7,
                    from <command-line>:
>> usr/dummy-include/string.h:1: error: header guard '_DUMMY_STRING_H' foll=
owed by '#define' of a different macro [-Werror=3Dheader-guard]
       1 | #ifndef _DUMMY_STRING_H
   usr/dummy-include/string.h:2: note: '_DUMMY_STRIGN_H' is defined here; d=
id you mean '_DUMMY_STRING_H'?
       2 | #define _DUMMY_STRIGN_H
   cc1: all warnings being treated as errors


vim +1 usr/dummy-include/string.h

c2504abf729a15 Thomas Wei=C3=9Fschuh 2026-01-24 @1  #ifndef _DUMMY_STRING_H
c2504abf729a15 Thomas Wei=C3=9Fschuh 2026-01-24  2  #define _DUMMY_STRIGN_H
c2504abf729a15 Thomas Wei=C3=9Fschuh 2026-01-24  3 =20

:::::: The code at line 1 was first introduced by commit
:::::: c2504abf729a15f7df4bff328def344426a2b6da dummy includes

:::::: TO: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
:::::: CC: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
