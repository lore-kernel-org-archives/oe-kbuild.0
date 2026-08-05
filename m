Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDEA41B8C1
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924373; cv=none; b=cPqivy9KnqKyKM29iNAlzkn/DeDFg0v2PrX39/Hzl6kEdqLSworHI0Wd6wFsyaNkKe4R9QvCaraMiVkL7Lvd9erseNUbXC5pfE5Hb7VpebgawHkV6nSzEM+Nk5XnHnbMPzoxjtmmvLKExipy5f3hwgonatB0qQjkFJszVZPWOoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924373; c=relaxed/simple;
	bh=F7njehN7rzT3v5oqJ+FVvrejOWpAnAi0P8NwDoThd5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZJDI2PfgeKlJ2eIrrkz822mxQscF2FLrm01SVipxUHxfBfyOyZCC1yNqeHYj/P5KygKvb1StYz0U+9uOZfhUcQYNr4CXyKimKLmHBgmpHvDXZyzhxCxcRk0D7Hn+rxjh86D4IeHXOy1pOQ+D94/jbo/MG2B9bTciF/i39FBmJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMmPlLFu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMmPlLFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785924371; x=1817460371;
  h=date:from:to:cc:subject:message-id;
  bh=F7njehN7rzT3v5oqJ+FVvrejOWpAnAi0P8NwDoThd5A=;
  b=TMmPlLFuoRkhv8piK7i+N0l3n9f2o86mAsmtBxPK0ZGXKY9pXWMtX5N6
   X4+yblSLMufz8Gwiejj6gFgnyuKo97kaH34NCgXu7ZZ+LZvgQ8WRh/xgY
   6nXJCMI3LTVBfyv09gGDBfbcPNH4rVyoYP2XOU8NeWZWzRaN8o8Th1U8i
   AYq+lPJqek2Yy7fHYCyZBdH+hChjG/AUJs3BiQHgM4PIZmayJKLQoeT+w
   N03EGdKO4JkxoqjyoKSBDeaHKqeVN/O0rqar3dQs1thefrPfDzex7uZxA
   jg4QwS5SpOW9ki8D/JE2DVPalaJecTPkF6l2K/gdDHN9ml58vX26WCvG/
   Q==;
X-CSE-ConnectionGUID: VmoUkGteRcymLdzp2mSwjQ==
X-CSE-MsgGUID: zIsmepIEQZusTQD88KLLJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86523379"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86523379"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 03:06:10 -0700
X-CSE-ConnectionGUID: MjMRq+MBROqHYuy/cvG38g==
X-CSE-MsgGUID: 4bQs/e5zQceY3G+Nc/FSyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257461462"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2026 02:34:55 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrY1U-000000004N0-3OFL;
	Wed, 05 Aug 2026 09:34:52 +0000
Date: Wed, 05 Aug 2026 11:34:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@0
 (canaan,k210): 'riscv,pmwid' is a required property
Message-ID: <202608051109.TLIIGm3a-lkp@intel.com>
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
TO: "Yu-Chien Peter Lin" <peter.lin@sifive.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yu-Chien-Peter-Lin/dt-bindings-riscv-Add-Worlds-ISA-extensions/20260805-015739
head:   a0c5e83d4a216594e2e735a98d4d8ff1f043927f
commit: f0c7d98818d394056ca70e8101ea6301cdd02930 dt-bindings: riscv: Add Worlds per-hart properties
date:   16 hours ago
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-2051-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051109.TLIIGm3a-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051109.TLIIGm3a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608051109.TLIIGm3a-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@0 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@1 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@0 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@1 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@0 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@1 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@0 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@1 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@0 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@1 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@0 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@1 (canaan,k210): 'riscv,pmwid' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
