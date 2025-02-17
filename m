Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD8315C0
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 04:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739767123; cv=none; b=K1wXghhFLH8Nqvfa669GC3SzvHsUWFDlq+j35LUnRGBYhkaFZE0zJU59+XhqH3LtzMYxkJiYxoVYyJzq+/TluT3e7u1IHxt0FnhEKvB/h1xyIe4rQyUmhLrR7Sub1hP+tzoj6In7fQrujDCC2EMZQ8SSni2byhQ4uwxo16zMEX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739767123; c=relaxed/simple;
	bh=7ZB615tU8SSVxjZMBL0Xj/0wwmP2rv0hesWePWrgO7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VwhZTpr8MXlGhHiGHcnbBOAsaDS0Wo3bgPbNORjSpngjCe/tuPXBrMv5RqgqPZGaelAnyBIj5U0KvnUuaeBR4vp+yOC4tCB0Sutl/rpQHmB9sYNRWIeMqPzPhcmUeHfmB+Z7cAfLxbChYAXLM90EIixRlfJJ9cZTQqhOuWhzL1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEueGN3v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEueGN3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739767121; x=1771303121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ZB615tU8SSVxjZMBL0Xj/0wwmP2rv0hesWePWrgO7w=;
  b=SEueGN3vVV3IeN8pLLe/cJIgylYJn7/zw6VV0K+DddVkTCDWte40t7BU
   KYN9MEGJGQl1eRW+4QT2oIw3dXTW1XlVv31Ik2N9flqRp75qFjl/iaXLS
   D9IPeueCsDUhXUswriJ2ujxCZhAjhFhFjHworbTa73iivnGqicj0L90Mv
   nhy2P/jOpOOILqv4x8HSL4n+q6LbAKwZsNHldzJP4A821Z2qrJ8JXZ2Sg
   XnqmQpCLj/6nt/SawR8XG1p3e6fK4podcsixEm9+tnoHU+ZkN3r5+usuC
   W8VXxc89dBE2JTNNeM4GcT0ctnRZt9G7w2eJSlJC1/PEDaSaR5sblHKO5
   Q==;
X-CSE-ConnectionGUID: QC3TmtrMTEeTg89cF0btOw==
X-CSE-MsgGUID: bKyVNv3FTI+RdtIrdjbLdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="62908946"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="62908946"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 20:38:40 -0800
X-CSE-ConnectionGUID: 9U3fbwLnTHWFFWNsKr7dUA==
X-CSE-MsgGUID: REoV7na7TQGr0POx6aWuxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113876603"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2025 20:38:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjstx-001Cap-0j;
	Mon, 17 Feb 2025 04:38:37 +0000
Date: Mon, 17 Feb 2025 12:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:for-next 8/9]
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000:
 Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
Message-ID: <202502171248.IOLNRavX-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
head:   faf7db65e170824108e288623166fb46d56e776a
commit: c0900dfc8509b64b8af9ee21b2f3ede4e17c7db9 [8/9] Merge branch 'v6.15-armsoc/dts64' into for-next
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250216 (https://download.01.org/0day-ci/archive/20250217/202502171248.IOLNRavX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171248.IOLNRavX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502171248.IOLNRavX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: /spdif-tx@fdde8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000: Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
