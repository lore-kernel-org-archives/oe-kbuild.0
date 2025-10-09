Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840C2459F3
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760019042; cv=none; b=UeA6aE1HqsiKw+dVVPRB/1lB4EudXWDwktqSnMvEo9Gy/tm5vsLW+cnqz7r2U4pG2LmgQ4GcGDUli6ZicUUKF7DgMHWUmY6Mgb4z8dOAnwdIYedCiYg6hCdMZ5UXs2oDkGyfKDzmzVwWGRd4UDq1CHK8miMlHo0FlxKhrycW5rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760019042; c=relaxed/simple;
	bh=nKh+f2h1kGfii/5U7DctxM6YDBw9t3ZQ7BrkyUEMFs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lP1tLyuBcHqKJ6NKDOROJ9Ex9NPhKqz1k62xIVudCvzolB3iTxK6DotF7mxIMs1+tkQnG4/I0thbBRDhgx4ugODlSp2ggTBFIAARSFfaQgb7H18OKnZCQKmkiRi/ygE6CtEzLcZ9qYmu9MJnhViF7sWwOKVG2hD/nF9z8H5da+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knTvEFEm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knTvEFEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760019039; x=1791555039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nKh+f2h1kGfii/5U7DctxM6YDBw9t3ZQ7BrkyUEMFs0=;
  b=knTvEFEm0jo8kmH3jOXNektiZg7ARvGtxBEY8dcku1AGOdrmPKmFVUbV
   5jEx2DacQV7oTN2PUswo6gEGmuIRiXGW/HDuldoMIC4/6FlNLlPJwg/vK
   zfyAIX+XrIv/9t69i8wvceyrfp54bJv1dyAnvsqvdpxu07pGX9Exd4RZM
   MqMp6zZxm9DavR2uyyhZphsKbJA7Tr+x6qdeeKqN1oytqgt3M8UJzi8nb
   uxFIxqLpY+pFzERBbRAsHkyk2H/KCwTvm7GWERXr9I0qzjNcRnvTFxQR5
   gXOG8JNl3i5Q0/C9jxo3YfedpGF428snu1LmCXTBwdqmBZFBxHG5eNoo6
   g==;
X-CSE-ConnectionGUID: iZVQeooTT9KXyDbsC+I9RQ==
X-CSE-MsgGUID: v/Jnfb2PR/SAEiJTa4Snpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79670156"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="79670156"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 07:10:38 -0700
X-CSE-ConnectionGUID: hol1l77MS9+t+NgjMunoWA==
X-CSE-MsgGUID: nlMnRJuYT6G4Az/Rb0rnPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="211680080"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Oct 2025 07:10:36 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6rLm-0000nD-11;
	Thu, 09 Oct 2025 14:10:34 +0000
Date: Thu, 9 Oct 2025 22:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <202510092111.fZmvx6jO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251003023527.3284787-5-randolph@andestech.com>
References: <20251003023527.3284787-5-randolph@andestech.com>
TO: Randolph Lin <randolph@andestech.com>
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
CC: randolph.sklin@gmail.com
CC: tim609@andestech.com
CC: Randolph Lin <randolph@andestech.com>

