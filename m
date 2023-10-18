Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4839E18649
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ipCsiJgN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso9009835e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697623077; x=1698227877; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U0FUoFjkwulGcN5Yd0QfauAPgIYEfCmr50tJH/PkM64=;
        b=ipCsiJgNrQrbcQOQ+w7482pSHjMaM8ROmkHECqA45BnMcpCHrvi9v0uy36vhgNwI+U
         sT10yFK0hygO08/rNJ1OJNWI+z29q0I+owcBImai4o1WoBNDOIMiiqhi7T2LeMyJSTQ0
         I27kx3e7XFga2RraQmGQ09uNXOk/fKUAqxhyW9sg/4QmHsf+ZUmn5E5A0aMGaizgRj+p
         cLAWAOPHxstkMmeiPhHFsyrTL6I9GRTci57FKvmMdlg3rfuTBKHvtYInS9ucPqKSbNjW
         Gbgsh6QZoeVGHz4CxDz6tC5UzZgdRPWOEUtxMgeh9l532/2q6ZWi8BfYJvFpjuPICJmf
         OBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697623077; x=1698227877;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0FUoFjkwulGcN5Yd0QfauAPgIYEfCmr50tJH/PkM64=;
        b=Vq6xYY6hdKUuFufQh8Kg0a89f94HcCUrY81W7gf/flmtUnGcOVBkmgx1gDel8wFyJs
         D3xCrvpC+FIVInjNydsSstWP1ezsfVn4R0i/QeZez/N1rRXLqMmFhVPQWaSZig4c7HEt
         BFJ7f9Yrso51WQX5WLW5mby3yzvba0jwXoKuuiTEYpm9sBgLLVbJmeGEy1Pi12sp8TvV
         rFT85ExBAhPXamX5f0Fpc0adURfpcu4jlD0G9n9N/a8wDge59CZ5jgzEPP8gkGUED/4j
         xCYVKOMUKCBeoyY3VHz9n7efYhONVV2lg1UFi9lXDfyxxZBM87hKqcc36fqnWuMa8rsQ
         yOqw==
X-Gm-Message-State: AOJu0Yx/+zvziMqqmXP/v9P0mRGTzdNg2qSe34StapMsOf/JOGZ+DI/r
	blZ/572O+oqcXOsP2BreHJMvdv1fXWQqcOddKhA=
X-Google-Smtp-Source: AGHT+IFJxpqoxxLsyl88u55j0gWXsPQanXw3Nd+LcqcruMjexj18xHda/GEXbK0Yxx6AXK0wLN/5MA==
X-Received: by 2002:a05:600c:a39c:b0:407:4126:f71c with SMTP id hn28-20020a05600ca39c00b004074126f71cmr4272587wmb.6.1697623077252;
        Wed, 18 Oct 2023 02:57:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y34-20020a05600c342200b004063977eccesm1217568wmp.42.2023.10.18.02.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 02:57:56 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:57:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 21/23] drivers/parport/share.c:486
 parport_register_port() warn: '&tmp->full_list' not removed from list
