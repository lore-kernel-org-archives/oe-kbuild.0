Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA45474E
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 03:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791170418; cv=none; b=eDa1fFf7Lpyu0CT4mnXBgQ1i1aC9YFVPQkRHMzwYGtnTQzXyLxgy9dWxTi4GAk9Qh+1r+jz34Xzh/3pcT9OlV6VpLZXc8W11mcB8RagxZu1xm4eYdsL8sVxHgps/VvtTdbiJpTcqQZ0Z1oO/6E2/tmerc/lofVN7AxxrslyStpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791170418; c=relaxed/simple;
	bh=KBKUTBE04IjG092G8nyeaH2Ux+zEixnpac/mOylhCpk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L5A99d3JZq8xq24an38au6gEfrbLSTty4L3uRfL3NESUQrxVlZe2bvk/15Ua+FFuMbWaun3fcUnksPftNHex9EoGlu1/tpaAL5XJ4D0Qj8/dlsJ9cNTJnEVKh4EL4dEv8Kw7KvBCsCJl6qBCtm6r5Vg3Mri+5kuLJZ0AZnZQxvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwnZNowk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwnZNowk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791170416; x=1822706416;
  h=date:from:to:cc:subject:message-id;
  bh=KBKUTBE04IjG092G8nyeaH2Ux+zEixnpac/mOylhCpk=;
  b=OwnZNowkhcZIbNj8d/xSXzRMp1KSB+Eb6NA6lB+lHuu/SOtk6CZvf387
   uwpFLZ86XeY186nkLEwRAEUfmxMu8gq4T0NmJeaJ/KxhXNTicnTyqh0Ja
   /OaiMN29VNvPOQdyRrAbeaWYPuNLQWYsc+WWE3dvfIjCNgwcqTfOTLVQO
   lB15jNmKEFmrKArg/FlWOg8FnZdx/Ta1t+Ggow6A/8TgMetH5M6iWaJom
   lFiS4VCRsOOZfOXunO3aR5JE26bdN052aVS44kkPGstwZXanIbvaZ1KbI
   SiQJ9eqOyRqTllzmUdZVTQ6BK/VkJTcZJH9peRpdKhRxvrfmmRwPvgd7f
   w==;
X-CSE-ConnectionGUID: aJaeQrNbRVyI+wx8nX7y0g==
X-CSE-MsgGUID: 36fhE05sR/iw2qc2dJ/+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="108213337"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="108213337"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 20:20:16 -0700
X-CSE-ConnectionGUID: 3rTbAKBQSjalwrm334PFlQ==
X-CSE-MsgGUID: Vw7JK+o4Tjmy0aXKadHhEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="275815161"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2026 20:20:15 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDZFM-000000000Xj-2u7w;
	Mon, 05 Oct 2026 03:20:12 +0000
Date: Mon, 05 Oct 2026 05:20:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb:
 audio-codec@11 (everest,es8323): compatible: ['everest,es8323',
 'everest,es8388'] is too long
Message-ID: <202610050531.ixQJ7ZxK-lkp@intel.com>
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
TO: BG9OXA <bg9oxa@163.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/BG9OXA/arm64-dts-rockchip-add-ALIENTEK-QuarkPi-CA2/20260927-215132
head:   3d704abed3e248083efe27e11af33a3fc31f6d2f
commit: 3d704abed3e248083efe27e11af33a3fc31f6d2f arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261005/202610050531.ixQJ7ZxK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050531.ixQJ7ZxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610050531.ixQJ7ZxK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb: audio-codec@11 (everest,es8323): compatible: ['everest,es8323', 'everest,es8388'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb: audio-codec@11 (everest,es8323): Unevaluated properties are not allowed ('AVDD-supply', 'DVDD-supply', 'HPVDD-supply', 'PVDD-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
