Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31232188734
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758350304; cv=none; b=T3tA7enh1svbP5ZUtYs25fCXauWjjYKHw9May3hkYIMBNRwTABHVZ/h4GPs//OuLsFcqcLWImKnkb1RqOYYf/wScr3Y00ximCjGOa34o+NKiyEQU7ANEaS+m8y0F42NOFaCiy32VDl8uikj/c2Bn7x8J5jWOfr0Lhu98oc6s37g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758350304; c=relaxed/simple;
	bh=qlZcjtYoq3soSRGcIoCBW+qXHiaM+R93SEYO5+sg7Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fD7ZHki7S5RGPEAV+zlGbr+KfsZwqs28PKRdF4h1LMdRdiDSmwLRMtoMObYWt7DjnH3eAr3oTgv2XGeJm0S28YuN4MAvsJ0/twdM7oUVttuvnCEktAahMehGsTRAllXD4Bkn/4PqrtlZ3Y5Pr3IIPDO/xrYWIHC/RMK/faiKHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiRbcDzz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiRbcDzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758350302; x=1789886302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qlZcjtYoq3soSRGcIoCBW+qXHiaM+R93SEYO5+sg7Xg=;
  b=FiRbcDzzFhdqe8gNBRbdbPPks7zEVqLJ1mzqVQzhKxSncVKqGDkVV8PW
   ywRp3zX3rMQewOSu6tMwzBmeXcfK2wzpbqJ52xJ6UovHRoTccNcz/1NXF
   b+r0Hk+Gs2VQZhbX69jD7eWhWwsRWGE9/ThTjP6eij/s3/MxR3VM7swx+
   Z3URSbbc3i670uu6Ze7b3HUbCyuztDfxbY3CdsOry8/+fwS/0VveiPsQV
   wO9KusbBhW/ww18tfwfM6KV/fAecen9RvHpU42N4c9U6DyFT7wdrTL685
   cvN+omtSi3DfaelwDYJjapYGnorH8hRyTml+Z0OUVNiZ2yRCG4m7AWh44
   g==;
X-CSE-ConnectionGUID: dN7FA4XjRBuzHHsvS1tyLQ==
X-CSE-MsgGUID: L8T+4eH2TFONj90cTK5EFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="78297500"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="78297500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 23:38:20 -0700
X-CSE-ConnectionGUID: NYYbZqBKSSCLXTQYGh0YsQ==
X-CSE-MsgGUID: vpq0XkwOTKWEbh5BtA4HJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="213165398"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Sep 2025 23:38:19 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzrEf-00056B-0c;
	Sat, 20 Sep 2025 06:38:17 +0000
Date: Sat, 20 Sep 2025 14:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/n1d/enablement 13/13]
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: spi@50005000
 (renesas,r9a06g032-spi): Unevaluated properties are not allowed
 ('power-domains', 'spi-max-frequency' were unexpected)
Message-ID: <202509201455.yBrt4wZL-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement
head:   931bd9582b2eb02c45bea299d826d85a94e1ae11
commit: 931bd9582b2eb02c45bea299d826d85a94e1ae11 [13/13] enable FRAM
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm-randconfig-051-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201455.yBrt4wZL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201455.yBrt4wZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201455.yBrt4wZL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: switch@44050000 (renesas,r9a06g032-a5psw): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: spi@50005000 (renesas,r9a06g032-spi): Unevaluated properties are not allowed ('power-domains', 'spi-max-frequency' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
