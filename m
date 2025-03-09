Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4792D78A
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741514309; cv=none; b=AW+yv28lklXYhSFQSRkesgFj9u5bRxowLS0JZ2HBxPsD1Z7tOTi8itGfYOPThow1OqyGdCaYAzxeX/2FJ1bfFfO+EGKXvUR8G2uqoPNOiEHsOIKHqyyBJ6+I44hOD4PA3VuCEt2QV7cUTd/pmhOhQwUlQ2obud3kVp9Q4ag8emM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741514309; c=relaxed/simple;
	bh=5DNZPNae0YB5z+VwDpSFi2DBvQ2Rxoq/55PcbDVAjS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XB/VRYeuMx+BrE7rPIEZSFM6wAr2YMa9En2GIHhOUYeaRmXgFyxL5HJdiRRWs0yNXY6j318gVI80YCdUxa5JTo5h+r0EDw3nfgfo3QJffnzBOaP9ZmXZA3qJVFkqWbgmcX3vnsIpCbqKKaVlALl7LGO78TDgR4lA9gpq3QEa1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hh4yYCfB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hh4yYCfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741514307; x=1773050307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5DNZPNae0YB5z+VwDpSFi2DBvQ2Rxoq/55PcbDVAjS8=;
  b=hh4yYCfBZDC8HgN1g6yfDmi2hKqrBxNZywbfP3Id7c6uQ105x4aba5Vm
   3+QSFHrLZ7G045Nu+y8E+RrHQ2C9gvzVTebqhxTH3/EvvGGJDeuv94yCN
   r49DIbYyULdTdz6afQrT1NWE86MNpkjt9MlikH/hMdGua4XmD2OvjEJFF
   MaCE/z4Xs0MvlmBj5nZQqPCYD+moRCSYMylxSSLrIKW346Zo985+Jpf/h
   N1zQKDNQ7R+3K4txzBY+4EyP5Ane+eZePmD4BmZqyPDZizdzvSs63y0/I
   mleckox2VsQhcIJkOciROr6HEjsrBg5Lih31QF64w7Nx5oypLuo9IN+8E
   g==;
X-CSE-ConnectionGUID: PboVQ3B1T5uZiXxhTn8UiQ==
X-CSE-MsgGUID: qtTAu/sVTHiW7ZHklDD3PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42736320"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42736320"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 01:58:26 -0800
X-CSE-ConnectionGUID: ShX1FG76QqipT85RdzJQ8A==
X-CSE-MsgGUID: 3hTYgSBRQLyk2297nbPY5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="142948509"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Mar 2025 01:58:25 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trDQM-0002yW-2q;
	Sun, 09 Mar 2025 09:58:22 +0000
Date: Sun, 9 Mar 2025 17:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 71/89]
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000:
 compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of
 ['rockchip,rk3588-hdptx-phy']
Message-ID: <202503091755.2vvRMWXK-lkp@intel.com>
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
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-052-20250308 (https://download.01.org/0day-ci/archive/20250309/202503091755.2vvRMWXK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091755.2vvRMWXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503091755.2vvRMWXK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1942.20-2008.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/hdmi@27da0000: failed to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of ['rockchip,rk3588-hdptx-phy']
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: resets: [[17, 428], [17, 450], [17, 451], [17, 452]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:0: 'phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:1: 'apb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:2: 'init' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:3: 'cmn' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names: ['apb', 'init', 'cmn', 'lane'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/hdmiphy@2b000000: failed to match any schema with compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1942.20-2008.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/hdmi@27da0000: failed to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of ['rockchip,rk3588-hdptx-phy']
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: resets: [[18, 428], [18, 450], [18, 451], [18, 452]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: reset-names:0: 'phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: reset-names:1: 'apb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: reset-names:2: 'init' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: reset-names:3: 'cmn' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: hdmiphy@2b000000: reset-names: ['apb', 'init', 'cmn', 'lane'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/hdmiphy@2b000000: failed to match any schema with compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1942.20-2008.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/hdmi@27da0000: failed to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of ['rockchip,rk3588-hdptx-phy']
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: resets: [[18, 428], [18, 450], [18, 451], [18, 452]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: reset-names:0: 'phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: reset-names:1: 'apb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: reset-names:2: 'init' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: reset-names:3: 'cmn' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: hdmiphy@2b000000: reset-names: ['apb', 'init', 'cmn', 'lane'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/hdmiphy@2b000000: failed to match any schema with compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
