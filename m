Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461715CC
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 00:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681950789; x=1713486789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T2JCfVWLbo1vhvyfcrJF30Ualzlh64YGGInY2IwpQaw=;
  b=JIk6cKNaM63oH7oBAdQmVO1lKcELu24MhrhTQd6epJdElyDWAMM9PVlJ
   B1dtkeUjN8k68qpKdSyqdYu0s9XWg7aJBYpUaExkgKEmlkhWVYyARZPn0
   /cvVq1i8S1Vf3vmQm47Hh3LNH5wWJLPxHeDQPpCMqgE8Qcz58fXx0Mf7W
   CIgaSmX5kmQc71z8yJQqQqwzAhK40Eq/RUgB3iWeluVNNapg1uY7olIg1
   2RV+avmfAXzvqtA/GsNLnu94adryT5CXfRxWyK5Dt8W5rqWQBpbVVlJFL
   vb/YFBcOpn906JKLKtMd0qoa4TElyZeAg0qfKdV5/8iX+AKRVqdeR0tuS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347453817"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="347453817"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 17:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760934198"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="760934198"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 17:33:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppIEV-000fHu-0H;
	Thu, 20 Apr 2023 00:33:07 +0000
Date: Thu, 20 Apr 2023 08:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/xen/xenbus/xenbus_probe.c:1025 xenbus_init() warn: missing
 unwind goto?
Message-ID: <202304200845.w7m4kXZr-lkp@intel.com>
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
TO: Luca Miccio <lucmiccio@gmail.com>
CC: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23990b1affd2dc8f5e59048d4d4bef05f6e1c544
commit: 5b3353949e89d48b4faf54a9cc241ee5d70df615 xen: add support for initializing xenstore later as HVM domain
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304200845.w7m4kXZr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304200845.w7m4kXZr-lkp@intel.com/

smatch warnings:
drivers/xen/xenbus/xenbus_probe.c:1025 xenbus_init() warn: missing unwind goto?

vim +1025 drivers/xen/xenbus/xenbus_probe.c

