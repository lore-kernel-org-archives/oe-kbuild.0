Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A52248F73
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437125; cv=none; b=B0m1A0YXpgrEj+62whwEyZhThHT10X788H+1Z/DqwbSJWI91zf+wAZulJ0+UkK+oLwIiIdroTK3JC5yUNptq0dUrxbs3yMaRjcBftxwT+7c9akWhupoCJSj54RsaFvHuNZQ8IOSPcr66HCoQV1MepGaDmt6X/T6YpiEMgjz7SnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437125; c=relaxed/simple;
	bh=ybULKDgPf8bG+2uwfe13xaqtTMRv1jn3zke+aC5k8pY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fBm9ygUy4DptLUrKQzHQy7Eokrfgp5cA2keITc36G1cGii95oOnjA4nrc9OWEL5WwIm8p5I1S1eBFh/N7M3jBb8leSMLYGtmd2nDMBwH0dg+ReI2o1HojDDhrxKH5CcaOtN77pE9Cfjp2X6bGzqA4PiSwVphMZUj0CmGmqM4wsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awks4jfu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awks4jfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771437124; x=1802973124;
  h=date:from:to:cc:subject:message-id;
  bh=ybULKDgPf8bG+2uwfe13xaqtTMRv1jn3zke+aC5k8pY=;
  b=awks4jfuzqLuksPeM8j1yxqQyaVPm2s0XD7o+GrosQjQQcpSmmh41Mj7
   8DGEon06URJgj7v1Y3qB/XFREL2QSbPoG/rglm9gRFyUgkR97xxNp2yVq
   +J2o3PZbH8YC52bDzBZDlNrqgXmGDyNBAzYmTf8/ESCkLw5zjv8xSqWlA
   vRFse6pvXB/FssktCyOfsd/uDzVJD1He7KGmUdGIzlP4wFojJlSk3knEY
   tyA5wOCk2kuuRfXgaEDIfHp06qS8hWl9wCsMJWpio7yXoIjf078XDMKgR
   kDkN7CZ7pLHBEHK1LQd9o+aLfetXdZwNw+VdzTbl5jvMbbDAsuwc4ca5u
   w==;
X-CSE-ConnectionGUID: fK8cOoEhRqe7WnRh0exS5g==
X-CSE-MsgGUID: vUYNZw3JQ1+Tcg2Q5Hufyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83969873"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="83969873"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 09:52:04 -0800
X-CSE-ConnectionGUID: TW4DiB0GR8KDDoZ7JJcCRg==
X-CSE-MsgGUID: xpZ4h/dIS0qpKhn/vMql3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="212589223"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2026 09:52:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsliS-000000012bA-1lV9;
	Wed, 18 Feb 2026 17:52:00 +0000
Date: Thu, 19 Feb 2026 01:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/qla2xxx/qla2xxx.o: error: SIGSEGV: objtool
 stack overflow!
Message-ID: <202602190157.wCkynYX3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2961f841b025fb234860bac26dfb7fa7cb0fb122
commit: 799647ddb4c0ce1d7084fcf5b524e9a0c7728325 objtool: Add more robust signal error handling, detect and warn about stack overflows
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: x86_64-buildonly-randconfig-006-20260218 (https://download.01.org/0day-ci/archive/20260219/202602190157.wCkynYX3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190157.wCkynYX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602190157.wCkynYX3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla2xxx.o: error: SIGSEGV: objtool stack overflow!
   /bin/bash: line 1: 1818526 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --ibt --mcount --mnop --retpoline --rethunk --sls --static-call --uaccess --link --module drivers/scsi/qla2xxx/qla2xxx.o

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
