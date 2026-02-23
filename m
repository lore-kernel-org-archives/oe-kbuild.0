Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526593EBF22
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 03:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771817723; cv=none; b=eUXBmI4stXM+1gAPSAs01FFkmhBEBECbzdRWNFg6M+H2toeHBERkJSTyadm9s5m+grwvUgxptrXVqFHsYmRf5jEwCU1Plds94crV+GgNri/jT+Ho8ulQp9IzJQ1ejCFZ79tFT8WhrIU1idylQ2NzIwc9drmcrA6qQZHfZ67fUHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771817723; c=relaxed/simple;
	bh=arySzhn8pd2TcMUKYo7pWaxzA7nWqjHR6ADDxYX+3kY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jH0TS3pZeYAbMHgGkDXzreCYCcHMoa0UXYbXAVoQQIqkF8ct0BMBjo32MYT7WL5ZqJKfRdLD06Nf5l2NtMFhTTmkeEYTVsjByL06tuFL7wz6p77dwSI2b5xAljBMZmDFgf1u8Rt1UUiQaJ6IUtjQ3QXh0t+NUNdxoWj5vH8KvJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaQsjgMX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaQsjgMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771817721; x=1803353721;
  h=date:from:to:cc:subject:message-id;
  bh=arySzhn8pd2TcMUKYo7pWaxzA7nWqjHR6ADDxYX+3kY=;
  b=YaQsjgMXiE+fWgqf2zxgXtyTfQOm4VM+BVMX1RoK5KapFhMZoLWryS1e
   NvzbaZRgzXB97GQMNgV/koYxZLFp794WnWCBkd11jIaynxzIMbpNNmO4v
   wVchY13vjN2pN+c+2u0ZRq/BVuj4vIkzvgyABTe3KjhqqoRdwHh454yVe
   bM4G0oT8HA/hHcQXLT/S5sJOA/6xjjicXqaSz60wiAaGhSg6zJP1jY1PN
   pDVfZuNQvgxQbPydnxiaR/ywQKrTlNl4XEHYWJJ7l38o86YllQxJridm2
   FLXm56KTiVTnDITFTMGZb8chN8tLVLzmevWv5kWUS38MumZvAlilDxwTm
   g==;
X-CSE-ConnectionGUID: vgsrg/uZSVmqHOJ+Y7jvaQ==
X-CSE-MsgGUID: 5R3yCKYiS4yZUtBPzxhXvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72514558"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="72514558"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 19:35:21 -0800
X-CSE-ConnectionGUID: U0Dq+PyFRPmOfMcNJWIJ4Q==
X-CSE-MsgGUID: olHfJswfTQWA5a6/q8Q6Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="215437565"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Feb 2026 19:35:19 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuMj7-000000004mv-1fWT;
	Mon, 23 Feb 2026 03:35:17 +0000
Date: Mon, 23 Feb 2026 04:34:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 1/1] aarch64/vgic_init.c:9:10:
 fatal error: linux/bitfield.h: No such file or directory
Message-ID: <202602230402.0EQa2bUx-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   34c1a8e172009d17c9531c569a4c72ef86a06d86
commit: ce4e200f37db517831723e352e75df6156abf757 [1/1] KVM: selftests: Add test for uaccesses to non-existent vgic-v2 CPUIF
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 8 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260223/202602230402.0EQa2bUx-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230402.0EQa2bUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602230402.0EQa2bUx-lkp@intel.com/

Note: the android-common/android14-6.1 HEAD 34c1a8e172009d17c9531c569a4c72ef86a06d86 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> aarch64/vgic_init.c:9:10: fatal error: linux/bitfield.h: No such file or directory
       9 | #include <linux/bitfield.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
