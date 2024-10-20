Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBB018A926
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729427927; cv=none; b=KS/CCbAv3WTlIYTUSlEv+ynKKmmAE9ZENuoGa7G1SEyqYb78rjmx/gHybEq/fwTLONL+tdGbtKRmDh7EKNwn7FW5cTIv3QPkQWvMVO/bYWJ0QO3gOwh+ogg0+s1/ZVau5youExLu2Fstb202bW2gWALaVEPMEyV5DgcXFseD9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729427927; c=relaxed/simple;
	bh=jayG8CNDhdptCmiW+wzpAZkIrdcuFvRT9zHVRPs9YiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S9CY3eB/9MobxsB1tTtcPcn0Gth4HcLoXDw7OrWojRxQmyFoOpbR4S8ET4EQhEoSWkWKTLQ4QI8fhxdN3BFiJcsGA4pFJX53JX7iKdFVVBf5E2kTZQX82OH0d6xQM7+3POVq7svZdqu98QKQlWBbpmK8aaUdN7PXsjEAGtfp0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYWzW1O5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYWzW1O5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729427924; x=1760963924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jayG8CNDhdptCmiW+wzpAZkIrdcuFvRT9zHVRPs9YiA=;
  b=BYWzW1O5Y7gNuSkwxD9HrCCF5hMFWE6z7aKG29KKgACphVIxNV48l//T
   BBY5KbV6aDIWFZEPb6sMPXTK9ZWcaVUBnse/UsKFrg+zCMjVhiA3Cdjez
   +eLmmCSOWY8XlzEWCh6Kkcv0sGfQ76NyaSFg41JyS0eoQYKEzSmY3u4Qt
   9tQs1lY9iaCr4LUG3CKasv4W6PSwVEF7UcN1IpDDgpjJjm2NRPF6BKxtU
   0xkB8TN99T34HBPcDzr5Y78dh3UveoxyWcg6bedliWTCgXAYHVdGuam9F
   M3ESFROQVoRdq6JH5bHbubqDJ2TD5p3LPw/3sGWZxWOnK6/YfusiSY6TA
   A==;
X-CSE-ConnectionGUID: d9qtxSM3SpSRcswwmsFzfA==
X-CSE-MsgGUID: kkUFU9Y0T2S7EDReorMUmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="31772244"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="31772244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 05:38:43 -0700
X-CSE-ConnectionGUID: NLTr8sY6RGW4PMj222uLnQ==
X-CSE-MsgGUID: Aa1XPsfQThasZf462DKE9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79429898"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Oct 2024 05:38:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2VCh-000QHL-1K;
	Sun, 20 Oct 2024 12:38:39 +0000
Date: Sun, 20 Oct 2024 20:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/6] i3c: master: Add a routine to include the I3C SPD
 device