5b3353949e89d4 Luca Miccio         2022-05-13   940  
e4184aaf3b2c4f Daniel De Graaf     2011-10-13   941  static int __init xenbus_init(void)
e4184aaf3b2c4f Daniel De Graaf     2011-10-13   942  {
08f6c2b09ebd4b Stefano Stabellini  2021-11-15   943  	int err;
ecc635f90adfe1 Stefano Stabellini  2012-09-14   944  	uint64_t v = 0;
5b3353949e89d4 Luca Miccio         2022-05-13   945  	bool wait = false;
33c1174bae3ea8 Aurelien Chartier   2013-05-28   946  	xen_store_domain_type = XS_UNKNOWN;
e4184aaf3b2c4f Daniel De Graaf     2011-10-13   947  
e4184aaf3b2c4f Daniel De Graaf     2011-10-13   948  	if (!xen_domain())
e4184aaf3b2c4f Daniel De Graaf     2011-10-13   949  		return -ENODEV;
e4184aaf3b2c4f Daniel De Graaf     2011-10-13   950  
2c5d37d30fbd27 Daniel De Graaf     2011-12-19   951  	xenbus_ring_ops_init();
2c5d37d30fbd27 Daniel De Graaf     2011-12-19   952  
ecc635f90adfe1 Stefano Stabellini  2012-09-14   953  	if (xen_pv_domain())
33c1174bae3ea8 Aurelien Chartier   2013-05-28   954  		xen_store_domain_type = XS_PV;
ecc635f90adfe1 Stefano Stabellini  2012-09-14   955  	if (xen_hvm_domain())
33c1174bae3ea8 Aurelien Chartier   2013-05-28   956  		xen_store_domain_type = XS_HVM;
ecc635f90adfe1 Stefano Stabellini  2012-09-14   957  	if (xen_hvm_domain() && xen_initial_domain())
33c1174bae3ea8 Aurelien Chartier   2013-05-28   958  		xen_store_domain_type = XS_LOCAL;
ecc635f90adfe1 Stefano Stabellini  2012-09-14   959  	if (xen_pv_domain() && !xen_start_info->store_evtchn)
33c1174bae3ea8 Aurelien Chartier   2013-05-28   960  		xen_store_domain_type = XS_LOCAL;
ecc635f90adfe1 Stefano Stabellini  2012-09-14   961  	if (xen_pv_domain() && xen_start_info->store_evtchn)
ecc635f90adfe1 Stefano Stabellini  2012-09-14   962  		xenstored_ready = 1;
ecc635f90adfe1 Stefano Stabellini  2012-09-14   963  
33c1174bae3ea8 Aurelien Chartier   2013-05-28   964  	switch (xen_store_domain_type) {
33c1174bae3ea8 Aurelien Chartier   2013-05-28   965  	case XS_LOCAL:
ecc635f90adfe1 Stefano Stabellini  2012-09-14   966  		err = xenstored_local_init();
ecc635f90adfe1 Stefano Stabellini  2012-09-14   967  		if (err)
ecc635f90adfe1 Stefano Stabellini  2012-09-14   968  			goto out_error;
5f51042f876b88 Julien Grall        2015-08-07   969  		xen_store_interface = gfn_to_virt(xen_store_gfn);
ecc635f90adfe1 Stefano Stabellini  2012-09-14   970  		break;
33c1174bae3ea8 Aurelien Chartier   2013-05-28   971  	case XS_PV:
ecc635f90adfe1 Stefano Stabellini  2012-09-14   972  		xen_store_evtchn = xen_start_info->store_evtchn;
5f51042f876b88 Julien Grall        2015-08-07   973  		xen_store_gfn = xen_start_info->store_mfn;
5f51042f876b88 Julien Grall        2015-08-07   974  		xen_store_interface = gfn_to_virt(xen_store_gfn);
ecc635f90adfe1 Stefano Stabellini  2012-09-14   975  		break;
33c1174bae3ea8 Aurelien Chartier   2013-05-28   976  	case XS_HVM:
bee6ab53e652a4 Sheng Yang          2010-05-14   977  		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
bee6ab53e652a4 Sheng Yang          2010-05-14   978  		if (err)
bee6ab53e652a4 Sheng Yang          2010-05-14   979  			goto out_error;
bee6ab53e652a4 Sheng Yang          2010-05-14   980  		xen_store_evtchn = (int)v;
bee6ab53e652a4 Sheng Yang          2010-05-14   981  		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
bee6ab53e652a4 Sheng Yang          2010-05-14   982  		if (err)
bee6ab53e652a4 Sheng Yang          2010-05-14   983  			goto out_error;
36e8f60f0867d3 Stefano Stabellini  2021-11-23   984  		/*
36e8f60f0867d3 Stefano Stabellini  2021-11-23   985  		 * Uninitialized hvm_params are zero and return no error.
36e8f60f0867d3 Stefano Stabellini  2021-11-23   986  		 * Although it is theoretically possible to have
36e8f60f0867d3 Stefano Stabellini  2021-11-23   987  		 * HVM_PARAM_STORE_PFN set to zero on purpose, in reality it is
36e8f60f0867d3 Stefano Stabellini  2021-11-23   988  		 * not zero when valid. If zero, it means that Xenstore hasn't
36e8f60f0867d3 Stefano Stabellini  2021-11-23   989  		 * been properly initialized. Instead of attempting to map a
36e8f60f0867d3 Stefano Stabellini  2021-11-23   990  		 * wrong guest physical address return error.
36e8f60f0867d3 Stefano Stabellini  2021-11-23   991  		 *
5b3353949e89d4 Luca Miccio         2022-05-13   992  		 * Also recognize all bits set as an invalid/uninitialized value.
36e8f60f0867d3 Stefano Stabellini  2021-11-23   993  		 */
5b3353949e89d4 Luca Miccio         2022-05-13   994  		if (!v) {
36e8f60f0867d3 Stefano Stabellini  2021-11-23   995  			err = -ENOENT;
36e8f60f0867d3 Stefano Stabellini  2021-11-23   996  			goto out_error;
36e8f60f0867d3 Stefano Stabellini  2021-11-23   997  		}
5b3353949e89d4 Luca Miccio         2022-05-13   998  		if (v == ~0ULL) {
5b3353949e89d4 Luca Miccio         2022-05-13   999  			wait = true;
5b3353949e89d4 Luca Miccio         2022-05-13  1000  		} else {
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1001  			/* Avoid truncation on 32-bit. */
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1002  #if BITS_PER_LONG == 32
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1003  			if (v > ULONG_MAX) {
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1004  				pr_err("%s: cannot handle HVM_PARAM_STORE_PFN=%llx > ULONG_MAX\n",
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1005  				       __func__, v);
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1006  				err = -EINVAL;
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1007  				goto out_error;
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1008  			}
36e8f60f0867d3 Stefano Stabellini  2021-11-23  1009  #endif
5f51042f876b88 Julien Grall        2015-08-07  1010  			xen_store_gfn = (unsigned long)v;
ecc635f90adfe1 Stefano Stabellini  2012-09-14  1011  			xen_store_interface =
7d567928db59cb Julien Grall        2015-05-05  1012  				xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
7d567928db59cb Julien Grall        2015-05-05  1013  					  XEN_PAGE_SIZE);
5b3353949e89d4 Luca Miccio         2022-05-13  1014  			if (xen_store_interface->connection != XENSTORE_CONNECTED)
5b3353949e89d4 Luca Miccio         2022-05-13  1015  				wait = true;
5b3353949e89d4 Luca Miccio         2022-05-13  1016  		}
5b3353949e89d4 Luca Miccio         2022-05-13  1017  		if (wait) {
5b3353949e89d4 Luca Miccio         2022-05-13  1018  			err = bind_evtchn_to_irqhandler(xen_store_evtchn,
5b3353949e89d4 Luca Miccio         2022-05-13  1019  							xenbus_late_init,
5b3353949e89d4 Luca Miccio         2022-05-13  1020  							0, "xenstore_late_init",
5b3353949e89d4 Luca Miccio         2022-05-13  1021  							&xb_waitq);
5b3353949e89d4 Luca Miccio         2022-05-13  1022  			if (err < 0) {
5b3353949e89d4 Luca Miccio         2022-05-13  1023  				pr_err("xenstore_late_init couldn't bind irq err=%d\n",
5b3353949e89d4 Luca Miccio         2022-05-13  1024  				       err);
5b3353949e89d4 Luca Miccio         2022-05-13 @1025  				return err;
5b3353949e89d4 Luca Miccio         2022-05-13  1026  			}
5b3353949e89d4 Luca Miccio         2022-05-13  1027  
5b3353949e89d4 Luca Miccio         2022-05-13  1028  			xs_init_irq = err;
5b3353949e89d4 Luca Miccio         2022-05-13  1029  		}
ecc635f90adfe1 Stefano Stabellini  2012-09-14  1030  		break;
ecc635f90adfe1 Stefano Stabellini  2012-09-14  1031  	default:
ecc635f90adfe1 Stefano Stabellini  2012-09-14  1032  		pr_warn("Xenstore state unknown\n");
ecc635f90adfe1 Stefano Stabellini  2012-09-14  1033  		break;
a947f0f8f7012a Stefano Stabellini  2010-10-04  1034  	}
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  1035  
3499ba8198cad4 David Woodhouse     2021-01-13  1036  	/*
3499ba8198cad4 David Woodhouse     2021-01-13  1037  	 * HVM domains may not have a functional callback yet. In that
3499ba8198cad4 David Woodhouse     2021-01-13  1038  	 * case let xs_init() be called from xenbus_probe(), which will
3499ba8198cad4 David Woodhouse     2021-01-13  1039  	 * get invoked at an appropriate time.
3499ba8198cad4 David Woodhouse     2021-01-13  1040  	 */
3499ba8198cad4 David Woodhouse     2021-01-13  1041  	if (xen_store_domain_type != XS_HVM) {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  1042  		err = xs_init();
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  1043  		if (err) {
283c0972d53769 Joe Perches         2013-06-28  1044  			pr_warn("Error initializing xenstore comms: %i\n", err);
2de06cc1f18d63 Ian Campbell        2009-02-09  1045  			goto out_error;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  1046  		}
3499ba8198cad4 David Woodhouse     2021-01-13  1047  	}
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  1048  
16f1cf3ba73032 Boris Ostrovsky     2015-04-29  1049  	if ((xen_store_domain_type != XS_LOCAL) &&
16f1cf3ba73032 Boris Ostrovsky     2015-04-29  1050  	    (xen_store_domain_type != XS_UNKNOWN))
16f1cf3ba73032 Boris Ostrovsky     2015-04-29  1051  		xen_resume_notifier_register(&xenbus_resume_nb);
16f1cf3ba73032 Boris Ostrovsky     2015-04-29  1052  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
