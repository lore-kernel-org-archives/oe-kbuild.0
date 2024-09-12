Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D178D1D545
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Sep 2024 01:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726104989; cv=none; b=ls++h227wQwP5DW0Z2mJD6rMJNeeK5k9Rkl/BZJjvgfC7IjWTvsL+uS8w+16XElMb0EFutWkMpR/yjUA9nUhzCWK8Mh9P8MTv1F5Hr3ZEQvrdyhl7nV7hbYo2kWkHBiQ5WvwNiEMvTZFyIaQw93+8mbTiYhc05cytH+FpktwQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726104989; c=relaxed/simple;
	bh=RVjKzEk7lPk69RFAmLtO1CAXQf9GgxjWnzjydTuYmBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dd7kiRmQsku1QgWN7AUJWII7kQpyuff13oPBPX2wc5yze2QLY36G5tXk8ci8p+h1ahn3thMQEjRlzWVBRRROHr62foUE6XryX7CEQ43NgBEwvbLWmRz0QPrq9JjOhb/WRaNpYADs0gE44Haor6SvNo3RTWOJPC1rKS4whxIiv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKiVPkVz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKiVPkVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726104988; x=1757640988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RVjKzEk7lPk69RFAmLtO1CAXQf9GgxjWnzjydTuYmBM=;
  b=cKiVPkVzayDriIFNBitPFPP5SpVxwgzAnPmThmjRnccRotXo3ITewdCS
   ZAVLggSKIn8PpeULbY/zZYAA2eQR0Memb19Cr3ZJPd7FsxdHtYQma+p2L
   pSeW54UC6TT4LI5aLwFnAi6EAy1VawDxgcQc0jdNzixilaZhf23u6sbXx
   k2Ek0nk3hymMnFTGltGfCHPJfIWVomYe6EPCFOQT+toaqXuvnAn3lD1mS
   5v+3QNjGAvxJiSYFz5NsipRHMt0pDSsiHsTmNO8rzu7qfGDo7iu4ugG1d
   UScmc2VuZyHcPeAgISdiJi+PwfmWTh7qT+wEajP/Dm34DGzcqA05c2Xyo
   w==;
X-CSE-ConnectionGUID: /RW3ibb1QaeazsSgyHQ5IA==
X-CSE-MsgGUID: 50ppsIKISJeyoLCnfJ+2Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35528458"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="35528458"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 18:36:26 -0700
X-CSE-ConnectionGUID: pfrVTPrJTEqMc1IigZ08ZQ==
X-CSE-MsgGUID: sVQKqp05SUa9plb3Mstafg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="98376840"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Sep 2024 18:36:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soYkx-0004MY-0I;
	Thu, 12 Sep 2024 01:36:23 +0000
Date: Thu, 12 Sep 2024 09:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b 3/8]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:31.3-10: Warning
 (ranges_format): /reserved-memory:ranges: empty "ranges" property but its
 #address-cells (2) differs from / (1)
Message-ID: <202409120916.hZncDbGI-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b
head:   66d8d7525e01c7da347265bbef7f4da80d3e0dcf
commit: 2fdbc6d873465cc698f4f3fc97ac3970d00cdd65 [3/8] ARM: dts: broadcom: Add Genexis XG6846B DTS file
:::::: branch date: 27 hours ago
:::::: commit date: 28 hours ago
config: arm-randconfig-004-20240911 (https://download.01.org/0day-ci/archive/20240912/202409120916.hZncDbGI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120916.hZncDbGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409120916.hZncDbGI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:31.3-10: Warning (ranges_format): /reserved-memory:ranges: empty "ranges" property but its #address-cells (2) differs from / (1)
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:31.3-10: Warning (ranges_format): /reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from / (1)

vim +/ranges +31 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts

2fdbc6d873465c Linus Walleij 2024-08-19   9  
2fdbc6d873465c Linus Walleij 2024-08-19  10  / {
2fdbc6d873465c Linus Walleij 2024-08-19  11  	model = "Genexis XG6846B Ethernet layer 2/3 router";
2fdbc6d873465c Linus Walleij 2024-08-19  12  	compatible = "genexis,xg6846b", "brcm,bcm6846", "brcm,bcmbca";
2fdbc6d873465c Linus Walleij 2024-08-19  13  
2fdbc6d873465c Linus Walleij 2024-08-19  14  	aliases {
2fdbc6d873465c Linus Walleij 2024-08-19  15  		serial0 = &uart0;
2fdbc6d873465c Linus Walleij 2024-08-19  16  	};
2fdbc6d873465c Linus Walleij 2024-08-19  17  
2fdbc6d873465c Linus Walleij 2024-08-19  18  	chosen {
2fdbc6d873465c Linus Walleij 2024-08-19  19  		stdout-path = "serial0:115200n8";
2fdbc6d873465c Linus Walleij 2024-08-19  20  	};
2fdbc6d873465c Linus Walleij 2024-08-19  21  
2fdbc6d873465c Linus Walleij 2024-08-19  22  	/* 256 MB RAM */
2fdbc6d873465c Linus Walleij 2024-08-19  23  	memory@0 {
2fdbc6d873465c Linus Walleij 2024-08-19  24  		device_type = "memory";
2fdbc6d873465c Linus Walleij 2024-08-19  25  		reg = <0x0 0x10000000>;
2fdbc6d873465c Linus Walleij 2024-08-19  26  	};
2fdbc6d873465c Linus Walleij 2024-08-19  27  
2fdbc6d873465c Linus Walleij 2024-08-19  28  	reserved-memory {
2fdbc6d873465c Linus Walleij 2024-08-19  29  		#address-cells = <2>;
2fdbc6d873465c Linus Walleij 2024-08-19  30  		#size-cells = <2>;
2fdbc6d873465c Linus Walleij 2024-08-19 @31  		ranges;
2fdbc6d873465c Linus Walleij 2024-08-19  32  
2fdbc6d873465c Linus Walleij 2024-08-19  33  		secondary-boot@0 {
2fdbc6d873465c Linus Walleij 2024-08-19  34  			no-map;
2fdbc6d873465c Linus Walleij 2024-08-19  35  			reg = <0x0 0x00000000 0x0 0x00008000>;
2fdbc6d873465c Linus Walleij 2024-08-19  36  		};
2fdbc6d873465c Linus Walleij 2024-08-19  37  		pmc3-firmware@8000 {
2fdbc6d873465c Linus Walleij 2024-08-19  38  			no-map;
2fdbc6d873465c Linus Walleij 2024-08-19  39  			reg = <0x0 0x00008000 0x0 0x00100000>;
2fdbc6d873465c Linus Walleij 2024-08-19  40  		};
2fdbc6d873465c Linus Walleij 2024-08-19  41  	};
2fdbc6d873465c Linus Walleij 2024-08-19  42  };
2fdbc6d873465c Linus Walleij 2024-08-19  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
