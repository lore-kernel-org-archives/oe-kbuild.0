Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B515AC3
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d28/HPna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701625972; x=1733161972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWMxvH0rVgVIF45ThhaZUa3VNGa3EATmlubaih985KI=;
  b=d28/HPnaYl01BXKZS+hyjtL40DlqRb06+jpsX7ia7AW3VKMXD9yl6n9m
   KZPoCQUWzc9FXEHvU8vNTwxjnYqCuIgAZdb8SYwe+LpFyAnekjtM1MVma
   PhAvq544qmExBvNTey4FLlz3wf0Yr/5pC0Ls6zr8Pa9O44eZxHr4LCXjD
   FyB+koEwLfl+XJTzegUUyq8sDdU95fBk4CSlixauWzkKA+CBGkXMqbUgt
   f8oOzI9gi1slU97Br5L1rfGBAiNNQ/zJP69lx50MovWi8qpReWj6Qg5pr
   jaDyeUIjON/l9OuIAjkG8gi/ah2xkErAKVmJ7e8rRbyEjdKIbYZqioH1k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="397540393"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="397540393"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 09:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="943650370"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="943650370"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Dec 2023 09:52:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9qe7-0006wG-2S;
	Sun, 03 Dec 2023 17:52:47 +0000
Date: Mon, 4 Dec 2023 01:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/test/efi_test.c:380 efi_runtime_get_waketime()
 error: uninitialized symbol 'enabled'.
Message-ID: <202312040117.iUG9taHF-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ivan Hu <ivan.hu@canonical.com>
CC: Matt Fleming <matt@codeblueprint.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: ff6301dabc3ca20ab8f50f8d0252ac05da610d89 efi: Add efi_test driver for exporting UEFI runtime service interfaces
date:   7 years ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 years ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231204/202312040117.iUG9taHF-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312040117.iUG9taHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312040117.iUG9taHF-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/test/efi_test.c:380 efi_runtime_get_waketime() error: uninitialized symbol 'enabled'.
drivers/firmware/efi/test/efi_test.c:549 efi_runtime_get_nexthighmonocount() error: uninitialized symbol 'count'.

Old smatch warnings:
drivers/firmware/efi/test/efi_test.c:199 efi_runtime_get_variable() error: uninitialized symbol 'datasize'.
drivers/firmware/efi/test/efi_test.c:521 efi_runtime_get_nextvariablename() error: uninitialized symbol 'rv'.

vim +/enabled +380 drivers/firmware/efi/test/efi_test.c

