Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB583CB1
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Apr 2024 18:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714415220; cv=none; b=OwXE9kyUwqikXUwU20TMkMzM++/sMbihT132LaK2Awev0ta6JHn8zQRvtm1Y28P7gygkSd+OqLi8jZRRvi8skMr1KPTrVPVcirZ1nHtlUcV5gTVlKSYUOEC3gtCrNLzwguWHm85LPrEHb7Fig304ETf1TT+WaCEIZGA6keEuDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714415220; c=relaxed/simple;
	bh=KANkis+6gPxO4+wIA80IUexOM0hSuqw1CSTsgfnfztg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHAwIESOYspluTm9v09kGIkd1XXOYhTSA/it0ognr7307NEGFAUB6nPY21gSRBlauaodAVpkxUmJ0RKenPtgEsAtG2JVQQ18gXsEEFzm3yUsdbe4sI98x2xfD38s0/Z5Tc7MDpCWmImwTJHIbAd+hh8PUs/Jx+KSEwBKSaMNiFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zg40eWdn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zg40eWdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714415217; x=1745951217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KANkis+6gPxO4+wIA80IUexOM0hSuqw1CSTsgfnfztg=;
  b=Zg40eWdnXCmgTm2XuDxLtX07tXBrCOUcukX+mp53O/iGlNCJtxvTXpGr
   ArLmxDTtpSgBbI92NtJQT9mhRU3GZVIIuyn490E6brv6k559cI3i3COg3
   AcRqmiMFWlKiAebdIsRdhCAJuen7+3tqfiOnjOLQ0NXnoZh7qp/mBs7y7
   pu8t7b94qsctvbYvZf2eH3YXnet3SuestBdGyKwMEmIVX5PhTJB/XG387
   YZJ4skPlYkLWYp/SH7JbRrXf+O42hbarNyrZaDbEnqdY38WuKq6h5u0FV
   uN3AkclnXq4Uv8/a/Nracc7AqW6SjbhBcHwcQN0UEeWO9ItrxpiCfxnZr
   w==;
X-CSE-ConnectionGUID: BshO2ioMRW+F4bFeR3v6gg==
X-CSE-MsgGUID: /bOkhqGwTNCJS89ewFObyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10212384"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="10212384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 11:26:56 -0700
X-CSE-ConnectionGUID: x3S1DK37RpiItMbnP3F7aQ==
X-CSE-MsgGUID: cFji3arsQhSt/nA09iNAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="49399738"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2024 11:26:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1ViH-0007N4-0O;
	Mon, 29 Apr 2024 18:26:53 +0000
Date: Tue, 30 Apr 2024 02:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 09/10] writeback: factor out wb_dirty_exceeded to remove
 repeated code
Message-ID: <202404300231.bnb28iB8-lkp@intel.com>
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
In-Reply-To: <20240429034738.138609-10-shikemeng@huaweicloud.com>
References: <20240429034738.138609-10-shikemeng@huaweicloud.com>
TO: Kemeng Shi <shikemeng@huaweicloud.com>
TO: willy@infradead.org
TO: akpm@linux-foundation.org
TO: jack@suse.cz
TO: tj@kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org

