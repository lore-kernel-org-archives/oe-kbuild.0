Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03444287511
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765022332; cv=none; b=YEGjk0tY92ZAOyH7tIksNwTkJETycl1iCQgA2p5VEQ/umIv1yibL0jJFL5fr7mzA4ZtRfz4VWik8eN9gsn2QkM6bVrrXXLVGxHLKk19vqUEyQbedsi3p5a/IMehWHjJjcJs5thyfS30DVrto32TjZm/N0pXdfyX+eUB4ZDK52oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765022332; c=relaxed/simple;
	bh=FGv4ZqUdu9ImUgeV+BixSxs1XBNC5eeFLHPE6U7JksQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAlISaWxvLvrvYzI9Ydq+IGZYXkzOYPYJn6dmxRaCsr4yTNYalU9ZJ9PclLjJRCgC9CKhyjiC31M7y6ri9FENLopjEWjmZwnjm4qZNIe3ZYfmEt03KRgzjwf01qwcwhPvOIWCjs+x1uzuQ7ZVZhz46s9OkX38KZAQ4RTtA7j4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMakKyQv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMakKyQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765022330; x=1796558330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FGv4ZqUdu9ImUgeV+BixSxs1XBNC5eeFLHPE6U7JksQ=;
  b=FMakKyQvbaZEdwIxaw+4XPqDHCdaB+G74EQIsap6ft/nMhLAuzzg63uu
   1oYaC0r6mW8DNFBhGrVXVMz6BnaVKSuxQBADD8iWdBFsRA5wYipssal/F
   x8ILLzxg0innM7FJ4GxtVnHw7TYCSxNqyK0jfAiMuCyukllyD8g05h3M9
   WlKYvWzcp2fcfg/KFIMYZRQ7EcZfydTcpGXoMNbMmvNJBspEq5Jc6lWl9
   IWgKdavQH7ldV4nwng+HpFjd3kBddDj8s4ecpeBrbdxDvjU9PanEPTeaF
   TC7b96jDTuOOpX04c1sh0BCZ+G+KUHEjOIKlNAvzXdCQuPivfWIgPIBdH
   A==;
X-CSE-ConnectionGUID: qx7YR40kSYeLuPsYEoZFwg==
X-CSE-MsgGUID: 73JXr/mTRwKt6UasqkFC+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78151598"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78151598"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 03:58:47 -0800
X-CSE-ConnectionGUID: E7SFbiB3Q0OWqY/N3t45Lg==
X-CSE-MsgGUID: DquqfX7iS8C5FfmONJd++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="226172297"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2025 03:58:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRqvz-00000000I4v-3pcw;
	Sat, 06 Dec 2025 11:58:43 +0000
Date: Sat, 6 Dec 2025 19:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.6 31/31]
 drivers/usb/typec/ucsi/ucsi.c:1911:1-7: preceding lock on line 1859
Message-ID: <202512061916.gul2U0Du-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   63f038ecca8b188b03661bbead263c5e8a3006ec
commit: c559a0696f676dff6353b1c968b8634db8ccdb28 [31/31] BACKPORT: FROMLIST: usb: typec: ucsi: Get connector status after enable notifications
:::::: branch date: 8 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-052-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061916.gul2U0Du-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512061916.gul2U0Du-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/ucsi.c:1911:1-7: preceding lock on line 1859

vim +1911 drivers/usb/typec/ucsi/ucsi.c

