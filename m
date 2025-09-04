Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42478AD2C
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Sep 2025 01:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950202; cv=none; b=aMXtSEl89lRJ+7ZoL6+JMg+VJfpAFgS3XfxNY/3YosfDUEGC9SRxw+tn7UJBNR6cHHvpBrOgQ5YZ6HoXP6s1SWagcHPyf9kLgfx24rSp2V8dW+ikjqSLbs8YydWiyf5S/u/rKtw1FtsmH9Uloc9E7qXRMA7kN6Z9nW9/13u+C8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950202; c=relaxed/simple;
	bh=j/kE/OjK8fjJN9NiNc7yD3pF0ko4UigdkaBzGKhDFmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ze4+GFXaWQLTucDYFGp2VIn3l2+yUSX2deZzb2k1Q6cSIA4pKLXhU7S2fZ264whkWKoX4I3UMvpOZjoUPW10lS5bbT5M8jDu+YJElYzonB7oHDUWb85i2BLMdp2vzdJAgFQ5aYHp/pxcyboBCvz0ofOlsYb3nt55vhmIGg4n9iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWhybTdy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWhybTdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756950199; x=1788486199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/kE/OjK8fjJN9NiNc7yD3pF0ko4UigdkaBzGKhDFmc=;
  b=MWhybTdyGrX1iiNlvvyo1canjnciNyKoG9yfyMMggfTAI6mgYSRDGWPO
   ZEXRcsMJRLD2tss8WUuuWhhpWRIJFmngU5+Z31bpMFQK+z5F6iSVq1eC/
   qxyZV/q8tK18S1N0YJvJmU+GX2BH+p2QHYJ13/izZ7RYFhRX1INhVxtEW
   nts9vVqsUF4vYRsdI3PDLEsBZrmjrXyUF2aaJq9jSIRwfsSY2Ls/hGxZ3
   PpE5e7jPaZNeN1xNBAjOJAsHhpx98R5f5IkvAKokVwvGu4CcVVmV6kULS
   9rD33pjoLVNF20U1IGX9nw6JYlqvR6D42dBIn5EmOj6OCUdp918AD8uxf
   Q==;
X-CSE-ConnectionGUID: a5BYxTFtRrGv/ooSGxpX0g==
X-CSE-MsgGUID: 4mEOTC9UQiOUcrSBNHPFoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="46851597"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="46851597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:43:18 -0700
X-CSE-ConnectionGUID: SNDXmVnyQle8NN502JEe4w==
X-CSE-MsgGUID: oi1iXVTMRS+vK1M2BUmBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="171682771"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2025 18:43:17 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utz05-0004aJ-1n;
	Thu, 04 Sep 2025 01:43:07 +0000
Date: Thu, 4 Sep 2025 09:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <202509040906.uzMPLnbm-lkp@intel.com>
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
In-Reply-To: <20250903145334.425633-1-hendrik.hamerlinck@hammernet.be>
References: <20250903145334.425633-1-hendrik.hamerlinck@hammernet.be>
TO: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
TO: dlan@gentoo.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: alex@ghiti.fr
CC: skhan@linuxfoundation.org
CC: linux-kernel-mentees@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Hi Hendrik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on spacemit/for-next]
[also build test WARNING on next-20250903]
[cannot apply to spacemit/fixes linus/master v6.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hendrik-Hamerlinck/riscv-dts-spacemit-add-UART-pinctrl-combinations/20250903-225649
base:   https://github.com/spacemit-com/linux for-next
patch link:    https://lore.kernel.org/r/20250903145334.425633-1-hendrik.hamerlinck%40hammernet.be
patch subject: [PATCH] riscv: dts: spacemit: add UART pinctrl combinations
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-051-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040906.uzMPLnbm-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040906.uzMPLnbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509040906.uzMPLnbm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-0-cfg:uart0-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-1-cfg:uart0-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-2-cfg:uart0-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-0-cfg:uart4-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-2-cfg:uart4-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-0-cfg:uart5-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-2-cfg:uart6-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-0-cfg:uart7-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-0-cfg:uart8-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-0-cfg:uart9-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-2-cfg:uart9-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/dma-bus/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k1-pdma']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-0-cfg:uart0-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-1-cfg:uart0-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-2-cfg:uart0-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-0-cfg:uart4-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-2-cfg:uart4-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-0-cfg:uart5-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-2-cfg:uart6-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-0-cfg:uart7-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-0-cfg:uart8-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-0-cfg:uart9-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-2-cfg:uart9-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/dma-bus/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k1-pdma']
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-0-cfg:uart0-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-1-cfg:uart0-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-2-cfg:uart0-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-0-cfg:uart4-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-2-cfg:uart4-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-0-cfg:uart5-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-2-cfg:uart6-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-0-cfg:uart7-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-0-cfg:uart8-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-0-cfg:uart9-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-2-cfg:uart9-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/dma-bus/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k1-pdma']
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
