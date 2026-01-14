Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB3331281B
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 02:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768358225; cv=none; b=OC0KXXNDVS822Xg1wbzi/MGk4hzgL0Nzsgjsl7ZKRwfW07O/ueKQyVmVHQb7IShVm3rm7FRHiWJrBGXuVlJnBGc6DnBuA5TbcIhm57+hs8kJZNKRsJ75pZCybEKyHjoOp0O14JOld2j8tyJr67MeDF2taw019It45caS603AQEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768358225; c=relaxed/simple;
	bh=5SOhjhcdymodmCeGHDmqnSF85YkCEbneSUEOO/MtiLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lE6EKESry++0bz2aWdB4bUfsHpwkAxwchbocc/j7HxyglJnX4FU+7FfsZeg9IFiA5mWFf2+CZy4pjLXJE8kL5s3C6wUbFChdNuFRd2y67pjxakd/zs2PeS8i1glv7zDPwGEiL70tzTre74Hu9vmtnMZFFjCJ9H1nUp6Nspd1U7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVzTLtJL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVzTLtJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768358225; x=1799894225;
  h=date:from:to:cc:subject:message-id;
  bh=5SOhjhcdymodmCeGHDmqnSF85YkCEbneSUEOO/MtiLw=;
  b=MVzTLtJLENPYUFQc4hY3kKm/7OmTxE78Z3UE7AjaiAKpPLgsSbqJ0Yza
   UWaZOwK/2N0RBtmyB1Ar6a3wOFcJuqOOxLo2Y4L/mYp2Lr+H/xhf6mwdO
   AIKVDa/gWJB93VObCIWMwtZN1cSXPzyVLiacMu1yzopNvvIbdSo3pcRii
   GHyltNeVlld1UXVZnG6hF8yshNHJDkfrgv26VnhcA9hMRQ9QOHN7yIwVN
   I5wvQBcKWUlV31IFAYX6YAdn+G+uMx2s59qTul/PazP90fthEYLHSRCGF
   aSJOXXz2PDo0SEgXI/GVqUqBbkWYepRCC5Jo51ZOm719TTftu9tE7A+mI
   Q==;
X-CSE-ConnectionGUID: bxbrE7NsQzqtdlIXgZj2oA==
X-CSE-MsgGUID: jp7T8Z0UR0ataoheDsouDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69815932"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69815932"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:37:04 -0800
X-CSE-ConnectionGUID: mZnPcowfRlyxTpj+kEY6sA==
X-CSE-MsgGUID: I/6tOicMTSGKj1wivTUeCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204187678"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 18:37:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfqkm-00000000FgM-48KQ;
	Wed, 14 Jan 2026 02:37:00 +0000
Date: Wed, 14 Jan 2026 10:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2278/5774]
 drivers/pci/controller/pci-tegra.c:2726:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601141056.taAB4JSC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pci/controller/pci-tegra.c:2726:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Aaron Kling <webgeek1234@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f853ca2a798ead9d24d39cad99b0966815c582a
commit: aac5ba6acc79b37b01dfc9dd23eb457c89cf06f6 [2278/5774] PCI: tegra: Allow building as a module
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-r111-20260113 (https://download.01.org/0day-ci/archive/20260114/202601141056.taAB4JSC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141056.taAB4JSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601141056.taAB4JSC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pci-tegra.c:2726:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/pci-tegra.c:2726:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pci/controller/pci-tegra.c:2727:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/pci-tegra.c:2727:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pci/controller/pci-tegra.c:2728:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/pci-tegra.c:2728:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pci/controller/pci-tegra.c:2728:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/pci-tegra.c:2728:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +2726 drivers/pci/controller/pci-tegra.c

da76ba50963b81 drivers/pci/host/pci-tegra.c       Manikanta Maddireddy 2018-02-28  2715  
d1523b52bff35e drivers/pci/host/pci-tegra.c       Thierry Reding       2013-08-09  2716  static struct platform_driver tegra_pcie_driver = {
d1523b52bff35e drivers/pci/host/pci-tegra.c       Thierry Reding       2013-08-09  2717  	.driver = {
d1523b52bff35e drivers/pci/host/pci-tegra.c       Thierry Reding       2013-08-09  2718  		.name = "tegra-pcie",
d1523b52bff35e drivers/pci/host/pci-tegra.c       Thierry Reding       2013-08-09  2719  		.of_match_table = tegra_pcie_of_match,
d1523b52bff35e drivers/pci/host/pci-tegra.c       Thierry Reding       2013-08-09  2720  		.suppress_bind_attrs = true,
da76ba50963b81 drivers/pci/host/pci-tegra.c       Manikanta Maddireddy 2018-02-28  2721  		.pm = &tegra_pcie_pm_ops,
d1523b52bff35e drivers/pci/host/pci-tegra.c       Thierry Reding       2013-08-09  2722  	},
d1523b52bff35e drivers/pci/host/pci-tegra.c       Thierry Reding       2013-08-09  2723  	.probe = tegra_pcie_probe,
d1523b52bff35e drivers/pci/host/pci-tegra.c       Thierry Reding       2013-08-09  2724  };
aac5ba6acc79b3 drivers/pci/controller/pci-tegra.c Aaron Kling          2025-07-31  2725  builtin_platform_driver(tegra_pcie_driver);
aac5ba6acc79b3 drivers/pci/controller/pci-tegra.c Aaron Kling          2025-07-31 @2726  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
