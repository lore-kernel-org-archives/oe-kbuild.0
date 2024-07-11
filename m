Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740ABBE5A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720667764; cv=none; b=QIE1ldoKk1TCcg0siEO/a6uVZ5IO8B5+XVKglZ11ejVlCkjwfZgT8GxLu6p8uE+pC1lWOqD18UWuXbRlZXX8QfdIOk+nffgCV4YY+VzCz9CZfJXq/EoGLku7CqL7U4NfuenP7mcBRwCadJwIU/Qz0nhmuNR+C0eLudNbma/6GlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720667764; c=relaxed/simple;
	bh=VnB/UYtQyGVJTffjoV/o3McMgnDlAnH1gXHEtTAMI1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIiRHsJz2DHa45G04YNIiTGdkMZ6sv42IDnJXc6bk4PHMgNrdL1HzPLNSGBzZGzBENIhzKayXHJqQVWwAMijY9VGl6a9VWf4FnPLiaVV/xdH0dy/8IZxCs0R4UtGUFtGHlZld2uZ6aIKloWpMInXqUMIMZ65BJU3z8/7erSFlZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSFRY0Q3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSFRY0Q3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720667762; x=1752203762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VnB/UYtQyGVJTffjoV/o3McMgnDlAnH1gXHEtTAMI1w=;
  b=LSFRY0Q3QLKMU6+JchAorSakw7YjIOX5J9/WBHs/hPKKnYRjsipuHJbl
   t5Mj6IIayo+r6YOLDEC4b72f6dweapMxwdc8eKmvROtbflCvw7v9Sm/B9
   P1oWbNzs/GqLhMOOQzvnq7NyD1Y3vqnqw17t8mIw7RXr5pzPiBUdBnS+a
   VFsn+WA0oAedeP742qOa+wxBnULBjOns0Z/36tQm3rUe2qZR10hZbT3eV
   aGC+268uAUcdbGyMUszM0k9FHJXgjjtjYhobGGPg6/4wdq7S7IxHnf6AN
   +oikNX+g6Qe3cO0tDSpzxR9X9zVXVkkM2agtZhkM8HRVjOJAdmurD2hYJ
   w==;
X-CSE-ConnectionGUID: RowDu5IkTg6Ks88n7yC/UQ==
X-CSE-MsgGUID: lTeQaV1GQyecpBp/QwQk4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="43450515"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="43450515"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:16:01 -0700
X-CSE-ConnectionGUID: t7zFJY+PTS2M4Fmlvn5arQ==
X-CSE-MsgGUID: bNg1rb3oSSePKEKmI1J/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="52804486"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2024 20:16:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRkHm-000YgU-1O;
	Thu, 11 Jul 2024 03:15:58 +0000
Date: Thu, 11 Jul 2024 11:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 36/36] arch/mips/boot/dts/mti/sead3.dts:69.17-91.4:
 Warning (avoid_unnecessary_addr_size): /flash@1c000000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407111118.i3kfYlr9-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   12d638f48c082831388358cc12a1c6ee58185ad8
commit: 12d638f48c082831388358cc12a1c6ee58185ad8 [36/36] scripts/dtc: Update to upstream version v1.7.0-93-g1df7b047fe43
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: mips-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111118.i3kfYlr9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111118.i3kfYlr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407111118.i3kfYlr9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/mti/sead3.dts:155.12-160.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@10.7: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:162.12-167.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:168.12-173.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.1: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:174.12-179.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.2: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:180.12-185.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.3: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:186.12-191.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.4: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:192.12-197.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.5: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:198.12-203.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.6: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:204.12-209.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.7: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:211.11-214.5: Warning (unit_address_vs_reg): /system-controller@1f000200/lcd@200: node has a unit name, but no reg or ranges property
>> arch/mips/boot/dts/mti/sead3.dts:69.17-91.4: Warning (avoid_unnecessary_addr_size): /flash@1c000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/mips/boot/dts/mti/sead3.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: /: failed to match any schema with compatible: ['mti,sead-3']
   arch/mips/boot/dts/mti/sead3.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: cpu@0: compatible: ['mti,mips14KEc', 'mti,mips14Kc'] is too long
