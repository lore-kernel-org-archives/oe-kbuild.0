Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15953246BC5
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 05:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758778957; cv=none; b=k7uP/pEe/a1PRn2pjqDonRiBOeCJQSVxCJGH6+tlYgfibg6icpozVYm54O7/BcpM0C3QOWJ8Ao9V6ijHQLAtftx77p381De/4YrXtMEJqbVoboh7FnvmXUWOQ436Rd117s5A/OP2cPfJ/wyTHAaIoVq2mfIperRyYLoXixR09JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758778957; c=relaxed/simple;
	bh=Suj/ajpy1Sfmj2T1H+aVERDXFGIaTUKFayWL2LwBT+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iIel7j5rW77N69ZXLXtuKTep5C5+icUh7rB7WlXQMk3NxVOyjykNeH1WzdH1SZf0HyjpPVmVadxA/LIcwD++GOR5daGgeK85W94bgR/8CLwtSKwWWVh8nSwr9NWykbs1r5H9f7gujZ3y+xkvpkL7jn3kBUVbRW/xYGbEzL7XMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNIG2Y1S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNIG2Y1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758778955; x=1790314955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Suj/ajpy1Sfmj2T1H+aVERDXFGIaTUKFayWL2LwBT+8=;
  b=HNIG2Y1SUG1D/K6TKrWwL/HgKRNaEYLtT97+R7TlVkIZjWXbndo7urCj
   RJDcd63KwPOa3NHQIP0ZwEJPE+1/vCZ9o44XD4UQkxsa6z6Xw5rxqxAMg
   P4tlB9MoSkaavQDp6kPbtUtB99YFzU3Hg4f2XR/2WhynglRgQLdWPx1u3
   fAP15X6n4ITbGTufKygTNOQJyeQtF0H4NjNgdPqYmXJICKZY74QgBtUbY
   uE1xBFep5WuzJifzLIYCdq5cWZq4OqgSKoWVF1Z/ETv4wDKtBcLrpo2k0
   O35kOZ6IjYFXt5pXrhnPRI+3gjDHWKR9JLjJ/cCeRH3QnJ+io2/zPIG2l
   g==;
X-CSE-ConnectionGUID: xq1gmmxPTNuUFB5qtqKzrA==
X-CSE-MsgGUID: Hf1GY8v2Rz+xrj+6lpsZiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64926534"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="64926534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 22:42:34 -0700
X-CSE-ConnectionGUID: zzndpeJtRpm9Nw0sAyFNxw==
X-CSE-MsgGUID: DeDuHIO7SUeBRELKeq2Z9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177071401"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 22:42:33 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1ekQ-000000004nZ-10gz;
	Thu, 25 Sep 2025 05:42:30 +0000
Date: Thu, 25 Sep 2025 07:41:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 6/140]
 arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a110000 (apple,t7000-i2c):
 compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c',
 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509250720.d7Gi8PCe-lkp@intel.com>
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
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 55e2d1ad882de08ee0dccc751f4cc88e3f10c3fa [6/140] arm64: dts: apple: t7001: Add I2C nodes
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250925/202509250720.d7Gi8PCe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250720.d7Gi8PCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509250720.d7Gi8PCe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
