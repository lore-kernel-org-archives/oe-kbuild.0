Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570691C84D0
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166266; cv=none; b=Uy2hCsJJLVTDi5p3bNKqj67zuVM4f0hWGQd3aiomwidIBIJZyIae19gX6sSE8ns4PI+S0XjMZWaSyiQo+ydQ5kSQ+qNIA/UtNQX/bEcHwy6kP6yirE/Y3FQ6qYIdQhDU+m3nSXPq+1cz0EFKj+sADMF1gZmo82tyCqqx3th0mQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166266; c=relaxed/simple;
	bh=OBDTC3ymzw2qr7VMqwBFvsAXk5s+r7P6QcwignNGXIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FF4iBmS8XzVDBZcW64L2qvfPvZNZjaQ67BEPvQOGIrMBbX+GEzJCSr/J+68RQ+7kVuSGXuAk2koMQ75aVRY/BGnTXW9purrCd97pa9y184FloVMkciRP5EWkRwkTJbGQtU+7vyW7fPg3X8RgP3mK4Dlvr2KM32E/3WVrmo3px7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5TCQg8b; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5TCQg8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790166264; x=1821702264;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OBDTC3ymzw2qr7VMqwBFvsAXk5s+r7P6QcwignNGXIs=;
  b=V5TCQg8bn4NoaltHpcyyJ1fd/73KMpflpytk2CWwhMNxeZWzvLfP05Yd
   STgJ1k/DIqb9a6Le0GBbuNeaNFfsh721FNgqd3pgAXNUhhuf0oHQN2uit
   hRoaK59VIdQwZOGUbGgdnPwmd9PNObQR1clxryqEr9KuxZkW3SUq3b/zk
   2MbDqahKPeklrv4jDx0atHfGnExwIGtQ1uJIcfKdhEOEtHpObqBIe9BiJ
   I0PkICMAb3Vv5BqfjkWMeL9ZQlT/59HB3iWI6PIFVkyjm3/9ggv6xEOl0
   YVepoLZyGa2nsNDGi3Fs2OTGA7+v5JPrkSAywrrKGWnGFvgFHBKGCyUi2
   w==;
X-CSE-ConnectionGUID: nuDZisTUQPO7WkO2ueOxzQ==
X-CSE-MsgGUID: bJBwYlsJTuKz7mtefj29XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1349559"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1349559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:24:23 -0700
X-CSE-ConnectionGUID: QqVDG76tQ7KHbhCqFS9kyg==
X-CSE-MsgGUID: Bklv87+cS7GqK5uEGoKypA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272199490"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 05:24:22 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9M1M-000000000fh-3A6G;
	Wed, 23 Sep 2026 12:24:20 +0000
Date: Wed, 23 Sep 2026 14:23:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb:
 hdmi-receiver-cma (shared-dma-pool): Unevaluated properties are not allowed
 ('alignment', 'alloc-ranges', 'no-map', 'size' were unexpected)
Message-ID: <202609231404.VoKts2EQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maud Spierings <maud_spierings@hotmail.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: "Ond=C5=99ej Jirman" <megi@xff.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: ccc7f16ea2e33366f7b7005daad81e316f8cb6e4 arm64: dts: rockchip: Enab=
le HDMI receiver on orangepi 5 plus
date:   1 year, 1 month ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-2401-20260919 (https://download.01.org/0day-ci/arc=
hive/20260923/202609231404.VoKts2EQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260923/202609231404.VoKts2EQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: ccc7f16ea2e3 ("arm64: dts: rockchip: Enable HDMI receiver on orang=
epi 5 plus")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609231404.VoKts2EQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-d=
ma-pool.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: hdmi-receiver-c=
ma (shared-dma-pool): Unevaluated properties are not allowed ('alignment', =
'alloc-ranges', 'no-map', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-d=
ma-pool.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdab0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdac0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdad0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
