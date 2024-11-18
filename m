Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62558ECF
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 05:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731907329; cv=none; b=EGjovzb769R3gZYmGmrYi/doryJfIZy1/IUef5aLNaWGNh87EcHdSS/k3zkvjf4MVWTa31/Xo0L8iptp5tIYwODRyV0hGM+2HYnfbYbLl3ckUs/O98BwUGLTccw+KctQyUXGaRjVcqSlS+7Al8tAse9sjTdrB4wviuzkTcVWyFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731907329; c=relaxed/simple;
	bh=dJh3paUSGXDCH6T324hheLAe8whKKK/mkvjBbTy+u5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbHIqyn97j0p33EITK3FvQTB94AXYWRNqd0JwENdbYKc0ymW1sKWfpmGE6eW3x0yietOffrjBIx1tA/IWaoleOaav4DKe1CaXZnJMCWGFLEf1k3sJNMorNe8XBXMP0PT8BxBt4gLuBRspXsLweSG16Rk2v7h0bpp+QAZ/VZyOjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxS1VUW+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxS1VUW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731907328; x=1763443328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dJh3paUSGXDCH6T324hheLAe8whKKK/mkvjBbTy+u5g=;
  b=OxS1VUW+2wxui6ptBPZvBomj4SUlo4VwlHwpTB+2831TDiInUdIMOspI
   m/XA5mqpLzKIr0D7ugAGmyGLGSI0EiNkngRLXwMHJig8OuaA0LPkLIwwP
   N1cN7x1ddgmzVToOd5cOc8A+QW2U4GytFFMxxwJ2ltyXJHpkRXUBvCI/9
   Gb/huFZwJLnWjwfxKG6GkC1y/64PAZ09+qu3rUa4jBilhNWjDV/H5+akX
   hzPENn9I3ZeR9wL+cqrgSHOTEZ8m84twjYVqCkO4UkiaI/BNIIZ58oMP1
   DAzn6Ji+1pqKdZfuDK6Vvjhpy/dceXgNy95tcJNf+VZt+Jqkyhh0Vkt+3
   A==;
X-CSE-ConnectionGUID: jp2hpq47RtqWExwKbWJizA==
X-CSE-MsgGUID: DMUG8xOlQdKlVoM+Pk9GlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="19457268"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="19457268"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 21:22:07 -0800
X-CSE-ConnectionGUID: kcxPzxvDT/Ckvr6gfwMhxQ==
X-CSE-MsgGUID: SRxSKKrGTPO7loBagyZgFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89244500"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2024 21:22:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCuD5-0002HN-2S;
	Mon, 18 Nov 2024 05:22:03 +0000
Date: Mon, 18 Nov 2024 13:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RESEND] arm64: dts: apm: Remove unused and undocumented
 "bus_num" property
Message-ID: <202411181324.FoCHNzLG-lkp@intel.com>
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
In-Reply-To: <20241115195049.3637454-2-robh@kernel.org>
References: <20241115195049.3637454-2-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: soc@kernel.org
TO: Khuong Dinh <khuong@os.amperecomputing.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-apm-Remove-unused-and-undocumented-bus_num-property/20241116-235839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241115195049.3637454-2-robh%40kernel.org
patch subject: [PATCH RESEND] arm64: dts: apm: Remove unused and undocumented "bus_num" property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241118/202411181324.FoCHNzLG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181324.FoCHNzLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411181324.FoCHNzLG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a000000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a200000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a400000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: mmc@1c000000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/gpio@1f63c000: failed to match any schema with compatible: ['apm,xgene-gpio']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/gpio@17001000: failed to match any schema with compatible: ['apm,xgene-gpio-sb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mdio@1f610000: failed to match any schema with compatible: ['apm,xgene-mdio-xfi']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f610000: failed to match any schema with compatible: ['apm,xgene2-sgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f620000: failed to match any schema with compatible: ['apm,xgene2-xgenet']
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: i2c@10511000: Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
