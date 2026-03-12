Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E2539890E
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 04:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290983; cv=none; b=Gz4ihfx64cIJUT2kfc2RDxE28wm+8tHEm0KNc91oUIjVc6zEetA08RWGxBmlMipuBvEgs683sgMUazXdOjDdgBBDOxxMjiwqyj56BZoOLp1xRNkw+PH8944zfnMgSlObQq8AY5TdVDvnvBi8idL432zVl1MABFHz6/6QQRacoGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290983; c=relaxed/simple;
	bh=dQAtDhJeWNNQuZwZiXQGvNtNb0exY8QjscaiMnH+NoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHkbP9kfyNK3iTDj4PqgeQUB4BJzN8BAiu0ymu1I7nRS7ByK841MfdJpCwDlMM9JvQYMix591h4LlRgEbWiLXiA5QIbeoEgtbg3JRaQ/ozFkTk73EcBZCAEsUhRjtPfmqVdiw8MgcSMHImvKmz8f/fxt5YTHAXmx+sd12xuKrcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYSmOl+T; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYSmOl+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773290982; x=1804826982;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dQAtDhJeWNNQuZwZiXQGvNtNb0exY8QjscaiMnH+NoE=;
  b=VYSmOl+TvoNHGWzHrBZrtqUMTh5W5MxJDE2lwIIbs3Cbg3NxQ+utpq+1
   V10illMZ41w/4gVGt6RKY9A1VL6ouXkzANPBeC5WMbPXSaX5Ktp4oNOKC
   ZCNoohzP+mvHzFW1lLTlIk/W0QJlakQAK0PkcehTnhZuOxDb4d2oJ5dmT
   59vLnDtNUnrvBYPZV0imLn9FFj3xbNP7svuNRzhZkoLQ8lNFfkF0stPfK
   /ik4s3FsWp7mnaBumw1G8UYpNXVnUwxNj8+1VuePFisEbUHO0LSCqd7Rs
   CP8Y+geTuIE7BGlQzdXkcknxntS92xgKJ4JMcihZsf5TWBixIqH4lPjcE
   Q==;
X-CSE-ConnectionGUID: 9W8RlIoISrGwK6ZIjsLVcw==
X-CSE-MsgGUID: QxPkAWlwSPeq2oC7Tufh9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85001054"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="85001054"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:49:37 -0700
X-CSE-ConnectionGUID: Hai2Gfx1RxaOsB2nAG2UPg==
X-CSE-MsgGUID: egeBCSTYTk+Osp+un7z8LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="251193612"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2026 21:49:35 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XzJ-0000000025R-0Dcy;
	Thu, 12 Mar 2026 04:49:33 +0000
Date: Thu, 12 Mar 2026 12:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] powerpc: dts: Build devicetrees of enabled platforms
Message-ID: <202603121215.zM3tWJan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260311-mpc83xx-dtb-v3-1-4aa43bb9ffa0@posteo.net>
References: <20260311-mpc83xx-dtb-v3-1-4aa43bb9ffa0@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-dts-Build-devicetrees-of-enabled-platforms/20260311-214441
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260311-mpc83xx-dtb-v3-1-4aa43bb9ffa0%40posteo.net
patch subject: [PATCH v3] powerpc: dts: Build devicetrees of enabled platforms
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: powerpc64-randconfig-002-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121215.zM3tWJan-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121215.zM3tWJan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603121215.zM3tWJan-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/oca4080.dts:132.23-134.4: Warning (pci_bridge): /pcie@ffe200000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:68.9-83.4: Warning (pci_bridge): /pcie@ffe200000/pcie@0: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/oca4080.dts:136.23-138.4: Warning (pci_bridge): /pcie@ffe201000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:97.9-112.4: Warning (pci_bridge): /pcie@ffe201000/pcie@0: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/oca4080.dts:140.23-142.4: Warning (pci_bridge): /pcie@ffe202000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:126.9-141.4: Warning (pci_bridge): /pcie@ffe202000/pcie@0: missing ranges for PCI bridge (or not a bridge)
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:180.11-183.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:188.15-191.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:271.17-274.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/oca4080.dts:124.13-129.5: Warning (simple_bus_reg): /localbus@ffe124000/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:179.11-182.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:187.15-190.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:148.25-150.4: Warning (unit_address_vs_reg): /rapidio@ffe0c0000: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:196.23-198.4: Warning (unit_address_vs_reg): /pcie@ffe201000: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:196.23-198.4: Warning (pci_bridge): /pcie@ffe201000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:97.9-112.4: Warning (pci_bridge): /pcie@ffe201000/pcie@0: missing ranges for PCI bridge (or not a bridge)
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:179.11-182.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:187.15-190.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:244.17-247.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:159.12-164.5: Warning (simple_bus_reg): /localbus@ffe124000/nand@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:166.21-169.5: Warning (simple_bus_reg): /localbus@ffe124000/board-control@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:171.20-178.5: Warning (simple_bus_reg): /localbus@ffe124000/chassis-mgmt@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
