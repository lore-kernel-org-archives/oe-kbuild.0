Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D1329429
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727539526; cv=none; b=ruXL3C/5d+/S5udE2BL0/RtJT3oUKvGGKo1cPSOd8WxVHy4ccp0dwSUblMUzvSh1rgiZy8UOa+jKLnXcMxHpmb35OY3qLrlKB0vwbdyLkZaZnicqwEMHzqAbhiQYHIS5A5PTvZB3IH+Nriso6IjkLT4fSagEMxw6vht2eKUfeU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727539526; c=relaxed/simple;
	bh=F+SOym/Qkaulpy2zmsKi9JrQ1yV2SeHlJb9hiZdUPs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbSeO560fQyJi5dkO1y9RSivq6UFYNNhxYSBPE7xbAVc8+4tJh34FXNpbdoNEtaxRbdDV/LT6LHNt/ykQBs28nrlJPDSvsKzT/pxZHCjAgXviTVf7cYUtn9EdUryIDdtAl+a5i4D8mbFACxSDHHf4sbM6183QJF8tWoHR9De5lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g90kUCFd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g90kUCFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727539524; x=1759075524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+SOym/Qkaulpy2zmsKi9JrQ1yV2SeHlJb9hiZdUPs8=;
  b=g90kUCFdkchiXGY8Ea5FWqoXLbvFTY8WOgUrbD0HOABx8pX4+4Tub7J8
   BCjrZ0N2M2WtxStgzGAdYbyRWotCVBhidUGzkTV00dquqGGo53xG7SQj9
   ERwKA2U/wpino+eDx353CQR2A2amigxBD4KoxRwnaQ3tLV9Z5sgpSwsZn
   nQT8hDaZTZ6cxx/pxadQ3DD6MFuDvl36/HVrQULiOd/kA5prqQp6tkbcj
   pXUgK7Q17rzvgqQYPZIFaiZBk9nJx9rBYwM/4pUgZydaE7D/gm/4cC6jE
   Us+3x9A5WkieqNfefo2sK9AaFLQLaYpdnAdEC72cRVH2lbOvSbkC3uDyf
   A==;
X-CSE-ConnectionGUID: GYqX6FQtSkW3sST5g2zOXQ==
X-CSE-MsgGUID: udSO6JhRQbyDtdLnL42EgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26803355"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26803355"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 09:05:22 -0700
X-CSE-ConnectionGUID: AobLwJ5dRT2QLz6GyUst0w==
X-CSE-MsgGUID: Hr0jfr8JRyCJv11Mt6YIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72707374"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 09:05:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suZwb-000NOs-1k;
	Sat, 28 Sep 2024 16:05:17 +0000
Date: Sun, 29 Sep 2024 00:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1011/1093]
 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts:89.20-105.4:
 Warning (unit_address_vs_reg): /zynqmp_ipi1_nobuf: node has a reg or ranges
 property, but no unit name
Message-ID: <202409282320.iHtaBMJw-lkp@intel.com>
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
CC: git@amd.com
TO: Abhijit Gangurde <abhijit.gangurde@amd.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Ivan Takacs <ivan.takacs@amd.com>
CC: Tarak Reddy <tarak.reddy@amd.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   3c31f9d5fb29a99c43f59d424f7f717ee2177e14
commit: e3d651358d5d0e237bd4ef3e4b49a02c22b057c3 [1011/1093] arm64: versal-net: add support for VNX board peripherals
:::::: branch date: 8 days ago
:::::: commit date: 4 months ago
config: arm64-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240928/202409282320.iHtaBMJw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282320.iHtaBMJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409282320.iHtaBMJw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts:89.20-105.4: Warning (unit_address_vs_reg): /zynqmp_ipi1_nobuf: node has a reg or ranges property, but no unit name

vim +89 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts

