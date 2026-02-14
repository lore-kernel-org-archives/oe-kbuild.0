Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F24128816
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771053199; cv=none; b=D1h43XpUYUtpqF276WcEeBOFKR7rG9Lhb/of5WxnunHBRMwvUYHiUueDSAmUaZ+lAppiIWiSczDQHtDF9QIirsG+cOpwmnxann2AvtdblgiY7lJAi3lhtiL/Mh+nQFR+1bupheHhgwpof5hKCSN9naPw7LKgqBqXGX4JUqh+bno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771053199; c=relaxed/simple;
	bh=Ry2qApNWuNDk3W4Q8PuRnyNeam5VVp8wUqsVygYWVD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oc9XbzJ7nLPlWX1SLqn/CC5SQcLrKak1wLb6jYldeFmYTC1mSgj3iQQFyvqS03RO6PyH+0es71bv+Am283iNhiLkm/po3V2UFRpMXmUvHEQ7euNjuhW5XVIEQpLrKagqsnQXRgSgj5h2xJtJuBgK4FlK/oQGB+x15FskXzw7nrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNjoU1zM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNjoU1zM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771053198; x=1802589198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ry2qApNWuNDk3W4Q8PuRnyNeam5VVp8wUqsVygYWVD4=;
  b=WNjoU1zM5HghXRA3ZLcauiJ4cASyUdVg7+nzztXUNilbkj0saTx83Euw
   SxEO7vW/Lgc6BgNu57fhwDO3/lWT52ty6yfLmqM+WV2Z5AUPqtlkatF65
   plwB9vCwdpjHZkylqNXy8juJlR1ifEzPueBaFfAVHMVNDBeUXe9Uj1jFU
   xzUziC1qSWUpOV0QQQW8DZsi0PmgGm18FKuFYRSIjm69GUyIITcr5n/Hs
   IYRCzZEQD7C3kHM1uNZTaAt9W/UFbK7xrfetUALG60xBNHmN7Vrq2828M
   sHabyeY0rZUgY5x0md6ujrO3cVYo5t1cDGLCn7CJsmNjSjZakPxnTbZbU
   A==;
X-CSE-ConnectionGUID: qUkJ1VzvQmaWA9qCqKbpYg==
X-CSE-MsgGUID: FjHyczY5T5WM++55j+KRBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76077936"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="76077936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 23:13:17 -0800
X-CSE-ConnectionGUID: g7r+QPmkQMqJSUZRCB3y1w==
X-CSE-MsgGUID: 2JMEAS89Qt6+K7pieyPzVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="236111621"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2026 23:13:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr9q6-00000000wKy-0hnC;
	Sat, 14 Feb 2026 07:13:14 +0000
Date: Sat, 14 Feb 2026 15:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC 1/2] wifi: mac80211: Add the capability to offload
 MLO link reconfiguration countdown in the NIC fw
Message-ID: <202602141535.yS6STaer-lkp@intel.com>
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
In-Reply-To: <20260212-mt7996-link-reconf-v1-1-2b110340d6c4@kernel.org>
References: <20260212-mt7996-link-reconf-v1-1-2b110340d6c4@kernel.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 4eefc435c985f4dfdba9afb1c705f0e17377c084]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/wifi-mac80211-Add-the-capability-to-offload-MLO-link-reconfiguration-countdown-in-the-NIC-fw/20260212-074113
base:   4eefc435c985f4dfdba9afb1c705f0e17377c084
patch link:    https://lore.kernel.org/r/20260212-mt7996-link-reconf-v1-1-2b110340d6c4%40kernel.org
patch subject: [PATCH RFC 1/2] wifi: mac80211: Add the capability to offload MLO link reconfiguration countdown in the NIC fw
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r071-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141535.yS6STaer-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602141535.yS6STaer-lkp@intel.com/

New smatch warnings:
net/mac80211/iface.c:1787 ieee80211_ap_work() warn: clear_bit() takes a bit number
net/mac80211/cfg.c:5329 ieee80211_mlo_reconf_complete_notify() warn: test_and_set_bit() takes a bit number

Old smatch warnings:
net/mac80211/iface.c:1940 ieee80211_setup_sdata() error: we previously assumed 'sdata->dev' could be null (see line 1896)

vim +1787 net/mac80211/iface.c

f5a4c24e689f54 Lorenzo Bianconi 2021-08-23  1778  
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1779  static void ieee80211_ap_work(struct ieee80211_sub_if_data *sdata)
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1780  {
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1781  	if (!test_bit(IEEE80211_IF_AP_RECONF_LINKS, &sdata->u.ap.flags))
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1782  		return;
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1783  
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1784  	cfg80211_mlo_reconf_complete_notify(sdata->dev,
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1785  					    sdata->u.ap.reconf_links);
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1786  	sdata->u.ap.reconf_links = 0;
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12 @1787  	clear_bit(IEEE80211_IF_AP_RECONF_LINKS, &sdata->u.ap.flags);
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1788  }
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1789  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
