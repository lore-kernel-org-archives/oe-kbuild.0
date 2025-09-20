Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607727B325
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 21:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758404087; cv=none; b=t9G3U0VFg5gq23eLv/Mu2Rq7ZExlbjlor12b1vBJGQ3G4RZQ9nN+bsv8os8lZHbbXkMIrmxixKTuWzB2upwXHUsEM8v+6rhCj4DoUBlUZB9laJeqIgiSU3bDM4cP0iXcROX2tVyz2rchIZnVHF0GmHhuFx0zi4gW/nZDtx8XPB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758404087; c=relaxed/simple;
	bh=SHXdolWk1vUnRlJ6o3qBFT3+f0072qGzpI4RqVpmHJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J37XvL8eamli36d3TYRpsvWNReWebN4c7ZxqhHlVy0tsbqk6P6wpxyYbenNrzQIYF9OYitBVe00HsJt5qMC9mzbeAtFzzbzuIDgbUzKIzASl2dThZq/JTvohFc9mFJL19SP3PZ7HG3bxTBtaHxCJqaQvVy3yy5A5SHYLDiJjkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uw35M1rf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uw35M1rf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758404086; x=1789940086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHXdolWk1vUnRlJ6o3qBFT3+f0072qGzpI4RqVpmHJ8=;
  b=Uw35M1rf4j4kyS80QTCuNDbwDdZtl8/0CPQAO6BvJpvBvm+yx6WQzPbX
   1inWXjxvR2xXpcr+VwUfhAT07kHuYxFVV3TJSvDZg2OlQJPX+yRB1VMmz
   uQf080xkKtm5D0nMubA6iIh3ZQeYKz0dKnDHhuYyeHLWgG3geUcnqOwAe
   E/HAdTnholGIl/M99yI39ilVkgD63N0utx+KPqU7F4cRLIBfsLw9uE+qN
   7n2pcxNg7z5H2Y+HfIfBEHIDvPicoiLtSol6t4jvn0QkN74keEApwdLBc
   DqkJKGZGEsD8KMvjxocoINfearpz8FT+n10Zr0Hhz61rmiWXAbw1vJ9hF
   w==;
X-CSE-ConnectionGUID: a2/7TEBNSm2ztnZEpMvBtw==
X-CSE-MsgGUID: c8Jg15yvT7Sirvkr06imXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="64355900"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="64355900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 14:34:45 -0700
X-CSE-ConnectionGUID: UsuYUQARRBWfyKkDNUcm2A==
X-CSE-MsgGUID: /lvYSEHWR5q61rt5yyQa8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="180160229"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2025 14:34:43 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v05E8-000000003UL-47IT;
	Sat, 20 Sep 2025 21:34:40 +0000
Date: Sat, 20 Sep 2025 23:34:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 4/134]
 arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a110000
 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of
 ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509202353.XuOHouqU-lkp@intel.com>
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
head:   00c6dc8272d302876034765e34843f6abc62219f
commit: fc876907e6a86b06499a0e67a1ca21389ba74b5d [4/134] arm64: dts: apple: s5l8960x: Add I2C nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250920/202509202353.XuOHouqU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509202353.XuOHouqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509202353.XuOHouqU-lkp@intel.com/

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
