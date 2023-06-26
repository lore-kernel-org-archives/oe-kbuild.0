Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43821D520
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 17:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687802244; x=1719338244;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Wylav02Ekt9P0xOnhWiDGvUVMmRPXO8BWJ8o3wOEb0w=;
  b=NHZCx/Bo345/da7bZ5PkqBLDUdYIzsBtXL6xk3lkuaaFPmbGyULkSDwN
   jIP+r7DKT2Ce5mjybEtJPQH4dEH0lKlA6kUbod9PGQrLhnFsR7NPjpoWZ
   7jxG/mJvrReOTIucUybltY7Ghqw3vJ6PwA/T5/v9uuTW0eW2RHWTpTw0e
   IEzyEbd2uw+2JQgOsNoM1kFdp9QAvhauWjFa8u4KZMNJZbuCsJw4O/nle
   3MDxUmef9RA8dy8Tl5JKeCWyutu5dUCN2ooy+qdCOlZ0RTk09TxVRIFW4
   +5gUPtA/6xFW9K07uzZ/lLxrGXu+3FaTQcu0pLKHjVvs5pgNwJ9tkooKG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="427341939"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="427341939"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 10:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="786281953"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="786281953"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jun 2023 10:57:17 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDqSi-000As5-1p;
	Mon, 26 Jun 2023 17:57:16 +0000
Date: Tue, 27 Jun 2023 01:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] time: ntp: Remove =?utf-8?Q?un?=
 =?utf-8?B?bmVjZXNzYXJ5IOKAmC1FTk9ERVbigJk=?= values from err
Message-ID: <202306270130.Gp3Vt7Td-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230627182540.5243-1-zeming@nfschina.com>
References: <20230627182540.5243-1-zeming@nfschina.com>
TO: Li zeming <zeming@nfschina.com>
TO: jstultz@google.com
TO: tglx@linutronix.de
TO: sboyd@kernel.org
CC: linux-kernel@vger.kernel.org
CC: Li zeming <zeming@nfschina.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on linus/master v6.4 next-20230626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-zeming/time-ntp-Remove-unnecessary-ENODEV-values-from-err/20230626-095508
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20230627182540.5243-1-zeming%40nfschina.com
patch subject: [PATCH] time: ntp: Remove unnecessary ‘-ENODEV’ values from err
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-m001-20230625 (https://download.01.org/0day-ci/archive/20230627/202306270130.Gp3Vt7Td-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306270130.Gp3Vt7Td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306270130.Gp3Vt7Td-lkp@intel.com/

smatch warnings:
kernel/time/ntp.c:605 update_rtc() error: uninitialized symbol 'err'.

vim +/err +605 kernel/time/ntp.c

76e87d96b30b5f Thomas Gleixner 2020-12-06  578  
33e62e832384c8 Thomas Gleixner 2020-12-06  579  #ifdef CONFIG_RTC_SYSTOHC
76e87d96b30b5f Thomas Gleixner 2020-12-06  580  /* Save NTP synchronized time to the RTC */
76e87d96b30b5f Thomas Gleixner 2020-12-06  581  static int update_rtc(struct timespec64 *to_set, unsigned long *offset_nsec)
33e62e832384c8 Thomas Gleixner 2020-12-06  582  {
33e62e832384c8 Thomas Gleixner 2020-12-06  583  	struct rtc_device *rtc;
33e62e832384c8 Thomas Gleixner 2020-12-06  584  	struct rtc_time tm;
7c397afa918b1a Li zeming       2023-06-28  585  	int err;
33e62e832384c8 Thomas Gleixner 2020-12-06  586  
33e62e832384c8 Thomas Gleixner 2020-12-06  587  	rtc = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
33e62e832384c8 Thomas Gleixner 2020-12-06  588  	if (!rtc)
76e87d96b30b5f Thomas Gleixner 2020-12-06  589  		return -ENODEV;
33e62e832384c8 Thomas Gleixner 2020-12-06  590  
33e62e832384c8 Thomas Gleixner 2020-12-06  591  	if (!rtc->ops || !rtc->ops->set_time)
33e62e832384c8 Thomas Gleixner 2020-12-06  592  		goto out_close;
33e62e832384c8 Thomas Gleixner 2020-12-06  593  
76e87d96b30b5f Thomas Gleixner 2020-12-06  594  	/* First call might not have the correct offset */
76e87d96b30b5f Thomas Gleixner 2020-12-06  595  	if (*offset_nsec == rtc->set_offset_nsec) {
76e87d96b30b5f Thomas Gleixner 2020-12-06  596  		rtc_time64_to_tm(to_set->tv_sec, &tm);
76e87d96b30b5f Thomas Gleixner 2020-12-06  597  		err = rtc_set_time(rtc, &tm);
76e87d96b30b5f Thomas Gleixner 2020-12-06  598  	} else {
76e87d96b30b5f Thomas Gleixner 2020-12-06  599  		/* Store the update offset and let the caller try again */
69eca258c85000 Thomas Gleixner 2020-12-06  600  		*offset_nsec = rtc->set_offset_nsec;
76e87d96b30b5f Thomas Gleixner 2020-12-06  601  		err = -EAGAIN;
33e62e832384c8 Thomas Gleixner 2020-12-06  602  	}
33e62e832384c8 Thomas Gleixner 2020-12-06  603  out_close:
33e62e832384c8 Thomas Gleixner 2020-12-06  604  	rtc_class_close(rtc);
33e62e832384c8 Thomas Gleixner 2020-12-06 @605  	return err;
33e62e832384c8 Thomas Gleixner 2020-12-06  606  }
33e62e832384c8 Thomas Gleixner 2020-12-06  607  #else
76e87d96b30b5f Thomas Gleixner 2020-12-06  608  static inline int update_rtc(struct timespec64 *to_set, unsigned long *offset_nsec)
3c00a1fe8496ff Xunlei Pang     2015-04-01  609  {
926617889dc838 Arnd Bergmann   2018-08-14  610  	return -ENODEV;
3c00a1fe8496ff Xunlei Pang     2015-04-01  611  }
3c00a1fe8496ff Xunlei Pang     2015-04-01  612  #endif
3c00a1fe8496ff Xunlei Pang     2015-04-01  613  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
