Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D41320CA9
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758299219; cv=none; b=nO00LwOiWVD52rQVcRvSnCrNn/gnYeMRrBEhSdJKFxMlVSY9gbfZ7Y03/Sd9Iu1CLeLiehxeriyn5GsHfR5BklEzildG3F02H1LDPcDl6dx7TxwBMcZP63RQLFvhUIl3Re04sog0Hg1KeNqLsQNKJt6jMRjfECc1n/1MFzwqlCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758299219; c=relaxed/simple;
	bh=Bp5bgXFN739Na3ogOjYJ1pwxj8b1h6/jfwJoYe455Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y712ETrhg3Z7ieL3N1TFEyceYJk8qokATBOmJhJJyjldUyAeBP3viol5YLgLNSglBsBBpuefyUtGXtNh7VYXvrAsFhsaM9IBSuPwDbVBFCMQXcON8Snd0Y0h05s9vU+9cAHYJLAIwo5DTrhzjCnbQjiC0sHhC19FP0QHaxD2fWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjlzoS3n; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjlzoS3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758299218; x=1789835218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bp5bgXFN739Na3ogOjYJ1pwxj8b1h6/jfwJoYe455Hw=;
  b=YjlzoS3nsTS5etSokUBawtg5RA8VPDpY5vWu/mngScsCuMb55C1zUXKf
   GZG4/T6hlxTKuHHEZ8hsXS3Irj/DugToQMhdqz+wJUYM9QoTJDHXliuS8
   gx5G6QPMzdK6I/1+Yfz4eAuiAMUXhnjI1ZZRjNxw/9KWIZe+1cnBFMfcD
   3hfkZAz+K3eYRjrLQPkQ4PS9MVuMvbaXfPRyfPgJ+/cZUDmhJgjZ67nEa
   eBzpff55dDf0AZvg7SSVaPkEO+M8iaZAi6bC9k0Q6tEvb/Zxa06Ao5lCu
   ZerYz5+ZPkgV8eoMiA58eLpLYl6YeX6JcD21KwxBqHjHD+lrRhpjAC5Zj
   g==;
X-CSE-ConnectionGUID: OfwQIy7BRWu2+6hzyHAm2g==
X-CSE-MsgGUID: ulzccW2qRXuRgpPzx4mv3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="60536551"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60536551"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 09:26:57 -0700
X-CSE-ConnectionGUID: PcdHsHaoQjmbbTNxcoekiQ==
X-CSE-MsgGUID: Ew/jxTZrQ72mObHOzQIBzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176315043"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Sep 2025 09:26:55 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzdwj-0004Ud-1r;
	Fri, 19 Sep 2025 16:26:53 +0000
Date: Sat, 20 Sep 2025 00:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 23/28]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb:
 /soc/syscon@20002000/pinctrl@204: failed to match any schema with
 compatible: ['microchip,mpfs-pinctrl-mssio']
Message-ID: <202509200043.Up7o8gD8-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   69c073cdb60f2e13a617eb5db437dd667a4d424d
commit: b630f3bae528e7525e6603700f9916343edda6f4 [23/28] pic64 pinctrl progress
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-052-20250919 (https://download.01.org/0day-ci/archive/20250920/202509200043.Up7o8gD8-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200043.Up7o8gD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509200043.Up7o8gD8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-mssio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
