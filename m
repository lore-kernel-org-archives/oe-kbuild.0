Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9449D308F30
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 22:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761345521; cv=none; b=sLsninpQFZVejPZiXj1TEpQVSOwcZXzf/AAjvxKFbUdN8JosTTS9E5Lg7mj0ycMI2nMJBS423H13+I1wqaPA3Ld3uIRNxNUhwX5Vjq/rIDWLaNo9mhWBz2cqLPJ5LQyjZMIm3xV4qHTOsvjfC514tG1CiEz7v0NEjGyT5BnMd9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761345521; c=relaxed/simple;
	bh=v+XRTrRSXokOlhzUjrK2HcRRDRdpBDhPRWv9xmkM058=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TfteKc1Wehg8qKg0/HIp49aG+I+/Xw0mj5HSdT4wMRWBocQX9yvW8PD8BUy6lwh5FzplNFlEQCib4hYrAtRz4K8kw2rRmewc2LFMclrC4XK3BsbGYQm5+q6TtZMVrQt1MI23M7gaWRRFJtDqNyU1/peAunNv7UVQF9Ayi1fACmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYpRvfQM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYpRvfQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761345520; x=1792881520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+XRTrRSXokOlhzUjrK2HcRRDRdpBDhPRWv9xmkM058=;
  b=kYpRvfQML7eMnSbyAkV9ewn5T+cBhIfzlc+094Yt0lnnyAxcFoDlH19g
   ZTfQ94pLDAHB+8idlcO+J461yge1/DXz3upyK30qLmLVZQFKOxwBTY44s
   2GFxQSibJSNAHh/97tLhn+Knswk9lA2SnAwXqLItwPr8kCUZ7aWUEzeb4
   KaFOrXlOO3T3nc5li1d1ro2/D7CL3jm4ptmMuU0QZW4WT/KS0eZE/JGFC
   Ul/1Glzu2Z225cd2+nqAhn727fNOt2Im4BxSA3qxSQGu2WkLFwMOUWkiA
   tOIILrXxSnM3XBxH73KjwhXhe1lYKpGVFn7CiDdTSrSz56WkyYvb0Stf5
   g==;
X-CSE-ConnectionGUID: DUQFPGjsTAGEAl9aKHSFNg==
X-CSE-MsgGUID: sgHYv92XQ/26BklbOmn8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74875579"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="74875579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 15:38:39 -0700
X-CSE-ConnectionGUID: 6XP4opy7TUuKnxBAlD03Kg==
X-CSE-MsgGUID: TeuqvR5JT1eValf18US8tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="188925272"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2025 15:38:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCQQd-000Evx-2z;
	Fri, 24 Oct 2025 22:38:35 +0000
Date: Sat, 25 Oct 2025 06:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:ux500-janice-v6.18-rc1 10/11]
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio):
 Unevaluated properties are not allowed ('#address-cells', '#size-cells',
 'haptic@49' were unexpected)
Message-ID: <202510250602.uzw3vmR1-lkp@intel.com>
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
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250602.uzw3vmR1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250602.uzw3vmR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510250602.uzw3vmR1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: current-sense-shunt (current-sense-shunt): 'io-channel-ranges' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/afe/current-sense-shunt.yaml#
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'touchkey@20' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): $nodename:0: 'i2c-gpio-2' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'haptic@49' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nfc@2b' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: nfc@2b (nxp,pn544-i2c): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nfc/nxp,pn544.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
