Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B627D1EA8D
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723556908; cv=none; b=c0d8Y1H2Xgf8KitPV1OzmemmgREvClAwh6EIA+j4jfA70WsUVE/Esopgr31HPqJNV8k0S4MBK+tAdCfEB5IqjvgPZYwFJfLeLTvYYDt3yq2x7Zc87qfo+oL6Tk12g+yzSIEPaIOnxG6txgS/i7hvwx29KA+CdMDZqhsnDRnGGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723556908; c=relaxed/simple;
	bh=lnt9u1KirFqeD/NmIHjcOhoaOny2WUYm6LVu5rJxo7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mj2WpsSLRNDiiX9Q36Xd+M/PLpKn5FXrXE0DNsBtSuQ19MHlZFCDAmi3H7FYoy+dME9Ll2i5/5KgR39M0rBOfF5EcEAAIXd09Sin1t2nWEuvGTvKaz8G1J+rYVKjL+4fYTeswloTHIN0yo5vOr1W3Bjor8P0j7ILYllP3yaB7Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuBJP3AO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuBJP3AO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723556905; x=1755092905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnt9u1KirFqeD/NmIHjcOhoaOny2WUYm6LVu5rJxo7Y=;
  b=PuBJP3AOlB6WmInvxW2CyDXoBrvvCPb6piF6zWRuMylEufH+1zfTnGSe
   mKk0hQPj6veF4krhiylydyA0P7D+e843iPC2oxWj2Tt7ZxtiMWx2l2s2d
   H3kBjOVa4ZtXjlKfI2RNIgOz9yqYZ2/z2YLa4smq8XGK/8ojy7KNYydam
   LdDYA5vV4mzny7XqnO1mjiCscRyPDbbcDipX1k9gWHfliCl9/16vqdEMc
   lmsfNLF0m1UdtjoXFWnHlF9Fm1VXtYDYvnKgqrGN8AdN/XsveDXsAJhr5
   4ekx1RXPUNYsCFDoPQSWV+n0XKe8VHPg70YAHI3Vbr/S5d0WA6B3Xh5o1
   w==;
X-CSE-ConnectionGUID: RRaDUbRfRbCFxiec1DG27g==
X-CSE-MsgGUID: SMuSZ3QuQIGcsLv1j00QNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33125390"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="33125390"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 06:48:25 -0700
X-CSE-ConnectionGUID: mQdHTORnS0CbDwm4D+mf1g==
X-CSE-MsgGUID: CVUP2tZXROWNJI+bg8AmTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="96200793"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2024 06:48:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdrsr-0000Re-0F;
	Tue, 13 Aug 2024 13:48:21 +0000
Date: Tue, 13 Aug 2024 21:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [rafael-pm:thermal-core-testing 18/31]
 drivers/thermal/thermal_core.c:881:1-7: preceding lock on line 850
