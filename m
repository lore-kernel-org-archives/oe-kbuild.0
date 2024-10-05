Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0323A17C8D
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 03:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728100137; cv=none; b=DdvF2CS7r+DEaHQUMIZFY09vNjlPm4t0jZMf8qf+yfgcl/tBN/Sz8p3pME0s6i15FkoXhQmePPTovqDqu194wUyfiFLspI1NXNXjElpeOXbRHWxvWjr1LKnCrrlA1neMreKA1k6pCPMtVE4pso49YQEOckyMNh2e221wcSEqYAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728100137; c=relaxed/simple;
	bh=5OAADuhHAeX8j44Kesv8C/YL2RcfqnbP1n39fsPPHvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMh/1HlbRy6UZ/Ll0rAKYwTvQDb6bJkhp493wvetHnB1SfoJIa//wagjSbyhSR4Hcdd5sqJ1GxzbsOjqKVXAP88In6BRnVSlLqJ5h9jpmqdTUH7jof+HTYjyeBZcDRCFg9PrPEUhBcewUK+2h73pmDvheRRodFUvwsNoSf6zImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmMr4dRj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmMr4dRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728100135; x=1759636135;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5OAADuhHAeX8j44Kesv8C/YL2RcfqnbP1n39fsPPHvA=;
  b=UmMr4dRjbrpuk51CX6Y3pfT9Nr+jPfu0chyMdYlmtuCia4sr1gwWH34H
   aPAOMPhsJGI7FG0lzeiWmKIyaiV2EZrQM14+VlK8qJYcCE6KogzVuTPJw
   JntkCjoSmLwgRvt6bUC/sVsrz1HfSlHm6RnO0Rw2SNSZW2dKdI+MITJy6
   TkAn9MER/oFyrmHKB/d3JWaMHwYZa/Jq3L7ZYy/8slNiXCOIJ1pCX7KUp
   PuiDRWvVXWSW/2frdoENcog5pXQHGyub8YbJlCV0b6dNTd6wcenlRnR0J
   zKoOv/qDMxpe/anincmtEqDrvLIWK5dhEwO6fbkGxXbqvu9wANoBjO3ru
   g==;
X-CSE-ConnectionGUID: Lr7HgiiqQhe8NxZXh0PP8w==
X-CSE-MsgGUID: XotXF2YDTpSeJ+p9ns2SZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27137542"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27137542"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 20:48:55 -0700
X-CSE-ConnectionGUID: 2nFRdaPURW6ybawzGMow3g==
X-CSE-MsgGUID: PWTNBWtQShW901Z3nRnZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74577674"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Oct 2024 20:48:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swvml-0002X0-1I;
	Sat, 05 Oct 2024 03:48:51 +0000
Date: Sat, 5 Oct 2024 11:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCHv2 2/5] arm64: dts: bcm4908: nvmem-layout conversion
Message-ID: <202410051106.xL9umYa2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241004000015.544297-3-rosenp@gmail.com>
References: <20241004000015.544297-3-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: devicetree@vger.kernel.org
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>
CC: William Zhang <william.zhang@broadcom.com>
CC: Anand Gore <anand.gore@broadcom.com>
CC: Kursad Oney <kursad.oney@broadcom.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: "Rafał Miłecki" <rafal@milecki.pl>
CC: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Gregory Clement <gregory.clement@bootlin.com>
CC: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rosen Penev <rosenp@gmail.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Christian Marangi <ansuelsmth@gmail.com>
CC: "(open list:MEMORY TECHNOLOGY DEVICES \(MTD\))" <linux-mtd@lists.infradead.org>
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on mtd/mtd/next mtd/mtd/fixes linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-qcom-ipq4019-use-nvmem-layout/20241004-080423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241004000015.544297-3-rosenp%40gmail.com
patch subject: [PATCHv2 2/5] arm64: dts: bcm4908: nvmem-layout conversion
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-001-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051106.xL9umYa2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051106.xL9umYa2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410051106.xL9umYa2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts:149.4-30: Warning (ranges_format): /bus@ff800000/nand-controller@1800/nand@0/partitions/partition@0:ranges: "ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi:119.6-314.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi:600.19-603.6: Warning (avoid_unnecessary_addr_size): /bus@ff800000/nand-controller@1800/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +/ranges +149 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts

0d7760f230b468 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts  William Zhang 2024-02-22  132  
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  133  &nandcs {
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  134  	nand-ecc-strength = <4>;
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  135  	nand-ecc-step-size = <512>;
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  136  	nand-on-flash-bbt;
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  137  
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  138  	#address-cells = <1>;
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  139  	#size-cells = <0>;
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  140  
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  141  	partitions {
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  142  		compatible = "fixed-partitions";
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  143  		#address-cells = <1>;
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  144  		#size-cells = <1>;
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  145  
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  146  		partition@0 {
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  147  			label = "cferom";
c8b404fb05dcfa arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts Rafał Miłecki 2020-12-08  148  			reg = <0x0 0x100000>;
839ba976f64ee8 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts  Rosen Penev   2024-10-03 @149  			ranges = <0 0x0 0x100000>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
