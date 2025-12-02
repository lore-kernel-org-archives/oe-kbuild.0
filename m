Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332572AE70
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764686915; cv=none; b=bSmG5gwgWtb7Sir5YBBJ+tP0bmTMjRgMy5/b+HR5Cos8/Gj8FTBB1cGu8adDXG4vTKmav6NrfVDeJ7nmq/x7ZFrazDrHHGwZ0L8WMna0PgzXIw4DYtSLlV2kj+aNA5h6awH8sa6zuU1EcuO16W3stLOgZZJpZkH3OY7503Q1USo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764686915; c=relaxed/simple;
	bh=+2GtcM/xlgv2FCPKpGtZuqHyjroftIpz+uyl5cih1Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJpQBCOs4rIcnJd4I7rdDn8hiZWZj8JTVnYRmkw/B0YOS5jdfHvW6A+Mhgd5cMwbE737Nhd67xnM8GKEMj/O3yHOWS+RBxPTrjlJoZrPfzEJqia+GIpTkV6YVFNwWez3tC5wycs7ivssyHzmuCT2zb5sP8M4GfBtViJ7MkQDY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFW38fSc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFW38fSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764686913; x=1796222913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2GtcM/xlgv2FCPKpGtZuqHyjroftIpz+uyl5cih1Z4=;
  b=dFW38fScr8lcDWSfRgiyXulXLEqtSylMqIvKsCKL5hahi1VeW07psMQi
   EP4v/SLyDHkyyxnIpZx+szzEzdTvieiI8+O23+kikaqG7y+8a+eVaTAEO
   X4REGzLGmigabQttoTAOrKwN853AY1EBwmfIn23OOJPapLHLCX5Wir0/2
   jZsGTfQZWm+Xzso3oUTNSfUisd1ADSpZ8Obz77vXAtFon+r5CnGbMm2O8
   ynFkNt9iPYA4ZO2SxYvXttt3fU2B2/GVLFlnMHKZl3037eBHw0f5vqdX7
   DCos+xzQ4MYLyl8KNljaikroNMCjqsZpbzx4t9Q6Ax0HtHt3t7X+jX2n9
   w==;
X-CSE-ConnectionGUID: XxaBCSbaTLSoA5V1JIn25w==
X-CSE-MsgGUID: tWy+9Uv+Tji/pPK2D4qdSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77758288"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="77758288"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 06:48:32 -0800
X-CSE-ConnectionGUID: q1BTs2yURbGtLV/kJZbalg==
X-CSE-MsgGUID: RGOziB9yT1qXU5yD0whxxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="198852038"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Dec 2025 06:48:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQRg5-000000009uD-2gZ2;
	Tue, 02 Dec 2025 14:48:29 +0000
Date: Tue, 2 Dec 2025 22:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11918/13055] ../../kselftest.h:53:10: fatal
 error: errno.h: No such file or directory
Message-ID: <202512022226.AMF2ullt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Deepak Gupta <debug@rivosinc.com>
CC: Paul Walmsley <pjw@kernel.org>
CC: Charlie Jenkins <charlie@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 0f226cf6026f3756022e387a869c031add683365 [11918/13055] kselftest/riscv: add kselftest for user mode cfi
:::::: branch date: 9 hours ago
:::::: commit date: 5 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512022226.AMF2ullt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022226.AMF2ullt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022226.AMF2ullt-lkp@intel.com/

Note: the linux-next/master HEAD 47b7b5e32bb7264b51b89186043e1ada4090b558 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from cfitests.c:3:
>> ../../kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
   In file included from shadowstack.c:3:
>> ../../kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
