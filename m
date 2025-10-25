Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332921B0F23
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 21:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761427243; cv=none; b=rMadT0MV0vvr4OnZnYBx1pQc99rb9pIc6MmY6bCd82N+PwsZWPkY5u2deHnugqCcmH60Hld+Mky4/QGEGJmw8iivqxH1Np85wq2OAvrwLgXmvV1NbV+HFN4xelqHhIuwyFtvuWD9U8Bb4hXJg3C1nZQEVTkol3XSSWJhsPLXCI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761427243; c=relaxed/simple;
	bh=F8rRyvsDDHCTbyHdaftBQckG1DlZLnilwyxyFqDPR7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dB9jurCvxCIciCBO+SMRwrA58+M8o9qc1qIoG/CzQ9NjwyOV50LB4eN9U56l6tNQb73Y/JOjaXvw94hgEZzG8f6dl+GQKOjbSLD4RodnFLY9Qu76sCrs6C9E8MVtVS0W8nWU2NbKZNV5iClsulFhz2Nb4TkRHYCN2XtrvWhLLP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fa8ZFCPF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fa8ZFCPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761427241; x=1792963241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F8rRyvsDDHCTbyHdaftBQckG1DlZLnilwyxyFqDPR7U=;
  b=Fa8ZFCPFDcrsew/2Q/gErdDd4JVHVHH3hDVA0kRZeKKDm3g+a/W5jj+U
   KuS4sp4LPNftU6skyN+UZcqFkHMVnUZBUPh0Ffo333NctSuYAxOQZ0C3q
   0x7kRvVmmSx/uFHhJt4VIu5yXxnjP77iqXS2QgjGiNdCx5/UphfqMXDKq
   H49VWMQCAPdV1733g+EMmRPZ1OfDqrt+C+3rGmwJ5NfvgcduY9tmsCeAA
   COQvU4XL9/nrHTPd8e18ABDF4JHXA9LkDBymDl+x8Cz9DH0HCe5+bV9Lc
   E9pL1NDCGQT6NImeo/dAOzq7nRwzzwlRxm939/FlgcsbrRJsgxBC1/98W
   g==;
X-CSE-ConnectionGUID: hMTKls3eR9GrAfoIHR+Nsg==
X-CSE-MsgGUID: zcsuKj/rSl6DllqCqTOTIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89036875"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="89036875"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 14:20:41 -0700
X-CSE-ConnectionGUID: pcs4uzs+T0+fu2P3yQfVpQ==
X-CSE-MsgGUID: JDSEJOA8SKKj+gkMjwpCYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="221904297"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2025 14:20:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vClgj-000FbV-14;
	Sat, 25 Oct 2025 21:20:37 +0000
Date: Sun, 26 Oct 2025 05:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:ux500-janice-v6.18-rc1 10/11]
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio):
 Unevaluated properties are not allowed ('#address-cells', '#size-cells',
 'haptic@49' were unexpected)
Message-ID: <202510260508.bdW6UxFp-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-janice-v6.18-rc1
head:   ccd3929e54f44ccae885d803cc472204f661c886
commit: e008aa373e9391a32f3bfd82d41eb847c2d2599e [10/11] ARM: dts: ux500: Add the Immersion ISA to Janice DTS
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251026/202510260508.bdW6UxFp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260508.bdW6UxFp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510260508.bdW6UxFp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: current-sense-shunt (current-sense-shunt): 'io-channel-ranges' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/afe/current-sense-shunt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'touchkey@20' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): $nodename:0: 'i2c-gpio-2' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'haptic@49' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nfc@2b' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: nfc@2b (nxp,pn544-i2c): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nfc/nxp,pn544.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
