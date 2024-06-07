Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF833EE
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Jun 2024 19:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717787080; cv=none; b=AxInXYlxCvYxGLDhR4eeKDvVVAPJM0V/EkWPzwYzC7692CQFvATcPFiWlOYkF8b8ldeWHAxxK5qAg8q9sxkdhs+BiWrbvu12urB4XVhHYk5NrWgDVlt/fAu5tCwAewZxS6fcb5eXRxOyxfDrvXQHMr+JrASuhBhwJghZueL8EaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717787080; c=relaxed/simple;
	bh=wtUD04w4TaW4uOt85B2Ab94Fmx2LtGotMx/oYmynvao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qs5n5/yS22UI2aP0mwbWOOWWUke57txgJvu96rzHDIpf3tZrEG0uL8i7a8aJjCp3RTm8Q9BUrV7L3UZzo3G6XnAy+ZUG+n26ssUbhGMbRbvM6KDUaJNHqZNnaQdlCQBAIcAnOwL1kZydZflyYgOxSfh4yrdGh7EQtlVDNrG0eyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJjFYrLB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJjFYrLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717787075; x=1749323075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtUD04w4TaW4uOt85B2Ab94Fmx2LtGotMx/oYmynvao=;
  b=QJjFYrLBaeYr0MXmd/JRYQJpS2ChrKF5k0hieHeuWMbTs9ycFeZYOS1/
   GVk0AaQW35vxmRITDvM3S3KvbaiT9ZhvVs3zQfvUUAgykkAJtRS2EnZnd
   +kA4nllEPnUojQDUkiF35TjguIWwSDY5lfnb26hOazA5BU9hEi5KeFOgy
   95IPKLCA/LKCCz2ztH19sXnLezrHVKIUA2EFJsLSjIwCstW0Wt32oSv+G
   BDEev9cNuYEzz6YAQ/Roa6vpIRSfBHURFvHPo4dSOSMv/Iovrxb4Vl2SF
   BxoLJFXfae6XEt77vPbWFa4zaKhKX/Gn/wKP4pFxTELiC8rJjfOytEW78
   g==;
X-CSE-ConnectionGUID: z74XntlxQKiZ2X4+S2YQfg==
X-CSE-MsgGUID: bVyIpHh/QPyGwHONaKROTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14679975"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14679975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 12:04:34 -0700
X-CSE-ConnectionGUID: bUTG4SHkT/ma0AVpj1X5cA==
X-CSE-MsgGUID: tLGw7qrHS7ifilcSZ/Y7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="69191174"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jun 2024 12:04:34 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFet4-0000IY-38;
	Fri, 07 Jun 2024 19:04:30 +0000
Date: Sat, 8 Jun 2024 03:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-ak4619-for-v6.1-2024-06-03 3375/17202]   also
 defined at arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi:142.9-145.3
Message-ID: <202406080223.ORlwAPMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem:   also defined at arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi:142.9-145.3"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

tree:   https://github.com/morimoto/linux sound-ak4619-for-v6.1-2024-06-03
head:   fcb2c815fbf0f03847caecb88b5f1da7d72c7123
commit: 22c95feebf0144f203b8a56d4f1dde8a9c23fdae [3375/17202] arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0
:::::: branch date: 5 days ago
:::::: commit date: 1 year, 4 months ago
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080223.ORlwAPMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406080223.ORlwAPMv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779f0.dtsi:714.25-745.5: Warning (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used in node /soc/pcie-ep@e65d0000)
>>   also defined at arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi:142.9-145.3
   arch/arm64/boot/dts/renesas/r8a779f0.dtsi:747.25-778.5: Warning (unique_unit_address): /soc/pcie@e65d8000: duplicate unit-address (also used in node /soc/pcie-ep@e65d8000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
