Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229962;
	b=3ekz+GnGWNWdeRM5SfhFqCceJzcy1FNWaglwOycDAWgWxt+LHcV8yChDB5+4rSM7tfbS
	 AmNF88Ub6BkXaVfwJTBdh2BlxjuG8f52YzUyHGh41vvC4OSFI12kiKAXwDrNW11QPb5I9
	 D4NJQcgNTwzKzkC1Wbo3IVveW9yN8Wp4jsRaCs1aNusBLXrYBPJp6XErYB5WCJ5gqxl0V
	 lklEMJW8ZC6FRhfktaddD1vKrGueaIB30Mzuwid2dykiCnlcp27k2wAZpcqCfwah702jU
	 EoEYmXucNvX7n1vJOwcA4xgCOJqT+ELmH+WzYD9P9JOs8giMVJP0c13rXNvwCJsOtEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229962;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4moTb0lAxyc41iTyTxij/SBewkrPFphrzKGtOYEQtRg=;
	b=t0eZbFbGPm3QnbEHMJ6IDd31JbY4Z4BpTBbXAy/v8jnK0JlLmnsrqGY8e1aI8C09QTmb
	 6+cJtDg07ys0YdoUbe3fFytXldtPWdgKztmo6a2d1wwfWSRm7adDeTKTtTx+cvtmq+SkN
	 bd2A1+MDg8Be+dHLfdgtGsgECEcx1ad/5q6VAQPjjLqLz+0NRE620SN+LC/DsdjjPSROw
	 K7vcH8czTd2RkaVGV07UreYoPbl26iiOIa/o+fEaUMYkqDWMep1uA7jCVc5RTXhFxUPQW
	 LdnCJWygMFnCLf44w28Vke2sMJteinw+NPscCxH3CKkHy0wtbTkoSjdOFxxuiOO7aGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bJasvDpz;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80679606D808
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 13:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80679606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bJasvDpz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794229961; x=1825765961;
  h=date:from:to:cc:subject:message-id;
  bh=2n4ujHEUUgQmtLYXBq8UVmgbdD7snNZP3Q3vJZQ+I1E=;
  b=bJasvDpzIVU6JnVonimaSmyQSE1Gj3CEeduFCFuYPrLuH2L/JBiiITv1
   Ws/YVZ6c0FC/nldiuBcRdo0U1n1v1OjpdyFlWDaGaP/8khnsB3YvF4eZa
   v+zjFWaaT+gQw6Urraj2KZR994in++u0mRuXgCEY3Hj6u+7/5BwR0ciUX
   b79/fTyFZi60/SLmasE1UxOfERc03rZKFsVfhL1hbZ9rHydVCsRXKRN6h
   oJsk+eCwWf1SgzFo4akBdJqErk8M4xSBvhgXX60BA/KHRFBdyvlagHuMr
   IvQmH9OLTQq1IuQiMbaBiFxR/k4LbtgYmm8UN98TuFeO4q7/AQS1nLuQd
   g==;
X-CSE-ConnectionGUID: 6Rdg78FrR0i5OO90sMVyow==
X-CSE-MsgGUID: 1W6m//HUSYyOPdqexnCodw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2952745"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2952745"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 05:12:40 -0800
X-CSE-ConnectionGUID: PPAIlyoHQ6uYBZqLnQFRNA==
X-CSE-MsgGUID: ap9LxfmCSmably56s+zLJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8435212"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 09 Nov 2026 05:12:39 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQPAq-000000000KJ-2AcC;
	Mon, 09 Nov 2026 13:12:36 +0000
Date: Mon, 09 Nov 2026 14:12:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 196/247]
 drivers/iio/adc/ingenic-x1600-adc.c:119 x1600_adc_read_raw_channel() warn:
 subtract is higher precedence than shift
