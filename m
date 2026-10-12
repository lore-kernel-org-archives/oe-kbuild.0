Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFBD48B395
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808621; cv=none; b=BEKTnjYGarzB85wBguqayI8b+0hJhHFrkFvE0MgMrA0QA7sWQaSzZMqxo2baJG2/A4b3guTa+bZkF02fNyMnHaCO7EbTWnqbo4HS8sgtoTEJxbW7SmVEOHlCNxY6WCK5JAtjROhaCVvYAXZ0QzrRxqacsnTQV94JSG5dPNr70ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808621; c=relaxed/simple;
	bh=pk9sZx3XfaLjbEO/qDiccVA6QxYq5TjpoPPVg+feEWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fKO/kM524jp47J5TMO7NIhOoZrw1cYgFgjWDYsFVD5dtPUr+1T3dtmR+TkHD+a1o38K+pmpPrcKppGwkAdmDOYHDGnOwMXhxy4h/voZyVRtDgM9sIBH/hwCc1pOxkWQJ1ixI22FgmnLCdoyqk91BfjGJu6IZ7wyMBsKIh8yH4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhE/vhWd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhE/vhWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791808620; x=1823344620;
  h=date:from:to:cc:subject:message-id;
  bh=pk9sZx3XfaLjbEO/qDiccVA6QxYq5TjpoPPVg+feEWg=;
  b=ZhE/vhWdzBkldcr3K+6nAhT83J4iN9gcWXKwRLQnYezaHr6UFZy5Ic7W
   OBVuLcYLoT5+Q2S/OQdSgj45y0HnGwpr5sAN0W1jmYz7797gnMroop8cT
   6XsVbZV/tpZXp0y9y9BPIBIGEshc9mdRiJ6uqbjmZjAQpYqFb8eDO4AZo
   YFR8IAKXJEculA21ardnE51LyrihM8h1qh3TZdE7Y9HWNqKFadXEbGg/G
   J9cC0lddjOTI/+o3hIP+SA5fViubuUJNdChkxh45hGI9lbQ2rdt66fYjF
   zsP3yDRBXxqXxLYaqshWZV3jJ3qZaAboUTKflj7X9EQJWNKZ/R7YXKdXS
   w==;
X-CSE-ConnectionGUID: 8ouUxX4gRH2ByccxbsTa5g==
X-CSE-MsgGUID: xU2PL2clRv+BxJj+ch+MqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="412796"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="412796"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:36:59 -0700
X-CSE-ConnectionGUID: QNMoj+3jQGeSeAD/FhnjNA==
X-CSE-MsgGUID: JLvX32KCQ7GCiSYIMgu1Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="987472"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2026 05:36:59 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGFGy-00000000A3X-0AvH;
	Mon, 12 Oct 2026 12:36:56 +0000
Date: Mon, 12 Oct 2026 14:36:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.4-armsoc/dts64 60/68]
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb:
 /soc/video-capture@27c10000: failed to match any schema with compatible:
 ['rockchip,rk3576-vicap']
Message-ID: <202610121423.GBeylbQ8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Amin Gattout <amin.gattout@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Michael Riesch <michael.riesch@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.4-armsoc/dts64
head:   ae965b9856f033145e292b0c29082a26bcc45efd
commit: eea8ce042825cea71009cffc13bf564afaf7dbe4 [60/68] arm64: dts: rockchip: add radxa camera 4k on rock 4d
:::::: branch date: 2 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261012/202610121423.GBeylbQ8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610121423.GBeylbQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610121423.GBeylbQ8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/video-capture@27c10000: failed to match any schema with compatible: ['rockchip,rk3576-vicap']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
