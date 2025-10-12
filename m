Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F0C34BA34
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Oct 2025 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760269387; cv=none; b=F5Hu68Ji+C3nY+ka0QOWvsSBnXgKGHFXF/bK8DZWCQ00YkWg2QkM33RKUonU0g9UeREaxAg7+d/9hGqpivQG5V8Bbm4F7u0FqMOMj0hrgxWojBXGDiSc231IwNmKG/yGIwefr5p8uCoiaufLU9gKeca2WRyv5IL6m5q2ItHgehc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760269387; c=relaxed/simple;
	bh=30SNhH4ZV27m7oXWOmaKk711TUQjQ+qfWvNCsxtAZeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h5znHsCQLm4YRK2CyHXV2JLhaTiw00FxFWRIQ0Hylc1NJvYX7kWwDJvYfTErBzpGdcggNvHQqjjKCor6KajYZex9ivulP1czDAqITbaQAkmuHHOWq1aSC3XQX5mGz5UvMfmGFnr0D3auzii11kOWxFcDyZUxY1JYOxQQDuOBiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5srDLqV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5srDLqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760269385; x=1791805385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=30SNhH4ZV27m7oXWOmaKk711TUQjQ+qfWvNCsxtAZeA=;
  b=P5srDLqVhs3os12LzfjD/4eavYkQy8a4XG8AYVIuPr+lIhXmG+Cslyv2
   0Pa5opN0wVQukwVpkoKX1MeFbyfO+mxDf8M9M8W6IG5TvHiF4qxJ5GJBO
   4MS1dpCbPShzXFGX0BL1v1tzStZHe7aPM8q9PvHagYXH8a5DEephgid+c
   StnzMoWxOfIYHU3ZIgGXlLeTuQfp/Q46yVpjKQhO7OMqbXFt1hBC5HUTB
   yKfLKhm+cChr2LQAuuh9ZRjtS2dRKi7qToHZSwTVbQAYAN+R109SUN1mh
   M8DRU+NyuQtP8cxm8YfF8jo4q4NjJPU+o/BB/nsCCsg027WBBG8dogN3a
   w==;
X-CSE-ConnectionGUID: NBV0EhupS8ui1nDXfyemdg==
X-CSE-MsgGUID: GFVx2PSgQOy1n9gTFK1KOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62458153"
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="62458153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 04:43:02 -0700
X-CSE-ConnectionGUID: KQL08yXqSJqv7pBOO4jd9w==
X-CSE-MsgGUID: Sa6plsS6TWOVh5b71O5q9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="186645176"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2025 04:43:00 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7uTa-0004MF-1P;
	Sun, 12 Oct 2025 11:42:58 +0000
Date: Sun, 12 Oct 2025 19:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to
 simplify lock handling
Message-ID: <202510121908.7aduLIkw-lkp@intel.com>
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
In-Reply-To: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
References: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
TO: Peng Fan <peng.fan@nxp.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Andrew Davis <afd@ti.com>
TO: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
TO: Daniel Baluta <daniel.baluta@nxp.com>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: linux-remoteproc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: Peng Fan <peng.fan@nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3b9b1f8df454caa453c7fb07689064edb2eda90a]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/remoteproc-core-Drop-redundant-initialization-of-ret-in-rproc_shutdown/20251010-202737
base:   3b9b1f8df454caa453c7fb07689064edb2eda90a
patch link:    https://lore.kernel.org/r/20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c%40nxp.com
patch subject: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to simplify lock handling
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121908.7aduLIkw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510121908.7aduLIkw-lkp@intel.com/

smatch warnings:
drivers/remoteproc/remoteproc_core.c:1841 rproc_trigger_recovery() warn: missing error code? 'ret'
drivers/remoteproc/remoteproc_core.c:1993 rproc_shutdown() warn: missing error code? 'ret'

vim +/ret +1841 drivers/remoteproc/remoteproc_core.c

