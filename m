Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF7242D8B
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769849461; cv=none; b=RJlBTuW4C1p+uhddZgn5bu+OGgl8bYs/NRooYuDFN4Mxky4qjKzObBdhuEPEyUTL2v7ucLET/wFaOsTpNqlERYs372yxB5SUvdkzfT2I046M/87oYhu50j/r1ORacSToN2TkbzuDzAEZbhX6vvR+kZfU3zGdLwoxFhjj1q5NLJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769849461; c=relaxed/simple;
	bh=QJBmICWKYuN4750QkZ5j0vltvLRbyV457breqCIUAWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bCArlm3Sa3aSwZDg6Uw0S6yGWCpb0Q4d/hqMCI+a4S9jfjmD/5Hx4N/obrcPe7cbuN+EJulW7ATVASL51/7s5j19d1/TD+FJ9KkAiIWOz0WJ1tOqk7pu0UdX0r9RSxKU4s9DCSYC7o3XcP93J12qyMPzH+A9ZUx+J7/o1TtB1XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWFuadJE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWFuadJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769849459; x=1801385459;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QJBmICWKYuN4750QkZ5j0vltvLRbyV457breqCIUAWM=;
  b=jWFuadJETHb+GlksrxNOzgDURDvyseasEs7mdj6TWSd53WFqDpFZmxCi
   MqXj7Xt3pUicoFAA3YfNEwNoifnP0ihkPTrJ3RrvWUK7JylJwYwuUJkLL
   lO7tAoG41/Evp/qq0xidOgIkBY4JuvriI3zh0U5hrm2aMROz4pL8F5ztT
   9HvCKqnGfDjDDh/RiqSi5BeaZLyAsxL2i8aNoPRUR+in7mQV89OjGmy+V
   DHEmTMrlwUV9fLwCY6BHpGCNHIZVA6EC982ICixnglzuxvFlUJv5U2FzG
   m28JXqsPVO03dkwJcU/B5QrBGYKk8yVueLf7Z9RPJJcjFDC4wnN84VxUF
   g==;
X-CSE-ConnectionGUID: Z5dhegi5R4CIb72V6nrSBw==
X-CSE-MsgGUID: 4Fa9yex3RDyN6rynDnePbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70990315"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70990315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 00:50:58 -0800
X-CSE-ConnectionGUID: kXBSQEpIR+OEX/H28Y26mw==
X-CSE-MsgGUID: 2Gj58sbpSXqB7Zjar3YC/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="246661012"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2026 00:50:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm6gw-00000000dqK-3BRW;
	Sat, 31 Jan 2026 08:50:54 +0000
Date: Sat, 31 Jan 2026 16:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
Message-ID: <202601311615.10yziOui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260129-i2c-xiic-v7-5-727e434897ef@nexthop.ai>
References: <20260129-i2c-xiic-v7-5-727e434897ef@nexthop.ai>
TO: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
TO: Michal Simek <monstr@monstr.eu>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Hi Abdurrahman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hussain-via-B4-Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/20260130-054653
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e434897ef%40nexthop.ai
patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/archive/20260131/202601311615.10yziOui-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: pm_runtime_get_sync() also returns 1 on success

vim +1539 drivers/i2c/busses/i2c-xiic.c

e1d5b6598cdc33 Richard Röjfors     2010-02-11  1528  
e190a0c389e601 Uwe Kleine-König    2023-05-08  1529  static void xiic_i2c_remove(struct platform_device *pdev)
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1530  {
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531  	struct device *dev = &pdev->dev;
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1532  	struct xiic_i2c *i2c = platform_get_drvdata(pdev);
36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533  	int ret;
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1534  
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1535  	/* remove adapter & data */
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1536  	i2c_del_adapter(&i2c->adap);
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1537  
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538  	ret = pm_runtime_get_sync(dev);
2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539  	if (ret)
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540  		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
810199f7315604 Uwe Kleine-König    2022-10-19  1541  			 ERR_PTR(ret));
810199f7315604 Uwe Kleine-König    2022-10-19  1542  	else
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1543  		xiic_deinit(i2c);
810199f7315604 Uwe Kleine-König    2022-10-19  1544  
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545  	pm_runtime_put_sync(dev);
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546  	pm_runtime_dont_use_autosuspend(dev);
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1547  }
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1548  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
