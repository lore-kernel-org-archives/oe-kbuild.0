Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C8FC2ED
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737302562; cv=none; b=VhvnVfuM3/gdKqMJp7MfDi0FtQmOYyhXVN9Nhy8vVbaaF8dU7x5NhF0QTc/f+P5MVIuZf6solfx6Fogxax6z9jHEL3MKt1AxFY+xzLAr07BlqFH4VRJazxAUu54Q5dJ/oHMLw3AQ7hk1bytlB4BOI5LyNsUlU9WxwAhFxNva1Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737302562; c=relaxed/simple;
	bh=KLGpjvGv9DiIaIuaGg1jHfxF1nYC/pfZONB9WHbMm4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ioKn1Ll3fP1IlsuSpaFPRtJK2PgdTpSzLvRKWdsKXdCk6CUdPnqUYXRpl7uK83SHUUHvESRAVpIoITC4nGK68YJFpFOXx/FgDNIvvpCpnp59TTVDlkbJx149fvQSIWG6o1aQGL6Qt9qzBk9tTZX28TMeO89v+HXYtaniKQzHOFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWFxvLcf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWFxvLcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737302561; x=1768838561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KLGpjvGv9DiIaIuaGg1jHfxF1nYC/pfZONB9WHbMm4c=;
  b=cWFxvLcfiRtgz+j22zylK0BYw/QaFFZUE09h1S4og204hfFav8AU+DMn
   bfrUpSRbZYmoD9XCVIYX+XTXlwRopBkCBP6Ma9aoZKsTvBGGHEXVSgIB/
   aPmR4HmaZseTZ0z6gskRyd2+KTtChXlqfx5i2EXt18viXL9+JYKl0ig7Y
   FltTENb43GjNPxBPJMKAmE6lf4vMYL16VGWUd4WNhadgj5LXL6KcZ3zUX
   8wSjGMq+lJLzijIM7/cDnvZZ3/SPMbHP18mRLOZPOU9HCEXbVFK65PVnD
   o+KUtk2WF5pi6AG8tRWQzY92CAUx6Z+BasW1SkAUssxZv8iUa66bXp4sH
   w==;
X-CSE-ConnectionGUID: 8jeQPcfoQkuZa1mEReU+VQ==
X-CSE-MsgGUID: wRqhDFJlTdejVSbkvxba6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="55227700"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="55227700"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 08:02:40 -0800
X-CSE-ConnectionGUID: IYcpi2WoQRSMLfMikotiAg==
X-CSE-MsgGUID: ue9OzwT5QMq+VA/RfXvRlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106710252"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2025 08:02:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZXky-000Va7-3A;
	Sun, 19 Jan 2025 16:02:36 +0000
Date: Mon, 20 Jan 2025 00:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: add device-tree for Genio
 510 EVK board
Message-ID: <202501192329.GyVQbfrB-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-052-20250117 (https://download.01.org/0day-ci/archive/20250119/202501192329.GyVQbfrB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501192329.GyVQbfrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501192329.GyVQbfrB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
