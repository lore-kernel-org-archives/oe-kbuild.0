Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A20614F9DA
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720701629; cv=none; b=I8z7v6WrfHrgUc/pCZ1mXh7nTPeUBtqWkst41gxAYs57zOIOi9ZIv5N8541i+J9Fz01gdV9fmC2eKrZsbmZKzAFtA7gVbASRjepBAusxtio6PVvIFq69TtTbYDKSFsocDRW1V9jfjlZ2HnrHTnBVprs+iCCbT6SRWYR0aPQS9Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720701629; c=relaxed/simple;
	bh=BoIvqPu0jUrE2Ytr7cska23OF7zuB7UixHrucEglGKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YcmI5eqae4mlxkJAWx65Uafqj6D6OoC2tx3opSHRL2gWlLdgLcq9+gDCxUvDnSx/xIE5cnzAX2MeGLPuqWa4CUbYvwmZvsY3pZ7qKYTw09ehWGeVkWM3S/koThl/k/Lydz5nGzZgsgah6HwtTCrODBJ3XzbgWGdwJPQd6pi3Cj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrMEDXBd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrMEDXBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720701627; x=1752237627;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BoIvqPu0jUrE2Ytr7cska23OF7zuB7UixHrucEglGKM=;
  b=jrMEDXBdd/yT0K1GPNUFitrji1L2rhMDD6x0ZJ4kpRsBEkcnzJt/2DQb
   8wsolD3Y3CQt808/xGRi3GLDYa2SIylh2iKsVPNOzC3UOcpCE6S+SBv+c
   zdtVOtrRuXmFgfKDE9k2bLt67vMx5K+UQMQ6PDz65gMGQeF+BiAor7WxE
   IHdQ8t5fxQA7O0m7zCLN3f5NDvrQkpoR+9vfhKg3+/1aZBvbZLf2z58YS
   u9rLT+KWlDf9y/bAv0uSXncOdTn0soz3lsVbJ6z1giH0KOEs32MYHG6RW
   nckfMtgcLp3LbCbi+iHzbrte2Qr7oRNLB2aEK6JaJE1j/UDFKEt97AJFZ
   A==;
X-CSE-ConnectionGUID: 2I3jYubtTPSE/WDfCS9unw==
X-CSE-MsgGUID: iK0aF+wXRaG+uC63ecsbJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12498270"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="12498270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 05:40:26 -0700
X-CSE-ConnectionGUID: 8tZEK+/rRv2nUXtR1UqXVA==
X-CSE-MsgGUID: c8wokbrpRXimKjVPyikTNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="79257739"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jul 2024 05:40:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRt5y-000ZGc-0n;
	Thu, 11 Jul 2024 12:40:22 +0000
Date: Thu, 11 Jul 2024 20:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 4/4] riscv: dts: sophgo: Add LicheeRV Nano board
 device tree
Message-ID: <202407112038.JcYFDCra-lkp@intel.com>
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
In-Reply-To: <20240711-sg2002-v4-4-d97ec2367095@bootlin.com>
References: <20240711-sg2002-v4-4-d97ec2367095@bootlin.com>
TO: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Chen Wang <unicorn_wang@outlook.com>
TO: Inochi Amaoto <inochiama@outlook.com>
TO: Chao Wei <chao.wei@sophgo.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Samuel Holland <samuel.holland@sifive.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "Miquèl Raynal" <miquel.raynal@bootlin.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d20f6b3d747c36889b7ce75ee369182af3decb6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/dt-bindings-interrupt-controller-Add-SOPHGO-SG2002-plic/20240711-181709
base:   d20f6b3d747c36889b7ce75ee369182af3decb6b
patch link:    https://lore.kernel.org/r/20240711-sg2002-v4-4-d97ec2367095%40bootlin.com
patch subject: [PATCH v4 4/4] riscv: dts: sophgo: Add LicheeRV Nano board device tree
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: riscv-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407112038.JcYFDCra-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112038.JcYFDCra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407112038.JcYFDCra-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: timer@74000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'sophgo,sg2002-clint' is not one of ['canaan,k210-clint', 'sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'starfive,jh7110-clint', 'starfive,jh8100-clint']
   	'sophgo,sg2002-clint' is not one of ['allwinner,sun20i-d1-clint', 'sophgo,cv1800b-clint', 'sophgo,cv1812h-clint', 'thead,th1520-clint']
   	'sifive,clint0' was expected
   	'riscv,clint0' was expected
   	from schema $id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/timer@74000000: failed to match any schema with compatible: ['sophgo,sg2002-clint', 'thead,c900-clint']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
