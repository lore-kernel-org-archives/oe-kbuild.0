Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E3B22154E
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 23:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741649222; cv=none; b=cAg1ivaT5w9hXD0Nksy7EES0N3jHSd3zpEAJDPPPIfA+tJJBIq1oeQClwqG2PefjDE4yj5M5A36cX3NO8g/489ng6TaUctgMXrrqMMqQ8t0EqV8iSaleP2MfzYVwlK4NHiJznWAEzsbKEaXw+dWUtmiAd0uROwZWcuw48xMNo8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741649222; c=relaxed/simple;
	bh=Qu9Pl1QNobO1AWNbMc7hLzk2e0nhbQLurU8PWut7bV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LIM+mGmdxioffZbAqquuVSYpq6vereTZAGRXkz2adtztZtFYYetPMUVQoPCYu+VmjGSRnDViHToRWevs6tjFcXaAkm4UW5Xpd6O2nd7SHOrnqXhy2/pRBMczHSIxwtvjxBVDZpZqf9l2/rXdMEs3un0Rm2nqbzhmdjhs9dTNiBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgTy+FQA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgTy+FQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741649221; x=1773185221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qu9Pl1QNobO1AWNbMc7hLzk2e0nhbQLurU8PWut7bV8=;
  b=bgTy+FQA2ptf0HtUdXUpBLe9FLsaSL8Iae5lWH7zlWG/hBvpxkffxwZm
   jrh9MRUFFSiQKyJme3eSdTHveTiGpBc8v8S1vFT300Y/FOr+ZRr5AhmdC
   /Y1rXjnLyGUZ0Fmw8D07dOeX0N4bsazlXqW0QBVurKIpwT8MX4hrR+CGq
   P7yc8C2EEIgyyN2UnzXDPo6VFrEUXvCVMhMzyxpjAKNeewXjjv7278i2F
   x8PF1yFrK9wU5MYPItew7p1kvFz8b968jvKdZTQ44frsThW7JPbSyFk42
   UK77EHe7yKQ8pyx2NGrAO3nHLWeFlUVvIw6AcMtEKiSqme2Qq0Ju5YqW7
   Q==;
X-CSE-ConnectionGUID: pk0Qk876QO2hMeE0S7/DlA==
X-CSE-MsgGUID: NbUtaC5WSwCof4Ue9573Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53658379"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="53658379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 16:26:57 -0700
X-CSE-ConnectionGUID: 7HHsP+k7TW2LHAh8fKMlOw==
X-CSE-MsgGUID: klCYWH3UQ5m7gdDzFQ6Krg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="125352966"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2025 16:26:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trmWL-0006B6-27;
	Mon, 10 Mar 2025 23:26:53 +0000
Date: Tue, 11 Mar 2025 07:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 71/89]
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/hdmi@27da0000: failed
 to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
Message-ID: <202503110703.n9Evw0xO-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   ba82f56bbf20e4166c988621cd0507509872848e
commit: ad0ea230ab2a3535b186f7fb863b4bca7050e06f [71/89] arm64: dts: rockchip: Add hdmi for rk3576
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250310 (https://download.01.org/0day-ci/archive/20250311/202503110703.n9Evw0xO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110703.n9Evw0xO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503110703.n9Evw0xO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1942.20-2008.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/hdmi@27da0000: failed to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: hdmiphy@2b000000: compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of ['rockchip,rk3588-hdptx-phy']
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: hdmiphy@2b000000: compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: hdmiphy@2b000000: resets: [[18, 428], [18, 450], [18, 451], [18, 452]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: hdmiphy@2b000000: reset-names:0: 'phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: hdmiphy@2b000000: reset-names:1: 'apb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: hdmiphy@2b000000: reset-names:2: 'init' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: hdmiphy@2b000000: reset-names:3: 'cmn' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: hdmiphy@2b000000: reset-names: ['apb', 'init', 'cmn', 'lane'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/hdmiphy@2b000000: failed to match any schema with compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1942.20-2008.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/hdmi@27da0000: failed to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of ['rockchip,rk3588-hdptx-phy']
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: resets: [[18, 428], [18, 450], [18, 451], [18, 452]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: reset-names:0: 'phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: reset-names:1: 'apb' was expected
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1942.20-2008.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/hdmi@27da0000: failed to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of ['rockchip,rk3588-hdptx-phy']
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: resets: [[18, 428], [18, 450], [18, 451], [18, 452]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: reset-names:0: 'phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: reset-names:1: 'apb' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
