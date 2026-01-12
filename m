Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1271D3043BD
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 02:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185808; cv=none; b=IfaZYGT7vo8B3bEefyFBTcdu3TKmtagp2dgkwDQaeITnpOjF1Eenepl9VK1Bi7TOxyHjcbmOhUWxrISZ/cs3bd6ednaghfqpOgN2+cT1UZluQHcK1Uhs3joeMrMBHe9dPhkr6MdlMMdHYyAwuPsM1C5jhI7i1nXokTikjiB53P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185808; c=relaxed/simple;
	bh=Z2xw2q2TEOYoXdeQVbGD+VsIFAFoqP31/peRzBmJJIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qg6RGVgq2miLWFeBUYtpegkPu6Iho9m+R9pjjeekvUZHoUeh9GgBzT1/opTJvbnFUqkCqJzZNXJJdiNHSsN8t2Vwta7t7Pan07xlN+fhZOCk0j0DM++iAvSBvccpluXSWY7FJQrABpBkb/dn/sN9CnBzXgaacl73i8uFWQeKOtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fe9ozZPa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fe9ozZPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768185807; x=1799721807;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z2xw2q2TEOYoXdeQVbGD+VsIFAFoqP31/peRzBmJJIE=;
  b=Fe9ozZPajfhDv5n+W8JIiPbJ595nCnWauWJRuNKAz4mPQm888FPgj3hP
   CxWODImnbtuDF1RmCdUUkcfJVHryBRadRS6+wWQdqpQ5iwugY2rJSjT1/
   zfZX14cspfsZQ/rsx7EmQXSHPAK37bSxwYWr04VjZNUlvMFj0in9swBwI
   8sqmDRxi+fjyADbXXqdq5vajdEL23Nko+Hvn6/EpnGzEueey39Q5URRmr
   Bbh+otICigvWlXVvJ8XVTPQo2ErkZAP5RcKA0zvM+/UsbC2e0aCIJe6uF
   hOE7ZjxooVAyYtIY+Q+9MrIpVJ6ZYrNJb1fcO5AIt0n1fy2LzMILg9jE/
   Q==;
X-CSE-ConnectionGUID: rthQwd87QaWdAhaCBD/LVQ==
X-CSE-MsgGUID: MUPiPi3DReWQdfns/OpXsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535461"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535461"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 18:43:26 -0800
X-CSE-ConnectionGUID: FRk0D0KESNGHS6La8AXo1A==
X-CSE-MsgGUID: ZpsVluIVTgC8aDOdO7OmQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203123968"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 11 Jan 2026 18:43:25 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf7tq-000000000dR-3jmc;
	Mon, 12 Jan 2026 02:43:22 +0000
Date: Mon, 12 Jan 2026 03:43:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nolibc:for-next 22/25] nolibc-test.c:784:9: warning:
 'readdir_r' is deprecated
Message-ID: <202601120351.v9dJgXNm-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc=
.git for-next
head:   a5f00be9b3b07d92c6689997403851a32e1874cc
commit: 6fe8360b16acbfb50c703f52568cad46759be2ed [22/25] selftests/nolibc: =
also test libc-test through regular selftest framework
:::::: branch date: 15 hours ago
:::::: commit date: 16 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
112/202601120351.v9dJgXNm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260112/202601120351.v9dJgXNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120351.v9dJgXNm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> nolibc-test.c:784:9: warning: 'readdir_r' is deprecated [-Wdeprecated-de=
clarations]
     784 |                 ret =3D readdir_r(dir, &dirent, &result);
         |                       ^
   /usr/include/dirent.h:188:28: note: 'readdir_r' has been explicitly mark=
ed deprecated here
     188 |      __nonnull ((1, 2, 3)) __attribute_deprecated__;
         |                            ^
   /usr/include/i386-linux-gnu/sys/cdefs.h:510:51: note: expanded from macr=
o '__attribute_deprecated__'
     510 | # define __attribute_deprecated__ __attribute__ ((__deprecated__=
))
         |                                                   ^
>> nolibc-test.c:930:24: warning: self-comparison always evaluates to false=
 [-Wtautological-compare]
     930 |         if (st.st_atim.tv_sec !=3D st.st_atime || st.st_atim.tv_=
nsec > 1000000000)
         |                               ^
   nolibc-test.c:933:24: warning: self-comparison always evaluates to false=
 [-Wtautological-compare]
     933 |         if (st.st_mtim.tv_sec !=3D st.st_mtime || st.st_mtim.tv_=
nsec > 1000000000)
         |                               ^
   nolibc-test.c:936:24: warning: self-comparison always evaluates to false=
 [-Wtautological-compare]
     936 |         if (st.st_ctim.tv_sec !=3D st.st_ctime || st.st_ctim.tv_=
nsec > 1000000000)
         |                               ^
>> nolibc-test.c:1391:54: warning: null passed to a callee that requires a =
non-null argument [-Wnonnull]
    1391 |                 CASE_TEST(stat_fault);        EXPECT_SYSER(1, st=
at(NULL, &stat_buf), -1, EFAULT); break;
         |                                                                 =
   ^~~~
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/__stddef_null.h:26:14: =
note: expanded from macro 'NULL'
      26 | #define NULL ((void*)0)
         |              ^~~~~~~~~~
   nolibc-test.c:369:22: note: expanded from macro 'EXPECT_SYSER'
     369 |         EXPECT_SYSER2(cond, expr, expret, experr, 0)
         |                             ^~~~
   nolibc-test.c:366:70: note: expanded from macro 'EXPECT_SYSER2'
     366 |         do { if (!(cond)) result(llen, SKIPPED); else ret +=3D e=
xpect_syserr2(expr, expret, experr1, experr2, llen); } while (0)
         |                                                                 =
            ^~~~
   5 warnings generated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
