Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA517BED0
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444893; cv=none; b=bqEmp/u2n24dmZ1WBgVoAp4WA79UimmIuH1wpDtDf5KikEANdMpqVWBuY/Q8C+XLJpHutkde+Qy+0B+K5klWupuFqgOCZDjl2wbLEqvlTcFTnrUxfcAl1ccgdj/0t/mMIoi4WhPz6qePtL5fvwLux6Vcm4Oq5K3kvcnqgeFgUFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444893; c=relaxed/simple;
	bh=MgpU19yNKHOJMZIxqJn2DCWISp/35EgpFR2ncyIdZ+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E/4yOJGGSEm0x2QZe4tnDKDwm4GsjFtf5zwpkWLprupZWIWNC6rB7Sg9tn0XA1tKY7S0yrP4djCm1c4YrtZRVSXKnWJy38kFV9tD+G4FoqXqtO/tTuNbyGrs8/k0qE5m/uctjHrtYPsI1sgpq0w2pgCz0WUTiUdkZ6fOWLuqdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHpYsqzy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHpYsqzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790444891; x=1821980891;
  h=date:from:to:cc:subject:message-id;
  bh=MgpU19yNKHOJMZIxqJn2DCWISp/35EgpFR2ncyIdZ+I=;
  b=nHpYsqzykHBsjnaWnX8usFljG5xlwcMxh59JVoaNbQukrh/1ISEo6gfm
   Kk0J8lh38L178WZqXNtLUpSOhj+VeFTKAU7Ni06B+44fmzyvKKkW7qaWr
   FJDDeU+CXuruHth4UPsJLLOR82/IKuRH0rU5GUYHiGpl0QZXoFRNXwZus
   uF2HR+OcZC4V+MeM4wSCrwkenpvPSBuIQLnBaTUUCW2/y9kaWNHJbQgVZ
   J4mf34NUqp4VNGE+l5562ZtjOyu2IZRL9mD+RxiWfTDrsW7E5XSzYd6DQ
   0fo0y5ujQvUG/MCWQV5nxzj4DUFXcY6u9g8vKpMqy3PmOWYLasyo5MZhR
   g==;
X-CSE-ConnectionGUID: peGqrWO/RmaTOZUQXBj0Bw==
X-CSE-MsgGUID: VDgzmDdKT36yDDeie7JWMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90106411"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="90106411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 10:48:10 -0700
X-CSE-ConnectionGUID: mmQyJ3IiRWavk7Zzv3eZOw==
X-CSE-MsgGUID: HZfGl3qhSUaJJPxfWXXJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="304131652"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2026 10:48:09 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAWVG-0000000008h-0cLl;
	Sat, 26 Sep 2026 17:48:02 +0000
Date: Sat, 26 Sep 2026 19:47:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 96/196]
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb:
 aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed
 ('no-map', 'reg' were unexpected)
Message-ID: <202609261927.cka6lyK3-lkp@intel.com>
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
head:   e57d572ed779eb53e7eb5b8f9546731eff21bc93
commit: 7e38885d78f7b008c085a0cde7173242d02d2b01 [96/196] arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
:::::: branch date: 23 hours ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2403-20260923 (https://download.01.org/0day-ci/archive/20260926/202609261927.cka6lyK3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261927.cka6lyK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609261927.cka6lyK3-lkp@intel.com/

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
