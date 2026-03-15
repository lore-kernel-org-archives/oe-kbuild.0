Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA9138490
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773576041; cv=none; b=GdBcOu51jVvoZWLw/GMMqu0ezuRtBSeAg1r4DKRuQsWzygIN7YwZhQCwHw7vFMHud2WhDwuAk+3TTWDclKG15Xdenh3MBJWgg6yxBs6YeU8bwFdMQJLBJFSbQm6LqdSkUJZ6/9BEllDbpYJTYpr6Sj4yR2E8B2OetpsGQwDNbrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773576041; c=relaxed/simple;
	bh=pAp4mIs5rcucaOF46DRcrtTwtLz1bggEblZ6wvd+1iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUi51rJtd3Fzv4t5AZJg/pCQ4dsxKxXS4dZpg17kAnuNspQ4dHL7PNKv695YncjTXbb8oZCmo7wjP86CsfUK9Mjo/s3nWKOhLciF3XYztyW/tml8+VbWnPsacqA393D3X6QTVg8uCpdbKxCYhKdk/WBMBeE41Z+Tf6LuKlOBxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0dwHQFW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0dwHQFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773576040; x=1805112040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pAp4mIs5rcucaOF46DRcrtTwtLz1bggEblZ6wvd+1iY=;
  b=f0dwHQFWG8LvOWH+fWEZM0dXh6di5qjhF5ScMw67PS6yIMbZcHVssh+O
   fjRIBaI8nnxdbKqNBOHEYtTsR48fh+eqCjuIQH8E9fgnzQ3tX8Rbw94Bw
   2EkhwXPH2utwgqm56LynQfCGp7RffSwZDsdj3r/jRfSzkBV9iuZGerDMz
   dq4UvgcgAalrSsHRz93SXwEmwNZLGhd5JfXi7aCs/sbblYpZS5lLI2QxV
   SfRC94VrEDKsHkYVOPQEr/5uuyIA481o1pfNqp7jXWNdBowkK54WbDtq4
   59TNdWue/KY+DGRhj/FMASib2kkeYnib84lIJOddD75w/qWg+IMkSkb/E
   Q==;
X-CSE-ConnectionGUID: /HfzGj25Tfi5MuIpca9ysg==
X-CSE-MsgGUID: E6A4kWFsQt6pr9oIRASu0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="78214727"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="78214727"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 05:00:38 -0700
X-CSE-ConnectionGUID: nmtNx/SOTG2UtIY+kdlTWg==
X-CSE-MsgGUID: yfcZkdbBSYKNmHx/AkCjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="217538791"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Mar 2026 05:00:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1k91-00000000425-3Rvh;
	Sun, 15 Mar 2026 12:00:31 +0000
Date: Sun, 15 Mar 2026 12:59:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 8/9] arm64: dts: rockchip: add radxa camera 4k on rock
 5b+ cam1
Message-ID: <202603151240.lZH1Hn14-lkp@intel.com>
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
In-Reply-To: <20250430-rk3588-vicap-v1-8-b3bddf749914@collabora.com>
References: <20250430-rk3588-vicap-v1-8-b3bddf749914@collabora.com>
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
patch link:    https://lore.kernel.org/r/20250430-rk3588-vicap-v1-8-b3bddf749914%40collabora.com
patch subject: [PATCH 8/9] arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2051-20260314 (https://download.01.org/0day-ci/archive/20260315/202603151240.lZH1Hn14-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603151240.lZH1Hn14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603151240.lZH1Hn14-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
