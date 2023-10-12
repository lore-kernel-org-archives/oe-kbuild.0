Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B180D274
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ex75U9Kx"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-503065c4b25so890800e87.1
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 23:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697090854; x=1697695654; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZOoS2NIW/QTbPh1ymy3s0H6UN6w6P/tuVIrs+qD8bA=;
        b=Ex75U9Kxr1ghOAFa7r9LDg8S/k6GWhdFXL3bvTAplTM/joxXjHllk6qtmRc9qbXv5v
         4kDHofPYb1FYpIYhtOg8SLt6RwM7OQSgJg0ifPzIOUDS7V4HaOHTwGbEKm7CjUlf4rnD
         LRvlqf/O4korvR1UFqDP5yqQzZ4jeRpkXFPGBShaO0RpMKO7e1D/6Gli230rJmus1dv5
         hxT/Uhw1FVMa+TyMMMlZcBA5jGP4vDFU4RmwsN+QX/IzJpQS5hG6JHR7/qbG7F1v1mNW
         Bl9F3ZywckO8O8cKwDJpalEg1Bz1rk3HLB+TC8kTjhi+iKVHiPvg73gxjQltlt3A3FF5
         XVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090854; x=1697695654;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZOoS2NIW/QTbPh1ymy3s0H6UN6w6P/tuVIrs+qD8bA=;
        b=jLETqlU0SoDEMqK7F0Rgf4kJh6dbL+exfdjQx+uD9jEmRjINYwh5fG31S0vvdDRMxX
         YON43gLZIdwSHeJ5pFHfAbROIoTeesnPl/++vc60cJVR2rzEQzJ7po6k0xVTfMIL2Chx
         QuauiYJ0YKSyi/6t0EhazN5GqwBuZXLlxeZczYZBaBp/VxNf9431G2yLle2xk0Zl3OQY
         NCEhMjiT0+bO2CaLArJXEiEyk4QxvZR5ukYlscVecwF6x71VWMlXs7WF23ri9EqBG2ep
         MzYYR0Ejks3z7kLILQbAgGq3GSjqUbWTHYP1xAoe1Qm1HQ/9cuf6Oh4VsJzIR49OK5Le
         zLfA==
X-Gm-Message-State: AOJu0Ywgu/INmrTdFUAdJ4E5pC/iwNRI+M7l9sRRRoQkQgXzbSr6+oQS
	G5qNmVayeBHjUec7fJ2d3bbHqLtRt0Ww/K+6XLs=
X-Google-Smtp-Source: AGHT+IH+6UvYOF+SJKXPI+fKpSoZhCxSBB59bj0WmKr4Q7glq4h6HH83kx4ru/mgEdEaz12bI+b3nw==
X-Received: by 2002:a05:6512:3e20:b0:502:9fce:b6cc with SMTP id i32-20020a0565123e2000b005029fceb6ccmr25784419lfv.11.1697090853907;
        Wed, 11 Oct 2023 23:07:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 15-20020a05600c028f00b004065d67c3c9sm18741858wmk.8.2023.10.11.23.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:07:33 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:07:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:feature_interrupters 2/4]
 drivers/usb/host/xhci-mem.c:1863 xhci_remove_secondary_interrupter() error:
 we previously assumed 'ir' could be null (see line 1855)
Message-ID: <9975a8f7-93a9-4679-b841-9f2d146831d2@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
head:   ffb84034ec49fd58a8cf4330897a6f2ca675c128
commit: cf4d2fd7c0e8db14a4e12b104137ccef56dc988d [2/4] xhci: add support to allocate several interrupters
config: x86_64-randconfig-161-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120314.9jZb7kip-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120314.9jZb7kip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310120314.9jZb7kip-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-mem.c:1863 xhci_remove_secondary_interrupter() error: we previously assumed 'ir' could be null (see line 1855)

vim +/ir +1863 drivers/usb/host/xhci-mem.c

cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1849  void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1850  {
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1851  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1852  	unsigned int intr_num;
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1853  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1854  	/* interrupter 0 is primary interrupter, don't touch it */
cf4d2fd7c0e8db Mathias Nyman 2023-01-09 @1855  	if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters)
                                                    ^^^
Check for NULL

cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1856  		xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1857  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1858  	/* fixme, should we check xhci->interrupter[intr_num] == ir */
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1859  	/* fixme locking */
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1860  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1861  	spin_lock_irq(&xhci->lock);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1862  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09 @1863  	intr_num = ir->intr_num;
                                                           ^^^^^^^^^^^^
Dereferenced without checking

cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1864  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1865  	xhci_remove_interrupter(xhci, ir);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1866  	xhci->interrupters[intr_num] = NULL;
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1867  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1868  	spin_unlock_irq(&xhci->lock);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1869  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1870  	xhci_free_interrupter(xhci, ir);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1871  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

