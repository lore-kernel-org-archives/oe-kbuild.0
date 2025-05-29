Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A420B806
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748559911; cv=none; b=hrwXDVYIfAYeDSaFshqTT1X3BP6dyABxoI+ZQi0dkmaNe9Qlo0VdUq8ExQTMw4XtQVSzYij0VqeOtX7BdoMyUdfSL/KRUnY5K3rwzw0NQq3ghyTQYnzGOTRR5wP0BDebv53TN5BSvsXbIHwflOzMx/0lk1OSfIWXRpZPH+g4+wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748559911; c=relaxed/simple;
	bh=F6tCowfmzf4/Db0BN2vCGeVzxpft9eOW6neZ+KM1/Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JE/uL6DSnmA30KMlDQv0X+pG2mOygTg9lppSzmzPmQWfstsxfVXOKx5gypD6TtpEfDxy/Ddq5ZGvqxDjlwL3Wto40QrCsQiOW3GOyTx1/e1MkJcKNd1GoXHmpP44YJXRFKDRxOEICD9n6FJMgxo18rGXxXWX+0TNdW+NY8GAXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3vX1fGd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3vX1fGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748559909; x=1780095909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6tCowfmzf4/Db0BN2vCGeVzxpft9eOW6neZ+KM1/Mw=;
  b=H3vX1fGdZq0+hGKAyc97uoTruM2JLXT2MeN1L5LRFJxw7OL6YTPyuuEL
   Fh5VvouKUzQRmzXAiQ/x6gDeTteW8qD8aDC72KQ1cj/z24a1Bkgg1Z88J
   5PuM8CdY4Q+QyMM7H4hg9l45xHUJ0OIXijlR/21/5DvqOvz2TxV6EIb7h
   /Fs3Y9vv8ZG/KhWr2tzYGqmSx2nl9xQKkY6S9OdUdP+NnDHOxB6LRIVIJ
   pwL9cxfaWLtwQFB8KUjAwbjovJZPLqv7lf3J8H3+pZxcdLsdtm8taQII7
   vSHZCseXFrEm2p+ehIxyCwCAo7gxH8r06w0cZVtarHqEU7SV7bTgh/gC5
   A==;
X-CSE-ConnectionGUID: 1YvExtGGTruHYzZ6ws/ulQ==
X-CSE-MsgGUID: x5mXjc7ZRSi9w377tO/7IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="53268655"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="53268655"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 16:05:09 -0700
X-CSE-ConnectionGUID: CaCmGMQhS7yq1ccWgGVOfQ==
X-CSE-MsgGUID: GfcVjNpOQBi4/MEMVoPtsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="148564671"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2025 16:05:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKmJ7-000XAu-1V;
	Thu, 29 May 2025 23:05:05 +0000
Date: Fri, 30 May 2025 07:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <202505300736.rrz4tZ29-lkp@intel.com>
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
In-Reply-To: <20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600@pengutronix.de>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600@pengutronix.de>
TO: Marco Felsch <m.felsch@pengutronix.de>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/firmware_loader-expand-firmware-error-codes-with-skip-error/20250529-061458
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600%40pengutronix.de
patch subject: [PATCH v2 4/4] Input: Add TouchNetix aXiom I2C Touchscreen support
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: m68k-randconfig-r073-20250530 (https://download.01.org/0day-ci/archive/20250530/202505300736.rrz4tZ29-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505300736.rrz4tZ29-lkp@intel.com/

New smatch warnings:
drivers/input/touchscreen/touchnetix_axiom.c:2141 axiom_zero_volatile_mem() error: uninitialized symbol 'buf'.

Old smatch warnings:
drivers/input/touchscreen/touchnetix_axiom.c:2143 axiom_zero_volatile_mem() error: uninitialized symbol 'buf'.

vim +/buf +2141 drivers/input/touchscreen/touchnetix_axiom.c

871c0ce3e5e95c Marco Felsch 2025-05-29  2125  
871c0ce3e5e95c Marco Felsch 2025-05-29  2126  static int axiom_zero_volatile_mem(struct axiom_data *ts)
871c0ce3e5e95c Marco Felsch 2025-05-29  2127  {
871c0ce3e5e95c Marco Felsch 2025-05-29  2128  	int ret, size;
871c0ce3e5e95c Marco Felsch 2025-05-29  2129  	u8 *buf;
871c0ce3e5e95c Marco Felsch 2025-05-29  2130  
871c0ce3e5e95c Marco Felsch 2025-05-29  2131  	/* Zero out the volatile memory except for the user content in u04 */
871c0ce3e5e95c Marco Felsch 2025-05-29  2132  	ret = axiom_u04_get(ts, &buf);
871c0ce3e5e95c Marco Felsch 2025-05-29  2133  	if (ret < 0)
871c0ce3e5e95c Marco Felsch 2025-05-29  2134  		return ret;
871c0ce3e5e95c Marco Felsch 2025-05-29  2135  	size = ret;
871c0ce3e5e95c Marco Felsch 2025-05-29  2136  
871c0ce3e5e95c Marco Felsch 2025-05-29  2137  	ret = axiom_u02_fillconfig(ts);
871c0ce3e5e95c Marco Felsch 2025-05-29  2138  	if (ret)
871c0ce3e5e95c Marco Felsch 2025-05-29  2139  		goto out;
871c0ce3e5e95c Marco Felsch 2025-05-29  2140  
871c0ce3e5e95c Marco Felsch 2025-05-29 @2141  	ret = axiom_u04_set(ts, buf, size);
871c0ce3e5e95c Marco Felsch 2025-05-29  2142  out:
871c0ce3e5e95c Marco Felsch 2025-05-29  2143  	kfree(buf);
871c0ce3e5e95c Marco Felsch 2025-05-29  2144  	return ret;
871c0ce3e5e95c Marco Felsch 2025-05-29  2145  }
871c0ce3e5e95c Marco Felsch 2025-05-29  2146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
