Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268C82C0285
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 20:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680380; cv=none; b=ZTZ8xX5RrZpEgKn47BFuNVoqskQwD4v1oXc2Pd4K9T3dZeA83IQpGSu2n8QkAzBdqhMLzlSl9SiJ67PfsskoMHgMcKExJYSYpYF3gMHsREJRDmY5odbQSv2WwnieUlqKnh6VE2L9Zy2Bj6fLKHDY7xDyxOKcyWUTCnTMal2p2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680380; c=relaxed/simple;
	bh=EwPL435+PJDa4XSCogLuSMvDdkEfS/zblW0N8VFwQT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H8xqsn6muq3b8f4WqHcVkqtX81gIKYBmYZ9VYtBkVgTWVJptlC5TEHCTCPHCaqdJQ8JwrdybFGIG+cIXf3qjm46crApdvUdec5dXbHu5mChXMSltY27RYNCtWARqLHn9iI7tR8DyCpcyMXEo37ua4hl/21NCw1uxR8wI/s7nkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYTPTuye; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYTPTuye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768680379; x=1800216379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EwPL435+PJDa4XSCogLuSMvDdkEfS/zblW0N8VFwQT0=;
  b=gYTPTuyeX0ZfmWd+OtFLTtJD7bNmUHmszj/p0KcSuBVAdUVTCBfUdfVa
   5Gy2+RDSUMvc+3Th+NkHA3rHw3qGE95GsktmFk6S9H/Z4TDD6jkcnE9Dt
   fhYIYJGEYEhFcvXJT6z4yjKHmsB8dyJr7kN+GwY7XHhCJvmwUGZAk+4Ci
   Ogon7YtE2bIvp0n29FBU+95p7jafxluyeaV0Qk/rKeJmvAFKhdQQvVnzn
   +NReP246r30pvYdjR8cGbn74cr+TWzbQIfXNp99Tl71x0wWquYcA9Y4jq
   enbi5G/grJibm0GpthViE143AaIJI3MjC7nyZgyLMmiwNSSEkfSEOu0+h
   A==;
X-CSE-ConnectionGUID: qk6XD1s6QcyN1lUY4bC/1Q==
X-CSE-MsgGUID: rMZZx20RR4G/Fu6Ndg3XPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73804760"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="73804760"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 12:06:16 -0800
X-CSE-ConnectionGUID: fAZT+6J4ROqI7kLkmCrJDw==
X-CSE-MsgGUID: qvuUoK8fShery2W2fHCT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="243077075"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2026 12:06:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhCYm-00000000MBe-3gZN;
	Sat, 17 Jan 2026 20:06:12 +0000
Date: Sun, 18 Jan 2026 04:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 3/4] PCI: qilai: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <202601180304.wxPYBjMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pci/controller/dwc/pcie-andes-qilai.c:196:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260116110234.1908263-4-randolph@andestech.com>
References: <20260116110234.1908263-4-randolph@andestech.com>
TO: Randolph <randolph@andestech.com>
TO: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: jingoohan1@gmail.com
CC: mani@kernel.org
CC: lpieralisi@kernel.org
CC: kwilczynski@kernel.org
CC: robh@kernel.org
CC: bhelgaas@google.com
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: alex@ghiti.fr
CC: aou@eecs.berkeley.edu
CC: palmer@dabbelt.com
CC: paul.walmsley@sifive.com
CC: ben717@andestech.com
CC: inochiama@gmail.com
CC: thippeswamy.havalige@amd.com
CC: namcao@linutronix.de
CC: shradha.t@samsung.com
CC: pjw@kernel.org
CC: christian.bruel@foss.st.com
CC: quic_wenbyao@quicinc.com
CC: vincent.guittot@linaro.org
CC: elder@riscstar.com
CC: s-vadapalli@ti.com
CC: randolph.sklin@gmail.com
CC: tim609@andestech.com
CC: Randolph Lin <randolph@andestech.com>

Hi Randolph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Randolph/dt-bindings-PCI-Add-Andes-QiLai-PCIe-support/20260116-190842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260116110234.1908263-4-randolph%40andestech.com
patch subject: [PATCH v10 3/4] PCI: qilai: Add Andes QiLai SoC PCIe host driver support
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: riscv-randconfig-r111-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180304.wxPYBjMv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180304.wxPYBjMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601180304.wxPYBjMv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/pci/controller/dwc/pcie-andes-qilai.c:196:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/dwc/pcie-andes-qilai.c:196:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pci/controller/dwc/pcie-andes-qilai.c:197:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/dwc/pcie-andes-qilai.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pci/controller/dwc/pcie-andes-qilai.c:198:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/dwc/pcie-andes-qilai.c:198:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +196 drivers/pci/controller/dwc/pcie-andes-qilai.c

c1a5614bb4722f Randolph Lin 2026-01-16  195  
c1a5614bb4722f Randolph Lin 2026-01-16 @196  MODULE_AUTHOR("Randolph Lin <randolph@andestech.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