47d28f0817849f Diogo Ivo                 2024-03-27  1802  
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1803  /**
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1804   * ucsi_init - Initialize UCSI interface
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1805   * @ucsi: UCSI to be initialized
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1806   *
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1807   * Registers all ports @ucsi has and enables all notification events.
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1808   */
e6b073dea39bd8 Lee Jones                 2020-07-06  1809  static int ucsi_init(struct ucsi *ucsi)
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1810  {
0482c34ec6f855 Hans de Goede             2023-03-08  1811  	struct ucsi_connector *con, *connector;
f87fb985452ab2 Hans de Goede             2023-03-08  1812  	u64 command, ntfy;
4184b7d85422f0 Christian A. Ehrhardt     2024-03-20  1813  	u32 cci;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1814  	int ret;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1815  	int i;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1816  
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1817  	/* Reset the PPM */
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1818  	ret = ucsi_reset_ppm(ucsi);
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1819  	if (ret) {
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1820  		dev_err(ucsi->dev, "failed to reset PPM!\n");
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1821  		goto err;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1822  	}
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1823  
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1824  	/* Enable basic notifications */
f87fb985452ab2 Hans de Goede             2023-03-08  1825  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
f87fb985452ab2 Hans de Goede             2023-03-08  1826  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
25794e3079d2a9 Hans de Goede             2020-08-09  1827  	ret = ucsi_send_command(ucsi, command, NULL, 0);
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1828  	if (ret < 0)
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1829  		goto err_reset;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1830  
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1831  	/* Get PPM capabilities */
470ce43a1a8101 Heikki Krogerus           2019-11-04  1832  	command = UCSI_GET_CAPABILITY;
25794e3079d2a9 Hans de Goede             2020-08-09  1833  	ret = ucsi_send_command(ucsi, command, &ucsi->cap, sizeof(ucsi->cap));
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1834  	if (ret < 0)
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1835  		goto err_reset;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1836  
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1837  	if (!ucsi->cap.num_connectors) {
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1838  		ret = -ENODEV;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1839  		goto err_reset;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1840  	}
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1841  
12f73979847028 Subbaraman Narayanamurthy 2021-06-09  1842  	/* Allocate the connectors. Released in ucsi_unregister() */
0482c34ec6f855 Hans de Goede             2023-03-08  1843  	connector = kcalloc(ucsi->cap.num_connectors + 1, sizeof(*connector), GFP_KERNEL);
0482c34ec6f855 Hans de Goede             2023-03-08  1844  	if (!connector) {
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1845  		ret = -ENOMEM;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1846  		goto err_reset;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1847  	}
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1848  
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1849  	/* Register all connectors */
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1850  	for (i = 0; i < ucsi->cap.num_connectors; i++) {
0482c34ec6f855 Hans de Goede             2023-03-08  1851  		connector[i].num = i + 1;
0482c34ec6f855 Hans de Goede             2023-03-08  1852  		ret = ucsi_register_port(ucsi, &connector[i]);
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1853  		if (ret)
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1854  			goto err_unregister;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1855  	}
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1856  
c559a0696f676d Hsin-Te Yuan              2025-11-25  1857  	/* Delay other interactions with each connector until ucsi_init_port is done */
c559a0696f676d Hsin-Te Yuan              2025-11-25  1858  	for (i = 0; i < ucsi->cap.num_connectors; i++)
c559a0696f676d Hsin-Te Yuan              2025-11-25 @1859  		mutex_lock(&connector[i].lock);
c559a0696f676d Hsin-Te Yuan              2025-11-25  1860  
47d28f0817849f Diogo Ivo                 2024-03-27  1861  	/* Enable all supported notifications */
47d28f0817849f Diogo Ivo                 2024-03-27  1862  	ntfy = ucsi_get_supported_notifications(ucsi);
f87fb985452ab2 Hans de Goede             2023-03-08  1863  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
0ff0705a2ef292 Hans de Goede             2020-08-09  1864  	ret = ucsi_send_command(ucsi, command, NULL, 0);
c559a0696f676d Hsin-Te Yuan              2025-11-25  1865  	if (ret < 0) {
c559a0696f676d Hsin-Te Yuan              2025-11-25  1866  		for (i = 0; i < ucsi->cap.num_connectors; i++)
c559a0696f676d Hsin-Te Yuan              2025-11-25  1867  			mutex_unlock(&connector[i].lock);
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1868  		goto err_unregister;
c559a0696f676d Hsin-Te Yuan              2025-11-25  1869  	}
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1870  
0482c34ec6f855 Hans de Goede             2023-03-08  1871  	ucsi->connector = connector;
f87fb985452ab2 Hans de Goede             2023-03-08  1872  	ucsi->ntfy = ntfy;
4184b7d85422f0 Christian A. Ehrhardt     2024-03-20  1873  
c559a0696f676d Hsin-Te Yuan              2025-11-25  1874  	for (i = 0; i < ucsi->cap.num_connectors; i++) {
c559a0696f676d Hsin-Te Yuan              2025-11-25  1875  		ucsi_init_port(ucsi, &connector[i]);
c559a0696f676d Hsin-Te Yuan              2025-11-25  1876  		mutex_unlock(&connector[i].lock);
c559a0696f676d Hsin-Te Yuan              2025-11-25  1877  	}
c559a0696f676d Hsin-Te Yuan              2025-11-25  1878  
d5f0c5ea3fc385 Christian A. Ehrhardt     2024-04-01  1879  	mutex_lock(&ucsi->ppm_lock);
4184b7d85422f0 Christian A. Ehrhardt     2024-03-20  1880  	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
d5f0c5ea3fc385 Christian A. Ehrhardt     2024-04-01  1881  	mutex_unlock(&ucsi->ppm_lock);
4184b7d85422f0 Christian A. Ehrhardt     2024-03-20  1882  	if (ret)
4184b7d85422f0 Christian A. Ehrhardt     2024-03-20  1883  		return ret;
d5f0c5ea3fc385 Christian A. Ehrhardt     2024-04-01  1884  	if (UCSI_CCI_CONNECTOR(cci))
d5f0c5ea3fc385 Christian A. Ehrhardt     2024-04-01  1885  		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
4184b7d85422f0 Christian A. Ehrhardt     2024-03-20  1886  
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1887  	return 0;
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1888  
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1889  err_unregister:
0482c34ec6f855 Hans de Goede             2023-03-08  1890  	for (con = connector; con->port; con++) {
46fba7be161bb8 Andrei Kuchynski          2025-03-05  1891  		if (con->wq)
46fba7be161bb8 Andrei Kuchynski          2025-03-05  1892  			destroy_workqueue(con->wq);
5f73aa2cf8bef4 Takashi Iwai              2022-08-23  1893  		ucsi_unregister_partner(con);
5f73aa2cf8bef4 Takashi Iwai              2022-08-23  1894  		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
5f73aa2cf8bef4 Takashi Iwai              2022-08-23  1895  		ucsi_unregister_port_psy(con);
b04e1747fbcc6b Saranya Gopal             2023-01-02  1896  
b04e1747fbcc6b Saranya Gopal             2023-01-02  1897  		usb_power_delivery_unregister_capabilities(con->port_sink_caps);
b04e1747fbcc6b Saranya Gopal             2023-01-02  1898  		con->port_sink_caps = NULL;
b04e1747fbcc6b Saranya Gopal             2023-01-02  1899  		usb_power_delivery_unregister_capabilities(con->port_source_caps);
b04e1747fbcc6b Saranya Gopal             2023-01-02  1900  		con->port_source_caps = NULL;
b04e1747fbcc6b Saranya Gopal             2023-01-02  1901  		usb_power_delivery_unregister(con->pd);
b04e1747fbcc6b Saranya Gopal             2023-01-02  1902  		con->pd = NULL;
5f73aa2cf8bef4 Takashi Iwai              2022-08-23  1903  		typec_unregister_port(con->port);
5f73aa2cf8bef4 Takashi Iwai              2022-08-23  1904  		con->port = NULL;
5f73aa2cf8bef4 Takashi Iwai              2022-08-23  1905  	}
0482c34ec6f855 Hans de Goede             2023-03-08  1906  	kfree(connector);
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1907  err_reset:
f247f0a82a4f8c Mayank Rana               2021-06-09  1908  	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1909  	ucsi_reset_ppm(ucsi);
c1b0bc2dabfa88 Heikki Krogerus           2017-06-16  1910  err:
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04 @1911  	return ret;
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1912  }
bdc62f2bae8fb0 Heikki Krogerus           2019-11-04  1913  

:::::: The code at line 1911 was first introduced by commit
:::::: bdc62f2bae8fb0e8e99574de5232f0a3c54a27df usb: typec: ucsi: Simplified registration and I/O API

:::::: TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
