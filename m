Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85A256C91
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 20:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760129849; cv=none; b=XxR6M87mpHwq5p3P9+Ar2T3nHJtNGP1yIg4wZ1M7MnwzZBWNbuzlSGe+Y/qYHnTt2cScWFLa4fGLbvGXY0+u27DjrFTAhR2hEJvjETu55tMGhCdjZMBhhY/nTeu4Y3mPgjExXgcyxGYzaxLYaUBTsW4IsmjUg1Ne7IFSJrtSbHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760129849; c=relaxed/simple;
	bh=7QNTtL9/QLM9MqARTtegsYMk20rCE8Z/VfT66FwmkF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ikYxezUYmigSvKJG3pOSjEHjVoUpe0QbwgkDYrJHMeZYF6YOcopVs/A71wPJFaZytAoF5Ic7+wLjfEtk0siJ8E34VAC5XkFO9M4y88BLzKvhZePEy8DalnFN/7r+U5BzMEZEjpHvL3nuAGGmFQl/tXsz5jqmgl6AFEvCp9hL9xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjHx6h2X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjHx6h2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760129847; x=1791665847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QNTtL9/QLM9MqARTtegsYMk20rCE8Z/VfT66FwmkF4=;
  b=fjHx6h2XJ/qHWbJTQq0WzslxQTs6y+5Kh8jDx7kX0BoKc8YnhSQ2L6zV
   ZKcj8aF8pVcHOAcEJAz44vJgZEw5oGuSEu+J0xAgBUeYUzwqeKjiLlED1
   rxTe+rq4HxRZGk633Th4f76MGOzYLjQNRxEsUu7o3nJVEAgLELBJkJBEb
   CiRrW8EKuhUjZSXGzgj6YAzzxQvLGP/iDcNH1kZeQcd+QRcFq7Q3Y1W25
   wzhwFZX6IHEfOYuPaJmo5dNiTFPCc3ZYvOE7JavLWSNku99h/sBDZcbRE
   f8FXgQiA7UAHtxi+eBD3ycqnrLPBwRQCb9PrhCdpQi63aVaQ5AqbgYo5b
   w==;
X-CSE-ConnectionGUID: 6Dinj2vhR8eiHZ6qYVDhXQ==
X-CSE-MsgGUID: NK962FU9QmOsVO9jB5d/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61560648"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="61560648"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 13:57:27 -0700
X-CSE-ConnectionGUID: /peZlXT0Q92wvBayI2qyHQ==
X-CSE-MsgGUID: 9AR8I/jFTAaBIQx/XKz7kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180183004"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 13:57:26 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7KB0-0003AR-2P;
	Fri, 10 Oct 2025 20:57:22 +0000
Date: Sat, 11 Oct 2025 04:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host
 driver
Message-ID: <202510110423.6WJM4Fjh-lkp@intel.com>
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
In-Reply-To: <20251007133657.390523-3-claudiu.beznea.uj@bp.renesas.com>
References: <20251007133657.390523-3-claudiu.beznea.uj@bp.renesas.com>
TO: Claudiu <claudiu.beznea@tuxon.dev>

Hi Claudiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus geert-renesas-devel/next arm64/for-next/core linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/dt-bindings-PCI-renesas-r9a08g045s33-pcie-Add-documentation-for-the-PCIe-IP-on-Renesas-RZ-G3S/20251010-112232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251007133657.390523-3-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH v5 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: powerpc64-randconfig-r073-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110423.6WJM4Fjh-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510110423.6WJM4Fjh-lkp@intel.com/

New smatch warnings:
drivers/pci/controller/pcie-rzg3s-host.c:831 rzg3s_pcie_msi_enable() error: uninitialized symbol 'irq'.
drivers/pci/controller/pcie-rzg3s-host.c:1689 rzg3s_pcie_suspend_noirq() warn: 'port->refclk' from clk_prepare_enable() not released on lines: 1689.

Old smatch warnings:
drivers/pci/controller/pcie-rzg3s-host.c:1341 rzg3s_pcie_parse_map_dma_ranges() warn: iterator 'i' not incremented

vim +/irq +831 drivers/pci/controller/pcie-rzg3s-host.c

badc28bc6d9ae3 Claudiu Beznea 2025-10-07  816  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  817  static int rzg3s_pcie_msi_enable(struct rzg3s_pcie_host *host)
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  818  {
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  819  	struct platform_device *pdev = to_platform_device(host->dev);
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  820  	struct rzg3s_pcie_msi *msi = &host->msi;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  821  	struct device *dev = host->dev;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  822  	const char *devname;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  823  	int irq, ret;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  824  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  825  	ret = devm_mutex_init(dev, &msi->map_lock);
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  826  	if (ret)
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  827  		return ret;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  828  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  829  	msi->irq = platform_get_irq_byname(pdev, "msi");
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  830  	if (msi->irq < 0)
badc28bc6d9ae3 Claudiu Beznea 2025-10-07 @831  		return dev_err_probe(dev, irq ? irq : -EINVAL,
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  832  				     "Failed to get MSI IRQ!\n");
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  833  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  834  	devname = devm_kasprintf(dev, GFP_KERNEL, "%s-msi", dev_name(dev));
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  835  	if (!devname)
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  836  		return -ENOMEM;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  837  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  838  	ret = rzg3s_pcie_msi_allocate_domains(msi);
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  839  	if (ret)
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  840  		return ret;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  841  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  842  	ret = request_irq(msi->irq, rzg3s_pcie_msi_irq, 0, devname, host);
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  843  	if (ret) {
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  844  		dev_err_probe(dev, ret, "Failed to request IRQ: %d\n", ret);
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  845  		goto free_domains;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  846  	}
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  847  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  848  	ret = rzg3s_pcie_msi_setup(host);
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  849  	if (ret) {
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  850  		dev_err_probe(dev, ret, "Failed to setup MSI!\n");
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  851  		goto free_irq;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  852  	}
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  853  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  854  	return 0;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  855  
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  856  free_irq:
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  857  	free_irq(msi->irq, host);
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  858  free_domains:
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  859  	irq_domain_remove(msi->domain);
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  860  	return ret;
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  861  }
badc28bc6d9ae3 Claudiu Beznea 2025-10-07  862  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
