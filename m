Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7C86ADC
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706712046; cv=none; b=b/qtLPfLHZpM5KxVPPByjB7Y59LOQXRFV+yVsouxi5u+l9Hk+1jJ9mmYht/GDl0gDkI2jjtV8fycJEKcP4YGWJuQDoBjS8qW7OYePK5zo0uRaSPbx/zWRLk8y7zTFFiHc7sMhlF5JHXo+uwQvKRYO/ZZnBDcKkjX+2Tzz89kO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706712046; c=relaxed/simple;
	bh=UKKik9gnkxW2sHonwxnqakFqOxSSqIACbVe66BzIhOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZ9MiXq+LBIOXtRpdYbzT5U9/cN/ee/cCfx5bOhJb27x45M6PpgYtsKNUMTDZ4z2/XJUF5MD0K+D+4cQCS/1Go7LsPMxOy2qUeaesMzcmdQSBj8VJVbCozYs+JuxE1W1LW8/hLyVHzNTGvo28ZGwGHDkvnq29z1d/EzE6VuHQ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5XJtVqx; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5XJtVqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706712043; x=1738248043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UKKik9gnkxW2sHonwxnqakFqOxSSqIACbVe66BzIhOw=;
  b=V5XJtVqx/F9AykRS0J/6RRD0n7VQcSm1Do1j+OORGjChtDFdSLE+WcLR
   Zg4VO/7fDmJMGnZxaid8AKuOpfZayT/kgB4o88VDqGMQi14/l1DM1QUU0
   /Nre3hmSdm1h+fRpNLo1dFOoG+8GHoGP4Yv8J+9+M08yIJ0K37PzFwgMN
   CG7W0Vp6NXVw5g93scF/0PLb+EBjNbwejCOwQPaoFy7QnGnhMxcY9iMc0
   O69OF74pljfvpsxcnHxf+bMb5JqqWc52ieEXPjZ/2TMozaZvyFliQSrmE
   7c65XPjB2FKuJ3+7RhMnD6g1/gKDbbE1aFyox1dzGWjVXAR81ACXTEhl9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="400754448"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="400754448"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 06:40:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911803956"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="911803956"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jan 2024 06:40:34 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVBlQ-0001dg-1V;
	Wed, 31 Jan 2024 14:40:32 +0000
Date: Wed, 31 Jan 2024 22:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [wireless-next:main 21/36] net/mac80211/scan.c:1000:53-54: WARNING
 opportunity for max()
