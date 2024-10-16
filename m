Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CB95478E
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 21:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729112987; cv=none; b=hredXBZEa5tWgYgcwYh3RByPfDFX8mXhcFOGkEdsRYEEO/mxL9bUV4yca3o9ftLuB5lhg86zogiUL/KFWYpyvzNl4erx5IIdAJQhzDMAhCo3U8XLitGfIYOUFxJJW1HaT5xKEBS+wV/LTHv0NGOhBzpwuVlXy1TaH2w9h9lYiME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729112987; c=relaxed/simple;
	bh=medqALu/LcKkUcsj0NPunddNFhu6NgDLuaJW1Uqnd0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGt1vFgCSAF1XLpj7tZx3fRU6hsNVWhF2SviU5UTNvx1SarISLY45y0MtaGxVBUYrGlKE7moiS/WNkD2JwYUKbmtf9S2sqRIsB+sO90iJncsAi0p6ol77FN6Axlz3NCBdz16E5N1VKn8UWagPQUrwQAlz/BIdHQpdmpsHDzuLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqL2tm4x; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqL2tm4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729112986; x=1760648986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=medqALu/LcKkUcsj0NPunddNFhu6NgDLuaJW1Uqnd0o=;
  b=QqL2tm4xWbjAyG5HXkE+VdS2zU2CyNncIKxyyiZF3vG2TUXgUuKY+aF/
   3Rbuhd6CPP+6YALS+7rkT/YTa534Bw2f/JCjMGrL/YinGpGNc6vkPeDMQ
   /jHeH9IbfJpT0AIK4cRBYfEwOFtXz1GpyHT5U2CnfutTa6L64Z88pOeNX
   9vYunGvCkX3+wITlnoc3DaBVvAE0cFJNUfzW3MUdD5krv7R54S3e3HSEa
   iAk3ZW2mcU0+8sLyrZ7zd5gb5jsVzZsjNjnuSTta5phIyXIQqeH/dBSYV
   jeKhBoCgalzXpyorxmd5LkgaTM7mHy2W5H41v7aLxfNZmVgtJaaG0ogKu
   g==;
X-CSE-ConnectionGUID: qJhnIfshSQGZOwaPbmQAfA==
X-CSE-MsgGUID: w57KwfiFTWSQ4xVYmTZNtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28367030"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28367030"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 14:09:45 -0700
X-CSE-ConnectionGUID: fylpyOy4Q3e8uqVv/JnEZw==
X-CSE-MsgGUID: H23dfYeLTg2RF9trG2Z84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="82886584"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2024 14:09:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1BH3-000LQN-2Q;
	Wed, 16 Oct 2024 21:09:41 +0000
Date: Thu, 17 Oct 2024 05:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202410170512.iEVlLJz5-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Devarsh Thakkar <devarsht@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 1eef2deae95a3f819afbe06798f1fd70a0048e11 [376/382] arm64: dts: ti: k3-am62a7-sk: Add peripherals and pinmux to enable display
:::::: branch date: 26 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241017/202410170512.iEVlLJz5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410170512.iEVlLJz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410170512.iEVlLJz5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +844 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi

555df2427c6270 Aradhya Bhatia 2023-04-21 @844  		dss_ports: ports {

:::::: The code at line 844 was first introduced by commit
:::::: 555df2427c62703f82029d150939d027a85c50c2 arm64: dts: ti: k3-am62a-main: Add node for Display SubSystem

:::::: TO: Aradhya Bhatia <a-bhatia1@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
