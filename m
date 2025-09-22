Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8027081C
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758546210; cv=none; b=nsEszL8/53K6bWBv0bRo3XdGcZO1pAA1fyVNsBqRIbq/zf98GrxINu1CTy7USXvLfjbjABI49pnJmjqAS2kN4d/Q/dNlfEM/5rE5rje+/wI3GPDEsc5I6B7mtPS+L65+myxXae/ZhsYCQWqXcjJfss4QKZgs+InMF/EL0XGtweo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758546210; c=relaxed/simple;
	bh=VOdQ4tkjkgITv6x2qYjayllnNo21yO2qSBFnOih2Kow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihayNhmNiSU2WhIkwXGUELEoBWn2w6SlpzFniqlkRDSdF7KJZ6KcbFawCBh4wbGzXqq2UrnLfCHZnEAKA5XsBlCp9E+IenWR1NbgzZC6mgyS6VzmR8W7ukk7aCpPqmoF4jz5/pZYBwiZrtUIZ1KDcjQusQUofHLEim3f3zLJoCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCI0UkKX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCI0UkKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758546208; x=1790082208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOdQ4tkjkgITv6x2qYjayllnNo21yO2qSBFnOih2Kow=;
  b=KCI0UkKXOqvC12KSfiSSByNj1FP/dRMu9wUuixorsE1AZE80thdm/Brr
   Ptzt8YWRvrRi5G6idkkw7ZlVoJfXL1ze0l5YIKGNJfLSp8NZJSi2OD6pS
   Egb2u0b3yk/1EbvZ74MIZMFdAQdiF79aWEgCKlfeg7ekWOVqTeyMVYPzH
   y0RmKERN5y3xAE40RKsAKu9VNcHjq1TvlnrKlps8TfK8zkd/MGTFTT2n3
   Jjdj6alviKXRm7RkZLVhWNWRXpxQKS5iKm+uT21tQWhxXP+fjfqP0Pbi3
   5RvK3u8FK1BTiDg0BK8iQTfcX0WR2cc5o+YD/ejGFNvIrTPFzbIRE0J4P
   g==;
X-CSE-ConnectionGUID: 4FyTdYg+Rg6RyoZys2KIPg==
X-CSE-MsgGUID: KVJ+DHlBRRuNkjekEp86OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64445931"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="64445931"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 06:01:57 -0700
X-CSE-ConnectionGUID: N0rZYqOHSGGYS/+or6bFgw==
X-CSE-MsgGUID: dhmnvUXUQZyFROwCKO/ZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="181619215"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 22 Sep 2025 06:01:55 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0gAy-000000003mb-1jDv;
	Mon, 22 Sep 2025 13:01:52 +0000
Date: Mon, 22 Sep 2025 15:01:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 11/140]
 arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e200000: failed to
 match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
Message-ID: <202509221510.KioM1nUV-lkp@intel.com>
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
commit: 55c1cf8feecc1cce2203fcd6433548e213a3fa6b [11/140] arm64: dts: apple: t8015: Add I2C nodes
:::::: branch date: 25 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250922/202509221510.KioM1nUV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221510.KioM1nUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509221510.KioM1nUV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