Message-ID: <202611091401.bBwOPdXb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Olivier Louvignes <olivier@mgcrea.io>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: Joshua Crofts <joshua.crofts1@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   b70566610b48ba49dec636019da4d696db64b085
commit: 6abd2c32aed66a36992c2c0bdb45cf82bf5e42df [196/247] iio: adc: Add a driver for the Ingenic X1600 ADC
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091401.bBwOPdXb-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611091401.bBwOPdXb-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ingenic-x1600-adc.c:119 x1600_adc_read_raw_channel() warn: subtract is higher precedence than shift
drivers/iio/adc/ingenic-x1600-adc.c:119 x1600_adc_read_raw_channel() warn: subtract is higher precedence than shift
drivers/iio/adc/ingenic-x1600-adc.c:119 x1600_adc_read_raw_channel() warn: subtract is higher precedence than shift
drivers/iio/adc/ingenic-x1600-adc.c:119 x1600_adc_read_raw_channel() warn: subtract is higher precedence than shift

vim +119 drivers/iio/adc/ingenic-x1600-adc.c

6abd2c32aed66a Olivier Louvignes 2026-11-06   91  
6abd2c32aed66a Olivier Louvignes 2026-11-06   92  static int x1600_adc_read_raw_channel(struct x1600_adc *adc, unsigned int ch, int *val)
6abd2c32aed66a Olivier Louvignes 2026-11-06   93  {
6abd2c32aed66a Olivier Louvignes 2026-11-06   94  	unsigned int bank, shift;
6abd2c32aed66a Olivier Louvignes 2026-11-06   95  	u32 enable, data;
6abd2c32aed66a Olivier Louvignes 2026-11-06   96  	int ret;
6abd2c32aed66a Olivier Louvignes 2026-11-06   97  
6abd2c32aed66a Olivier Louvignes 2026-11-06   98  	guard(mutex)(&adc->lock);
6abd2c32aed66a Olivier Louvignes 2026-11-06   99  
6abd2c32aed66a Olivier Louvignes 2026-11-06  100  	reinit_completion(&adc->done);
6abd2c32aed66a Olivier Louvignes 2026-11-06  101  	x1600_adc_write(adc, X1600_ADC_REG_STATUS, BIT(ch));
6abd2c32aed66a Olivier Louvignes 2026-11-06  102  	enable = x1600_adc_read(adc, X1600_ADC_REG_ENABLE);
6abd2c32aed66a Olivier Louvignes 2026-11-06  103  	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, enable | BIT(ch));
6abd2c32aed66a Olivier Louvignes 2026-11-06  104  
6abd2c32aed66a Olivier Louvignes 2026-11-06  105  	if (wait_for_completion_timeout(&adc->done, X1600_ADC_TIMEOUT))
6abd2c32aed66a Olivier Louvignes 2026-11-06  106  		ret = 0;
6abd2c32aed66a Olivier Louvignes 2026-11-06  107  	else
6abd2c32aed66a Olivier Louvignes 2026-11-06  108  		ret = -ETIMEDOUT;
6abd2c32aed66a Olivier Louvignes 2026-11-06  109  
6abd2c32aed66a Olivier Louvignes 2026-11-06  110  	enable = x1600_adc_read(adc, X1600_ADC_REG_ENABLE);
6abd2c32aed66a Olivier Louvignes 2026-11-06  111  	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, enable & ~BIT(ch));
6abd2c32aed66a Olivier Louvignes 2026-11-06  112  	if (ret)
6abd2c32aed66a Olivier Louvignes 2026-11-06  113  		return ret;
6abd2c32aed66a Olivier Louvignes 2026-11-06  114  
6abd2c32aed66a Olivier Louvignes 2026-11-06  115  	/* Two results to a data register, the even channel's in the low half. */
6abd2c32aed66a Olivier Louvignes 2026-11-06  116  	bank = ch / 2;
6abd2c32aed66a Olivier Louvignes 2026-11-06  117  	shift = ch % 2;
6abd2c32aed66a Olivier Louvignes 2026-11-06  118  	data = x1600_adc_read(adc, X1600_ADC_REG_DATA(bank));
6abd2c32aed66a Olivier Louvignes 2026-11-06 @119  	*val = field_get(X1600_ADC_DATA_MASK(shift), data);
6abd2c32aed66a Olivier Louvignes 2026-11-06  120  
6abd2c32aed66a Olivier Louvignes 2026-11-06  121  	return 0;
6abd2c32aed66a Olivier Louvignes 2026-11-06  122  }
6abd2c32aed66a Olivier Louvignes 2026-11-06  123  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
