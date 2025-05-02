Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB393234
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 00:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746146661; cv=none; b=fvBhnMLTTomIQl2GMpwe0heDXPUJ11HmWmPXQirAyOHcaQJEybOLxU1RRtH3AunSDuAnykUcOWXRow4gZA27xTzFVS6EOuVG9Plf+bDNWcQnE07PlnXvscCJkncnk1jCLwLZfRT13lUnj7/Bm7nTqNA4wMNQvDiMBEt9rAmiixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746146661; c=relaxed/simple;
	bh=8h1DMivy16GTAF5zCz/sqobuRxmsqKf+Oohox8TwBBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=scnJfAOI78fUMoqhvX8tM+6duKUWXjjnY+i41QJjH8b5HyQbbS8d0gAdbzydt/+rIZTFI1owo80IhBSK2Pg/k2H/QXYE5eVXtGoX8qyl1FhAZT/igz5bwPo8CBzJCpiRxvXAMMucivA4KxKAMYDJ93dfoanWPGkjNlKn1sQUydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGvOudjo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGvOudjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746146660; x=1777682660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8h1DMivy16GTAF5zCz/sqobuRxmsqKf+Oohox8TwBBM=;
  b=LGvOudjoopbokZee5UjWDfl8fVp4WUfVp3ysjDyEK73ra/b7gSh5EssO
   Iu05aVbYuF6lXNc0ACQShyj5RdJs7ay13VyioVtvlb7CpU5z4EFvLqJrq
   CaUxzo/GlfbCKgzh+bZz9gaD6SQeftEx+FvOH57j/Fcq9HD9siPQ0pXm+
   3++BlxZsp703pWl12Ft5XkGR7uPFbffpRjTACxtVK594QL7yMU5HO96hs
   2zsysHd25rv1OEv7d1ckzG5WgtKP0N/w7ThDIgcX0kAcH8h27r9TNuppC
   nhen9+fTPDz6BYp25blmU+XREWJHqLVqfIU/mkA8s6pyQ4DAwh0/wyjx+
   A==;
X-CSE-ConnectionGUID: jq/5RDDGR22C4ZZ596VneQ==
X-CSE-MsgGUID: tFOHAR7VQ3GGu1o/g+CJiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47718185"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47718185"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 17:44:19 -0700
X-CSE-ConnectionGUID: XhrBkxSIQrWk3ftukyI1AA==
X-CSE-MsgGUID: /RjW/y/gQLunhZd8Yc+stA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="165444397"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 May 2025 17:44:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAeVi-0004TZ-2t;
	Fri, 02 May 2025 00:44:14 +0000
Date: Fri, 2 May 2025 08:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v3 8/8] lib/Kconfig.debug: introduce
 CONFIG_NO_AUTO_INLINE
Message-ID: <202505020833.Q2TEFWfx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250429-noautoinline-v3-8-4c49f28ea5b5@uniontech.com>
References: <20250429-noautoinline-v3-8-4c49f28ea5b5@uniontech.com>
TO: Chen Linxuan via B4 Relay <devnull+chenlinxuan.uniontech.com@kernel.org>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ca91b9500108d4cf083a635c2e11c884d5dd20ea]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Linxuan-via-B4-Relay/nvme-add-__always_inline-for-nvme_pci_npages_prp/20250429-120709
base:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
patch link:    https://lore.kernel.org/r/20250429-noautoinline-v3-8-4c49f28ea5b5%40uniontech.com
patch subject: [PATCH RFC v3 8/8] lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250502/202505020833.Q2TEFWfx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020833.Q2TEFWfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505020833.Q2TEFWfx-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0x0 (section: .text) -> memblock_end_of_DRAM (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0x4 (section: .text) -> memblock_end_of_DRAM (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
