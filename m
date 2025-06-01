Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050A2DCBF9
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Jun 2025 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748802942; cv=none; b=SBTZtSWEGXjth7GTi8iDvcoFPh2swVKRnpbAnHAxvyc3/w9gmbkvv8yqCkW+IwIhiknQ8Xx/gMf2PW6pT/vzTENVs1e4ethF/zOKuwBJgm01fzgeAqGsCl0TnvYjJnzaADhimXUgp98hr2g+y2f/liodu7Oxy7rSjLkdrTIp9rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748802942; c=relaxed/simple;
	bh=Go/PDGO9WryrGp0mBf82qLtpCczsj1rmdhoCZdI0kxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIWr6DX6Gif0so8BYqrnD8N0mOQZ8IJaWK8eI+MmIomIGGx/VuKzZGovaBmp45V4nwwvzQS7o3TMgJQ47Rf4e/0J+ZQgd9R5A2Xya2bsT261MLASGeLnbt5QWS+DcqWrz+bxs/QS9C5LtxAFmG3YmspjorJF2/VZeqYa7ngs5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4JGBHpO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4JGBHpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748802937; x=1780338937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Go/PDGO9WryrGp0mBf82qLtpCczsj1rmdhoCZdI0kxk=;
  b=a4JGBHpOAKoHEkypSyosDsyThRlerqV1OidiSwZ340wOHiYbYA9lzMrb
   jezM30OuQmEiQ4b2C88nzWDPQQxJJTUKR2yHkoqlM/pIfV6dsWokDY5fh
   nk1G9iVACzQ1MV0+7hZtXviI0ZcdZw0TUGwXr4mZTDlHo5Scb2wiyssqZ
   3E8SU2g2579zQS/B8UYHToKwj2f4dyDo1MEfBUYoDCJbPNP1Zu37OHLtI
   kMxo2jbePhteNFVygbDxrX7EdQjZuSSMvAUVkox8STeynzcVedN8NsT37
   rXMTFeAvItW25rbCmZaK8H0SabxJDbS/R4eTcUfaISiqsKd7Hi43BnTN/
   g==;
X-CSE-ConnectionGUID: TVvV3jNLTNOHPGWmIHpV5Q==
X-CSE-MsgGUID: k+cBWb7eQrCZfOULptwREQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61494391"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="61494391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 11:35:36 -0700
X-CSE-ConnectionGUID: LhZDyXghSKWS6RX+4f7zGQ==
X-CSE-MsgGUID: usS+/2tpSaagCvK/QKkqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="181541985"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Jun 2025 11:35:34 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLnWt-0001BO-2l;
	Sun, 01 Jun 2025 18:35:31 +0000
Date: Mon, 2 Jun 2025 02:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:rzfive-cache 2661/3677]
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: cpu@0 (arm,cortex-a7):
 qcom,acc: False schema does not allow [[8]]
Message-ID: <202506020230.2kQBDZHB-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git rzfive-cache
head:   b3de5943f1834862cdd3ebfaf45ced907e808ece
commit: 333ff6b5b1a80ca3ec5542ccbe3736d240ca7f86 [2661/3677] dt-bindings: arm/cpus: Add schemas for "enable-method" dependencies
:::::: branch date: 3 weeks ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-2052-20250523 (https://download.01.org/0day-ci/archive/20250602/202506020230.2kQBDZHB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506020230.2kQBDZHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506020230.2kQBDZHB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[12]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[13]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[14]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1535.14-1566.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1096.21-1144.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1162.21-1216.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1535.14-1566.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1096.21-1144.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1162.21-1216.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1535.14-1566.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1096.21-1144.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1162.21-1216.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1535.14-1566.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1162.21-1216.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:334.26-337.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:359.26-362.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:379.40-382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:389.40-392.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:424.41-427.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:439.41-442.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:464.41-467.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:489.41-492.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
   arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dtb: / (qcom,apq8084-sbc): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:334.26-337.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:359.26-362.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:379.40-382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:389.40-392.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:424.41-427.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:439.41-442.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:464.41-467.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:489.41-492.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
   arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dtb: / (qcom,apq8084-mtp): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:132.9-135.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtb: / (alfa-network,ap120c-ac): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:132.9-135.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac-bit.dtb: / (alfa-network,ap120c-ac): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac-bit.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac-bit.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac-bit.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac-bit.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac-bit.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac-bit.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac-bit.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:132.9-135.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dtb: / (8dev,jalapeno): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:132.9-135.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1-c1.dtb: / (qcom,ipq4019-ap-dk01.1-c1): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1-c1.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1-c1.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1-c1.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1-c1.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1-c1.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1-c1.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1-c1.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:132.9-135.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c1.dtb: / (qcom,ipq4019-dk04.1-c1): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c1.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c1.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c1.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c1.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c1.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c1.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c1.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:132.9-135.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c3.dtb: / (qcom,ipq4019-ap-dk04.1-c3): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c3.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c3.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c3.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c3.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c3.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c3.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1-c3.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:132.9-135.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts:12.16-15.5: Warning (unit_address_vs_reg): /soc/pci@40000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts:12.16-15.5: Warning (simple_bus_reg): /soc/pci@40000000: missing or empty reg/ranges property
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dtb: / (qcom,ipq4019-ap-dk07.1-c1): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:132.9-135.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dtb: / (qcom,ipq4019-ap-dk07.1-c2): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: / (qcom,ipq8064-ap148): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: rpm@108000 (qcom,rpm-ipq8064): 'clock-controller', 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^regulators(-[01])?$'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: syscon@3000000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: amba (simple-bus): $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:641.24-664.5: Warning (unique_unit_address_if_enabled): /soc/usb@110f8800: duplicate unit-address (also used in node /soc/phy@110f8800)
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: / (mikrotik,rb3011): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: rpm@108000 (qcom,rpm-ipq8064): 'clock-controller', 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^regulators(-[01])?$'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: syscon@3000000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800 (qcom,ipq8064-dwc3): 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[12]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[12]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[12]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:590.28-601.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9927000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[12]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:590.28-601.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9927000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[12]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[12]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[13]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[14]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[15]]
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1052.28-1103.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:756.27-759.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:791.27-794.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1039.11-1049.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: cpu@0 (arm,cortex-a7): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: cpu@0 (arm,cortex-a7): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: cpu@1 (arm,cortex-a7): qcom,acc: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: cpu@1 (arm,cortex-a7): qcom,saw: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: cpu@2 (arm,cortex-a7): qcom,acc: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: cpu@2 (arm,cortex-a7): qcom,saw: False schema does not allow [[10]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: cpu@3 (arm,cortex-a7): qcom,acc: False schema does not allow [[11]]
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: timer@200a000 (qcom,kpss-wdt-msm8960): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[5]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: timer@200a000 (qcom,kpss-wdt-msm8960): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: / (oneplus,bacon): qcom,board-id: False schema does not allow [[8, 0]]
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: / (oneplus,bacon): qcom,msm-id: False schema does not allow [[194, 65536]]
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: cpu@0 (qcom,krait): qcom,acc: False schema does not allow [[3]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: cpu@0 (qcom,krait): qcom,saw: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: cpu@1 (qcom,krait): qcom,acc: False schema does not allow [[6]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: cpu@1 (qcom,krait): qcom,saw: False schema does not allow [[7]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: cpu@2 (qcom,krait): qcom,acc: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: cpu@2 (qcom,krait): qcom,saw: False schema does not allow [[9]]
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: cpu@3 (qcom,krait): qcom,acc: False schema does not allow [[10]]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
