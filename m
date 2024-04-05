Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A647A7D
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Apr 2024 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712301817; cv=none; b=L7Ny5yX2qOLP7TNYx95Dbx3YwtUHqPsaIWRpCUtD5QwTHqUT4ypzTCfpllWdZsp0+wgE/xpKkMhDQOH6lkI7E0+27AQCxgpJ17d72N9HADFBZq/bnUKiP9pwBNO7dREqcG9Ka8pX8WYJBZF3c+kvqqKB3cLbyRgPZWDOxM7b7E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712301817; c=relaxed/simple;
	bh=G/rd/QjSjP4VieLDI/sx8haC+ZwNwWX+FhPJf4xpS/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCflzCfKvOK112S0iiWdcoNsbU7B3sFswLPlOFaE6y92ygsPczxjouD/K1/RGpBOiq9frHvPlsieHFpeEwoBz0KKRCqsKKrJ37jOfrvsMwi2cwyaaQOa3Qugf77gAqXRsg2LwiWU+p1xAnrK49PI89WOktFCWTlSf8NmWqBbW0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhgQrGcY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhgQrGcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712301815; x=1743837815;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G/rd/QjSjP4VieLDI/sx8haC+ZwNwWX+FhPJf4xpS/8=;
  b=DhgQrGcYWQNqCedv6KTThRYIoFriaJcSeOZwjMDvvMh7F+2XpmgOmGZb
   pbG6gtWeR4MZhcodO60+ZoCrIyOw8oSEwk7c3D0v5nII5y7QjETx/wzhh
   fqhi6GW/GDxk3m1GM4m37iu0MInkW1J4rwu+aKHnRVHGzUlbSXkGlMZEo
   h6ambdFOyC4euIbp5jyDzcxI0UD614uYACtWbXMHX9vHx0uOhh/+ay6cQ
   m3YMxR720t9smg9v1SMEn6B5rQnvYgy4Iwse7RrpkXgON9PXkDgOHbeyp
   2SBHTEHun5mFo08JhOJeaV37AwGZIA+qkQdUm4jGm3xzpwFA98WmUoBPj
   w==;
X-CSE-ConnectionGUID: ofXsPiDyTJi9BwqG9s/NTQ==
X-CSE-MsgGUID: mrIxS7RES8yqTaQJVmtl+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11415056"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="11415056"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 00:23:34 -0700
X-CSE-ConnectionGUID: Q/0mL2UDTaCL4qGYdc8Khw==
X-CSE-MsgGUID: bQMqXhMeQhyeDLhpLQcFWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23550082"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Apr 2024 00:23:33 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsdv8-00020k-2b;
	Fri, 05 Apr 2024 07:23:30 +0000
Date: Fri, 5 Apr 2024 15:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 02/18] PCI: endpoint: Introduce pci_epc_map_align()
Message-ID: <202404051508.hvNRDVZq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240330041928.1555578-3-dlemoal@kernel.org>
References: <20240330041928.1555578-3-dlemoal@kernel.org>
TO: Damien Le Moal <dlemoal@kernel.org>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Shawn Lin <shawn.lin@rock-chips.com>
TO: "Krzysztof Wilczyński" <kw@linux.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: linux-pci@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org
CC: Rick Wertenbroek <rick.wertenbroek@gmail.com>
CC: Wilfred Mallawa <wilfred.mallawa@wdc.com>
CC: Niklas Cassel <cassel@kernel.org>

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus mani-mhi/mhi-next linus/master v6.9-rc2 next-20240405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Le-Moal/PCI-endpoint-Introduce-pci_epc_function_is_valid/20240330-122311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240330041928.1555578-3-dlemoal%40kernel.org
patch subject: [PATCH v2 02/18] PCI: endpoint: Introduce pci_epc_map_align()
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: parisc-randconfig-r071-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051508.hvNRDVZq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404051508.hvNRDVZq-lkp@intel.com/

smatch warnings:
drivers/pci/endpoint/pci-epc-core.c:493 pci_epc_map_align() error: we previously assumed 'features' could be null (see line 487)

vim +/features +493 drivers/pci/endpoint/pci-epc-core.c