Hi Kemeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20240429]
[cannot apply to linus/master v6.9-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kemeng-Shi/writeback-factor-out-wb_bg_dirty_limits-to-remove-repeated-code/20240429-114903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240429034738.138609-10-shikemeng%40huaweicloud.com
patch subject: [PATCH 09/10] writeback: factor out wb_dirty_exceeded to remove repeated code
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20240429 (https://download.01.org/0day-ci/archive/20240430/202404300231.bnb28iB8-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404300231.bnb28iB8-lkp@intel.com/

New smatch warnings:
mm/page-writeback.c:1903 balance_dirty_pages() error: we previously assumed 'mdtc' could be null (see line 1886)

Old smatch warnings:
include/linux/mm.h:2246 arch_make_folio_accessible() error: uninitialized symbol 'ret'.

vim +/mdtc +1903 mm/page-writeback.c

8b8bf84233eccf Kemeng Shi      2024-04-29  1792  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1793  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  1794   * balance_dirty_pages() must be called by processes which are generating dirty
^1da177e4c3f41 Linus Torvalds  2005-04-16  1795   * data.  It looks at the number of dirty pages in the machine and will force
143dfe8611a630 Wu Fengguang    2010-08-27  1796   * the caller to wait once crossing the (background_thresh + dirty_thresh) / 2.
5b0830cb9085f4 Jens Axboe      2009-09-23  1797   * If we're over `background_thresh' then the writeback threads are woken to
5b0830cb9085f4 Jens Axboe      2009-09-23  1798   * perform some writeout.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1799   */
fe6c9c6e3e3e33 Jan Kara        2022-06-23  1800  static int balance_dirty_pages(struct bdi_writeback *wb,
fe6c9c6e3e3e33 Jan Kara        2022-06-23  1801  			       unsigned long pages_dirtied, unsigned int flags)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1802  {
2bc00aef030f4f Tejun Heo       2015-05-22  1803  	struct dirty_throttle_control gdtc_stor = { GDTC_INIT(wb) };
c2aa723a609363 Tejun Heo       2015-05-22  1804  	struct dirty_throttle_control mdtc_stor = { MDTC_INIT(wb, &gdtc_stor) };
2bc00aef030f4f Tejun Heo       2015-05-22  1805  	struct dirty_throttle_control * const gdtc = &gdtc_stor;
c2aa723a609363 Tejun Heo       2015-05-22  1806  	struct dirty_throttle_control * const mdtc = mdtc_valid(&mdtc_stor) ?
c2aa723a609363 Tejun Heo       2015-05-22  1807  						     &mdtc_stor : NULL;
c2aa723a609363 Tejun Heo       2015-05-22  1808  	struct dirty_throttle_control *sdtc;
c8a7ee1b73042a Kemeng Shi      2024-04-23  1809  	unsigned long nr_dirty;
83712358ba0a14 Wu Fengguang    2011-06-11  1810  	long period;
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1811  	long pause;
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1812  	long max_pause;
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1813  	long min_pause;
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1814  	int nr_dirtied_pause;
143dfe8611a630 Wu Fengguang    2010-08-27  1815  	unsigned long task_ratelimit;
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1816  	unsigned long dirty_ratelimit;
dfb8ae56783542 Tejun Heo       2015-05-22  1817  	struct backing_dev_info *bdi = wb->bdi;
5a53748568f796 Maxim Patlasov  2013-09-11  1818  	bool strictlimit = bdi->capabilities & BDI_CAP_STRICTLIMIT;
e98be2d599207c Wu Fengguang    2010-08-29  1819  	unsigned long start_time = jiffies;
fe6c9c6e3e3e33 Jan Kara        2022-06-23  1820  	int ret = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1821  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1822  	for (;;) {
83712358ba0a14 Wu Fengguang    2011-06-11  1823  		unsigned long now = jiffies;
83712358ba0a14 Wu Fengguang    2011-06-11  1824  
c8a7ee1b73042a Kemeng Shi      2024-04-23  1825  		nr_dirty = global_node_page_state(NR_FILE_DIRTY);
5fce25a9df4865 Peter Zijlstra  2007-11-14  1826  
204c26b42a22b8 Kemeng Shi      2024-04-29  1827  		balance_domain_limits(gdtc, strictlimit);
204c26b42a22b8 Kemeng Shi      2024-04-29  1828  		if (mdtc)
c2aa723a609363 Tejun Heo       2015-05-22  1829  			/*
c2aa723a609363 Tejun Heo       2015-05-22  1830  			 * If @wb belongs to !root memcg, repeat the same
c2aa723a609363 Tejun Heo       2015-05-22  1831  			 * basic calculations for the memcg domain.
c2aa723a609363 Tejun Heo       2015-05-22  1832  			 */
204c26b42a22b8 Kemeng Shi      2024-04-29  1833  			balance_domain_limits(mdtc, strictlimit);
5a53748568f796 Maxim Patlasov  2013-09-11  1834  
ea6813be07dcdc Jan Kara        2022-06-23  1835  		/*
ea6813be07dcdc Jan Kara        2022-06-23  1836  		 * In laptop mode, we wait until hitting the higher threshold
ea6813be07dcdc Jan Kara        2022-06-23  1837  		 * before starting background writeout, and then write out all
ea6813be07dcdc Jan Kara        2022-06-23  1838  		 * the way down to the lower threshold.  So slow writers cause
ea6813be07dcdc Jan Kara        2022-06-23  1839  		 * minimal disk activity.
ea6813be07dcdc Jan Kara        2022-06-23  1840  		 *
ea6813be07dcdc Jan Kara        2022-06-23  1841  		 * In normal mode, we start background writeout at the lower
ea6813be07dcdc Jan Kara        2022-06-23  1842  		 * background_thresh, to keep the amount of dirty memory low.
ea6813be07dcdc Jan Kara        2022-06-23  1843  		 */
c8a7ee1b73042a Kemeng Shi      2024-04-23  1844  		if (!laptop_mode && nr_dirty > gdtc->bg_thresh &&
ea6813be07dcdc Jan Kara        2022-06-23  1845  		    !writeback_in_progress(wb))
ea6813be07dcdc Jan Kara        2022-06-23  1846  			wb_start_background_writeback(wb);
ea6813be07dcdc Jan Kara        2022-06-23  1847  
16c4042f08919f Wu Fengguang    2010-08-11  1848  		/*
c2aa723a609363 Tejun Heo       2015-05-22  1849  		 * If memcg domain is in effect, @dirty should be under
c2aa723a609363 Tejun Heo       2015-05-22  1850  		 * both global and memcg freerun ceilings.
16c4042f08919f Wu Fengguang    2010-08-11  1851  		 */
c474a90dc076a7 Kemeng Shi      2024-04-29  1852  		if (gdtc->freerun && (!mdtc || mdtc->freerun)) {
a37b0715ddf300 NeilBrown       2020-06-01  1853  			unsigned long intv;
a37b0715ddf300 NeilBrown       2020-06-01  1854  			unsigned long m_intv;
a37b0715ddf300 NeilBrown       2020-06-01  1855  
a37b0715ddf300 NeilBrown       2020-06-01  1856  free_running:
c474a90dc076a7 Kemeng Shi      2024-04-29  1857  			intv = domain_poll_intv(gdtc, strictlimit);
a37b0715ddf300 NeilBrown       2020-06-01  1858  			m_intv = ULONG_MAX;
c2aa723a609363 Tejun Heo       2015-05-22  1859  
83712358ba0a14 Wu Fengguang    2011-06-11  1860  			current->dirty_paused_when = now;
83712358ba0a14 Wu Fengguang    2011-06-11  1861  			current->nr_dirtied = 0;
c2aa723a609363 Tejun Heo       2015-05-22  1862  			if (mdtc)
c474a90dc076a7 Kemeng Shi      2024-04-29  1863  				m_intv = domain_poll_intv(mdtc, strictlimit);
c2aa723a609363 Tejun Heo       2015-05-22  1864  			current->nr_dirtied_pause = min(intv, m_intv);
16c4042f08919f Wu Fengguang    2010-08-11  1865  			break;
83712358ba0a14 Wu Fengguang    2011-06-11  1866  		}
16c4042f08919f Wu Fengguang    2010-08-11  1867  
ea6813be07dcdc Jan Kara        2022-06-23  1868  		/* Start writeback even when in laptop mode */
bc05873dccd27d Tejun Heo       2015-05-22  1869  		if (unlikely(!writeback_in_progress(wb)))
9ecf4866c018ae Tejun Heo       2015-05-22  1870  			wb_start_background_writeback(wb);
143dfe8611a630 Wu Fengguang    2010-08-27  1871  
97b27821b4854c Tejun Heo       2019-08-26  1872  		mem_cgroup_flush_foreign(wb);
97b27821b4854c Tejun Heo       2019-08-26  1873  
c2aa723a609363 Tejun Heo       2015-05-22  1874  		/*
c2aa723a609363 Tejun Heo       2015-05-22  1875  		 * Calculate global domain's pos_ratio and select the
c2aa723a609363 Tejun Heo       2015-05-22  1876  		 * global dtc by default.
c2aa723a609363 Tejun Heo       2015-05-22  1877  		 */
aab09fbaa2dd34 Kemeng Shi      2024-04-29  1878  		wb_dirty_freerun(gdtc, strictlimit);
aab09fbaa2dd34 Kemeng Shi      2024-04-29  1879  		if (gdtc->freerun)
a37b0715ddf300 NeilBrown       2020-06-01  1880  			goto free_running;
a37b0715ddf300 NeilBrown       2020-06-01  1881  
8b8bf84233eccf Kemeng Shi      2024-04-29  1882  		wb_dirty_exceeded(gdtc, strictlimit);
daddfa3cb30ebf Tejun Heo       2015-05-22  1883  		wb_position_ratio(gdtc);
c2aa723a609363 Tejun Heo       2015-05-22  1884  		sdtc = gdtc;
e98be2d599207c Wu Fengguang    2010-08-29  1885  
c2aa723a609363 Tejun Heo       2015-05-22 @1886  		if (mdtc) {
c2aa723a609363 Tejun Heo       2015-05-22  1887  			/*
c2aa723a609363 Tejun Heo       2015-05-22  1888  			 * If memcg domain is in effect, calculate its
c2aa723a609363 Tejun Heo       2015-05-22  1889  			 * pos_ratio.  @wb should satisfy constraints from
c2aa723a609363 Tejun Heo       2015-05-22  1890  			 * both global and memcg domains.  Choose the one
c2aa723a609363 Tejun Heo       2015-05-22  1891  			 * w/ lower pos_ratio.
c2aa723a609363 Tejun Heo       2015-05-22  1892  			 */
aab09fbaa2dd34 Kemeng Shi      2024-04-29  1893  			wb_dirty_freerun(mdtc, strictlimit);
aab09fbaa2dd34 Kemeng Shi      2024-04-29  1894  			if (mdtc->freerun)
a37b0715ddf300 NeilBrown       2020-06-01  1895  				goto free_running;
aab09fbaa2dd34 Kemeng Shi      2024-04-29  1896  
8b8bf84233eccf Kemeng Shi      2024-04-29  1897  			wb_dirty_exceeded(mdtc, strictlimit);
c2aa723a609363 Tejun Heo       2015-05-22  1898  			wb_position_ratio(mdtc);
c2aa723a609363 Tejun Heo       2015-05-22  1899  			if (mdtc->pos_ratio < gdtc->pos_ratio)
c2aa723a609363 Tejun Heo       2015-05-22  1900  				sdtc = mdtc;
c2aa723a609363 Tejun Heo       2015-05-22  1901  		}
daddfa3cb30ebf Tejun Heo       2015-05-22  1902  
8b8bf84233eccf Kemeng Shi      2024-04-29 @1903  		wb->dirty_exceeded = gdtc->dirty_exceeded || mdtc->dirty_exceeded;
20792ebf3eeb82 Jan Kara        2021-09-02  1904  		if (time_is_before_jiffies(READ_ONCE(wb->bw_time_stamp) +
45a2966fd64147 Jan Kara        2021-09-02  1905  					   BANDWIDTH_INTERVAL))
fee468fdf41cdf Jan Kara        2021-09-02  1906  			__wb_update_bandwidth(gdtc, mdtc, true);
e98be2d599207c Wu Fengguang    2010-08-29  1907  
c2aa723a609363 Tejun Heo       2015-05-22  1908  		/* throttle according to the chosen dtc */
20792ebf3eeb82 Jan Kara        2021-09-02  1909  		dirty_ratelimit = READ_ONCE(wb->dirty_ratelimit);
c2aa723a609363 Tejun Heo       2015-05-22  1910  		task_ratelimit = ((u64)dirty_ratelimit * sdtc->pos_ratio) >>
3a73dbbc9bb3fc Wu Fengguang    2011-11-07  1911  							RATELIMIT_CALC_SHIFT;
c2aa723a609363 Tejun Heo       2015-05-22  1912  		max_pause = wb_max_pause(wb, sdtc->wb_dirty);
a88a341a73be4e Tejun Heo       2015-05-22  1913  		min_pause = wb_min_pause(wb, max_pause,
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1914  					 task_ratelimit, dirty_ratelimit,
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1915  					 &nr_dirtied_pause);
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1916  
3a73dbbc9bb3fc Wu Fengguang    2011-11-07  1917  		if (unlikely(task_ratelimit == 0)) {
83712358ba0a14 Wu Fengguang    2011-06-11  1918  			period = max_pause;
c8462cc9de9e92 Wu Fengguang    2011-06-11  1919  			pause = max_pause;
143dfe8611a630 Wu Fengguang    2010-08-27  1920  			goto pause;
e50e37201ae2e7 Wu Fengguang    2010-08-11  1921  		}
83712358ba0a14 Wu Fengguang    2011-06-11  1922  		period = HZ * pages_dirtied / task_ratelimit;
83712358ba0a14 Wu Fengguang    2011-06-11  1923  		pause = period;
83712358ba0a14 Wu Fengguang    2011-06-11  1924  		if (current->dirty_paused_when)
83712358ba0a14 Wu Fengguang    2011-06-11  1925  			pause -= now - current->dirty_paused_when;
83712358ba0a14 Wu Fengguang    2011-06-11  1926  		/*
83712358ba0a14 Wu Fengguang    2011-06-11  1927  		 * For less than 1s think time (ext3/4 may block the dirtier
83712358ba0a14 Wu Fengguang    2011-06-11  1928  		 * for up to 800ms from time to time on 1-HDD; so does xfs,
83712358ba0a14 Wu Fengguang    2011-06-11  1929  		 * however at much less frequency), try to compensate it in
83712358ba0a14 Wu Fengguang    2011-06-11  1930  		 * future periods by updating the virtual time; otherwise just
83712358ba0a14 Wu Fengguang    2011-06-11  1931  		 * do a reset, as it may be a light dirtier.
83712358ba0a14 Wu Fengguang    2011-06-11  1932  		 */
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1933  		if (pause < min_pause) {
5634cc2aa9aebc Tejun Heo       2015-08-18  1934  			trace_balance_dirty_pages(wb,
c2aa723a609363 Tejun Heo       2015-05-22  1935  						  sdtc->thresh,
c2aa723a609363 Tejun Heo       2015-05-22  1936  						  sdtc->bg_thresh,
c2aa723a609363 Tejun Heo       2015-05-22  1937  						  sdtc->dirty,
c2aa723a609363 Tejun Heo       2015-05-22  1938  						  sdtc->wb_thresh,
c2aa723a609363 Tejun Heo       2015-05-22  1939  						  sdtc->wb_dirty,
ece13ac31bbe49 Wu Fengguang    2010-08-29  1940  						  dirty_ratelimit,
ece13ac31bbe49 Wu Fengguang    2010-08-29  1941  						  task_ratelimit,
ece13ac31bbe49 Wu Fengguang    2010-08-29  1942  						  pages_dirtied,
83712358ba0a14 Wu Fengguang    2011-06-11  1943  						  period,
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1944  						  min(pause, 0L),
ece13ac31bbe49 Wu Fengguang    2010-08-29  1945  						  start_time);
83712358ba0a14 Wu Fengguang    2011-06-11  1946  			if (pause < -HZ) {
83712358ba0a14 Wu Fengguang    2011-06-11  1947  				current->dirty_paused_when = now;
83712358ba0a14 Wu Fengguang    2011-06-11  1948  				current->nr_dirtied = 0;
83712358ba0a14 Wu Fengguang    2011-06-11  1949  			} else if (period) {
83712358ba0a14 Wu Fengguang    2011-06-11  1950  				current->dirty_paused_when += period;
83712358ba0a14 Wu Fengguang    2011-06-11  1951  				current->nr_dirtied = 0;
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1952  			} else if (current->nr_dirtied_pause <= pages_dirtied)
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1953  				current->nr_dirtied_pause += pages_dirtied;
57fc978cfb61ed Wu Fengguang    2011-06-11  1954  			break;
e50e37201ae2e7 Wu Fengguang    2010-08-11  1955  		}
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1956  		if (unlikely(pause > max_pause)) {
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1957  			/* for occasional dropped task_ratelimit */
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1958  			now += min(pause - max_pause, max_pause);
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1959  			pause = max_pause;
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1960  		}
143dfe8611a630 Wu Fengguang    2010-08-27  1961  
143dfe8611a630 Wu Fengguang    2010-08-27  1962  pause:
5634cc2aa9aebc Tejun Heo       2015-08-18  1963  		trace_balance_dirty_pages(wb,
c2aa723a609363 Tejun Heo       2015-05-22  1964  					  sdtc->thresh,
c2aa723a609363 Tejun Heo       2015-05-22  1965  					  sdtc->bg_thresh,
c2aa723a609363 Tejun Heo       2015-05-22  1966  					  sdtc->dirty,
c2aa723a609363 Tejun Heo       2015-05-22  1967  					  sdtc->wb_thresh,
c2aa723a609363 Tejun Heo       2015-05-22  1968  					  sdtc->wb_dirty,
ece13ac31bbe49 Wu Fengguang    2010-08-29  1969  					  dirty_ratelimit,
ece13ac31bbe49 Wu Fengguang    2010-08-29  1970  					  task_ratelimit,
ece13ac31bbe49 Wu Fengguang    2010-08-29  1971  					  pages_dirtied,
83712358ba0a14 Wu Fengguang    2011-06-11  1972  					  period,
ece13ac31bbe49 Wu Fengguang    2010-08-29  1973  					  pause,
ece13ac31bbe49 Wu Fengguang    2010-08-29  1974  					  start_time);
fe6c9c6e3e3e33 Jan Kara        2022-06-23  1975  		if (flags & BDP_ASYNC) {
fe6c9c6e3e3e33 Jan Kara        2022-06-23  1976  			ret = -EAGAIN;
fe6c9c6e3e3e33 Jan Kara        2022-06-23  1977  			break;
fe6c9c6e3e3e33 Jan Kara        2022-06-23  1978  		}
499d05ecf990a7 Jan Kara        2011-11-16  1979  		__set_current_state(TASK_KILLABLE);
f814bdda774c18 Jan Kara        2024-01-23  1980  		bdi->last_bdp_sleep = jiffies;
d25105e8911bff Wu Fengguang    2009-10-09  1981  		io_schedule_timeout(pause);
87c6a9b253520b Jens Axboe      2009-09-17  1982  
83712358ba0a14 Wu Fengguang    2011-06-11  1983  		current->dirty_paused_when = now + pause;
83712358ba0a14 Wu Fengguang    2011-06-11  1984  		current->nr_dirtied = 0;
7ccb9ad5364d6a Wu Fengguang    2011-11-30  1985  		current->nr_dirtied_pause = nr_dirtied_pause;
83712358ba0a14 Wu Fengguang    2011-06-11  1986  
ffd1f609ab1053 Wu Fengguang    2011-06-19  1987  		/*
2bc00aef030f4f Tejun Heo       2015-05-22  1988  		 * This is typically equal to (dirty < thresh) and can also
2bc00aef030f4f Tejun Heo       2015-05-22  1989  		 * keep "1000+ dd on a slow USB stick" under control.
ffd1f609ab1053 Wu Fengguang    2011-06-19  1990  		 */
1df647197c5b8a Wu Fengguang    2011-11-13  1991  		if (task_ratelimit)
ffd1f609ab1053 Wu Fengguang    2011-06-19  1992  			break;
499d05ecf990a7 Jan Kara        2011-11-16  1993  
c5c6343c4d75f9 Wu Fengguang    2011-12-02  1994  		/*
f0953a1bbaca71 Ingo Molnar     2021-05-06  1995  		 * In the case of an unresponsive NFS server and the NFS dirty
de1fff37b2781f Tejun Heo       2015-05-22  1996  		 * pages exceeds dirty_thresh, give the other good wb's a pipe
c5c6343c4d75f9 Wu Fengguang    2011-12-02  1997  		 * to go through, so that tasks on them still remain responsive.
c5c6343c4d75f9 Wu Fengguang    2011-12-02  1998  		 *
3f8b6fb7f279c7 Masahiro Yamada 2017-02-27  1999  		 * In theory 1 page is enough to keep the consumer-producer
c5c6343c4d75f9 Wu Fengguang    2011-12-02  2000  		 * pipe going: the flusher cleans 1 page => the task dirties 1
de1fff37b2781f Tejun Heo       2015-05-22  2001  		 * more page. However wb_dirty has accounting errors.  So use
93f78d882865cb Tejun Heo       2015-05-22  2002  		 * the larger and more IO friendly wb_stat_error.
c5c6343c4d75f9 Wu Fengguang    2011-12-02  2003  		 */
2bce774e8245e9 Wang Long       2017-11-15  2004  		if (sdtc->wb_dirty <= wb_stat_error())
c5c6343c4d75f9 Wu Fengguang    2011-12-02  2005  			break;
c5c6343c4d75f9 Wu Fengguang    2011-12-02  2006  
499d05ecf990a7 Jan Kara        2011-11-16  2007  		if (fatal_signal_pending(current))
499d05ecf990a7 Jan Kara        2011-11-16  2008  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2009  	}
fe6c9c6e3e3e33 Jan Kara        2022-06-23  2010  	return ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2011  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2012  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
