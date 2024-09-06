Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3F153598
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Sep 2024 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725625094; cv=none; b=ME3WQ+7PUiJOTH+/j4FkIZdmhUwefj9LG6u5OmosaWJisaPntdkvCdzqtrXHHl+SxS+RUtTbXOBg9C6NwYyQhhUt3B0UQVfPt3puWlw9mYRVj1sqiEhw9r/l464BkFpeycggAvZPCuXh0BFxF39vg2rrvdjrPGjuvAYS/4+iSb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725625094; c=relaxed/simple;
	bh=cwOVUP/yqp/r0jyB258BTAeYzbYePt7oaIHKdCy9JOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ckDiGMEEYHQMK036xenHuj4gy2ph8C+D4wG4cLr/L6ANqzMaw0Ms/MAvH1VA+5fbZH579k9z/W0x85FJ9AWqaKan33V1QjxGWgOZT4RUw2k1F2IjWBCKSVVvpquGyciSKnb3P3mRQhgL3lp2+6FGtqml2amPSabdaHsX77DutsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHxYuWJ1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHxYuWJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725625092; x=1757161092;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cwOVUP/yqp/r0jyB258BTAeYzbYePt7oaIHKdCy9JOs=;
  b=nHxYuWJ1vAiSXNGR1ZMKXiXauMu6XVlS2Ce5UsTdVY8W7hVmhOXw1cT1
   mDElciGfB4+OoWPR2UV0MEhQZV1eu39+xSNvGa0MPV0Y4uPHOlyfqyErY
   jy9lfH1i6ztD6kes1WdVIF56c3jJekxV8ep1nUgbFJfrrE/KokVQpM/F8
   AMtXDm08ChYsTtfeaVfn6zqltHTnMWjVogMIHdUtt1VjAsyA9GCgm2dpQ
   krqTVncHfcE5iwQJPriwbw4goCc13LPcqzVzYluqIS2PKSmDZcbGuqx2A
   KK3LdDSfbeN+VrY+ciWBEnl8cZXglsNgraR4yzR/P/bjhSSmkNMSZI0F5
   A==;
X-CSE-ConnectionGUID: y9HeXvwUQSKy8pdxuUdcKw==
X-CSE-MsgGUID: aiA0SPAQQxSLy7NboXKttQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49795990"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="49795990"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 05:18:11 -0700
X-CSE-ConnectionGUID: kYPcI/JSRe+6zdrmA3hzag==
X-CSE-MsgGUID: oEiWl7BOQFuJr/IymXm8JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70354036"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Sep 2024 05:18:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smXui-000BAd-0i;
	Fri, 06 Sep 2024 12:18:08 +0000
Date: Fri, 6 Sep 2024 20:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:renesas/dt-2 54/58]
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef0000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202409062041.2Ff9SEQj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: "Niklas Söderlund" <niklas.soderlund+renesas@ragnatech.se>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hi Niklas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git renesas/dt-2
head:   cc41aa93bbafdfe4c4c9026d307adbb89c1d80fa
commit: e9f351d67d59cc4d7797c802afb92a7a2071abde [54/58] arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-053-20240904 (https://download.01.org/0day-ci/archive/20240906/202409062041.2Ff9SEQj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409062041.2Ff9SEQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409062041.2Ff9SEQj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1191.12-1201.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1220.12-1230.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1249.12-1259.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1278.12-1288.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1307.12-1317.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1336.12-1346.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1365.12-1375.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1394.12-1404.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2516.12-2526.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2682.12-2692.7: Warning (graph_child_address): /soc/isp@fed30000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef5000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef6000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef7000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ef9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6efa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6efb000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6efc000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6efd000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed5000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed6000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed7000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ed9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6eda000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6edb000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6edc000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6edd000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ede000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6edf000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
