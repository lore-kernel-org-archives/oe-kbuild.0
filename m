Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008BC1CE71F
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Aug 2024 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346025; cv=none; b=BylilMmWV0UBtsS2gO+N+TyOn1CqtotnlhSEWS+jZFDlRueRzG78E2euEwCuLOgxWMXjKBbu/9z05M55SBYqSNB2Z4HP3ElpUwDpqf86Rv3+TYGWsbHVj4+LwPK8QWqV1Q4v4UbJfJ8NxdFugsu9MNrSstyI35YWChr8tD5yBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346025; c=relaxed/simple;
	bh=3J0p7g4ummiyni3oeNAlkXOQBkHcXXV7aD6+3cJIzF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJUl7UzlsOHiNXjGzr6QAuUzNQ5mjjWU4Cc5aQZ+bGOZ42wtYypYQnX02uRJpHbxJMtkEyC0pdToZbNSKuZ98zriHG+XX7gxPMmG4cQmewvLqgL5K+/l3xEO8r8eE9Z7tUW8rODMHI0KCh0hN4Dt4s//NdQSuGmRIXkCKgvsUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgGV51+U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgGV51+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724346023; x=1755882023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3J0p7g4ummiyni3oeNAlkXOQBkHcXXV7aD6+3cJIzF8=;
  b=WgGV51+UwbPsMLyApFxahwSG09pTTyhmK0k2yC7NbPrkBtbtVflvaKsR
   F3uDTd5rpTZ9hJP3t1Zv2LPV++c8DenCz37aULQPcXQ+VRxa2eVCdoCN7
   1hRgISKMbvwLsjxRYYFcCNWBsPRs+t/aAgheKGj/852IOrEkfrpIMSB0s
   XoVhRzJTbZuxSv7J4MfLOaD+junelpOl5vcsDXZGRg89fL+v021KycdrA
   424qm7hzy1ZJ30D5j7uxbISdmM4hufynY8BtC8h7JWXH9F4/19IJ23zco
   w5Bq6/6/uoTsd00WNgEQnNnJsZILVjq8LAmDEDWuQfuOQYF5gfur5qcJX
   A==;
X-CSE-ConnectionGUID: CPrHq5HXReyr9zFSgZVA2Q==
X-CSE-MsgGUID: /AmxornqTtKbfYWDwrEd4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40290408"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="40290408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:00:22 -0700
X-CSE-ConnectionGUID: 61MYCxKqS6+MX+jTB+8QoA==
X-CSE-MsgGUID: 55t/fw49QXSgwR+uJoUZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61651258"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Aug 2024 10:00:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shBAY-000D0q-2d;
	Thu, 22 Aug 2024 17:00:18 +0000
Date: Fri, 23 Aug 2024 00:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5654/6069] drivers/thermal/testing/zone.c:189
 tt_add_tz() error: uninitialized symbol 'tt_work'.
