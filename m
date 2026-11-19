Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130129;
	b=cRPxvY7qKAX0Jz6vTLORltwkuvbBde8JTTCwowz6mK+nEFzGPEQHIT2mooFZ5G6mNBRk
	 Lw4alRHe/i6w68YHUYbEOj9EnAxaxaXONk5if5G9vu5oH963oKNg9/en04qI4OQNZHHMQ
	 ax3C8yB98gsb8mPNNuddGaCEXnY1mEAhoc6vBEpn440GqHzFHAqm5zOzdUrD6P1qT3ntU
	 Uw/OBjTqJE/im7jy5gNo/Tbe4KL9mO7Q/tP3SeBYJzlCgv0eDFApRuUftUaB3pZX/iI78
	 GZmTVMDlmOaNVbHelXbFH/SfFahR/OUX8uEmZLoAVfFpRl+hgDU78Y3muapRqvcUw8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130129;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pF1hB0DDhGWFrEJAYaxghQw02MK7Ve1zncllTy5Rbb0=;
	b=SUgH7A4KtuSc7AB8lpxWEpYoZlx6n47eJWufIw25DoYxs4aGbgD7AnGIUmyiRIdIK82w
	 4i74atS9lYKZcZ4iCXvi6hoeRGrWm6YOOjKN/ImTeIp3YREKS0rxdgv7UaUX5f0uyUQOV
	 k2bnOHsrxO4KcofKUpUJpPSYVsdQFy/EBeMf1onjYpUrZvDtNg9Zvyy7CvmhaqZ9Vd4Eq
	 7d6+zVndARM4A6cc6WCOE85uEpvoBB7mKsVjjC8+krsLS1tmjXI3Ihw5obYif0r9ywull
	 gWGLmZQ0u58GvmNjt/j5PueAKMdXNPaqLIPQdArExlUdDqAwi3BwcdlesJFL8IFny6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoUmntDF;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0047606A325
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 23:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0047606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoUmntDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795130127; x=1826666127;
  h=date:from:to:cc:subject:message-id;
  bh=yOXwcgzmkqdySsj9EmzgT31Yr6Lw1s+haoEf2EKg8ik=;
  b=WoUmntDFUBhlppBZeYnMRgb1olP33n/8GGLgQA9WzilD/vveACt+adDV
   Bpys9oH2GJEWUm/7qqw0uKo6kaiHYMeHQOBFS6QdgmVeVg83T9vtslBDL
   RLD7cFWdtsUPuIClh0PgSOVIOOVEdzeJ4j781OMwxcSXCNNsLiMc2hGxm
   OQqrt9YDqqXi5AmZ3tisDSAqpFZ/dDY5Xp7MQo+YgA+M37z8ILQpb5nlF
   3KKkaNJIIlz/xtpPzXzT67268e0SPP+6YuPfkoIart4xbQ92eTAKvR1l5
   n52rO0qEjpLl/k4eErfzWvFNKdB8rvFHhOAqAp6Eh9O832nJQyU0cZeQm
   Q==;
X-CSE-ConnectionGUID: ymPFcMkQQC2IZ+CRGG12Vg==
X-CSE-MsgGUID: 2JmzXeq7QJCHTTjbAbw2zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3885654"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3885654"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:15:27 -0800
X-CSE-ConnectionGUID: 5FO//zJWRAShRngu75ylvg==
X-CSE-MsgGUID: +p9u8tRyTaCbtS5Ffg7R7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10884656"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2026 15:15:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUBLg-000000003sV-2YSg;
	Thu, 19 Nov 2026 23:15:24 +0000
Date: Fri, 20 Nov 2026 00:15:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8650/el2-iris 5/5]
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: video-codec@aa00000
 (qcom,sm8650-iris): Unevaluated properties are not allowed ('video-firmware'
 was unexpected)
Message-ID: <20261120000855.UfWdN8f2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/superna9999/linux topic/sm8650/el2-iris
head:   294c0e3876ea82d61bf7c0d64d2615ef4e2a5a58
commit: 294c0e3876ea82d61bf7c0d64d2615ef4e2a5a58 [5/5] wip: deckard: enable iris
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261120/20261120000855.UfWdN8f2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120000855.UfWdN8f2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261120000855.UfWdN8f2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5208.27-5283.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5305.27-5361.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: video-codec@aa00000 (qcom,sm8650-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
