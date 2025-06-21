Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1476034
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jun 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750525226; cv=none; b=ODXkA68vXpxm/sr5/nN+48lRkKrfINVw9VbkJXRXhdAQWc6RLSV1woZ1vrCzPCcWipGwpJ619BITOpaZrSC3Jehwhh1wEpg+Sp3io52XdIIEXtuLb2zHLRcqbXoaOi3WXu3IcB0eXiwz2N8qZfzTjGP2p4T+cziK/Q/WErEXEqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750525226; c=relaxed/simple;
	bh=1pDUcxs4VtDjzkcPVGu9NCaX82pfCQLChTQ3G2L3hY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7IVEocgzSsn+aUY9aLGTqmkPRKPNRrah7YsTQiDb6cZymAPj6gsPwvP2l7fKI5/hOHrT2kux76XNt61LN5DvlQqnyFUMyPHj1hyNWnAwZuOdgveXmXKypBThvuMRd2GQC4SQQvdbz5bgb5HqZLzXTaQRswNfpnrIp8lNlYhVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZ9nHisR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZ9nHisR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750525224; x=1782061224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1pDUcxs4VtDjzkcPVGu9NCaX82pfCQLChTQ3G2L3hY4=;
  b=iZ9nHisRJ38YOleVFg5zAADE4oGS3wbhVPw/h2gvwIPNoIk9C8BTLCuE
   dXGBWPWxAovrpSf4edT44bp95KWY+qcDdUNn9yylqnyqu1sYBt80n1Wv2
   DAoS/27oGw+kxP1xYea3hysKH4puipZM0aSq+TK/Ssy3qbKPcV+BYI3lI
   rxilUOgO8eIzPJiUtPwmA3DlIs8yi60A9GSNEMRnAS9OoIyU5XVft6Qku
   vLY9nacl7DjqqcbJD/6Kl2C4QavQyyEsxuYC8k7T7OdopPjNr7cJ9ygfh
   2cqoXtNUWUfNRaMvZIMy6yS5UmIrT8YvY+5ijhTO5CisWEkpdscUk4qJ7
   g==;
X-CSE-ConnectionGUID: 5XPkZJUeQ8OZJS8wfN/esQ==
X-CSE-MsgGUID: Njw3QZSIQzKLQUykldVjfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="51880933"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="51880933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 10:00:22 -0700
X-CSE-ConnectionGUID: NN7o3qSAS9qO2nDieGynaw==
X-CSE-MsgGUID: BCq5zk3ATnKjHb1ikJ6bXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="188410482"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jun 2025 10:00:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uT1Zi-000MkM-2D;
	Sat, 21 Jun 2025 17:00:18 +0000
Date: Sun, 22 Jun 2025 01:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
Message-ID: <202506220029.wqaAci4X-lkp@intel.com>
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
In-Reply-To: <20250621034401.586780-1-dinguyen@kernel.org>
References: <20250621034401.586780-1-dinguyen@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: robh+dt@kernel.org
TO: krzysztof.kozlowskii+dt@linaro.org
TO: conor+dt@kernel.org
CC: dinguyen@kernel.org
CC: devicetree@vger.kernel.org

Hi Dinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dinh-Nguyen/dt-bindings-net-convert-socfpga-dwmac-txt-to-DT-schema/20250621-114611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250621034401.586780-1-dinguyen%40kernel.org
patch subject: [PATCH] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: loongarch-randconfig-051-20250621 (https://download.01.org/0day-ci/archive/20250622/202506220029.wqaAci4X-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506220029.wqaAci4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506220029.wqaAci4X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): 'bus_id' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): compatible:0: 'snps,dwmac-3.70a' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): phy-mode:0: 'rgmii-id' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): 'bus_id' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): compatible:0: 'snps,dwmac-3.70a' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): phy-mode:0: 'rgmii-id' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
