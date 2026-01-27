Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201A3016F5
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528437; cv=none; b=IYDMionyCFIYfnt0d9NSOh564Twq6zbDIijWAkBoWk5LnnOjv4FGQmDVRIFIGqBKlvoC8SQmXVfrRxAIi/IqaTtDMp4fRtY9NCYW+VENahE6bJF/ynD7CPSqexzeA14ERQBcT+dYjlibohtG9h4SdEBzRjFfwu5uZbT9mf8x0bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528437; c=relaxed/simple;
	bh=n86Y7mWSwZwoS6mIDBaDZHaTtcM0SNEWOW4v7aMB2Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IeL3HEso6+Ct5oxhey/J5JTLCwJLkrHSjVmL3DdMmipgRkV4j1jx/KfQdbqzaAJCHkzbFN1Bj+iFlGNrdkIj4cg+dyQb/8FJ3PtYVE0XDNI2h/OH0TQpBNFeJU+BDcDAdoMwKabRGbIo+vFvwQD7OtTl1I4DaglYyXeOXpzpwZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KU621MiW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KU621MiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769528436; x=1801064436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n86Y7mWSwZwoS6mIDBaDZHaTtcM0SNEWOW4v7aMB2Uo=;
  b=KU621MiWm/dvOlAWh4tYuQ5G0Fawd16LQhlaoS1nnn0w5hIvliljssOL
   nwJ0oWXeH1j5qRCDJMit3hA4nPMJEvcnQuJBfcheTpSXycKfSUjFU5I7/
   9g8DK+03E1it+blGykFvnBM1in22nHdayQZ0xfaA4WQTR+BeJDISkKyRK
   eM630y7PasT29T1SvKCID+CeFii5k/lyYKTEkkRLU9UwL9pkkJF3o0onH
   rO7WQMnDr3qeOZId/+AiNp3wWfTjm8lu68XsS6H27JnLe+BNzxRNUSgu7
   timu+jGykpWDUIX9ZdN0yvP15kTcTzLpNJo31tnQb+ePSysYie/EplWY5
   w==;
X-CSE-ConnectionGUID: gf+YKc2VRcqe19Fkx8JM9g==
X-CSE-MsgGUID: pE4W/IOpShWJGeoVXitXcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70816136"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70816136"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 07:40:35 -0800
X-CSE-ConnectionGUID: FOMHfW15Rt2CIpZNIHl+Fg==
X-CSE-MsgGUID: DxvKoPhYRd2OJxUVMvbz2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208058806"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 07:40:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vklB9-00000000YcI-3ww8;
	Tue, 27 Jan 2026 15:40:31 +0000
Date: Tue, 27 Jan 2026 23:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 5/5] memory: tegra: Add Tegra114 EMC driver
Message-ID: <202601272349.iaPF6emJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/memory/tegra/tegra114-emc.c:1461:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260126190755.78475-6-clamor95@gmail.com>
References: <20260126190755.78475-6-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Mikko Perttunen <mperttunen@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Sumit Gupta <sumitg@nvidia.com>
TO: Dmitry Osipenko <digetx@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-mem-ctrl/for-next]
[also build test WARNING on tegra/for-next robh/for-next linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-memory-Document-Tegra114-Memory-Controller/20260127-045059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20260126190755.78475-6-clamor95%40gmail.com
patch subject: [PATCH v1 5/5] memory: tegra: Add Tegra114 EMC driver
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arc-randconfig-r113-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272349.iaPF6emJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272349.iaPF6emJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601272349.iaPF6emJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/memory/tegra/tegra114-emc.c:1461:1: sparse: sparse: bad integer constant expression
   drivers/memory/tegra/tegra114-emc.c:1461:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/memory/tegra/tegra114-emc.c:1462:1: sparse: sparse: bad integer constant expression
   drivers/memory/tegra/tegra114-emc.c:1462:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/memory/tegra/tegra114-emc.c:1463:1: sparse: sparse: bad integer constant expression
   drivers/memory/tegra/tegra114-emc.c:1463:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1461 drivers/memory/tegra/tegra114-emc.c

07c940ca4b749d Svyatoslav Ryhel 2026-01-26  1460  
07c940ca4b749d Svyatoslav Ryhel 2026-01-26 @1461  MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
