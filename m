Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717371AB53A
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jan 2025 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451117; cv=none; b=dK9CdsDtYJs9cNLLEATdv8MQBpbymBJcDby02DQftQ2zwWMNZoXLSAhm3e8p+h3i7Ovr30KKpps3k0pUsFZGJ/QjnYAjD3mo6zOwBmfdJG3ADSxk6NTNFOwyhF9L/7nxZ1Tnnlfi2TyxNxxZUlMJzsBegcw1j0dv8EQuMAsM/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451117; c=relaxed/simple;
	bh=Sgl2vdCQiZKNuwHxaUppsRB8nH+RBVZxZQENeZHTad8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRd+Bk/IafA+DJ+IDpgiuQrEmxFWwoxdg12syZBRkyQRy+Or+6SZJpexlF0dA1vsAxELD3PoBHGVCBwDr3sdVc4U4jQVCYnwxyOJWg9OftB6Wxl8vzDh1vtWgQElo5RQ97e9ox0GIMHHyF+TGLiWJMkDfGF//KL1qSiowVl70L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drHUGKpf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drHUGKpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737451116; x=1768987116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sgl2vdCQiZKNuwHxaUppsRB8nH+RBVZxZQENeZHTad8=;
  b=drHUGKpfuyFMbEnO0CtLuPhlvImQp7GO7i3c883TdK7+50Wc4mjLGshX
   BGOSap6HTaTTZ6qrrL7Z/5M5icd6lxJT35I4A3pehIdciaymHM1lTqsyq
   tJIMIxrMSD19I/KwLriQwu5ClBH38zDXZ/wvvXmB44gYpD6qHe1fONDid
   ICSLEIlEBW2UMFyDQp/3Jegv2tX+3QYUumZaTeJk1reFhsWdT2/C+iTfZ
   INsIZnyNpvxf3Xmy1vdJzH/r/bPi8DiKxtzxH41LI70k8ubHyvs+GSJTC
   D+9N7AeRSDyDZdsNHy+RAf3jrtouAEwmuekeietjpTWaPqhs4fucUKfZP
   w==;
X-CSE-ConnectionGUID: QnZ4lto5TXihnu7NYyn8QA==
X-CSE-MsgGUID: mrZ+mb2zSXKfA+bRZOFYaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38014376"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="38014376"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 01:18:35 -0800
X-CSE-ConnectionGUID: qSXiL+3wQKWVkG0SFjXc0g==
X-CSE-MsgGUID: o+bY8K2NQc+O3fuTnPePqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="106555559"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2025 01:18:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taAP1-000Xsj-2X;
	Tue, 21 Jan 2025 09:18:31 +0000
Date: Tue, 21 Jan 2025 17:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/ep88xc.dts:76.12-89.5: Warning
 (unique_unit_address_if_enabled): /soc@fa200000/mdio@e00: duplicate
 unit-address (also used in node /soc@fa200000/ethernet@e00)
