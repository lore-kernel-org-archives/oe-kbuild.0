Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FAF224AF7
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773563255; cv=none; b=WgvCZDQYK79lCjeZ0q+zM8QV1TUM/cVrv1eDtaQOTdIfVYyWw6WCRDP11EjoUpDgD6z23pRqXiZoa7Dpnm3njH3jGI01tszGAdHujZagLDDOcXLLJSh02OJYv26E++dKivR9ot2Gmsg3teIi0EbB7Gyc468mvkwKMMljCGjQ4e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773563255; c=relaxed/simple;
	bh=qN+jpz+zOJB7D7uG3nNTofCN/c3gz2Nbv5p93zz4W+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUnPtoHnOnSIiKMHPXk1UF3ELKWgktgOt0JcAiaPG5ML3Ur75SVv/KnS65C5+XLQEPflcyN4dZA1nnHdb71fegTKCvm3wGlejnKa34J/s8BLev1GMjABAK4210Jw+OsoLNymVrGGlNc6uCjWbQu09gtqCoKIX0vm8u/tn37D0G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWRKuDz4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWRKuDz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773563254; x=1805099254;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qN+jpz+zOJB7D7uG3nNTofCN/c3gz2Nbv5p93zz4W+4=;
  b=hWRKuDz43EBmE3GFYBJoKbn/AotBdF5RMjl9urA75K/+6d9yeMg+bAd0
   3XwqgODhBMEw+QBF3l60VVgr169xJj505kZwvLjjZqBs0yuV05sTs7ly4
   eM/j88NeWPk5oH9fU0JV7TXT5yvxEZQsDssk6iaSbWvKc+AvHByko3XTd
   B7ckc4pxQQ5AKJS9Py151SRuwwPxDpq62K1ZfjMQSihjwwy5ILUaAHzM7
   /vx5ZIP3rxDHEkTap5BCo/uVh4pOXwyQSnwvJ5rrvyWVfYXs0BHpXx2mr
   gcbNaPj0ugeiBQnnvYE4iq2L1a3D3GjrAJw/xR9OFCuLQoKn0DM2zKDgP
   A==;
X-CSE-ConnectionGUID: rDozhZd0Shq+PfEjyPHiTQ==
X-CSE-MsgGUID: gjie1BW2S2CK08bCrF2GJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="78500403"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="78500403"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 01:27:33 -0700
X-CSE-ConnectionGUID: rl9/IyDxSwytsUiA0rVw1A==
X-CSE-MsgGUID: 97Hb64TUShWchDwQY4Wphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="218863499"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 15 Mar 2026 01:27:32 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1gos-0000000040H-0luv;
	Sun, 15 Mar 2026 08:27:30 +0000
Date: Sun, 15 Mar 2026 09:27:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/9] arm64: dts: rockchip: add radxa camera 4k on rock
 5b+ cam0
Message-ID: <202603150956.lzMtvhaW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250430-rk3588-vicap-v1-7-b3bddf749914@collabora.com>
References: <20250430-rk3588-vicap-v1-7-b3bddf749914@collabora.com>
TO: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
TO: Mehdi Djait <mehdi.djait@linux.intel.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Kever Yang <kever.yang@rock-chips.com>
TO: Jagan Teki <jagan@amarulasolutions.com>
TO: "Кузнецов Михаил" <mai.kuznetsov.misha@gmail.com>
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
TO: Nicolas Dufresne <nicolas.dufresne@collabora.com>
TO: Collabora Kernel Team <kernel@collabora.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Michael Riesch <michael.riesch@collabora.com>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f6390408a846aacc2171c17d88b062e202d84e86]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch-via-B4-Relay/Documentation-admin-guide-media-add-rk3588-vicap/20260314-181423
base:   f6390408a846aacc2171c17d88b062e202d84e86
patch link:    https://lore.kernel.org/r/20250430-rk3588-vicap-v1-7-b3bddf749914%40collabora.com
patch subject: [PATCH 7/9] arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2051-20260314 (https://download.01.org/0day-ci/archive/20260315/202603150956.lzMtvhaW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603150956.lzMtvhaW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603150956.lzMtvhaW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
