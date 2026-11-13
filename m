Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602929;
	b=Z7jRodpn4jEYCK96RhU3xAxp9tXt3cLO0iBjjqmEJVmmWm4qCXnEeUhtv859vU12KP/G
	 DhU5IwGpyEY7u5fA/s7940zS5XcHxhgx4vR2w48Sn/MCme5s0QGqbd2qNta+537IT8bHK
	 KT3FjHzp9cvxbKOzSuNHsD6wuB93MjpteZPEODHulKVQQ1k1KWb27P7Xj2paReRfVuDeZ
	 lskvc7RPqCEgarSMPKVA7B2Omxz24a4vC14x4FM32P/EF2/8umpEhXeOcAgq3fRCfzxsc
	 VDq3mVXzdOXiTvfziX7S9gsOxFvGQ5TqgmPitEetjvlOkFSHmLVd1NAikusM6a0GLEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602929;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9mRYouR4jt/1/0FKR5oT0mVDyhz39OyA9ePIgCyQcNw=;
	b=17R13sZMfwJlDzz1a2XbjM++ecESKPT5wD7YQB87Fp5OYMxV9qQvF/yXkLiynWDbcbcL
	 zn5NxfYLCPht5QUFd5whl+bilhwEJFlnr3OlBtkMh9gyv2TSH7jz5wD6WawtCA/fEccBW
	 0Fxp9sz56VFfKu0Z5g2I0knNZzk/vdH1oYzRTFHMv8t/Api/MY3dH+U+nqOnF9SH5e02u
	 rw3n5VBoym3IVADr7zVV29CMhNSNpF9n/o1/NzH1qOpqIh8MYyK1mBIvoC0I3OFDPO68N
	 tF8IgXVAxFyJTIiKD2YK3Ctblev1ovuJftJ+w3q4mFSj5tH0xE62V6cdsvqQQ/eiIQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZlFuj7uv;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892AE606A33E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 20:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892AE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZlFuj7uv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794602929; x=1826138929;
  h=date:from:to:cc:subject:message-id;
  bh=EedZFND06MDA38F6Yn4AXFlL6rnIELWq5E/OoHWAmUw=;
  b=ZlFuj7uvVzrNvIQrpY0oKZhhWopvQuCDFuXbO5NWAx38ez34veoF9DUv
   qzmHYk3pfG9v8eFBqEIuhyIQYNQ3QwE7G/gSviUJjbzahuYkYHF8dm6XL
   KVNpswT4TfeFZKjRKfIQbj9uhpPjyZVuXiv5vNA1DNizR4Cx6pT3GW489
   U/HeEJD8RyzZRcd0Ye2QzrMg06vKrLV9uybhluu5p9+qAaLBhR23zn2SJ
   n/UCHZ21iWw82kYSWI6PeDTLgKA0r4G/7/HQrQR7iUWwwLbkwBJiSC3tY
   F+AXGMsPN3R1WmXjdOmgRm5Jqfl4Nr9Ji5yN/U7OtSPWeKGsnkWJdKQrh
   Q==;
X-CSE-ConnectionGUID: gf5Zk9zMTni5fQ1yOPVH3g==
X-CSE-MsgGUID: Lh+pr3OcQMCawT8NMDRS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3436113"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3436113"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 12:48:48 -0800
X-CSE-ConnectionGUID: tXMdz8F1QsSh+ClAlUe7Tw==
X-CSE-MsgGUID: K8B8BrusQQGv4Xb6ZuZ9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8899318"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2026 12:48:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRyCS-000000001L5-3r84;
	Fri, 13 Nov 2026 20:48:44 +0000
Date: Fri, 13 Nov 2026 21:48:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jonhunter:tegra/for-next 11/17]
 arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dtb:
 memory-controller@2c00000 (nvidia,tegra238-mc):
 external-memory-controller@2c60000:reg: [[0, 46530560, 0, 589824]] is too
 short
Message-ID: <202611132119.fh3u8ydp-lkp@intel.com>
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
TO: Jon Hunter <jonathanh@nvidia.com>

tree:   https://github.com/jonhunter/linux tegra/for-next
head:   1e6bee2ebeff6af815670f23f7a0abec5eb2581f
commit: dacef03b5584f575bd53cc29fdf8588432639f2c [11/17] arm64: tegra: Add more devices for Tegra238
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611132119.fh3u8ydp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132119.fh3u8ydp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611132119.fh3u8ydp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dtb: memory-controller@2c00000 (nvidia,tegra238-mc): external-memory-controller@2c60000:reg: [[0, 46530560, 0, 589824]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra186-mc.yaml
>> arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dtb: pmc@c360000 (nvidia,tegra238-pmc): '#padcontroller-cells' does not match any of the regexes: '^[a-z0-9]+-[a-z0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra186-pmc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
