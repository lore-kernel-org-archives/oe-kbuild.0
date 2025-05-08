Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704824B1E7C
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700250; cv=none; b=phkwnYR9SNR2tKgsEq7gmsjyQc54IPgoBQarktlBYIoWw4wA1qOUaNpBv15SdAStQE+Xlc4ze7Nrb9EPlX26Tm6L0dGo6fTN/L5mpUIJTNav011Oj4pyCbIJf7X8dlcz+pyrpX6rn6XFCpsDyGeSwCx+iiwUB17baBfjIK7KP0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700250; c=relaxed/simple;
	bh=7KR/QllfiM5hVxEMsFZSwDAlbw4IqYZbROmmyGA0b8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KBRzyRxx93mcT833z10TojLOGkDnpixqp5Grb1IR10I4aot3c7zZoBQEJz2oqBGSxQ2f5Yx46XlxxzHUBKmMSzW7P5/t0iH04kTdzGvKj8HJxChSPpRjzQVV4tBUokm/4o7i51yW2y0ViWkk9Hb/IAJvCNE70kZPg7/eMk3wE28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsoyKFFA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsoyKFFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746700248; x=1778236248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KR/QllfiM5hVxEMsFZSwDAlbw4IqYZbROmmyGA0b8o=;
  b=jsoyKFFAqyWGN+LRwqXBcy7YPMRVEQ0SkvCEvknAQpj+4vN+ZecdRMxu
   Bjst1C4xNHaGzrUV8s8VWGUXMr1tozHki6QKxdBUgwTlhsO08Uh28DZ64
   8LRzbC9TxEfW55wg32cSG0igG91nYVN66XmA17sofaDJ2p0cozzFydfOG
   ZnKDQGU4nYJK0kUs5ZEBbucFrRp6qRQbq5lKnW/23puHbCBSXBSH7dc1j
   qVHaGQ45ewnJhpu1zEQdqDUx90uBfFQB3S8qG8jP6FfOznossRXz7f27f
   /UZHHRE9/8fDp4k8QT2Bt6Bqm+4slw0We4mIO/jO/oqlFJP12RcHu7EB4
   Q==;
X-CSE-ConnectionGUID: GJpcw5fHR5WG7AUNfU5CiA==
X-CSE-MsgGUID: fCWyqi9hQcq8ZTmVoDk2tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58677335"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="58677335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:30:47 -0700
X-CSE-ConnectionGUID: UC1V/9sdRCOneWvTJaCPZg==
X-CSE-MsgGUID: CPMU9rIBQ8GIcW12dHTnVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="159562111"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 03:30:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCyWZ-000Arz-0G;
	Thu, 08 May 2025 10:30:43 +0000
Date: Thu, 8 May 2025 18:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: serial: Convert arm,sbsa-uart to DT schema
Message-ID: <202505081819.ErYsK7Bc-lkp@intel.com>
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
In-Reply-To: <20250506220016.2545637-1-robh@kernel.org>
References: <20250506220016.2545637-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus krzk-dt/for-next linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-serial-Convert-arm-sbsa-uart-to-DT-schema/20250507-060357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250506220016.2545637-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: serial: Convert arm,sbsa-uart to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250508 (https://download.01.org/0day-ci/archive/20250508/202505081819.ErYsK7Bc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081819.ErYsK7Bc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505081819.ErYsK7Bc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-1: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-2: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-3: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@60080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@a0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@8,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@400,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@408,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@c0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: serial@602b0000 (arm,sbsa-uart): Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/arm,sbsa-uart.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7030000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7020000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa_cpld@78000010 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sds_ctrl@c2200000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/mdio@603c0000: failed to match any schema with compatible: ['hisilicon,hns-mdio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
