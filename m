Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51C1A2387
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 02:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757643135; cv=none; b=iSQch8WYJVHe62uYUlIJkfaq1hI3KKNKj2aIc1vu+4kqfWFi/wAH5DWAPXrSEJAx2LYbEaEy2Y1f2ZpfCniF3UCqyzEfiD6uIF+OXy55xYKty9ZQ5wFImdpdDZ+G3uBgG8Mcr3W3YBd/OqwmRqT26B8/2cKArFR4I6aJbOhJOGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757643135; c=relaxed/simple;
	bh=r5sGm1GytlPEyMTxPUA3Eh2dXKREzBq9GgL3hPWSGiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvsP3WaKyoVTggMHoo3D2wJ1t/rxRR6vVUfc+yUbNNJVVbHc9vjEmXL1TKgENM1pyFn7uvyxtdCpHe3RbBvZPlw3FcORi57QexQXm8co5nkLdegruNb2HlYTDR/StAuuDVLmgk+bcusHEUFgQ4WRsxsi5QQ47HmCuX7vVsJL5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U//2MjFN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U//2MjFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757643134; x=1789179134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r5sGm1GytlPEyMTxPUA3Eh2dXKREzBq9GgL3hPWSGiw=;
  b=U//2MjFNRsnqHmIWCvweHG1+r0ea2dHbVr52A0AAs/MwmpyY5BQBPr5x
   +mD3fpaH4/a5z2dirGZOy0J8eZmWvW1j0zokld0N5QSMGEOpXwtBZl6Mg
   B0VYmQTg9hC4xK+qCagBF0zWeV79jspXEAdzXXgZzdXLJNNhLn+KGUt0j
   2NDcXNbVJwNjs/kJj7yf9rpObyLQjdjQjDEODtRig+DEAi3gU4GnFXodv
   BLuBp5NXalhuJlndxaVkP+bh7k5dCS9jXFx9duoin1M0WveAYzaR+zxH2
   G+QtGBMPz5P4r8CYP9kja50ChHAKbCQyXNYPILhKbNqXyoQFIJMqXNAXp
   g==;
X-CSE-ConnectionGUID: P+Rv8OQeQY6b6Ks3jlwqMQ==
X-CSE-MsgGUID: aZKZb/WrTtWQI9HsORN2CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="85425020"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="85425020"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 19:12:13 -0700
X-CSE-ConnectionGUID: bdrgczUCQrm9ma4kbf3TgA==
X-CSE-MsgGUID: R305S9CgTBONlaP3fyZYPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="173751172"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2025 19:12:12 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwtGk-0000km-04;
	Fri, 12 Sep 2025 02:12:10 +0000
Date: Fri, 12 Sep 2025 10:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 23/34]
 drivers/accessibility/speakup/main.c:1750 speakup_bs() error: uninitialized
 symbol 'flags'.
