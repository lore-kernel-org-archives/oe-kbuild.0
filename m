Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675814A85
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Mar 2024 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710542190; cv=none; b=UUjoQrkbf5EeUT30JkHc4yL8iiVNSCByI5e3pVBuYMWm4qdkRgJnfN7u2PHyqJMHH+vk49Hr7yxZck7K8dgBiZffWVKq/guWBBpRL2XsQrB34uBszARfMj7/GL9xuDbXS4FYdmnc5ScOj7+wpE9yBufypj3KG1Zw3EZcvkkn3OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710542190; c=relaxed/simple;
	bh=giaNVh7Znr6JqDKAGsH+bXFN65QuVet4kAUeAvHb4Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6InGIOjj7EmnAzlG1K6+N9+lewpcGcHycIeVPktTyEe8r9xd6PUTNx8kejEnEwLyaV4Fuec238K5aFB88Bq7meq521KDBtbsmzdec7+tuJBzs0FljC3LOF/1sMAyPqwcW23qLHewPLipkBc8s0meqd5/UmS8sdn88GPkkFnDTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbjxrOiI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbjxrOiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710542186; x=1742078186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=giaNVh7Znr6JqDKAGsH+bXFN65QuVet4kAUeAvHb4Jo=;
  b=IbjxrOiIrC2tiNdis/vqzW+2KmRlSXz8HGR4EqSD6XgZQ68LXi9a+DZv
   FmTJdHg8gpRLOVQmHf+JyxTp00Nzz+AkyZCXwgAu8ssvYYOjQhXUrt02k
   AWpgd9gLPFh+iBsJim28CobngfmR1s9hvGV1wa6fS30AXdB4YgHB5IzfO
   r6bwYGrAqVI/mlNPA8ctLewM0UrwhdHYlDM2mQTbfltYH8cmVON6P2L3v
   efil2ghC+UeD9H2nDF1VGXECl9qvBTU3Z1K/w0H379ah/dbE+roI11kC3
   Y2zWDNy+BO9jNXRXDcIu8TKZjVPIikQw/8whv7aCnVD3DjxzOcuFZsTOJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5640807"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5640807"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 15:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="17425961"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2024 15:36:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlGA2-000Eql-0j;
	Fri, 15 Mar 2024 22:36:22 +0000
Date: Sat, 16 Mar 2024 06:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 4556/21871]
 drivers/gpio/gpio-exar.c:152 gpio_exar_probe() warn: missing error code
 'ret'
