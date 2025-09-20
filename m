Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34D92AE90
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758384106; cv=none; b=V4x+T5PuKGjUfFupHotnadEsz+ug6boiK9VU6lZSfn1rPvBYZzt+o7RT4RMCQ8MMhY16bnS6NzasIxFCACjuEeUMC7tsRAw9OZc9EV1Vea5iqAk7W4CqUcC9eOkVaQNtVdG0/ZeJyJihsp/yjtQ7NaGDGfb1NKCUvMwUZR9cRZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758384106; c=relaxed/simple;
	bh=JtXJq8txaOSspEj0EWxtfRNe1ZKs5ErVNt0hdASw9+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqHyY+c0akquPuFTG4u0vPSW++e+b5eMSVaTOvPeP7F4oOGM4kguWwQF4P6gaVyfWQxP09iukA7tGk87zsMZhEqeJ3sUJIT9fCCiyk4qPKJ1l/F48yKMOf+dvrExaNQyhkiWi91c8e/4SnajB5pDJNI4ytU4KqxXVyGfXIA7VtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBZrKiBt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBZrKiBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758384105; x=1789920105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JtXJq8txaOSspEj0EWxtfRNe1ZKs5ErVNt0hdASw9+8=;
  b=JBZrKiBtlKmETMq+9q0VfU2TVYzjIv0Wv2DHKcjQ+hmvOvst7D4xXLKh
   PWqhTYL7/AsedbQlC7e+knoo11FCZ9EBlWntpPVe4Ial9b23MjSRWXEIR
   iMpF55Agmfs0KtLnJrToKZPv8pdHLx3sSqScz1qaeJxveYOT71g2mDSHa
   f1988ba/mVLc0cTgSuJM8uE49omLUdTxreEx7zllzH3gURt8EpCosGSRt
   C+xO3qNXkWBSpAea5vTuygb1qDlGFF50fxiD9pQNPECVn+e/9wnjjJV0G
   uA/yxxQk2FkLrGMqIl84w+AdN/YLEFlbPbs1tdyqgyPamFxW/P37SNByU
   w==;
X-CSE-ConnectionGUID: VSjIxDmXTuWA0/pF7LTFXQ==
X-CSE-MsgGUID: PyNIsBhhSG+1HcEBYiojJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60824557"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="60824557"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 09:01:44 -0700
X-CSE-ConnectionGUID: 1nxkwkwwRRq+mugO+qklFw==
X-CSE-MsgGUID: TmG9++aLS4+6eRmb9PKjCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="213248411"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 20 Sep 2025 09:01:42 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v001s-000000003TV-1Ugc;
	Sat, 20 Sep 2025 16:01:40 +0000
Date: Sat, 20 Sep 2025 18:01:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 5/134]
 arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a110000: failed to
 match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
Message-ID: <202509201815.gXRvNiC4-lkp@intel.com>
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
TO: Nick Chan <towinchenmi@gmail.com>
CC: Janne Grunau <j@jannau.net>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   00c6dc8272d302876034765e34843f6abc62219f
commit: 297f3599a06fe8798844b19a7d7a6f0f4a4b556d [5/134] arm64: dts: apple: t7000: Add I2C nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250920/202509201815.gXRvNiC4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201815.gXRvNiC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201815.gXRvNiC4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