Hi Randolph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linus/master v6.17 next-20251008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Randolph-Lin/PCI-dwc-Allow-adjusting-the-number-of-ob-ib-windows-in-glue-driver/20251003-104100
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251003023527.3284787-5-randolph%40andestech.com
patch subject: [PATCH v6 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc-randconfig-r071-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092111.fZmvx6jO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510092111.fZmvx6jO-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-andes-qilai.c:157 qilai_pcie_host_fix_ob_iatu_count() error: uninitialized symbol 'ranges_32bits'.

vim +/ranges_32bits +157 drivers/pci/controller/dwc/pcie-andes-qilai.c

816cad1ac60166 Randolph Lin 2025-10-03  124  
816cad1ac60166 Randolph Lin 2025-10-03  125  /*
816cad1ac60166 Randolph Lin 2025-10-03  126   * The QiLai SoC PCIe controller's outbound iATU region supports
816cad1ac60166 Randolph Lin 2025-10-03  127   * a maximum size of SZ_4G - 1. To prevent programming failures,
816cad1ac60166 Randolph Lin 2025-10-03  128   * only consider bridge->windows with sizes within this limit.
816cad1ac60166 Randolph Lin 2025-10-03  129   *
816cad1ac60166 Randolph Lin 2025-10-03  130   * To ensure compatibility with most endpoint devices, at least
816cad1ac60166 Randolph Lin 2025-10-03  131   * one memory region must be mapped within the 32-bits address space.
816cad1ac60166 Randolph Lin 2025-10-03  132   */
816cad1ac60166 Randolph Lin 2025-10-03  133  static int qilai_pcie_host_fix_ob_iatu_count(struct dw_pcie_rp *pp)
816cad1ac60166 Randolph Lin 2025-10-03  134  {
816cad1ac60166 Randolph Lin 2025-10-03  135  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
816cad1ac60166 Randolph Lin 2025-10-03  136  	struct device *dev = pci->dev;
816cad1ac60166 Randolph Lin 2025-10-03  137  	struct resource_entry *entry;
816cad1ac60166 Randolph Lin 2025-10-03  138  	/* Reserved 1 ob iATU for config space */
816cad1ac60166 Randolph Lin 2025-10-03  139  	int count = 1;
816cad1ac60166 Randolph Lin 2025-10-03  140  	int ranges_32bits;
816cad1ac60166 Randolph Lin 2025-10-03  141  	u64 pci_addr;
816cad1ac60166 Randolph Lin 2025-10-03  142  	u64 size;
816cad1ac60166 Randolph Lin 2025-10-03  143  
816cad1ac60166 Randolph Lin 2025-10-03  144  	resource_list_for_each_entry(entry, &pp->bridge->windows) {
816cad1ac60166 Randolph Lin 2025-10-03  145  		if (resource_type(entry->res) != IORESOURCE_MEM)
816cad1ac60166 Randolph Lin 2025-10-03  146  			continue;
816cad1ac60166 Randolph Lin 2025-10-03  147  
816cad1ac60166 Randolph Lin 2025-10-03  148  		size = resource_size(entry->res);
816cad1ac60166 Randolph Lin 2025-10-03  149  		if (size < SZ_4G)
816cad1ac60166 Randolph Lin 2025-10-03  150  			count++;
816cad1ac60166 Randolph Lin 2025-10-03  151  
816cad1ac60166 Randolph Lin 2025-10-03  152  		pci_addr = entry->res->start - entry->offset;
816cad1ac60166 Randolph Lin 2025-10-03  153  		if (pci_addr < SZ_4G)
816cad1ac60166 Randolph Lin 2025-10-03  154  			ranges_32bits = true;
816cad1ac60166 Randolph Lin 2025-10-03  155  	}
816cad1ac60166 Randolph Lin 2025-10-03  156  
816cad1ac60166 Randolph Lin 2025-10-03 @157  	if (!ranges_32bits) {
816cad1ac60166 Randolph Lin 2025-10-03  158  		dev_err(dev, "Bridge window must contain 32-bits address\n");
816cad1ac60166 Randolph Lin 2025-10-03  159  		return -EINVAL;
816cad1ac60166 Randolph Lin 2025-10-03  160  	}
816cad1ac60166 Randolph Lin 2025-10-03  161  
816cad1ac60166 Randolph Lin 2025-10-03  162  	pci->num_ob_windows = count;
816cad1ac60166 Randolph Lin 2025-10-03  163  
816cad1ac60166 Randolph Lin 2025-10-03  164  	return 0;
816cad1ac60166 Randolph Lin 2025-10-03  165  }
816cad1ac60166 Randolph Lin 2025-10-03  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
