Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD4B2DCBE0
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748085816; cv=none; b=ut4mQMpHz5v0m6jGQ1dWLzrVjjEEPLUN7LGR5c+G7JewAcz0/Sa0CNNPqu06ofKwh7ZEkZC7S0UQyO09Y5+I3hwt8u0OpETxcVR5SgKiVNTNLkTcxsAN8rWT/DsODc8VUAfY7h9YAGJw8WWtsLZI92k2ns6+ASLsrP6tunZtH1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748085816; c=relaxed/simple;
	bh=ryPoF0WjzW8fsfqZfSlP0qnTKnDXG2F78p3pcv0Kxcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZjcc7STycnYXkYWEld+xJzxZ2A/4+ap+VcbmoYPRPwkrYLqEr/7xYz7HOf8/myN59P2aKff6+rjE88wVmAjKMb+47FDQqw8KXK7FkqCXot6PXJvwa+LQybtMpZAuYcdXDk4JZfR2vV6XLdKNdLVuNoc6pZ5UynOMy8rXmcG+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGJ7NSOI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGJ7NSOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748085814; x=1779621814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ryPoF0WjzW8fsfqZfSlP0qnTKnDXG2F78p3pcv0Kxcc=;
  b=QGJ7NSOIsGGdyM0kUGnOJlts3XAgqZtbXGagnBLBL1vX7nD+HB/YNLBd
   n3dWq+T/AM5rnaDxjpJiNEQEvsP93b+NJBvT72uLjQKEIkygh10jYAHWn
   JeeXqGywMWT+whRQkqZnVhSZeCjzSC38T6+RFNZTpP7aOSr8ikrOq6CcR
   aio7wilHJwexH1i7XSfmNpeF0B8e0klLB+2jNYS3wMy26MZBs7iKVBr0Q
   vWDShJzJQEsOhd3QAe++s5PmE9p4LbRklPFpHw9y+INeT8LQKuiv8q5hu
   LC90G+YUETKxgr9Jz9Pp2IzzNWtVR+ZsmkoEV7OsAm7aMR+cg5d4uVA51
   w==;
X-CSE-ConnectionGUID: u2JaATpMRBiCroyrpCqyaw==
X-CSE-MsgGUID: FTRmmDTUQCGBz3RtQKdIlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50180181"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50180181"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 04:23:33 -0700
X-CSE-ConnectionGUID: 63w3YeniRwOwOgTYDV0htA==
X-CSE-MsgGUID: OI48p47+TPyTlZ0q2CJ17g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="172432728"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 24 May 2025 04:23:33 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uImyP-0001dW-23;
	Sat, 24 May 2025 11:23:29 +0000
Date: Sat, 24 May 2025 19:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 34/236]
 arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/backlight@20e200010: failed
 to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
Message-ID: <202505241918.75APPYwi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nick Chan <towinchenmi@gmail.com>
CC: Janne Grunau <j@jannau.net>
CC: Sven Peter <sven@svenpeter.dev>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   25a6e10c983dcd254c925e79298049dfb29c1d9f
commit: 5a1b9fc00666d48f51d9cf6d822b618d549a36ab [34/236] arm64: dts: apple: t7000: Add backlight nodes
:::::: branch date: 9 days ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-2051-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241918.75APPYwi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241918.75APPYwi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505241918.75APPYwi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,t7000-dwi-bl', 'apple,dwi-bl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
