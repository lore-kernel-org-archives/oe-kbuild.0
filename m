Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A12D9ECD
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767890583; cv=none; b=Q+58ovSnMqBt+VBiF7UNW0y5rilCX1PGb8drB0q9EauFxqPLRGwdIe6kHVcYjoeu7jtmtzfiCogq11kqZARM7ImQHdTWqIzocNmAIGlD0fqDcupSUmNVXLSfG08HsZHvHifBPjqQNPvEk9ztqhRK60SXBW8j5C1pGKtDT6wsxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767890583; c=relaxed/simple;
	bh=BOU8xkXJxjbA6gwoVDRq+SmU+RQ63H+EckV0vFPFNyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CtXRo8lDbR+YGBw4BrDfpw/gQRPDvOvyozK1VVdW/vwO8aSFQmYldIZLHjT8n4t/0XfnYYZMwoP3FDRes/1so2VSO50jDcs41lZnnZWkMPABkk5hy1coHBuQodYr+uOgaPwemXnWj4KWjn1/3VT24u5BO1LxjDg2qKEot/qwVQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSmeZl8Q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSmeZl8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767890581; x=1799426581;
  h=date:from:to:cc:subject:message-id;
  bh=BOU8xkXJxjbA6gwoVDRq+SmU+RQ63H+EckV0vFPFNyQ=;
  b=HSmeZl8QM740heE1K+CAn8CV0LOj1go2d/AaNYIF3zUukehfUPu0cQtQ
   cYXhCAJ4UQggogfu5EhSXz8T5qBn0lgjVr0+e4FBln7vo2xQbjyQriLNA
   ZQ86T7fEogll2bwofKhkY2L9SOht0dXSwkMa4+FBTOFjNvPIaim2sG2Dj
   VBpHSpaUHN7Jv+MXU94ZC4qN+IMeOfYWXNqqkbSRqSEeaapC53JVEqpKX
   7CmZW166boDAqkm/xoaFcuI5SEursz/3d2BI93JUSv3Ys9PiP+Te9pE6U
   xicm6t7rLAiUAC6p0e/YGmUaeTT5caB22W/agljs9T9uEtzhTR78Vh9Up
   g==;
X-CSE-ConnectionGUID: 6Ugt3L5XRuKFo+Jhts++Bg==
X-CSE-MsgGUID: h260ZNt6SByObVTPIW5X+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="72908779"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="72908779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 08:43:01 -0800
X-CSE-ConnectionGUID: CFYinAn5SD2WXnPvSYeFbQ==
X-CSE-MsgGUID: EOeUb9zaSFym7wwtt4QKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203681671"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 08:42:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdt68-000000004y4-2ncU;
	Thu, 08 Jan 2026 16:42:56 +0000
Date: Fri, 09 Jan 2026 00:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/43]
 drivers/accessibility/speakup/main.c:1750 speakup_bs() error: uninitialized
 symbol 'flags'.
Message-ID: <202601090027.FTKn6n5X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   a45026cef17d1080c985adf28234d6c8475ad66f
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/43] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 6 hours ago
:::::: commit date: 3 days ago
config: csky-randconfig-r072-20260108 (https://download.01.org/0day-ci/archive/20260109/202601090027.FTKn6n5X-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601090027.FTKn6n5X-lkp@intel.com/

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
