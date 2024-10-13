Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291C6231C82
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 00:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728777691; cv=none; b=cj8dT0/5fs5d2fbaQZtYEiujgGm+SwCT6iHE3esQzmxW+Qv6+/hFGkehLnkwGpwWwjZfDkxFgfIxchsa52fmv8PGg0xI4wIOjY3aPpWkFeRf/AhGUvo4gi6cb+uW3gEyIhMYFj53HTr68pqYezjb86Jf0KanXir1ZiYo42iCpxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728777691; c=relaxed/simple;
	bh=cioEGfc271OhO/J0OHnhKrM6drupOhXjaOEna//352o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjg+vSgQUQ9Kxvh0QYIyn1gqwFy8vH/tlG7CXscaWhD6/Eh+j5JXN63rC0g6J4qFJ3BIX7j+LFJ+xTBnQCMxiE5vKv7b46Ctjb0ckxHrBUOUNT5Uwn+aY11PLImFXjHt7ZpF6wDC4uA0ktP9/vnBMIIKt6u98cdMjwiH5v28WdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kecK8OW9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kecK8OW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728777689; x=1760313689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cioEGfc271OhO/J0OHnhKrM6drupOhXjaOEna//352o=;
  b=kecK8OW9rHg/dSfKK1QF4FLBu/3htDMxUtlqJvuOqLscrPZ/H92MOwlW
   8BWrXxO1uEdjqyQ14lcZhG62DEE6TY7XlYw4Xx4TIeIBs0Ihez6hspZad
   gNdfY1a1LB6Bc7oPFatTNSs6FJWTeFTs9g6tBGaZRjwYW2RtysywkDfLv
   ov02c76RnxiLUmtcv/iLGIKUOLKnMYV3xSAFRtbF54lzy5AL7SWV43Di1
   yDuCgqKJdUgOcWpI/GYW3mZ7JWXdcF7hRixZJaz+LpIRCtEJTiUkI/uMw
   ZteppIXF3Wy6/gA3VmLC45FyHEQPxFJnAGBRUKbQaddbevbecrS5tsa1x
   Q==;
X-CSE-ConnectionGUID: ZG3t81dGRBS0C33gIE/r3g==
X-CSE-MsgGUID: JSITp4ZDTXWmyere2VGmiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28026823"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28026823"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 17:01:27 -0700
X-CSE-ConnectionGUID: t4mXmwF/QFmr48ntJetmbQ==
X-CSE-MsgGUID: haA43SRTQN2xctI2x7PQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82243712"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Oct 2024 17:01:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szm32-000Dsp-07;
	Sun, 13 Oct 2024 00:01:24 +0000
Date: Sun, 13 Oct 2024 08:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202410130727.rlJuKd9k-lkp@intel.com>
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
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: 1eef2deae95a3f819afbe06798f1fd70a0048e11 [376/382] arm64: dts: ti: k3-am62a7-sk: Add peripherals and pinmux to enable display
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241013/202410130727.rlJuKd9k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130727.rlJuKd9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410130727.rlJuKd9k-lkp@intel.com/

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