Message-ID: <202401312249.CUHdacar-lkp@intel.com>
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
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Kalle Valo <kvalo@kernel.org>
CC: linux-wireless@vger.kernel.org
TO: "Michael-CY Lee" <michael-cy.lee@mediatek.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
head:   28b3df1fe6ba2cb439ba109f095aa841fef3a54f
commit: d60277ac3fc9c9f7887ff813c98d0a71ac2abde2 [21/36] wifi: mac80211: apply duration for SW scan
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-101-20240131 (https://download.01.org/0day-ci/archive/20240131/202401312249.CUHdacar-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401312249.CUHdacar-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/scan.c:1000:53-54: WARNING opportunity for max()

vim +1000 net/mac80211/scan.c

142b9f5074dc0d Helmut Schaa      2009-07-23   940  
2fb3f028a9a46b Helmut Schaa      2009-07-23   941  static void ieee80211_scan_state_set_channel(struct ieee80211_local *local,
2fb3f028a9a46b Helmut Schaa      2009-07-23   942  					     unsigned long *next_delay)
2fb3f028a9a46b Helmut Schaa      2009-07-23   943  {
2fb3f028a9a46b Helmut Schaa      2009-07-23   944  	int skip;
2fb3f028a9a46b Helmut Schaa      2009-07-23   945  	struct ieee80211_channel *chan;
6ea0a69ca21bbd Johannes Berg     2014-11-19   946  	struct cfg80211_scan_request *scan_req;
6ea0a69ca21bbd Johannes Berg     2014-11-19   947  
6ea0a69ca21bbd Johannes Berg     2014-11-19   948  	scan_req = rcu_dereference_protected(local->scan_req,
0cd8080e46b834 Johannes Berg     2023-08-28   949  					     lockdep_is_held(&local->hw.wiphy->mtx));
2fb3f028a9a46b Helmut Schaa      2009-07-23   950  
0a51b27e956bd9 Johannes Berg     2008-09-08   951  	skip = 0;
6ea0a69ca21bbd Johannes Berg     2014-11-19   952  	chan = scan_req->channels[local->scan_channel_idx];
0a51b27e956bd9 Johannes Berg     2008-09-08   953  
7ca15a0ae86506 Simon Wunderlich  2013-07-08   954  	local->scan_chandef.chan = chan;
7ca15a0ae86506 Simon Wunderlich  2013-07-08   955  	local->scan_chandef.center_freq1 = chan->center_freq;
b6011960f392d1 Thomas Pedersen   2020-04-01   956  	local->scan_chandef.freq1_offset = chan->freq_offset;
7ca15a0ae86506 Simon Wunderlich  2013-07-08   957  	local->scan_chandef.center_freq2 = 0;
75b1593533f13a Thomas Pedersen   2020-09-21   958  
5add321c329b17 Johannes Berg     2023-08-29   959  	/* For scanning on the S1G band, detect the channel width according to
5add321c329b17 Johannes Berg     2023-08-29   960  	 * the channel being scanned.
75b1593533f13a Thomas Pedersen   2020-09-21   961  	 */
75b1593533f13a Thomas Pedersen   2020-09-21   962  	if (chan->band == NL80211_BAND_S1GHZ) {
75b1593533f13a Thomas Pedersen   2020-09-21   963  		local->scan_chandef.width = ieee80211_s1g_channel_width(chan);
75b1593533f13a Thomas Pedersen   2020-09-21   964  		goto set_channel;
75b1593533f13a Thomas Pedersen   2020-09-21   965  	}
75b1593533f13a Thomas Pedersen   2020-09-21   966  
7ca15a0ae86506 Simon Wunderlich  2013-07-08   967  	/* If scanning on oper channel, use whatever channel-type
7ca15a0ae86506 Simon Wunderlich  2013-07-08   968  	 * is currently in use.
7ca15a0ae86506 Simon Wunderlich  2013-07-08   969  	 */
5add321c329b17 Johannes Berg     2023-08-29   970  	if (chan == local->_oper_chandef.chan)
7ca15a0ae86506 Simon Wunderlich  2013-07-08   971  		local->scan_chandef = local->_oper_chandef;
7ca15a0ae86506 Simon Wunderlich  2013-07-08   972  	else
7ca15a0ae86506 Simon Wunderlich  2013-07-08   973  		local->scan_chandef.width = NL80211_CHAN_WIDTH_20_NOHT;
b23b025fe246f3 Ben Greear        2011-02-04   974  
75b1593533f13a Thomas Pedersen   2020-09-21   975  set_channel:
584991dccfd347 Johannes Berg     2009-11-02   976  	if (ieee80211_hw_config(local, IEEE80211_CONF_CHANGE_CHANNEL))
0a51b27e956bd9 Johannes Berg     2008-09-08   977  		skip = 1;
0a51b27e956bd9 Johannes Berg     2008-09-08   978  
0a51b27e956bd9 Johannes Berg     2008-09-08   979  	/* advance state machine to next channel/band */
0a51b27e956bd9 Johannes Berg     2008-09-08   980  	local->scan_channel_idx++;
0a51b27e956bd9 Johannes Berg     2008-09-08   981  
0ee9c13c7c9258 Helmut Schaa      2009-07-25   982  	if (skip) {
0ee9c13c7c9258 Helmut Schaa      2009-07-25   983  		/* if we skip this channel return to the decision state */
0ee9c13c7c9258 Helmut Schaa      2009-07-25   984  		local->next_scan_state = SCAN_DECISION;
2fb3f028a9a46b Helmut Schaa      2009-07-23   985  		return;
0ee9c13c7c9258 Helmut Schaa      2009-07-25   986  	}
0a51b27e956bd9 Johannes Berg     2008-09-08   987  
99c84cb0692729 Johannes Berg     2009-05-08   988  	/*
99c84cb0692729 Johannes Berg     2009-05-08   989  	 * Probe delay is used to update the NAV, cf. 11.1.3.2.2
99c84cb0692729 Johannes Berg     2009-05-08   990  	 * (which unfortunately doesn't say _why_ step a) is done,
99c84cb0692729 Johannes Berg     2009-05-08   991  	 * but it waits for the probe delay or until a frame is
99c84cb0692729 Johannes Berg     2009-05-08   992  	 * received - and the received frame would update the NAV).
99c84cb0692729 Johannes Berg     2009-05-08   993  	 * For now, we do not support waiting until a frame is
99c84cb0692729 Johannes Berg     2009-05-08   994  	 * received.
99c84cb0692729 Johannes Berg     2009-05-08   995  	 *
99c84cb0692729 Johannes Berg     2009-05-08   996  	 * In any case, it is not necessary for a passive scan.
99c84cb0692729 Johannes Berg     2009-05-08   997  	 */
4e39ccac0d678e Antonio Quartulli 2015-11-21   998  	if ((chan->flags & (IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_RADAR)) ||
4e39ccac0d678e Antonio Quartulli 2015-11-21   999  	    !scan_req->n_ssids) {
d60277ac3fc9c9 Michael-CY Lee    2024-01-23 @1000  		*next_delay = msecs_to_jiffies(scan_req->duration) >
d60277ac3fc9c9 Michael-CY Lee    2024-01-23  1001  			      IEEE80211_PASSIVE_CHANNEL_TIME ?
d60277ac3fc9c9 Michael-CY Lee    2024-01-23  1002  			      msecs_to_jiffies(scan_req->duration) :
d60277ac3fc9c9 Michael-CY Lee    2024-01-23  1003  			      IEEE80211_PASSIVE_CHANNEL_TIME;
977923b00c7918 Helmut Schaa      2009-07-23  1004  		local->next_scan_state = SCAN_DECISION;
b041b7b9de6e1d Felix Fietkau     2022-04-20  1005  		if (scan_req->n_ssids)
b041b7b9de6e1d Felix Fietkau     2022-04-20  1006  			set_bit(SCAN_BEACON_WAIT, &local->scanning);
2fb3f028a9a46b Helmut Schaa      2009-07-23  1007  		return;
99c84cb0692729 Johannes Berg     2009-05-08  1008  	}
0a51b27e956bd9 Johannes Berg     2008-09-08  1009  
2fb3f028a9a46b Helmut Schaa      2009-07-23  1010  	/* active scan, send probes */
7d3be3cc489176 Helmut Schaa      2009-07-23  1011  	*next_delay = IEEE80211_PROBE_DELAY;
977923b00c7918 Helmut Schaa      2009-07-23  1012  	local->next_scan_state = SCAN_SEND_PROBE;
7d3be3cc489176 Helmut Schaa      2009-07-23  1013  }
7d3be3cc489176 Helmut Schaa      2009-07-23  1014  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
