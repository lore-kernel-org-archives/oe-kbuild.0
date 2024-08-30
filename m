Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2560A762F7
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Aug 2024 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724990935; cv=none; b=QicGCTpTmr1uCJ+yXOATLb1QRYQxlpy1o8rodNko29G70VDmWe7YAb2jY/dzbRuriwGrQrawi+w7/eAR96UWZE0OfFZrlBNeBXAmBpU6pZVM0Q2JjxBUH0I5mbS1078Qu5OpuIlDsOf/FukYiIgEV/CCCt5sqr1CD3kMc8a9yQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724990935; c=relaxed/simple;
	bh=1VBAEQzO9/HkMS4YRiys1SyuMHpSVqBOohST84yGkcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P8n0Q/KGdzmoA32795b0ZLN68KIQPPvW0vPW+KPnmCiHJxYgAgf8Q/z0TZiPDLOxqANob94AkVjkVq0P8KTZ2CtNiO1cH9nEBbLRiBEi3Mk5k2xk19FaJkDhadVn3eW9TNSo6ZiP1rhlnHBerUkbq9O3OTfkqxrE9lspHQM+UJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOixEwUX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOixEwUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724990933; x=1756526933;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1VBAEQzO9/HkMS4YRiys1SyuMHpSVqBOohST84yGkcw=;
  b=ZOixEwUX3/cmtEbkEp3zFKWCfdBcRNRV7kOvkCG+2ZGWAh9PnVi1ztbc
   YqhhKtiHi2PE2ExL2cWKWLN4nhbgb8XhjQuf46lPhPDPw24vFHcXu6syJ
   3eqMfCzxnnqMnUAVRTiAIH4xp/PTWd5zsoqAjTqhgCG/kHuKTwrOBlHLw
   jAYKTbew0cFIu1TI60edNQQg75AvAjdfs90sPw/THuw33MJI3+/wnP2Dt
   QZUn3QVXPrBPcdSbCJrz73qhP8ilFBi79QvEs3M3tK8bzRHst6hVTqMMd
   P1gAukOCU0qo4iUB584v0q3cTuMxXOPpEO101MBMFmT3fdezqI+cY+Lyw
   A==;
X-CSE-ConnectionGUID: wDBxB/xETre/BucK/1/0QA==
X-CSE-MsgGUID: nDm4gcNTSYWYnYvo90zK0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="13291444"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="13291444"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 21:08:51 -0700
X-CSE-ConnectionGUID: VoQtnAI4SR6/Gc6MmHXl8Q==
X-CSE-MsgGUID: TjIVxmtUQhSTWHHqM+ottQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="63414252"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Aug 2024 21:08:49 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjswJ-00010o-0i;
	Fri, 30 Aug 2024 04:08:47 +0000
Date: Fri, 30 Aug 2024 12:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 CV1800B SARADC
Message-ID: <202408301131.OqpHUdnw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/sophgo-cv1800b-adc.c:129:9: sparse: sparse: not in switch scope"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240829-sg2002-adc-v5-2-aacb381e869b@bootlin.com>
References: <20240829-sg2002-adc-v5-2-aacb381e869b@bootlin.com>
TO: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Chen Wang <unicorn_wang@outlook.com>
TO: Inochi Amaoto <inochiama@outlook.com>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "Miquèl Raynal" <miquel.raynal@bootlin.com>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/dt-bindings-iio-adc-sophgo-cv1800b-saradc-Add-Sophgo-CV1800B-SARADC/20240829-203431
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240829-sg2002-adc-v5-2-aacb381e869b%40bootlin.com
patch subject: [PATCH v5 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo CV1800B SARADC
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: csky-randconfig-r123-20240830 (https://download.01.org/0day-ci/archive/20240830/202408301131.OqpHUdnw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240830/202408301131.OqpHUdnw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408301131.OqpHUdnw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iio/adc/sophgo-cv1800b-adc.c:120:17: sparse: sparse: typename in expression
   drivers/iio/adc/sophgo-cv1800b-adc.c:120:21: sparse: sparse: Expected ; at end of statement
   drivers/iio/adc/sophgo-cv1800b-adc.c:120:21: sparse: sparse: got status_reg
   drivers/iio/adc/sophgo-cv1800b-adc.c:120:34: sparse: sparse: Expected ; at end of statement
   drivers/iio/adc/sophgo-cv1800b-adc.c:120:34: sparse: sparse: got )
>> drivers/iio/adc/sophgo-cv1800b-adc.c:129:9: sparse: sparse: not in switch scope
   drivers/iio/adc/sophgo-cv1800b-adc.c:132:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:132:1: sparse: sparse: got }
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:13: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:13: sparse: sparse: got !
>> drivers/iio/adc/sophgo-cv1800b-adc.c:139:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got !
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got }
>> drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at end of declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got {
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got !
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got }
>> drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at end of declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got {
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got !
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got }
>> drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at end of declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got {
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got !
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got }
>> drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at end of declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got {
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got !
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got }
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got }
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got (
>> drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:139:15: sparse: sparse: got }
   drivers/iio/adc/sophgo-cv1800b-adc.c:142:9: sparse: sparse: Expected ) in nested declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:142:9: sparse: sparse: got {
   drivers/iio/adc/sophgo-cv1800b-adc.c:142:9: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:142:9: sparse: sparse: got (
   drivers/iio/adc/sophgo-cv1800b-adc.c:142:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:142:9: sparse: sparse: got }
   drivers/iio/adc/sophgo-cv1800b-adc.c:143:18: sparse: sparse: Expected ) in function declarator
   drivers/iio/adc/sophgo-cv1800b-adc.c:143:18: sparse: sparse: got &
