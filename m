Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDDD8F64
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742089080; cv=none; b=JA5y7o/yjfYx6LPlG8WRbQYlP3BmfnTsGRcjdEFUhy1S3Xlx8sCi+sL0d6P2SQEHZX/DQtjvXKdTG/V7g0tiDpwnbp/e/B0EDBzEHR/r3O88Oxqg7Q1+9v5Rob7sYKVUTXhm4ytE+7zevwJ3STAJVf+dKWe0pU06LifiPCZWnGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742089080; c=relaxed/simple;
	bh=NrCZKmyMwcqsm3732C8yXAQBXzHH+ST+AJhz5MvVRPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OqndsuastCxx7/jKflYSHfkzVLvzV48nB8DTeNmVsRpLirPa5wLRZ8MKWCY7niNosojl9+TryxVre0SWqD0s5jv/NPvdB2U7r+k577hq82R2ezXyophPsLwfyObJE1y2Aay3h59oK7ZRn5FCFVTtvC+TBdW/yMBwl5cfMAH/gxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpoqNTEp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpoqNTEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742089079; x=1773625079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NrCZKmyMwcqsm3732C8yXAQBXzHH+ST+AJhz5MvVRPc=;
  b=LpoqNTEpzZSKU4bCFiPN8qSapJvxawyJXGfR8cwLvjRmuHcKw3DoSFFU
   dCd8RwGYXDOeqdmlksUUYIDOB37ELTu0jzn213KIA4yP4nqWfG0A+LORk
   QiMKPRZrUooqDES+cZdfe9XfScGzk2fBuhibNyZpUJw7ti/mNoAWuN/Jz
   DSFxXHT8Gz/AvNGcoEY4983wYRXikSDL8j6Xb7QoOkVJL+//iwOpf9DGe
   gcbzzNtFZ7RkpQoy7vHBd9udJNmjiax3ke5AfEKKAupAfeheUHkjD06+A
   JDv42m/Y8E/O8xEnwBMCxV2zOXar5H/zGplH50piHe0oSHDQO/H8T8xMl
   A==;
X-CSE-ConnectionGUID: fhF8X890T7yOoPDtLCCHKA==
X-CSE-MsgGUID: Fegg+Fh9StqipueluLEpCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="65675016"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="65675016"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 18:37:58 -0700
X-CSE-ConnectionGUID: NElS12EFTkqYtWSr21UcAQ==
X-CSE-MsgGUID: m9antcl9Q+KeG3K+4IlP+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="126691905"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Mar 2025 18:37:57 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttcwt-000BlD-07;
	Sun, 16 Mar 2025 01:37:55 +0000
Date: Sun, 16 Mar 2025 09:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-14 7/8]
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: spi@e6e90000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503160900.lf3K424m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-14
head:   4a682853dba80568b028cfd58b4b96bae534c280
commit: 010d136b642fbf45d827ae232e4a852d71d0d4d0 [7/8] hoge
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-053-20250315 (https://download.01.org/0day-ci/archive/20250316/202503160900.lf3K424m-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160900.lf3K424m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503160900.lf3K424m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:53.18-59.4: Warning (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
   arch/arm64/boot/dts/renesas/r8a77960.dtsi:1436.24-1450.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6e90000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:33.8-42.4: Warning (avoid_unnecessary_addr_size): /dummy: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: spi@e6e90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,msiof-snd-r8a779g0', 'renesas,rcar-gen4-msiof-snd'] is too long
   	'renesas,msiof-sh73a0' was expected
   	'renesas,msiof-snd-r8a779g0' is not one of ['renesas,msiof-r8a7742', 'renesas,msiof-r8a7743', 'renesas,msiof-r8a7744', 'renesas,msiof-r8a7745', 'renesas,msiof-r8a77470', 'renesas,msiof-r8a7790', 'renesas,msiof-r8a7791', 'renesas,msiof-r8a7792', 'renesas,msiof-r8a7793', 'renesas,msiof-r8a7794']
   	'renesas,msiof-snd-r8a779g0' is not one of ['renesas,msiof-r8a774a1', 'renesas,msiof-r8a774b1', 'renesas,msiof-r8a774c0', 'renesas,msiof-r8a774e1', 'renesas,msiof-r8a7795', 'renesas,msiof-r8a7796', 'renesas,msiof-r8a77961', 'renesas,msiof-r8a77965', 'renesas,msiof-r8a77970', 'renesas,msiof-r8a77980', 'renesas,msiof-r8a77990', 'renesas,msiof-r8a77995']
   	'renesas,msiof-snd-r8a779g0' is not one of ['renesas,msiof-r8a779a0', 'renesas,msiof-r8a779f0', 'renesas,msiof-r8a779g0', 'renesas,msiof-r8a779h0']
   	'renesas,sh-msiof' was expected
   	'renesas,sh-mobile-msiof' was expected
   	'renesas,rcar-gen2-msiof' was expected
   	'renesas,rcar-gen3-msiof' was expected
   	'renesas,rcar-gen4-msiof' was expected
   	'renesas,msiof-snd-rcar-gen4' was expected
   	from schema $id: http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: spi@e6e90000: Unevaluated properties are not allowed ('compatible', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
