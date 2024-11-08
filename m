Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2DEC0
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 01:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731027763; cv=none; b=X5Es1BorXiBHI7pVMrfFvRy2CHjMCsfv2rJd3mh3a0Ie5u2547H7FTy+r2HSHLpaPCcXU00d3DkUuF9I73Uob92M5L4rwd1o9KGY7O6Lb2ZQ/Q9Ui4xpjJ6ffAhrRoiD06zVjxHKPD6yrlA5o9rUzxe2OWrx1BKcvO/sppyNFRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731027763; c=relaxed/simple;
	bh=c5DrMT4fnnKf7Id+LA0KoHn97jvEIrLqxPiqDGXGkfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=up3PdphqKKTEnEaCrXaN+d474EFFJdAY9xJCckv29isJBexfEj2bOMpXcy4xkiN2PmB9x5HTqlRfqntyEfTq8SdDVxPlhHi6LvmOZsCbrTvRjSOkWVX/7cqBR8uUGAFZQaJmF3rXS/FhAxwrPtMsmS0fRiuNvgPkE5+94XzvlUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5BBq3+s; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5BBq3+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731027762; x=1762563762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5DrMT4fnnKf7Id+LA0KoHn97jvEIrLqxPiqDGXGkfU=;
  b=H5BBq3+shPqexAoV2Y8OT7K9uo13Mvvp8qcTGZwvfq4wNG+fETPGWbKZ
   2eaHGtN+uWoPNU6elS7hXFbRJhEmlmo79kc+KB2jZxnoOqOyfhyxTlZUV
   bIyAJ3ynd8LBc2BcRujvdnS4+fkMtmGGBrObKWtySjpLABrsc3lGtQPTP
   NNEZ9ECDokQ2yL0PPYQdvOqJA3inCcAcEqxln1w5Ls1WyoP/D0HLVCCI3
   B2E3mzTp+KGC6m+DAcMOzrTnRo1Pus+5A4GMX0QPDxyMI3YtLYKhb4PlB
   Jd27Ace24ZhfxRe3UKCVT4f+crkwrhqK7Ur5Mk8oQR/Sg0QHKu/e+BOUL
   A==;
X-CSE-ConnectionGUID: Q/FJ9zWZTTyKrnQnCXGApQ==
X-CSE-MsgGUID: NFXCQJPgRHa5reivpbDrxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31125242"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="31125242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 17:02:40 -0800
X-CSE-ConnectionGUID: w8v+IUStQ86ieInm4sJ2BQ==
X-CSE-MsgGUID: /jvCkwKPT+2xXF/R01ZLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="84926886"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Nov 2024 17:02:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9DOX-000qq8-0S;
	Fri, 08 Nov 2024 01:02:37 +0000
Date: Fri, 8 Nov 2024 09:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-partner_predev 81/81]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated
 properties are not allowed ('phy-handle', 'phy-mode', 'power-domains',
 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config',
 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', ...
Message-ID: <202411080838.HeNl2WKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: 27eb552ef585c9852d1d04afde9fde34f8b69dc2 [81/81] arm64: dts: qcom: sa8775p-ride: enable EMAC1
:::::: branch date: 8 days ago
:::::: commit date: 1 year, 3 months ago
config: arm64-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241108/202411080838.HeNl2WKe-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080838.HeNl2WKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411080838.HeNl2WKe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
