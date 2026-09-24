Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2DC3E5EDB
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269549; cv=none; b=s+EAH/wJR/6kRTFCy8BPYTpBGDWH5sXAvnhuG+/vYpLuJModZ8+pFArwspOhESstuKH0O5F9QVsc2wtxslEYg/ov3ChVPo0X6c+5QoXkBYxon1F4oejZTyoIWtp2ZJuyCJRCUwlIIZ3AiP6hsC8wKLAKbcNrrlyzQ2wT/ZA8ozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269549; c=relaxed/simple;
	bh=7S2l1P3qk9ZCmASoKUVB1PTB40HANABWlA4r7vGowQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SM69EzzFzgunQdJ8flwv/IaVcWWc4O8+cdtJXHtJJirhLdQS4bauDt6I4toaSjb+M2zUUyC9BlCmTzp7rMCyeewQsdfhlX2/OoQp4vVUrk/EWO3SorJTNJpITyWDrEBFhDu7BaLT3/lSQ7Bd+rT+q2jIQhAB1LnEgbj6XIU/EJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=El1IUKjR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="El1IUKjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790269548; x=1821805548;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7S2l1P3qk9ZCmASoKUVB1PTB40HANABWlA4r7vGowQ8=;
  b=El1IUKjRB9X8f6j3hgyIPBs9LgQ5/M7HjCb+g+YP/Mx+hrerjbEDd9J5
   L8LyTRuKNMyRugm/2gDBxoaeuqJHfO1R5G/xJf4KvuZgN041Cq5fK8nAw
   IXIrvEUaSDkTjeAVSIh9RV6WzsDOBsXrpvEy7nAhsVjyryliaGZ07/0AO
   /cYZfnvRiHzcf+rXOyQwDBGFgVam3VJB6Y07mwzvPA6641li+qAbBVi3N
   qlxrN720ux4C1saKuaYQwhTzAfQ0KhgTCcuxHIvlJXfvPrhQrFQw4/3iM
   fIMyPMDqob/QmSXuyTQpsy4wkn/0bGLYcFuHop2+QiyxIYBmAxt1OVsZT
   g==;
X-CSE-ConnectionGUID: RyxpSfaGSYqKEguYAGuiQw==
X-CSE-MsgGUID: bufIieqpTb6O+sbQDOW3jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="107434386"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="107434386"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 10:05:47 -0700
X-CSE-ConnectionGUID: pKJ6z9inQ1ShT06bl47Kcw==
X-CSE-MsgGUID: XNZx9PR8QZm+t/GG3Gn/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="274262622"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2026 10:05:46 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9mtE-000000000Ng-0gyh;
	Thu, 24 Sep 2026 17:05:44 +0000
Date: Thu, 24 Sep 2026 19:05:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb:
 hdmi-receiver-cma (shared-dma-pool): Unevaluated properties are not allowed
 ('alignment', 'alloc-ranges', 'no-map', 'size' were unexpected)
Message-ID: <202609241810.Z7Svg1gf-lkp@intel.com>
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
head:   f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
commit: ccc7f16ea2e33366f7b7005daad81e316f8cb6e4 arm64: dts: rockchip: Enab=
le HDMI receiver on orangepi 5 plus
date:   1 year, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-2401-20260919 (https://download.01.org/0day-ci/arc=
hive/20260924/202609241810.Z7Svg1gf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260924/202609241810.Z7Svg1gf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: ccc7f16ea2e3 ("arm64: dts: rockchip: Enable HDMI receiver on orang=
epi 5 plus")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609241810.Z7Svg1gf-lkp@intel.com/

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
