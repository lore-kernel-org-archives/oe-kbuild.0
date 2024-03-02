Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391D1E86C
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Mar 2024 23:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709423347; cv=none; b=OXAV5O/ihkmHTvih01B9TOnv/ABgu9HKkYsTvyFihpJfCoqpcX3cexnmTbgWeqmIkQg+A2fwO8pbjPO9tRQw6pYLr3TiXSwWpw+7xAZFHyOKubSQpYl+TK0QIRGStc7RMEgInB+AEs8wTk28gHo+d6U+ieNFbtU/Mji0HQIq0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709423347; c=relaxed/simple;
	bh=cjb+C42JQ2k1MnLo9UF564B1oUkY3pAw5VIp/2hp2j8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8S8JgvtG1Eth0Zh+IQWoBeAxfqB6r+pqF9VnNHPAWQtHNde7CpxMYh1NfSlFL1OdLb9McYO9O1XnRoQmIwdH2VZfvyLjjW38IYlysZGmibbdW6lAgSUu7NZkzbW/oHRolzwYGAW98E47di6r+P09OoUQ6nZdzTv7of3xGcOU28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEfD3vkN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEfD3vkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709423345; x=1740959345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjb+C42JQ2k1MnLo9UF564B1oUkY3pAw5VIp/2hp2j8=;
  b=kEfD3vkNkKd0uqtNK6/EJkhZaV6yLi6e8pkYKPkCCoCpM5XWQkcdNeEK
   Orx0JVZxAJ5Xqx+eMHe9JpjiWRwojfE3x/PR0j7c2+duZ4CP+6qrT10ih
   lKUNnhMyHzL8UzRT/0hWBq75IBGsfdgbGFQ5Pz/FK59eQL3hkTyBJvpY7
   BVxWUt6dcf1GdVrTE3JXZO7XlgmhOEB0an/WkQG4IX7VY9jQmU1TdcvAw
   s7fDxNXik7i3Qly4guabZOqY9AUrWCMdaHruL8AV1pCi4GS85cNfbrpXd
   OZnQ8Jn5A3ynwL5e5F2NMydrqMuj9LO6QLYR8zecjmCyZzyXzxmwAM66e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="29364373"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="29364373"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 15:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8705689"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Mar 2024 15:49:03 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgZ6C-0000N2-2i;
	Sat, 02 Mar 2024 23:49:00 +0000
Date: Sun, 3 Mar 2024 07:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:for_each_port-2024-03-01 8/30]
 drivers/media/platform/ti/am437x/am437x-vpfe.c:2313 vpfe_get_pdata() error:
 uninitialized symbol 'i'.