Message-ID: <202410202052.vnBPG6JZ-lkp@intel.com>
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
In-Reply-To: <20241017150330.3035568-5-Shyam-sundar.S-k@amd.com>
References: <20241017150330.3035568-5-Shyam-sundar.S-k@amd.com>
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC: Sanket.Goswami@amd.com
CC: linux-i3c@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i3c-dw-Add-support-for-AMDI0015-ACPI-ID/20241017-230810
base:   linus/master
patch link:    https://lore.kernel.org/r/20241017150330.3035568-5-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 4/6] i3c: master: Add a routine to include the I3C SPD device
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241020 (https://download.01.org/0day-ci/archive/20241020/202410202052.vnBPG6JZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410202052.vnBPG6JZ-lkp@intel.com/

New smatch warnings:
drivers/i3c/master.c:1910 i3c_master_bus_init() error: uninitialized symbol 'i3cboardinfo'.

Old smatch warnings:
drivers/i3c/master.c:2548 i3c_i2c_notifier_call() error: uninitialized symbol 'ret'.

vim +/i3cboardinfo +1910 drivers/i3c/master.c

3a379bbcea0af6 Boris Brezillon    2017-07-19  1819  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1820  /**
3a379bbcea0af6 Boris Brezillon    2017-07-19  1821   * i3c_master_bus_init() - initialize an I3C bus
3a379bbcea0af6 Boris Brezillon    2017-07-19  1822   * @master: main master initializing the bus
3a379bbcea0af6 Boris Brezillon    2017-07-19  1823   *
3a379bbcea0af6 Boris Brezillon    2017-07-19  1824   * This function is following all initialisation steps described in the I3C
3a379bbcea0af6 Boris Brezillon    2017-07-19  1825   * specification:
3a379bbcea0af6 Boris Brezillon    2017-07-19  1826   *
cc3a392d69b62e Parshuram Thombare 2020-08-25  1827   * 1. Attach I2C devs to the master so that the master can fill its internal
cc3a392d69b62e Parshuram Thombare 2020-08-25  1828   *    device table appropriately
3a379bbcea0af6 Boris Brezillon    2017-07-19  1829   *
3a379bbcea0af6 Boris Brezillon    2017-07-19  1830   * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
3a379bbcea0af6 Boris Brezillon    2017-07-19  1831   *    the master controller. That's usually where the bus mode is selected
3a379bbcea0af6 Boris Brezillon    2017-07-19  1832   *    (pure bus or mixed fast/slow bus)
3a379bbcea0af6 Boris Brezillon    2017-07-19  1833   *
3a379bbcea0af6 Boris Brezillon    2017-07-19  1834   * 3. Instruct all devices on the bus to drop their dynamic address. This is
3a379bbcea0af6 Boris Brezillon    2017-07-19  1835   *    particularly important when the bus was previously configured by someone
3a379bbcea0af6 Boris Brezillon    2017-07-19  1836   *    else (for example the bootloader)
3a379bbcea0af6 Boris Brezillon    2017-07-19  1837   *
3a379bbcea0af6 Boris Brezillon    2017-07-19  1838   * 4. Disable all slave events.
3a379bbcea0af6 Boris Brezillon    2017-07-19  1839   *
cc3a392d69b62e Parshuram Thombare 2020-08-25  1840   * 5. Reserve address slots for I3C devices with init_dyn_addr. And if devices
cc3a392d69b62e Parshuram Thombare 2020-08-25  1841   *    also have static_addr, try to pre-assign dynamic addresses requested by
cc3a392d69b62e Parshuram Thombare 2020-08-25  1842   *    the FW with SETDASA and attach corresponding statically defined I3C
cc3a392d69b62e Parshuram Thombare 2020-08-25  1843   *    devices to the master.
3a379bbcea0af6 Boris Brezillon    2017-07-19  1844   *
3a379bbcea0af6 Boris Brezillon    2017-07-19  1845   * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
3a379bbcea0af6 Boris Brezillon    2017-07-19  1846   *    remaining I3C devices
3a379bbcea0af6 Boris Brezillon    2017-07-19  1847   *
3a379bbcea0af6 Boris Brezillon    2017-07-19  1848   * Once this is done, all I3C and I2C devices should be usable.
3a379bbcea0af6 Boris Brezillon    2017-07-19  1849   *
3a379bbcea0af6 Boris Brezillon    2017-07-19  1850   * Return: a 0 in case of success, an negative error code otherwise.
3a379bbcea0af6 Boris Brezillon    2017-07-19  1851   */
3a379bbcea0af6 Boris Brezillon    2017-07-19  1852  static int i3c_master_bus_init(struct i3c_master_controller *master)
3a379bbcea0af6 Boris Brezillon    2017-07-19  1853  {
3a379bbcea0af6 Boris Brezillon    2017-07-19  1854  	enum i3c_addr_slot_status status;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1855  	struct i2c_dev_boardinfo *i2cboardinfo;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1856  	struct i3c_dev_boardinfo *i3cboardinfo;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1857  	struct i2c_dev_desc *i2cdev;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1858  	int ret;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1859  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1860  	/*
3a379bbcea0af6 Boris Brezillon    2017-07-19  1861  	 * First attach all devices with static definitions provided by the
3a379bbcea0af6 Boris Brezillon    2017-07-19  1862  	 * FW.
3a379bbcea0af6 Boris Brezillon    2017-07-19  1863  	 */
3a379bbcea0af6 Boris Brezillon    2017-07-19  1864  	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
3a379bbcea0af6 Boris Brezillon    2017-07-19  1865  		status = i3c_bus_get_addr_slot_status(&master->bus,
3a379bbcea0af6 Boris Brezillon    2017-07-19  1866  						      i2cboardinfo->base.addr);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1867  		if (status != I3C_ADDR_SLOT_FREE) {
3a379bbcea0af6 Boris Brezillon    2017-07-19  1868  			ret = -EBUSY;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1869  			goto err_detach_devs;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1870  		}
3a379bbcea0af6 Boris Brezillon    2017-07-19  1871  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1872  		i3c_bus_set_addr_slot_status(&master->bus,
3a379bbcea0af6 Boris Brezillon    2017-07-19  1873  					     i2cboardinfo->base.addr,
3a379bbcea0af6 Boris Brezillon    2017-07-19  1874  					     I3C_ADDR_SLOT_I2C_DEV);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1875  
31b9887c7258ca Jamie Iles         2022-01-17  1876  		i2cdev = i3c_master_alloc_i2c_dev(master,
31b9887c7258ca Jamie Iles         2022-01-17  1877  						  i2cboardinfo->base.addr,
31b9887c7258ca Jamie Iles         2022-01-17  1878  						  i2cboardinfo->lvr);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1879  		if (IS_ERR(i2cdev)) {
3a379bbcea0af6 Boris Brezillon    2017-07-19  1880  			ret = PTR_ERR(i2cdev);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1881  			goto err_detach_devs;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1882  		}
3a379bbcea0af6 Boris Brezillon    2017-07-19  1883  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1884  		ret = i3c_master_attach_i2c_dev(master, i2cdev);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1885  		if (ret) {
3a379bbcea0af6 Boris Brezillon    2017-07-19  1886  			i3c_master_free_i2c_dev(i2cdev);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1887  			goto err_detach_devs;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1888  		}
3a379bbcea0af6 Boris Brezillon    2017-07-19  1889  	}
3a379bbcea0af6 Boris Brezillon    2017-07-19  1890  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1891  	/*
3a379bbcea0af6 Boris Brezillon    2017-07-19  1892  	 * Now execute the controller specific ->bus_init() routine, which
3a379bbcea0af6 Boris Brezillon    2017-07-19  1893  	 * might configure its internal logic to match the bus limitations.
3a379bbcea0af6 Boris Brezillon    2017-07-19  1894  	 */
3a379bbcea0af6 Boris Brezillon    2017-07-19  1895  	ret = master->ops->bus_init(master);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1896  	if (ret)
3a379bbcea0af6 Boris Brezillon    2017-07-19  1897  		goto err_detach_devs;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1898  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1899  	/*
3a379bbcea0af6 Boris Brezillon    2017-07-19  1900  	 * The master device should have been instantiated in ->bus_init(),
3a379bbcea0af6 Boris Brezillon    2017-07-19  1901  	 * complain if this was not the case.
3a379bbcea0af6 Boris Brezillon    2017-07-19  1902  	 */
3a379bbcea0af6 Boris Brezillon    2017-07-19  1903  	if (!master->this) {
3a379bbcea0af6 Boris Brezillon    2017-07-19  1904  		dev_err(&master->dev,
3a379bbcea0af6 Boris Brezillon    2017-07-19  1905  			"master_set_info() was not called in ->bus_init()\n");
3a379bbcea0af6 Boris Brezillon    2017-07-19  1906  		ret = -EINVAL;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1907  		goto err_bus_cleanup;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1908  	}
3a379bbcea0af6 Boris Brezillon    2017-07-19  1909  
dc8401342637cc Shyam Sundar S K   2024-10-17 @1910  	i3c_master_add_spd_dev(master, i3cboardinfo);
dc8401342637cc Shyam Sundar S K   2024-10-17  1911  
aef79e189ba2b3 Carlos Song        2024-09-10  1912  	if (master->ops->set_speed) {
aef79e189ba2b3 Carlos Song        2024-09-10  1913  		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_SLOW_SPEED);
aef79e189ba2b3 Carlos Song        2024-09-10  1914  		if (ret)
aef79e189ba2b3 Carlos Song        2024-09-10  1915  			goto err_bus_cleanup;
aef79e189ba2b3 Carlos Song        2024-09-10  1916  	}
aef79e189ba2b3 Carlos Song        2024-09-10  1917  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1918  	/*
3a379bbcea0af6 Boris Brezillon    2017-07-19  1919  	 * Reset all dynamic address that may have been assigned before
3a379bbcea0af6 Boris Brezillon    2017-07-19  1920  	 * (assigned by the bootloader for example).
3a379bbcea0af6 Boris Brezillon    2017-07-19  1921  	 */
3a379bbcea0af6 Boris Brezillon    2017-07-19  1922  	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1923  	if (ret && ret != I3C_ERROR_M2)
3a379bbcea0af6 Boris Brezillon    2017-07-19  1924  		goto err_bus_cleanup;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1925  
aef79e189ba2b3 Carlos Song        2024-09-10  1926  	if (master->ops->set_speed) {
aef79e189ba2b3 Carlos Song        2024-09-10  1927  		master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
aef79e189ba2b3 Carlos Song        2024-09-10  1928  		if (ret)
aef79e189ba2b3 Carlos Song        2024-09-10  1929  			goto err_bus_cleanup;
aef79e189ba2b3 Carlos Song        2024-09-10  1930  	}
aef79e189ba2b3 Carlos Song        2024-09-10  1931  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1932  	/* Disable all slave events before starting DAA. */
3a379bbcea0af6 Boris Brezillon    2017-07-19  1933  	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
3a379bbcea0af6 Boris Brezillon    2017-07-19  1934  				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
3a379bbcea0af6 Boris Brezillon    2017-07-19  1935  				      I3C_CCC_EVENT_HJ);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1936  	if (ret && ret != I3C_ERROR_M2)
3a379bbcea0af6 Boris Brezillon    2017-07-19  1937  		goto err_bus_cleanup;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1938  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1939  	/*
cc3a392d69b62e Parshuram Thombare 2020-08-25  1940  	 * Reserve init_dyn_addr first, and then try to pre-assign dynamic
cc3a392d69b62e Parshuram Thombare 2020-08-25  1941  	 * address and retrieve device information if needed.
cc3a392d69b62e Parshuram Thombare 2020-08-25  1942  	 * In case pre-assign dynamic address fails, setting dynamic address to
cc3a392d69b62e Parshuram Thombare 2020-08-25  1943  	 * the requested init_dyn_addr is retried after DAA is done in
cc3a392d69b62e Parshuram Thombare 2020-08-25  1944  	 * i3c_master_add_i3c_dev_locked().
cc3a392d69b62e Parshuram Thombare 2020-08-25  1945  	 */
cc3a392d69b62e Parshuram Thombare 2020-08-25  1946  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
cc3a392d69b62e Parshuram Thombare 2020-08-25  1947  
cc3a392d69b62e Parshuram Thombare 2020-08-25  1948  		/*
cc3a392d69b62e Parshuram Thombare 2020-08-25  1949  		 * We don't reserve a dynamic address for devices that
cc3a392d69b62e Parshuram Thombare 2020-08-25  1950  		 * don't explicitly request one.
cc3a392d69b62e Parshuram Thombare 2020-08-25  1951  		 */
cc3a392d69b62e Parshuram Thombare 2020-08-25  1952  		if (!i3cboardinfo->init_dyn_addr)
cc3a392d69b62e Parshuram Thombare 2020-08-25  1953  			continue;
cc3a392d69b62e Parshuram Thombare 2020-08-25  1954  
cc3a392d69b62e Parshuram Thombare 2020-08-25  1955  		ret = i3c_bus_get_addr_slot_status(&master->bus,
cc3a392d69b62e Parshuram Thombare 2020-08-25  1956  						   i3cboardinfo->init_dyn_addr);
cc3a392d69b62e Parshuram Thombare 2020-08-25  1957  		if (ret != I3C_ADDR_SLOT_FREE) {
cc3a392d69b62e Parshuram Thombare 2020-08-25  1958  			ret = -EBUSY;
cc3a392d69b62e Parshuram Thombare 2020-08-25  1959  			goto err_rstdaa;
cc3a392d69b62e Parshuram Thombare 2020-08-25  1960  		}
cc3a392d69b62e Parshuram Thombare 2020-08-25  1961  
cc3a392d69b62e Parshuram Thombare 2020-08-25  1962  		i3c_bus_set_addr_slot_status(&master->bus,
cc3a392d69b62e Parshuram Thombare 2020-08-25  1963  					     i3cboardinfo->init_dyn_addr,
cc3a392d69b62e Parshuram Thombare 2020-08-25  1964  					     I3C_ADDR_SLOT_I3C_DEV);
cc3a392d69b62e Parshuram Thombare 2020-08-25  1965  
cc3a392d69b62e Parshuram Thombare 2020-08-25  1966  		/*
cc3a392d69b62e Parshuram Thombare 2020-08-25  1967  		 * Only try to create/attach devices that have a static
cc3a392d69b62e Parshuram Thombare 2020-08-25  1968  		 * address. Other devices will be created/attached when
cc3a392d69b62e Parshuram Thombare 2020-08-25  1969  		 * DAA happens, and the requested dynamic address will
cc3a392d69b62e Parshuram Thombare 2020-08-25  1970  		 * be set using SETNEWDA once those devices become
cc3a392d69b62e Parshuram Thombare 2020-08-25  1971  		 * addressable.
3a379bbcea0af6 Boris Brezillon    2017-07-19  1972  		 */
cc3a392d69b62e Parshuram Thombare 2020-08-25  1973  
cc3a392d69b62e Parshuram Thombare 2020-08-25  1974  		if (i3cboardinfo->static_addr)
cc3a392d69b62e Parshuram Thombare 2020-08-25  1975  			i3c_master_early_i3c_dev_add(master, i3cboardinfo);
cc3a392d69b62e Parshuram Thombare 2020-08-25  1976  	}
3a379bbcea0af6 Boris Brezillon    2017-07-19  1977  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1978  	ret = i3c_master_do_daa(master);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1979  	if (ret)
3a379bbcea0af6 Boris Brezillon    2017-07-19  1980  		goto err_rstdaa;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1981  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1982  	return 0;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1983  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1984  err_rstdaa:
3a379bbcea0af6 Boris Brezillon    2017-07-19  1985  	i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1986  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1987  err_bus_cleanup:
3a379bbcea0af6 Boris Brezillon    2017-07-19  1988  	if (master->ops->bus_cleanup)
3a379bbcea0af6 Boris Brezillon    2017-07-19  1989  		master->ops->bus_cleanup(master);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1990  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1991  err_detach_devs:
3a379bbcea0af6 Boris Brezillon    2017-07-19  1992  	i3c_master_detach_free_devs(master);
3a379bbcea0af6 Boris Brezillon    2017-07-19  1993  
3a379bbcea0af6 Boris Brezillon    2017-07-19  1994  	return ret;
3a379bbcea0af6 Boris Brezillon    2017-07-19  1995  }
3a379bbcea0af6 Boris Brezillon    2017-07-19  1996  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
