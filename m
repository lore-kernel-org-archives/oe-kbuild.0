Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E92E2AE97
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755474875; cv=none; b=H/cFfHZ3yRAANALS4BP8zHszktE5/xvkUBmGBMdGGFyNwzKA/+VYHZFG4IZgJnJXgT3B9yc3JfVZV1Fq8Sp00q/qqvn/ZLhsEiz5JY5ixDtzYEgyihpuuo5fn2VVWkbCoOi86OIQAXZP5flymHtmerqXjSJ07EqUDY9r/5kt3os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755474875; c=relaxed/simple;
	bh=CUWuI1Je9/fBvudWtgXYUWnVblggDiDftC1knd4aZ80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OktXsgSqJWEcTzikIUrqdPmRdCZPVAHuRxLMdaunyxz3gA5xo6fPu+w4J1KW9uzapHgG163OZ7V3q0uDWGOk+EV/Qn2cVz+OkFngYq+Z7IRub2TlZMq7OYimB342h9aht7bFAeEqggzlVJSsch9ccUaRB+1l1PRIZfBC1iN4IeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9MfEmv+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9MfEmv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755474873; x=1787010873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUWuI1Je9/fBvudWtgXYUWnVblggDiDftC1knd4aZ80=;
  b=b9MfEmv+FohFjZhl233kivMQnXIQu4ams/lAOnXb7/iDl+VMG/na9MwN
   gu+ZefDnOXpBZGoW8Wp25aBrcMATI2gvVWv1RXgcesJ48OQUt8Ckz8oNN
   kTlXWdEzfqDay0gsU0CUnL5uSsdS9oIhWhLi26UEsL2eyN+xR+QumAeZo
   EaQlkncbk8tZ3ycOQZlsdMdIKAdVPt5xw7WS/KKhrx7Hw3RfBPUkCjnwq
   hEQHXwazQgmFlbZKfTIGzHtlWaV9YECoe2PbF4Jcr48UdxbVC2Y3fGJQD
   X/gKAKhJvt5foGNLBkekQuigH9fxSrjv1LAv7d7O3k5VFEvxbAtDw2o9L
   Q==;
X-CSE-ConnectionGUID: c1KuHnxkS5yvgSErCkhcZQ==
X-CSE-MsgGUID: ofq/TVRZS76rMcE738EWYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="56903426"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56903426"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 16:54:33 -0700
X-CSE-ConnectionGUID: Brh2V7/MRS2S3WNTfqmkSA==
X-CSE-MsgGUID: I4SvsmofSYmUx7Z9R6UiCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172649128"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 17 Aug 2025 16:54:32 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unnCn-0000zX-1T;
	Sun, 17 Aug 2025 23:54:29 +0000
Date: Mon, 18 Aug 2025 01:54:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.17-rc1 8/164]
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones:
 bigcpu-reg-thermal:trips:phandle: 281 is not of type 'object'
Message-ID: <202508180146.GePVuzCB-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.17-rc1
head:   33bec5367ad36fc3e940629a2cf5e2191da759ce
commit: d41a94676ca4939c5f3f95c548620efd092b9516 [8/164] kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2051-20250817 (https://download.01.org/0day-ci/archive/20250818/202508180146.GePVuzCB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180146.GePVuzCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508180146.GePVuzCB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe900000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones: bigcpu-reg-thermal:trips:phandle: 281 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones: litcpu-reg-thermal:trips:phandle: 285 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
>> arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pmic: soc-slppin-gpio: {'rockchip,pins': [[0, 2, 0, 17]], 'phandle': 262} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
