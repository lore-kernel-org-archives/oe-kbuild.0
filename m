Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47914F114
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729088573; cv=none; b=JhccqcglWCGt4nVpbwDrJeVsIudeoqIzDvunxahBRjeLAQcwjm0QpewzfnVfk3oy8+F8usLCP3EsV3X8L1dp7o/XOs3i9IqULnskbbJuvvqaQGivJNHiYZSEZXDEo7H5I8tlpmBgQXTL2eiSKkcOX46JWjejLVBVjGNZ+wOUpR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729088573; c=relaxed/simple;
	bh=LA0pu8STWhrlwxF7SSn7+T4mjCyoOQVosi4K6YAntQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TCuGx/DfrGTffEhnHyCMf2YmAbfWfxkOPYMsbbnc5JvljRHps6U3Hxk16aI8tizFCy+PVOp6ysyOSnSISWzjNXW3y81iM65UaV9DEooP+RgwvEwIFFi5ho/wPLqYjbG7291FqTHGmeMx0wANrGnqT8x75p4fiei+PDqlK/j6A9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wj6HQOAd; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wj6HQOAd"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99e3b3a411so168888666b.0
        for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729088569; x=1729693369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/t0JkfDSzWWrRpinUGYcX097nCcgBj9fkWkXnOoM92Q=;
        b=wj6HQOAd6hsOm9IBPisT2SyvXurKXOZTdSi46THInkILXSvUjc0AUgDa/utUUtOcHZ
         tjLPEWLWB7nFM1Zn/xMc2g2KpnHdtk/ruUmV2aUYpClnQvfF5wOxmS52CFgtcWqBounU
         U3uf7a2BHEgPaX72t3rAACJh3OnkoeAGtmjxVKaNLXlMu4MpPqi3SSVGErZSN+ebTOa4
         q7VtYrRVgv8fCd0QvZdpnf872bC2ftVMZfU97yejcqCgiaofJ+Bt6e5W+XKLH8+IMV/C
         fRjwoQAYCri01yBjQQ9rL6zsnaY7CSSmQhkMd7/NSWd9bYJDzAsgh6gWMBuqteEyt5nU
         4few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729088569; x=1729693369;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/t0JkfDSzWWrRpinUGYcX097nCcgBj9fkWkXnOoM92Q=;
        b=du0Ql2RYr2RSf2sgCTzKyZgsTpHn67u7tB5QOY34Sm6dbYtl+TZbQdSViCA0VtDqxA
         5N6VeGel8RQS5udgb8ZiCWbSQQazLp+IoTU/KssOA+p00JbPeKayCd1+m/mzDcPmJkCs
         svnWJhwZSHwx+iDKqnhuJGtnwQmyCjiNI634eNTOmhTIXYx31y5GEuouwTq2Cf6/fnW8
         pGgW4qF/ZYjfeEAPweA2wt6hruEAQvky4XTMxYJUVUs56Y11UEkBJUBj4Va58IqwtMev
         cLHP0R3MXaqJASi+Lk1oXxGk6S4Us9SCpeZVzjhxzJGa5JwOn1ghwRrEnBkd8YCz2QaD
         TMTg==
X-Gm-Message-State: AOJu0Yxo6FO4KFNEyBjxjananaQucTnuk7IOzmeiStakPurF3OxRTSUF
	T0B4jlCk2Wubkl5vZ4uUNmOrM27x6fVc5LzX0ioftOT1DJbDD6TQ5FvtS7Kb/n12j4BfeNMjOrG
	J
X-Google-Smtp-Source: AGHT+IFPtgPateumTcL4fx59JpiDJqrolmR5WA4S8dFYvswZfBVsUu8vANi78NaZCjg141Y1nAf4Mg==
X-Received: by 2002:a17:907:a0c9:b0:a99:ee23:dfb8 with SMTP id a640c23a62f3a-a99ee23e019mr1266522566b.20.1729088569175;
        Wed, 16 Oct 2024 07:22:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2971a48csm189681966b.6.2024.10.16.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:22:48 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:22:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vimal Agrawal <avimalin@gmail.com>,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, avimalin@gmail.com,
	vimal.agrawal@sophos.com
