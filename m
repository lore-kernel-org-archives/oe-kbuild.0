Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9846414386B
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720176338; cv=none; b=uWf4PQ2MMUKtOqvzr+8FpdAMrLYQEy8gTvWRCfeNh/DeJJC0VVJVypcNV6eN/+n1uGEAN6z7YGXR3+cdPYwcroHgtwMg1w9yUuNdiAVHm1J/DTE0N6ijaUWyEed3VxgeT6qgIUIMGM1JP8Am+LN2okjIwCn6pkVWrdlAR4gKtuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720176338; c=relaxed/simple;
	bh=BRd1k2626gA0Ctv9YKwLDr7O6otOJ8mJh8P2dOFUIb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3ZL6Me9WrpVfT10fE9lbKHew9L/KIo5ncUN38b51CCRIWAhNRlcE17fZqjPgf+MTQKJTyCJAjVRTRxKiCX6StgTtev/LVoWxIphppt780KAv3CidUVDKIZxfS5PKufc3yBFR6NLYg6u0OXTSpjybHgHggVliTGZMWywH0pQ1no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUX15Gjw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUX15Gjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720176332; x=1751712332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BRd1k2626gA0Ctv9YKwLDr7O6otOJ8mJh8P2dOFUIb8=;
  b=RUX15Gjw5cXycf4zLjXDTq+bQ1CLmCSmMg+Cvp7LnrsmecoN9pB+UfDu
   rjkHTTr7DeAMSkhO+DOwaC+/6JcI6GyciMwA9Q6OYoiJmS6kvqqv/smXJ
   3XGIBvcHUOkfAXHObEJZZf3exjnyYtFwXD9xd+tRDDVH5c818g/1krzpa
   Ui2fF4eRYo/XML0Bcy3FzSx3v2wFxt3wT4PddY0v0vs0J7bwnDgu5SFGs
   fQQQA01XvX4VPZFcFKmyBK8pXArR3XQQYNw7f/XZpg1HfPJ4qRGEJPFad
   dUwEnJNRXOSsioOuSMp4OBMpy0VYDqmM9DxIrPh+SCwG3GJZkTXb/vFuT
   A==;
X-CSE-ConnectionGUID: P+z2xF5tTW+2lQ2yvA7RRg==
X-CSE-MsgGUID: 3UfIjwdGRhGv2tLZtrab4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28138659"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="28138659"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 03:45:31 -0700
X-CSE-ConnectionGUID: 5OnjcVdjSO6cUQ3lOeUQ+g==
X-CSE-MsgGUID: nx+tVHjQT6+p7Kvanvghzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="77585363"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jul 2024 03:45:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPgRT-000SHS-1L;
	Fri, 05 Jul 2024 10:45:27 +0000
Date: Fri, 5 Jul 2024 18:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 112/187]
 arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000:
 power-controller@398: 'apple,externally-clocked' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202407051846.dp2iaGKS-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 813263874fd535ebe8ae583008c8509ef9a45327 [112/187] arm64: dts: apple: t602x: Mark MCA power states as externally-clocked
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240705/202407051846.dp2iaGKS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051846.dp2iaGKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407051846.dp2iaGKS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@378:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000: power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@388: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@390: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@398: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@398: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3a0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3a8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3a8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3b0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3b0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3b8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3c0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@3c8: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
