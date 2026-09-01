Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB7379C55
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Sep 2026 00:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223695; cv=none; b=izFz6KNmPsgt5CSrCh1jbRCu98FJjZRVbGp/z10VI2Q0/AFAkB76V9IwrNXO59K3etlYKUzEAP6pJ7BaISqvYaLtqZvXR3rRD/97DvBtHzyj9zJllLnq/4bXsIJ5UgV4CnroHJqAx40kunurF249WARN0A8SG3+CUZG9CT9HHXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223695; c=relaxed/simple;
	bh=g6Wt/n27sT0CTP58M0vQgj6g2bryQ71MR2RO38Ijl8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AzI2OvvqU+YPJVVrjv6GKFKLYEzdZDlqo+QY/oAApcdY06wBI3B9Z3KdZr29jU13+DmvtGFs1iXRphFI0HyUjFm6fk6YBAlv82zxSEb+7pqmF9LcWtK/750H4zHUx9Igcld10UNs2AFzwKzqzb3RZD/DKYDl9jSMu3vxigej5Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0Ua8okh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0Ua8okh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788223692; x=1819759692;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g6Wt/n27sT0CTP58M0vQgj6g2bryQ71MR2RO38Ijl8k=;
  b=Q0Ua8okhb+J6bprckLZtgOqf9lABbD1F2Xx0uAEz64cnT0n4GZZ2hM5L
   PvG1+OsJMG2hLeLil+5b2mkAQ611K4DA0l6zfTG3WXVLh54mM4xLOF+LA
   GwV1cM4MJb9s9AwVv1HJC/JzeJ7S+6Q9UauyFKDwUTe306BeY+OqednMc
   Aa+WEg/zWBAFxYDA08N705ZIT3mUcqFXbXxbpliE+dbPTLLx5OzR8H5Ke
   fzToga5qddKr193LjT0ZE9T6FYGJfxPEah3IEnRppC9NhqfZ4qdyfMuHM
   LgHTbNmoiAb8OHRT9iq+8ZB9yj0j4hvM5GzufV0NhkDeh4b4pNl9wwaqX
   Q==;
X-CSE-ConnectionGUID: Px5Q3eCuSa2CJGlHDzXv1g==
X-CSE-MsgGUID: bPti9oMJT5K2nTs9iyXNKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106015317"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="106015317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 17:48:10 -0700
X-CSE-ConnectionGUID: 1ZhDDHHhTuWlFs45wLiQ2g==
X-CSE-MsgGUID: QQshREpeSCqovZ3P5j7J9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="274199077"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 17:48:09 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1CfW-000000000eR-453h;
	Tue, 01 Sep 2026 00:48:06 +0000
Date: Tue, 01 Sep 2026 02:47:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: nolibc-test.c:930:24: warning: self-comparison always
 evaluates to false
Message-ID: <202609010202.aqdwqM4q-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   abdf623ddb75b24659018d3952d8f61937306ae5
commit: 6fe8360b16acbfb50c703f52568cad46759be2ed selftests/nolibc: also tes=
t libc-test through regular selftest framework
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0901/202609010202.aqdwqM4q-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 06b=
fa42c66dea409a9737f9679260ff51425d5b3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260901/202609010202.aqdwqM4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 6fe8360b16ac ("selftests/nolibc: also test libc-test through regul=
ar selftest framework")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609010202.aqdwqM4q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   nolibc-test.c:784:9: warning: 'readdir_r' is deprecated [-Wdeprecated-de=
clarations]
     784 |                 ret =3D readdir_r(dir, &dirent, &result);
         |                       ^
   /usr/lib/gcc/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/include/=
dirent.h:188:28: note: 'readdir_r' has been explicitly marked deprecated he=
re
     188 |      __nonnull ((1, 2, 3)) __attribute_deprecated__;
         |                            ^
   /usr/lib/gcc/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/include/=
sys/cdefs.h:510:51: note: expanded from macro '__attribute_deprecated__'
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
   /opt/cross/clang-06bfa42c66/lib/clang/24/include/__stddef_null.h:26:14: =
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
