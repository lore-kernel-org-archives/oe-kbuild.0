Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858982DA741
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802622; cv=none; b=lcEodOTwrw0ZCvb+9Ng6KUq5A5v4gmPogF8lZicvk9WJb4j37PoAf/3Q56e0Mevctr94depmgI/UTXqCnRi9XYTFHwovN8oSDrEZ4Zyf5V2b6LJzEEf3Du0ZKoCuqeSQTkv1ZqUMcoyvarZH3HQoETXcDChrXnVWGNxouRFqO7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802622; c=relaxed/simple;
	bh=S3ldWhhlW7XBDNS9aFT1+cdka7fuUt4/1Gd5wssHJIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcyD80ZlLIoocB67bybcu+Lk/ZGftx+xKxZN9ASddoeOLdagAwCahlfLBiLYTzXOCV4Orjs/Z2k5l548hJQSnTDn7UZ0YGMXvpUrTCFU20+K7+lLCbJDuVrS5fxOpyCmmRdefHhgEJdnZ0O0dMsJbwMS3LKBSW9EofoekFaUkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSGyZ+lL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSGyZ+lL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749802619; x=1781338619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S3ldWhhlW7XBDNS9aFT1+cdka7fuUt4/1Gd5wssHJIE=;
  b=aSGyZ+lLAmMkW9J8OI7AAwbWJzGoD8/uB+D/+c1PVQmZgxlGuJ9VdI3m
   j2UFHWJQYsqYxgxqy+KkpSmHoyi89kw2G9JESyN2FJ3mEqiJXHneJ8THg
   a44705Xzrs4Stuu94KCf45RfGGax3JnRZa7Jbx3hqodgfFlCHFdDxaXRk
   +IN24g0QGm/Lk9sF8KOVwz0GtNo4MaD1eLdBUlK/4ydGHbIze2/kYm99P
   SmYBnn38k6VKdNg4Vfo+ZfOjVVP1UBqqSJvi3FjT0XW3+2AMVPGSNgSrl
   gL6N0Fppk7vJ4Q0yZiEHaUbzURvMg/MmRCrwMM17Ouhg113kVqBF+J5mT
   g==;
X-CSE-ConnectionGUID: oWd+o/FtR+6T+dGFnNnVtw==
X-CSE-MsgGUID: V9YvJPb+RJy/U5qAd4SueA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="77404982"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="77404982"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 01:16:58 -0700
X-CSE-ConnectionGUID: TDJYq3OHR7G2NKL/4UQu1w==
X-CSE-MsgGUID: FNR4wSiMQbyR7NEuxUqSJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148650497"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jun 2025 01:16:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPzao-000CMM-2T;
	Fri, 13 Jun 2025 08:16:54 +0000
Date: Fri, 13 Jun 2025 16:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/8] arm64: dts: apple: s800-0-3: Add I2C nodes
Message-ID: <202506131530.LAZ05I1W-lkp@intel.com>
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
In-Reply-To: <20250609-i2c-no-t2-v1-4-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-4-789c4693106f@gmail.com>
TO: Nick Chan <towinchenmi@gmail.com>
TO: Janne Grunau <j@jannau.net>
TO: Alyssa Rosenzweig <alyssa@rosenzweig.io>
TO: Neal Gompa <neal@gompa.dev>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Sven Peter <sven@kernel.org>
CC: asahi@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-i2c@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Nick Chan <towinchenmi@gmail.com>

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Chan/arm64-dts-apple-s5l8960x-Add-I2C-nodes/20250609-230259
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250609-i2c-no-t2-v1-4-789c4693106f%40gmail.com
patch subject: [PATCH 4/8] arm64: dts: apple: s800-0-3: Add I2C nodes
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250610 (https://download.01.org/0day-ci/archive/20250613/202506131530.LAZ05I1W-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131530.LAZ05I1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506131530.LAZ05I1W-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
