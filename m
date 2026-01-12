Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CF33EAF8
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217918; cv=none; b=i9MwH5b31DbgchZQ5ZjP4vbh7S0mF86rxfs4LBVNe3xNl2Jhs+ed4Bj8mfSTjA99UEdOSMAnn/TziK3GFzSCCkmyX/jVD6BGcDlY81QT4xU3yOyuPNKQz4kXnSNYp0/zelRVRpu+3YQ4fXVPHOO2mveJrhgemyc0NrvRAZDdOZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217918; c=relaxed/simple;
	bh=18GWzjLJH8wFDN0IcZ2aubIg4IT4SHZeduma3a7q6RY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=so2fWF3/YLnR6DRT4npDr+DO6S1luD+3op1Lz0GgZaGzXpCovFa25Ugl83VMssi1ojMlu5IiLDoxTv4gj5aBGkwJhgBbSB2VuIgC2ucTPZfxa6B1Hi/TTulA42rpbD463LQHe6FqGUnPkSklNtOQiYbH6mmC6TGekkeVNkgP+Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZseX4ht3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZseX4ht3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768217917; x=1799753917;
  h=date:from:to:cc:subject:message-id;
  bh=18GWzjLJH8wFDN0IcZ2aubIg4IT4SHZeduma3a7q6RY=;
  b=ZseX4ht3iaokt28qpq6wpoFuUj4JwRzYzWA+PeXNihYpSjXlUEibOWWl
   LZVWXHJrYMp+Xe7OkARE17pyycPxWudxjmNmBvhoYHqfpu8PHjkVRnI6/
   aVf78QNUFlZ6VIxXG834OI+ccTxcE+SpLmmAfE8XpKLkoNOsMQJmvRn8a
   ZQj5UbWCT8RrTNxu1ueeOfsjVgQorPpFOn8Re4lH1v6lrocAY03QS/1WR
   x6MDyy+qLNLi7581n94cefHEmQtOdgJybQ/KdcfIPhLQtLr3cZb0hF4kZ
   sonQ6oPdPkQ8wRUbvUXLY2TECtKY/DK/+Zqnsuqfq4o9MsQgr3E8cRc17
   g==;
X-CSE-ConnectionGUID: Fce7Y7SlTZWGTnC33acs+A==
X-CSE-MsgGUID: dLirwTkxSXGMH7E/nBcqAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68694753"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="68694753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:38:36 -0800
X-CSE-ConnectionGUID: taps/ivIT8+r6Z9klwS4bw==
X-CSE-MsgGUID: p/4CSisrSHqqiDfrFld2lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208547531"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 03:38:35 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfGFl-000000000t3-0Spj;
	Mon, 12 Jan 2026 11:38:33 +0000
Date: Mon, 12 Jan 2026 12:38:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:k1/for-next 7/8]
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: mmc@d4281000
 (spacemit,k1-sdhci): Unevaluated properties are not allowed ('reset-names',
 'resets' were unexpected)
Message-ID: <202601121242.GMwsd3Ua-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Yixun Lan <dlan@gentoo.org>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://github.com/spacemit-com/linux k1/for-next
head:   0552cbce4bce08087313cdb599acf6f9616de0d7
commit: 7c2b0e0b04c42dfa838c35833d2b4be11d0c8351 [7/8] riscv: dts: spacemit: sdhci: add reset support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-2052-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121242.GMwsd3Ua-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121242.GMwsd3Ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601121242.GMwsd3Ua-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800 (spacemit,k1-i2c): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca400000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca800000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: mmc@d4281000 (spacemit,k1-sdhci): Unevaluated properties are not allowed ('reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/spacemit,sdhci.yaml
--
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: mmc@d4281000 (spacemit,k1-sdhci): Unevaluated properties are not allowed ('reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/spacemit,sdhci.yaml
--
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: mmc@d4281000 (spacemit,k1-sdhci): Unevaluated properties are not allowed ('reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/spacemit,sdhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