Subject: Re: [PATCH] misc: misc_minor_alloc to allocate ids for all
 dynamic/misc dynamic minors
Message-ID: <f38e017e-40ef-4241-8701-fc56c5c2d06d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014131416.27324-1-vimal.agrawal@sophos.com>

Hi Vimal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vimal-Agrawal/misc-misc_minor_alloc-to-allocate-ids-for-all-dynamic-misc-dynamic-minors/20241014-211915
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241014131416.27324-1-vimal.agrawal%40sophos.com
patch subject: [PATCH] misc: misc_minor_alloc to allocate ids for all dynamic/misc dynamic minors
config: sparc64-randconfig-r072-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161811.aIPEJHOt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410161811.aIPEJHOt-lkp@intel.com/

smatch warnings:
drivers/char/misc.c:89 misc_minor_alloc() error: uninitialized symbol 'ret'.

vim +/ret +89 drivers/char/misc.c

d52c84545e305b Vimal Agrawal    2024-10-14  66  static int misc_minor_alloc(int minor)
ab760791c0cfbb D Scott Phillips 2022-11-14  67  {
ab760791c0cfbb D Scott Phillips 2022-11-14  68  	int ret;
ab760791c0cfbb D Scott Phillips 2022-11-14  69  
d52c84545e305b Vimal Agrawal    2024-10-14  70  	if (minor == MISC_DYNAMIC_MINOR) {
d52c84545e305b Vimal Agrawal    2024-10-14  71  		/* allocate free id */
ab760791c0cfbb D Scott Phillips 2022-11-14  72  		ret = ida_alloc_max(&misc_minors_ida, DYNAMIC_MINORS - 1, GFP_KERNEL);
ab760791c0cfbb D Scott Phillips 2022-11-14  73  		if (ret >= 0) {
ab760791c0cfbb D Scott Phillips 2022-11-14  74  			ret = DYNAMIC_MINORS - ret - 1;
ab760791c0cfbb D Scott Phillips 2022-11-14  75  		} else {
ab760791c0cfbb D Scott Phillips 2022-11-14  76  			ret = ida_alloc_range(&misc_minors_ida, MISC_DYNAMIC_MINOR + 1,
ab760791c0cfbb D Scott Phillips 2022-11-14  77  				      MINORMASK, GFP_KERNEL);
ab760791c0cfbb D Scott Phillips 2022-11-14  78  		}
d52c84545e305b Vimal Agrawal    2024-10-14  79  	} else {
d52c84545e305b Vimal Agrawal    2024-10-14  80  		/* specific minor, check if it is in dynamic or misc dynamic range  */
d52c84545e305b Vimal Agrawal    2024-10-14  81  		if (minor < DYNAMIC_MINORS) {
d52c84545e305b Vimal Agrawal    2024-10-14  82  			minor = DYNAMIC_MINORS - minor - 1;
d52c84545e305b Vimal Agrawal    2024-10-14  83  			ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
d52c84545e305b Vimal Agrawal    2024-10-14  84  		}
d52c84545e305b Vimal Agrawal    2024-10-14  85  
d52c84545e305b Vimal Agrawal    2024-10-14  86  		if (minor > MISC_DYNAMIC_MINOR)
d52c84545e305b Vimal Agrawal    2024-10-14  87  			ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);

What about if minor is >= DYNAMIC_MINORS (128) but <= MISC_DYNAMIC_MINOR (255)?

d52c84545e305b Vimal Agrawal    2024-10-14  88  	}
ab760791c0cfbb D Scott Phillips 2022-11-14 @89  	return ret;
ab760791c0cfbb D Scott Phillips 2022-11-14  90  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