Message-ID: <202501211717.LAVjf0OO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
commit: c5aebb53b32460bc52680dd4e2a2f6b84d5ea521 powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: powerpc-buildonly-randconfig-r003-20220827 (https://download.01.org/0day-ci/archive/20250121/202501211717.LAVjf0OO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211717.LAVjf0OO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501211717.LAVjf0OO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/ep88xc.dts:36.9-39.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/ep88xc.dts:76.12-89.5: Warning (unique_unit_address_if_enabled): /soc@fa200000/mdio@e00: duplicate unit-address (also used in node /soc@fa200000/ethernet@e00)

vim +76 arch/powerpc/boot/dts/ep88xc.dts

11c146cc19df33 Scott Wood 2007-09-14  10  
11c146cc19df33 Scott Wood 2007-09-14  11  / {
11c146cc19df33 Scott Wood 2007-09-14  12  	model = "EP88xC";
11c146cc19df33 Scott Wood 2007-09-14  13  	compatible = "fsl,ep88xc";
11c146cc19df33 Scott Wood 2007-09-14  14  	#address-cells = <1>;
11c146cc19df33 Scott Wood 2007-09-14  15  	#size-cells = <1>;
11c146cc19df33 Scott Wood 2007-09-14  16  
11c146cc19df33 Scott Wood 2007-09-14  17  	cpus {
11c146cc19df33 Scott Wood 2007-09-14  18  		#address-cells = <1>;
11c146cc19df33 Scott Wood 2007-09-14  19  		#size-cells = <0>;
11c146cc19df33 Scott Wood 2007-09-14  20  
11c146cc19df33 Scott Wood 2007-09-14  21  		PowerPC,885@0 {
11c146cc19df33 Scott Wood 2007-09-14  22  			device_type = "cpu";
998c610363b26f Kumar Gala 2008-04-17  23  			reg = <0x0>;
998c610363b26f Kumar Gala 2008-04-17  24  			d-cache-line-size = <16>;
998c610363b26f Kumar Gala 2008-04-17  25  			i-cache-line-size = <16>;
998c610363b26f Kumar Gala 2008-04-17  26  			d-cache-size = <8192>;
998c610363b26f Kumar Gala 2008-04-17  27  			i-cache-size = <8192>;
11c146cc19df33 Scott Wood 2007-09-14  28  			timebase-frequency = <0>;
11c146cc19df33 Scott Wood 2007-09-14  29  			bus-frequency = <0>;
11c146cc19df33 Scott Wood 2007-09-14  30  			clock-frequency = <0>;
998c610363b26f Kumar Gala 2008-04-17  31  			interrupts = <15 2>;	// decrementer interrupt
11c146cc19df33 Scott Wood 2007-09-14  32  			interrupt-parent = <&PIC>;
11c146cc19df33 Scott Wood 2007-09-14  33  		};
11c146cc19df33 Scott Wood 2007-09-14  34  	};
11c146cc19df33 Scott Wood 2007-09-14  35  
11c146cc19df33 Scott Wood 2007-09-14  36  	memory {
11c146cc19df33 Scott Wood 2007-09-14  37  		device_type = "memory";
998c610363b26f Kumar Gala 2008-04-17  38  		reg = <0x0 0x0>;
11c146cc19df33 Scott Wood 2007-09-14  39  	};
11c146cc19df33 Scott Wood 2007-09-14  40  
11c146cc19df33 Scott Wood 2007-09-14  41  	localbus@fa200100 {
11c146cc19df33 Scott Wood 2007-09-14  42  		compatible = "fsl,mpc885-localbus", "fsl,pq1-localbus";
11c146cc19df33 Scott Wood 2007-09-14  43  		#address-cells = <2>;
11c146cc19df33 Scott Wood 2007-09-14  44  		#size-cells = <1>;
998c610363b26f Kumar Gala 2008-04-17  45  		reg = <0xfa200100 0x40>;
11c146cc19df33 Scott Wood 2007-09-14  46  
11c146cc19df33 Scott Wood 2007-09-14  47  		ranges = <
998c610363b26f Kumar Gala 2008-04-17  48  			0x0 0x0 0xfc000000 0x4000000
998c610363b26f Kumar Gala 2008-04-17  49  			0x3 0x0 0xfa000000 0x1000000
11c146cc19df33 Scott Wood 2007-09-14  50  		>;
11c146cc19df33 Scott Wood 2007-09-14  51  
11c146cc19df33 Scott Wood 2007-09-14  52  		flash@0,2000000 {
11c146cc19df33 Scott Wood 2007-09-14  53  			compatible = "cfi-flash";
998c610363b26f Kumar Gala 2008-04-17  54  			reg = <0x0 0x2000000 0x2000000>;
11c146cc19df33 Scott Wood 2007-09-14  55  			bank-width = <4>;
11c146cc19df33 Scott Wood 2007-09-14  56  			device-width = <2>;
11c146cc19df33 Scott Wood 2007-09-14  57  		};
11c146cc19df33 Scott Wood 2007-09-14  58  
11c146cc19df33 Scott Wood 2007-09-14  59  		board-control@3,400000 {
998c610363b26f Kumar Gala 2008-04-17  60  			reg = <0x3 0x400000 0x10>;
11c146cc19df33 Scott Wood 2007-09-14  61  			compatible = "fsl,ep88xc-bcsr";
11c146cc19df33 Scott Wood 2007-09-14  62  		};
11c146cc19df33 Scott Wood 2007-09-14  63  	};
11c146cc19df33 Scott Wood 2007-09-14  64  
11c146cc19df33 Scott Wood 2007-09-14  65  	soc@fa200000 {
11c146cc19df33 Scott Wood 2007-09-14  66  		compatible = "fsl,mpc885", "fsl,pq1-soc";
11c146cc19df33 Scott Wood 2007-09-14  67  		#address-cells = <1>;
11c146cc19df33 Scott Wood 2007-09-14  68  		#size-cells = <1>;
11c146cc19df33 Scott Wood 2007-09-14  69  		device_type = "soc";
998c610363b26f Kumar Gala 2008-04-17  70  		ranges = <0x0 0xfa200000 0x4000>;
11c146cc19df33 Scott Wood 2007-09-14  71  		bus-frequency = <0>;
11c146cc19df33 Scott Wood 2007-09-14  72  
11c146cc19df33 Scott Wood 2007-09-14  73  		// Temporary -- will go away once kernel uses ranges for get_immrbase().
998c610363b26f Kumar Gala 2008-04-17  74  		reg = <0xfa200000 0x4000>;
11c146cc19df33 Scott Wood 2007-09-14  75  
11c146cc19df33 Scott Wood 2007-09-14 @76  		mdio@e00 {

:::::: The code at line 76 was first introduced by commit
:::::: 11c146cc19df337f4af42dade9e4fca33c5a54ee [POWERPC] 8xx/wrapper: Embedded Planet EP88xC support

:::::: TO: Scott Wood <scottwood@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
