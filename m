Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2623A7F4B
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781649770; cv=none; b=BuEppZIfuq+8X6MS8R4UUP9bdaYPUJH/fx3iogsVZKYYkFQ5Vt9/vS5zi3Vc/05+4n7C4Fa+HO1pMUWysyErIr1hIKREbfk5gwaePQ2J1ibehFax1Bwpc118LmtEOrxcK5K76KSEdGwEZ0mO2F+hBV9ggNBtpTQ/ub7AnIUtLes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781649770; c=relaxed/simple;
	bh=q7C+lXU6VkcqJkD+ZdstDmWVJZvc1LKH09gRzLqN1RM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NuIrITtrXDnnxsxXteOOwt5ouNoGiYU/WukdPAArPJgoRTEK2qKTOEu4nzLEcMfc15qaP9XNhsXVRG6k07PTgzT/ZqWuxUo+3bfVmPoNvtxQ0Q0VzpdCJJgKD4Q1kUFjwjxMlOYjVZXYWDKaf0nyEVfdzUK6Exo+sFzPmZoAvVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFxy2b4S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFxy2b4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781649768; x=1813185768;
  h=date:from:to:cc:subject:message-id;
  bh=q7C+lXU6VkcqJkD+ZdstDmWVJZvc1LKH09gRzLqN1RM=;
  b=jFxy2b4SRH9Xid2466RIeLdwj1YQPe1k/5EEV2i3zWOWWcrOnl9x7D90
   zsHffk2z5F/nmdRqJ71w1LOHGw4wmTUVAIcebhTOl7iZfiF0OTW03BmXe
   WrMpJyIrz2VmsHXQ1meQvVxqfPlg0q0PK1XshuaVgd/CnQdk1iM5C0Z5q
   0tIFdyQwxwR6CeAvKZpFdBQXdyANvJrR/mYVEQZP7HZtbe6PdyJQvab7j
   r17ca7FCYjySZrLaeP5/YfXgQpKrGUYyd5QwmFwOS6rfmSBNw05jkdK1s
   8Yyt+28CO4LT7y8sw4ptsndEK+1PPUtraRAYyuJraqW9QCqYMzfFMJ6Fe
   A==;
X-CSE-ConnectionGUID: wBtpk/svQTWdxCR09qk2uw==
X-CSE-MsgGUID: 5q7kjlUDQC65koIzK0L6Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="81566259"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="81566259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 15:42:48 -0700
X-CSE-ConnectionGUID: lj8Pci5eSG+OPeGfiFMh9A==
X-CSE-MsgGUID: 2jynadSnT2qpfDq9d8nhhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="253010521"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jun 2026 15:42:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZcUX-00000000TpG-09gX;
	Tue, 16 Jun 2026 22:42:45 +0000
Date: Wed, 17 Jun 2026 06:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning:
 arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202606170647.G5MZS0OD-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b5a2b7d9bc156e505f09e698d85d6a1547c1206
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   5 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-r061-20260616 (https://download.01.org/0day-ci/archive/20260617/202606170647.G5MZS0OD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170647.G5MZS0OD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 292eca316321 ("docs: kdoc: fix logic to handle unissued warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606170647.G5MZS0OD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get a pointer to the per-core table of reset vector pointers

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