>> drivers/iio/adc/sophgo-cv1800b-adc.c:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/iio/adc/sophgo-cv1800b-adc.c:145:16: sparse: sparse: Expected ; at end of declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:145:16: sparse: sparse: got IRQ_HANDLED
   drivers/iio/adc/sophgo-cv1800b-adc.c:146:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/iio/adc/sophgo-cv1800b-adc.c:146:1: sparse: sparse: got }
   drivers/iio/adc/sophgo-cv1800b-adc.c:120:17: sparse: sparse: undefined identifier 'u32'
   drivers/iio/adc/sophgo-cv1800b-adc.c:120:34: sparse: sparse: undefined identifier '__v'
   drivers/iio/adc/sophgo-cv1800b-adc.c:121:36: sparse: sparse: undefined identifier 'status_reg'
>> drivers/iio/adc/sophgo-cv1800b-adc.c:121:36: sparse: sparse: incompatible types for operation (>):
   drivers/iio/adc/sophgo-cv1800b-adc.c:121:36: sparse:    unsigned long
   drivers/iio/adc/sophgo-cv1800b-adc.c:121:36: sparse:    bad type
   drivers/iio/adc/sophgo-cv1800b-adc.c:121:36: sparse: sparse: undefined identifier 'status_reg'
   drivers/iio/adc/sophgo-cv1800b-adc.c:121:36: sparse: sparse: cast from unknown type
   drivers/iio/adc/sophgo-cv1800b-adc.c:123:44: sparse: sparse: undefined identifier 'status_reg'
   drivers/iio/adc/sophgo-cv1800b-adc.c:123:44: sparse: sparse: incompatible types for operation (>):
   drivers/iio/adc/sophgo-cv1800b-adc.c:123:44: sparse:    unsigned long
   drivers/iio/adc/sophgo-cv1800b-adc.c:123:44: sparse:    bad type
   drivers/iio/adc/sophgo-cv1800b-adc.c:123:44: sparse: sparse: undefined identifier 'status_reg'
   drivers/iio/adc/sophgo-cv1800b-adc.c:123:44: sparse: sparse: cast from unknown type
   drivers/iio/adc/sophgo-cv1800b-adc.c:124:43: sparse: sparse: undefined identifier 'status_reg'
   drivers/iio/adc/sophgo-cv1800b-adc.c:124:43: sparse: sparse: incompatible types for operation (>):
   drivers/iio/adc/sophgo-cv1800b-adc.c:124:43: sparse:    unsigned long
   drivers/iio/adc/sophgo-cv1800b-adc.c:124:43: sparse:    bad type
   drivers/iio/adc/sophgo-cv1800b-adc.c:124:43: sparse: sparse: undefined identifier 'status_reg'
   drivers/iio/adc/sophgo-cv1800b-adc.c:124:43: sparse: sparse: cast from unknown type
   drivers/iio/adc/sophgo-cv1800b-adc.c:125:44: sparse: sparse: undefined identifier 'status_reg'
   drivers/iio/adc/sophgo-cv1800b-adc.c:125:44: sparse: sparse: incompatible types for operation (>):
   drivers/iio/adc/sophgo-cv1800b-adc.c:125:44: sparse:    unsigned long
   drivers/iio/adc/sophgo-cv1800b-adc.c:125:44: sparse:    bad type
   drivers/iio/adc/sophgo-cv1800b-adc.c:125:44: sparse: sparse: undefined identifier 'status_reg'
   drivers/iio/adc/sophgo-cv1800b-adc.c:125:44: sparse: sparse: cast from unknown type
   drivers/iio/adc/sophgo-cv1800b-adc.c:137:19: sparse: sparse: undefined identifier 'saradc'
   drivers/iio/adc/sophgo-cv1800b-adc.c:142:9: sparse: sparse: symbol 'writel_relaxed' redeclared with different type (different argument counts):
   drivers/iio/adc/sophgo-cv1800b-adc.c:142:9: sparse:    int static [signed] [toplevel] writel_relaxed( ... )
   drivers/iio/adc/sophgo-cv1800b-adc.c: note: in included file (through arch/csky/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:377:20: sparse: note: previously declared as:
   include/asm-generic/io.h:377:20: sparse:    void static inline [gnu_inline] [toplevel] writel_relaxed( ... )
   drivers/iio/adc/sophgo-cv1800b-adc.c:165:28: sparse: sparse: undefined identifier 'cv1800b_adc_info'
   drivers/iio/adc/sophgo-cv1800b-adc.c:181:40: sparse: sparse: undefined identifier 'cv1800b_adc_interrupt_handler'
   drivers/iio/adc/sophgo-cv1800b-adc.c:186:17: sparse: sparse: too many arguments for function writel_relaxed
   drivers/iio/adc/sophgo-cv1800b-adc.c:192:9: sparse: sparse: too many arguments for function writel_relaxed

vim +129 drivers/iio/adc/sophgo-cv1800b-adc.c

3913186d52b5a1 Thomas Bonnefille 2024-08-29   88  
3913186d52b5a1 Thomas Bonnefille 2024-08-29   89  static int cv1800b_adc_read_raw(struct iio_dev *indio_dev,
3913186d52b5a1 Thomas Bonnefille 2024-08-29   90  				struct iio_chan_spec const *chan,
3913186d52b5a1 Thomas Bonnefille 2024-08-29   91  				int *val, int *val2, long mask)
3913186d52b5a1 Thomas Bonnefille 2024-08-29   92  {
3913186d52b5a1 Thomas Bonnefille 2024-08-29   93  	struct cv1800b_adc *saradc = iio_priv(indio_dev);
3913186d52b5a1 Thomas Bonnefille 2024-08-29   94  
3913186d52b5a1 Thomas Bonnefille 2024-08-29   95  	switch (mask) {
3913186d52b5a1 Thomas Bonnefille 2024-08-29   96  	case IIO_CHAN_INFO_RAW:{
3913186d52b5a1 Thomas Bonnefille 2024-08-29   97  		u32 sample;
3913186d52b5a1 Thomas Bonnefille 2024-08-29   98  
3913186d52b5a1 Thomas Bonnefille 2024-08-29   99  		scoped_guard(mutex, &saradc->lock) {
3913186d52b5a1 Thomas Bonnefille 2024-08-29  100  			int ret;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  101  
3913186d52b5a1 Thomas Bonnefille 2024-08-29  102  			cv1800b_adc_start_measurement(saradc, chan->scan_index);
3913186d52b5a1 Thomas Bonnefille 2024-08-29  103  			ret = cv1800b_adc_wait(saradc);
3913186d52b5a1 Thomas Bonnefille 2024-08-29  104  			if (ret < 0)
3913186d52b5a1 Thomas Bonnefille 2024-08-29  105  				return ret;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  106  
3913186d52b5a1 Thomas Bonnefille 2024-08-29  107  			sample = readl(saradc->regs + CV1800B_ADC_CH_RESULT_REG(chan->scan_index));
3913186d52b5a1 Thomas Bonnefille 2024-08-29  108  		}
3913186d52b5a1 Thomas Bonnefille 2024-08-29  109  		if (!(sample & CV1800B_ADC_CH_VALID))
3913186d52b5a1 Thomas Bonnefille 2024-08-29  110  			return -ENODATA;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  111  
3913186d52b5a1 Thomas Bonnefille 2024-08-29  112  		*val = sample & CV1800B_ADC_CH_RESULT;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  113  		return IIO_VAL_INT;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  114  		}
3913186d52b5a1 Thomas Bonnefille 2024-08-29  115  	case IIO_CHAN_INFO_SCALE:
3913186d52b5a1 Thomas Bonnefille 2024-08-29  116  		*val = 3300;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  117  		*val2 = 12;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  118  		return IIO_VAL_FRACTIONAL_LOG2;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  119  	case IIO_CHAN_INFO_SAMP_FREQ:
3913186d52b5a1 Thomas Bonnefille 2024-08-29 @120  		u32 status_reg = readl(saradc->regs + CV1800B_ADC_CYC_SET_REG);
3913186d52b5a1 Thomas Bonnefille 2024-08-29 @121  		int clk_div = (1 + FIELD_GET(CV1800B_MASK_CLKDIV, status_reg));
3913186d52b5a1 Thomas Bonnefille 2024-08-29  122  		int freq = clk_get_rate(saradc->clk) / clk_div;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  123  		int nb_startup_cycle = 1 + FIELD_GET(CV1800B_MASK_STARTUP_CYCLE, status_reg);
3913186d52b5a1 Thomas Bonnefille 2024-08-29  124  		int nb_sample_cycle = 1 + FIELD_GET(CV1800B_MASK_SAMPLE_WINDOW, status_reg);
3913186d52b5a1 Thomas Bonnefille 2024-08-29  125  		int nb_compare_cycle = 1 + FIELD_GET(CV1800B_MASK_COMPARE_CYCLE, status_reg);
3913186d52b5a1 Thomas Bonnefille 2024-08-29  126  
3913186d52b5a1 Thomas Bonnefille 2024-08-29  127  		*val = freq / (nb_startup_cycle + nb_sample_cycle + nb_compare_cycle);
3913186d52b5a1 Thomas Bonnefille 2024-08-29  128  		return IIO_VAL_INT;
3913186d52b5a1 Thomas Bonnefille 2024-08-29 @129  	default:
3913186d52b5a1 Thomas Bonnefille 2024-08-29  130  		return -EINVAL;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  131  	}
3913186d52b5a1 Thomas Bonnefille 2024-08-29 @132  }
3913186d52b5a1 Thomas Bonnefille 2024-08-29  133  
3913186d52b5a1 Thomas Bonnefille 2024-08-29  134  static irqreturn_t cv1800b_adc_interrupt_handler(int irq, void *private)
3913186d52b5a1 Thomas Bonnefille 2024-08-29  135  {
3913186d52b5a1 Thomas Bonnefille 2024-08-29  136  	struct cv1800b_adc *saradc = private;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  137  	u32 reg = readl(saradc->regs + CV1800B_ADC_INTR_STA_REG);
3913186d52b5a1 Thomas Bonnefille 2024-08-29  138  
3913186d52b5a1 Thomas Bonnefille 2024-08-29 @139  	if (!(FIELD_GET(CV1800B_ADC_INTR_STA_BIT, reg)))
3913186d52b5a1 Thomas Bonnefille 2024-08-29  140  		return IRQ_NONE;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  141  
3913186d52b5a1 Thomas Bonnefille 2024-08-29  142  	writel(CV1800B_ADC_INTR_CLR_BIT, saradc->regs + CV1800B_ADC_INTR_CLR_REG);
3913186d52b5a1 Thomas Bonnefille 2024-08-29 @143  	complete(&saradc->completion);
3913186d52b5a1 Thomas Bonnefille 2024-08-29  144  
3913186d52b5a1 Thomas Bonnefille 2024-08-29 @145  	return IRQ_HANDLED;
3913186d52b5a1 Thomas Bonnefille 2024-08-29  146  }
3913186d52b5a1 Thomas Bonnefille 2024-08-29  147  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
