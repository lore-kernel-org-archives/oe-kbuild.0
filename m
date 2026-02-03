Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746F21ABBB
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117051; cv=none; b=BoPpzufBECAwmdl70L6SVdr4BuO5k7/2tcracpHYcNmvjEwyeEnUlA+H177B0KAo+eUE6/EiOdQ5AMvVJzeKLnZLvY9NuPbSlWhJSrN6pYOKE8ojfhdy7jUjGNm0bqrEO393FVuEz6b7zqKZuqGoPbGfahD/xzUUmqtwTmLwR8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117051; c=relaxed/simple;
	bh=9cw+BSIvxbrVOZqny0H2fdRK8fCKgxeMEebAln0RyE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QPpxJ2kL1TaTRuKRsj4buah8zTdNbC4kU4KlECIE/nMmc6fnDvOQQEAOgfUHIL1/Eh9TeTFuS+1lnS5vfRTV69mO2noYPdk3vimKBbbzMp2U3MNJjj2NVZSsEpNvfJf6DTU9SarruZjpXrhyLjEwPVpVEfMRaKVLQei0FY0m5ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJLK7exy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJLK7exy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770117050; x=1801653050;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9cw+BSIvxbrVOZqny0H2fdRK8fCKgxeMEebAln0RyE0=;
  b=bJLK7exy+tE3s/gjJOu92rWKMvS3czJ5+BQQDwqVGZtg9PtLRKDDPR8u
   KMaOR2r0DKP+rEzaPonNzKbczNmF4bT5Jnu1l+lmWFDDOYVOmqVXI8jee
   62tuU69eWFpqM1dWCUFlGHoM7vC5tSvDMl3szKs3ihiur4dBbc233ho5U
   S47qF8VXhJ4EAUMO2lYO/BuUozobILAhegt6Ll8x1DMyJMv88GmkQ/nry
   QV7+o/bYzyFSFkH8mcrDte3pJFHWtnMzCmUTQesYj9bHI69mwFjPij1M3
   050iVknDfYt/9Srm4Hq4z6MU/Iy1oXapwUM3ANtGGN563TxlgRB9VE938
   w==;
X-CSE-ConnectionGUID: iwkxyJQfQpeh0gqhoplRRA==
X-CSE-MsgGUID: mYHhIpqzQACAIlvwohO5Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71324971"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="71324971"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:10:49 -0800
X-CSE-ConnectionGUID: y4giJmC2TSqUplj76QXOhw==
X-CSE-MsgGUID: 2ugTozAQTEugipz3rbWW0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="240489309"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2026 03:10:48 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnEIv-000000003ML-2RRt;
	Tue, 03 Feb 2026 11:10:45 +0000
Date: Tue, 03 Feb 2026 12:09:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mic:next 1/20] fs_bench.c:7:10: fatal error: err.h: No such
 file or directory
Message-ID: <202602031223.YvM4unbU-lkp@intel.com>
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
TO: "G=C3=BCnther Noack" <gnoack3000@gmail.com>
CC: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   039b06ca8a1d6b67cfaa62b451611916297763a2
commit: 97d3afb9ed367bffddbdb70ce2efe5241f2eed2b [1/20] selftests/landlock:=
 Add filesystem access benchmark
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260203/202602031223.YvM4unbU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260203/202602031223.YvM4unbU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602031223.YvM4unbU-lkp@intel.com/

Note: the mic/next HEAD 039b06ca8a1d6b67cfaa62b451611916297763a2 builds fin=
e.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs_bench.c:7:10: fatal error: err.h: No such file or directory
       7 | #include <err.h>
         |          ^~~~~~~
   compilation terminated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
