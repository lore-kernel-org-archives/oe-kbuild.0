Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C2F41F7F2
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 23:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790378136; cv=none; b=N9Bi2XFF7T57ZtIMs7oUxlSDHE7QdkjAcrAlJI6c9WOejm5vXsCuxeZbKAkFBUThqaH1FU6MLYsosNV2Swlo4PcQZu5lq85UEKil1PW64FYLynTEJlYeuFs15i0pjtJi7UMtP1qziY/wDHokY/ZLPh80eCvJw8AO6kbFMf84nQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790378136; c=relaxed/simple;
	bh=soOPqkDBQvay2+H2Xcu7kce7O9PAhzxBY5R76sueaDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XKb8oFLO5SJeUOLAEkBodiMwCrxAhFFG1+jTIuXylL32scBdTMW9tPi9eSU1UZf+eRkAavwfl5LIoEOx4MIhpZvfhYzKNHFmkASqTMuu5Ph2t6Ya0vdlnYaxMhT3EgtusDbC0gl5Kf/ujTp0DPujrwqJ+ikgpMM8US2Kjs9OzW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUkV0qV/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUkV0qV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790378133; x=1821914133;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=soOPqkDBQvay2+H2Xcu7kce7O9PAhzxBY5R76sueaDo=;
  b=KUkV0qV/oQRiPzlzb5ua7nnpnAvTvE8go+CDDY9VDIDEfLXJPejDh0CH
   KXL0uOh6qAwcYPjiHiMNdD8O1d61pxxuAyjzM5x+UH5DpnE4DHhyt4hCU
   3NXMkqo4SNE0+GHKDaYWkXlQFyx2t412mSL4oZvmq4+2tfGRJ+g3eJSdu
   eIz3Ru5DUfda83qmf8IxSGSqN+12HLvHFY28JSYdDXFrChICBUW1Ny7p9
   oVLyAuS3ysBwKj5XgzgObVQcR7qpIxQtyEHU257d/l1kp/1ikn+fIoYEl
   B0tQU7qQ1/uNO3q0ttbCgu++Qtv2a8DRJY4L6SifbQCj6Y8KN5VzBTtfK
   g==;
X-CSE-ConnectionGUID: Vym8WO04RGS27PXDN9pA7g==
X-CSE-MsgGUID: v6r/fgjjR0q6xrWskjHxwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90295696"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90295696"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 16:15:32 -0700
X-CSE-ConnectionGUID: 9Q/GyA8KTqOEZl9vGHIVLQ==
X-CSE-MsgGUID: dLJfefHUTJWDvp2hlZF8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="272251975"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 16:15:32 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAF8b-00000000051-1TZP;
	Fri, 25 Sep 2026 23:15:29 +0000
Date: Sat, 26 Sep 2026 01:15:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb:
 hdmi-receiver-cma (shared-dma-pool): Unevaluated properties are not allowed
 ('alignment', 'alloc-ranges', 'no-map', 'size' were unexpected)
Message-ID: <202609260143.xYv5WNW0-lkp@intel.com>
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
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: ccc7f16ea2e33366f7b7005daad81e316f8cb6e4 arm64: dts: rockchip: Enab=
le HDMI receiver on orangepi 5 plus
date:   1 year, 1 month ago
:::::: branch date: 23 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-2401-20260919 (https://download.01.org/0day-ci/arc=
hive/20260926/202609260143.xYv5WNW0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260926/202609260143.xYv5WNW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: ccc7f16ea2e3 ("arm64: dts: rockchip: Enable HDMI receiver on orang=
epi 5 plus")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609260143.xYv5WNW0-lkp@intel.com/

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
