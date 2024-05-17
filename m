Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8EA12F398
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715964800; cv=none; b=D7Kb2trg4QozV5XrPqL+sMPWcmV8gJ5aZTV07LilTPTWUa9/8i8a+R2eEtt/Y21ebBrJnfDX8x0MgTcqAW4Ye1H28kRi3FTnckpt8f9lOZR9LuUO7lmBZLzce7O6s5jN2VIaTLHnahJSV+a0WTsX148lsdS2P8pcJBpdRY58ePg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715964800; c=relaxed/simple;
	bh=Z8fVe5mNahPcWV9u0OQ/+LcdMCB6deqqR/Ig5XSxs9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khlLi00RwRTfPFjLI2km3VE8AtKJAW46EgsPQagTdUJWCQKn8G8EiQmAQEt5fZfbe8t18uEOJJtMitKY0L/Z+HLUY4MfujPySfsI1eJqLS7Wtzq08BcZNmlKZwU9arzKN6iPIFXZyBYpAJeaoWiiHXHRY7XaK9G57DBzA35XZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ukgduv7K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ukgduv7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715964799; x=1747500799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8fVe5mNahPcWV9u0OQ/+LcdMCB6deqqR/Ig5XSxs9Q=;
  b=Ukgduv7KqgZ9ApO/hTjmYTT2ONmy26eCisxvTd/sAWGrtpYt4LLD170L
   Mpde7glrP02BJuxXhIUZM2jcYniEFTckQlQ144dGTG21EvbLM++3ZQhN9
   E/kzhzmMUgr1cXkd6ViFOkkcVJJeCJN839fC0PPYyJrlCaekcrwjj9paJ
   +oEybsYwP/1yUZ0sW3q5vp5HkdA7o2ZuMeGiZutZ5pvjeJQsxkU1YWouT
   2yqSo9YM3Rxn0Qvs8u2vR0lxELkV9XjgkItHMO89btOnTAG37wbOvV9K8
   h4GtLLYdxNRWZSYexy4etBjVSMEsRLnnSCfDXVanSP7dWU1sQ0tbW4tor
   w==;
X-CSE-ConnectionGUID: /WAWQhe7TdesQQHTR5xHmQ==
X-CSE-MsgGUID: ccNG8b+URembWkxizb4Ojw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="29662559"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="29662559"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 09:53:18 -0700
X-CSE-ConnectionGUID: DEqTI51NRhSdc8KPGPlpTw==
X-CSE-MsgGUID: XflgwilKQ4Oc3lq9kLKL+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="31839197"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2024 09:53:15 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s80pU-0000wK-2O;
	Fri, 17 May 2024 16:53:12 +0000
Date: Sat, 18 May 2024 00:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 11/15] drivers/opp/core.c:2447
 _opp_attach_genpd() warn: missing unwind goto?
