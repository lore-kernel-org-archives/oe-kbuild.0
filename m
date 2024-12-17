Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E6C84E1C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 02:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734403433; cv=none; b=B1VqE9LMVJIhChkyTPK0r2ywWjzguioTNZTiiCeBO67tyG1LJlKgHtoBg+smB1MUirCsMAT5KHqvJtGB8vjkFyWHY2AzU06k2AfzQlpylLN22jG0qC+fv4kJ2b/Cbcw0nAcuGGCIYP7EQYvKppS1DsD9eSsV2BzR/WrUILChnkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734403433; c=relaxed/simple;
	bh=fKn6l/0oHEtiK1CRvvXtZcsBIU6w2i/O3EA7JLGjiH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nfCU7oeORb0CRsE7sfX3VYxYmAfvNg7y0t+9wkulYVBndn7aJxTQvSlZMOOzU1KWNLUePZShGwQPDBDYzNslekSp3ZiQN2+/PegRlkVA0Y1Izg8Zs3q1r/JiT5EsQhikrBmEZopGCWE8zkeF2IqPAsaoqdKeYZnjHZxTeRPOgI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USW5cA1y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USW5cA1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734403432; x=1765939432;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fKn6l/0oHEtiK1CRvvXtZcsBIU6w2i/O3EA7JLGjiH8=;
  b=USW5cA1yQx0va9nuFpclQYTaSovPGBM/5MqBmN2d2siUki2Mdr+a/kjb
   NG1VqjvtIk07AM39fdEti+6kIrAH6H6aSgtlS27Rp2ScnF/f53e5lzZb2
   tpmPGncgxJ+EAkFYjptglMlR0mns/vnPwScpYgSqFdZHcuys/dTFq4tTv
   D6tCpl65UDIQeesgG5gsaNLGkQypcsGVSgarQsfZCGI0H4jnm+VSXsqpL
   Wi3ux0vFqCRTixlDZVAVY1x67691N9tJu1cavQJCnKTwqxkQxHPw7yXpV
   fC1Ah44RjsX98jE5sb5u1mBB81HgbnvXbUVmGJJkdwop0/U/Zd5rIhbw8
   g==;
X-CSE-ConnectionGUID: nPr/YFGkSI+2Mut9JxM5SQ==
X-CSE-MsgGUID: awEuGChiTHKmdWDbZWF72w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46209101"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46209101"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 18:43:51 -0800
X-CSE-ConnectionGUID: RZVl/vbTTJKp7HhDqJM3Cg==
X-CSE-MsgGUID: v32JQXQLS/qZCS5711WqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="97295498"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2024 18:43:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNNYp-000Eeq-1n;
	Tue, 17 Dec 2024 02:43:47 +0000
Date: Tue, 17 Dec 2024 10:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 27/187]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema
 with compatible: ['apple,j274-macaudio', 'apple,macaudio']
Message-ID: <202412171011.tSFyCyDv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   5553f8f1fe2a6f02eded3969869311b465aeb258
commit: 98ede3ed179db03789953777432b719cca16d60d [27/187] arm64: dts: apple: t8103*: Put in audio nodes
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241217/202412171011.tSFyCyDv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412171011.tSFyCyDv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412171011.tSFyCyDv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000: iommus: [[100, 0], [101, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema with compatible: ['apple,j274-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema with compatible: ['apple,j274-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000: iommus: [[100, 0], [101, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
