Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288C1DA32
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728815807; cv=none; b=bbeNyIDkknvW6rykU4jHC3URFLa9sl9iJA3i7mnO83hY6jbCTVs8EBFAo8o9qnHfl3Mo1xd555g9LkkU3HovuP2hNAz2sa/JfiyhIb9wBbtTZUVgTOj91dmhiFzLgfK0WumjKuTn367SEa9YM6TgBJI3BKtu4bYeQ09MeQv7ioA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728815807; c=relaxed/simple;
	bh=+h0nLV0YY4Raa7t9v91jNPqZbbZ2qf8xs6z8P8FnrXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1bUD5MRv0sRcb980dIkqTfgVJ0ks68sk8E30YLok8Qm2UGgf+T+oh2dGvO4sT3rUEs+pD8wquhSD2utjdpSKipbjWDFa19PFMie4//nuzoOE1wcryzDCsKvL53reFG+rzZ6/Yv0ZH48lA/XSF18LsLS5+RA4MhHtEHUWiPqTtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECViJoVd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECViJoVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728815805; x=1760351805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+h0nLV0YY4Raa7t9v91jNPqZbbZ2qf8xs6z8P8FnrXE=;
  b=ECViJoVdDDJfYfLiHGMB7cUssN3w3W7Mt/NXPEDZQegAfyh4rMBSe9Hv
   pDgvkQuEYXepYdfUMXGrNeNu/m9NgD7XLy0zptxsANmjTz5c3i2Tjj2ZN
   2hRqB47mcEvu0UFLCG5kGnzb13mbRrMe+l/mCbwOgLPycK1Q4fJEFa34+
   8rVqv4QzQ8yfx77X3IG57ZiinqzaF/t21USdLOj24UQmfyBF7XP9AzxPA
   GrM7Aa2hZn9ihIdzXgN0hOHd5KyUFYgycv0It79jgSRGdkqxS7jtT+Gj9
   9OndecI6xPZRsUbbVb5JjKCLKPMz06h/EO4yVxGIdJFTGmntj5oSHfPWA
   w==;
X-CSE-ConnectionGUID: +B5qzoD9QIylNzW4I7iY5Q==
X-CSE-MsgGUID: snTGR8XISa6FVHCL8RfOWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27976072"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="27976072"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 03:36:44 -0700
X-CSE-ConnectionGUID: ET8mvvQHR4Wp/bYrHy3Oxw==
X-CSE-MsgGUID: 0DOkcRhsQdmf7J+yiwu5Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="108108784"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Oct 2024 03:36:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szvxp-000EIT-1f;
	Sun, 13 Oct 2024 10:36:41 +0000
Date: Sun, 13 Oct 2024 18:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202410131819.3yvvqzi0-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131819.3yvvqzi0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131819.3yvvqzi0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410131819.3yvvqzi0-lkp@intel.com/

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