--
   arch/mips/boot/dts/mti/malta.dts:44.33-52.4: Warning (unit_address_vs_reg): /interrupt-controller@20: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/malta.dts:90.11-93.5: Warning (unit_address_vs_reg): /system-controller@1f000000/lcd@410: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/malta.dts:103.6-116.4: Warning (unit_address_vs_reg): /isa: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/mti/malta.dts:54.17-83.4: Warning (avoid_unnecessary_addr_size): /flash@1e000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/mips/boot/dts/mti/malta.dtb: /: interrupt-controller@20: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/mti/malta.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/mti/malta.dtb: /: failed to match any schema with compatible: ['mti,malta']
   arch/mips/boot/dts/mti/malta.dtb: interrupt-controller: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mti,cpu-interrupt-controller.yaml#
   arch/mips/boot/dts/mti/malta.dtb: interrupt-controller@1bdc0000: timer: 'oneOf' conditional failed, one must be fixed:

vim +69 arch/mips/boot/dts/mti/sead3.dts

b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26    9  
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   10  / {
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   11  	#address-cells = <1>;
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   12  	#size-cells = <1>;
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   13  	compatible = "mti,sead-3";
3f5f0a4475e133 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-10-05   14  	model = "MIPS SEAD-3";
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   15  
c11e3b48dbc367 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   16  	chosen {
c3d62fc6a058d1 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2017-06-02   17  		stdout-path = "serial1:115200";
c11e3b48dbc367 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   18  	};
c11e3b48dbc367 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   19  
c11e3b48dbc367 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   20  	aliases {
c3d62fc6a058d1 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2017-06-02   21  		serial0 = &uart0;
c3d62fc6a058d1 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2017-06-02   22  		serial1 = &uart1;
c11e3b48dbc367 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   23  	};
c11e3b48dbc367 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   24  
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   25  	cpus {
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   26  		cpu@0 {
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   27  			compatible = "mti,mips14KEc", "mti,mips14Kc";
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   28  		};
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   29  	};
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   30  
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   31  	memory {
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   32  		device_type = "memory";
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   33  		reg = <0x0 0x08000000>;
9b73100911ac68 arch/mips/mti-sead3/sead3.dts    Steven J. Hill 2013-01-17   34  	};
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   35  
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   36  	cpu_intc: interrupt-controller {
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   37  		compatible = "mti,cpu-interrupt-controller";
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   38  
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   39  		interrupt-controller;
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   40  		#interrupt-cells = <1>;
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   41  	};
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   42  
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   43  	gic: interrupt-controller@1b1c0000 {
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   44  		compatible = "mti,gic";
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   45  		reg = <0x1b1c0000 0x20000>;
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   46  
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   47  		interrupt-controller;
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   48  		#interrupt-cells = <3>;
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   49  
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   50  		/*
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   51  		 * Declare the interrupt-parent even though the mti,gic
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   52  		 * binding doesn't require it, such that the kernel can
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   53  		 * figure out that cpu_intc is the root interrupt
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   54  		 * controller & should be probed first.
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   55  		 */
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   56  		interrupt-parent = <&cpu_intc>;
b6d5e47e672925 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   57  	};
c11e3b48dbc367 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   58  
f4fc91af939249 arch/mips/boot/dts/mti/sead3.dts Serge Semin    2020-11-11   59  	usb@1b200000 {
7afd2a5aec2ea2 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   60  		compatible = "generic-ehci";
7afd2a5aec2ea2 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   61  		reg = <0x1b200000 0x1000>;
7afd2a5aec2ea2 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   62  
fbdc674ba33c37 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2017-06-02   63  		interrupt-parent = <&gic>;
d3f616346def16 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2017-06-02   64  		interrupts = <GIC_SHARED 0 IRQ_TYPE_LEVEL_HIGH>; /* GIC 0 or CPU 6 */
7afd2a5aec2ea2 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   65  
7afd2a5aec2ea2 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   66  		has-transaction-translator;
7afd2a5aec2ea2 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   67  	};
7afd2a5aec2ea2 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   68  
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  @69  	flash@1c000000 {
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   70  		compatible = "intel,28f128j3", "cfi-flash";
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   71  		reg = <0x1c000000 0x2000000>;
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   72  		#address-cells = <1>;
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   73  		#size-cells = <1>;
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   74  		bank-width = <4>;
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   75  
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   76  		partitions {
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   77  			compatible = "fixed-partitions";
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   78  			#address-cells = <1>;
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   79  			#size-cells = <1>;
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   80  
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   81  			user-fs@0 {
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   82  				label = "User FS";
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   83  				reg = <0x0 0x1fc0000>;
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   84  			};
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   85  
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   86  			board-config@3e0000 {
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   87  				label = "Board Config";
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   88  				reg = <0x1fc0000 0x40000>;
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   89  			};
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   90  		};
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   91  	};
3aefc6554ad95f arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   92  
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   93  	fpga_regs: system-controller@1f000000 {
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   94  		compatible = "mti,sead3-fpga", "syscon", "simple-mfd";
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   95  		reg = <0x1f000000 0x200>;
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   96  
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   97  		reboot {
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   98  			compatible = "syscon-reboot";
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26   99  			regmap = <&fpga_regs>;
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  100  			offset = <0x50>;
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  101  			mask = <0x4d>;
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  102  		};
a1ec6003f21547 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  103  
a1ec6003f21547 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  104  		poweroff {
a1ec6003f21547 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  105  			compatible = "restart-poweroff";
a1ec6003f21547 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  106  		};
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  107  	};
70bfdcec9ad9bc arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  108  
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  109  	system-controller@1f000200 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  110  		compatible = "mti,sead3-cpld", "syscon", "simple-mfd";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  111  		reg = <0x1f000200 0x300>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  112  
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  113  		led@10.0 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  114  			compatible = "register-bit-led";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  115  			offset = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  116  			mask = <0x1>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  117  			label = "pled0";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  118  		};
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  119  		led@10.1 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  120  			compatible = "register-bit-led";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  121  			offset = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  122  			mask = <0x2>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  123  			label = "pled1";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  124  		};
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  125  		led@10.2 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  126  			compatible = "register-bit-led";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  127  			offset = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  128  			mask = <0x4>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  129  			label = "pled2";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  130  		};
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  131  		led@10.3 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  132  			compatible = "register-bit-led";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  133  			offset = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  134  			mask = <0x8>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  135  			label = "pled3";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  136  		};
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  137  		led@10.4 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  138  			compatible = "register-bit-led";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  139  			offset = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  140  			mask = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  141  			label = "pled4";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  142  		};
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  143  		led@10.5 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  144  			compatible = "register-bit-led";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  145  			offset = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  146  			mask = <0x20>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  147  			label = "pled5";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  148  		};
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  149  		led@10.6 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  150  			compatible = "register-bit-led";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  151  			offset = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  152  			mask = <0x40>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  153  			label = "pled6";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  154  		};
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  155  		led@10.7 {
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  156  			compatible = "register-bit-led";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  157  			offset = <0x10>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  158  			mask = <0x80>;
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  159  			label = "pled7";
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  160  		};
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26  161  
c764583f40b8d3 arch/mips/boot/dts/mti/sead3.dts Paul Burton    2016-08-26 @162  		led@18.0 {

:::::: The code at line 69 was first introduced by commit
:::::: 3aefc6554ad95f64de5ab384a959f96eb188f273 MIPS: SEAD3: Probe parallel flash via DT

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
