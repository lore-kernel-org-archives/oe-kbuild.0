Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194946FC5
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 02:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216877; cv=none; b=B77lAeyL8CAm/u9H635B9HVOBuQpkQcrpfs7eCMXrMTjj/Ss0xkhRx+oRkBwhpsd8B8iDGpXrPiJIqZuqstcIuPRKh557Wdti/XAaOjhMgADaArWFI6JoEjSjr0amLXxQnOipaCw1zLdjI25p7LjUsMAtH4x3L2ZrePSI0/Y1io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216877; c=relaxed/simple;
	bh=N/njnno6I853Tj7HhwL0W3x4hoK8OdqS0xHx/fB9xMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PKx9kBUG/KICzQHGOpzAQ2NQtDsAZKDsBIX/gN99YDfQkAkaO2haVY50LuXEpxfQmQH7PiTAXlJ0sbzHlMtPKtR3A68U6uDMA33hCQ+OuiknFYsTcFIFscPd/AuLe58KuhAMPP18+VwH5XXf+BQh8A/IltXm0EvxMooeBVzRp0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bETTe6qZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bETTe6qZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790216875; x=1821752875;
  h=date:from:to:cc:subject:message-id;
  bh=N/njnno6I853Tj7HhwL0W3x4hoK8OdqS0xHx/fB9xMk=;
  b=bETTe6qZOob1xp27rdKXexijeqWl/iPuMtVLvVWXUgRbo5WLhOgFDTV4
   yVoNRsNWqq2pGZu9q46kTV/dfqELnwgOu23fPZLqL4bP79KqujUVlyK0a
   8EMprESjF+2lz4sth3lKtJOxv0z/gTEgWuGRUimE8kPiouMjqdksZiSqe
   P+qVzIZSWuaquKTwRwmOvGLpWhlTu2AzRdw+xSViq32LYVouJGDnxbWy/
   +R6sn1J+NEPn2X5qlj5Wo+RfwjuVvXOIXSwKfDvtvyEzqGv7JA305CU6K
   tM2BcOPyOV2LZYsMs5DCXv8KKhmNCIJPamz23MAMzria5YBHKYx/2d404
   Q==;
X-CSE-ConnectionGUID: SmAMuBKWRj6BYduoq3+dRw==
X-CSE-MsgGUID: RgULixMWTW60tRdhf8krfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90993338"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90993338"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 19:27:54 -0700
X-CSE-ConnectionGUID: BG/4F3C1RIKA3ycSPJ15pw==
X-CSE-MsgGUID: bYx8gfwtRqiZnBVD0cNJ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="301818074"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 19:27:54 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9ZBf-000000000B4-2QKC;
	Thu, 24 Sep 2026 02:27:51 +0000
Date: Thu, 24 Sep 2026 04:27:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 96/132]
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb:
 aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed
 ('no-map', 'reg' were unexpected)
Message-ID: <202609240413.CfVjQZEI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.4
head:   32afff1e816e10185bb571aa9d89dc2eb061d548
commit: 7e38885d78f7b008c085a0cde7173242d02d2b01 [96/132] arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2403-20260923 (https://download.01.org/0day-ci/archive/20260924/202609240413.CfVjQZEI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240413.CfVjQZEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609240413.CfVjQZEI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
>> arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb: aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb: adsp-rpc-remote-heap (shared-dma-pool): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
