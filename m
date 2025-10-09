Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B43155C88
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760046419; cv=none; b=TIW5D7QkjZ4SFVolm+pKlSk6cjIHvQuugMiEP5z846W/iyiCDqUkTyuhcIry22jCduDT+KeFja5gfkvAcjYgL98Ns2ImIm7yv4bpI+IReIdjDt2YDhfKsm6u2ydkuyj3ThTRj6GGzJwCz7kyEF99rXttJBKAMIVan5jru4ZLL4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760046419; c=relaxed/simple;
	bh=FhUg7DPZNKD2kWpkS/qaRjR+qd7LKYT6Ip/h2U1nkkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhZ0SY7bHE2sB2pC7MYCD1zV0Xavd2LjdufdwwETOGJjGimnYS8+yi0uqLGqZCsf+j+HRbIhRousYagvw3VZayqEpt2QiBjuYODOmwNv2Kd25iKbFHdXedAKjId4IyT6u2PKWjQ8bTWHA1zzTNJK++XngOEeD6O9NcjsTr1JF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5ZKLVM1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5ZKLVM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760046417; x=1791582417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FhUg7DPZNKD2kWpkS/qaRjR+qd7LKYT6Ip/h2U1nkkU=;
  b=i5ZKLVM1VMule66vVwvyZVI5V6Yed20093Wd/GUhLFNbDTE3iDoOi8FJ
   VdXmx+wTt0K054JuCi03jv7Hx9ovQ7VVHZ/RvIZV7hBJHit2zq66e7SOc
   5chrwDm87QG/yoL/7gOTNGBAKfV+ElLeXEv8uPxexaybv20V6LgvS7r0X
   m1sSJiUIXaAS3gWKzMQnTp2kH6gjaXnixEzaIRaPfhK1KxdyDzeDzIX7H
   gwDYzA8vg5MJT7v3c4doLXQe8O6dxNDdsAiPoqtAJGiU4FgvUSlmq3IPu
   HZBRXH/rfe9De0npYCHW3gG9SJIZHXa1QfyZ/02uvsoQryznIqYDF5q5e
   A==;
X-CSE-ConnectionGUID: zTVLqto1RLO5ONvOBFEsnA==
X-CSE-MsgGUID: lWJY9m85Q4inJAsPIt+Wkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73612286"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73612286"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 14:46:56 -0700
X-CSE-ConnectionGUID: ++Sn9r0RQh6P1vHg0w53uA==
X-CSE-MsgGUID: aS0WHl24SSWbr3dSfoemUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="184849395"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Oct 2025 14:46:55 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6yTM-0001Vz-0o;
	Thu, 09 Oct 2025 21:46:52 +0000
Date: Fri, 10 Oct 2025 05:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 21/23]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb:
 usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202510100522.kx4u97qY-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   a2f12b1cbec103a836e3ddfde57084661591e4f3
commit: 247b0d6f62ea306ba9f6f39055253fe3893be729 [21/23] dt-bindings: usb: add missed compatible string for arm64 layerscape
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-051-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100522.kx4u97qY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100522.kx4u97qY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510100522.kx4u97qY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
