Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EF1F03C5
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762702071; cv=none; b=TZTel9r/3vgYSIIUTmwHyRMVP+KTjwOszxjF75rJ+st9AG4wC2W2eyeWwd3UCjNRApFOm15t3lzyT14obZ054psTbLdcywY1+NN6bcNTLC5ZqY5d6Qb3EOCEqBtkYBHu28pHcs23qxMX10o45n/PSM3Ql2WF9hqlRDwAgKvDzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762702071; c=relaxed/simple;
	bh=vpmsqqcT6bukQK3ckbX5aQGKWIV+L4gxFkFWOpl15Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H9XW1I9lK7CYyWO33O9pY526YzoRdmeUEhp0UnHvgUrtHTYJpauIvjVYFtYqaxyOuLG8u4S3mNApj+4/zWxycV3u7H14Zak1QwA9+W9OaZWUaWs4SWclJF8pZj3XIQzHNewnYpzW4R8E5woUGx9vrg/OqxUDfmKWxqbAksFIP/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieXkm1zN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieXkm1zN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762702070; x=1794238070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vpmsqqcT6bukQK3ckbX5aQGKWIV+L4gxFkFWOpl15Sk=;
  b=ieXkm1zNQhbFSeoFkQJN1URuc7FEYT5vPGOloMnyeJ8swnoAZSp2Xo7+
   42IO7RS72TTlRHsP+lhoRQ731O5h7yO0mGv8smn/+BREHzJRyPwuJaNej
   L0vD3M2wo+9+T9rt9ZAsGsyfuG2LXqaQpjcviV4o3xyX/zxGKe9UV51p/
   fg5XuJJTi5nby9/QD++Rf79iXfNm5YJr+lrQcdWq2FlluJk/Xh8xyU1v0
   aTxKdDhuuL0PYxJtX2h/mj2qaNQ03DRJQLd0Rar0v5nd6EEhBCXRVYGPH
   OZ2tz9wqPadX5BwAf+P5gLwXDQKNl7c8aGbzIzTF0buk+R0EEzVeUPK2T
   Q==;
X-CSE-ConnectionGUID: JKMDAz61Q9SKy5LLJzMaiw==
X-CSE-MsgGUID: W3JFB1ElSQapLADY/H3JrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82171253"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="82171253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 07:27:50 -0800
X-CSE-ConnectionGUID: tD5R8srsRHmcTvmfUIS4qg==
X-CSE-MsgGUID: PqSrZb8dQ6OQ18YB7/1DxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="188425672"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Nov 2025 07:27:49 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vI7KU-000000003uC-2GIO;
	Sun, 09 Nov 2025 15:27:46 +0000
Date: Sun, 9 Nov 2025 16:27:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-msm:test-drm-ci-base 16/18]
 arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: / (arrow,apq8096-db820c):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202511091601.qtWqlBY7-lkp@intel.com>
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
TO: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://gitlab.freedesktop.org/drm/msm.git test-drm-ci-base
head:   c6e04c826d82fb48e3d6bc8df509af5dfcf081db
commit: 952264e47d659ed5b95abd896dbd15f8db01a939 [16/18] WIP: arm64: dts: add apq8096sg-db820c
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2051-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091601.qtWqlBY7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091601.qtWqlBY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511091601.qtWqlBY7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1221.11-1231.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: / (arrow,apq8096-db820c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['arrow,apq8096-db820c', 'qcom,apq8096sg', 'qcom,apq8096'] is too long
   	['arrow,apq8096-db820c', 'qcom,apq8096sg', 'qcom,apq8096'] is too short
   	'arrow,apq8096-db820c' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'arrow,apq8096-db820c' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'arrow,apq8096-db820c' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'arrow,apq8096-db820c' is not one of ['qcom,apq8074-dragonboard']
   	'arrow,apq8096-db820c' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'arrow,apq8096-db820c' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'arrow,apq8096-db820c' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'arrow,apq8096-db820c' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
--
   	'google,lazor-rev5-sku2' was expected
   	'google,lazor-rev5-sku0' was expected
   	'google,lazor-rev6-sku4' was expected
   	'google,lazor-rev6-sku6' was expected
   	'google,hoglin-rev4' was expected
   	'google,zombie-sku515' was expected
   	'qcom,qcs404' was expected
   	'qcom,qcs8550' was expected
   	'qcom,x1e78100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: /: failed to match any schema with compatible: ['arrow,apq8096-db820c', 'qcom,apq8096sg', 'qcom,apq8096']
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@76f8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
