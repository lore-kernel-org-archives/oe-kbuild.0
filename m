Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53648332919
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 07:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771485131; cv=none; b=qZpoSuyijX+GNjNHkmbddzuq953Si6gZ/3ozDZXX3a/6+wezZryOhrrS98bEgyoVNsnBFCR5/shz5+mIwUdPr0IAhhoem9FSThekzIlZ+GAqMUEjpjKQwafMGh2eianw8bsBY2YoLH+s9K/BVR+bqVwiULdBrPeysMGr5+W6dEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771485131; c=relaxed/simple;
	bh=s3pcYxTN6pNiFdwhSuxUgJESB7S9WAt9L1M4abRykII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pKYN1cuJk9YNbkS8SNAXgmfy5a/MTYNclb4SB9B/y/kQvPuYdWo9VsHYPxn+HqWnUkKsE5uOQ0+mjJCJpsNcjhE+Ug2tWVhtyrXwZs0A+JwOApzAnfi6ZUDh+VtD41iRaBALeeeSkWhrMMZ6as5Qbaj8UHk4asA5VLeO7pv2ifQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cuFwA6iS; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cuFwA6iS"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43621bf67ceso392787f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 23:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771485128; x=1772089928; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mNljJmo8xYMg1FSiw5iNlLCoBCy730ouXhyirQsq0Y=;
        b=cuFwA6iStOrUu7Y/gbiAPkz6sAZlgr3YF2nuqSFmLtApkNuHQkrUw27lnlSKhHMx3N
         DKNbw7bRjyCOg0JU2WwU+AE8Xta0jeic9QbEWHvCsLH8Dk4UzR8l6Mu0jWaj7MgyhuS4
         3GckkABXAkAAe0mUkSiXcXTuc5VenC9tAh0L5iYSCwOlrv05UDMqs+FpX4GlQNa5n9TH
         0REr4Dc5qlNIc1trwXruyefdRz9Zpj+KS8bOmwl+gIEW0NnKGXj7vRbxgToncyj3tBD+
         Q5lUrBfvDRPCgOmNxaUdOgCPPSgDBYUjaY+ByluKLeGVd5CgProYP/5TuocKl19pg2AL
         smgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771485128; x=1772089928;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mNljJmo8xYMg1FSiw5iNlLCoBCy730ouXhyirQsq0Y=;
        b=jQgZZJrxZ2oTh4KKqxUKBa5OgtERPvFqmkR7+DTxpuVZ+HCyqzCTAaIOE6xomm3lsc
         EXM4E54VsTXGfL/e4Sfa3VoDVcP+prxoTO7SYXKc6bT3qrP6pkaU+kUGesQripeqmpXd
         pccgH8oZYj/Hxzvk/R1PJY9qu7v2pUxajezDFpBRNQoOLUm6YJ8j1gCQneCFSGWm20EV
         nYPKp6tel8YJbmXKctTZ1r5FuhhC5PhpEbIYIcN75a9WRfVYIh0Mq/W2oL/CM6GF0mNw
         DJSSBOS3NNGZMVEK27qZWNbwlwfOWU3p6KC//w993suHX0lMK+QdotnNJcjSNdJgk9lF
         lZJA==
X-Gm-Message-State: AOJu0YyDj2JmQ1EGy7aLCd+mVYP87TU61HZZvdb7H3+sy+bvy6+LUwOJ
	xBt2k4+cVb7pXooMD3qN9gLBrLvKQil5gmVf+b8uUgBbw3uNlnwXtg3o3sBg1n1dofj4mZHZKDX
	NZnyM