Message-ID: <202403160655.9n8qKqP3-lkp@intel.com>
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
TO: Xie XiuQi <xiexiuqi@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c0f28264ce70e762ccdf396767a85688e6ed4810
commit: 96386d11646351bda8a42bc3e2115e03b489f992 [4556/21871] gpio: exar: add a check for the return value of ida_simple_get fails
:::::: branch date: 14 hours ago
:::::: commit date: 4 years, 3 months ago
config: x86_64-randconfig-161-20240303 (https://download.01.org/0day-ci/archive/20240316/202403160655.9n8qKqP3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403160655.9n8qKqP3-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpio-exar.c:152 gpio_exar_probe() warn: missing error code 'ret'

Old smatch warnings:
drivers/gpio/gpio-exar.c:56 exar_set_direction() warn: replace divide condition '(offset + exar_gpio->first_pin) / 8' with '(offset + exar_gpio->first_pin) >= 8'
drivers/gpio/gpio-exar.c:79 exar_get_direction() warn: replace divide condition '(offset + exar_gpio->first_pin) / 8' with '(offset + exar_gpio->first_pin) >= 8'
drivers/gpio/gpio-exar.c:89 exar_get_value() warn: replace divide condition '(offset + exar_gpio->first_pin) / 8' with '(offset + exar_gpio->first_pin) >= 8'
drivers/gpio/gpio-exar.c:100 exar_set_value() warn: replace divide condition '(offset + exar_gpio->first_pin) / 8' with '(offset + exar_gpio->first_pin) >= 8'

vim +/ret +152 drivers/gpio/gpio-exar.c

eddeae073760aa Axel Lin        2017-02-26  118  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  119  static int gpio_exar_probe(struct platform_device *pdev)
6596e59e63cd4c Sudip Mukherjee 2017-01-19  120  {
d3936d7437e388 Jan Kiszka      2017-06-09  121  	struct pci_dev *pcidev = to_pci_dev(pdev->dev.parent);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  122  	struct exar_gpio_chip *exar_gpio;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  123  	u32 first_pin, ngpios;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  124  	void __iomem *p;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  125  	int index, ret;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  126  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  127  	/*
8847f5f9ef5542 Jan Kiszka      2017-05-02  128  	 * The UART driver must have mapped region 0 prior to registering this
8847f5f9ef5542 Jan Kiszka      2017-05-02  129  	 * device - use it.
6596e59e63cd4c Sudip Mukherjee 2017-01-19  130  	 */
8847f5f9ef5542 Jan Kiszka      2017-05-02  131  	p = pcim_iomap_table(pcidev)[0];
6596e59e63cd4c Sudip Mukherjee 2017-01-19  132  	if (!p)
6596e59e63cd4c Sudip Mukherjee 2017-01-19  133  		return -ENOMEM;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  134  
a589e211bd7471 Jan Kiszka      2017-07-19  135  	ret = device_property_read_u32(&pdev->dev, "exar,first-pin",
380b1e2f3a2f32 Jan Kiszka      2017-05-22  136  				       &first_pin);
380b1e2f3a2f32 Jan Kiszka      2017-05-22  137  	if (ret)
380b1e2f3a2f32 Jan Kiszka      2017-05-22  138  		return ret;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  139  
380b1e2f3a2f32 Jan Kiszka      2017-05-22  140  	ret = device_property_read_u32(&pdev->dev, "ngpios", &ngpios);
380b1e2f3a2f32 Jan Kiszka      2017-05-22  141  	if (ret)
380b1e2f3a2f32 Jan Kiszka      2017-05-22  142  		return ret;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  143  
5dab5872e59390 Jan Kiszka      2017-06-09  144  	exar_gpio = devm_kzalloc(&pdev->dev, sizeof(*exar_gpio), GFP_KERNEL);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  145  	if (!exar_gpio)
6596e59e63cd4c Sudip Mukherjee 2017-01-19  146  		return -ENOMEM;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  147  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  148  	mutex_init(&exar_gpio->lock);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  149  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  150  	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
96386d11646351 Kangjie Lu      2019-03-08  151  	if (index < 0)
96386d11646351 Kangjie Lu      2019-03-08 @152  		goto err_destroy;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  153  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  154  	sprintf(exar_gpio->name, "exar_gpio%d", index);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  155  	exar_gpio->gpio_chip.label = exar_gpio->name;
4076cf08ac7673 Jan Kiszka      2017-05-21  156  	exar_gpio->gpio_chip.parent = &pdev->dev;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  157  	exar_gpio->gpio_chip.direction_output = exar_direction_output;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  158  	exar_gpio->gpio_chip.direction_input = exar_direction_input;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  159  	exar_gpio->gpio_chip.get_direction = exar_get_direction;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  160  	exar_gpio->gpio_chip.get = exar_get_value;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  161  	exar_gpio->gpio_chip.set = exar_set_value;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  162  	exar_gpio->gpio_chip.base = -1;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  163  	exar_gpio->gpio_chip.ngpio = ngpios;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  164  	exar_gpio->regs = p;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  165  	exar_gpio->index = index;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  166  	exar_gpio->first_pin = first_pin;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  167  
5dab5872e59390 Jan Kiszka      2017-06-09  168  	ret = devm_gpiochip_add_data(&pdev->dev,
6596e59e63cd4c Sudip Mukherjee 2017-01-19  169  				     &exar_gpio->gpio_chip, exar_gpio);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  170  	if (ret)
6596e59e63cd4c Sudip Mukherjee 2017-01-19  171  		goto err_destroy;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  172  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  173  	platform_set_drvdata(pdev, exar_gpio);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  174  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  175  	return 0;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  176  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  177  err_destroy:
6596e59e63cd4c Sudip Mukherjee 2017-01-19  178  	ida_simple_remove(&ida_index, index);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  179  	mutex_destroy(&exar_gpio->lock);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  180  	return ret;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  181  }
6596e59e63cd4c Sudip Mukherjee 2017-01-19  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
