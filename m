Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950D51E5B62
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184861; cv=none; b=cK+DaRDfH5cmlHhOiCborQVV2sgaxZdQoajx4/Isx6JEMA7oKhhfvE9KDJcc1yZ5IEEjethcCjI15HJiH7wE0dICGc+CoUbl6brUEcVROhpLJ2fPss8ReAfxvYk1N7vD4j0aG3Mxp6M7Ia5mjYYNHU5tYsTS/Zxt8NjnbmnNbwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184861; c=relaxed/simple;
	bh=9seFRvXIRecORxDXD4SFFDs4t50sJbgmqNC9QAJuRok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urL6KfG7h3RS5qMk7o67QMHwC0XjfGGCj5HnFTiFL8k6KphoBEoBdbwTfW9o+PgmBUmxvDNOh/ByMVfVzxqjVM7OyZDVgLZH1bFthkzwkGZyCDa8Q8HAXQsu1gxE7ZwLnhrvyJMUlzOeuONvoFk4xAKi5FI8rtWkbKGzxXieHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+VZfc2D; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+VZfc2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746184859; x=1777720859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9seFRvXIRecORxDXD4SFFDs4t50sJbgmqNC9QAJuRok=;
  b=B+VZfc2DJeNz2HqYWHHxPfupqrXKoLI4pbbcszCUvh/VjkSbuxAW61sh
   VEd3dgMGLTvKuhAGudpLN+/c6MVu3P0+bKn1UsAuHV2RxMNy8eXpl267N
   54uzbQbKDhoDpIgjfoLfOfxPdl32bcDAhukwmu8DlnEogXIB4PPBCwc9g
   Qn23HAWqJ+j9udPW8wev0pnGivRVwq3gTfK2cviXKnfal8kcY1CzFrTQn
   LKKNp6OcFr300kDEf1iB0RG9v6NT+hOg/wRUbuUCY3Rgx2ZYolv04+VNt
   mTzWtYXNlC58BeHV3looCTQCYhe8oao/MGoePa0dg8A1k9GKyINiwIQlW
   g==;
X-CSE-ConnectionGUID: XQ6N+WW7S2umBKSoM2lkFg==
X-CSE-MsgGUID: Mhh9IOgfTqSSSUPGFoxE4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51676893"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="51676893"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 04:20:59 -0700
X-CSE-ConnectionGUID: dAjz2fkbQWyG82wSE6cEjQ==
X-CSE-MsgGUID: XL1ltjsuQ6uiTkMMF7ixbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139427314"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 May 2025 04:20:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAoRs-0004hV-0c;
	Fri, 02 May 2025 11:20:56 +0000
Date: Fri, 2 May 2025 19:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v3 8/8] lib/Kconfig.debug: introduce
 CONFIG_NO_AUTO_INLINE
Message-ID: <202505021916.FrmMx0sS-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250429-noautoinline-v3-8-4c49f28ea5b5@uniontech.com>
References: <20250429-noautoinline-v3-8-4c49f28ea5b5@uniontech.com>
TO: Chen Linxuan via B4 Relay <devnull+chenlinxuan.uniontech.com@kernel.org>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ca91b9500108d4cf083a635c2e11c884d5dd20ea]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Linxuan-via-B4-Relay/nvme-add-__always_inline-for-nvme_pci_npages_prp/20250429-120709
base:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
patch link:    https://lore.kernel.org/r/20250429-noautoinline-v3-8-4c49f28ea5b5%40uniontech.com
patch subject: [PATCH RFC v3 8/8] lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250502/202505021916.FrmMx0sS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021916.FrmMx0sS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505021916.FrmMx0sS-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: zap_early_initrd_mapping+0x4 (section: .text) -> initrd_pl2p_start (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: zap_early_initrd_mapping+0xa (section: .text) -> initrd_pl2p_end (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0xb (section: .text) -> memblock_end_of_DRAM (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0x3e (section: .text) -> arch_zone_lowest_possible_pfn (section: .init.data)
>> ERROR: modpost: "__udivdi3" [drivers/usb/dwc3/dwc3-octeon.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
