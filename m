Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA0623A5
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 06:05:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a8-20020a05600c348800b003f17ddb04e3so545723wmq.2
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Apr 2023 23:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681970739; x=1684562739;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCpmCmELeNseZW4g/uShGTb1DAPdOrZmKydIY+4k81o=;
        b=CLeT08krANOqy2ske/4rAFOIstRHowykd7jOONsPRefztkI2F+h4nsRCPt3tkxZI4e
         sXB0BzbUysxr6Xaq3n7AWb4KV4lZiBw0dl8MG7q3ede+XzqBMVIrNDKicxeZhMve9Gu1
         n1KTraXfJ6oisN0KcjB16dt/AhTLpmKk7jV69NDu7cK1IlbnzNxhIA+sdvnBaGd5eIJj
         IB6nm0N7hISS7yqWg8LBuSr5SxdMC4OTBbU1SizrbLjYTeJO7C3Oqu7ICD0PwXa0is/u
         RvM6xpn99zyZc/8qPhOY+/yyWAS3dlArCdaITVwA0gQneDAOQNEz1EjirWajQ67f6sEa
         cbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681970739; x=1684562739;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCpmCmELeNseZW4g/uShGTb1DAPdOrZmKydIY+4k81o=;
        b=gqT4bCyjz+xM2hNSleFg0gQFBR4yRuyfUaXvwXRAjBYmA+OThDcEtNu5wo85CeFK32
         6C1BmFh/HTcKCYxqUGL3nlEszAPF8OInU/pTWvGW6xLzkLiK1toG1/M2WU14sVR0hUJW
         YnKc6SWxocat5JjH6vrUnsryKXqaOOsvMAsCd9na0xGHZxptG2qGe79cfMYBOhUBnv4u
         k0j3mfurctkQtaxNr+FBMud7JLIPD9ptVV4/A4+iOQgUr74VAV4FRL3Eup4j9KVQcNk9
         p15Uq9Fwg1NavCpSx+9orEOcmQG33jcJTYry2q2HvYPG/lMUVBU2l0rR+AIhUIEwiwo7
         QJ9w==
X-Gm-Message-State: AAQBX9cJa2H8DZ1UFp9gOPvCmdlu+vX2otKxWN2j76eJ1f8Ih4RYVV2G
	pMDZKzdYgxYs7AJqfyJpbAJY6GSuscSAskz+ztNW+eB1
X-Google-Smtp-Source: AKy350Yi4J/MWmP9kvC22eRTHeqdoddXitLvzwG0OVRsafA2q9egQ7PHeZHSf7xRbcnVAwhfsttqYA==
X-Received: by 2002:a05:600c:2212:b0:3ee:6d55:8b73 with SMTP id z18-20020a05600c221200b003ee6d558b73mr227805wml.29.1681970738946;
        Wed, 19 Apr 2023 23:05:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m36-20020a05600c3b2400b003edc4788fa0sm4330992wms.2.2023.04.19.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 23:05:38 -0700 (PDT)
Date: Thu, 20 Apr 2023 09:05:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Luca Miccio <lucmiccio@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: drivers/xen/xenbus/xenbus_probe.c:1025 xenbus_init() warn: missing
 unwind goto?
Message-ID: <1e675f28-e9db-41ee-be6c-3648677554c5@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23990b1affd2dc8f5e59048d4d4bef05f6e1c544
commit: 5b3353949e89d48b4faf54a9cc241ee5d70df615 xen: add support for initializing xenstore later as HVM domain
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304200845.w7m4kXZr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304200845.w7m4kXZr-lkp@intel.com/

smatch warnings:
drivers/xen/xenbus/xenbus_probe.c:1025 xenbus_init() warn: missing unwind goto?

vim +1025 drivers/xen/xenbus/xenbus_probe.c

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

These error paths set xen_store_domain_type = XS_UNKNOWN;

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

So this one probably should as well.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