Message-ID: <202509120923.oyvvgZet-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   3ef29ea9bb447fcd2164b0d944add4b1757343cb
commit: 9fa1fc28d23a6a8a7d2a494db5aa17d25ebd18ea [23/34] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-141-20250912 (https://download.01.org/0day-ci/archive/20250912/202509120923.oyvvgZet-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509120923.oyvvgZet-lkp@intel.com/

New smatch warnings:
drivers/accessibility/speakup/main.c:1750 speakup_bs() error: uninitialized symbol 'flags'.
drivers/accessibility/speakup/main.c:1776 speakup_con_write() error: uninitialized symbol 'flags'.
drivers/accessibility/speakup/main.c:1805 speakup_con_update() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/accessibility/speakup/main.c:1758 speakup_bs() error: uninitialized symbol 'flags'.
drivers/accessibility/speakup/main.c:1782 speakup_con_write() error: uninitialized symbol 'flags'.
drivers/accessibility/speakup/main.c:1788 speakup_con_write() error: uninitialized symbol 'flags'.

vim +/flags +1750 drivers/accessibility/speakup/main.c

c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1736  
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1737  /* called by: vt_notifier_call() */
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1738  static void speakup_bs(struct vc_data *vc)
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1739  {
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1740  	unsigned long flags;
8e69a811068657 drivers/staging/speakup/main.c       Domagoj Trsan    2014-09-09  1741  
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1742  	if (!speakup_console[vc->vc_num])
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1743  		return;
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13  1744  	if (!spin_trylock_irqsave(&speakup_info.spinlock, flags))
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1745  		/* Speakup output, discard */
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1746  		return;
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1747  	if (!spk_parked)
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1748  		speakup_date(vc);
0d6ff6164977d3 drivers/staging/speakup/main.c       Arushi Singhal   2017-03-24  1749  	if (spk_shut_up || !synth) {
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13 @1750  		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1751  		return;
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1752  	}
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1753  	if (vc->vc_num == fg_console && spk_keydown) {
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1754  		spk_keydown = 0;
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1755  		if (!is_cursor)
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1756  			say_char(vc);
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1757  	}
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13  1758  	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1759  }
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1760  
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1761  /* called by: vt_notifier_call() */
9831013cbdbd3d drivers/staging/speakup/main.c       Samuel Thibault  2017-03-04  1762  static void speakup_con_write(struct vc_data *vc, u16 *str, int len)
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1763  {
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1764  	unsigned long flags;
8e69a811068657 drivers/staging/speakup/main.c       Domagoj Trsan    2014-09-09  1765  
0d6ff6164977d3 drivers/staging/speakup/main.c       Arushi Singhal   2017-03-24  1766  	if ((vc->vc_num != fg_console) || spk_shut_up || !synth)
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1767  		return;
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13  1768  	if (!spin_trylock_irqsave(&speakup_info.spinlock, flags))
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1769  		/* Speakup output, discard */
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1770  		return;
28bc24fc46f9c9 drivers/staging/speakup/main.c       Jiri Slaby       2020-06-15  1771  	if (spk_bell_pos && spk_keydown && (vc->state.x == spk_bell_pos - 1))
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1772  		bleep(3);
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1773  	if ((is_cursor) || (cursor_track == read_all_mode)) {
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1774  		if (cursor_track == CT_Highlight)
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1775  			update_color_buffer(vc, str, len);
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13 @1776  		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1777  		return;
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1778  	}
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1779  	if (win_enabled) {
28bc24fc46f9c9 drivers/staging/speakup/main.c       Jiri Slaby       2020-06-15  1780  		if (vc->state.x >= win_left && vc->state.x <= win_right &&
28bc24fc46f9c9 drivers/staging/speakup/main.c       Jiri Slaby       2020-06-15  1781  		    vc->state.y >= win_top && vc->state.y <= win_bottom) {
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13  1782  			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1783  			return;
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1784  		}
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1785  	}
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1786  
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1787  	spkup_write(str, len);
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13  1788  	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1789  }
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1790  
0012196c165d51 drivers/staging/speakup/main.c       Sachin Kamat     2013-05-22  1791  static void speakup_con_update(struct vc_data *vc)
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1792  {
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1793  	unsigned long flags;
8e69a811068657 drivers/staging/speakup/main.c       Domagoj Trsan    2014-09-09  1794  
0fc801f8018000 drivers/accessibility/speakup/main.c Mushahid Hussain 2022-10-10  1795  	if (!speakup_console[vc->vc_num] || spk_parked || !synth)
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1796  		return;
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13  1797  	if (!spin_trylock_irqsave(&speakup_info.spinlock, flags))
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1798  		/* Speakup output, discard */
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1799  		return;
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1800  	speakup_date(vc);
fbae47076e9307 drivers/staging/speakup/main.c       Samuel Thibault  2018-05-13  1801  	if (vc->vc_mode == KD_GRAPHICS && !spk_paused && spk_str_pause[0]) {
2610df41489f54 drivers/staging/speakup/main.c       Samuel Thibault  2018-05-02  1802  		synth_printf("%s", spk_str_pause);
d1598d4e3b1c26 drivers/staging/speakup/main.c       Samuel Thibault  2018-05-14  1803  		spk_paused = true;
2610df41489f54 drivers/staging/speakup/main.c       Samuel Thibault  2018-05-02  1804  	}
3efe810f232222 drivers/staging/speakup/main.c       William Hubbs    2013-05-13 @1805  	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1806  }
c6e3fd22cd5383 drivers/staging/speakup/main.c       William Hubbs    2010-10-07  1807  

:::::: The code at line 1750 was first introduced by commit
:::::: 3efe810f2322223eca3b3a1dea3ae40500cbd471 staging: speakup: main: remove custom locking macros

:::::: TO: William Hubbs <w.d.hubbs@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
