Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1592119
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jan 2025 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735714637; cv=none; b=Zh7FhWVJFXAIqCueMHoSEYcXoCZ9OKg6plIijnhpuWnk6plhZyjNVrSFBIW2fcluwSLWOX1kbz26DxZgJPyjw8Nqe26euC/j9zr01mE5K+O8MaWCe0qCNSdzazPptqbwNzYPT0qquohi7Nd3tqakiO5L4MydWeIArJvDuBeDZto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735714637; c=relaxed/simple;
	bh=vRe1srcAntd1nu6nVBX5xBejHL6Qfpzk2mdkLpBtF58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcOaokqgcBVgaVIJIkwNe8WqpTAXHYKnFo7f0PP+AagyNKtQKTebfvwn71/TwMZ0SvKv5yUFaknXLl85b3Zz7lHw8Id5DRiEqajqUb9ZGlBY1AxANTgH7WH8eWscz+1FNxibWeGJCE6QClGa594Vfe9rvUpTeRq2iyYQ6tYiWCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpzVs7zm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpzVs7zm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735714635; x=1767250635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRe1srcAntd1nu6nVBX5xBejHL6Qfpzk2mdkLpBtF58=;
  b=cpzVs7zmLIUWcteb8/vmm5cRITYO/aQhGQxXx7dxLxmcxFpjKR32OK81
   mGbym5N7k6UjT0uahr1WR3UDnDzlf9epgQ1b7U3MqEC5wAri/9XDHr9iF
   MTXVt4r+KlsIIvoaEVi1GPdCpwxuvcYeO4z5BH5+z4f/8rmZNnjvp7Geg
   Ptfy487RwHKCeE0Gnc0d50WHxLAHOfwPztlvNPvwM5pGL0udNnevaBroY
   agHMOEupeqChCke7YwflEpV209ULGe1EakIwftyv5woOzB+ImLQ1nBps7
   /G5yAwcjFO1xTQAC6yFz5kwt6eQ0sCbZOri3z0saqz1WVfZn3JotQVf0U
   Q==;
X-CSE-ConnectionGUID: Qm+FQK5/RyyF+0VJKwaKXw==
X-CSE-MsgGUID: KP9Cy7lIRlCbGlNCdlNuSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61348083"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="61348083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 22:57:14 -0800
X-CSE-ConnectionGUID: gi/PBgCNQraoStDMda6fWQ==
X-CSE-MsgGUID: /VPGCaNlQo6hPA7eWi3i/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="106183161"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Dec 2024 22:57:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSsfG-0007gV-1b;
	Wed, 01 Jan 2025 06:57:10 +0000
Date: Wed, 1 Jan 2025 14:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-5.10 2616/2616]
 arch/arm64/kernel/mpam/mpam_device.c:1838:1-33: WARNING: Function
 "for_each_available_child_of_node" should have of_node_put() before break
 around line 1841.
Message-ID: <202501011414.RzBqzjeq-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   55bf638d3d29c53ddd64ed89efda8b70b47ccbbc
commit: c0ec28ac9769e4df7757ba3ed94295446243ec31 [2616/2616] arm64/mpam: refactor device tree structure to support multiple devices
:::::: branch date: 22 hours ago
:::::: commit date: 2 years, 11 months ago
config: arm64-randconfig-r052-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011414.RzBqzjeq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501011414.RzBqzjeq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/mpam/mpam_device.c:1838:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before break around line 1841.

vim +/for_each_available_child_of_node +1838 arch/arm64/kernel/mpam/mpam_device.c

7926bf06ce9fb8 Xingang Wang 2022-01-10  1817  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1818  static int arm_mpam_device_probe(struct platform_device *pdev)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1819  {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1820  	int ret;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1821  	struct device *dev = &pdev->dev;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1822  	struct device_node *node = dev->of_node;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1823  	struct device_node *child = NULL;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1824  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1825  	if (!cpus_have_const_cap(ARM64_HAS_MPAM))
7926bf06ce9fb8 Xingang Wang 2022-01-10  1826  		return 0;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1827  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1828  	if (!acpi_disabled || mpam_enabled != MPAM_ENABLE_OF)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1829  		return 0;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1830  
c0ec28ac9769e4 Xingang Wang 2022-01-29  1831  	if (!node || !of_match_node(arm_mpam_of_device_ids, pdev->dev.of_node))
c0ec28ac9769e4 Xingang Wang 2022-01-29  1832  		return -EINVAL;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1833  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1834  	ret = mpam_discovery_start();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1835  	if (ret)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1836  		return ret;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1837  
c0ec28ac9769e4 Xingang Wang 2022-01-29 @1838  	for_each_available_child_of_node(node, child) {
c0ec28ac9769e4 Xingang Wang 2022-01-29  1839  		ret = of_mpam_add_child(pdev, child);
c0ec28ac9769e4 Xingang Wang 2022-01-29  1840  		if (ret)
c0ec28ac9769e4 Xingang Wang 2022-01-29 @1841  			break;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1842  	}
7926bf06ce9fb8 Xingang Wang 2022-01-10  1843  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1844  	if (ret) {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1845  		mpam_discovery_failed();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1846  	} else {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1847  		ret = mpam_discovery_complete();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1848  		if (!ret)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1849  			pr_info("Successfully init mpam by DT.\n");
7926bf06ce9fb8 Xingang Wang 2022-01-10  1850  	}
7926bf06ce9fb8 Xingang Wang 2022-01-10  1851  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1852  	return ret;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1853  }
7926bf06ce9fb8 Xingang Wang 2022-01-10  1854  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
