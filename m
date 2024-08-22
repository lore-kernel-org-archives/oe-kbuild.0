Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4A208A7
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Aug 2024 03:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298383; cv=none; b=LdV8d3EfpuQrRaIhek/UtOxhk8QjgdQb02Jn4MIkKlflD+aiwMto51fpgdp+1R9tBVf7HCLeO0ij3y+62zrWVYf7rL+LFux7fHnPobqDxevotReLxP5xoPzkbFI4Sty0gLg3gRipsuS/nUYM4gJgi/bcUyBRxu6lPzrAfzHxkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298383; c=relaxed/simple;
	bh=MnCHiGdA/bCgw1qiLJp3AQTXS4xxg440JBQsmXAVlyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3tvIml1QfoX1O9BZ0RiFkwqBdSPyGeYm29xsrYJ5DuWvWyv7/IO/3PBWWwr5CNjWc3bxUCifN5mZy7rn0++L6K4PiJR4T7NVNijsSXq3U5w/cbxEIYQ+fBhnvvBKfsy+hUM7m00/BMUweRDKHy5pu9mQUDMEMye5yEUPLN9dKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjRQSPsD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjRQSPsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724298381; x=1755834381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MnCHiGdA/bCgw1qiLJp3AQTXS4xxg440JBQsmXAVlyw=;
  b=CjRQSPsDc9KTnEoGONs0d/ApvyVTVpKjVD5Osf2fwPx9ByQTAoxUcAVJ
   IRlYHJUny9lE12HpheAP+gzI4DjfKX40SV59TDkd3tkSF7/xZDYplDyJv
   /sU4+BUqnL1jL29RFwzB4Kg8ALD4gB+rni51IvQCRJu0eZfdGsgwTFGSg
   qTT/Me6ZOTr2mv7nnous4NaQQ2gJm6Zl87NcsxMIAH9P/rS0d09qSgDtP
   XDn3SDqx+b4OgqMgW/sYRzuNPdsDpm25p8Bw8g3UUGEHoYdyI9US46oH/
   21arnmj33QW47vITk7ebtIHcKH8GbeNgj4pATtSnBffjGmLzorD+rKUwS
   g==;
X-CSE-ConnectionGUID: m3DBDYtARKWCe2Dx6YWJzw==
X-CSE-MsgGUID: DQIN1bqkS1i0OPJMkm+8Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40203749"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="40203749"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 20:46:20 -0700
X-CSE-ConnectionGUID: fNWHy12JRiG1AGZGSowXzQ==
X-CSE-MsgGUID: N9Rr9hzFRbyyrz+QKvTiAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61010857"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2024 20:46:19 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgym9-000CG8-0I;
	Thu, 22 Aug 2024 03:46:17 +0000
Date: Thu, 22 Aug 2024 11:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.12 86/89]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000:
 glink-edge:fastrpc:label:0: 'cdsp1' is not one of ['adsp', 'mdsp', 'sdsp',
 'cdsp']
