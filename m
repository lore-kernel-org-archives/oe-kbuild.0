Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA711C01
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jan 2023 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674477728; x=1706013728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtQp1j0+4sMw2tkHHzHOSMRXh7LEufdGCdrcPOUxGBo=;
  b=K30nmI4CqduHc7V2P0nSK0a2GnBZ0FURgxDWby/h6IOHgPBC1Is9Aoth
   KvMOxk1Obdj1uHjHt8Sko0nqMucYqITeCvXvd4UBSlJEdZi0TKtAs8Q1X
   j2jxEx9spC7mb0MWvW/bY82bxzWIRSDFNYBGcS2C4knz61/wrIG49TdqN
   SYpcgUhGiZaQLBHzavGhGUk5tPySs3Xzy/p0V0J5nBlYr44vFlvz8aH/u
   G51TOrh/0b2WEFEqOW6466RWjmsGNE0D3YRK0Z8oNUSzi7hMC+gK4tV50
   2fvBn1cLaF9rS4QNRaTv3OtRfch56TwZMrVgcZXmyPz+lzgt/alGVVr3Y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="323721509"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="323721509"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 04:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="990394608"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="990394608"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2023 04:42:06 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJw9G-0005do-12;
	Mon, 23 Jan 2023 12:42:06 +0000
Date: Mon, 23 Jan 2023 20:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/rtc/rtc-sh.c:316 sh_rtc_read_time() warn: bitwise AND
 condition is false here
Message-ID: <202301232033.ZrbgdE2H-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Guo Ren <guoren@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1 riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
date:   2 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 2 months ago
config: riscv-randconfig-m031-20230123 (https://download.01.org/0day-ci/archive/20230123/202301232033.ZrbgdE2H-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/rtc/rtc-sh.c:316 sh_rtc_read_time() warn: bitwise AND condition is false here

vim +316 drivers/rtc/rtc-sh.c

16380c153a69c3 John Stultz       2011-02-02  273  
317a6104a99f87 Paul Mundt        2006-09-27  274  static int sh_rtc_read_time(struct device *dev, struct rtc_time *tm)
317a6104a99f87 Paul Mundt        2006-09-27  275  {
85368bb9de6366 Wolfram Sang      2018-04-19  276  	struct sh_rtc *rtc = dev_get_drvdata(dev);
317a6104a99f87 Paul Mundt        2006-09-27  277  	unsigned int sec128, sec2, yr, yr100, cf_bit;
317a6104a99f87 Paul Mundt        2006-09-27  278  
9852023d204b97 Alexandre Belloni 2019-03-20  279  	if (!(readb(rtc->regbase + RCR2) & RCR2_RTCEN))
9852023d204b97 Alexandre Belloni 2019-03-20  280  		return -EINVAL;
9852023d204b97 Alexandre Belloni 2019-03-20  281  
317a6104a99f87 Paul Mundt        2006-09-27  282  	do {
317a6104a99f87 Paul Mundt        2006-09-27  283  		unsigned int tmp;
317a6104a99f87 Paul Mundt        2006-09-27  284  
317a6104a99f87 Paul Mundt        2006-09-27  285  		spin_lock_irq(&rtc->lock);
317a6104a99f87 Paul Mundt        2006-09-27  286  
317a6104a99f87 Paul Mundt        2006-09-27  287  		tmp = readb(rtc->regbase + RCR1);
317a6104a99f87 Paul Mundt        2006-09-27  288  		tmp &= ~RCR1_CF; /* Clear CF-bit */
317a6104a99f87 Paul Mundt        2006-09-27  289  		tmp |= RCR1_CIE;
317a6104a99f87 Paul Mundt        2006-09-27  290  		writeb(tmp, rtc->regbase + RCR1);
317a6104a99f87 Paul Mundt        2006-09-27  291  
317a6104a99f87 Paul Mundt        2006-09-27  292  		sec128 = readb(rtc->regbase + R64CNT);
317a6104a99f87 Paul Mundt        2006-09-27  293  
fe20ba70abf7d6 Adrian Bunk       2008-10-18  294  		tm->tm_sec	= bcd2bin(readb(rtc->regbase + RSECCNT));
fe20ba70abf7d6 Adrian Bunk       2008-10-18  295  		tm->tm_min	= bcd2bin(readb(rtc->regbase + RMINCNT));
fe20ba70abf7d6 Adrian Bunk       2008-10-18  296  		tm->tm_hour	= bcd2bin(readb(rtc->regbase + RHRCNT));
fe20ba70abf7d6 Adrian Bunk       2008-10-18  297  		tm->tm_wday	= bcd2bin(readb(rtc->regbase + RWKCNT));
fe20ba70abf7d6 Adrian Bunk       2008-10-18  298  		tm->tm_mday	= bcd2bin(readb(rtc->regbase + RDAYCNT));
fe20ba70abf7d6 Adrian Bunk       2008-10-18  299  		tm->tm_mon	= bcd2bin(readb(rtc->regbase + RMONCNT)) - 1;
317a6104a99f87 Paul Mundt        2006-09-27  300  
ad89f87a84040a Paul Mundt        2007-08-03  301  		if (rtc->capabilities & RTC_CAP_4_DIGIT_YEAR) {
317a6104a99f87 Paul Mundt        2006-09-27  302  			yr  = readw(rtc->regbase + RYRCNT);
fe20ba70abf7d6 Adrian Bunk       2008-10-18  303  			yr100 = bcd2bin(yr >> 8);
317a6104a99f87 Paul Mundt        2006-09-27  304  			yr &= 0xff;
ad89f87a84040a Paul Mundt        2007-08-03  305  		} else {
317a6104a99f87 Paul Mundt        2006-09-27  306  			yr  = readb(rtc->regbase + RYRCNT);
fe20ba70abf7d6 Adrian Bunk       2008-10-18  307  			yr100 = bcd2bin((yr == 0x99) ? 0x19 : 0x20);
ad89f87a84040a Paul Mundt        2007-08-03  308  		}
317a6104a99f87 Paul Mundt        2006-09-27  309  
fe20ba70abf7d6 Adrian Bunk       2008-10-18  310  		tm->tm_year = (yr100 * 100 + bcd2bin(yr)) - 1900;
317a6104a99f87 Paul Mundt        2006-09-27  311  
317a6104a99f87 Paul Mundt        2006-09-27  312  		sec2 = readb(rtc->regbase + R64CNT);
317a6104a99f87 Paul Mundt        2006-09-27  313  		cf_bit = readb(rtc->regbase + RCR1) & RCR1_CF;
317a6104a99f87 Paul Mundt        2006-09-27  314  
317a6104a99f87 Paul Mundt        2006-09-27  315  		spin_unlock_irq(&rtc->lock);
317a6104a99f87 Paul Mundt        2006-09-27 @316  	} while (cf_bit != 0 || ((sec128 ^ sec2) & RTC_BIT_INVERTED) != 0);
317a6104a99f87 Paul Mundt        2006-09-27  317  

:::::: The code at line 316 was first introduced by commit
:::::: 317a6104a99f87c0b35c0d9f19ec23ee7429b33e rtc: New RTC driver for SuperH On-Chip RTC.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
