Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9585572691
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980790; cv=none; b=AOVjCVATav3htBAyOXggN87bnNlL6+Cjq+DEs1S2pVNVSyKXV0El6ZvhmWNZrdKqU0aDvzryeiUH4B5D3z/bKpGSeabFfIaCSjZ7SiQNBgGh1TeNM4RA/YblQsxO1augMjZuSDXneweWiU2gTGHhq+ooNynR/MyQ+05nbQ9vlGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980790; c=relaxed/simple;
	bh=VlhOOs+67gUOo76oPgVH1QFS8pFPgbJWFeyAZvvvvIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xk6rOZ8AtEqhRa2OG/i+Z1W4K2W0VeWZBClHpnVXd3F4IkLsQUtw1YH33ckTzYuNy31ZsHNJ36GeLeoqw7fRBg3qxKk8aWdzJs6VRseGGiiwFcRNSdVMZNPm0s94J74ncPZnN5P4boes+rzJfQht6geK+htasRYQOywKpN2jt/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdRMMSKr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdRMMSKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788980788; x=1820516788;
  h=date:from:to:cc:subject:message-id;
  bh=VlhOOs+67gUOo76oPgVH1QFS8pFPgbJWFeyAZvvvvIw=;
  b=LdRMMSKrh/gfPWAkawYzRj1hAgBiA+1l3v93PZSpu25Sllu6WSwyDB/V
   e/BWhbczwpoUDXKw+p6ysXWJC6/nw8Zk2ShOXdL36oHb7c5z8TU+Qh7vT
   SktUTQIC8DstjwUpQiKvfCnp0dRZV5ivnd+EoGzER1rb2Bl4MQ+zqG68z
   VjePEKrCh4kezEqX6Rz+yoTx7/nA/1AVM2/LKAmfV+YHAf1Kbcu56qP9v
   bkH0YcOcEVopp5toIDq3pnaovMjpon4CEk4c1K04DlCTMveAmts0fGOit
   QRzj86TjvO5DiPJbQNV5/3RkgtGofQtOvWPczqZhTeyYqcwL+ykFmLdev
   g==;
X-CSE-ConnectionGUID: ocFqswJrQvewtvqYAPu+Bw==
X-CSE-MsgGUID: IVxvjvReTuKapDEoYdSJZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="76977128"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="76977128"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 12:06:26 -0700
X-CSE-ConnectionGUID: +Xxt1i24TSCh5HQXgYinqA==
X-CSE-MsgGUID: jjoz/XkXQ6mY2eF6i13WKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="276646363"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Sep 2026 12:06:25 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Ncl-000000000pI-1Dzl;
	Wed, 09 Sep 2026 19:06:23 +0000
Date: Thu, 10 Sep 2026 03:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:7.2-main 213/213]
 drivers/tty/serial/8250/8250_mtk.c:437 mtk8250_runtime_suspend() warn:
 test_and_clear_bit() takes a bit number
Message-ID: <202609100256.0onKHOy1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   e2b8c6a7a01daa29f0109ecfd5d0fa93e27da8bf
commit: 6f53f04819bff1609acb1655c95238965736452b [213/213] serial: 8250_mtk: track busclk state to avoid bus error
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: loongarch-randconfig-r073-20260910 (https://download.01.org/0day-ci/archive/20260910/202609100256.0onKHOy1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609100256.0onKHOy1-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_mtk.c:437 mtk8250_runtime_suspend() warn: test_and_clear_bit() takes a bit number
drivers/tty/serial/8250/8250_mtk.c:454 mtk8250_runtime_resume() warn: test_and_set_bit() takes a bit number

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:51 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +437 drivers/tty/serial/8250/8250_mtk.c

b4756f4f0d773c Matthias Brugger 2014-09-09  431  
9db669f14fd829 Arnd Bergmann    2016-02-08  432  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
68e5fc4a255a7f Sascha Hauer     2015-04-27  433  {
68e5fc4a255a7f Sascha Hauer     2015-04-27  434  	struct mtk8250_data *data = dev_get_drvdata(dev);
e32a83c70cf987 Changqi Hu       2020-02-26  435  	struct uart_8250_port *up = serial8250_get_port(data->line);
68e5fc4a255a7f Sascha Hauer     2015-04-27  436  
6f53f04819bff1 Daniel Golle     2023-09-11 @437  	if (!test_and_clear_bit(MTK_UART_STATE_BIT_BUSCLK_EN, &data->state))
6f53f04819bff1 Daniel Golle     2023-09-11  438  		return 0;
6f53f04819bff1 Daniel Golle     2023-09-11  439  
e32a83c70cf987 Changqi Hu       2020-02-26  440  	/* wait until UART in idle status */
e32a83c70cf987 Changqi Hu       2020-02-26  441  	while
e32a83c70cf987 Changqi Hu       2020-02-26  442  		(serial_in(up, MTK_UART_DEBUG0));
e32a83c70cf987 Changqi Hu       2020-02-26  443  
d518314a1fa4e9 Daniel Golle     2025-09-16  444  	clk_disable_unprepare(data->uart_clk);
c1c325d703d347 Sascha Hauer     2015-04-27  445  	clk_disable_unprepare(data->bus_clk);
68e5fc4a255a7f Sascha Hauer     2015-04-27  446  
68e5fc4a255a7f Sascha Hauer     2015-04-27  447  	return 0;
68e5fc4a255a7f Sascha Hauer     2015-04-27  448  }
68e5fc4a255a7f Sascha Hauer     2015-04-27  449  
9db669f14fd829 Arnd Bergmann    2016-02-08  450  static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
68e5fc4a255a7f Sascha Hauer     2015-04-27  451  {
68e5fc4a255a7f Sascha Hauer     2015-04-27  452  	struct mtk8250_data *data = dev_get_drvdata(dev);
68e5fc4a255a7f Sascha Hauer     2015-04-27  453  
6f53f04819bff1 Daniel Golle     2023-09-11 @454  	if (test_and_set_bit(MTK_UART_STATE_BIT_BUSCLK_EN, &data->state))
6f53f04819bff1 Daniel Golle     2023-09-11  455  		return 0;
6f53f04819bff1 Daniel Golle     2023-09-11  456  
b6c7ff2693ddc2 Chen-Yu Tsai     2023-06-06  457  	clk_prepare_enable(data->bus_clk);
d518314a1fa4e9 Daniel Golle     2025-09-16  458  	clk_prepare_enable(data->uart_clk);
c1c325d703d347 Sascha Hauer     2015-04-27  459  
68e5fc4a255a7f Sascha Hauer     2015-04-27  460  	return 0;
68e5fc4a255a7f Sascha Hauer     2015-04-27  461  }
68e5fc4a255a7f Sascha Hauer     2015-04-27  462  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
