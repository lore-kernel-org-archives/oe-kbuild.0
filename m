Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331F01367
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Sep 2025 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757144295; cv=none; b=oqIkVNFFRgmFRcvIwWczQd59Muk+H8n5CpvvhQRoYm7DKQWIzzOHMXZJx2L1aysz8W1DAPh36Av5NwgFMauzs/TH7zpvyZ2R8/+UytZWJSd+AUkxxYyHixLOMmYEGOEESDGeL9cL0C1wQx/Qq8JLlbaRpOC8Aqyg261c0IIXpeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757144295; c=relaxed/simple;
	bh=NzJkAJc2s+Q1Aaz6VJzgNsTAWgoP2cuAMLxmxFo4Z34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lkUab4BTCtbG1woPx4Fmxfr+dk9hBDW0pZx1DNMMStFlWJV0N+4FdAig9K6jOFx+fNHOVayFenzIFup/RFSU5TkteUsx6SK4zm6Ebh4oNyQJm6uawI0TcbaUzoTA3XXzb+qgtVP26wIsIHhOygTpQKq2DBA+mvslx9JYWSVZc2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUsXEXXH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUsXEXXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757144291; x=1788680291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NzJkAJc2s+Q1Aaz6VJzgNsTAWgoP2cuAMLxmxFo4Z34=;
  b=nUsXEXXHYrSb2ne6Vvp4ziqeAUJS2NAcihLfJXs5elI9r6WaFy+9tQ4C
   pxNo5GemqBcFjxR0ldlFzV4YlwFtIqRY2PlpSlpH7Rdm3UHp/GpCCfnrj
   wBqbENXPYP3PyUdZ/E/XHP8Yj2gIySzH91VeY8SxFcheRrn9MUqM7xfUy
   zycPnhqTm54ycO65c3cL4+M0Hs1X4wtnCCGe02Auzl5D7T47GWcXRYkcg
   asbHHpzUx9qzbOnlqRyZ00SZLKp9BHK8B/xRL3/AkTFd6k/f6/2sIk/42
   2mHHpb83+whCZ5nMqo80+RMYNt9QzdUgnC8DyfmoOCFqPyuNtojU/WEXG
   Q==;
X-CSE-ConnectionGUID: AI7DQjZqSWa13/gQmeQm1g==
X-CSE-MsgGUID: ks2Td6ZnRNSzOh8VuaVTdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="84918665"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="84918665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 00:38:10 -0700
X-CSE-ConnectionGUID: MYlkf0s5ReO5QPSmXq95Cw==
X-CSE-MsgGUID: dX9yS38vRmijC7iFzYfPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="172790077"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2025 00:38:08 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uunUs-0001Hd-0u;
	Sat, 06 Sep 2025 07:38:06 +0000
Date: Sat, 6 Sep 2025 15:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: exynosautov920: Add DT node for all I2C ports
Message-ID: <202509061520.mmPJom2q-lkp@intel.com>
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
In-Reply-To: <20250905092452.1782227-1-faraz.ata@samsung.com>
References: <20250905092452.1782227-1-faraz.ata@samsung.com>
TO: Faraz Ata <faraz.ata@samsung.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: alim.akhtar@samsung.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: rosa.pila@samsung.com
CC: dev.tailor@samsung.com
CC: Faraz Ata <faraz.ata@samsung.com>

Hi Faraz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Faraz-Ata/arm64-dts-exynosautov920-Add-DT-node-for-all-I2C-ports/20250905-172206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250905092452.1782227-1-faraz.ata%40samsung.com
patch subject: [PATCH] arm64: dts: exynosautov920: Add DT node for all I2C ports
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061520.mmPJom2q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061520.mmPJom2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509061520.mmPJom2q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108800c0 (samsung,exynosautov920-usi): i2c@10880000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10880000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108800c0/i2c@10880000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108900c0 (samsung,exynosautov920-usi): i2c@10890000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10890000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108900c0/i2c@10890000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108a00c0 (samsung,exynosautov920-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108a0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108b00c0 (samsung,exynosautov920-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108b0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108c00c0 (samsung,exynosautov920-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108c0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108d00c0 (samsung,exynosautov920-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108d0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108e00c0 (samsung,exynosautov920-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108e0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108f00c0 (samsung,exynosautov920-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108f0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109000c0 (samsung,exynosautov920-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10900000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109100c0 (samsung,exynosautov920-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10910000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109200c0 (samsung,exynosautov920-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10920000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109300c0 (samsung,exynosautov920-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10930000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109400c0 (samsung,exynosautov920-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10940000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109500c0 (samsung,exynosautov920-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10950000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109600c0 (samsung,exynosautov920-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10960000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109700c0 (samsung,exynosautov920-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10970000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109800c0 (samsung,exynosautov920-usi): i2c@10980000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10980000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109800c0/i2c@10980000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109900c0 (samsung,exynosautov920-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10990000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10c800c0 (samsung,exynosautov920-usi): i2c@10c80000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10c80000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10c800c0/i2c@10c80000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10c900c0 (samsung,exynosautov920-usi): i2c@10c90000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10c90000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10c900c0/i2c@10c90000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10ca00c0 (samsung,exynosautov920-usi): i2c@10ca0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10ca0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10ca00c0/i2c@10ca0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cb00c0 (samsung,exynosautov920-usi): i2c@10cb0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cb0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cb00c0/i2c@10cb0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cc00c0 (samsung,exynosautov920-usi): i2c@10cc0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cc0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cc00c0/i2c@10cc0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cd00c0 (samsung,exynosautov920-usi): i2c@10cd0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cd0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cd00c0/i2c@10cd0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10ce00c0 (samsung,exynosautov920-usi): i2c@10ce0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10ce0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10ce00c0/i2c@10ce0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cf00c0 (samsung,exynosautov920-usi): i2c@10cf0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cf0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cf00c0/i2c@10cf0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d000c0 (samsung,exynosautov920-usi): i2c@10d00000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d00000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d000c0/i2c@10d00000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d100c0 (samsung,exynosautov920-usi): i2c@10d10000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d10000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d100c0/i2c@10d10000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d200c0 (samsung,exynosautov920-usi): i2c@10d20000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d20000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d200c0/i2c@10d20000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d300c0 (samsung,exynosautov920-usi): i2c@10d30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d30000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d300c0/i2c@10d30000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d400c0 (samsung,exynosautov920-usi): i2c@10d40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d40000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d400c0/i2c@10d40000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d500c0 (samsung,exynosautov920-usi): i2c@10d50000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d50000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d500c0/i2c@10d50000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d600c0 (samsung,exynosautov920-usi): i2c@10d60000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d60000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d600c0/i2c@10d60000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d700c0 (samsung,exynosautov920-usi): i2c@10d70000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d70000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d700c0/i2c@10d70000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d800c0 (samsung,exynosautov920-usi): i2c@10d80000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d80000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d800c0/i2c@10d80000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d900c0 (samsung,exynosautov920-usi): i2c@10d90000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d90000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d900c0/i2c@10d90000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