ff6301dabc3ca2 Ivan Hu 2016-08-25  355  
ff6301dabc3ca2 Ivan Hu 2016-08-25  356  static long efi_runtime_get_waketime(unsigned long arg)
ff6301dabc3ca2 Ivan Hu 2016-08-25  357  {
ff6301dabc3ca2 Ivan Hu 2016-08-25  358  	struct efi_getwakeuptime __user *getwakeuptime_user;
ff6301dabc3ca2 Ivan Hu 2016-08-25  359  	struct efi_getwakeuptime getwakeuptime;
ff6301dabc3ca2 Ivan Hu 2016-08-25  360  	efi_bool_t enabled, pending;
ff6301dabc3ca2 Ivan Hu 2016-08-25  361  	efi_status_t status;
ff6301dabc3ca2 Ivan Hu 2016-08-25  362  	efi_time_t efi_time;
ff6301dabc3ca2 Ivan Hu 2016-08-25  363  
ff6301dabc3ca2 Ivan Hu 2016-08-25  364  	getwakeuptime_user = (struct efi_getwakeuptime __user *)arg;
ff6301dabc3ca2 Ivan Hu 2016-08-25  365  	if (copy_from_user(&getwakeuptime, getwakeuptime_user,
ff6301dabc3ca2 Ivan Hu 2016-08-25  366  				sizeof(getwakeuptime)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  367  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  368  
ff6301dabc3ca2 Ivan Hu 2016-08-25  369  	status = efi.get_wakeup_time(
ff6301dabc3ca2 Ivan Hu 2016-08-25  370  		getwakeuptime.enabled ? (efi_bool_t *)&enabled : NULL,
ff6301dabc3ca2 Ivan Hu 2016-08-25  371  		getwakeuptime.pending ? (efi_bool_t *)&pending : NULL,
ff6301dabc3ca2 Ivan Hu 2016-08-25  372  		getwakeuptime.time ? &efi_time : NULL);
ff6301dabc3ca2 Ivan Hu 2016-08-25  373  
ff6301dabc3ca2 Ivan Hu 2016-08-25  374  	if (put_user(status, getwakeuptime.status))
ff6301dabc3ca2 Ivan Hu 2016-08-25  375  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  376  
ff6301dabc3ca2 Ivan Hu 2016-08-25  377  	if (status != EFI_SUCCESS)
ff6301dabc3ca2 Ivan Hu 2016-08-25  378  		return -EINVAL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  379  
ff6301dabc3ca2 Ivan Hu 2016-08-25 @380  	if (getwakeuptime.enabled && put_user(enabled,
ff6301dabc3ca2 Ivan Hu 2016-08-25  381  						getwakeuptime.enabled))
ff6301dabc3ca2 Ivan Hu 2016-08-25  382  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  383  
ff6301dabc3ca2 Ivan Hu 2016-08-25  384  	if (getwakeuptime.time) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  385  		if (copy_to_user(getwakeuptime.time, &efi_time,
ff6301dabc3ca2 Ivan Hu 2016-08-25  386  				sizeof(efi_time_t)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  387  			return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  388  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  389  
ff6301dabc3ca2 Ivan Hu 2016-08-25  390  	return 0;
ff6301dabc3ca2 Ivan Hu 2016-08-25  391  }
ff6301dabc3ca2 Ivan Hu 2016-08-25  392  
ff6301dabc3ca2 Ivan Hu 2016-08-25  393  static long efi_runtime_set_waketime(unsigned long arg)
ff6301dabc3ca2 Ivan Hu 2016-08-25  394  {
ff6301dabc3ca2 Ivan Hu 2016-08-25  395  	struct efi_setwakeuptime __user *setwakeuptime_user;
ff6301dabc3ca2 Ivan Hu 2016-08-25  396  	struct efi_setwakeuptime setwakeuptime;
ff6301dabc3ca2 Ivan Hu 2016-08-25  397  	efi_bool_t enabled;
ff6301dabc3ca2 Ivan Hu 2016-08-25  398  	efi_status_t status;
ff6301dabc3ca2 Ivan Hu 2016-08-25  399  	efi_time_t efi_time;
ff6301dabc3ca2 Ivan Hu 2016-08-25  400  
ff6301dabc3ca2 Ivan Hu 2016-08-25  401  	setwakeuptime_user = (struct efi_setwakeuptime __user *)arg;
ff6301dabc3ca2 Ivan Hu 2016-08-25  402  
ff6301dabc3ca2 Ivan Hu 2016-08-25  403  	if (copy_from_user(&setwakeuptime, setwakeuptime_user,
ff6301dabc3ca2 Ivan Hu 2016-08-25  404  				sizeof(setwakeuptime)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  405  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  406  
ff6301dabc3ca2 Ivan Hu 2016-08-25  407  	enabled = setwakeuptime.enabled;
ff6301dabc3ca2 Ivan Hu 2016-08-25  408  	if (setwakeuptime.time) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  409  		if (copy_from_user(&efi_time, setwakeuptime.time,
ff6301dabc3ca2 Ivan Hu 2016-08-25  410  					sizeof(efi_time_t)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  411  			return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  412  
ff6301dabc3ca2 Ivan Hu 2016-08-25  413  		status = efi.set_wakeup_time(enabled, &efi_time);
ff6301dabc3ca2 Ivan Hu 2016-08-25  414  	} else
ff6301dabc3ca2 Ivan Hu 2016-08-25  415  		status = efi.set_wakeup_time(enabled, NULL);
ff6301dabc3ca2 Ivan Hu 2016-08-25  416  
ff6301dabc3ca2 Ivan Hu 2016-08-25  417  	if (put_user(status, setwakeuptime.status))
ff6301dabc3ca2 Ivan Hu 2016-08-25  418  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  419  
ff6301dabc3ca2 Ivan Hu 2016-08-25  420  	return status == EFI_SUCCESS ? 0 : -EINVAL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  421  }
ff6301dabc3ca2 Ivan Hu 2016-08-25  422  
ff6301dabc3ca2 Ivan Hu 2016-08-25  423  static long efi_runtime_get_nextvariablename(unsigned long arg)
ff6301dabc3ca2 Ivan Hu 2016-08-25  424  {
ff6301dabc3ca2 Ivan Hu 2016-08-25  425  	struct efi_getnextvariablename __user *getnextvariablename_user;
ff6301dabc3ca2 Ivan Hu 2016-08-25  426  	struct efi_getnextvariablename getnextvariablename;
ff6301dabc3ca2 Ivan Hu 2016-08-25  427  	unsigned long name_size, prev_name_size = 0, *ns = NULL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  428  	efi_status_t status;
ff6301dabc3ca2 Ivan Hu 2016-08-25  429  	efi_guid_t *vd = NULL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  430  	efi_guid_t vendor_guid;
ff6301dabc3ca2 Ivan Hu 2016-08-25  431  	efi_char16_t *name = NULL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  432  	int rv;
ff6301dabc3ca2 Ivan Hu 2016-08-25  433  
ff6301dabc3ca2 Ivan Hu 2016-08-25  434  	getnextvariablename_user = (struct efi_getnextvariablename __user *)arg;
ff6301dabc3ca2 Ivan Hu 2016-08-25  435  
ff6301dabc3ca2 Ivan Hu 2016-08-25  436  	if (copy_from_user(&getnextvariablename, getnextvariablename_user,
ff6301dabc3ca2 Ivan Hu 2016-08-25  437  			   sizeof(getnextvariablename)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  438  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  439  
ff6301dabc3ca2 Ivan Hu 2016-08-25  440  	if (getnextvariablename.variable_name_size) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  441  		if (get_user(name_size, getnextvariablename.variable_name_size))
ff6301dabc3ca2 Ivan Hu 2016-08-25  442  			return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  443  		ns = &name_size;
ff6301dabc3ca2 Ivan Hu 2016-08-25  444  		prev_name_size = name_size;
ff6301dabc3ca2 Ivan Hu 2016-08-25  445  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  446  
ff6301dabc3ca2 Ivan Hu 2016-08-25  447  	if (getnextvariablename.vendor_guid) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  448  		if (copy_from_user(&vendor_guid,
ff6301dabc3ca2 Ivan Hu 2016-08-25  449  				getnextvariablename.vendor_guid,
ff6301dabc3ca2 Ivan Hu 2016-08-25  450  				sizeof(vendor_guid)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  451  			return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  452  		vd = &vendor_guid;
ff6301dabc3ca2 Ivan Hu 2016-08-25  453  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  454  
ff6301dabc3ca2 Ivan Hu 2016-08-25  455  	if (getnextvariablename.variable_name) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  456  		size_t name_string_size = 0;
ff6301dabc3ca2 Ivan Hu 2016-08-25  457  
ff6301dabc3ca2 Ivan Hu 2016-08-25  458  		rv = get_ucs2_strsize_from_user(
ff6301dabc3ca2 Ivan Hu 2016-08-25  459  				getnextvariablename.variable_name,
ff6301dabc3ca2 Ivan Hu 2016-08-25  460  				&name_string_size);
ff6301dabc3ca2 Ivan Hu 2016-08-25  461  		if (rv)
ff6301dabc3ca2 Ivan Hu 2016-08-25  462  			return rv;
ff6301dabc3ca2 Ivan Hu 2016-08-25  463  		/*
ff6301dabc3ca2 Ivan Hu 2016-08-25  464  		 * The name_size may be smaller than the real buffer size where
ff6301dabc3ca2 Ivan Hu 2016-08-25  465  		 * variable name located in some use cases. The most typical
ff6301dabc3ca2 Ivan Hu 2016-08-25  466  		 * case is passing a 0 to get the required buffer size for the
ff6301dabc3ca2 Ivan Hu 2016-08-25  467  		 * 1st time call. So we need to copy the content from user
ff6301dabc3ca2 Ivan Hu 2016-08-25  468  		 * space for at least the string size of variable name, or else
ff6301dabc3ca2 Ivan Hu 2016-08-25  469  		 * the name passed to UEFI may not be terminated as we expected.
ff6301dabc3ca2 Ivan Hu 2016-08-25  470  		 */
ff6301dabc3ca2 Ivan Hu 2016-08-25  471  		rv = copy_ucs2_from_user_len(&name,
ff6301dabc3ca2 Ivan Hu 2016-08-25  472  				getnextvariablename.variable_name,
ff6301dabc3ca2 Ivan Hu 2016-08-25  473  				prev_name_size > name_string_size ?
ff6301dabc3ca2 Ivan Hu 2016-08-25  474  				prev_name_size : name_string_size);
ff6301dabc3ca2 Ivan Hu 2016-08-25  475  		if (rv)
ff6301dabc3ca2 Ivan Hu 2016-08-25  476  			return rv;
ff6301dabc3ca2 Ivan Hu 2016-08-25  477  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  478  
ff6301dabc3ca2 Ivan Hu 2016-08-25  479  	status = efi.get_next_variable(ns, name, vd);
ff6301dabc3ca2 Ivan Hu 2016-08-25  480  
ff6301dabc3ca2 Ivan Hu 2016-08-25  481  	if (put_user(status, getnextvariablename.status)) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  482  		rv = -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  483  		goto out;
ff6301dabc3ca2 Ivan Hu 2016-08-25  484  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  485  
ff6301dabc3ca2 Ivan Hu 2016-08-25  486  	if (status != EFI_SUCCESS) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  487  		if (status == EFI_BUFFER_TOO_SMALL) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  488  			if (ns && put_user(*ns,
ff6301dabc3ca2 Ivan Hu 2016-08-25  489  				getnextvariablename.variable_name_size)) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  490  				rv = -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  491  				goto out;
ff6301dabc3ca2 Ivan Hu 2016-08-25  492  			}
ff6301dabc3ca2 Ivan Hu 2016-08-25  493  		}
ff6301dabc3ca2 Ivan Hu 2016-08-25  494  		rv = -EINVAL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  495  		goto out;
ff6301dabc3ca2 Ivan Hu 2016-08-25  496  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  497  
ff6301dabc3ca2 Ivan Hu 2016-08-25  498  	if (name) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  499  		if (copy_ucs2_to_user_len(getnextvariablename.variable_name,
ff6301dabc3ca2 Ivan Hu 2016-08-25  500  						name, prev_name_size)) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  501  			rv = -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  502  			goto out;
ff6301dabc3ca2 Ivan Hu 2016-08-25  503  		}
ff6301dabc3ca2 Ivan Hu 2016-08-25  504  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  505  
ff6301dabc3ca2 Ivan Hu 2016-08-25  506  	if (ns) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  507  		if (put_user(*ns, getnextvariablename.variable_name_size)) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  508  			rv = -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  509  			goto out;
ff6301dabc3ca2 Ivan Hu 2016-08-25  510  		}
ff6301dabc3ca2 Ivan Hu 2016-08-25  511  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  512  
ff6301dabc3ca2 Ivan Hu 2016-08-25  513  	if (vd) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  514  		if (copy_to_user(getnextvariablename.vendor_guid, vd,
ff6301dabc3ca2 Ivan Hu 2016-08-25  515  							sizeof(efi_guid_t)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  516  			rv = -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  517  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  518  
ff6301dabc3ca2 Ivan Hu 2016-08-25  519  out:
ff6301dabc3ca2 Ivan Hu 2016-08-25  520  	kfree(name);
ff6301dabc3ca2 Ivan Hu 2016-08-25  521  	return rv;
ff6301dabc3ca2 Ivan Hu 2016-08-25  522  }
ff6301dabc3ca2 Ivan Hu 2016-08-25  523  
ff6301dabc3ca2 Ivan Hu 2016-08-25  524  static long efi_runtime_get_nexthighmonocount(unsigned long arg)
ff6301dabc3ca2 Ivan Hu 2016-08-25  525  {
ff6301dabc3ca2 Ivan Hu 2016-08-25  526  	struct efi_getnexthighmonotoniccount __user *getnexthighmonocount_user;
ff6301dabc3ca2 Ivan Hu 2016-08-25  527  	struct efi_getnexthighmonotoniccount getnexthighmonocount;
ff6301dabc3ca2 Ivan Hu 2016-08-25  528  	efi_status_t status;
ff6301dabc3ca2 Ivan Hu 2016-08-25  529  	u32 count;
ff6301dabc3ca2 Ivan Hu 2016-08-25  530  
ff6301dabc3ca2 Ivan Hu 2016-08-25  531  	getnexthighmonocount_user = (struct
ff6301dabc3ca2 Ivan Hu 2016-08-25  532  			efi_getnexthighmonotoniccount __user *)arg;
ff6301dabc3ca2 Ivan Hu 2016-08-25  533  
ff6301dabc3ca2 Ivan Hu 2016-08-25  534  	if (copy_from_user(&getnexthighmonocount,
ff6301dabc3ca2 Ivan Hu 2016-08-25  535  			   getnexthighmonocount_user,
ff6301dabc3ca2 Ivan Hu 2016-08-25  536  			   sizeof(getnexthighmonocount)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  537  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  538  
ff6301dabc3ca2 Ivan Hu 2016-08-25  539  	status = efi.get_next_high_mono_count(
ff6301dabc3ca2 Ivan Hu 2016-08-25  540  		getnexthighmonocount.high_count ? &count : NULL);
ff6301dabc3ca2 Ivan Hu 2016-08-25  541  
ff6301dabc3ca2 Ivan Hu 2016-08-25  542  	if (put_user(status, getnexthighmonocount.status))
ff6301dabc3ca2 Ivan Hu 2016-08-25  543  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  544  
ff6301dabc3ca2 Ivan Hu 2016-08-25  545  	if (status != EFI_SUCCESS)
ff6301dabc3ca2 Ivan Hu 2016-08-25  546  		return -EINVAL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  547  
ff6301dabc3ca2 Ivan Hu 2016-08-25  548  	if (getnexthighmonocount.high_count &&
ff6301dabc3ca2 Ivan Hu 2016-08-25 @549  	    put_user(count, getnexthighmonocount.high_count))
ff6301dabc3ca2 Ivan Hu 2016-08-25  550  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  551  
ff6301dabc3ca2 Ivan Hu 2016-08-25  552  	return 0;
ff6301dabc3ca2 Ivan Hu 2016-08-25  553  }
ff6301dabc3ca2 Ivan Hu 2016-08-25  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