db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   17  
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   18  / {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   19  	compatible = "xlnx,versal-net-vnx-revA", "xlnx,versal-net-vnx", "xlnx,versal-net";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   20  	model = "Xilinx Versal NET VNX revA";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   21  	dma-coherent;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   22  
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   23  	memory: memory@0 {
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   24  		reg = <0 0 0 0x80000000>;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   25  		device_type = "memory";
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   26  	};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   27  
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   28  	memory_hi: memory@800000000 {
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   29  		reg = <8 0 3 0x80000000>;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   30  		device_type = "memory";
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   31  	};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   32  
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   33  	memory_hi2: memory@50000000000 {
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   34  		reg = <0x500 0 4 0>;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   35  		device_type = "memory";
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   36  	};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   37  
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   38  	chosen {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   39  		bootargs = "console=ttyAMA1,115200n8";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   40  		stdout-path = "serial1:115200n8";
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   41  	};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   42  
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   43  	cdx {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   44  		compatible = "xlnx,versal-net-cdx";
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   45  		status = "okay";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   46  		#address-cells = <2>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   47  		#size-cells = <2>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   48  		ranges;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   49  		dma-ranges = <0 0 0 0 0x10000 0>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   50  		iommu-map = <0x0 &smmu 0x0 0xfffff>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   51  		msi-map = <0x0 &its 0x0 0xffff>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   52  		xlnx,rproc = <&remoteproc_r52>;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   53  	};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   54  
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   55  	reserved-memory {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   56  		#address-cells = <2>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   57  		#size-cells = <2>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   58  		ranges;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   59  		rsc_tbl_carveout: rproc@bbf14000 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   60  			reg = <0 0xbbf14000 0 0x1000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   61  			no-map;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   62  		};
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   63  		rpu0vdev0vring0: rpu0vdev0vring0@bbf15000 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   64  			reg = <0 0xbbf15000 0 0x1000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   65  			no-map;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   66  		};
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   67  		rpu0vdev0vring1: rpu0vdev0vring1@bbf16000 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   68  			reg = <0 0xbbf16000 0 0x1000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   69  			no-map;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   70  		};
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   71  		rpu0vdev0buffer: rpu0vdev0buffer@bbf17000 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   72  			reg = <0 0xbbf17000 0 0xD000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   73  			no-map;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   74  		};
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   75  		reserve_others: reserveothers@0 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   76  			reg = <0 0x0 0 0x1c200000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   77  			no-map;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   78  		};
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   79  		pdi_update: pdiupdate@1c200000 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   80  			reg = <0 0x1c200000 0 0x6000000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   81  			no-map;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   82  		};
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   83  		reserve_optee_atf: reserveopteeatf@22200000 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   84  			reg = <0 0x22200000 0 0x4100000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   85  			no-map;
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   86  		};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   87  	};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   88  
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  @89  	zynqmp_ipi1_nobuf {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   90  		compatible = "xlnx,versal-ipi-mailbox";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   91  		reg = <0x00 0xeb3b0000 0x00 0x1ff>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   92  		reg-names = "ctrl";
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12   93  		status = "okay";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   94  		interrupts = <0 64 4>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   95  		xlnx,ipi-id = <10>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   96  		#address-cells = <2>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   97  		#size-cells = <2>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   98  		ranges;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19   99  		ipi_mailbox_rpu0: mailbox@eb3b1000 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  100  			#mbox-cells = <1>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  101  			xlnx,ipi-id = <11>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  102  			reg = <0 0xeb3b1000 0 0x1000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  103  			reg-names = "ctrl";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  104  		};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12  105  	};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12  106  
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  107  	r52ss@ff9a0000 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  108  		compatible = "xlnx,versal-net-r52-remoteproc";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  109  		#address-cells = <2>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  110  		#size-cells = <2>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  111  		ranges;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  112  		reg = <0 0xff9a0000 0 0x10000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  113  		xlnx,cluster-mode = <1>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  114  		remoteproc_r52: r52_0 {
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  115  			compatible = "xilinx,r52";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  116  			memory-region = <&rsc_tbl_carveout>, <&rpu0vdev0buffer>,
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  117  				<&rpu0vdev0vring0>, <&rpu0vdev0vring1>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  118  			power-domain = <&versal_net_firmware PM_DEV_RPU_A_0>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  119  			mboxes = <&ipi_mailbox_rpu0 0>, <&ipi_mailbox_rpu0 1>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  120  			mbox-names = "tx", "rx";
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  121  			xlnx,rsc-tbl = <&rsc_tbl_carveout 0xbbf14000>;
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  122  		};
e3d651358d5d0e arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts Abhijit Gangurde 2024-03-19  123  	};
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12  124  };
db2cebe1341f43 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts Michal Simek     2022-12-12  125  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
