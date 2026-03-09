Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A55285050
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054124; cv=none; b=Agomyw3vXJsMihY+kI5W5exv3rvSs26hPBAQ+NMo55Vlm69iqkjQSmv8wArN+KgMKH6NgV3AN4Elo3467ZAcgF/izaN5fCuBA+58X1pIYQbUYPwhg6gDMxCniTUBdMSLDbXnQu0ztk6rYyAah4iX86LH3LF2GECrs7M/dVm5kwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054124; c=relaxed/simple;
	bh=M+bkMcgWqrvAd9WHgURUQw+TD7K0RjHpOswZdKC5MZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=plvecVj6+dUxtu72elpmpNocV+PdjkY6KPDKFB/M4cnHtWQQWtrhshMoGabom9z7MQ5DQnUVJKP4HaTC0c2QzhOguBXN+0ToZFYCOB48B839WXNibGbamoe45bePwbG+x1ZPx7oiFFIulBjDaRMMOHgwbA0VdSmUrnqDTOtrdiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ0WE3rN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ0WE3rN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773054121; x=1804590121;
  h=date:from:to:cc:subject:message-id;
  bh=M+bkMcgWqrvAd9WHgURUQw+TD7K0RjHpOswZdKC5MZI=;
  b=gQ0WE3rNm1H1m3VVXrkcM1oMCcsCktgx0i2rDeVNFVz69cAzfi45mtfZ
   CqA53QDuDrATDPeO8bxdwINQKQlzQ7v15jXtZ8coxuq2sPFoYxz+qhzHD
   KzxvJcBSoinoV1JlZsh1SUTuNJj/ie3iOoX5+DXhrVLLP8Sn7nbmWzaDn
   kmyy5BsB5n7iyuXlVkcFkWGHJW7WMTG0AKEMK/9qoH1HOgs/n1cFTKaBl
   M+e543WuOuHOHQ6uC5meC0OQ/RxBYBkfd3JSnzwLRtsQA+fQQMjYbQd62
   6U3fCw1baRMSspfQ2VtmOmMz2zjf1n+IjMlU5anZ0NHVlvgfc+OKKaRaz
   Q==;
X-CSE-ConnectionGUID: znZ7+cThR9OelwGbGCdRYQ==
X-CSE-MsgGUID: EF3ZUYe9SiC1OD0bGe6daw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74118915"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74118915"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:01:59 -0700
X-CSE-ConnectionGUID: 1EEq0u4jTMiZ3sjG+zsIuA==
X-CSE-MsgGUID: BZB/vkXdRoG5w9J2bmr4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="217326702"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 04:01:58 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzYN1-0000000006o-2ONv;
	Mon, 09 Mar 2026 11:01:55 +0000
Date: Mon, 09 Mar 2026 19:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:7.0-rc 6/87]
 drivers/tty/serial/8250/8250_mtk.c:436 mtk8250_runtime_suspend() warn:
 test_and_clear_bit() takes a bit number
Message-ID: <202603091856.CNiw1oL1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: c3e74a9070cbe512e4879c15d680b41242680548 [6/87] serial: 8250_mtk: track busclk state to avoid bus error
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r071-20260309 (https://download.01.org/0day-ci/archive/20260309/202603091856.CNiw1oL1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603091856.CNiw1oL1-lkp@intel.com/

smatch warnings:
drivers/tty/serial/8250/8250_mtk.c:436 mtk8250_runtime_suspend() warn: test_and_clear_bit() takes a bit number
drivers/tty/serial/8250/8250_mtk.c:453 mtk8250_runtime_resume() warn: test_and_set_bit() takes a bit number

vim +436 drivers/tty/serial/8250/8250_mtk.c

b4756f4f0d773c Matthias Brugger 2014-09-09  430  
9db669f14fd829 Arnd Bergmann    2016-02-08  431  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
68e5fc4a255a7f Sascha Hauer     2015-04-27  432  {
68e5fc4a255a7f Sascha Hauer     2015-04-27  433  	struct mtk8250_data *data = dev_get_drvdata(dev);
e32a83c70cf987 Changqi Hu       2020-02-26  434  	struct uart_8250_port *up = serial8250_get_port(data->line);
68e5fc4a255a7f Sascha Hauer     2015-04-27  435  
c3e74a9070cbe5 Daniel Golle     2023-09-11 @436  	if (!test_and_clear_bit(MTK_UART_STATE_BIT_BUSCLK_EN, &data->state))
c3e74a9070cbe5 Daniel Golle     2023-09-11  437  		return 0;
c3e74a9070cbe5 Daniel Golle     2023-09-11  438  
e32a83c70cf987 Changqi Hu       2020-02-26  439  	/* wait until UART in idle status */
e32a83c70cf987 Changqi Hu       2020-02-26  440  	while
e32a83c70cf987 Changqi Hu       2020-02-26  441  		(serial_in(up, MTK_UART_DEBUG0));
e32a83c70cf987 Changqi Hu       2020-02-26  442  
d518314a1fa4e9 Daniel Golle     2025-09-16  443  	clk_disable_unprepare(data->uart_clk);
c1c325d703d347 Sascha Hauer     2015-04-27  444  	clk_disable_unprepare(data->bus_clk);
68e5fc4a255a7f Sascha Hauer     2015-04-27  445  
68e5fc4a255a7f Sascha Hauer     2015-04-27  446  	return 0;
68e5fc4a255a7f Sascha Hauer     2015-04-27  447  }
68e5fc4a255a7f Sascha Hauer     2015-04-27  448  
9db669f14fd829 Arnd Bergmann    2016-02-08  449  static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
68e5fc4a255a7f Sascha Hauer     2015-04-27  450  {
68e5fc4a255a7f Sascha Hauer     2015-04-27  451  	struct mtk8250_data *data = dev_get_drvdata(dev);
68e5fc4a255a7f Sascha Hauer     2015-04-27  452  
c3e74a9070cbe5 Daniel Golle     2023-09-11 @453  	if (test_and_set_bit(MTK_UART_STATE_BIT_BUSCLK_EN, &data->state))
c3e74a9070cbe5 Daniel Golle     2023-09-11  454  		return 0;
c3e74a9070cbe5 Daniel Golle     2023-09-11  455  
b6c7ff2693ddc2 Chen-Yu Tsai     2023-06-06  456  	clk_prepare_enable(data->bus_clk);
d518314a1fa4e9 Daniel Golle     2025-09-16  457  	clk_prepare_enable(data->uart_clk);
c1c325d703d347 Sascha Hauer     2015-04-27  458  
68e5fc4a255a7f Sascha Hauer     2015-04-27  459  	return 0;
68e5fc4a255a7f Sascha Hauer     2015-04-27  460  }
68e5fc4a255a7f Sascha Hauer     2015-04-27  461  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
