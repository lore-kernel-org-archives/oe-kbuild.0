Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD99165F1A
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jan 2025 03:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737516202; cv=none; b=nBBCSp+fsA8KD4WBegT8ilBKNKS8N9X5LYI5Q0PzetJwHSVYePtt3uDrmjWOd09Pt76SB/eJjLoy0+9IRqxOZyJewXIC15YKVAG+LMmpukuBwJdvBqAcLRReREVUcNvQMMJQsx05JyaFBcui6SBAMPmwf9Nf+nRtrt/WHTm0uqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737516202; c=relaxed/simple;
	bh=ihnVofayJyyA26lXYBb9tK4mtzETEfASv5iD1e3lGME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkW4QaY3kPF5E6s66AnBwJieHPcJjv0R2MF6lL/YsX9xrAcgT0hhUj14eF5mw1s2HfGZnxXkVaOBKCtVMQJjF3lpnVc/KTgs9TXyJMDDkenUK4ems66AjyyftTsM7wQrUnezPcYjXQFk3NH2LejvbL9kdDdy2rX8Yy68iJzz7/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bArrIPYC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bArrIPYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737516201; x=1769052201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ihnVofayJyyA26lXYBb9tK4mtzETEfASv5iD1e3lGME=;
  b=bArrIPYC9tYGEt/hVzCmA4BOM7II4J65tlqvy33Gug90yaqEN3PdNVGL
   wxmZ6ejxlaD1cp68N3dRwpHVXP99KPZwPiVWW54P12pAA9sCIUKSVsQyX
   18hSKVz2WuPnPbseCTZD6MOPyq9VZhNf32/9CzhaF4n+fq1KHhlFsQ1Gg
   uD4RKRMQryZQfyZAmkbPTYqOW9Fo0bD2ym/rKX8YUoa/NyVtqJEBqVRG/
   2LAIAO6IUpmqrvK5Zmx7c+AVz1Bpn719ra3XWYO0jd1Kla8QAvse2CHIH
   xGYuNqFHBBa1wPprWVNLnXzFB9m7O39EubJJBbeK5DB2gCB9OZ0r6V2Wm
   w==;
X-CSE-ConnectionGUID: GboAVY5dRd2VrTNlpsIhwA==
X-CSE-MsgGUID: 2XzHyuwmSJ6GETHxarNJAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37227685"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="37227685"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 19:23:20 -0800
X-CSE-ConnectionGUID: bD9iWBScQnKlgmP9Lj7ayQ==
X-CSE-MsgGUID: tM+G9UDmS7S18DCVEErDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="137828701"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2025 19:23:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taRKm-000ZOI-1K;
	Wed, 22 Jan 2025 03:23:16 +0000
Date: Wed, 22 Jan 2025 11:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: add device-tree for Genio
 510 EVK board
Message-ID: <202501221134.Y5NE0vYG-lkp@intel.com>
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
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-4-fc9b01d08834@collabora.com>
References: <20250115-dts_mt8370-genio-510-v2-4-fc9b01d08834@collabora.com>
TO: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Sean Wang <sean.wang@mediatek.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: kernel@collabora.com
CC: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>

Hi Louis-Alexis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 37136bf5c3a6f6b686d74f41837a6406bec6b7bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Alexis-Eyraud/dt-bindings-arm-mediatek-add-mt8370-evk-board/20250115-183234
base:   37136bf5c3a6f6b686d74f41837a6406bec6b7bc
patch link:    https://lore.kernel.org/r/20250115-dts_mt8370-genio-510-v2-4-fc9b01d08834%40collabora.com
patch subject: [PATCH v2 4/4] arm64: dts: mediatek: add device-tree for Genio 510 EVK board
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-053-20250117 (https://download.01.org/0day-ci/archive/20250122/202501221134.Y5NE0vYG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221134.Y5NE0vYG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501221134.Y5NE0vYG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