X-Gm-Gg: AZuq6aKd+V4W/7cpLfh1ZdDnryAtxmxob8+WNmeeo0kGbUJ5/pqQAsnQiKJErSX8zlP
	DE0R0cbTCHLv2K04SQQTA3JAAmp9kdPCdWMD1L1/P/mmpvuF+oDV3LuqL8oo8TEAoqMUJSZMNqm
	1lCrm2D+go+TbU1MWrDvwlZk36PtSOFbf38Blr6GR8M+fD+9mUQ8ohnIw4JKBlCHqJX9Y5Gc1ap
	o2zYhPdkBa/687xJeBwBxnrLsyqrQRePTyHG/3Y6wzvSRTdR8aJ31Z4MAgdAGYkauFXiq3ANMIv
	U50mjZ8lqkCA5UZeKA0z7mDEOcas2VsgkCSVe3w8cgz5Ukotowdy19U3c/C5NztJEriWlEwx3mh
	J2bQwdvABF8kwbjDciQvTLahpK+/a5N28CWmxzhMrItOwOSPDOv2D18Y9jUV2cnDUiOPMRTt9mj
	H4ULIdzhp+iMvEJ6EPQ95ENL3wS2yI
X-Received: by 2002:a05:600c:4e93:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-48379bbcbd0mr277963325e9.12.1771485128222;
        Wed, 18 Feb 2026 23:12:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm675803505e9.0.2026.02.18.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 23:12:07 -0800 (PST)
Date: Thu, 19 Feb 2026 10:12:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wei Wang <wei.w.wang@hotmail.com>,
	bhelgaas@google.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
	akpm@linux-foundation.org, bp@alien8.de, rdunlap@infradead.org,
	alex@shazbot.org, kevin.tian@intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	wei.w.wang@hotmail.com
Subject: Re: [PATCH v5 3/6] PCI: Consolidate delimiter handling into
 pci_dev_str_match()
Message-ID: <202602161621.2nyGIEhM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI2PR01MB439352E0D54243099CAAA118DC6CA@SI2PR01MB4393.apcprd01.prod.exchangelabs.com>
Message-ID: <20260219071204.e2_pOXxypyS0SA17wm6GAPRd4vZD4NlbxbUozDuq-v0@z>

Hi Wei,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Wang/PCI-Validate-ACS-enable-flags-against-device-specific-ACS-capabilities/20260216-103055
base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
patch link:    https://lore.kernel.org/r/SI2PR01MB439352E0D54243099CAAA118DC6CA%40SI2PR01MB4393.apcprd01.prod.exchangelabs.com
patch subject: [PATCH v5 3/6] PCI: Consolidate delimiter handling into pci_dev_str_match()
config: x86_64-randconfig-r072-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161621.2nyGIEhM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602161621.2nyGIEhM-lkp@intel.com/

smatch warnings:
drivers/pci/pci.c:430 pci_dev_str_match() warn: sscanf doesn't return error codes

