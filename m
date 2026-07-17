Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BD3C3F7B
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 12:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289817; cv=none; b=AAXMNVNJEjT83sJqb45QDKniZmV7dnRzGVTGPduKT05c28BDoQyZ/ZrGRo5ZzCUk9ec67grtPIs4Pwbo0AEmwHhiGevBwCLR78Nw8wrKbvhNjRdHjXRdDg+I7oLNS0rap0LQGl6k/GqYSWURruQMPq6oiFZkXvhNYP+hoNFGQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289817; c=relaxed/simple;
	bh=kPNjoueil8DhpgO4VxNAJXAZJNXypkogewmHymxzi2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QXEgsXUEwWa7M/djU/9bg5jOp24p9GHdHLaD31/li9Je4qvDZObZMBHrj/6/N74Dbs24fEPJIfAMSu6a/PBA45qkkDFLZEeVA2ynlTHFnQnCPkhq/Ta47ITOm4b2k4asmuLlrOdQk1+JgDE0qdTaBTEP/Uj+LZKVUj6/0Y+eN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcYnj7Xg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcYnj7Xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784289815; x=1815825815;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kPNjoueil8DhpgO4VxNAJXAZJNXypkogewmHymxzi2Y=;
  b=UcYnj7XgDvfqQDmystBBrfojG72Zo6QC12BKIQwjor2M7eARxrgveEkt
   /veuvG2xIqiY+m6eSMUbTBOBTLjSV9TKvdTE0nArpxgGp6gD0fw+N6yMS
   jr5rmQcv2eHeVyXxLKG9tVVmm1FqqMgGbp+jQattsHB9LiyjH32UvWk9J
   qag4x8MzQB23jZgU/X4ZuWPXgNJcWX1DFBLcUs1aUot7snW7V6BPh/0cS
   ubsRMiBRaNfV4r2yn+HauOcP5qzTKRNxLbs/FbQC0NO3/Ycs4E9/MNo1j
   rFtCOfU0/ASx2GVgigArgiVE4NKuK5aV3XuBFMm1XzjxoizGXbd3v2p/F
   g==;
X-CSE-ConnectionGUID: 2TX2N2lWTjmi8INUklXFIw==
X-CSE-MsgGUID: lG2/m7omQDS7c9G/LJ9lpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="87505283"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="87505283"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:03:35 -0700
X-CSE-ConnectionGUID: w+et7B+rR6albwLA+IOzIQ==
X-CSE-MsgGUID: wHomEek2R/+vJ02y16HDxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="294966199"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Jul 2026 05:03:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkhHv-00000000SiO-1061;
	Fri, 17 Jul 2026 12:03:31 +0000
Date: Fri, 17 Jul 2026 20:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: Warning
 (interrupt_map): Failed prerequisite 'interrupt_provider'
Message-ID: <202607171916.Y7RbRYa5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   6 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-r133-20260717 (https://download.01.org/0day-ci/a=
rchive/20260717/202607171916.Y7RbRYa5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0=
dfced1adc55429e32b1db08570abd3a219d85)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260717/202607171916.Y7RbRYa5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607171916.Y7RbRYa5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/mpc8544ds.dts:14.9-17.4: Warning (unit_address=
_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/pq3-power.dtsi:10.25-12.4: Warning (unit_addre=
ss_vs_reg): /soc8544@e0000000/power@e0070/soc-clk@24: node has a unit name,=
 but no reg or ranges property
   arch/powerpc/boot/dts/fsl/pq3-power.dtsi:13.25-15.4: Warning (unit_addre=
ss_vs_reg): /soc8544@e0000000/power@e0070/soc-clk@25: node has a unit name,=
 but no reg or ranges property
   arch/powerpc/boot/dts/fsl/pq3-power.dtsi:16.25-18.4: Warning (unit_addre=
ss_vs_reg): /soc8544@e0000000/power@e0070/soc-clk@26: node has a unit name,=
 but no reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi:36.10-71.4: Warning (simple_bus=
_reg): /localbus@e0005000/nor@0,0: simple-bus unit address format error, ex=
pected "0"
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi:82.24-85.5: Warning (unique_uni=
t_address_if_enabled): /soc8544@e0000000/mdio@24520/ethernet-phy@0: duplica=
te unit-address (also used in node /soc8544@e0000000/mdio@24520/sgmii-phy@0)
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi:86.24-89.5: Warning (unique_uni=
t_address_if_enabled): /soc8544@e0000000/mdio@24520/ethernet-phy@1: duplica=
te unit-address (also used in node /soc8544@e0000000/mdio@24520/sgmii-phy@1)
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi:154.11-204.6: Warning (interrup=
t_provider): /pcie@e000b000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' fou=
nd, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:89.11-126.4: Warning (simple_bu=
s_reg): /localbus@ffe05000/nand@2,0: simple-bus unit address format error, =
expected "200000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:128.11-132.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@4,0: simple-bus unit address format error,=
 expected "400000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:134.11-138.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@5,0: simple-bus unit address format error,=
 expected "500000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:140.11-144.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@6,0: simple-bus unit address format error,=
 expected "600000000"
   arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi:164.23-166.4: Warning (sim=
ple_bus_reg): /soc8572@ffe00000/gpio-controller@f000: missing or empty reg/=
ranges property
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:155.24-158.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@0: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@0)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:159.24-162.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@1: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@1)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:163.24-166.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@2: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@2)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:167.24-170.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@3: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@3)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:375.11-425.6: Warning (interrup=
t_provider): /pcie@ffe08000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' fou=
nd, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