Message-ID: <202408221115.kXnMznxS-lkp@intel.com>
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
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.12
head:   cad5b06c1fc71fe98272b26031b0560770094970
commit: b45af698d5114f9b666c7d8b58a9111d0526d7f7 [86/89] arm64: dts: qcom: sa8775p: fix the fastrpc label
:::::: branch date: 13 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-053-20240821 (https://download.01.org/0day-ci/archive/20240822/202408221115.kXnMznxS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221115.kXnMznxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408221115.kXnMznxS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:label:0: 'cdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@1:iommus: [[42, 10561, 1184], [42, 10593, 1184], [42, 10625, 1024], [42, 10689, 1184], [42, 10721, 1184], [42, 11585, 1184], [42, 11617, 1184], [42, 11649, 1024], [42, 11713, 1184], [42, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@2:iommus: [[42, 10562, 1184], [42, 10594, 1184], [42, 10626, 1024], [42, 10690, 1184], [42, 10722, 1184], [42, 11586, 1184], [42, 11618, 1184], [42, 11650, 1024], [42, 11714, 1184], [42, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@3:iommus: [[42, 10563, 1184], [42, 10595, 1184], [42, 10627, 1024], [42, 10691, 1184], [42, 10723, 1184], [42, 11587, 1184], [42, 11619, 1184], [42, 11651, 1024], [42, 11715, 1184], [42, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@4:iommus: [[42, 10564, 1184], [42, 10596, 1184], [42, 10628, 1024], [42, 10692, 1184], [42, 10724, 1184], [42, 11588, 1184], [42, 11620, 1184], [42, 11652, 1024], [42, 11716, 1184], [42, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@5:iommus: [[42, 10565, 1184], [42, 10597, 1184], [42, 10629, 1024], [42, 10693, 1184], [42, 10725, 1184], [42, 11589, 1184], [42, 11621, 1184], [42, 11653, 1024], [42, 11717, 1184], [42, 11749, 1184]] is too long
--
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@11:iommus: [[42, 10571, 1184], [42, 10603, 1184], [42, 10635, 1024], [42, 10699, 1184], [42, 10731, 1184], [42, 11595, 1184], [42, 11627, 1184], [42, 11659, 1024], [42, 11723, 1184], [42, 11755, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@12:iommus: [[42, 10572, 1184], [42, 10604, 1184], [42, 10636, 1024], [42, 10700, 1184], [42, 10732, 1184], [42, 11596, 1184], [42, 11628, 1184], [42, 11660, 1024], [42, 11724, 1184], [42, 11756, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@13:iommus: [[42, 10573, 1184], [42, 10605, 1184], [42, 10637, 1024], [42, 10701, 1184], [42, 10733, 1184], [42, 11597, 1184], [42, 11629, 1184], [42, 11661, 1024], [42, 11725, 1184], [42, 11757, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: label:0: 'cdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@1:iommus: [[42, 10561, 1184], [42, 10593, 1184], [42, 10625, 1024], [42, 10689, 1184], [42, 10721, 1184], [42, 11585, 1184], [42, 11617, 1184], [42, 11649, 1024], [42, 11713, 1184], [42, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@2:iommus: [[42, 10562, 1184], [42, 10594, 1184], [42, 10626, 1024], [42, 10690, 1184], [42, 10722, 1184], [42, 11586, 1184], [42, 11618, 1184], [42, 11650, 1024], [42, 11714, 1184], [42, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@3:iommus: [[42, 10563, 1184], [42, 10595, 1184], [42, 10627, 1024], [42, 10691, 1184], [42, 10723, 1184], [42, 11587, 1184], [42, 11619, 1184], [42, 11651, 1024], [42, 11715, 1184], [42, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@4:iommus: [[42, 10564, 1184], [42, 10596, 1184], [42, 10628, 1024], [42, 10692, 1184], [42, 10724, 1184], [42, 11588, 1184], [42, 11620, 1184], [42, 11652, 1024], [42, 11716, 1184], [42, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@5:iommus: [[42, 10565, 1184], [42, 10597, 1184], [42, 10629, 1024], [42, 10693, 1184], [42, 10725, 1184], [42, 11589, 1184], [42, 11621, 1184], [42, 11653, 1024], [42, 11717, 1184], [42, 11749, 1184]] is too long
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:label:0: 'cdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@1:iommus: [[42, 10561, 1184], [42, 10593, 1184], [42, 10625, 1024], [42, 10689, 1184], [42, 10721, 1184], [42, 11585, 1184], [42, 11617, 1184], [42, 11649, 1024], [42, 11713, 1184], [42, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@2:iommus: [[42, 10562, 1184], [42, 10594, 1184], [42, 10626, 1024], [42, 10690, 1184], [42, 10722, 1184], [42, 11586, 1184], [42, 11618, 1184], [42, 11650, 1024], [42, 11714, 1184], [42, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@3:iommus: [[42, 10563, 1184], [42, 10595, 1184], [42, 10627, 1024], [42, 10691, 1184], [42, 10723, 1184], [42, 11587, 1184], [42, 11619, 1184], [42, 11651, 1024], [42, 11715, 1184], [42, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@4:iommus: [[42, 10564, 1184], [42, 10596, 1184], [42, 10628, 1024], [42, 10692, 1184], [42, 10724, 1184], [42, 11588, 1184], [42, 11620, 1184], [42, 11652, 1024], [42, 11716, 1184], [42, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@5:iommus: [[42, 10565, 1184], [42, 10597, 1184], [42, 10629, 1024], [42, 10693, 1184], [42, 10725, 1184], [42, 11589, 1184], [42, 11621, 1184], [42, 11653, 1024], [42, 11717, 1184], [42, 11749, 1184]] is too long
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@11:iommus: [[42, 10571, 1184], [42, 10603, 1184], [42, 10635, 1024], [42, 10699, 1184], [42, 10731, 1184], [42, 11595, 1184], [42, 11627, 1184], [42, 11659, 1024], [42, 11723, 1184], [42, 11755, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@12:iommus: [[42, 10572, 1184], [42, 10604, 1184], [42, 10636, 1024], [42, 10700, 1184], [42, 10732, 1184], [42, 11596, 1184], [42, 11628, 1184], [42, 11660, 1024], [42, 11724, 1184], [42, 11756, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@13:iommus: [[42, 10573, 1184], [42, 10605, 1184], [42, 10637, 1024], [42, 10701, 1184], [42, 10733, 1184], [42, 11597, 1184], [42, 11629, 1184], [42, 11661, 1024], [42, 11725, 1184], [42, 11757, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: label:0: 'cdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@1:iommus: [[42, 10561, 1184], [42, 10593, 1184], [42, 10625, 1024], [42, 10689, 1184], [42, 10721, 1184], [42, 11585, 1184], [42, 11617, 1184], [42, 11649, 1024], [42, 11713, 1184], [42, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@2:iommus: [[42, 10562, 1184], [42, 10594, 1184], [42, 10626, 1024], [42, 10690, 1184], [42, 10722, 1184], [42, 11586, 1184], [42, 11618, 1184], [42, 11650, 1024], [42, 11714, 1184], [42, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@3:iommus: [[42, 10563, 1184], [42, 10595, 1184], [42, 10627, 1024], [42, 10691, 1184], [42, 10723, 1184], [42, 11587, 1184], [42, 11619, 1184], [42, 11651, 1024], [42, 11715, 1184], [42, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@4:iommus: [[42, 10564, 1184], [42, 10596, 1184], [42, 10628, 1024], [42, 10692, 1184], [42, 10724, 1184], [42, 11588, 1184], [42, 11620, 1184], [42, 11652, 1024], [42, 11716, 1184], [42, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@5:iommus: [[42, 10565, 1184], [42, 10597, 1184], [42, 10629, 1024], [42, 10693, 1184], [42, 10725, 1184], [42, 11589, 1184], [42, 11621, 1184], [42, 11653, 1024], [42, 11717, 1184], [42, 11749, 1184]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
