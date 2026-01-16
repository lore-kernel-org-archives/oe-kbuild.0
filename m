Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0539E6E3
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594401; cv=none; b=Be6qhzijQ4mQA/jvBzgvQsxAmfQxNWui1tnT0foBZmu9yxg8aW2F26/R3K2a+STEdh6OLcYR8Xy58bedE8FHeblfZ5UwmjKTQKNbv0Fxhc/ZbI3e4amdYcVxqw64c5ox418oOrT+elerdxMr65vsWp9BUrCSkv/ALwigbQTqtH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594401; c=relaxed/simple;
	bh=9HJQlZCpIaMU6h/KKe+KJCZq9vmzVX6Sy4DVB+LsM2Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p5e33FwU8cTWtOw4nZONBj1vO5wJx6kKmmhjWznYUT8E2q7EbmSECF3pn3sJ4J74Vj3YoiGODko3zpGB6kyuR4o9i0R5UilMYz3HbTyBamjrwLhjJWKmO0pWIOQWpF9yM7uLooVYRCdfJ0UCIr+udTsdyXrtbDDKUs0HcrCm5O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Msde4FzM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Msde4FzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768594399; x=1800130399;
  h=date:from:to:cc:subject:message-id;
  bh=9HJQlZCpIaMU6h/KKe+KJCZq9vmzVX6Sy4DVB+LsM2Q=;
  b=Msde4FzMBC0Rl/MJKwkWN7MtlOveV+PAgQIVMwkrevU4//aFj2lu6oia
   GztHMvsQwhO3FwHqm4SkVzxAadby6jbgiiI2x8Rkl7qhT7uAgx1Z04S9X
   eAhIHWetYk4d904z6WpSkp7sFnoeOmBjACL2QKH/ENck3g/qBzKgkTNmN
   yNvnLDiQ6Jvv3dmW/+bMRRYAR8LFknblCpVhKlaUsDlNOXkBhG0SlPVa3
   W5Uw465vz0BoXnziEudeQd/7OmJ5yGlre+aSOOF9vS3z4Yk32LjQDeLeM
   crlocX3SYnbMJxuDgeeewG6vcl8LWzWYlYy1uh5/Xj0QDWqN1XbhbCoXF
   Q==;
X-CSE-ConnectionGUID: NFrWxSp6RO6bhModtsHjJw==
X-CSE-MsgGUID: FwXPdmfzTWede+PCDx2etg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="72500119"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="72500119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:13:18 -0800
X-CSE-ConnectionGUID: TT+ocbS+TKSZWzrRpDz9Vg==
X-CSE-MsgGUID: 82IzLSJ/QUKywoSlnGCEqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205601093"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jan 2026 12:13:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgqC3-00000000LD2-2pPf;
	Fri, 16 Jan 2026 20:13:15 +0000
Date: Sat, 17 Jan 2026 04:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1816/6849]
 drivers/interconnect/mediatek/mt8196.c:381:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601170454.79FKn8EO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/interconnect/mediatek/mt8196.c:381:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Georgi Djakov <djakov@kernel.org>
CC: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: ce69a970390ce182ccece5dea61083588ca5379a [1816/6849] interconnect: mediatek: Add support for MediaTek MT8196 EMI ICC
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r113-20260115 (https://download.01.org/0day-ci/archive/20260117/202601170454.79FKn8EO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170454.79FKn8EO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601170454.79FKn8EO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/interconnect/mediatek/mt8196.c:381:1: sparse: sparse: bad integer constant expression
   drivers/interconnect/mediatek/mt8196.c:381:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/interconnect/mediatek/mt8196.c:382:1: sparse: sparse: bad integer constant expression
   drivers/interconnect/mediatek/mt8196.c:382:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/interconnect/mediatek/mt8196.c:383:1: sparse: sparse: bad integer constant expression
   drivers/interconnect/mediatek/mt8196.c:383:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/interconnect/mediatek/mt8196.c:383:1: sparse: sparse: bad integer constant expression
   drivers/interconnect/mediatek/mt8196.c:383:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +381 drivers/interconnect/mediatek/mt8196.c

ce69a970390ce1 AngeloGioacchino Del Regno 2025-11-24  380  
ce69a970390ce1 AngeloGioacchino Del Regno 2025-11-24 @381  MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
