Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332811CBA
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 23:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754178899; cv=none; b=HkR+lARc3Sdezlv4ijHmBaXeSAu6lwAE42Hbs60OP41jucxL1ko9W6tYxMcMMKBTLjuTzzzOEImlNDQudXpntWY0ec+dcV2Our1tTZ85GvWeWywcAJq+WqMEoC8JHIOJA5+FAmzbdnQJPvYC87lR6AkLaOwEdrz94brsGorn6LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754178899; c=relaxed/simple;
	bh=c7jg9x08w+QHqhBvubGftoOREQgXrRYBJnwSa6tf4Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QoT0xUiYUHSBpJbfFgE/vbdBUK5o/ZdKikDJyZ6Hn9orUMDF69lAv/yS9DcSZYKnR1w/J3tkUyB4xoM9wG0c8za54nWyNFSECFTejVqspJs8kEz9kkRBLiXI+w4KzybDPZd8MqdjDrcCOuCIepgsT0qo1JdKahr9cg3S5Hkp7TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpuBAKxz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpuBAKxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754178897; x=1785714897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c7jg9x08w+QHqhBvubGftoOREQgXrRYBJnwSa6tf4Tc=;
  b=CpuBAKxztpTCuvTWsUw+SGtV+6MoTY7nuSBUMd/IxUjJWIiVf5cAWyuE
   newoxHGqf7266ik+gyxkr0dSWeDknCnSrZaBOz9EZgtH1HntmirZg9fkI
   mDgczkObZAMwoID154LiQHBqsqMNqqSDcysua2/Vit9ri7mKVgWZJ1uX9
   DUaFOSuRfukJ1WGWzobahZ/1ww54fppc67timTs9dZQJFUuzd+WuSMv4I
   gFl9lnjnGx/zMujR5IOjHgJWZa/7Srg9EoS0juppcjMs/61B5sqW7EiWr
   Khs+gYLiShairhBT70Ut0F5IcU6l1tqR+cRg9Sxo4mS+fdquUZ7kfGOTg
   w==;
X-CSE-ConnectionGUID: jyRYQ3gJTw27ZFOlFeraOA==
X-CSE-MsgGUID: ekffcpRcRKyu/CcCyerzcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="60122005"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60122005"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 16:54:57 -0700
X-CSE-ConnectionGUID: JmFc/seGTIOuU8WSjZJA8A==
X-CSE-MsgGUID: 1RfnidrJSK6U/KpIw/Bipg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194689817"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Aug 2025 16:54:56 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiM3x-0005fQ-2A;
	Sat, 02 Aug 2025 23:54:53 +0000
Date: Sun, 3 Aug 2025 07:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 27/38] arm64: dts: mediatek: mt7988a: Fix PCI-Express
 T-PHY node address
Message-ID: <202508030717.YkeR4MZ3-lkp@intel.com>
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
In-Reply-To: <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: linux-mediatek@lists.infradead.org
TO: robh@kernel.org
CC: herbert@gondor.apana.org.au
CC: davem@davemloft.net
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: chunkuang.hu@kernel.org
CC: p.zabel@pengutronix.de
CC: airlied@gmail.com
CC: simona@ffwll.ch
CC: maarten.lankhorst@linux.intel.com
CC: mripard@kernel.org
CC: tzimmermann@suse.de
CC: jassisinghbrar@gmail.com
CC: mchehab@kernel.org
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: chunfeng.yun@mediatek.com
CC: vkoul@kernel.org
CC: kishon@kernel.org
CC: sean.wang@kernel.org
CC: linus.walleij@linaro.org
CC: lgirdwood@gmail.com
CC: broonie@kernel.org
CC: andersson@kernel.org
CC: mathieu.poirier@linaro.org
CC: daniel.lezcano@linaro.org
CC: tglx@linutronix.de
CC: atenart@kernel.org
CC: jitao.shi@mediatek.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next broonie-regulator/for-next v6.16]
[cannot apply to linus/master next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Allow-specifying-resets/20250724-164429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250724083914.61351-28-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 27/38] arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-051-20250728 (https://download.01.org/0day-ci/archive/20250803/202508030717.YkeR4MZ3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030717.YkeR4MZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508030717.YkeR4MZ3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: t-phy@11c50000 (mediatek,mt7986-tphy): usb-phy@700:reg: [[0, 1792], [0, 2304]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: t-phy@11c50000 (mediatek,mt7986-tphy): usb-phy@700:reg: [[0, 1792], [0, 2304]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
