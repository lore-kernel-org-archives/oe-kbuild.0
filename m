Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC7B30EF93
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765814623; cv=none; b=DUwaKd0z5+ZeZSgsBoUr7EsNawimCmeemxVV6qJ1u+ElB6ckLg+fV/TPl0k0rEsQnQ0sc5XRfsyz9ObOTRHTAywiGftGrnsXZYnLK0vpwVD3ItBoLwHyuEsJP28T/Z0d+u/+DuG8XW2Db4yhyrQTOHmpEFwm7aJODp8hrZsbaec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765814623; c=relaxed/simple;
	bh=B90iDjX57GbasGpiVf1rq0wGnZd5I0A/8BEqXUm096E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EVCSyPMXR0uYZPjBKZ7XlPbtqEkWJfk9SJ9FPktU3yTYHHoa95A1gYtrvBo0ZcGXoGTOid3NBE3Ad2DhbZPy3mdq97qRgOulplupNPIqUPzB9qPSWoTW9euLKWkD1tsoLCAUkDW0hMeUSlJP87jiNSAuoKd9mCommngcJDDT+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2ZRQU2M; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2ZRQU2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765814622; x=1797350622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B90iDjX57GbasGpiVf1rq0wGnZd5I0A/8BEqXUm096E=;
  b=d2ZRQU2MNCODTOvsUFDztMzGomWSR/5GS4Jpp1rylynboy+9voeBAvMB
   K2I7O7XtLlSsMjrKWnI8sbpoEQjievRQlMbSAtnHOronsfOODpZMBUduQ
   RrHs9QoJMapMK65sxY35VqkgY0ny5vH3LNGp3Ki4QRzsTgYyXrVmCmHjH
   Xama6gQ0E7d51/XtGZt977IisFuk25TQ4vbSH/QO1HGAnlCRXelfs/t0+
   8drU3Wvb2moc1JihauoNFm/s/xFW0cYRN1R99cjbE1HgxAXTQDCnTEGSX
   vbSOV5q06OMB4RkeARKXuLkxpnZJeP6uc6nNowAJmnbx8Ugn7B5wiVCFK
   Q==;
X-CSE-ConnectionGUID: vb/hcKXHS8mXvviu66tZ8g==
X-CSE-MsgGUID: bMGKOuGyRhOVFdIXm3gD3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67754032"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67754032"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 08:03:41 -0800
X-CSE-ConnectionGUID: iw/lw1dVR8G5ocIPciRqgw==
X-CSE-MsgGUID: 50E6SZMvQ9O+LyAe3dwaYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197512508"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2025 08:03:41 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVB2v-000000000Rs-43EJ;
	Mon, 15 Dec 2025 16:03:37 +0000
Date: Tue, 16 Dec 2025 00:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202512160036.rG9zzTCe-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: arc-nsimosci_hs_defconfig (https://download.01.org/0day-ci/archive/20251216/202512160036.rG9zzTCe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160036.rG9zzTCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512160036.rG9zzTCe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/nsimosci_hs.dts:35.22-39.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:41.40-45.5: Warning (simple_bus_reg): /fpga/core-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:58.18-62.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:71.21-76.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
   arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
