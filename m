Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C540DFAF
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 06:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773555994; cv=none; b=ffmCGk1h2Vzscwox5y5gvhU07auCX3KmXB8tZ8+8pvwg3mlp4dBnTm+FpDnevpfTG36gCZeHo8wksM+P3Qh3I2Oyyc893KGzyVc9MMOq2B7JJuvhjZj4ZISpvEDMGJD9LRHmrMgkywynncvZKGWL8NBxpacP0EsIwuBgkHt/yr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773555994; c=relaxed/simple;
	bh=8bVCu86fF3nwSjPXXyCH33LzlNr9VZSj6LbRoQh7OkM=;
	h=Date:From:To:Subject:Message-ID; b=hEKFraSub5z/JtkUltukFgtpa9l3Fu4nzkv4gkPQkXX1DQfVjypinBAKHkbgnMI/cY5wbLhZUweqhTGTS0NyXztW1c3R+jwUkWYKhGFAysL/P17+iaYzR6crnYVVDejcKujaDDmh4jrhxDyknHjUVqNTR/Zml+SZD/tGnp21rk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpVd8oQK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpVd8oQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773555993; x=1805091993;
  h=date:from:to:subject:message-id;
  bh=8bVCu86fF3nwSjPXXyCH33LzlNr9VZSj6LbRoQh7OkM=;
  b=QpVd8oQKvflkjb1FP+DHdARiu6wPsSE+Hw47/Rc0yNnX9GQExvHGpnei
   iLDQtLaEKGFvQMHEEQAB+kAFSypFq6Rf0fyATSq6IxLSFI5cHzSSeSYlu
   h4NCO8zQ7T0PKg96wcE/CaWKpUo0mpUe60Xl62x4tIoMDKRrDdRDm0eRC
   VBIHUPZ/66RbRGp1OJ/ZpuUhDbVZOHdFwctxJPjGErjUDVXTNRBbtSSrY
   S0Xj8/1garPF8Rk81tnggkZrz7N1vhDdTglLPKZYRejnvm3HyhnjCIRPc
   GFr1+uHw52S9IhlaATQkJr9neGk4a0qUSF5FA8T/VEdbSlzAAUXWZ4IaR
   A==;
X-CSE-ConnectionGUID: R5FZSSy9RXmB4E57okktxw==
X-CSE-MsgGUID: ipmEQbswRf6sX6ISUEi/Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74641388"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74641388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 23:26:32 -0700
X-CSE-ConnectionGUID: yfH+CrdkTB6HZTUoJ/M0Lw==
X-CSE-MsgGUID: MahZZAaGS3OwRYWua/jtPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="246592457"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2026 23:26:31 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1evl-000000003z7-0Aex
	for oe-kbuild@lists.linux.dev;
	Sun, 15 Mar 2026 06:26:29 +0000
Date: Sun, 15 Mar 2026 07:25:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [netfilter-nf-next:main 64/68] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'device'
Message-ID: <202603150745.xsmdqsXh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git main
head:   4686679a14d269d4f02533228e82de56f432bae5
commit: 1850e76b38049548ecb03c62bb10d40b94eecaac [64/68] devlink: introduce shared devlink instance for PFs on same chip
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260315/202603150745.xsmdqsXh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'device'
#14: 
devlink instance is not backed by any device device, as there is

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
