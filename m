Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E613CA6B
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 17:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771005356; cv=none; b=IwFI2ssuP2949FeoYuWmZXYcuFaQC4V32fTDFDDtJkXHMpRN6XrvwngQ0uytVaTVniqLvMpLCAOftYHdcaxmw0JjdWFqNJa9ryB35q1Ay0gMme1CE4u+kSejkVpqamyrnx6hiYOfteY62xZ3afk/9izNk/3KfHxo5f/n4KB94xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771005356; c=relaxed/simple;
	bh=9Y1MdUYIUjCHZLMnNnr34e+5sARQXxkhZrGst1XdhX0=;
	h=Date:From:To:Subject:Message-ID; b=QT/0Iw+GKZTcI2l/MqJjIjLIwO1tcBDSxkHULuANQSl0ZpPD2GAvm4f43O+BvxmjIK+l4Erm6grftxRgWtBtOm2CfaNv0ZYengRo5Q00avLVLeinBENoZzCMoDXMWlM6dAxVEzhcnUB1yydGSL+PTFwAANLd1xpiHbE6qJJfj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMsI4VZ0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMsI4VZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771005355; x=1802541355;
  h=date:from:to:subject:message-id;
  bh=9Y1MdUYIUjCHZLMnNnr34e+5sARQXxkhZrGst1XdhX0=;
  b=jMsI4VZ0A53D/9eMAiesFQb4bmpVs9Lm/fyt+q0kpbNtZlBi01MHfXu6
   tfu3DTUaUE0sEBB0RbcLsLfdiYVlNKZARNvoewuCtgLx5umu2D6EHEpOI
   FheKJnZ2UWeI4wXaibqOSXYBKZhpldCkjqxhpCWUEeE7I0dBsZwE0PQsX
   IcQxbEENaQbJHJfqN/HycsxyUmVvCtmCfdkieUaLErZ0R/F4pkj+oRLF1
   mb4TYdeUa9nCjNedztcEzvmN0zg+mwo0Jr5HuwWzGY8SYDNKyQ+RiIHf2
   Y2QcDQMDWlmsjnlLMTIO5b7e57mkiUedFqlIrBnvDbApm6+HekKKcflxd
   Q==;
X-CSE-ConnectionGUID: DcZ8H060Qrqot7TUYacpQg==
X-CSE-MsgGUID: lr+09IEXReud7P4vCN8KlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71219239"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="71219239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:55:54 -0800
X-CSE-ConnectionGUID: UbeTnkIfRke5aB01sWeEXw==
X-CSE-MsgGUID: s7QONjNlQsGGnGreVYVrsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="217957364"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2026 09:55:52 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqxON-000000001dy-2wy8
	for oe-kbuild@lists.linux.dev;
	Fri, 13 Feb 2026 17:55:47 +0000
Date: Fri, 13 Feb 2026 18:55:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 8/19]
 checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202602131844.18cI8x6u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   661496e362d06c7579ec2f4001cebf7d520ef601
commit: c198b49e0f4504ec134315c751c1d24732ccd351 [8/19] mfis adaptions
:::::: branch date: 14 minutes ago
:::::: commit date: 16 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260213/202602131844.18cI8x6u-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#60: FILE: drivers/hwspinlock/rcar-mfis.c:94:
+static void * rcar_hwspinlock_init_priv(int local_id, void *init_data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
