Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F041A270
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895859; cv=none; b=LMP4FM+OZO85eNH1MtHL+GmWriNyQHM6QTOC/WxaTxfulEKMdGwSAe+xiYbIupNp8CEY3IqH8CpAcJvVx8F09XhDBuMb8gJcvNQxd78Qp18nO0ogNFZS+cMx1kdyDb4ty8sAc4Asj1MVeCGVlF+21Ey8IbticfdW25TBewD6iZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895859; c=relaxed/simple;
	bh=WzDY1FW16YbUzx7iNCrApfI3aAriqe9Y7RIBvtKwGkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJqnfOLHbG7u742xPUb6vafZ5KWcby9sENQmqE7eCaNOCzhmCg8avtOzZ0YJocO5m5leCgNAD03kJvEGIpWR2yxgPWni4xQTM+9aVWOtXHvK6WXiJF2RksdhHSPtbkJAEsxvnMzrZO6frmHrvgTQQDMq+Jd7nL+O44CaTtSFuVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HU2j7VzC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HU2j7VzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728895856; x=1760431856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzDY1FW16YbUzx7iNCrApfI3aAriqe9Y7RIBvtKwGkQ=;
  b=HU2j7VzC46EsMRcDU3K7aKhpcVi5Jxbpfn+5j6r1+B8ijx2VJaPeKID3
   FQTM9wh63CtL9rWLVDZVshL3YxbZuW4LkIplcOjnJ66lQc3+qMHD9jBUX
   t+FbLViwuR7729NrpkKcxL0JUF5bPJRZmUgxEKzGT/m11FCMK01u5O6Cm
   QOWmSsMJIobpyEZZVgOGcOtYd5FEHnsP5bej1dsQFcMHddZALEcFJCbGo
   KEypu4WNC5U44aRFoa70tO8cCZ7yeKPNKG0tAQSMPHGPp8OcSKjwqaeq6
   owc5jOdad4h07VAlmp++P/XdHb6irCO2YIGINTkYGquGxYyqgCJ2+R4V7
   A==;
X-CSE-ConnectionGUID: dRAn2qCBQzqMpUWMOLwUWg==
X-CSE-MsgGUID: Fi+CU7VaTgS4cBOaUqazFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39630491"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="39630491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 01:50:56 -0700
X-CSE-ConnectionGUID: wbZmYYV8QRib4Q3QsdXYtA==
X-CSE-MsgGUID: PMcZ9f0/RGuNJn1ew5ulXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="100844867"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2024 01:50:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Gmz-000F6N-1K;
	Mon, 14 Oct 2024 08:50:53 +0000
Date: Mon, 14 Oct 2024 16:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202410141649.w0Kd3cHf-lkp@intel.com>
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
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241014/202410141649.w0Kd3cHf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141649.w0Kd3cHf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410141649.w0Kd3cHf-lkp@intel.com/

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
