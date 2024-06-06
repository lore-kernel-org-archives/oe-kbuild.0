Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B308198E8F
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690889; cv=none; b=imDrbLihs+wdP7RhtdoU/rT/kcohYoaouD6M7LUKfQF0gHsRSJBvQbtSq331CmFj/WBaavaPNfh0k5KRF4SZcsnhf/kZ5K9eVZ7t4N01IwzCVPZFaKuqcrpG+EgL1/QDaaNVZKRGQR5OlwO9sf5fgxmokJRHvVVonCbkZDtE8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690889; c=relaxed/simple;
	bh=jMsO1la6pwkSD46DSTkKmMQcP7s2/53LcGKXgeI7vPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZuvJVUXO2N2vcgFfBJJlG05yOKTVDLJLdODrdnOGc07dRsVBu+T8s40F27Ee45+FIahMPdGVfhxpNrH3D8vd/IHo/hkrzIjaGzbS9YtELMdIJF2ZZ5nnwEFXp6aOYQBPEojzuIXnuT/+J1iB8t1QHhGRL6+6dRMzQIRpcCBixqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmHXBqZ/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmHXBqZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717690886; x=1749226886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMsO1la6pwkSD46DSTkKmMQcP7s2/53LcGKXgeI7vPk=;
  b=WmHXBqZ/bSAcSBK9o2Cw60XOU08JN4wbqqIES6Kg16b8TvPe9LG6rHyB
   k4lbASF225gijAq1mCJMEUU6KakTcXlf11FWvBDuLHzF59Nu8QvFb0Hzd
   0K0/PNkAROu4AmbHY6Ez5EzXZ9a3ZKc426BiJbsW5f5IkgR+7M0LXibwI
   ubyMOZdhw+shKOtcfwfRwLBYA53nvP+pZZEzPonElZ8Ddb8jdKS5xzJpr
   TeLss3GeD/VPdJXoiPjf2kQHsNIFO7nJvNgNlbGaf5l2hpsRTI+Jh55zd
   zxygbZ2TjqD8DBFSeyBfhwbLWTjBjOq+gqVOXG6bw7my+BUxFVi04hiD6
   A==;
X-CSE-ConnectionGUID: IEeXj6DFTF6WOWnWgBA5Hw==
X-CSE-MsgGUID: QD25v2G4QG6Ot/ctK5qplA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18166904"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="18166904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:21:26 -0700
X-CSE-ConnectionGUID: XETMRtP7THCzrkEQ66Vt5w==
X-CSE-MsgGUID: nael3MqQSnK2f5Rci/pA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38470278"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2024 09:21:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFFqz-0003Mx-2s;
	Thu, 06 Jun 2024 16:20:48 +0000
Date: Fri, 7 Jun 2024 00:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1507/4264]
 arch/microblaze/boot/dts/system.dts:20.9-23.4: Warning
 (unit_address_vs_reg): /memory: node has a reg or ranges property, but no
 unit name
Message-ID: <202406070013.JTIjsLY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/microblaze/boot/dts/system.dts:20.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michal Simek <monstr@monstr.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
commit: 32cf1deb9c04854f76c5882a959b7148b6f32e75 [1507/4264] MICROBLAZE kc705 2017.4 full with cpu-reg fix NEW with reserved memory
:::::: branch date: 13 hours ago
:::::: commit date: 10 days ago
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070013.JTIjsLY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406070013.JTIjsLY7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/microblaze/boot/dts/system.dts:20.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/microblaze/boot/dts/system.dts:483.25-486.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00000000: unit name should not have leading "0x"
>> arch/microblaze/boot/dts/system.dts:483.25-486.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00000000: unit name should not have leading 0s
   arch/microblaze/boot/dts/system.dts:488.25-491.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00b00000: unit name should not have leading "0x"
   arch/microblaze/boot/dts/system.dts:488.25-491.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00b00000: unit name should not have leading 0s
   arch/microblaze/boot/dts/system.dts:493.25-496.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00b80000: unit name should not have leading "0x"
   arch/microblaze/boot/dts/system.dts:493.25-496.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00b80000: unit name should not have leading 0s
   arch/microblaze/boot/dts/system.dts:498.25-501.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00ba0000: unit name should not have leading "0x"
   arch/microblaze/boot/dts/system.dts:498.25-501.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00ba0000: unit name should not have leading 0s
   arch/microblaze/boot/dts/system.dts:503.25-506.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x017a0000: unit name should not have leading "0x"
   arch/microblaze/boot/dts/system.dts:503.25-506.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x017a0000: unit name should not have leading 0s
>> arch/microblaze/boot/dts/system.dts:579.15-588.4: Warning (simple_bus_reg): /amba_pl/gpio-restart: missing or empty reg/ranges property
>> arch/microblaze/boot/dts/system.dts:50.4-19: Warning (clocks_property): /cpus/cpu@0:clocks: cell 0 is not a phandle reference
>> arch/microblaze/boot/dts/system.dts:272.4-19: Warning (clocks_property): /amba_pl/dma@41e00000:clocks: cell 0 is not a phandle reference
>> arch/microblaze/boot/dts/system.dts:284.4-19: Warning (clocks_property): /amba_pl/timer@41c00000:clocks: cell 0 is not a phandle reference
>> arch/microblaze/boot/dts/system.dts:339.4-19: Warning (clocks_property): /amba_pl/i2c@40800000:clocks: cell 0 is not a phandle reference
>> arch/microblaze/boot/dts/system.dts:560.4-19: Warning (clocks_property): /amba_pl/serial@44a00000:clocks: cell 0 is not a phandle reference

vim +20 arch/microblaze/boot/dts/system.dts