Message-ID: <202403030756.SXjvZYUZ-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux for_each_port-2024-03-01
head:   31e5c824074315632ffd6552b8b68e181cfb7645
commit: 31ea0ac10177cfdf73b620f752351681ff7e77d1 [8/30] media: platform: ti: use for_each_endpoint_of_node()
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: powerpc-randconfig-r071-20240302 (https://download.01.org/0day-ci/archive/20240303/202403030756.SXjvZYUZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403030756.SXjvZYUZ-lkp@intel.com/

smatch warnings:
drivers/media/platform/ti/am437x/am437x-vpfe.c:2313 vpfe_get_pdata() error: uninitialized symbol 'i'.

vim +/i +2313 drivers/media/platform/ti/am437x/am437x-vpfe.c

b6ee3f0dcf43dc drivers/media/platform/am437x/am437x-vpfe.c    Laurent Pinchart      2017-08-30  2286  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2287  static struct vpfe_config *
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2288  vpfe_get_pdata(struct vpfe_device *vpfe)
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2289  {
ee662d44a23df4 drivers/media/platform/am437x/am437x-vpfe.c    Laurent Pinchart      2015-02-23  2290  	struct device_node *endpoint = NULL;
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2291  	struct device *dev = vpfe->pdev;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2292  	struct vpfe_subdev_info *sdinfo;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2293  	struct vpfe_config *pdata;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2294  	unsigned int flags;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2295  	unsigned int i;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2296  	int err;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2297  
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2298  	dev_dbg(dev, "vpfe_get_pdata\n");
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2299  
b8ec754ae4c563 drivers/media/platform/ti/am437x/am437x-vpfe.c Sakari Ailus          2023-02-23  2300  	v4l2_async_nf_init(&vpfe->notifier, &vpfe->v4l2_dev);
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2301  
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2302  	if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2303  		return dev->platform_data;
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2304  
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2305  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2306  	if (!pdata)
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2307  		return NULL;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2308  
31ea0ac10177cf drivers/media/platform/ti/am437x/am437x-vpfe.c Kuninori Morimoto     2024-02-02  2309  	for_each_endpoint_of_node(dev->of_node, endpoint) {
60359a28d59278 drivers/media/platform/am437x/am437x-vpfe.c    Sakari Ailus          2018-07-31  2310  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
ee662d44a23df4 drivers/media/platform/am437x/am437x-vpfe.c    Laurent Pinchart      2015-02-23  2311  		struct device_node *rem;
ee662d44a23df4 drivers/media/platform/am437x/am437x-vpfe.c    Laurent Pinchart      2015-02-23  2312  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09 @2313  		sdinfo = &pdata->sub_devs[i];
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2314  		sdinfo->grp_id = 0;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2315  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2316  		/* we only support camera */
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2317  		sdinfo->inputs[0].index = i;
cc1e6315e83db0 drivers/media/platform/am437x/am437x-vpfe.c    Mauro Carvalho Chehab 2018-09-10  2318  		strscpy(sdinfo->inputs[0].name, "Camera",
cc1e6315e83db0 drivers/media/platform/am437x/am437x-vpfe.c    Mauro Carvalho Chehab 2018-09-10  2319  			sizeof(sdinfo->inputs[0].name));
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2320  		sdinfo->inputs[0].type = V4L2_INPUT_TYPE_CAMERA;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2321  		sdinfo->inputs[0].std = V4L2_STD_ALL;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2322  		sdinfo->inputs[0].capabilities = V4L2_IN_CAP_STD;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2323  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2324  		sdinfo->can_route = 0;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2325  		sdinfo->routes = NULL;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2326  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2327  		of_property_read_u32(endpoint, "ti,am437x-vpfe-interface",
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2328  				     &sdinfo->vpfe_param.if_type);
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2329  		if (sdinfo->vpfe_param.if_type < 0 ||
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2330  			sdinfo->vpfe_param.if_type > 4) {
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2331  			sdinfo->vpfe_param.if_type = VPFE_RAW_BAYER;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2332  		}
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2333  
859969b38e2e93 drivers/media/platform/am437x/am437x-vpfe.c    Sakari Ailus          2016-08-26  2334  		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
859969b38e2e93 drivers/media/platform/am437x/am437x-vpfe.c    Sakari Ailus          2016-08-26  2335  						 &bus_cfg);
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2336  		if (err) {
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2337  			dev_err(dev, "Could not parse the endpoint\n");
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2338  			goto cleanup;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2339  		}
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2340  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2341  		sdinfo->vpfe_param.bus_width = bus_cfg.bus.parallel.bus_width;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2342  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2343  		if (sdinfo->vpfe_param.bus_width < 8 ||
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2344  			sdinfo->vpfe_param.bus_width > 16) {
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2345  			dev_err(dev, "Invalid bus width.\n");
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2346  			goto cleanup;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2347  		}
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2348  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2349  		flags = bus_cfg.bus.parallel.flags;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2350  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2351  		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2352  			sdinfo->vpfe_param.hdpol = 1;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2353  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2354  		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2355  			sdinfo->vpfe_param.vdpol = 1;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2356  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2357  		rem = of_graph_get_remote_port_parent(endpoint);
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2358  		if (!rem) {
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2359  			dev_err(dev, "Remote device at %pOF not found\n",
68d9c47b1679ec drivers/media/platform/am437x/am437x-vpfe.c    Rob Herring           2017-07-21  2360  				endpoint);
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2361  			goto cleanup;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2362  		}
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2363  
3c8c153914812a drivers/media/platform/am437x/am437x-vpfe.c    Sakari Ailus          2021-03-05  2364  		pdata->asd[i] = v4l2_async_nf_add_fwnode(&vpfe->notifier,
3c8c153914812a drivers/media/platform/am437x/am437x-vpfe.c    Sakari Ailus          2021-03-05  2365  							 of_fwnode_handle(rem),
adb2dcd5f2d49d drivers/media/platform/ti/am437x/am437x-vpfe.c Sakari Ailus          2023-02-16  2366  							 struct v4l2_async_connection);
7d87db3df00ccc drivers/media/platform/am437x/am437x-vpfe.c    Lad, Prabhakar        2015-03-07  2367  		of_node_put(rem);
016413d967061f drivers/media/platform/am437x/am437x-vpfe.c    Sakari Ailus          2019-04-04  2368  		if (IS_ERR(pdata->asd[i]))
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2369  			goto cleanup;
31ea0ac10177cf drivers/media/platform/ti/am437x/am437x-vpfe.c Kuninori Morimoto     2024-02-02  2370  
31ea0ac10177cf drivers/media/platform/ti/am437x/am437x-vpfe.c Kuninori Morimoto     2024-02-02  2371  		i++;
7d87db3df00ccc drivers/media/platform/am437x/am437x-vpfe.c    Lad, Prabhakar        2015-03-07  2372  	}
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2373  
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2374  	of_node_put(endpoint);
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2375  	return pdata;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2376  
d079f94c90469f drivers/media/platform/am437x/am437x-vpfe.c    Steve Longerbeam      2018-09-29  2377  cleanup:
3c8c153914812a drivers/media/platform/am437x/am437x-vpfe.c    Sakari Ailus          2021-03-05  2378  	v4l2_async_nf_cleanup(&vpfe->notifier);
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2379  	of_node_put(endpoint);
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2380  	return NULL;
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2381  }
417d2e507edcb5 drivers/media/platform/am437x/am437x-vpfe.c    Benoit Parrot         2014-12-09  2382  

:::::: The code at line 2313 was first introduced by commit
:::::: 417d2e507edcb5cf15eb344f86bd3dd28737f24e [media] media: platform: add VPFE capture driver support for AM437X

:::::: TO: Benoit Parrot <bparrot@ti.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
