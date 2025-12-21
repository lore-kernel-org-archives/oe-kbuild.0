Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2D2D5C9B
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 23:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766360895; cv=none; b=NekZ5ZEr81F6yJjMqErmjI4zkFycMUGcwBBNpfI8EobVF1eK1uIFwAfEqCD0S+KYqHHPzev9tgEbGt3Tu78WZFMgaUUlGDxeX/4fmfUtBdY8FELpfuTb/w1LAr7R/Qw24dEqDoVG67ZMMR3KSbUxEyDgtBF0WmwrPa8UKNHnxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766360895; c=relaxed/simple;
	bh=/euKzwrrDiJnIwRdOVZPdi24a11p8X7+AdeoyqeSgSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jl/GTsX9Xz6bHMRtuh64t1NOzE6c2DLMgLMkwKBsxOWVXKi2vfZK5YetwGI2/gPfulY81oG9w7lXUPvHjmwO2pC49ieU2QIedMpSwDsdLW9ASudHqUshUNMyrWk84ssIzU0maZm9WQpqxLIa7+1jcK6B6FbOxwVdKMP3hzoXOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvwvfzVh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvwvfzVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766360892; x=1797896892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/euKzwrrDiJnIwRdOVZPdi24a11p8X7+AdeoyqeSgSU=;
  b=JvwvfzVho0td+TJfkvU4B91KcqQtcHucnuYD/9patwG3YauzjSRxmvtQ
   T4MjDng7WNCW3gaEQoZUnoz9sIUPHcumaPvMy+sGFqmtQ0a7PeJBGSHg6
   KfnAxk9EPZef7KdRpcYp+OVQMjjxyvgX7lbhtaJ2kL9DsbH+vGQQlSBzq
   XBXICKujDNBBe7KBUX3CtxFmmZFYI/UQvG/ko8GQo2hNj2e7nR2T3KBE0
   G8XjQCmsX/z/1POt5DQn1tlcKaLJfQI3zmZMogNiROaaeRGZpVLkGZxES
   c3rPys0IXOxHaDfp1jYNflcGkXRJvyyN6pucMbXTHdNvE7IRXEpTuOC1H
   g==;
X-CSE-ConnectionGUID: c80tkmn2QnebCyPzaytqOw==
X-CSE-MsgGUID: uJEiHxq0RLi4P6rsBUMzGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55798477"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="55798477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:48:11 -0800
X-CSE-ConnectionGUID: OWqES7liRPeng4oTaI30Gg==
X-CSE-MsgGUID: po/hbc7rSfq51GCCZrB/LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199029719"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 15:48:10 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXT9j-000000005HQ-2wo9;
	Sun, 21 Dec 2025 23:48:07 +0000
Date: Mon, 22 Dec 2025 00:47:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pic64gx 4/23]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: ethernet@20110000
 (microchip,mpfs-macb): resets: [[1], [4]] is too long
Message-ID: <202512220054.10SLc2G1-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pic64gx
head:   0ce5da1309c9906802f7948ae7009dc402b85924
commit: 260779d87ee82b539e82b47379f7eba9758fbb52 [4/23] riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: riscv-randconfig-2052-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220054.10SLc2G1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220054.10SLc2G1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220054.10SLc2G1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:254.27-259.5: Warning (unique_unit_address_if_enabled): /soc/clkcfg@20002000: duplicate unit-address (also used in node /soc/syscon@20002000)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:461.27-473.5: Warning (resets_property): /soc/ethernet@20110000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.27-487.5: Warning (resets_property): /soc/ethernet@20112000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: ethernet@20110000 (microchip,mpfs-macb): resets: [[1], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: ethernet@20112000 (microchip,mpfs-macb): resets: [[1], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:254.27-259.5: Warning (unique_unit_address_if_enabled): /soc/clkcfg@20002000: duplicate unit-address (also used in node /soc/syscon@20002000)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:461.27-473.5: Warning (resets_property): /soc/ethernet@20110000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.27-487.5: Warning (resets_property): /soc/ethernet@20112000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
>> arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: ethernet@20110000 (microchip,mpfs-macb): resets: [[1], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: ethernet@20112000 (microchip,mpfs-macb): resets: [[1], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:254.27-259.5: Warning (unique_unit_address_if_enabled): /soc/clkcfg@20002000: duplicate unit-address (also used in node /soc/syscon@20002000)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:461.27-473.5: Warning (resets_property): /soc/ethernet@20110000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.27-487.5: Warning (resets_property): /soc/ethernet@20112000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: ethernet@20110000 (microchip,mpfs-macb): resets: [[1], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: ethernet@20112000 (microchip,mpfs-macb): resets: [[1], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:254.27-259.5: Warning (unique_unit_address_if_enabled): /soc/clkcfg@20002000: duplicate unit-address (also used in node /soc/syscon@20002000)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:461.27-473.5: Warning (resets_property): /soc/ethernet@20110000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.27-487.5: Warning (resets_property): /soc/ethernet@20112000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: ethernet@20110000 (microchip,mpfs-macb): resets: [[1], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: ethernet@20112000 (microchip,mpfs-macb): resets: [[1], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:254.27-259.5: Warning (unique_unit_address_if_enabled): /soc/clkcfg@20002000: duplicate unit-address (also used in node /soc/syscon@20002000)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:461.27-473.5: Warning (resets_property): /soc/ethernet@20110000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.27-487.5: Warning (resets_property): /soc/ethernet@20112000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: can@2010c000 (microchip,mpfs-can): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-can.yaml
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: ethernet@20110000 (microchip,mpfs-macb): resets: [[1], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: ethernet@20112000 (microchip,mpfs-macb): resets: [[1], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:254.27-259.5: Warning (unique_unit_address_if_enabled): /soc/clkcfg@20002000: duplicate unit-address (also used in node /soc/syscon@20002000)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:461.27-473.5: Warning (resets_property): /soc/ethernet@20110000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.27-487.5: Warning (resets_property): /soc/ethernet@20112000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: ethernet@20110000 (microchip,mpfs-macb): resets: [[1], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: ethernet@20112000 (microchip,mpfs-macb): resets: [[1], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:254.27-259.5: Warning (unique_unit_address_if_enabled): /soc/clkcfg@20002000: duplicate unit-address (also used in node /soc/syscon@20002000)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:461.27-473.5: Warning (resets_property): /soc/ethernet@20110000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.27-487.5: Warning (resets_property): /soc/ethernet@20112000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: ethernet@20110000 (microchip,mpfs-macb): resets: [[1], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: ethernet@20112000 (microchip,mpfs-macb): resets: [[1], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:254.27-259.5: Warning (unique_unit_address_if_enabled): /soc/clkcfg@20002000: duplicate unit-address (also used in node /soc/syscon@20002000)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:461.27-473.5: Warning (resets_property): /soc/ethernet@20110000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.27-487.5: Warning (resets_property): /soc/ethernet@20112000: Missing property '#reset-cells' in node /soc/clkcfg@20002000 or bad phandle (referred from resets[0])
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: ethernet@20110000 (microchip,mpfs-macb): resets: [[1], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: ethernet@20112000 (microchip,mpfs-macb): resets: [[1], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