Message-ID: <202405180016.4fbn86bm-lkp@intel.com>
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
CC: linux-acpi@vger.kernel.org
CC: devel@acpica.org
CC: linux-pm@vger.kernel.org
TO: Viresh Kumar <viresh.kumar@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   fe07fa9fa1115e0979b89a90ae8594794ac2f63f
commit: 2a56c462fe5a2ee61d38e2d7b772bee56115a00c [11/15] OPP: Fix required_opp_tables for multiple genpds using same table
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-141-20240517 (https://download.01.org/0day-ci/archive/20240518/202405180016.4fbn86bm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405180016.4fbn86bm-lkp@intel.com/

New smatch warnings:
drivers/opp/core.c:2447 _opp_attach_genpd() warn: missing unwind goto?

Old smatch warnings:
drivers/opp/core.c:2671 dev_pm_opp_set_config() error: uninitialized symbol 'ret'.

vim +2447 drivers/opp/core.c

6319aee10e5303 Viresh Kumar          2019-05-08  2376  
cca14de5698690 Viresh Kumar          2023-09-27  2377  /*
4f018bc0e1cfde Viresh Kumar          2018-06-26  2378   * Multiple generic power domains for a device are supported with the help of
4f018bc0e1cfde Viresh Kumar          2018-06-26  2379   * virtual genpd devices, which are created for each consumer device - genpd
4f018bc0e1cfde Viresh Kumar          2018-06-26  2380   * pair. These are the device structures which are attached to the power domain
4f018bc0e1cfde Viresh Kumar          2018-06-26  2381   * and are required by the OPP core to set the performance state of the genpd.
6319aee10e5303 Viresh Kumar          2019-05-08  2382   * The same API also works for the case where single genpd is available and so
6319aee10e5303 Viresh Kumar          2019-05-08  2383   * we don't need to support that separately.
4f018bc0e1cfde Viresh Kumar          2018-06-26  2384   *
4f018bc0e1cfde Viresh Kumar          2018-06-26  2385   * This helper will normally be called by the consumer driver of the device
6319aee10e5303 Viresh Kumar          2019-05-08  2386   * "dev", as only that has details of the genpd names.
4f018bc0e1cfde Viresh Kumar          2018-06-26  2387   *
6319aee10e5303 Viresh Kumar          2019-05-08  2388   * This helper needs to be called once with a list of all genpd to attach.
6319aee10e5303 Viresh Kumar          2019-05-08  2389   * Otherwise the original device structure will be used instead by the OPP core.
baea35e4db17a7 Viresh Kumar          2019-07-17  2390   *
baea35e4db17a7 Viresh Kumar          2019-07-17  2391   * The order of entries in the names array must match the order in which
baea35e4db17a7 Viresh Kumar          2019-07-17  2392   * "required-opps" are added in DT.
4f018bc0e1cfde Viresh Kumar          2018-06-26  2393   */
442e7a1786e628 Viresh Kumar          2022-05-26  2394  static int _opp_attach_genpd(struct opp_table *opp_table, struct device *dev,
3734b9f2cee01d Dmitry Osipenko       2021-09-27  2395  			const char * const *names, struct device ***virt_devs)
4f018bc0e1cfde Viresh Kumar          2018-06-26  2396  {
2a56c462fe5a2e Viresh Kumar          2024-04-09  2397  	struct device *virt_dev, *gdev;
2a56c462fe5a2e Viresh Kumar          2024-04-09  2398  	struct opp_table *genpd_table;
baea35e4db17a7 Viresh Kumar          2019-07-17  2399  	int index = 0, ret = -EINVAL;
3734b9f2cee01d Dmitry Osipenko       2021-09-27  2400  	const char * const *name = names;
4f018bc0e1cfde Viresh Kumar          2018-06-26  2401  
e37440e7e2c276 Viresh Kumar          2023-10-27  2402  	if (!opp_table->required_devs) {
e37440e7e2c276 Viresh Kumar          2023-10-27  2403  		dev_err(dev, "Required OPPs not available, can't attach genpd\n");
e37440e7e2c276 Viresh Kumar          2023-10-27  2404  		return -EINVAL;
e37440e7e2c276 Viresh Kumar          2023-10-27  2405  	}
4f018bc0e1cfde Viresh Kumar          2018-06-26  2406  
925141432fa4d8 Viresh Kumar          2023-11-16  2407  	/* Genpd core takes care of propagation to parent genpd */
925141432fa4d8 Viresh Kumar          2023-11-16  2408  	if (opp_table->is_genpd) {
925141432fa4d8 Viresh Kumar          2023-11-16  2409  		dev_err(dev, "%s: Operation not supported for genpds\n", __func__);
925141432fa4d8 Viresh Kumar          2023-11-16  2410  		return -EOPNOTSUPP;
925141432fa4d8 Viresh Kumar          2023-11-16  2411  	}
925141432fa4d8 Viresh Kumar          2023-11-16  2412  
e37440e7e2c276 Viresh Kumar          2023-10-27  2413  	/* Checking only the first one is enough ? */
e37440e7e2c276 Viresh Kumar          2023-10-27  2414  	if (opp_table->required_devs[0])
e37440e7e2c276 Viresh Kumar          2023-10-27  2415  		return 0;
4f018bc0e1cfde Viresh Kumar          2018-06-26  2416  
6319aee10e5303 Viresh Kumar          2019-05-08  2417  	while (*name) {
6319aee10e5303 Viresh Kumar          2019-05-08  2418  		if (index >= opp_table->required_opp_count) {
6319aee10e5303 Viresh Kumar          2019-05-08  2419  			dev_err(dev, "Index can't be greater than required-opp-count - 1, %s (%d : %d)\n",
6319aee10e5303 Viresh Kumar          2019-05-08  2420  				*name, opp_table->required_opp_count, index);
6319aee10e5303 Viresh Kumar          2019-05-08  2421  			goto err;
6319aee10e5303 Viresh Kumar          2019-05-08  2422  		}
4f018bc0e1cfde Viresh Kumar          2018-06-26  2423  
6319aee10e5303 Viresh Kumar          2019-05-08  2424  		virt_dev = dev_pm_domain_attach_by_name(dev, *name);
4ea9496cbc959e Tang Bin              2022-05-24  2425  		if (IS_ERR_OR_NULL(virt_dev)) {
d920920f85a82c Manivannan Sadhasivam 2023-07-21  2426  			ret = virt_dev ? PTR_ERR(virt_dev) : -ENODEV;
6319aee10e5303 Viresh Kumar          2019-05-08  2427  			dev_err(dev, "Couldn't attach to pm_domain: %d\n", ret);
6319aee10e5303 Viresh Kumar          2019-05-08  2428  			goto err;
4f018bc0e1cfde Viresh Kumar          2018-06-26  2429  		}
4f018bc0e1cfde Viresh Kumar          2018-06-26  2430  
2a56c462fe5a2e Viresh Kumar          2024-04-09  2431  		/*
2a56c462fe5a2e Viresh Kumar          2024-04-09  2432  		 * The required_opp_tables parsing is not perfect, as the OPP
2a56c462fe5a2e Viresh Kumar          2024-04-09  2433  		 * core does the parsing solely based on the DT node pointers.
2a56c462fe5a2e Viresh Kumar          2024-04-09  2434  		 * The core sets the required_opp_tables entry to the first OPP
2a56c462fe5a2e Viresh Kumar          2024-04-09  2435  		 * table in the "opp_tables" list, that matches with the node
2a56c462fe5a2e Viresh Kumar          2024-04-09  2436  		 * pointer.
2a56c462fe5a2e Viresh Kumar          2024-04-09  2437  		 *
2a56c462fe5a2e Viresh Kumar          2024-04-09  2438  		 * If the target DT OPP table is used by multiple devices and
2a56c462fe5a2e Viresh Kumar          2024-04-09  2439  		 * they all create separate instances of 'struct opp_table' from
2a56c462fe5a2e Viresh Kumar          2024-04-09  2440  		 * it, then it is possible that the required_opp_tables entry
2a56c462fe5a2e Viresh Kumar          2024-04-09  2441  		 * may be set to the incorrect sibling device.
2a56c462fe5a2e Viresh Kumar          2024-04-09  2442  		 *
2a56c462fe5a2e Viresh Kumar          2024-04-09  2443  		 * Cross check it again and fix if required.
2a56c462fe5a2e Viresh Kumar          2024-04-09  2444  		 */
2a56c462fe5a2e Viresh Kumar          2024-04-09  2445  		gdev = dev_to_genpd_dev(virt_dev);
2a56c462fe5a2e Viresh Kumar          2024-04-09  2446  		if (IS_ERR(gdev))
2a56c462fe5a2e Viresh Kumar          2024-04-09 @2447  			return PTR_ERR(gdev);
2a56c462fe5a2e Viresh Kumar          2024-04-09  2448  
2a56c462fe5a2e Viresh Kumar          2024-04-09  2449  		genpd_table = _find_opp_table(gdev);
2a56c462fe5a2e Viresh Kumar          2024-04-09  2450  		if (!IS_ERR(genpd_table)) {
2a56c462fe5a2e Viresh Kumar          2024-04-09  2451  			if (genpd_table != opp_table->required_opp_tables[index]) {
2a56c462fe5a2e Viresh Kumar          2024-04-09  2452  				dev_pm_opp_put_opp_table(opp_table->required_opp_tables[index]);
2a56c462fe5a2e Viresh Kumar          2024-04-09  2453  				opp_table->required_opp_tables[index] = genpd_table;
2a56c462fe5a2e Viresh Kumar          2024-04-09  2454  			} else {
2a56c462fe5a2e Viresh Kumar          2024-04-09  2455  				dev_pm_opp_put_opp_table(genpd_table);
2a56c462fe5a2e Viresh Kumar          2024-04-09  2456  			}
2a56c462fe5a2e Viresh Kumar          2024-04-09  2457  		}
2a56c462fe5a2e Viresh Kumar          2024-04-09  2458  
e37440e7e2c276 Viresh Kumar          2023-10-27  2459  		/*
e37440e7e2c276 Viresh Kumar          2023-10-27  2460  		 * Add the virtual genpd device as a user of the OPP table, so
e37440e7e2c276 Viresh Kumar          2023-10-27  2461  		 * we can call dev_pm_opp_set_opp() on it directly.
e37440e7e2c276 Viresh Kumar          2023-10-27  2462  		 *
e37440e7e2c276 Viresh Kumar          2023-10-27  2463  		 * This will be automatically removed when the OPP table is
e37440e7e2c276 Viresh Kumar          2023-10-27  2464  		 * removed, don't need to handle that here.
e37440e7e2c276 Viresh Kumar          2023-10-27  2465  		 */
e37440e7e2c276 Viresh Kumar          2023-10-27  2466  		if (!_add_opp_dev(virt_dev, opp_table->required_opp_tables[index])) {
e37440e7e2c276 Viresh Kumar          2023-10-27  2467  			ret = -ENOMEM;
e37440e7e2c276 Viresh Kumar          2023-10-27  2468  			goto err;
e37440e7e2c276 Viresh Kumar          2023-10-27  2469  		}
e37440e7e2c276 Viresh Kumar          2023-10-27  2470  
e37440e7e2c276 Viresh Kumar          2023-10-27  2471  		opp_table->required_devs[index] = virt_dev;
baea35e4db17a7 Viresh Kumar          2019-07-17  2472  		index++;
6319aee10e5303 Viresh Kumar          2019-05-08  2473  		name++;
6319aee10e5303 Viresh Kumar          2019-05-08  2474  	}
6319aee10e5303 Viresh Kumar          2019-05-08  2475  
17a8f868ae3e85 Viresh Kumar          2019-07-08  2476  	if (virt_devs)
e37440e7e2c276 Viresh Kumar          2023-10-27  2477  		*virt_devs = opp_table->required_devs;
4f018bc0e1cfde Viresh Kumar          2018-06-26  2478  
442e7a1786e628 Viresh Kumar          2022-05-26  2479  	return 0;
6319aee10e5303 Viresh Kumar          2019-05-08  2480  
6319aee10e5303 Viresh Kumar          2019-05-08  2481  err:
48b5aaec596d9a Viresh Kumar          2023-10-12  2482  	_opp_detach_genpd(opp_table);
442e7a1786e628 Viresh Kumar          2022-05-26  2483  	return ret;
6319aee10e5303 Viresh Kumar          2019-05-08  2484  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