5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  435  
9d2f10d2ace040 Damien Le Moal         2024-03-30  436  /**
9d2f10d2ace040 Damien Le Moal         2024-03-30  437   * pci_epc_map_align() - Get the offset into and the size of a controller memory
9d2f10d2ace040 Damien Le Moal         2024-03-30  438   *			 address region needed to map a RC PCI address region
9d2f10d2ace040 Damien Le Moal         2024-03-30  439   * @epc: the EPC device on which address is allocated
9d2f10d2ace040 Damien Le Moal         2024-03-30  440   * @func_no: the physical endpoint function number in the EPC device
9d2f10d2ace040 Damien Le Moal         2024-03-30  441   * @vfunc_no: the virtual endpoint function number in the physical function
9d2f10d2ace040 Damien Le Moal         2024-03-30  442   * @pci_addr: PCI address to which the physical address should be mapped
9d2f10d2ace040 Damien Le Moal         2024-03-30  443   * @size: the size of the mapping starting from @pci_addr
9d2f10d2ace040 Damien Le Moal         2024-03-30  444   * @map: populate here the actual size and offset into the controller memory
9d2f10d2ace040 Damien Le Moal         2024-03-30  445   *       that must be allocated for the mapping
9d2f10d2ace040 Damien Le Moal         2024-03-30  446   *
9d2f10d2ace040 Damien Le Moal         2024-03-30  447   * Invoke the controller map_align operation to obtain the size and the offset
9d2f10d2ace040 Damien Le Moal         2024-03-30  448   * into a controller address region that must be allocated to map @size
9d2f10d2ace040 Damien Le Moal         2024-03-30  449   * bytes of the RC PCI address space starting from @pci_addr.
9d2f10d2ace040 Damien Le Moal         2024-03-30  450   *
9d2f10d2ace040 Damien Le Moal         2024-03-30  451   * The size of the mapping that can be handled by the controller is indicated
9d2f10d2ace040 Damien Le Moal         2024-03-30  452   * using the pci_size field of @map. This size may be smaller than the requested
9d2f10d2ace040 Damien Le Moal         2024-03-30  453   * @size. In such case, the function driver must handle the mapping using
9d2f10d2ace040 Damien Le Moal         2024-03-30  454   * several fragments. The offset into the controller memory for the effective
9d2f10d2ace040 Damien Le Moal         2024-03-30  455   * mapping of the @pci_addr..@pci_addr+@map->pci_size address range is indicated
9d2f10d2ace040 Damien Le Moal         2024-03-30  456   * using the map_ofst field of @map.
9d2f10d2ace040 Damien Le Moal         2024-03-30  457   */
9d2f10d2ace040 Damien Le Moal         2024-03-30  458  int pci_epc_map_align(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
9d2f10d2ace040 Damien Le Moal         2024-03-30  459  		      u64 pci_addr, size_t size, struct pci_epc_map *map)
9d2f10d2ace040 Damien Le Moal         2024-03-30  460  {
9d2f10d2ace040 Damien Le Moal         2024-03-30  461  	const struct pci_epc_features *features;
9d2f10d2ace040 Damien Le Moal         2024-03-30  462  	size_t mask;
9d2f10d2ace040 Damien Le Moal         2024-03-30  463  	int ret;
9d2f10d2ace040 Damien Le Moal         2024-03-30  464  
9d2f10d2ace040 Damien Le Moal         2024-03-30  465  	if (!pci_epc_function_is_valid(epc, func_no, vfunc_no))
9d2f10d2ace040 Damien Le Moal         2024-03-30  466  		return -EINVAL;
9d2f10d2ace040 Damien Le Moal         2024-03-30  467  
9d2f10d2ace040 Damien Le Moal         2024-03-30  468  	if (!size || !map)
9d2f10d2ace040 Damien Le Moal         2024-03-30  469  		return -EINVAL;
9d2f10d2ace040 Damien Le Moal         2024-03-30  470  
9d2f10d2ace040 Damien Le Moal         2024-03-30  471  	memset(map, 0, sizeof(*map));
9d2f10d2ace040 Damien Le Moal         2024-03-30  472  	map->pci_addr = pci_addr;
9d2f10d2ace040 Damien Le Moal         2024-03-30  473  	map->pci_size = size;
9d2f10d2ace040 Damien Le Moal         2024-03-30  474  
9d2f10d2ace040 Damien Le Moal         2024-03-30  475  	if (epc->ops->map_align) {
9d2f10d2ace040 Damien Le Moal         2024-03-30  476  		mutex_lock(&epc->lock);
9d2f10d2ace040 Damien Le Moal         2024-03-30  477  		ret = epc->ops->map_align(epc, func_no, vfunc_no, map);
9d2f10d2ace040 Damien Le Moal         2024-03-30  478  		mutex_unlock(&epc->lock);
9d2f10d2ace040 Damien Le Moal         2024-03-30  479  		return ret;
9d2f10d2ace040 Damien Le Moal         2024-03-30  480  	}
9d2f10d2ace040 Damien Le Moal         2024-03-30  481  
9d2f10d2ace040 Damien Le Moal         2024-03-30  482  	/*
9d2f10d2ace040 Damien Le Moal         2024-03-30  483  	 * Assume a fixed alignment constraint as specified by the controller
9d2f10d2ace040 Damien Le Moal         2024-03-30  484  	 * features.
9d2f10d2ace040 Damien Le Moal         2024-03-30  485  	 */
9d2f10d2ace040 Damien Le Moal         2024-03-30  486  	features = pci_epc_get_features(epc, func_no, vfunc_no);
9d2f10d2ace040 Damien Le Moal         2024-03-30 @487  	if (!features || !features->align) {
9d2f10d2ace040 Damien Le Moal         2024-03-30  488  		map->map_pci_addr = pci_addr;
9d2f10d2ace040 Damien Le Moal         2024-03-30  489  		map->map_size = size;
9d2f10d2ace040 Damien Le Moal         2024-03-30  490  		map->map_ofst = 0;
9d2f10d2ace040 Damien Le Moal         2024-03-30  491  	}
9d2f10d2ace040 Damien Le Moal         2024-03-30  492  
9d2f10d2ace040 Damien Le Moal         2024-03-30 @493  	mask = features->align - 1;
9d2f10d2ace040 Damien Le Moal         2024-03-30  494  	map->map_pci_addr = map->pci_addr & ~mask;
9d2f10d2ace040 Damien Le Moal         2024-03-30  495  	map->map_ofst = map->pci_addr & mask;
9d2f10d2ace040 Damien Le Moal         2024-03-30  496  	map->map_size = ALIGN(map->map_ofst + map->pci_size, features->align);
9d2f10d2ace040 Damien Le Moal         2024-03-30  497  
9d2f10d2ace040 Damien Le Moal         2024-03-30  498  	return 0;
9d2f10d2ace040 Damien Le Moal         2024-03-30  499  }
9d2f10d2ace040 Damien Le Moal         2024-03-30  500  EXPORT_SYMBOL_GPL(pci_epc_map_align);
9d2f10d2ace040 Damien Le Moal         2024-03-30  501  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
