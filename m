Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8237649D
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205781; cv=none; b=D43nVX7XRWQK/9pDp4odQAZCXtpQvX8kgmODshTdppEDsdhF9HTi4GbGQ1ylYmdJ5bgeBf2dosSY7B2Owx7sORlc2TbuvYQtf8dmGwIt8cy9YE1Lb+1uxl7sAfpCKNP43XY3yu6x7Ua7qTmKeA6t3OyIH0AszM2dONlW9QD9bVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205781; c=relaxed/simple;
	bh=Je2pnkpRjEOeqSFwzTrmoaXVtufXiPNEAlkx1v6/zwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kBn/+fgW+qoSFctq/5Di79l33w+V+oZBXimBAMo9oBRsvVyWCWrlH2jX7HyYPWT6nLduDAUuvBAPtkbGSwi8lqwExhl4yU93ukKTwsjeTfagVeAQiGKZfpocU9Mi/Vu2ZxXfXqgUet6BQtsH4t7j5hRrxKmFCWKM1+MSM+bwfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foJiPrxI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foJiPrxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205780; x=1806741780;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Je2pnkpRjEOeqSFwzTrmoaXVtufXiPNEAlkx1v6/zwU=;
  b=foJiPrxI2OJMp2RtOCS7H9USjq8qVBhMWvPMdMk00ec/OL+sYA+ArYB1
   v0Hk1f0zfdh/wWAxgBYdFaveeJQEZ7BfKqaHAUEStEZpXDW4vbik3PoQE
   3yzp0DxZkC88aPF3JxDNSN0wH0RZGIxQXrbxn/QWbMvIUQxOz2RJ1reW+
   92DV67W6OoLJRBeNxH/dNoenpsqUTrS1r1TDltT5yTeuikFJkr4dbRzdh
   MACuxD84gZb3Nyqnnpgz+o9Lb0b1y0E+JfM+ij2hKgOkeXqW3Ruu1n0qr
   rM7yJI0A4fi8IFKDuakoW/eu4Z5h8bSQOk5SyD2QYIKNChuJBDeTHZz1P
   w==;
X-CSE-ConnectionGUID: 7kbsj1FGTlK8jhbwteooDg==
X-CSE-MsgGUID: Q7NxbHSIRyCps36SScLWGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311887"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:58 -0700
X-CSE-ConnectionGUID: ofLumV6NT2q+d3fr/Ynyhw==
X-CSE-MsgGUID: vMcubWcJR1ueKnZ5Tnib6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286594"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013v-2mOK;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: robust_list.c:522:24: warning: storing the address of local
 variable 'a' in 'head.list.next'
Message-ID: <202604022320.YusQt6Jj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Andr=C3=A9 Almeida" <andrealmeid@igalia.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: cd91b502f1b4bb81e82fbae38678c698ee5ac026 selftests/futex: Create te=
st for robust list
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0402/202604022320.YusQt6Jj-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260402/202604022320.YusQt6Jj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: cd91b502f1b4 ("selftests/futex: Create test for robust list")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604022320.YusQt6Jj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   robust_list.c: In function 'child_circular_list':
>> robust_list.c:522:24: warning: storing the address of local variable 'a'=
 in 'head.list.next' [-Wdangling-pointer=3D]
     522 |         head.list.next =3D &a.list;
         |         ~~~~~~~~~~~~~~~^~~~~~~~~
   robust_list.c:513:28: note: 'a' declared here
     513 |         struct lock_struct a, b, c;
         |                            ^
   robust_list.c:512:40: note: 'head' declared here
     512 |         static struct robust_list_head head;
         |                                        ^~~~

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
