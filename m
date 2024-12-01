Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135401D79A7
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075342; cv=none; b=PXWTvrjZyT6dAcAgta6jPItliu8i7yTFEfLDvLOvDf/AOLnkjScd5bEQtNPFj6SfgzyFWpx0crXgK3/2m+AsyLgRfCxM3oock/N/pldqrLaAx8qQ+3S/FE4hQMBWwbJtVO40T5GNN1WaG3AM5jo96AcDCTMEZ8iUhF3ysraRm5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075342; c=relaxed/simple;
	bh=DD5SCHXgXGHcSKp02YycaOH4VdxWsLUmVO9nF6xxQRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c8vd/QBttRzxeNyhdLs+aIiu1Gu8N37WUnDd5nGii4cqIufD9CYznrGg1QWm8R7TDjoGh/rJheqBZfOwqaHvC7Sh73C+1soDDeHx8KlwPeWqPDS8MhJRyLYm9lipq1OxTcMd4WUInCoNNqiIsiXz5wTeCt5lC7J80QSPGVr7TQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIQAzpqy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIQAzpqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733075341; x=1764611341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DD5SCHXgXGHcSKp02YycaOH4VdxWsLUmVO9nF6xxQRk=;
  b=CIQAzpqyfICDP/coyHlTLuoiidTA67d3DX6jAtK1NzupFBwJxKjjG+YY
   3iFTrrWz7cWUheN6dCqGl2KM5pf8EDebuCxx3BHOSKA+4kFSAVTxi8tq3
   qgGJaue/aklRcSbR3FcKM7zH9t2FozMByWNwNAhKhofrwwAR3z+yz1ADf
   ZkpkcKiwpXVhtAwWjwQpM0pB0D8u/6mGGhax6KQicCXkvygrDkKCY+8k8
   uyNfYGp4ATIXlkotMEiJMfns6jofViK13J/uxz7Z5B1Jmg5dntsJzXC+F
   mUuV8s1MTCNMPXLBDFho6WquPuVdR8WK3zzEACMpqcDRYP3Ug50EWVFzV
   A==;
X-CSE-ConnectionGUID: DQnSUkAMSmW3Nm6IRkaLFQ==
X-CSE-MsgGUID: TClpoRBtRPSAFVmsFh3KoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44284877"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="44284877"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 09:49:00 -0800
X-CSE-ConnectionGUID: 1gsvupKAQhCGvJR/X/YC9w==
X-CSE-MsgGUID: D2qU5iX/Q/mLb/LMCtzOMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97865570"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2024 09:48:58 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHo40-0001jl-0x;
	Sun, 01 Dec 2024 17:48:56 +0000
Date: Mon, 2 Dec 2024 01:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 12/15] ARM: dts: microchip: add support for
 sama7d65_curiosity board
Message-ID: <202412020111.9lrRBVyT-lkp@intel.com>
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
In-Reply-To: <7877f8c4cce78de34a6bdcc13fc78f5f0ebde06b.1732030972.git.Ryan.Wanner@microchip.com>
References: <7877f8c4cce78de34a6bdcc13fc78f5f0ebde06b.1732030972.git.Ryan.Wanner@microchip.com>
TO: Ryan.Wanner@microchip.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: nicolas.ferre@microchip.com
TO: alexandre.belloni@bootlin.com
TO: claudiu.beznea@tuxon.dev
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: arnd@arndb.de
CC: dharma.b@microchip.com
CC: mihai.sain@microchip.com
CC: romain.sioen@microchip.com
CC: varshini.rajendran@microchip.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-mmc@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-spi@vger.kernel.org
CC: linux-serial@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on soc/for-next linus/master v6.12 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Wanner-microchip-com/dt-bindings-ARM-at91-Document-Microchip-SAMA7D65-Curiosity/20241121-132438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/7877f8c4cce78de34a6bdcc13fc78f5f0ebde06b.1732030972.git.Ryan.Wanner%40microchip.com
patch subject: [PATCH 12/15] ARM: dts: microchip: add support for sama7d65_curiosity board
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241202/202412020111.9lrRBVyT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020111.9lrRBVyT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412020111.9lrRBVyT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
