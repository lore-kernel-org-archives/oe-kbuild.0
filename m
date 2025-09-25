Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B6D21ADA7
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758789337; cv=none; b=KIYacvAgFByFFL9FkpZBjeeO9oZWYUb8FyvNDLCcCGyqmRPoGr6CV23JABo0Q8UvsWTMbD2t07rJaK1bPjK2X5jyNOyjBSN+AhU2jcUHCItgTBZBpu4bWTRmTQt/7+YK20NgE9jxFrDnnH2jI5nrKXvBH9qOLew5HXMW94RWKaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758789337; c=relaxed/simple;
	bh=F0Ea1Z+5NE4XVS2R1nIXqowalSUVu/XYmdA8nNMXfDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0Zl7TxERiBSIMfZAtx/ogKH/DRkDPp44Mc3HjmkNYKvR8xgG6aD55ULI2ztjZ+z/BmVEOjlAXWsAxgpTKuXIqBK4aU7oW5V6qbjJt/H8b5MOziUujE/wPO379Yw19fOR6Vo6W4cBVKr0hV/YQ5KMojdMqX7BSdloGWad/q4MZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2eQQWBz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2eQQWBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758789335; x=1790325335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0Ea1Z+5NE4XVS2R1nIXqowalSUVu/XYmdA8nNMXfDs=;
  b=N2eQQWBzg5jf7SORLdbBcQhDC/vYjaw9d7qZXDt1XgqV9NXmB3N58FYs
   8OlyGOPNxDSdpBAzH5NVNOiholFXsemhtpaGK0IjUO7UNB+aPu13pKln8
   G26Ffpo47DYZabH3DN4gEmfQdTPM+ndIpcmOikWnzM8IDfzK5oRRDF89A
   rBZdwihgPzdV/qAu4XwAt7JOn+AOSj3cj4AZFOTnkUVhsmkEtzhPU1P2v
   gJT9NfuJ6gBFMLidLA/CVWaD2phFWB55Mky0HIKJLPlFadUiRbhzpB5+L
   SomFbyeKhI0+MQ07+ndSLuXt3Yy4FQNBcl3bECd5uwdPbfJrGq/+tA9Gu
   w==;
X-CSE-ConnectionGUID: KBAznPkVTQitKuUOXbVo2w==
X-CSE-MsgGUID: r6g9RmM3SLi/FVnxTAKjOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="83708767"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="83708767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 01:35:35 -0700
X-CSE-ConnectionGUID: zmyPLFtYRfykXXdDLG/QQw==
X-CSE-MsgGUID: It4u11A9Rfqj3mplyg8B4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="208211489"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2025 01:35:33 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1hRr-000000004oz-0jvn;
	Thu, 25 Sep 2025 08:35:31 +0000
Date: Thu, 25 Sep 2025 10:34:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 4/140]
 arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a110000
 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of
 ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509251012.yJ1grFRL-lkp@intel.com>
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
commit: fc876907e6a86b06499a0e67a1ca21389ba74b5d [4/140] arm64: dts: apple: s5l8960x: Add I2C nodes
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250925/202509251012.yJ1grFRL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251012.yJ1grFRL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509251012.yJ1grFRL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