Message-ID: <202408230001.FacU2bQ2-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a7917c89f219f09b1d88d09f376000914a52763
commit: 707bc0f91a35b7bd0c139e0bf49b2b3d32a6d207 [5654/6069] thermal: Introduce a debugfs-based testing facility
:::::: branch date: 11 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-141-20240822 (https://download.01.org/0day-ci/archive/20240823/202408230001.FacU2bQ2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408230001.FacU2bQ2-lkp@intel.com/

smatch warnings:
drivers/thermal/testing/zone.c:189 tt_add_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:241 tt_del_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:337 tt_zone_add_trip() error: uninitialized symbol 'tt_trip'.
drivers/thermal/testing/zone.c:395 tt_zone_register_tz() error: uninitialized symbol 'trips'.

vim +/tt_work +189 drivers/thermal/testing/zone.c

707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  185  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  186  int tt_add_tz(void)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  187  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  188  	struct tt_thermal_zone *tt_zone __free(kfree);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02 @189  	struct tt_work *tt_work __free(kfree);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  190  	int ret;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  191  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  192  	tt_zone = kzalloc(sizeof(*tt_zone), GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  193  	if (!tt_zone)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  194  		return -ENOMEM;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  195  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  196  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  197  	if (!tt_work)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  198  		return -ENOMEM;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  199  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  200  	INIT_LIST_HEAD(&tt_zone->trips);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  201  	mutex_init(&tt_zone->lock);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  202  	ida_init(&tt_zone->ida);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  203  	tt_zone->temp = THERMAL_TEMP_INVALID;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  204  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  205  	ret = ida_alloc(&tt_thermal_zones_ida, GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  206  	if (ret < 0)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  207  		return ret;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  208  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  209  	tt_zone->id = ret;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  210  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  211  	INIT_WORK(&tt_work->work, tt_add_tz_work_fn);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  212  	tt_work->tt_zone = no_free_ptr(tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  213  	schedule_work(&(no_free_ptr(tt_work)->work));
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  214  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  215  	return 0;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  216  }
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  217  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  218  static void tt_del_tz_work_fn(struct work_struct *work)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  219  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  220  	struct tt_work *tt_work = tt_work_of_work(work);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  221  	struct tt_thermal_zone *tt_zone = tt_work->tt_zone;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  222  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  223  	kfree(tt_work);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  224  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  225  	debugfs_remove(tt_zone->d_tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  226  	tt_zone_free(tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  227  }
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  228  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  229  static void tt_zone_unregister_tz(struct tt_thermal_zone *tt_zone)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  230  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  231  	guard(tt_zone)(tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  232  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  233  	if (tt_zone->tz) {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  234  		thermal_zone_device_unregister(tt_zone->tz);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  235  		tt_zone->tz = NULL;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  236  	}
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  237  }
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  238  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  239  int tt_del_tz(const char *arg)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  240  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02 @241  	struct tt_work *tt_work __free(kfree);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  242  	struct tt_thermal_zone *tt_zone, *aux;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  243  	int ret;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  244  	int id;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  245  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  246  	ret = sscanf(arg, "%d", &id);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  247  	if (ret != 1)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  248  		return -EINVAL;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  249  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  250  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  251  	if (!tt_work)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  252  		return -ENOMEM;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  253  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  254  	guard(mutex)(&tt_thermal_zones_lock);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  255  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  256  	ret = -EINVAL;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  257  	list_for_each_entry_safe(tt_zone, aux, &tt_thermal_zones, list_node) {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  258  		if (tt_zone->id == id) {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  259  			if (tt_zone->refcount) {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  260  				ret = -EBUSY;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  261  			} else {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  262  				list_del(&tt_zone->list_node);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  263  				ret = 0;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  264  			}
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  265  			break;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  266  		}
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  267  	}
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  268  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  269  	if (ret)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  270  		return ret;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  271  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  272  	tt_zone_unregister_tz(tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  273  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  274  	INIT_WORK(&tt_work->work, tt_del_tz_work_fn);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  275  	tt_work->tt_zone = tt_zone;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  276  	schedule_work(&(no_free_ptr(tt_work)->work));
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  277  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  278  	return 0;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  279  }
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  280  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  281  static struct tt_thermal_zone *tt_get_tt_zone(const char *arg)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  282  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  283  	struct tt_thermal_zone *tt_zone;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  284  	int ret, id;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  285  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  286  	ret = sscanf(arg, "%d", &id);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  287  	if (ret != 1)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  288  		return ERR_PTR(-EINVAL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  289  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  290  	guard(mutex)(&tt_thermal_zones_lock);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  291  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  292  	ret = -EINVAL;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  293  	list_for_each_entry(tt_zone, &tt_thermal_zones, list_node) {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  294  		if (tt_zone->id == id) {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  295  			tt_zone->refcount++;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  296  			ret = 0;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  297  			break;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  298  		}
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  299  	}
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  300  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  301  	if (ret)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  302  		return ERR_PTR(ret);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  303  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  304  	return tt_zone;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  305  }
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  306  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  307  static void tt_put_tt_zone(struct tt_thermal_zone *tt_zone)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  308  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  309  	guard(mutex)(&tt_thermal_zones_lock);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  310  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  311  	tt_zone->refcount--;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  312  }
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  313  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  314  static void tt_zone_add_trip_work_fn(struct work_struct *work)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  315  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  316  	struct tt_work *tt_work = tt_work_of_work(work);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  317  	struct tt_thermal_zone *tt_zone = tt_work->tt_zone;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  318  	struct tt_trip *tt_trip = tt_work->tt_trip;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  319  	char d_name[TT_MAX_FILE_NAME_LENGTH];
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  320  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  321  	kfree(tt_work);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  322  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  323  	snprintf(d_name, TT_MAX_FILE_NAME_LENGTH, "trip_%d_temp", tt_trip->id);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  324  	debugfs_create_file_unsafe(d_name, 0600, tt_zone->d_tt_zone,
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  325  				   &tt_trip->trip.temperature, &tt_int_attr);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  326  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  327  	snprintf(d_name, TT_MAX_FILE_NAME_LENGTH, "trip_%d_hyst", tt_trip->id);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  328  	debugfs_create_file_unsafe(d_name, 0600, tt_zone->d_tt_zone,
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  329  				   &tt_trip->trip.hysteresis, &tt_unsigned_int_attr);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  330  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  331  	tt_put_tt_zone(tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  332  }
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  333  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  334  int tt_zone_add_trip(const char *arg)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  335  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  336  	struct tt_work *tt_work __free(kfree);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02 @337  	struct tt_trip *tt_trip __free(kfree);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  338  	struct tt_thermal_zone *tt_zone;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  339  	int id;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  340  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  341  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  342  	if (!tt_work)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  343  		return -ENOMEM;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  344  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  345  	tt_trip = kzalloc(sizeof(*tt_trip), GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  346  	if (!tt_trip)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  347  		return -ENOMEM;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  348  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  349  	tt_zone = tt_get_tt_zone(arg);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  350  	if (IS_ERR(tt_zone))
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  351  		return PTR_ERR(tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  352  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  353  	id = ida_alloc(&tt_zone->ida, GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  354  	if (id < 0) {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  355  		tt_put_tt_zone(tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  356  		return id;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  357  	}
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  358  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  359  	tt_trip->trip.type = THERMAL_TRIP_ACTIVE;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  360  	tt_trip->trip.temperature = THERMAL_TEMP_INVALID;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  361  	tt_trip->trip.flags = THERMAL_TRIP_FLAG_RW;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  362  	tt_trip->id = id;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  363  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  364  	guard(tt_zone)(tt_zone);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  365  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  366  	list_add_tail(&tt_trip->list_node, &tt_zone->trips);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  367  	tt_zone->num_trips++;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  368  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  369  	INIT_WORK(&tt_work->work, tt_zone_add_trip_work_fn);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  370  	tt_work->tt_zone = tt_zone;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  371  	tt_work->tt_trip = no_free_ptr(tt_trip);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  372  	schedule_work(&(no_free_ptr(tt_work)->work));
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  373  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  374  	return 0;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  375  }
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  376  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
