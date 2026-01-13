Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA030B518
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293161; cv=none; b=A7eKd8nfnNAJuFo/zleZQJAgQueMwaaCbusCY3TAKs+6JwlwELDrwqzBUQ+vgstDqazVN7kbhzOjccp3GllRbOHPvOx0D4E6PwHSLqpoqg90+K27gOZjwrYQYjPsrS5RV6PfXFGwXCynN+xmt90Rh9EpXQNzSFeBx5JAYKZrM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293161; c=relaxed/simple;
	bh=Jp1FLLB0w0E3GZth8L6rz6a1zQfFKseqeeQIqhmc2qY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cbw517D8CVCWCjJFWjuS30MSBm6n3p7KD++y7x3gAy0uggDipGVAd4+d77JQKg7jd2H73QXw8+T2BhHLcQLpu/jeT5wjOca2z2ZkeFDZSvEyRbob+cL46pxVCpwY3xvxZ9t9GWtTUqdnx6kQ/m5Za5w9d3lBSrw5zAlxlaa/jqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsh7Cxo+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsh7Cxo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768293160; x=1799829160;
  h=date:from:to:cc:subject:message-id;
  bh=Jp1FLLB0w0E3GZth8L6rz6a1zQfFKseqeeQIqhmc2qY=;
  b=hsh7Cxo+cSl61ku430tWsYi4WW7GguyiFYK5aniQqOQPlkNBzfvu3fvG
   x5S651FyuX4iWkBd9NBQa8za9tETGiAIaH5AI8ohjabCNkG8AGwbuO5U/
   yK77uYBlzF9qjfTLnDWHlByeAHBPfcR3C4ea1sBud2BHU/Wao1xjrA79d
   Jc95LzG4gWty1twIAKfIE16BH+g4IL8EtKlsd0VOvb8b22aMqFJECALd/
   zL4UI1SGW5hRXKfQsg3Wjrr4NjoujwNVIHETohsz3Y7YRV1dyK7Fji24l
   ++gwJ1PY0aB4QCZMyyLtjl1WP+ciGJRfOjNvrSgl9ZI40yisBKPo7RN07
   w==;
X-CSE-ConnectionGUID: kREkZwocR/i/Ky+C99F/sA==
X-CSE-MsgGUID: nHLFJdSqTKeKlyunNQVAXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80218242"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80218242"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:32:39 -0800
X-CSE-ConnectionGUID: RuCAEXajSMq7CGLEzsPikA==
X-CSE-MsgGUID: gIlQaanoQ7SeloD5agf8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208482077"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 00:32:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfZpL-00000000ESq-2hTx;
	Tue, 13 Jan 2026 08:32:35 +0000
Date: Tue, 13 Jan 2026 16:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tnguy-next-queue:dev-queue 28/75]
 drivers/net/ethernet/intel/libie/pci.c:186:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601131604.x19ugmj8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/intel/libie/pci.c:186:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Madhu Chittim <madhu.chittim@intel.com>
CC: Sridhar Samudrala <sridhar.samudrala@intel.com>
CC: Larysa Zaremba <larysa.zaremba@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   21673fafaf5db592a6529abe2c8cfb4a05d60dcc
commit: 14d4d31c881a410a5005e8db16a7a72671c207e7 [28/75] idpf: refactor idpf to use libie_pci APIs
:::::: branch date: 7 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131604.x19ugmj8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131604.x19ugmj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601131604.x19ugmj8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/libie/pci.c:186:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/libie/pci.c:186:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/libie/pci.c:187:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/libie/pci.c:187:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/libie/pci.c:187:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/libie/pci.c:187:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/net/ethernet/intel/libie/controlq.c:1195:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/libie/controlq.c:1195:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/libie/controlq.c:1196:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/libie/controlq.c:1196:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/libie/controlq.c:1197:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/libie/controlq.c:1197:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/libie/controlq.c:1197:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/libie/controlq.c:1197:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +186 drivers/net/ethernet/intel/libie/pci.c

008bfa38938fea Phani R Burra 2025-11-17  185  
008bfa38938fea Phani R Burra 2025-11-17 @186  MODULE_DESCRIPTION("Common Ethernet PCI library");

:::::: The code at line 186 was first introduced by commit
:::::: 008bfa38938fea35d8290f0a203ce7836e368959 libie: add PCI device initialization helpers to libie

:::::: TO: Phani R Burra <phani.r.burra@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