Message-ID: <202408132146.6msMvUTC-lkp@intel.com>
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
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal-core-testing
head:   a2632e332a523a9ce3876f83297adf354de8de80
commit: f14b0720a8c4c331bd38e4b61ad04ac209427f0b [18/31] thermal: core: Clean up cdev binding/unbinding functions
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: i386-randconfig-051-20240813 (https://download.01.org/0day-ci/archive/20240813/202408132146.6msMvUTC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408132146.6msMvUTC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_core.c:881:1-7: preceding lock on line 850
   drivers/thermal/thermal_core.c:881:1-7: preceding lock on line 851

vim +881 drivers/thermal/thermal_core.c

329b064fbd13d6 drivers/thermal/thermal_core.c Daniel Lezcano     2020-07-06  744  
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  745  /*
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  746   * Device management section: cooling devices, zones devices, and binding
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  747   *
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  748   * Set of functions provided by the thermal core for:
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  749   * - cooling devices lifecycle: registration, unregistration,
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  750   *				binding, and unbinding.
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  751   * - thermal zone devices lifecycle: registration, unregistration,
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  752   *				     binding, and unbinding.
81193e2e6b4737 drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  753   */
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  754  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  755  /**
d069ed6b752f91 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-09-21  756   * thermal_bind_cdev_to_trip - bind a cooling device to a thermal zone
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  757   * @tz:		pointer to struct thermal_zone_device
d069ed6b752f91 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-09-21  758   * @trip:	trip point the cooling devices is associated with in this zone.
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  759   * @cdev:	pointer to struct thermal_cooling_device
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  760   * @upper:	the Maximum cooling state for this trip point.
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  761   *		THERMAL_NO_LIMIT means no upper limit,
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  762   *		and the cooling device can be in max_state.
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  763   * @lower:	the Minimum cooling state can be used for this trip point.
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  764   *		THERMAL_NO_LIMIT means no lower limit,
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  765   *		and the cooling device can be in cooling state 0.
6cd9e9f629f11b drivers/thermal/thermal_core.c Kapileshwar Singh  2015-02-18  766   * @weight:	The weight of the cooling device to be bound to the
6cd9e9f629f11b drivers/thermal/thermal_core.c Kapileshwar Singh  2015-02-18  767   *		thermal zone. Use THERMAL_WEIGHT_DEFAULT for the
6cd9e9f629f11b drivers/thermal/thermal_core.c Kapileshwar Singh  2015-02-18  768   *		default value
543a956140e1f5 drivers/thermal/thermal.c      Len Brown          2008-02-07  769   *
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  770   * This interface function bind a thermal cooling device to the certain trip
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  771   * point of a thermal zone device.
543a956140e1f5 drivers/thermal/thermal.c      Len Brown          2008-02-07  772   * This function is usually called in the thermal zone device .bind callback.
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  773   *
d2e4eb83e7523c drivers/thermal/thermal_core.c Eduardo Valentin   2013-04-23  774   * Return: 0 on success, the proper error value otherwise.
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  775   */
d069ed6b752f91 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-09-21  776  int thermal_bind_cdev_to_trip(struct thermal_zone_device *tz,
d069ed6b752f91 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-09-21  777  				     const struct thermal_trip *trip,
9d99842f99d847 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-26  778  				     struct thermal_cooling_device *cdev,
6cd9e9f629f11b drivers/thermal/thermal_core.c Kapileshwar Singh  2015-02-18  779  				     unsigned long upper, unsigned long lower,
6cd9e9f629f11b drivers/thermal/thermal_core.c Kapileshwar Singh  2015-02-18  780  				     unsigned int weight)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  781  {
b81b6ba3d9ac5f drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-27  782  	struct thermal_instance *dev;
b81b6ba3d9ac5f drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-27  783  	struct thermal_instance *pos;
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  784  	bool upper_no_limit;
c408b3d1d9bbc7 drivers/thermal/thermal_core.c Viresh Kumar       2022-10-17  785  	int result;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  786  
4812cf7c673701 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  787  	lockdep_assert_held(&thermal_list_lock);
c751670902c3dd drivers/thermal/thermal.c      Thomas Sujith      2008-02-15  788  
4812cf7c673701 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  789  	if (list_empty(&tz->node) || list_empty(&cdev->node))
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  790  		return -EINVAL;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  791  
9d99842f99d847 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-26  792  	/* lower default 0, upper default max_state */
4812cf7c673701 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  793  	if (lower == THERMAL_NO_LIMIT)
4812cf7c673701 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  794  		lower = 0;
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  795  
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  796  	if (upper == THERMAL_NO_LIMIT) {
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  797  		upper = cdev->max_state;
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  798  		upper_no_limit = true;
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  799  	} else {
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  800  		upper_no_limit = false;
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  801  	}
9d99842f99d847 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-26  802  
c408b3d1d9bbc7 drivers/thermal/thermal_core.c Viresh Kumar       2022-10-17  803  	if (lower > upper || upper > cdev->max_state)
9d99842f99d847 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-26  804  		return -EINVAL;
9d99842f99d847 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-26  805  
95e3ed1513494a drivers/thermal/thermal_core.c Eduardo Valentin   2016-11-07  806  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  807  	if (!dev)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  808  		return -ENOMEM;
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  809  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  810  	dev->tz = tz;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  811  	dev->cdev = cdev;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  812  	dev->trip = trip;
9d99842f99d847 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-26  813  	dev->upper = upper;
790930f44289c8 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-03-17  814  	dev->upper_no_limit = upper_no_limit;
9d99842f99d847 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-26  815  	dev->lower = lower;
ce119f83257aae drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-27  816  	dev->target = THERMAL_NO_TARGET;
6cd9e9f629f11b drivers/thermal/thermal_core.c Kapileshwar Singh  2015-02-18  817  	dev->weight = weight;
74051ba50583a5 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-26  818  
5a5b7d8d541684 drivers/thermal/thermal_core.c keliu              2022-05-27  819  	result = ida_alloc(&tz->ida, GFP_KERNEL);
b31ef8285b19ec drivers/thermal/thermal_core.c Matthew Wilcox     2016-12-21  820  	if (result < 0)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  821  		goto free_mem;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  822  
b31ef8285b19ec drivers/thermal/thermal_core.c Matthew Wilcox     2016-12-21  823  	dev->id = result;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  824  	sprintf(dev->name, "cdev%d", dev->id);
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  825  	result = sysfs_create_link(&tz->device.kobj, &cdev->device.kobj, dev->name);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  826  	if (result)
b31ef8285b19ec drivers/thermal/thermal_core.c Matthew Wilcox     2016-12-21  827  		goto release_ida;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  828  
c99626092efca3 drivers/thermal/thermal_core.c Dan Carpenter      2023-10-07  829  	snprintf(dev->attr_name, sizeof(dev->attr_name), "cdev%d_trip_point",
c99626092efca3 drivers/thermal/thermal_core.c Dan Carpenter      2023-10-07  830  		 dev->id);
975f8c5653acba drivers/thermal/thermal_sys.c  Sergey Senozhatsky 2010-04-06  831  	sysfs_attr_init(&dev->attr.attr);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  832  	dev->attr.attr.name = dev->attr_name;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  833  	dev->attr.attr.mode = 0444;
33e678d47d1f3e drivers/thermal/thermal_core.c Viresh Kumar       2018-04-03  834  	dev->attr.show = trip_point_show;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  835  	result = device_create_file(&tz->device, &dev->attr);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  836  	if (result)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  837  		goto remove_symbol_link;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  838  
c99626092efca3 drivers/thermal/thermal_core.c Dan Carpenter      2023-10-07  839  	snprintf(dev->weight_attr_name, sizeof(dev->weight_attr_name),
c99626092efca3 drivers/thermal/thermal_core.c Dan Carpenter      2023-10-07  840  		 "cdev%d_weight", dev->id);
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  841  	sysfs_attr_init(&dev->weight_attr.attr);
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  842  	dev->weight_attr.attr.name = dev->weight_attr_name;
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  843  	dev->weight_attr.attr.mode = S_IWUSR | S_IRUGO;
33e678d47d1f3e drivers/thermal/thermal_core.c Viresh Kumar       2018-04-03  844  	dev->weight_attr.show = weight_show;
33e678d47d1f3e drivers/thermal/thermal_core.c Viresh Kumar       2018-04-03  845  	dev->weight_attr.store = weight_store;
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  846  	result = device_create_file(&tz->device, &dev->weight_attr);
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  847  	if (result)
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  848  		goto remove_trip_file;
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  849  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17 @850  	mutex_lock(&tz->lock);
f4a821ce6ed419 drivers/thermal/thermal_sys.c  Zhang Rui          2012-07-24  851  	mutex_lock(&cdev->lock);
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  852  
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  853  	list_for_each_entry(pos, &tz->thermal_instances, tz_node) {
685de37d9ea8c1 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  854  		if (pos->trip == trip && pos->cdev == cdev) {
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  855  			result = -EEXIST;
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  856  			goto remove_weight_file;
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  857  		}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  858  	}
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  859  
cddf31b3b293fd drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-27  860  	list_add_tail(&dev->tz_node, &tz->thermal_instances);
b5e4ae620b0627 drivers/thermal/thermal_sys.c  Zhang Rui          2012-06-27  861  	list_add_tail(&dev->cdev_node, &cdev->thermal_instances);
4511f7166a2deb drivers/thermal/thermal_core.c Chen Yu            2015-10-30  862  	atomic_set(&tz->need_update, 1);
a8c959402d4dd6 drivers/thermal/thermal_core.c Lukasz Luba        2023-12-20  863  
a8c959402d4dd6 drivers/thermal/thermal_core.c Lukasz Luba        2023-12-20  864  	thermal_governor_update_tz(tz, THERMAL_TZ_BIND_CDEV);
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  865  
f4a821ce6ed419 drivers/thermal/thermal_sys.c  Zhang Rui          2012-07-24  866  	mutex_unlock(&cdev->lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  867  	mutex_unlock(&tz->lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  868  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  869  	return 0;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  870  
f14b0720a8c4c3 drivers/thermal/thermal_core.c Rafael J. Wysocki  2024-07-30  871  remove_weight_file:
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  872  	device_remove_file(&tz->device, &dev->weight_attr);
db91651311c8b8 drivers/thermal/thermal_core.c Javi Merino        2015-02-18  873  remove_trip_file:
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  874  	device_remove_file(&tz->device, &dev->attr);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  875  remove_symbol_link:
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  876  	sysfs_remove_link(&tz->device.kobj, dev->name);
b31ef8285b19ec drivers/thermal/thermal_core.c Matthew Wilcox     2016-12-21  877  release_ida:
5a5b7d8d541684 drivers/thermal/thermal_core.c keliu              2022-05-27  878  	ida_free(&tz->ida, dev->id);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  879  free_mem:
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  880  	kfree(dev);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17 @881  	return result;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui          2008-01-17  882  }
d069ed6b752f91 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-09-21  883  EXPORT_SYMBOL_GPL(thermal_bind_cdev_to_trip);
d069ed6b752f91 drivers/thermal/thermal_core.c Rafael J. Wysocki  2023-09-21  884  

:::::: The code at line 881 was first introduced by commit
:::::: 203d3d4aa482339b4816f131f713e1b8ee37f6dd the generic thermal sysfs driver

:::::: TO: Zhang Rui <rui.zhang@intel.com>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
