Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396401ADFF8
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 22:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737411493; cv=none; b=VY2gAljBJMAPOrA3RtYIUtQTqgWB6MNp6tUkq6+mPZvmYWAF31jnYNr826sk1N8Yixs4v5p7fFugwSDB7KBXPqVV1Rag3HIVrdrrC9tqmRNHo0wOc90+O8VCF93xSVbtV7IuwBeFlP3jz9Fxfl0bmcOcltyyhu4bJ7g1BmePU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737411493; c=relaxed/simple;
	bh=/ZktxuVHCN/IZo476AKNjjww5jnHs3ttatDynwY+w70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GgyVIZyztjbOxtXJfMZzyPZJ+B4O21MQ3KAW18H45ZYvBihCiuST6FBUDv+pnprTK4yL+pk7ceO0UjIq0ihyqMX0BKIZAJumMRSYRA53t4Hi2n10CIKUKn92E9qGNGNcxEM0dUdtU1j/XOgmHJoHW90muHopADL54//IA47lcvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Voh9tw2y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Voh9tw2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737411491; x=1768947491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ZktxuVHCN/IZo476AKNjjww5jnHs3ttatDynwY+w70=;
  b=Voh9tw2yCGqp9jx0i3GTVBGN3goMPlI8Axoa6o7yjghuf3rs/lXbDQwl
   WvDbHX/WDm9bWNB9vmrkxip7JwKMHV6UQaKP79km0NkQlTvdugBjinWEW
   F8VJdaD88cpYNmmjr6hVLr+nsm5XDu47HII2F7RMk/to7vUfkuE7E5YS0
   4Bnc+6QRcFjX1wzGEsYOBkjpt4gNmD5mGocCy/1Gv9fhACLppAwN6vYBJ
   +W98f72cFNguz+u6eRa+qp1v+66ZwaVTSpTdSS/Wu/54AFXVeQ3mvwQcY
   eY6be5ptRkq47EeKEHteP/w7pyFLYMQIp1yvuHvqluoAMLsgVEZpqs8+o
   Q==;
X-CSE-ConnectionGUID: AKaV2+1QQrewx2orC7zTbw==
X-CSE-MsgGUID: WgNuUGuGRK+YqmH+Sf5ymA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37086959"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37086959"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 14:18:09 -0800
X-CSE-ConnectionGUID: uxWWsIGFStSzdz8C7McD2g==
X-CSE-MsgGUID: QKfhh4XdSZ6PeDk6/PslwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111255788"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2025 14:18:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta05t-000XHo-16;
	Mon, 20 Jan 2025 22:18:05 +0000
Date: Tue, 21 Jan 2025 06:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:mtk-wip 28/48]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0:
 Unevaluated properties are not allowed ('ports' was unexpected)
Message-ID: <202501210642.x0kvihDv-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
commit: f0a9b7aeae0433da6e9d81ea2da350390577d0f0 [28/48] DO NOT MERGE:  arm64: dts: mediatek: mt8186-corsola: Add Type-C Mux for DP output
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-053-20250117 (https://download.01.org/0day-ci/archive/20250121/202501210642.x0kvihDv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210642.x0kvihDv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501210642.x0kvihDv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0: typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