32cf1deb9c04854 Michal Simek  2018-03-12    2  
845e5ef1a671b8c Michal Simek  2014-04-07    3  / {
32cf1deb9c04854 Michal Simek  2018-03-12    4  	#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12    5  	#size-cells = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07    6  	compatible = "xlnx,microblaze";
32cf1deb9c04854 Michal Simek  2018-03-12    7  	model = "Xilinx MicroBlaze";
32cf1deb9c04854 Michal Simek  2018-03-12    8  
32cf1deb9c04854 Michal Simek  2018-03-12    9  	chosen {
32cf1deb9c04854 Michal Simek  2018-03-12   10  		bootargs = "earlycon";
32cf1deb9c04854 Michal Simek  2018-03-12   11  		stdout-path = "serial0:115200n8";
845e5ef1a671b8c Michal Simek  2014-04-07   12  	};
32cf1deb9c04854 Michal Simek  2018-03-12   13  
845e5ef1a671b8c Michal Simek  2014-04-07   14  	aliases {
32cf1deb9c04854 Michal Simek  2018-03-12   15  		ethernet0 = "/amba_pl/ethernet@40c00000";
32cf1deb9c04854 Michal Simek  2018-03-12   16  		i2c0 = "/amba_pl/i2c@40800000";
32cf1deb9c04854 Michal Simek  2018-03-12   17  		serial0 = "/amba_pl/serial@44a00000";
845e5ef1a671b8c Michal Simek  2014-04-07   18  	};
32cf1deb9c04854 Michal Simek  2018-03-12   19  
32cf1deb9c04854 Michal Simek  2018-03-12  @20  	memory {
32cf1deb9c04854 Michal Simek  2018-03-12   21  		device_type = "memory";
32cf1deb9c04854 Michal Simek  2018-03-12   22  		reg = <0x80000000 0x40000000>;
845e5ef1a671b8c Michal Simek  2014-04-07   23  	};
32cf1deb9c04854 Michal Simek  2018-03-12   24  
32cf1deb9c04854 Michal Simek  2018-03-12   25  	reserved-memory {
845e5ef1a671b8c Michal Simek  2014-04-07   26  		#address-cells = <1>;
32cf1deb9c04854 Michal Simek  2018-03-12   27  		#size-cells = <1>;
32cf1deb9c04854 Michal Simek  2018-03-12   28  		ranges;
32cf1deb9c04854 Michal Simek  2018-03-12   29  
32cf1deb9c04854 Michal Simek  2018-03-12   30  		alloc@b0000000 {
32cf1deb9c04854 Michal Simek  2018-03-12   31  			reg = <0xb0000000 0x10000000>;
32cf1deb9c04854 Michal Simek  2018-03-12   32  			no-map;
32cf1deb9c04854 Michal Simek  2018-03-12   33  		};
32cf1deb9c04854 Michal Simek  2018-03-12   34  
32cf1deb9c04854 Michal Simek  2018-03-12   35  		alloc@a8000000 {
32cf1deb9c04854 Michal Simek  2018-03-12   36  			reg = <0xa8000000 0x00100000>;
32cf1deb9c04854 Michal Simek  2018-03-12   37  			no-map;
32cf1deb9c04854 Michal Simek  2018-03-12   38  		};
32cf1deb9c04854 Michal Simek  2018-03-12   39  	};
32cf1deb9c04854 Michal Simek  2018-03-12   40  
32cf1deb9c04854 Michal Simek  2018-03-12   41  	cpus {
32cf1deb9c04854 Michal Simek  2018-03-12   42  		#address-cells = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07   43  		#cpus = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12   44  		#size-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   45  
32cf1deb9c04854 Michal Simek  2018-03-12   46  		cpu@0 {
32cf1deb9c04854 Michal Simek  2018-03-12   47  			reg = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   48  			bus-handle = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12   49  			clock-frequency = <0xbebc200>;
32cf1deb9c04854 Michal Simek  2018-03-12  @50  			clocks = <0x3>;
32cf1deb9c04854 Michal Simek  2018-03-12   51  			compatible = "xlnx,microblaze-10.0";
32cf1deb9c04854 Michal Simek  2018-03-12   52  			d-cache-baseaddr = <0x80000000>;
32cf1deb9c04854 Michal Simek  2018-03-12   53  			d-cache-highaddr = <0xbfffffff>;
32cf1deb9c04854 Michal Simek  2018-03-12   54  			d-cache-line-size = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12   55  			d-cache-size = <0x4000>;
845e5ef1a671b8c Michal Simek  2014-04-07   56  			device_type = "cpu";
32cf1deb9c04854 Michal Simek  2018-03-12   57  			i-cache-baseaddr = <0x80000000>;
32cf1deb9c04854 Michal Simek  2018-03-12   58  			i-cache-highaddr = <0xbfffffff>;
845e5ef1a671b8c Michal Simek  2014-04-07   59  			i-cache-line-size = <0x10>;
32cf1deb9c04854 Michal Simek  2018-03-12   60  			i-cache-size = <0x4000>;
32cf1deb9c04854 Michal Simek  2018-03-12   61  			interrupt-handle = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12   62  			model = "microblaze,10.0";
32cf1deb9c04854 Michal Simek  2018-03-12   63  			timebase-frequency = <0xbebc200>;
32cf1deb9c04854 Michal Simek  2018-03-12   64  			xlnx,addr-size = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12   65  			xlnx,addr-tag-bits = <0x10>;
845e5ef1a671b8c Michal Simek  2014-04-07   66  			xlnx,allow-dcache-wr = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07   67  			xlnx,allow-icache-wr = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07   68  			xlnx,area-optimized = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   69  			xlnx,async-interrupt = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12   70  			xlnx,async-wakeup = <0x3>;
32cf1deb9c04854 Michal Simek  2018-03-12   71  			xlnx,avoid-primitives = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   72  			xlnx,base-vectors = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   73  			xlnx,branch-target-cache-size = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   74  			xlnx,cache-byte-size = <0x4000>;
32cf1deb9c04854 Michal Simek  2018-03-12   75  			xlnx,d-axi = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07   76  			xlnx,d-lmb = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12   77  			xlnx,d-lmb-mon = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   78  			xlnx,daddr-size = <0x20>;
845e5ef1a671b8c Michal Simek  2014-04-07   79  			xlnx,data-size = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12   80  			xlnx,dc-axi-mon = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   81  			xlnx,dcache-addr-tag = <0x10>;
845e5ef1a671b8c Michal Simek  2014-04-07   82  			xlnx,dcache-always-used = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12   83  			xlnx,dcache-byte-size = <0x4000>;
32cf1deb9c04854 Michal Simek  2018-03-12   84  			xlnx,dcache-data-width = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   85  			xlnx,dcache-force-tag-lutram = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   86  			xlnx,dcache-line-len = <0x8>;
32cf1deb9c04854 Michal Simek  2018-03-12   87  			xlnx,dcache-use-writeback = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   88  			xlnx,dcache-victims = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   89  			xlnx,debug-counter-width = <0x20>;
845e5ef1a671b8c Michal Simek  2014-04-07   90  			xlnx,debug-enabled = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12   91  			xlnx,debug-event-counters = <0x5>;
32cf1deb9c04854 Michal Simek  2018-03-12   92  			xlnx,debug-external-trace = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   93  			xlnx,debug-interface = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   94  			xlnx,debug-latency-counters = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12   95  			xlnx,debug-profile-size = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   96  			xlnx,debug-trace-async-reset = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12   97  			xlnx,debug-trace-size = <0x2000>;
845e5ef1a671b8c Michal Simek  2014-04-07   98  			xlnx,div-zero-exception = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12   99  			xlnx,dp-axi-mon = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  100  			xlnx,dynamic-bus-sizing = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  101  			xlnx,ecc-use-ce-exception = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  102  			xlnx,edge-is-positive = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  103  			xlnx,enable-discrete-ports = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  104  			xlnx,endianness = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  105  			xlnx,fault-tolerant = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  106  			xlnx,fpu-exception = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  107  			xlnx,freq = <0xbebc200>;
845e5ef1a671b8c Michal Simek  2014-04-07  108  			xlnx,fsl-exception = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  109  			xlnx,fsl-links = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  110  			xlnx,i-axi = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  111  			xlnx,i-lmb = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  112  			xlnx,i-lmb-mon = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  113  			xlnx,iaddr-size = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  114  			xlnx,ic-axi-mon = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  115  			xlnx,icache-always-used = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  116  			xlnx,icache-data-width = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  117  			xlnx,icache-force-tag-lutram = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  118  			xlnx,icache-line-len = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  119  			xlnx,icache-streams = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  120  			xlnx,icache-victims = <0x8>;
845e5ef1a671b8c Michal Simek  2014-04-07  121  			xlnx,ill-opcode-exception = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  122  			xlnx,imprecise-exceptions = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  123  			xlnx,instr-size = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  124  			xlnx,interconnect = <0x2>;
845e5ef1a671b8c Michal Simek  2014-04-07  125  			xlnx,interrupt-is-edge = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  126  			xlnx,interrupt-mon = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  127  			xlnx,ip-axi-mon = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  128  			xlnx,lockstep-master = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  129  			xlnx,lockstep-select = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  130  			xlnx,lockstep-slave = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  131  			xlnx,mmu-dtlb-size = <0x4>;
845e5ef1a671b8c Michal Simek  2014-04-07  132  			xlnx,mmu-itlb-size = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  133  			xlnx,mmu-privileged-instr = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  134  			xlnx,mmu-tlb-access = <0x3>;
32cf1deb9c04854 Michal Simek  2018-03-12  135  			xlnx,mmu-zones = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  136  			xlnx,num-sync-ff-clk = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  137  			xlnx,num-sync-ff-clk-debug = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  138  			xlnx,num-sync-ff-clk-irq = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  139  			xlnx,num-sync-ff-dbg-clk = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  140  			xlnx,num-sync-ff-dbg-trace-clk = <0x2>;
845e5ef1a671b8c Michal Simek  2014-04-07  141  			xlnx,number-of-pc-brk = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07  142  			xlnx,number-of-rd-addr-brk = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  143  			xlnx,number-of-wr-addr-brk = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  144  			xlnx,opcode-0x0-illegal = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  145  			xlnx,optimization = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  146  			xlnx,pc-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  147  			xlnx,piaddr-size = <0x20>;
845e5ef1a671b8c Michal Simek  2014-04-07  148  			xlnx,pvr = <0x2>;
845e5ef1a671b8c Michal Simek  2014-04-07  149  			xlnx,pvr-user1 = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  150  			xlnx,pvr-user2 = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  151  			xlnx,reset-msr = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  152  			xlnx,reset-msr-bip = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  153  			xlnx,reset-msr-dce = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  154  			xlnx,reset-msr-ee = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  155  			xlnx,reset-msr-eip = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  156  			xlnx,reset-msr-ice = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  157  			xlnx,reset-msr-ie = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  158  			xlnx,sco = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  159  			xlnx,trace = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  160  			xlnx,unaligned-exceptions = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07  161  			xlnx,use-barrel = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  162  			xlnx,use-branch-target-cache = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  163  			xlnx,use-config-reset = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  164  			xlnx,use-dcache = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07  165  			xlnx,use-div = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  166  			xlnx,use-ext-brk = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  167  			xlnx,use-ext-nm-brk = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  168  			xlnx,use-extended-fsl-instr = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  169  			xlnx,use-fpu = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  170  			xlnx,use-hw-mul = <0x2>;
845e5ef1a671b8c Michal Simek  2014-04-07  171  			xlnx,use-icache = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  172  			xlnx,use-interrupt = <0x2>;
845e5ef1a671b8c Michal Simek  2014-04-07  173  			xlnx,use-mmu = <0x3>;
845e5ef1a671b8c Michal Simek  2014-04-07  174  			xlnx,use-msr-instr = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  175  			xlnx,use-non-secure = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  176  			xlnx,use-pcmp-instr = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  177  			xlnx,use-reorder-instr = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  178  			xlnx,use-stack-protection = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  179  		};
845e5ef1a671b8c Michal Simek  2014-04-07  180  	};
32cf1deb9c04854 Michal Simek  2018-03-12  181  
32cf1deb9c04854 Michal Simek  2018-03-12  182  	clocks {
32cf1deb9c04854 Michal Simek  2018-03-12  183  		#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  184  		#size-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  185  
32cf1deb9c04854 Michal Simek  2018-03-12  186  		clk_cpu@0 {
32cf1deb9c04854 Michal Simek  2018-03-12  187  			#clock-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  188  			clock-frequency = <0xbebc200>;
32cf1deb9c04854 Michal Simek  2018-03-12  189  			clock-output-names = "clk_cpu";
32cf1deb9c04854 Michal Simek  2018-03-12  190  			compatible = "fixed-clock";
32cf1deb9c04854 Michal Simek  2018-03-12  191  			reg = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  192  			linux,phandle = <0x3>;
32cf1deb9c04854 Michal Simek  2018-03-12  193  			phandle = <0x3>;
32cf1deb9c04854 Michal Simek  2018-03-12  194  		};
32cf1deb9c04854 Michal Simek  2018-03-12  195  
32cf1deb9c04854 Michal Simek  2018-03-12  196  		clk_bus_0@1 {
32cf1deb9c04854 Michal Simek  2018-03-12  197  			#clock-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  198  			clock-frequency = <0xbebc200>;
32cf1deb9c04854 Michal Simek  2018-03-12  199  			clock-output-names = "clk_bus_0";
32cf1deb9c04854 Michal Simek  2018-03-12  200  			compatible = "fixed-clock";
32cf1deb9c04854 Michal Simek  2018-03-12  201  			reg = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  202  			linux,phandle = <0x8>;
32cf1deb9c04854 Michal Simek  2018-03-12  203  			phandle = <0x8>;
32cf1deb9c04854 Michal Simek  2018-03-12  204  		};
32cf1deb9c04854 Michal Simek  2018-03-12  205  	};
32cf1deb9c04854 Michal Simek  2018-03-12  206  
32cf1deb9c04854 Michal Simek  2018-03-12  207  	amba_pl {
32cf1deb9c04854 Michal Simek  2018-03-12  208  		#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  209  		#size-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  210  		compatible = "simple-bus";
845e5ef1a671b8c Michal Simek  2014-04-07  211  		ranges;
32cf1deb9c04854 Michal Simek  2018-03-12  212  		linux,phandle = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  213  		phandle = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  214  
32cf1deb9c04854 Michal Simek  2018-03-12  215  		ethernet@40c00000 {
32cf1deb9c04854 Michal Simek  2018-03-12  216  			axistream-connected = <0x5>;
32cf1deb9c04854 Michal Simek  2018-03-12  217  			axistream-control-connected = <0x5>;
32cf1deb9c04854 Michal Simek  2018-03-12  218  			clock-frequency = <0x5f5e100>;
32cf1deb9c04854 Michal Simek  2018-03-12  219  			compatible = "xlnx,axi-ethernet-1.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  220  			device_type = "network";
32cf1deb9c04854 Michal Simek  2018-03-12  221  			interrupt-parent = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  222  			interrupts = <0x4 0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  223  			phy-mode = "gmii";
32cf1deb9c04854 Michal Simek  2018-03-12  224  			reg = <0x40c00000 0x40000>;
32cf1deb9c04854 Michal Simek  2018-03-12  225  			xlnx = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  226  			xlnx,axiliteclkrate = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  227  			xlnx,axisclkrate = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  228  			xlnx,clockselection = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  229  			xlnx,enableasyncsgmii = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  230  			xlnx,gt-type = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  231  			xlnx,gtinex = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  232  			xlnx,gtlocation = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  233  			xlnx,gtrefclksrc = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  234  			xlnx,include-dre;
32cf1deb9c04854 Michal Simek  2018-03-12  235  			xlnx,instantiatebitslice0 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  236  			xlnx,phy-type = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  237  			xlnx,phyaddr = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  238  			xlnx,rable = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  239  			xlnx,rxcsum = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  240  			xlnx,rxlane0-placement = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  241  			xlnx,rxlane1-placement = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  242  			xlnx,rxmem = <0x1000>;
32cf1deb9c04854 Michal Simek  2018-03-12  243  			xlnx,rxnibblebitslice0used = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  244  			xlnx,tx-in-upper-nibble = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  245  			xlnx,txcsum = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  246  			xlnx,txlane0-placement = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  247  			xlnx,txlane1-placement = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  248  			phy-handle = <0x6>;
32cf1deb9c04854 Michal Simek  2018-03-12  249  			local-mac-address = [00 0a 35 00 22 01];
32cf1deb9c04854 Michal Simek  2018-03-12  250  			linux,phandle = <0x7>;
32cf1deb9c04854 Michal Simek  2018-03-12  251  			phandle = <0x7>;
32cf1deb9c04854 Michal Simek  2018-03-12  252  
32cf1deb9c04854 Michal Simek  2018-03-12  253  			mdio {
32cf1deb9c04854 Michal Simek  2018-03-12  254  				#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  255  				#size-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  256  
32cf1deb9c04854 Michal Simek  2018-03-12  257  				phy@7 {
32cf1deb9c04854 Michal Simek  2018-03-12  258  					device_type = "ethernet-phy";
32cf1deb9c04854 Michal Simek  2018-03-12  259  					reg = <0x7>;
32cf1deb9c04854 Michal Simek  2018-03-12  260  					linux,phandle = <0x6>;
32cf1deb9c04854 Michal Simek  2018-03-12  261  					phandle = <0x6>;
32cf1deb9c04854 Michal Simek  2018-03-12  262  				};
32cf1deb9c04854 Michal Simek  2018-03-12  263  			};
32cf1deb9c04854 Michal Simek  2018-03-12  264  		};
32cf1deb9c04854 Michal Simek  2018-03-12  265  
32cf1deb9c04854 Michal Simek  2018-03-12  266  		dma@41e00000 {
32cf1deb9c04854 Michal Simek  2018-03-12  267  			#dma-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  268  			axistream-connected = <0x7>;
32cf1deb9c04854 Michal Simek  2018-03-12  269  			axistream-control-connected = <0x7>;
32cf1deb9c04854 Michal Simek  2018-03-12  270  			clock-frequency = <0xbebc200>;
32cf1deb9c04854 Michal Simek  2018-03-12  271  			clock-names = "s_axi_lite_aclk";
32cf1deb9c04854 Michal Simek  2018-03-12  272  			clocks = <0x8>;
32cf1deb9c04854 Michal Simek  2018-03-12  273  			compatible = "xlnx,eth-dma";
32cf1deb9c04854 Michal Simek  2018-03-12  274  			interrupt-parent = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  275  			interrupts = <0x3 0x2 0x2 0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  276  			reg = <0x41e00000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  277  			xlnx,include-dre;
32cf1deb9c04854 Michal Simek  2018-03-12  278  			linux,phandle = <0x5>;
32cf1deb9c04854 Michal Simek  2018-03-12  279  			phandle = <0x5>;
32cf1deb9c04854 Michal Simek  2018-03-12  280  		};
32cf1deb9c04854 Michal Simek  2018-03-12  281  
32cf1deb9c04854 Michal Simek  2018-03-12  282  		timer@41c00000 {
32cf1deb9c04854 Michal Simek  2018-03-12  283  			clock-frequency = <0xbebc200>;
32cf1deb9c04854 Michal Simek  2018-03-12  284  			clocks = <0x8>;
32cf1deb9c04854 Michal Simek  2018-03-12  285  			compatible = "xlnx,xps-timer-1.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  286  			interrupt-parent = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  287  			interrupts = <0x5 0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  288  			reg = <0x41c00000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  289  			xlnx,count-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  290  			xlnx,gen0-assert = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  291  			xlnx,gen1-assert = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  292  			xlnx,one-timer-only = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  293  			xlnx,trig0-assert = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  294  			xlnx,trig1-assert = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  295  		};
32cf1deb9c04854 Michal Simek  2018-03-12  296  
32cf1deb9c04854 Michal Simek  2018-03-12  297  		gpio@40010000 {
32cf1deb9c04854 Michal Simek  2018-03-12  298  			#gpio-cells = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  299  			compatible = "xlnx,xps-gpio-1.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  300  			gpio-controller;
32cf1deb9c04854 Michal Simek  2018-03-12  301  			reg = <0x40010000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  302  			xlnx,all-inputs = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  303  			xlnx,all-inputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  304  			xlnx,all-outputs = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  305  			xlnx,all-outputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  306  			xlnx,dout-default = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  307  			xlnx,dout-default-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  308  			xlnx,gpio-width = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  309  			xlnx,gpio2-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  310  			xlnx,interrupt-present = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  311  			xlnx,is-dual = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  312  			xlnx,tri-default = <0xffffffff>;
32cf1deb9c04854 Michal Simek  2018-03-12  313  			xlnx,tri-default-2 = <0xffffffff>;
32cf1deb9c04854 Michal Simek  2018-03-12  314  		};
32cf1deb9c04854 Michal Simek  2018-03-12  315  
32cf1deb9c04854 Michal Simek  2018-03-12  316  		gpio@40020000 {
32cf1deb9c04854 Michal Simek  2018-03-12  317  			#gpio-cells = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  318  			compatible = "xlnx,xps-gpio-1.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  319  			gpio-controller;
32cf1deb9c04854 Michal Simek  2018-03-12  320  			reg = <0x40020000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  321  			xlnx,all-inputs = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  322  			xlnx,all-inputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  323  			xlnx,all-outputs = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  324  			xlnx,all-outputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  325  			xlnx,dout-default = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  326  			xlnx,dout-default-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  327  			xlnx,gpio-width = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  328  			xlnx,gpio2-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  329  			xlnx,interrupt-present = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  330  			xlnx,is-dual = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  331  			xlnx,tri-default = <0xffffffff>;
32cf1deb9c04854 Michal Simek  2018-03-12  332  			xlnx,tri-default-2 = <0xffffffff>;
32cf1deb9c04854 Michal Simek  2018-03-12  333  		};
32cf1deb9c04854 Michal Simek  2018-03-12  334  
32cf1deb9c04854 Michal Simek  2018-03-12  335  		i2c@40800000 {
32cf1deb9c04854 Michal Simek  2018-03-12  336  			#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  337  			#size-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  338  			clock-frequency = <0xbebc200>;
32cf1deb9c04854 Michal Simek  2018-03-12  339  			clocks = <0x8>;
32cf1deb9c04854 Michal Simek  2018-03-12  340  			compatible = "xlnx,xps-iic-2.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  341  			interrupt-parent = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  342  			interrupts = <0x1 0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  343  			reg = <0x40800000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  344  
32cf1deb9c04854 Michal Simek  2018-03-12  345  			i2cswitch@74 {
32cf1deb9c04854 Michal Simek  2018-03-12  346  				compatible = "nxp,pca9548";
32cf1deb9c04854 Michal Simek  2018-03-12  347  				#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  348  				#size-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  349  				reg = <0x74>;
32cf1deb9c04854 Michal Simek  2018-03-12  350  
32cf1deb9c04854 Michal Simek  2018-03-12  351  				i2c@0 {
32cf1deb9c04854 Michal Simek  2018-03-12  352  					#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  353  					#size-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  354  					reg = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  355  
32cf1deb9c04854 Michal Simek  2018-03-12  356  					clock-generator@5d {
32cf1deb9c04854 Michal Simek  2018-03-12  357  						#clock-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  358  						compatible = "silabs,si570";
32cf1deb9c04854 Michal Simek  2018-03-12  359  						temperature-stability = <0x32>;
32cf1deb9c04854 Michal Simek  2018-03-12  360  						reg = <0x5d>;
32cf1deb9c04854 Michal Simek  2018-03-12  361  						factory-fout = <0x9502f90>;
32cf1deb9c04854 Michal Simek  2018-03-12  362  						clock-frequency = <0x8d9ee20>;
32cf1deb9c04854 Michal Simek  2018-03-12  363  					};
32cf1deb9c04854 Michal Simek  2018-03-12  364  				};
32cf1deb9c04854 Michal Simek  2018-03-12  365  
32cf1deb9c04854 Michal Simek  2018-03-12  366  				i2c@3 {
32cf1deb9c04854 Michal Simek  2018-03-12  367  					#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  368  					#size-cells = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  369  					reg = <0x3>;
32cf1deb9c04854 Michal Simek  2018-03-12  370  
32cf1deb9c04854 Michal Simek  2018-03-12  371  					eeprom@54 {
32cf1deb9c04854 Michal Simek  2018-03-12  372  						compatible = "at,24c08";
32cf1deb9c04854 Michal Simek  2018-03-12  373  						reg = <0x54>;
32cf1deb9c04854 Michal Simek  2018-03-12  374  					};
32cf1deb9c04854 Michal Simek  2018-03-12  375  				};
32cf1deb9c04854 Michal Simek  2018-03-12  376  			};
32cf1deb9c04854 Michal Simek  2018-03-12  377  		};
32cf1deb9c04854 Michal Simek  2018-03-12  378  
32cf1deb9c04854 Michal Simek  2018-03-12  379  		gpio@40030000 {
32cf1deb9c04854 Michal Simek  2018-03-12  380  			#gpio-cells = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  381  			compatible = "xlnx,xps-gpio-1.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  382  			gpio-controller;
32cf1deb9c04854 Michal Simek  2018-03-12  383  			reg = <0x40030000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  384  			xlnx,all-inputs = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  385  			xlnx,all-inputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  386  			xlnx,all-outputs = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  387  			xlnx,all-outputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  388  			xlnx,dout-default = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  389  			xlnx,dout-default-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  390  			xlnx,gpio-width = <0x8>;
32cf1deb9c04854 Michal Simek  2018-03-12  391  			xlnx,gpio2-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  392  			xlnx,interrupt-present = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  393  			xlnx,is-dual = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  394  			xlnx,tri-default = <0xffffffff>;
32cf1deb9c04854 Michal Simek  2018-03-12  395  			xlnx,tri-default-2 = <0xffffffff>;
32cf1deb9c04854 Michal Simek  2018-03-12  396  		};
32cf1deb9c04854 Michal Simek  2018-03-12  397  
32cf1deb9c04854 Michal Simek  2018-03-12  398  		flash@60000000 {
32cf1deb9c04854 Michal Simek  2018-03-12  399  			bank-width = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  400  			compatible = "cfi-flash";
32cf1deb9c04854 Michal Simek  2018-03-12  401  			reg = <0x60000000 0x8000000>;
32cf1deb9c04854 Michal Simek  2018-03-12  402  			xlnx,axi-clk-period-ps = <0x1388>;
845e5ef1a671b8c Michal Simek  2014-04-07  403  			xlnx,include-datawidth-matching-0 = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  404  			xlnx,include-datawidth-matching-1 = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  405  			xlnx,include-datawidth-matching-2 = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  406  			xlnx,include-datawidth-matching-3 = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07  407  			xlnx,include-negedge-ioregs = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  408  			xlnx,lflash-period-ps = <0x1388>;
32cf1deb9c04854 Michal Simek  2018-03-12  409  			xlnx,linear-flash-sync-burst = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  410  			xlnx,max-mem-width = <0x10>;
32cf1deb9c04854 Michal Simek  2018-03-12  411  			xlnx,mem-a-lsb = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  412  			xlnx,mem-a-msb = <0x1f>;
32cf1deb9c04854 Michal Simek  2018-03-12  413  			xlnx,mem0-type = <0x2>;
845e5ef1a671b8c Michal Simek  2014-04-07  414  			xlnx,mem0-width = <0x10>;
32cf1deb9c04854 Michal Simek  2018-03-12  415  			xlnx,mem1-type = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  416  			xlnx,mem1-width = <0x10>;
32cf1deb9c04854 Michal Simek  2018-03-12  417  			xlnx,mem2-type = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  418  			xlnx,mem2-width = <0x10>;
32cf1deb9c04854 Michal Simek  2018-03-12  419  			xlnx,mem3-type = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  420  			xlnx,mem3-width = <0x10>;
845e5ef1a671b8c Michal Simek  2014-04-07  421  			xlnx,num-banks-mem = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  422  			xlnx,page-size = <0x10>;
32cf1deb9c04854 Michal Simek  2018-03-12  423  			xlnx,parity-type-mem-0 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  424  			xlnx,parity-type-mem-1 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  425  			xlnx,parity-type-mem-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  426  			xlnx,parity-type-mem-3 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  427  			xlnx,port-diff = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  428  			xlnx,s-axi-en-reg = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  429  			xlnx,s-axi-mem-addr-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  430  			xlnx,s-axi-mem-data-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  431  			xlnx,s-axi-mem-id-width = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  432  			xlnx,s-axi-reg-addr-width = <0x5>;
32cf1deb9c04854 Michal Simek  2018-03-12  433  			xlnx,s-axi-reg-data-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  434  			xlnx,synch-pipedelay-0 = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  435  			xlnx,synch-pipedelay-1 = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  436  			xlnx,synch-pipedelay-2 = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  437  			xlnx,synch-pipedelay-3 = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  438  			xlnx,tavdv-ps-mem-0 = <0x1fbd0>;
845e5ef1a671b8c Michal Simek  2014-04-07  439  			xlnx,tavdv-ps-mem-1 = <0x3a98>;
845e5ef1a671b8c Michal Simek  2014-04-07  440  			xlnx,tavdv-ps-mem-2 = <0x3a98>;
845e5ef1a671b8c Michal Simek  2014-04-07  441  			xlnx,tavdv-ps-mem-3 = <0x3a98>;
32cf1deb9c04854 Michal Simek  2018-03-12  442  			xlnx,tcedv-ps-mem-0 = <0x1fbd0>;
845e5ef1a671b8c Michal Simek  2014-04-07  443  			xlnx,tcedv-ps-mem-1 = <0x3a98>;
845e5ef1a671b8c Michal Simek  2014-04-07  444  			xlnx,tcedv-ps-mem-2 = <0x3a98>;
845e5ef1a671b8c Michal Simek  2014-04-07  445  			xlnx,tcedv-ps-mem-3 = <0x3a98>;
845e5ef1a671b8c Michal Simek  2014-04-07  446  			xlnx,thzce-ps-mem-0 = <0x88b8>;
845e5ef1a671b8c Michal Simek  2014-04-07  447  			xlnx,thzce-ps-mem-1 = <0x1b58>;
845e5ef1a671b8c Michal Simek  2014-04-07  448  			xlnx,thzce-ps-mem-2 = <0x1b58>;
845e5ef1a671b8c Michal Simek  2014-04-07  449  			xlnx,thzce-ps-mem-3 = <0x1b58>;
845e5ef1a671b8c Michal Simek  2014-04-07  450  			xlnx,thzoe-ps-mem-0 = <0x1b58>;
845e5ef1a671b8c Michal Simek  2014-04-07  451  			xlnx,thzoe-ps-mem-1 = <0x1b58>;
845e5ef1a671b8c Michal Simek  2014-04-07  452  			xlnx,thzoe-ps-mem-2 = <0x1b58>;
845e5ef1a671b8c Michal Simek  2014-04-07  453  			xlnx,thzoe-ps-mem-3 = <0x1b58>;
32cf1deb9c04854 Michal Simek  2018-03-12  454  			xlnx,tlzwe-ps-mem-0 = <0xc350>;
845e5ef1a671b8c Michal Simek  2014-04-07  455  			xlnx,tlzwe-ps-mem-1 = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  456  			xlnx,tlzwe-ps-mem-2 = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  457  			xlnx,tlzwe-ps-mem-3 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  458  			xlnx,tpacc-ps-flash-0 = <0x61a8>;
32cf1deb9c04854 Michal Simek  2018-03-12  459  			xlnx,tpacc-ps-flash-1 = <0x61a8>;
32cf1deb9c04854 Michal Simek  2018-03-12  460  			xlnx,tpacc-ps-flash-2 = <0x61a8>;
32cf1deb9c04854 Michal Simek  2018-03-12  461  			xlnx,tpacc-ps-flash-3 = <0x61a8>;
32cf1deb9c04854 Michal Simek  2018-03-12  462  			xlnx,twc-ps-mem-0 = <0x11170>;
845e5ef1a671b8c Michal Simek  2014-04-07  463  			xlnx,twc-ps-mem-1 = <0x3a98>;
845e5ef1a671b8c Michal Simek  2014-04-07  464  			xlnx,twc-ps-mem-2 = <0x3a98>;
845e5ef1a671b8c Michal Simek  2014-04-07  465  			xlnx,twc-ps-mem-3 = <0x3a98>;
32cf1deb9c04854 Michal Simek  2018-03-12  466  			xlnx,twp-ps-mem-0 = <0x13880>;
845e5ef1a671b8c Michal Simek  2014-04-07  467  			xlnx,twp-ps-mem-1 = <0x2ee0>;
845e5ef1a671b8c Michal Simek  2014-04-07  468  			xlnx,twp-ps-mem-2 = <0x2ee0>;
845e5ef1a671b8c Michal Simek  2014-04-07  469  			xlnx,twp-ps-mem-3 = <0x2ee0>;
32cf1deb9c04854 Michal Simek  2018-03-12  470  			xlnx,twph-ps-mem-0 = <0x13880>;
32cf1deb9c04854 Michal Simek  2018-03-12  471  			xlnx,twph-ps-mem-1 = <0x2ee0>;
32cf1deb9c04854 Michal Simek  2018-03-12  472  			xlnx,twph-ps-mem-2 = <0x2ee0>;
32cf1deb9c04854 Michal Simek  2018-03-12  473  			xlnx,twph-ps-mem-3 = <0x2ee0>;
32cf1deb9c04854 Michal Simek  2018-03-12  474  			xlnx,use-startup = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  475  			xlnx,use-startup-int = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  476  			xlnx,wr-rec-time-mem-0 = <0x186a0>;
32cf1deb9c04854 Michal Simek  2018-03-12  477  			xlnx,wr-rec-time-mem-1 = <0x6978>;
32cf1deb9c04854 Michal Simek  2018-03-12  478  			xlnx,wr-rec-time-mem-2 = <0x6978>;
32cf1deb9c04854 Michal Simek  2018-03-12  479  			xlnx,wr-rec-time-mem-3 = <0x6978>;
32cf1deb9c04854 Michal Simek  2018-03-12  480  			#address-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  481  			#size-cells = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  482  
32cf1deb9c04854 Michal Simek  2018-03-12  483  			partition@0x00000000 {
32cf1deb9c04854 Michal Simek  2018-03-12  484  				label = "fpga";
32cf1deb9c04854 Michal Simek  2018-03-12  485  				reg = <0x0 0xb00000>;
845e5ef1a671b8c Michal Simek  2014-04-07  486  			};
32cf1deb9c04854 Michal Simek  2018-03-12  487  
32cf1deb9c04854 Michal Simek  2018-03-12  488  			partition@0x00b00000 {
32cf1deb9c04854 Michal Simek  2018-03-12  489  				label = "boot";
32cf1deb9c04854 Michal Simek  2018-03-12  490  				reg = <0xb00000 0x80000>;
845e5ef1a671b8c Michal Simek  2014-04-07  491  			};
32cf1deb9c04854 Michal Simek  2018-03-12  492  
32cf1deb9c04854 Michal Simek  2018-03-12  493  			partition@0x00b80000 {
32cf1deb9c04854 Michal Simek  2018-03-12  494  				label = "bootenv";
32cf1deb9c04854 Michal Simek  2018-03-12  495  				reg = <0xb80000 0x20000>;
32cf1deb9c04854 Michal Simek  2018-03-12  496  			};
32cf1deb9c04854 Michal Simek  2018-03-12  497  
32cf1deb9c04854 Michal Simek  2018-03-12  498  			partition@0x00ba0000 {
32cf1deb9c04854 Michal Simek  2018-03-12  499  				label = "kernel";
32cf1deb9c04854 Michal Simek  2018-03-12  500  				reg = <0xba0000 0xc00000>;
32cf1deb9c04854 Michal Simek  2018-03-12  501  			};
32cf1deb9c04854 Michal Simek  2018-03-12  502  
32cf1deb9c04854 Michal Simek  2018-03-12  503  			partition@0x017a0000 {
32cf1deb9c04854 Michal Simek  2018-03-12  504  				label = "spare";
32cf1deb9c04854 Michal Simek  2018-03-12  505  				reg = <0x17a0000 0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  506  			};
32cf1deb9c04854 Michal Simek  2018-03-12  507  		};
32cf1deb9c04854 Michal Simek  2018-03-12  508  
32cf1deb9c04854 Michal Simek  2018-03-12  509  		interrupt-controller@41200000 {
32cf1deb9c04854 Michal Simek  2018-03-12  510  			#interrupt-cells = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  511  			compatible = "xlnx,xps-intc-1.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  512  			interrupt-controller;
32cf1deb9c04854 Michal Simek  2018-03-12  513  			reg = <0x41200000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  514  			xlnx,kind-of-intr = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  515  			xlnx,num-intr-inputs = <0x6>;
32cf1deb9c04854 Michal Simek  2018-03-12  516  			linux,phandle = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  517  			phandle = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  518  		};
32cf1deb9c04854 Michal Simek  2018-03-12  519  
32cf1deb9c04854 Michal Simek  2018-03-12  520  		gpio@40040000 {
32cf1deb9c04854 Michal Simek  2018-03-12  521  			#gpio-cells = <0x2>;
845e5ef1a671b8c Michal Simek  2014-04-07  522  			compatible = "xlnx,xps-gpio-1.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  523  			gpio-controller;
32cf1deb9c04854 Michal Simek  2018-03-12  524  			reg = <0x40040000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  525  			xlnx,all-inputs = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07  526  			xlnx,all-inputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  527  			xlnx,all-outputs = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  528  			xlnx,all-outputs-2 = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  529  			xlnx,dout-default = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  530  			xlnx,dout-default-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  531  			xlnx,gpio-width = <0x5>;
32cf1deb9c04854 Michal Simek  2018-03-12  532  			xlnx,gpio2-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  533  			xlnx,interrupt-present = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  534  			xlnx,is-dual = <0x0>;
845e5ef1a671b8c Michal Simek  2014-04-07  535  			xlnx,tri-default = <0xffffffff>;
845e5ef1a671b8c Michal Simek  2014-04-07  536  			xlnx,tri-default-2 = <0xffffffff>;
845e5ef1a671b8c Michal Simek  2014-04-07  537  		};
845e5ef1a671b8c Michal Simek  2014-04-07  538  
32cf1deb9c04854 Michal Simek  2018-03-12  539  		gpio_res: gpio@40000000 {
32cf1deb9c04854 Michal Simek  2018-03-12  540  			#gpio-cells = <2>;
32cf1deb9c04854 Michal Simek  2018-03-12  541  			compatible = "xlnx,xps-gpio-1.00.a";
32cf1deb9c04854 Michal Simek  2018-03-12  542  			gpio-controller;
32cf1deb9c04854 Michal Simek  2018-03-12  543  			reg = <0x40000000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  544  			xlnx,all-inputs = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  545  			xlnx,all-inputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  546  			xlnx,all-outputs = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  547  			xlnx,all-outputs-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  548  			xlnx,dout-default = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  549  			xlnx,dout-default-2 = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  550  			xlnx,gpio-width = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  551  			xlnx,gpio2-width = <0x20>;
32cf1deb9c04854 Michal Simek  2018-03-12  552  			xlnx,interrupt-present = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  553  			xlnx,is-dual = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  554  			xlnx,tri-default = <0xffffffff>;
32cf1deb9c04854 Michal Simek  2018-03-12  555  			xlnx,tri-default-2 = <0xffffffff>;
845e5ef1a671b8c Michal Simek  2014-04-07  556  		};
845e5ef1a671b8c Michal Simek  2014-04-07  557  
32cf1deb9c04854 Michal Simek  2018-03-12  558  		serial@44a00000 {
32cf1deb9c04854 Michal Simek  2018-03-12  559  			clock-frequency = <0xbebc200>;
32cf1deb9c04854 Michal Simek  2018-03-12  560  			clocks = <0x8>;
32cf1deb9c04854 Michal Simek  2018-03-12  561  			compatible = "xlnx,xps-uart16550-2.00.a", "ns16550a";
32cf1deb9c04854 Michal Simek  2018-03-12  562  			current-speed = <0x1c200>;
32cf1deb9c04854 Michal Simek  2018-03-12  563  			device_type = "serial";
32cf1deb9c04854 Michal Simek  2018-03-12  564  			interrupt-parent = <0x4>;
32cf1deb9c04854 Michal Simek  2018-03-12  565  			interrupts = <0x0 0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  566  			port-number = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  567  			reg = <0x44a00000 0x10000>;
32cf1deb9c04854 Michal Simek  2018-03-12  568  			reg-offset = <0x1000>;
32cf1deb9c04854 Michal Simek  2018-03-12  569  			reg-shift = <0x2>;
32cf1deb9c04854 Michal Simek  2018-03-12  570  			xlnx,external-xin-clk-hz = <0x17d7840>;
32cf1deb9c04854 Michal Simek  2018-03-12  571  			xlnx,external-xin-clk-hz-d = <0x19>;
32cf1deb9c04854 Michal Simek  2018-03-12  572  			xlnx,has-external-rclk = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  573  			xlnx,has-external-xin = <0x0>;
32cf1deb9c04854 Michal Simek  2018-03-12  574  			xlnx,is-a-16550 = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  575  			xlnx,s-axi-aclk-freq-hz-d = "200.0";
32cf1deb9c04854 Michal Simek  2018-03-12  576  			xlnx,use-modem-ports = <0x1>;
32cf1deb9c04854 Michal Simek  2018-03-12  577  			xlnx,use-user-ports = <0x1>;
845e5ef1a671b8c Michal Simek  2014-04-07  578  		};
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  579  	gpio-restart {
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  580  		compatible = "gpio-restart";
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  581  		/*
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  582  		 * FIXME: is this active low or active high?
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  583  		 * the current flag (1) indicates active low.
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  584  		 * delay measures are templates, should be adjusted
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  585  		 * to datasheet or trial-and-error with real hardware.
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  586  		 */
32cf1deb9c04854 Michal Simek  2018-03-12  587  		gpios = <&gpio_res 0 0 0>;
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  588  	};
7cca9b8b7c5bcc5 Linus Walleij 2019-08-23  589  
845e5ef1a671b8c Michal Simek  2014-04-07  590  	};
32cf1deb9c04854 Michal Simek  2018-03-12  591  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
