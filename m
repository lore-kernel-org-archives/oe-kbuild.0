Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558880;
	b=1MNaCI/mQBfq+ilHQ3xJ5gwXIlvHM7dF0vtO3aJnhEEZeCYWWNxp9EDxnBBXIEKi9HY4
	 fM8/2yOiswSomSB2Xcs0cIVRNq/j6/cMqf0PIxHP70c3s02sbtIynyvXTwa+VYsUxTyA/
	 QXQRF75BU2VXFnzJPN/VxC9tfbzNUPLZJC5y0f6cODTNRjFGxzseDdJntx1IEY0hGVsBL
	 nMkAjo3swyC1zW+OvtuR/NbEY7tKLVbWVk6Xi9K5UogfKRmalJs2sPlhOYG1ecjdvCf7W
	 58DpOdFLnFI/x91SHEkOj6j9uzi/hlX+5wzPiw1BOdgAbdVqin9/OYHuipJ5sEWoatQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558880;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kdaE8OIEUBVI0EUKxWrRoyVptGNk9553yr6wbFtThnc=;
	b=E7zUwz/0mSxPa6h+D5fOF83udTE3ccRjA2Wb0GPBlrYwxmV4ClclHFaC3igP44mROSvV
	 76VKqwgEvztuZN/kKA9d6wN5hd3kALj5X7b8qf/IYRI3DCSkYO8brcrpYcgq+XxpoXnKv
	 B0Zx4Zu11aw3NZi7ulxNVpBee7IQSbANzeYwksN5RMryKUNjcuF0Nr7LsHP2/FuPpOGJ0
	 X4MSmL+bJxpNdsytRvZ2KEM+jqYNGUVKv0y18HaJ8aMFrExDMHWM8QKhvDsQiR+jVN468
	 NEXGfx+ezABQW11j+uFi1RTs/4vKxIQpFN5kflfD0y0KjrwedcYJ8nDpEqSX9oiG42g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Utbe03FT;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466AF606B1C0
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 08:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466AF606B1C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Utbe03FT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794558879; x=1826094879;
  h=date:from:to:cc:subject:message-id;
  bh=dSVdFeBPOxuhrC8ZfV0zqXa/Lxxgc/JARvmT+mk+Hzk=;
  b=Utbe03FTehHLrGinQs+8H36XquREDpKWhSg8cpkhzHn6X3+5ZwiJUak5
   wr/NulLidfBqxErO2naxEtL0BDbfBSrEjux2HNTMdXYt8se+C/Ov7Nau+
   /hDfzVEQiI79IleT9TvxDVLQANOAteu+qHJNUfGUeIu5qWRX5v3BXLjQW
   4iuqQj0q6KfFqtvkTQPOB/9z9YlHGdS1KsqEFNkCHIpaHai3eJZanThp+
   rYyDwhW9nhkIveXGHUFaovEvcDpTGl8w2JV0JetuP0u5U+49BRAKSMv8b
   OTH4lJpKaJ1X0pThyq/k11IVIorZz39Hc5VL8YO1jsjRj+qFenXJPNBQ+
   w==;
X-CSE-ConnectionGUID: 7vtwcsSHST+bx8nXX2v27g==
X-CSE-MsgGUID: +1e75V1xQ/aaYHg7Ty1tdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3435475"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3435475"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 00:34:39 -0800
X-CSE-ConnectionGUID: 6MK2N1uxTQa0urR/7jxIWA==
X-CSE-MsgGUID: t3VHmTL3TZ2pnGQxYSeV8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8868648"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2026 00:34:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRmjz-000000001Bf-3Tl0;
	Fri, 13 Nov 2026 08:34:35 +0000
Date: Fri, 13 Nov 2026 09:34:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android18-7.3 39/39]
 tools/testing/selftests/../../../include/linux/compiler_types.h:638:10: fatal
 error: 'asm/percpu_types.h' file not found
Message-ID: <202611130949.qO62LkT6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   4dd306a07b2f456fd70ddaa28f4f65640374f202
commit: 3dfe54dcd10c7a840fce7136b972de65b277f006 [39/39] ANDROID: fuse-bpf: selftests: Add fuse_test and build the tests
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261113/202611130949.qO62LkT6-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130949.qO62LkT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611130949.qO62LkT6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from test_bpf.c:4:
   In file included from ./test_fuse_bpf.h:16:
   In file included from tools/testing/selftests/../../../include/uapi/linux/types.h:14:
   In file included from /usr/include/linux/posix_types.h:5:
   In file included from tools/testing/selftests/../../../include/linux/stddef.h:5:
   In file included from tools/testing/selftests/../../../include/uapi/linux/stddef.h:6:
>> tools/testing/selftests/../../../include/linux/compiler_types.h:638:10: fatal error: 'asm/percpu_types.h' file not found
     638 | #include <asm/percpu_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +638 tools/testing/selftests/../../../include/linux/compiler_types.h

c06cd66387da92 Thomas Gleixner 2026-06-02  637  
c06cd66387da92 Thomas Gleixner 2026-06-02 @638  #include <asm/percpu_types.h>
c06cd66387da92 Thomas Gleixner 2026-06-02  639  

:::::: The code at line 638 was first introduced by commit
:::::: c06cd66387da92e6cdac44e16c7b5ef9219c53ac percpu: Sanitize __percpu_qual include hell

:::::: TO: Thomas Gleixner <tglx@kernel.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
