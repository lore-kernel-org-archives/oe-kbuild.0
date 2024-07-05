Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8478248D
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 21:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720216032; cv=none; b=MGjy+ijicx494QNbGr7r/dh6gM/gZGXIp8K/VItv4DPZUalwOHrLmvNae+hGrv4zJ8JkQH+FVVDmW7exfXhqMQGNfRJxkNRuffvjiK0OwubNfJBuAO89LawluIzJqThiOJOuhtFdUPrNP4nnANJfrIPU36cEIPes2+vq3owbhZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720216032; c=relaxed/simple;
	bh=9FFY07VAs/gI+7HvLgV8i7NBN9Ui/sK1Z8qVp2VT78g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzJWXETVoWBpUBbZy1wsjDl7N5Nb60N+pv/WWOuss8rrU7GRs0IRvzlNA+0x/jeDJeHm+XX4GembAwYVXyvuMUWkcfPlgLcKy8cbjb1zN3/8WuDBLfCj9Wz9FF32gnT7Zj13Ix4iplmbfD/LKHzsM+Jp+WgXS2ojK7BWJzbqfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIxg0xjQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIxg0xjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720216031; x=1751752031;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9FFY07VAs/gI+7HvLgV8i7NBN9Ui/sK1Z8qVp2VT78g=;
  b=fIxg0xjQEpkkyoTy5QQ+I6tJ0R8FmlU1/yGUzEvTJPlyXfEvwXm8k5u+
   ywdwMrPvhj+GReyErxYLMRXudy6gmej/IF3gV8rgL8S1o0YRE16KiK/yl
   quLP+CN5okPQ1dMrOh+ukWp/0z28fCBjMFBqCcDig0i1atoVjb1gY5d6b
   IT8gteMZo26yDyv2ByueMh/UojbarxMAmHgjx230fBVp8lOePqstP+Wg2
   XLh+z7ztXOxynyP7bm6Q46VEOnPeXA3gGFVKcIcCF9bczhQzzn+Trnkv3
   iK5Lix2LM/PJjl38nUkox9CpAhDQSrr3XJAODQsm72diB4GaZI30VCcpb
   Q==;
X-CSE-ConnectionGUID: LH1hm3pyQi+28xEnl2FYOQ==
X-CSE-MsgGUID: oXb0V6jTSaKdy1ijIs65wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28664202"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="28664202"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 14:47:11 -0700
X-CSE-ConnectionGUID: AF/5BzFVRrGyb/dd3tn+sA==
X-CSE-MsgGUID: cp/QZ7FUTiWobFnpz7x7WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="46853436"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jul 2024 14:47:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPqln-000Sve-01;
	Fri, 05 Jul 2024 21:47:07 +0000
Date: Sat, 6 Jul 2024 05:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: Add SARADC configuration
Message-ID: <202407060502.EVSm1IyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240705-sg2002-adc-v2-3-83428c20a9b2@bootlin.com>
References: <20240705-sg2002-adc-v2-3-83428c20a9b2@bootlin.com>
TO: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Chen Wang <unicorn_wang@outlook.com>
TO: Inochi Amaoto <inochiama@outlook.com>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "Miquèl Raynal" <miquel.raynal@bootlin.com>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d20f6b3d747c36889b7ce75ee369182af3decb6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/dt-bindings-iio-adc-sophgo-cv18xx-saradc-yaml-Add-Sophgo-SARADC-binding-documentation/20240706-040736
base:   d20f6b3d747c36889b7ce75ee369182af3decb6b
patch link:    https://lore.kernel.org/r/20240705-sg2002-adc-v2-3-83428c20a9b2%40bootlin.com
patch subject: [PATCH v2 3/3] riscv: dts: sophgo: Add SARADC configuration
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: riscv-randconfig-051-20240706 (https://download.01.org/0day-ci/archive/20240706/202407060502.EVSm1IyM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060502.EVSm1IyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407060502.EVSm1IyM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: adc@30f0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['sophgo,cv18xx-saradc'] is too short
   	'sophgo,cv18xx-saradc' is not one of ['sophgo,cv1800b-saradc']
   	from schema $id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: adc@502c000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['sophgo,cv18xx-saradc'] is too short
   	'sophgo,cv18xx-saradc' is not one of ['sophgo,cv1800b-saradc']
   	from schema $id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