ba194232edc032b Peng Fan             2022-09-28  1816  
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1817  /**
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1818   * rproc_trigger_recovery() - recover a remoteproc
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1819   * @rproc: the remote processor
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1820   *
56324d7a2294861 Anna, Suman          2016-08-12  1821   * The recovery is done by resetting all the virtio devices, that way all the
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1822   * rpmsg drivers will be reseted along with the remote processor making the
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1823   * remoteproc functional again.
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1824   *
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1825   * This function can sleep, so it cannot be called from atomic context.
f2867434002387c Suman Anna           2021-05-19  1826   *
f2867434002387c Suman Anna           2021-05-19  1827   * Return: 0 on success or a negative value upon failure
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1828   */
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;
0b145574b6cd2b3 Alex Elder           2020-02-28  1842  
0b145574b6cd2b3 Alex Elder           2020-02-28  1843  	dev_err(dev, "recovering %s\n", rproc->name);
0b145574b6cd2b3 Alex Elder           2020-02-28  1844  
ba194232edc032b Peng Fan             2022-09-28  1845  	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
ba194232edc032b Peng Fan             2022-09-28  1846  		ret = rproc_attach_recovery(rproc);
ba194232edc032b Peng Fan             2022-09-28  1847  	else
ba194232edc032b Peng Fan             2022-09-28  1848  		ret = rproc_boot_recovery(rproc);
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1849  
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1850  	return ret;
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1851  }
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1852  
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1853  /**
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1854   * rproc_crash_handler_work() - handle a crash
2e7d4c2c4b25e50 Arnaud Pouliquen     2020-02-12  1855   * @work: work treating the crash
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1856   *
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1857   * This function needs to handle everything related to a crash, like cpu
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1858   * registers and stack dump, information to help to debug the fatal error, etc.
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1859   */
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1860  static void rproc_crash_handler_work(struct work_struct *work)
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1861  {
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1862  	struct rproc *rproc = container_of(work, struct rproc, crash_handler);
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1863  	struct device *dev = &rproc->dev;
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1864  
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1865  	dev_dbg(dev, "enter %s\n", __func__);
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1866  
c42baf6f84c7694 Peng Fan             2025-10-10  1867  	scoped_guard(mutex, &rproc->lock) {
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1868  		/* handle only the first crash detected */
c42baf6f84c7694 Peng Fan             2025-10-10  1869  		if (rproc->state == RPROC_CRASHED)
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1870  			return;
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1871  
11c7f9e3131ad14 Maria Yu             2022-12-06  1872  		/* Don't recover if the remote processor was stopped */
c42baf6f84c7694 Peng Fan             2025-10-10  1873  		if (rproc->state == RPROC_OFFLINE)
11c7f9e3131ad14 Maria Yu             2022-12-06  1874  			goto out;
11c7f9e3131ad14 Maria Yu             2022-12-06  1875  
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1876  		rproc->state = RPROC_CRASHED;
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1877  		dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1878  			rproc->name);
c42baf6f84c7694 Peng Fan             2025-10-10  1879  	}
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1880  
2e37abb89a2ef13 Fernando Guzman Lugo 2012-09-18  1881  	if (!rproc->recovery_disabled)
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1882  		rproc_trigger_recovery(rproc);
a781e5aa59110d0 Rishabh Bhatnagar    2020-04-29  1883  
11c7f9e3131ad14 Maria Yu             2022-12-06  1884  out:
a781e5aa59110d0 Rishabh Bhatnagar    2020-04-29  1885  	pm_relax(rproc->dev.parent);
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1886  }
8afd519c3470f68 Fernando Guzman Lugo 2012-08-30  1887  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1888  /**
1b0ef9068f053d8 Suman Anna           2017-07-20  1889   * rproc_boot() - boot a remote processor
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1890   * @rproc: handle of a remote processor
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1891   *
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1892   * Boot a remote processor (i.e. load its firmware, power it on, ...).
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1893   *
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1894   * If the remote processor is already powered on, this function immediately
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1895   * returns (successfully).
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1896   *
f2867434002387c Suman Anna           2021-05-19  1897   * Return: 0 on success, and an appropriate error value otherwise
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1898   */
1b0ef9068f053d8 Suman Anna           2017-07-20  1899  int rproc_boot(struct rproc *rproc)
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1900  {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1901  	const struct firmware *firmware_p;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1902  	struct device *dev;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1903  	int ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1904  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1905  	if (!rproc) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1906  		pr_err("invalid rproc handle\n");
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1907  		return -EINVAL;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1908  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1909  
b5ab5e24e960b9f Ohad Ben-Cohen       2012-05-30  1910  	dev = &rproc->dev;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1911  
c42baf6f84c7694 Peng Fan             2025-10-10  1912  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1913  	ret = ACQUIRE_ERR(mutex_intr, &lock);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1914  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1915  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1916  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1917  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1918  
2099c77d4af7d15 Sarangdhar Joshi     2017-01-23  1919  	if (rproc->state == RPROC_DELETED) {
2099c77d4af7d15 Sarangdhar Joshi     2017-01-23  1920  		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
c42baf6f84c7694 Peng Fan             2025-10-10  1921  		return -ENODEV;
2099c77d4af7d15 Sarangdhar Joshi     2017-01-23  1922  	}
2099c77d4af7d15 Sarangdhar Joshi     2017-01-23  1923  
0f9dc562b721aa1 Mathieu Poirier      2020-07-14  1924  	/* skip the boot or attach process if rproc is already powered up */
c42baf6f84c7694 Peng Fan             2025-10-10  1925  	if (atomic_inc_return(&rproc->power) > 1)
c42baf6f84c7694 Peng Fan             2025-10-10  1926  		return 0;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1927  
0f9dc562b721aa1 Mathieu Poirier      2020-07-14  1928  	if (rproc->state == RPROC_DETACHED) {
0f9dc562b721aa1 Mathieu Poirier      2020-07-14  1929  		dev_info(dev, "attaching to %s\n", rproc->name);
0f9dc562b721aa1 Mathieu Poirier      2020-07-14  1930  
6a6c4dc0e5de5dc Mathieu Poirier      2021-03-12  1931  		ret = rproc_attach(rproc);
0f9dc562b721aa1 Mathieu Poirier      2020-07-14  1932  	} else {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1933  		dev_info(dev, "powering up %s\n", rproc->name);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1934  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1935  		/* load firmware */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1936  		ret = request_firmware(&firmware_p, rproc->firmware, dev);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1937  		if (ret < 0) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1938  			dev_err(dev, "request_firmware failed: %d\n", ret);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1939  			goto downref_rproc;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1940  		}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1941  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1942  		ret = rproc_fw_boot(rproc, firmware_p);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1943  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1944  		release_firmware(firmware_p);
0f9dc562b721aa1 Mathieu Poirier      2020-07-14  1945  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1946  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1947  downref_rproc:
fbb6aacb078285f Bjorn Andersson      2016-10-02  1948  	if (ret)
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1949  		atomic_dec(&rproc->power);
c42baf6f84c7694 Peng Fan             2025-10-10  1950  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1951  	return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1952  }
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1953  EXPORT_SYMBOL(rproc_boot);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1954  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1955  /**
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1956   * rproc_shutdown() - power off the remote processor
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1957   * @rproc: the remote processor
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1958   *
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1959   * Power off a remote processor (previously booted with rproc_boot()).
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1960   *
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1961   * In case @rproc is still being used by an additional user(s), then
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1962   * this function will just decrement the power refcount and exit,
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1963   * without really powering off the device.
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1964   *
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1965   * Every call to rproc_boot() must (eventually) be accompanied by a call
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1966   * to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug.
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1967   *
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1968   * Notes:
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1969   * - we're not decrementing the rproc's refcount, only the power refcount.
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1970   *   which means that the @rproc handle stays valid even after rproc_shutdown()
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1971   *   returns, and users can still use it with a subsequent rproc_boot(), if
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1972   *   needed.
c13b780c4597e1e Suman Anna           2022-02-13  1973   *
c13b780c4597e1e Suman Anna           2022-02-13  1974   * Return: 0 on success, and an appropriate error value otherwise
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1975   */
c13b780c4597e1e Suman Anna           2022-02-13  1976  int rproc_shutdown(struct rproc *rproc)
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1977  {
b5ab5e24e960b9f Ohad Ben-Cohen       2012-05-30  1978  	struct device *dev = &rproc->dev;
ee3d85da617a065 Peng Fan             2025-10-10  1979  	int ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1980  
c42baf6f84c7694 Peng Fan             2025-10-10  1981  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1982  	ret = ACQUIRE_ERR(mutex_intr, &lock);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1983  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1984  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
c13b780c4597e1e Suman Anna           2022-02-13  1985  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1986  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1987  
c42baf6f84c7694 Peng Fan             2025-10-10  1988  	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
c42baf6f84c7694 Peng Fan             2025-10-10  1989  		return -EINVAL;
5e6a0e05270e3a4 Shengjiu Wang        2022-03-28  1990  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1991  	/* if the remote proc is still needed, bail out */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1992  	if (!atomic_dec_and_test(&rproc->power))
c42baf6f84c7694 Peng Fan             2025-10-10 @1993  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1994  
fcd58037f28bf70 Arnaud Pouliquen     2018-04-10  1995  	ret = rproc_stop(rproc, false);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1996  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1997  		atomic_inc(&rproc->power);
c42baf6f84c7694 Peng Fan             2025-10-10  1998  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1999  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2000  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2001  	/* clean up all acquired resources */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2002  	rproc_resource_cleanup(rproc);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2003  
33467ac3c8dc805 Loic Pallardy        2020-04-16  2004  	/* release HW resources if needed */
33467ac3c8dc805 Loic Pallardy        2020-04-16  2005  	rproc_unprepare_device(rproc);
33467ac3c8dc805 Loic Pallardy        2020-04-16  2006  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2007  	rproc_disable_iommu(rproc);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2008  
988d204cdaf604c Bjorn Andersson      2016-08-11  2009  	/* Free the copy of the resource table */
a0c10687ec9506b Bjorn Andersson      2016-12-30  2010  	kfree(rproc->cached_table);
a0c10687ec9506b Bjorn Andersson      2016-12-30  2011  	rproc->cached_table = NULL;
988d204cdaf604c Bjorn Andersson      2016-08-11  2012  	rproc->table_ptr = NULL;
c42baf6f84c7694 Peng Fan             2025-10-10  2013  
c13b780c4597e1e Suman Anna           2022-02-13  2014  	return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2015  }
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2016  EXPORT_SYMBOL(rproc_shutdown);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2017  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
