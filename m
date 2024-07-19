Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBDF4C6B
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721403751; cv=none; b=DwF3f1DDI5jxppi4Sn08RIZ2ew6No6YjpFJ0hJEobPfOtkHXP/7DNGCKpi2f/u3ZWyXNgL8+oijBpohjzpeKQ1gln3T7J0eVb/qzDUBwx9nfcHVsn9liUizdifk7gBJ2krYywQOM11s5uONJTfX4mr4Yz4u5IdQtK/dKow7VP34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721403751; c=relaxed/simple;
	bh=Yj9koRZ6Us4EmhtuI+L3uFjZ89NADwJ44uNMcEMT+ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhohsX3JyVO0X2J0VDQ4m6e57yq7zMJMZ7dckGfUydVndgN/HxsRSp39h51lslstpW+RjNn6OnEsJsisMPekk7a0cNqNVRNZ5o2S1xSQIs9fBYohZQJ2AzqYBX5A0sXmUdbRJx2D5nB5kmX2O/5FEWnOUdi9hrXoEQtAHPEHIkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JufQHDKE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JufQHDKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721403750; x=1752939750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yj9koRZ6Us4EmhtuI+L3uFjZ89NADwJ44uNMcEMT+ho=;
  b=JufQHDKEcUZOYbVAxjsWW+Ni4vC30XHDAR2rvff0atw+YkJ5i4ZtmDc8
   c7YrK71UH3WhwXyrn7oG6zB/7dNFLkWjCT/Umf/X8s+bWox7V7VYhrIT3
   /15vuOdj+zynNt7eq+39uJ9z5tnSboDz5eVuAvHwO/a0LzLTKHgYBgmq0
   2vay1EZysJB+A0dSj4+8q932wlhJkWF5/hU6Ti6AiteL8GMlIlBIdvA1U
   BAEr6qc5HHD4Ba4cMxYXo4RTm+EN7HNu6GAC+Jz6OxHGsrstSeqNDFZ/a
   MHU1e32nMDtLB7P+6eK0kEkhYddaADTm5HiBL7ScuMg68yvj2g8QxeAyt
   A==;
X-CSE-ConnectionGUID: f3dLBnvRQ8GJElOkHCvijw==
X-CSE-MsgGUID: wKdv8y42TVyaPo8NhT94yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30445629"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="30445629"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 08:42:29 -0700
X-CSE-ConnectionGUID: eHLAgfg0SdKQu94GNmqtGg==
X-CSE-MsgGUID: +SCWoXFGRxiIGUtAohJbQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="55348979"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jul 2024 08:42:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUpkX-000iJD-2k;
	Fri, 19 Jul 2024 15:42:25 +0000
Date: Fri, 19 Jul 2024 23:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2024-07-17 14/15]
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:48.18-54.4: Warning
 (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
Message-ID: <202407192300.jWDxktAp-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2024-07-17
head:   50e1ad525e8d7f5da20d264b4b3d30cc2409c320
commit: 9f6ea8e3503ec37d383e076b09cc56918c6deb49 [14/15] msiof
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-001-20240719 (https://download.01.org/0day-ci/archive/20240719/202407192300.jWDxktAp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407192300.jWDxktAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407192300.jWDxktAp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:48.18-54.4: Warning (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
>> arch/arm64/boot/dts/renesas/r8a77960.dtsi:1436.24-1453.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6e90000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:33.8-42.4: Warning (avoid_unnecessary_addr_size): /dummy: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +48 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts

d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  12  
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  13  / {
83772e1b44231e arch/arm64/boot/dts/renesas/r8a77960-m3ulcb.dts Geert Uytterhoeven 2019-12-11  14  	model = "Renesas M3ULCB board based on r8a77960";
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  15  	compatible = "renesas,m3ulcb", "renesas,r8a7796";
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  16  
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  17  	memory@48000000 {
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  18  		device_type = "memory";
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  19  		/* first 128MB is reserved for secure area. */
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  20  		reg = <0x0 0x48000000 0x0 0x38000000>;
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  21  	};
811a0d07e68ed3 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  22  
2a3ee629ed8b2f arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-01-26  23  	memory@600000000 {
2a3ee629ed8b2f arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-01-26  24  		device_type = "memory";
2a3ee629ed8b2f arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-01-26  25  		reg = <0x6 0x00000000 0x0 0x40000000>;
2a3ee629ed8b2f arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-01-26  26  	};
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  27  
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  28  	msiof_sound: msiof_sound {
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  29  		compatible = "audio-graph-card2";
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  30  		links = <&msiof_snd>;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  31  	};
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  32  
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17 @33  	dummy {
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  34  		#address-cells = <1>;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  35  		#size-cells = <0>;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  36  		compatible = "test-codec";
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  37  		port {
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  38  			dummy: endpoint {
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  39  				remote-endpoint = <&msiof>;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  40  			};
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  41  		};
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  42  	};
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  43  };
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  44  
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  45  &msiof0 {
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  46  	#address-cells = <1>;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  47  	#size-cells = <0>;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17 @48  	msiof_snd: port {
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  49  		msiof: endpoint {
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  50  			remote-endpoint = <&dummy>;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  51  			bitclock-master;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  52  			frame-master;
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  53  		};
9f6ea8e3503ec3 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-17  54  	};
31e12cb663b039 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  55  };
d6e381673d8762 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-07-07  56  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
