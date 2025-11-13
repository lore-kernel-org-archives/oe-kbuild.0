Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCF4322A38
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069060; cv=none; b=KA9TiaWa5NYf0u8LQZDtjQPnyH6EtnMfpSjxlPrStd8/cP+bfwP4BnvlHm7Dwj35w4hrlx8zmF6Ll9ToglDAw+zJ0JyoyhB2TRnczghBARAuOljxQtTqMpFmMd8csR6uIEyNQ5v+mjKvPL7wM/InY2y0NzKOyCay2JdiJmkgOTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069060; c=relaxed/simple;
	bh=bsp0BAi0MeTNtlJSo9ZCDooMXFOM8AH2k8fCaH1y40A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=scEec3JUw6CzA0vJEKLIZC1uUpjXK1f6CK52HGLxgCiyiftTV17SriuMmPTRjEo6dm31rgXnU8Ek+zM2ZNQ5WBT1+mr24r9VsA7msivipNSHvEzXgnpKKGA2r6eU0T1tarodp0bn1JuTJFVJpznEn3QySbPngbtUOGlggnOaGz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXBmXqjr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXBmXqjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069059; x=1794605059;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bsp0BAi0MeTNtlJSo9ZCDooMXFOM8AH2k8fCaH1y40A=;
  b=XXBmXqjrGmEAdp6UwpPFLwIfjVc73yPkpoz1xSPQ4Tj4QCkpZ8FRO2Gx
   rgF8TqGBQOBKjoytRBoOZ7rxOgoNqaqYooQQkQhB6UsmzgUmS8WaIf92F
   6AdB6hGElE3Q9D7DjW/JnFbPiPAZjFN7O/7NentGeVHZ4jyeIakkK1yOm
   D4LZYKZA5EfLn2HnbEtaKvPexgcakevAfadg75vLc5iVft91vztz2eX28
   2v0OkVw1hVMEVzb40CFh4s2l3RD1AU+ogKrejeFxNFCqv0TW9/vhkTGpg
   5SHTnCFYO7F5P+SqoMi/+wwcQpVRvlPeMTOpmR7w7rXssPJDSeZDrEzM4
   Q==;
X-CSE-ConnectionGUID: jyKjjO8/T9KYOCFbNgMt2w==
X-CSE-MsgGUID: gKMCWWR7RZGKnQ47eBp7PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65202007"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65202007"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:24:16 -0800
X-CSE-ConnectionGUID: dQD0AcKiSvGn0jIMXZA8RA==
X-CSE-MsgGUID: EJv2hOM6TRSDbEsfKuesXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189435659"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2025 13:24:15 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJenc-0000000017R-49No;
	Thu, 13 Nov 2025 21:24:12 +0000
Date: Thu, 13 Nov 2025 22:23:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.19 83/88]
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: gpu@fd000000
 (renesas,r8a779a0-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202511121553.BYalQWCd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: "Niklas Söderlund" <niklas.soderlund+renesas@ragnatech.se>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
head:   8c95f813d75b33564b6c9f9c22a6914cabf6ad0d
commit: 7d41b3085b0b23a3536e2d4c964898428e9b9833 [83/88] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20251111 (https://download.01.org/0day-ci/archive/20251112/202511121553.BYalQWCd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 00d2780cca3438c3f2ce56a2f9d5549bbcb67131)
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121553.BYalQWCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511121553.BYalQWCd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1206.12-1216.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1235.12-1245.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1264.12-1274.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1293.12-1303.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1322.12-1332.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1351.12-1361.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1380.12-1390.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1409.12-1419.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2636.12-2646.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2818.12-2828.7: Warning (graph_child_address): /soc/isp@fed30000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: gpu@fd000000 (renesas,r8a779a0-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a779a0-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a779a0-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a779a0-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