vim +430 drivers/pci/pci.c

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  343  /**
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  344   * pci_dev_str_match - test if a string matches a device
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  345   * @dev: the PCI device to test
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  346   * @p: string to match the device against
40549484c434de Wei Wang         2026-02-16  347   * @endptr: pointer to the string after the match, with the delimiter skipped
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  348   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  349   * Test if a string (typically from a kernel parameter) matches a specified
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  350   * PCI device. The string may be of one of the following formats:
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  351   *
45db33709ccc73 Logan Gunthorpe  2018-07-30  352   *   [<domain>:]<bus>:<device>.<func>[/<device>.<func>]*
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  353   *   pci:<vendor>:<device>[:<subvendor>:<subdevice>]
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  354   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  355   * The first format specifies a PCI bus/device/function address which
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  356   * may change if new hardware is inserted, if motherboard firmware changes,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  357   * or due to changes caused in kernel parameters. If the domain is
45db33709ccc73 Logan Gunthorpe  2018-07-30  358   * left unspecified, it is taken to be 0.  In order to be robust against
45db33709ccc73 Logan Gunthorpe  2018-07-30  359   * bus renumbering issues, a path of PCI device/function numbers may be used
45db33709ccc73 Logan Gunthorpe  2018-07-30  360   * to address the specific device.  The path for a device can be determined
45db33709ccc73 Logan Gunthorpe  2018-07-30  361   * through the use of 'lspci -t'.
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  362   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  363   * The second format matches devices using IDs in the configuration
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  364   * space which may match multiple devices in the system. A value of 0
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  365   * for any field will match all devices. (Note: this differs from
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  366   * in-kernel code that uses PCI_ANY_ID which is ~0; this is for
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  367   * legacy reasons and convenience so users don't have to specify
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  368   * FFFFFFFFs on the command line.)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  369   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  370   * Returns 1 if the string matches the device, 0 if it does not and
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  371   * a negative error code if the string cannot be parsed.
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  372   */
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  373  static int pci_dev_str_match(struct pci_dev *dev, const char *p,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  374  			     const char **endptr)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  375  {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  376  	int ret;
45db33709ccc73 Logan Gunthorpe  2018-07-30  377  	int count;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  378  	unsigned short vendor, device, subsystem_vendor, subsystem_device;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  379  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  380  	if (strncmp(p, "pci:", 4) == 0) {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  381  		/* PCI vendor/device (subvendor/subdevice) IDs are specified */
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  382  		p += 4;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  383  		ret = sscanf(p, "%hx:%hx:%hx:%hx%n", &vendor, &device,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  384  			     &subsystem_vendor, &subsystem_device, &count);
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  385  		if (ret != 4) {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  386  			ret = sscanf(p, "%hx:%hx%n", &vendor, &device, &count);
40549484c434de Wei Wang         2026-02-16  387  			if (ret != 2) {
40549484c434de Wei Wang         2026-02-16  388  				ret = -EINVAL;
40549484c434de Wei Wang         2026-02-16  389  				goto not_found;
40549484c434de Wei Wang         2026-02-16  390  			}
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  391  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  392  			subsystem_vendor = 0;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  393  			subsystem_device = 0;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  394  		}

At this point ret is either 2 or 4.

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  395  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  396  		p += count;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  397  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  398  		if ((!vendor || vendor == dev->vendor) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  399  		    (!device || device == dev->device) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  400  		    (!subsystem_vendor ||
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  401  			    subsystem_vendor == dev->subsystem_vendor) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  402  		    (!subsystem_device ||
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  403  			    subsystem_device == dev->subsystem_device))
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  404  			goto found;

No imagine that we don't goto found.

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  405  	} else {
45db33709ccc73 Logan Gunthorpe  2018-07-30  406  		/*
45db33709ccc73 Logan Gunthorpe  2018-07-30  407  		 * PCI Bus, Device, Function IDs are specified
45db33709ccc73 Logan Gunthorpe  2018-07-30  408  		 * (optionally, may include a path of devfns following it)
45db33709ccc73 Logan Gunthorpe  2018-07-30  409  		 */
45db33709ccc73 Logan Gunthorpe  2018-07-30  410  		ret = pci_dev_str_match_path(dev, p, &p);
45db33709ccc73 Logan Gunthorpe  2018-07-30  411  		if (ret < 0)
40549484c434de Wei Wang         2026-02-16  412  			goto not_found;
45db33709ccc73 Logan Gunthorpe  2018-07-30  413  		else if (ret)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  414  			goto found;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  415  	}
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  416  
40549484c434de Wei Wang         2026-02-16  417  not_found:
40549484c434de Wei Wang         2026-02-16  418  	if (ret < 0)
40549484c434de Wei Wang         2026-02-16  419  		pr_err("PCI: Can't parse parameter: %s\n", p);
40549484c434de Wei Wang         2026-02-16  420  
40549484c434de Wei Wang         2026-02-16  421  	if (*p != ';' && *p != ',') {
40549484c434de Wei Wang         2026-02-16  422  		/*
40549484c434de Wei Wang         2026-02-16  423  		 * End of param or invalid format. Return -ENODEV so the caller
40549484c434de Wei Wang         2026-02-16  424  		 * stops parsing.
40549484c434de Wei Wang         2026-02-16  425  		 */
40549484c434de Wei Wang         2026-02-16  426  		return -ENODEV;
40549484c434de Wei Wang         2026-02-16  427  	}
40549484c434de Wei Wang         2026-02-16  428  
40549484c434de Wei Wang         2026-02-16  429  	*endptr = p + 1;
40549484c434de Wei Wang         2026-02-16 @430  	return ret;

It should return 0 here but instead it returns 2 or 4.

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  431  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  432  found:
40549484c434de Wei Wang         2026-02-16  433  	*endptr = *p == '\0' ? p : p + 1;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  434  	return 1;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  435  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