Message-ID: <2171426a-1784-41e9-8614-2d3a7a602831@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   5ab2ef71d3e0a4b8e5839b1850ccdd236695e2e0
commit: 6c9334e9230e552c795eebd34e6b208c6df693fe [21/23] parport: Use kasprintf() instead of fixed buffer formatting
config: i386-randconfig-141-20231017 (https://download.01.org/0day-ci/archive/20231018/202310180809.hepZB9k6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310180809.hepZB9k6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310180809.hepZB9k6-lkp@intel.com/

New smatch warnings:
drivers/parport/share.c:486 parport_register_port() warn: '&tmp->full_list' not removed from list

Old smatch warnings:
drivers/parport/share.c:826 parport_register_dev_model() warn: possible memory leak of 'par_dev'

vim +486 drivers/parport/share.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  434  struct parport *parport_register_port(unsigned long base, int irq, int dma,
^1da177e4c3f41 Linus Torvalds      2005-04-16  435  				      struct parport_operations *ops)
^1da177e4c3f41 Linus Torvalds      2005-04-16  436  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  437  	struct list_head *l;
^1da177e4c3f41 Linus Torvalds      2005-04-16  438  	struct parport *tmp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  439  	int num;
^1da177e4c3f41 Linus Torvalds      2005-04-16  440  	int device;
6fa45a22689722 Sudip Mukherjee     2015-05-20  441  	int ret;
^1da177e4c3f41 Linus Torvalds      2005-04-16  442  
c32df4e182e5bf Alexandru Gheorghiu 2013-07-03  443  	tmp = kzalloc(sizeof(struct parport), GFP_KERNEL);
47ec57ec0e5283 Sudip Mukherjee     2015-10-28  444  	if (!tmp)
^1da177e4c3f41 Linus Torvalds      2005-04-16  445  		return NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  446  
^1da177e4c3f41 Linus Torvalds      2005-04-16  447  	/* Init our structure */
^1da177e4c3f41 Linus Torvalds      2005-04-16  448  	tmp->base = base;
^1da177e4c3f41 Linus Torvalds      2005-04-16  449  	tmp->irq = irq;
^1da177e4c3f41 Linus Torvalds      2005-04-16  450  	tmp->dma = dma;
^1da177e4c3f41 Linus Torvalds      2005-04-16  451  	tmp->muxport = tmp->daisy = tmp->muxsel = -1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  452  	tmp->modes = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  453  	INIT_LIST_HEAD(&tmp->list);
^1da177e4c3f41 Linus Torvalds      2005-04-16  454  	tmp->devices = tmp->cad = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  455  	tmp->flags = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  456  	tmp->ops = ops;
^1da177e4c3f41 Linus Torvalds      2005-04-16  457  	tmp->physport = tmp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  458  	memset(tmp->probe_info, 0, 5 * sizeof(struct parport_device_info));
^1da177e4c3f41 Linus Torvalds      2005-04-16  459  	rwlock_init(&tmp->cad_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  460  	spin_lock_init(&tmp->waitlist_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  461  	spin_lock_init(&tmp->pardevice_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  462  	tmp->ieee1284.mode = IEEE1284_MODE_COMPAT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  463  	tmp->ieee1284.phase = IEEE1284_PH_FWD_IDLE;
a529f1505b6fac Thomas Gleixner     2010-09-07  464  	sema_init(&tmp->ieee1284.irq, 0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  465  	tmp->spintime = parport_default_spintime;
^1da177e4c3f41 Linus Torvalds      2005-04-16  466  	atomic_set(&tmp->ref_count, 1);
^1da177e4c3f41 Linus Torvalds      2005-04-16  467  	INIT_LIST_HEAD(&tmp->full_list);
^1da177e4c3f41 Linus Torvalds      2005-04-16  468  
^1da177e4c3f41 Linus Torvalds      2005-04-16  469  	/* Search for the lowest free parport number. */
^1da177e4c3f41 Linus Torvalds      2005-04-16  470  
^1da177e4c3f41 Linus Torvalds      2005-04-16  471  	spin_lock(&full_list_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  472  	for (l = all_ports.next, num = 0; l != &all_ports; l = l->next, num++) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  473  		struct parport *p = list_entry(l, struct parport, full_list);
^1da177e4c3f41 Linus Torvalds      2005-04-16  474  		if (p->number != num)
^1da177e4c3f41 Linus Torvalds      2005-04-16  475  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  476  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  477  	tmp->portnum = tmp->number = num;
^1da177e4c3f41 Linus Torvalds      2005-04-16  478  	list_add_tail(&tmp->full_list, l);

tmp gets added to the all_ports list here

^1da177e4c3f41 Linus Torvalds      2005-04-16  479  	spin_unlock(&full_list_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  480  
^1da177e4c3f41 Linus Torvalds      2005-04-16  481  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  482  	 * Now that the portnum is known finish doing the Init.
^1da177e4c3f41 Linus Torvalds      2005-04-16  483  	 */
6c9334e9230e55 Andy Shevchenko     2023-10-16  484  	tmp->name = kasprintf(GFP_KERNEL, "parport%d", tmp->portnum);
6c9334e9230e55 Andy Shevchenko     2023-10-16  485  	if (!tmp->name) {
6c9334e9230e55 Andy Shevchenko     2023-10-16 @486  		kfree(tmp);

This kfree will lead to a use after free.  Also tmp is such a terribly
confusing name for something that isn't temporary at all.

6c9334e9230e55 Andy Shevchenko     2023-10-16  487  		return NULL;
6c9334e9230e55 Andy Shevchenko     2023-10-16  488  	}
6c9334e9230e55 Andy Shevchenko     2023-10-16  489  	dev_set_name(&tmp->bus_dev, tmp->name);
6fa45a22689722 Sudip Mukherjee     2015-05-20  490  	tmp->bus_dev.bus = &parport_bus_type;
6fa45a22689722 Sudip Mukherjee     2015-05-20  491  	tmp->bus_dev.release = free_port;
6fa45a22689722 Sudip Mukherjee     2015-05-20  492  	tmp->bus_dev.type = &parport_device_type;
^1da177e4c3f41 Linus Torvalds      2005-04-16  493  
^1da177e4c3f41 Linus Torvalds      2005-04-16  494  	for (device = 0; device < 5; device++)
^1da177e4c3f41 Linus Torvalds      2005-04-16  495  		/* assume the worst */
^1da177e4c3f41 Linus Torvalds      2005-04-16  496  		tmp->probe_info[device].class = PARPORT_CLASS_LEGACY;
^1da177e4c3f41 Linus Torvalds      2005-04-16  497  
^1da177e4c3f41 Linus Torvalds      2005-04-16  498  	tmp->waithead = tmp->waittail = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  499  
6fa45a22689722 Sudip Mukherjee     2015-05-20  500  	ret = device_register(&tmp->bus_dev);
6fa45a22689722 Sudip Mukherjee     2015-05-20  501  	if (ret) {
6fa45a22689722 Sudip Mukherjee     2015-05-20  502  		put_device(&tmp->bus_dev);
6fa45a22689722 Sudip Mukherjee     2015-05-20  503  		return NULL;
6fa45a22689722 Sudip Mukherjee     2015-05-20  504  	}
6fa45a22689722 Sudip Mukherjee     2015-05-20  505  
^1da177e4c3f41 Linus Torvalds      2005-04-16  506  	return tmp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  507  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

