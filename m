Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49EE22D4C3
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jan 2026 03:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767411556; cv=none; b=C/sb4Efd3V2OCGhSNbeQ+cDeb+jhxLSfzhM03oSmc/YMcHkwvHYwOrlZ/mwyXYeRA8oi/nZBRvb+MCIeGKX4VTYgBaT1ECFeKVrpRGAWIB3VROB0m8BG5D6uQQ7THTxw/fwqUyz7eeteC+EsdJuFVW89Rpni0Y1SsIxdwgDYFeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767411556; c=relaxed/simple;
	bh=41tlF7QD9kVbkdpOUYNyXuHMgpNxIlVVXysr0eOFATw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vgp1zF55wKZN2qc8fujl5OCW6oUXFLN18Uh4qv9133xiH1jVnngF98URynhLp+gza3eJqfCWZ6/JjNSaRgQrl1CyXch9Hrxy3sKs6xgDKvaHz9+R/BDEK1nsgWkxPZyfU4LOnrk1t/Mbqwzs4DQZ2v4gjMjoT3nIKOKpDXsoPQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIDyHdDv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIDyHdDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767411555; x=1798947555;
  h=date:from:to:cc:subject:message-id;
  bh=41tlF7QD9kVbkdpOUYNyXuHMgpNxIlVVXysr0eOFATw=;
  b=TIDyHdDvsJTjCMK/VXDD5WFc7DOG0rVPwdE55cMIKbhq5pHOaNLEywlP
   YZG5CumW5a+b6v7JNIYniBPDdNaSJLOj9DvvAqqAN0Wwh8sH6g8a0/sMO
   SsqfOHYAVTPetiGPfCGQVdXCZjeLgCxdqbOuTRPUxPE+EI6plm1/scr1A
   zptBbrceGC0ehCfSYKdw1HuJUFe9G493dSKoS7Wv3FSv8Ua9k15wCd5L/
   yuPkebuLlTZhQ6dOj5jvV2Vt4WPq1LV/LzlDNyXlB9922vEZnPBN5x5fo
   L6s9WrkWm28Z8pClfYrwzvN/PTyqYBugH0pipKu9sYb45kC7EK1cBK6/Z
   A==;
X-CSE-ConnectionGUID: VfOh7Ol4RXaaWSwFyxwveA==
X-CSE-MsgGUID: /+aM8MqcQBCSvwhC3hOj7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80255222"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="80255222"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 19:39:14 -0800
X-CSE-ConnectionGUID: AMWVxcsaQJedG5zVlkaKqw==
X-CSE-MsgGUID: bi/qJ6TpRxSm3Ca7WrIfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202189303"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jan 2026 19:39:13 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbsTv-000000000bB-1qFq;
	Sat, 03 Jan 2026 03:39:11 +0000
Date: Sat, 03 Jan 2026 04:38:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:work.move_mount_pivot_root 2/2]
 move_mount_test.c:6:10: fatal error: errno.h: No such file or directory
Message-ID: <202601030409.uRaVDGMh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.move_mount_pivot_root
head:   b101f2d24564588a93423d0109bde3d920311e88
commit: b101f2d24564588a93423d0109bde3d920311e88 [2/2] selftests/filesystems: add MOVE_MOUNT_PIVOT_ROOT tests
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260103/202601030409.uRaVDGMh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030409.uRaVDGMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601030409.uRaVDGMh-lkp@intel.com/

Note: the brauner-github/work.move_mount_pivot_root HEAD b101f2d24564588a93423d0109bde3d920311e88 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> move_mount_test.c:6:10: fatal error: errno.h: No such file or directory
       6 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
   ../utils.c:5:10: fatal error: fcntl.h: No such file or directory
       5 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
