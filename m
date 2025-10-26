Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CBD126C02
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761470570; cv=none; b=TztkzvYffwmVzPSkxqbuOKtQx/kQ2d74uGg+ULgaXOqlKrbUooa4MQ4XAa7GSrrGmKDo5ZWC4ecb0fWD6XJCNXF4GB4yVTnZPzd+Prw45gmRsEPMMQU1dx/INp7euRLDxk5z8wXjtnE/9TO3R2EnjRCKt4JMGV5I/cL6ivjmNDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761470570; c=relaxed/simple;
	bh=0YcIwhazzPPbc0Y8NepdoZxeYdQ1873vu9kHZC7hMCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGVeio8iD2YTpY9vRPdowprXFr76CU0firSbgc29cGk0yeffp0W4cJp1jt87W9Kasr1fwVkwPVyCVmGXxgUbzGQABlhbGZBgvhPFKT2DQKNHb7QLuRvIRzUEvHvvEvtSePj6paVdc+qh4v5iNLFsoKcEYwJ81sZLbGUebEJvTNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqFbFvGi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqFbFvGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761470566; x=1793006566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0YcIwhazzPPbc0Y8NepdoZxeYdQ1873vu9kHZC7hMCw=;
  b=HqFbFvGiFBjN0ep6ABgC7s3I3i+hQVV0jH79IjoCrblZAvR1Vf7DW8y6
   sKWWIlcvO60d8PTDkkbasvYE+Qci+FQQYHcpQsidfPP2yxl4ERQ4vwkNV
   Pdcw9oFdY/amwRL9CtU0SQx9RxEcJ4YImNhLbXh8qLbMI4HEAy38bBcgJ
   rIt77nGfAKrbO+kCd6WU/N4uAewF1Wko+eZVHEuf558O55Q2HNf2QYJRZ
   60HI+SWW2C88waA381C3uUuwgTkFXihPiBcNCLDSl/rdC1n96ENF8gwwQ
   RN+qS2EYeVMtnVESnWBWEGEt7HW/8lpXpTT0yMHLMDyKGxb2KOod655ju
   Q==;
X-CSE-ConnectionGUID: LjxJcb5gQva8WVXGMQ28Yg==
X-CSE-MsgGUID: yLo5pRFiS8+PAyT22yWFOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74925547"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="74925547"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 02:22:45 -0700
X-CSE-ConnectionGUID: oAXIQD+dQh+KReLt0yHzlQ==
X-CSE-MsgGUID: BybAXLDYQ4C+5+latL1+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="189098926"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Oct 2025 02:22:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCwxW-000G1J-1C;
	Sun, 26 Oct 2025 09:22:42 +0000
Date: Sun, 26 Oct 2025 17:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] arm64: dts: exynos: ExynosAutov920: Add regulators
 for the USB
Message-ID: <202510261627.ci9x5sui-lkp@intel.com>
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
In-Reply-To: <20251024114845.2395166-3-pritam.sutar@samsung.com>
References: <20251024114845.2395166-3-pritam.sutar@samsung.com>
TO: Pritam Manohar Sutar <pritam.sutar@samsung.com>
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
CC: faraz.ata@samsung.com
CC: muhammed.ali@samsung.com
CC: selvarasu.g@samsung.com
CC: pritam.sutar@samsung.com

Hi Pritam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pritam-Manohar-Sutar/arm64-dts-exynos-ExynosAutov920-Add-USB-and-USB-phy-nodes/20251024-194927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20251024114845.2395166-3-pritam.sutar%40samsung.com
patch subject: [PATCH 2/3] arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20251025 (https://download.01.org/0day-ci/archive/20251026/202510261627.ci9x5sui-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261627.ci9x5sui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261627.ci9x5sui-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16480000: failed to match any schema with compatible: ['samsung,exynosautov920-usb31drd-combo-ssphy']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16490000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-combo-hsphy']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16500000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16510000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16520000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy0 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
