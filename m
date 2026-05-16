Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8896B175A7D
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942627; cv=none; b=drZXkAqvW/aUMkISV2JlHmfQZ4t+Q3KhGqB4I/vplersvZD/10zFp6Zo5Hce1kBu8Wu531sxmrvDWZ1s80rnjDX3UXo7at5iY/YuFzHSArsop0smOng6XKfxnsAbX20FKwDzbSOG/mrzgIGxwe3HvpS6YSnDa/FWFA7YSvWvc9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942627; c=relaxed/simple;
	bh=Y94Jjx1c2nHwRN9DAWu4b/hsCPS8peKmOQnCyUQi7Vc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BxaS35lwOCDV5CgKS3crnjHD+lbinAbJofmWWFTN1zPKGe+fA8OPQErZupEn8EBtsodHiNfOwxZgcKdWkfMDYH+92/D76CYp7/RvCFJyh8Vqq+BWEvI90N2mc9KfTAnsIaZtDIBovHB2QTlOqVaF3vbNJINFDc4jEg/b+ol4vcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iatvQaHB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iatvQaHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778942625; x=1810478625;
  h=date:from:to:cc:subject:message-id;
  bh=Y94Jjx1c2nHwRN9DAWu4b/hsCPS8peKmOQnCyUQi7Vc=;
  b=iatvQaHBvBr/3KKMfUXNhKQ9jsVYqh1YjjZmRRLG8a+4fLuOXEhzkDax
   xtS1iL8Ef/+N9H52k4rEc+YjVFY3AfEb2RlWfDiBIpzOVEZ1i6OO+woY8
   zEPLBieyh96jVwqZTsVgIyF6CScmDVr7ZMZC14rbyENd5WhgO6Wtv6Mnq
   7rt2ISBJ4DlV0pCgGZePrcZFwg3VEqDsASBpyTFk7B25mXoZePPjDKAUI
   6OqVK2sbJ1XxMGj1TUXyo2GsmKTeYnkoLZDY49QPZwbAqLAkllR6Lt9dD
   AN8N8czIaPtO5t5CMru82rVBlwQ/9Ovto09EUAtQA182IUe1ANfOnBHzW
   Q==;
X-CSE-ConnectionGUID: wdl7RwG3R+e+KBr1A+Bitw==
X-CSE-MsgGUID: QLdqLTBCSM2t+bvVlEprBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="91259532"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="91259532"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 07:43:44 -0700
X-CSE-ConnectionGUID: FnjOUWFmQCCnSZjeG0AaMA==
X-CSE-MsgGUID: otc4kSnOT0SzTcFeM41Tng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="235939485"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2026 07:43:43 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOGEu-000000000tC-3XBv;
	Sat, 16 May 2026 14:43:40 +0000
Date: Sat, 16 May 2026 22:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.18 765/871]
 mtd_virt_concat.c:(.exit.text+0x0): multiple definition of `cleanup_module';
 drivers/mtd/mtdcore.o:mtdcore.c:(.exit.text+0x0): first defined here
Message-ID: <202605162231.dvgcqSjR-lkp@intel.com>
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
CC: git@amd.com
TO: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18
head:   8ad23fcb26beeb807a7f0f3341137ec98e93f390
commit: 57335cb7376d59e7c4946a731db22867c7809203 [765/871] mtd: fix modpost errors for mtd_virt_concat symbols
:::::: branch date: 9 days ago
:::::: commit date: 5 weeks ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605162231.dvgcqSjR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162231.dvgcqSjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605162231.dvgcqSjR-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/mtd/mtd_virt_concat.o: in function `mtd_virt_concat_exit':
>> mtd_virt_concat.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/mtd/mtdcore.o:mtdcore.c:(.exit.text+0x0): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
