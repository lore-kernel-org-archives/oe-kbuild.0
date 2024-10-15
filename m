Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232591B0F15
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 22:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030858; cv=none; b=u4l4R9qs2s5VcAeoGHbqc2DzvWXTr/SKuW35q112nk397bcSbtajwXOTc7fhwArf549TGHdUUeXHEy0mUYeI2FfBG0RxGUN2JiXXXeYiYz9MzMpzIzbBWlKxQVCh/DMMd/Bp+XSjfJ4ZeWPH8QwDEwG5v/Mh1n+NZu3OGi6xIos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030858; c=relaxed/simple;
	bh=BfPLCzt8mKOTsG14exI53HiBGUes3+8pscHh5Lnv4oI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UxAli7oZlUnEIHzZa38AOmeI00mDXwnMkq1oV9JtjTOpiR4HzCeEnBwbRYgHgSqABO4OFOB7o5tNR8dMi0SHYZt32bNZDO4t4ydxOvUgtP9C8AZK4Rm9VtX/SRB5HHQMb1lDxHTWTk+sWEPahJPn3NVxusC5tmNo/f2iwfP9H2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUHfGje1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUHfGje1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729030856; x=1760566856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BfPLCzt8mKOTsG14exI53HiBGUes3+8pscHh5Lnv4oI=;
  b=WUHfGje1uAm+YSwqwIUmYObIM9C8uhP09JxxOIjtAuVig/qTCFirX0rn
   OTTnRiDvdD0TSapn3tnwNJZws7FigEigsT1yEPspGzM0ijsObtEWv6G+N
   KDfUut0Ic7iM14ZAJrodkSSm9521Y4USjDG3b3Jytt3Xzzms69yPIea1+
   BGZrRZnf2vth1EeSLV7RpXsVWrgUfMWuEyuy0JVKpSTeE6aTNOasosua3
   WL2IX0izj8yuo4Uqb4ltoO2rcnp6XRb1v7hHll8ILbO8/MT9FFh5lztSh
   8n+InuqsORIFsnh9uCzDEcWcclc17zE+ZvclP/qYxPfNNFm20Zt78kK7x
   Q==;
X-CSE-ConnectionGUID: EQfLu4ZVQHm73M238Gnc3Q==
X-CSE-MsgGUID: uFqvoY7MTs2H1P977/0AYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="53864076"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="53864076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 15:20:56 -0700
X-CSE-ConnectionGUID: f8MjTRm+SOmZIE/N3FB2/Q==
X-CSE-MsgGUID: QCxMDkGtQhujNlxyb9g7vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="101350876"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Oct 2024 15:20:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0puO-000K0B-2e;
	Tue, 15 Oct 2024 22:20:52 +0000
Date: Wed, 16 Oct 2024 06:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202410160604.M1XzjQya-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241016/202410160604.M1XzjQya-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160604.M1XzjQya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410160604.M1XzjQya-lkp@intel.com/

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
