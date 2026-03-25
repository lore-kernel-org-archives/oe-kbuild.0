Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4251E280330
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 02:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774404569; cv=none; b=DMEoEA1f/AuytW6k9L1EzktqRHJQtsFOJVrvvouaNe7NpQ2XfirTUu/ppieRBTGbTvNl07S9Lty/rVfbk9luiDvnocdPc/XXHVmxrWzxVkRkej9BeVwEjeLMw/kgzlMs6ELmvUVB5L15cKr6NA/4nTPkmLN2e4/7DQTXkFrhkHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774404569; c=relaxed/simple;
	bh=HBmprKbVbf3huNl8uKXGof2XgmJnTwPklzftfuQAUxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gcg28MqwazBkTsRL+sdCA28l6l3XhrEi6jugsthagIOX0y+1EvTXEY+bmMYQcFH/1zpZ/xd9P5DwJp9Kmu7hORxV1To7Mg6sdxtoJLsF5k7Lv8CQ/PmQRwb8JdLnQ4ShIz4F5JY2PyJOuIk2VWX5kCpR49PojcL9me7D52rQkWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QF3pzsBb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QF3pzsBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774404568; x=1805940568;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HBmprKbVbf3huNl8uKXGof2XgmJnTwPklzftfuQAUxY=;
  b=QF3pzsBbX3nX/B0WwGD+Ej9W3t+RW6k+UO3ye+4SCoQDP5QlaTHr3Mvk
   K2+fDgivHmAx+xFoiwjQUS+2pqwDahjfxFx3aSkg1NTZE7bNAM3vF99V4
   uBpm8/byjdcUWY3FB0545ITmRxHwRVC8HvRdsx4nc47F4DnWlc6gAhPiH
   zJewZhOTUT21hMRVrYNL0UW4QXzK3nZtUdzLi5wWSlPhToE2j972s5ETS
   Wy9tRFa84ZBj9PDVkYV+/RDaf8EByX8aQT24CzOX5DYCOdOKxJK2viTew
   VkUpKb8MSZ6vhhzTsrVWcecFnE7qNFXvAwyikskdacFFZxp0k9E6IUPvb
   g==;
X-CSE-ConnectionGUID: 0h3NetUyTPCLdKtyGZEAiQ==
X-CSE-MsgGUID: t1Y2gGzjRYuN8LRRcCy5mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100882030"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="100882030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:09:27 -0700
X-CSE-ConnectionGUID: M2PHjlkDQReV+iGMcvmZEQ==
X-CSE-MsgGUID: TtZDkhxgTW6yuYvRH4swug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224482560"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 Mar 2026 19:09:27 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5DgS-0000000070j-0jP8;
	Wed, 25 Mar 2026 02:09:24 +0000
Date: Wed, 25 Mar 2026 03:09:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-ifdeffery 4/6]
 arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c:446:21: error:
 conflicting types for 'clock_getres_fallback'; have 'int(clockid_t,  struct
 __kernel_timespec *)' {aka 'int(int,  struct __kernel_timespec *)'}
Message-ID: <202603250317.YBsIxsts-lkp@intel.com>
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
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-ifdeffery
head:   45c96fcd1b5efdc20a7638f8aafec16f4572a94b
commit: 541db7c42182bf886177c34f5bef756f958e99e2 [4/6] getres fallbacks
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
325/202603250317.YBsIxsts-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603250317.YBsIxsts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603250317.YBsIxsts-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/vdso/vdso_generic.c:2:
>> arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c:446:21: error:=
 conflicting types for 'clock_getres_fallback'; have 'int(clockid_t,  struc=
t __kernel_timespec *)' {aka 'int(int,  struct __kernel_timespec *)'}
     446 | __always_inline int clock_getres_fallback(clockid_t _clkid, stru=
ct __kernel_timespec *_ts);
         |                     ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/vdso/../../../../lib/vdso/gettime=
ofday.c:24:
   ./arch/s390/include/asm/vdso/gettimeofday.h:34:6: note: previous definit=
ion of 'clock_getres_fallback' with type 'long int(clockid_t,  struct __ker=
nel_timespec *)' {aka 'long int(int,  struct __kernel_timespec *)'}
      34 | long clock_getres_fallback(clockid_t clkid, struct __kernel_time=
spec *ts)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +446 arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c

502a590a170b3b Thomas Gleixner  2019-07-28  445 =20
541db7c42182bf Thomas Wei=C3=9Fschuh 2026-03-24 @446  __always_inline int c=
lock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts);
541db7c42182bf Thomas Wei=C3=9Fschuh 2026-03-24  447 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
