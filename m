Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582B115A864
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 02:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769479229; cv=none; b=TJOgMiqcw+OKPlORQfH2NewXQCNCzKSMdMgd7IAp+VgUTNg/zLL5FWQxsWll7dEnAo8DvVmaTCExLCHvWdrwjEnWInIebZAxime0yIzqEhlcDVagog7V1CV/jPUvQd0lxzUd5jHB/axVOnHtgKtn3H1tYouCrCUeMPkux529bLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769479229; c=relaxed/simple;
	bh=uR1Sg8mwkGfa7w8Q/ZBUdE/sAwjjkAQGUEUbL33YZgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bZWi38NI5mpkt/PptQQex4o+wDieWfs//LpFCiD+RRloPJc25O60W37xgV4aDHiclHkyIChXP46BoqB8vFPqm4TJ1e6T+fZqiJ8zN9I8KEdoWsx6pWqdqi+yawRRZlc1jKd3TOZtdgdpteoGkuyR67wAjPoyP0ozMdkEkKD6uaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdTGoCx4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdTGoCx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769479228; x=1801015228;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uR1Sg8mwkGfa7w8Q/ZBUdE/sAwjjkAQGUEUbL33YZgk=;
  b=CdTGoCx4efp2SBFxsAbGjE5eTNyrUQHAOg376Pcr9skwhM6HrXY2XJVg
   UbgX4LjHANaUjvBeWwhpdrmv/l5OAr2/2xSq3nDJnG9gfWoZvWnEjs6tb
   c4Dxyzx1tEsXFn5UPDFW7xjQHM+r4Sy/yEH5xcDs77CILavdVXESDzZ/V
   CGFs4BB90jD3DufkCqX7ZRPGe1ATWhXqaSm/X0RZMuUmuwiuLmySjd9Tw
   1aJi+eKEVaScRjo4b/rE4uMT3WcEe5td97AHssI4vz29/lf3lpVKzqT2v
   wgqwBBEd8+X7Gk2xeFWAiitwJrsA0s5aXl4fTRgpBCPtMBRbS60etDKyx
   g==;
X-CSE-ConnectionGUID: w1YFFnPRQAOWp1Q93ZgOfw==
X-CSE-MsgGUID: N+5Gd/aASgGmnGZMZ8VMjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="73249728"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="73249728"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 18:00:28 -0800
X-CSE-ConnectionGUID: oPNUE0XAQaKydY1OKBINHA==
X-CSE-MsgGUID: GUUQ6JPCQkmNp1Pv5hzXlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207070130"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 26 Jan 2026 18:00:27 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkYNU-000000001ez-1ip9;
	Tue, 27 Jan 2026 02:00:24 +0000
Date: Tue, 27 Jan 2026 02:59:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 16/42]
 auxclock.c:8:10: fatal error: fcntl.h: No such file or directory
Message-ID: <202601270202.Hxz0tOny-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/auxclock-nanosleep
head:   80461d79725e9de0ffda5d621552a2db3608f64d
commit: 5d2e92cfb259927064010e55f3582508b2015726 [16/42] selftests/timers: =
Add testcase for auxiliary clocks
:::::: branch date: 11 hours ago
:::::: commit date: 13 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0127/202601270202.Hxz0tOny-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260127/202601270202.Hxz0tOny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601270202.Hxz0tOny-lkp@intel.com/

All errors (new ones prefixed by >>):

>> auxclock.c:8:10: fatal error: fcntl.h: No such file or directory
       8 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
