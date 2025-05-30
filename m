Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D74D382
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748640603; cv=none; b=TIc9AYVwjGuQaBwCRxzWl0BXz/gG8IyVVCcRk0ZjcZwkUisXMTJjnfc2g3qEEmx6bC+m4AXJFvyrruwEH7uD+oHL+9iM0paLYPHHmYNe9G5mlFOFu351q+TfJqnM/3S1cgDoA4nwhxWNNhgOmtpSq27gpFxme7OK2gBFy31JW3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748640603; c=relaxed/simple;
	bh=XaxlsDVKdmrpVkCceOR7wtAQF6m35IYvAkAMNBIr2Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jYcgcVei20j/UE16LDijzqgnyrNw81YrvXYt9u4isis03vmxXW4bhqNjd6Czm+OWTLvwUaXu4iRdW9CAomsNUyYIe9kgW39xadp4E7jt/z37GD4WRYv0qiVPbR6zJxkRSWALsIjcgywiCpwzfQIBxW6TBCsqIatiUtejJgWCsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U455rw+X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U455rw+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748640601; x=1780176601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XaxlsDVKdmrpVkCceOR7wtAQF6m35IYvAkAMNBIr2Dk=;
  b=U455rw+XfFtTm/2Leof55/96NEmFSaon9I8kAmp54V6xjpOseXspl5ed
   68vostWMqSfx1zlG/ithLzrLaMc0+qY/UMD6/6FrnHoUNIR6VFK+Q+OrO
   79PfLyBX7Bq+nxqe1YLhG+28R4UJvD1nb+IflsDwk+8S0zlROsKRO3h8k
   6OaNJqeMwpKKQwWcenKzLvFcOkWwGSNJsCOUls4hNwP8Je0Q4l6+bzDm9
   NOIf+FIzWu0f9hVqPxiH/vnCLVvSQi84FS8iDtpfd2uSHeJL4makWGTz1
   jWvXH3KW5VEFstYM8ue1M7bJHYv/atnaak202wf72KILXuMvTMHgTBOir
   w==;
X-CSE-ConnectionGUID: 0iJXr1KRRiWYIgpP1QAgqA==
X-CSE-MsgGUID: OnV6bKKmQiOCZ81HJdO1UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49981062"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="49981062"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 14:30:00 -0700
X-CSE-ConnectionGUID: RKlZPX5VQomuWIIXyPMyEw==
X-CSE-MsgGUID: xi98OjckSrmrSTpCo5vlrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144450555"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 14:29:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL7Ib-000Xya-0v;
	Fri, 30 May 2025 21:29:57 +0000
Date: Sat, 31 May 2025 05:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:master 10/33]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@11800000
 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one
 of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm',
 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 're...
Message-ID: <202505310537.3XaHF8eE-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
head:   0cc4c9c39e8953745481c13288a46edc616dc7cd
commit: 37d0364433588e8bbb19588601492709579e48f1 [10/33] arm64: dts: renesas: r9a09g056: Add OSTM0-OSTM7 nodes
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310537.3XaHF8eE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310537.3XaHF8eE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505310537.3XaHF8eE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@11800000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@11801000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@14000000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@14001000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c00000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c01000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c02000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c03000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: serial@11c01400 (renesas,scif-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too long
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too short
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
