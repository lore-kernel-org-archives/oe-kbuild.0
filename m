Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFFC379990
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095414; cv=none; b=HZskPlr9BWebUFQIFgqimH4FfTCvfvXj2Y2gQaw64iclkWtX4ytBFnUwDbgp9z4vloeYELPTm6jO0tjZGqTyGRlCmGsoYZDyseC8gQaqEfZ+2FPXckFKWkTsd1SydXkr/7nLfADth9CQHYEXunfYObvx61hqwgiBRgslDcH7TqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095414; c=relaxed/simple;
	bh=UEL4dLmsB063XsuXYXUYF6J99TcoHUVuGDeP1iOlD50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHQfbTyj20qBUiEKaMR/XY5u/WWHevrfcfufxeumw7b7AD1ulUqde+F/FOWK/mlQYtGDsJspe+Zz7ifBZiL6yhb6B59/pbBr6AXTIpFjJSzwgDFjRoMqYLpmYOs7tB63Lw3FFHLHs0rjq01kTViTs595TmCMU9FWzh1SheghXuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4nLzjx6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4nLzjx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776095412; x=1807631412;
  h=date:from:to:cc:subject:message-id;
  bh=UEL4dLmsB063XsuXYXUYF6J99TcoHUVuGDeP1iOlD50=;
  b=a4nLzjx69VqW3JYFbKXUVMN+PgjX900/jTTQZRrK479HEKNP0ZE1ste2
   Wg7HCaTZN4+uxtViBkcKRTcEBgxT4unYHIdmLPMKZ+5kJcO7oHWh/Thmp
   1uPVe6zUAOHg675BsYCOlOWDccxqgFM+3Lq+Tre4VGZSouqpUyZ5P7NgQ
   lE4dbkhLiZYhaQZak4TPjIgwosJLcKMTKRZIbLGYoaum/zHXQqFhXXuOA
   Tpll44IbSky6DIqMPpG1FU5ECgKAtH7ib8d2cN9Cagu8bcPLDXkJ6PnlK
   JVIKDt6k4WwFXprSPa33bfHiHFDcZ4Y6b1W3GVLRr/nFUtsdg9XeuwMmA
   g==;
X-CSE-ConnectionGUID: wLtXCBubRZaKE+dCfa2onQ==
X-CSE-MsgGUID: gg+ceKqBT7+AC5lQLd+g8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76999294"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="76999294"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 08:50:11 -0700
X-CSE-ConnectionGUID: 0DR7Z8tlQLiQIzJKP3V19A==
X-CSE-MsgGUID: N0ocq9UDQlS2+Bxzd5PXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="260259488"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Apr 2026 08:50:09 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCJY7-000000000cb-0hfv;
	Mon, 13 Apr 2026 15:50:07 +0000
Date: Mon, 13 Apr 2026 23:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/wireless/nl80211.c:10073 nl80211_trigger_scan() warn:
 potential spectre issue 'request->req.rates' [r] (local cap)
Message-ID: <202604132310.N9dmpVJC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>
CC: Benjamin Berg <benjamin.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   028ef9c96e96197026887c0f092424679298aae8
commit: f0df91b6a7120d85c873f5e77bc183fb6eccda16 wifi: cfg80211: hide scan internals
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-r072-20260413 (https://download.01.org/0day-ci/archive/20260413/202604132310.N9dmpVJC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f0df91b6a712 ("wifi: cfg80211: hide scan internals")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604132310.N9dmpVJC-lkp@intel.com/

New smatch warnings:
net/wireless/nl80211.c:10073 nl80211_trigger_scan() warn: potential spectre issue 'request->req.rates' [r] (local cap)

Old smatch warnings:
net/wireless/nl80211.c:277 validate_ie_attr() warn: potential spectre issue 'elem->data' [r]
net/wireless/nl80211.c:4156 nl80211_send_iface() error: we previously assumed 'rdev->ops->get_channel' could be null (see line 4079)
net/wireless/nl80211.c:5444 nl80211_parse_tx_bitrate_mask() warn: potential spectre issue 'rdev->wiphy.bands' [r] (local cap)
net/wireless/nl80211.c:5445 nl80211_parse_tx_bitrate_mask() warn: possible spectre second half.  'sband'
net/wireless/nl80211.c:5454 nl80211_parse_tx_bitrate_mask() warn: potential spectre issue 'mask->control' [w] (local cap)
net/wireless/nl80211.c:10070 nl80211_trigger_scan() warn: potential spectre issue 'wiphy->bands' [r] (local cap)

vim +10073 net/wireless/nl80211.c

2d23d0736e3a4a Roee Zamir                2017-08-06   9889  
2a519311926906 Johannes Berg             2009-02-10   9890  static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
2a519311926906 Johannes Berg             2009-02-10   9891  {
4c476991062a0a Johannes Berg             2010-10-04   9892  	struct cfg80211_registered_device *rdev = info->user_ptr[0];
fd0142844efa85 Johannes Berg             2012-06-18   9893  	struct wireless_dev *wdev = info->user_ptr[1];
f0df91b6a7120d Johannes Berg             2025-06-09   9894  	struct cfg80211_scan_request_int *request;
2032f3b2f94325 Thomas Pedersen           2020-04-30   9895  	struct nlattr *scan_freqs = NULL;
2032f3b2f94325 Thomas Pedersen           2020-04-30   9896  	bool scan_freqs_khz = false;
2a519311926906 Johannes Berg             2009-02-10   9897  	struct nlattr *attr;
2a519311926906 Johannes Berg             2009-02-10   9898  	struct wiphy *wiphy;
83f5e2cf79390f Johannes Berg             2009-06-17   9899  	int err, tmp, n_ssids = 0, n_channels, i;
14e05beb10326e Jacob Keller              2023-02-28   9900  	size_t ie_len, size;
838c7b8f1f2784 Kees Cook                 2024-04-24   9901  	size_t ssids_offset, ie_offset;
2a519311926906 Johannes Berg             2009-02-10   9902  
79c97e97aed7f7 Johannes Berg             2009-07-07   9903  	wiphy = &rdev->wiphy;
2a519311926906 Johannes Berg             2009-02-10   9904  
cb3b7d87652aeb Ayala Beker               2016-09-20   9905  	if (wdev->iftype == NL80211_IFTYPE_NAN)
cb3b7d87652aeb Ayala Beker               2016-09-20   9906  		return -EOPNOTSUPP;
cb3b7d87652aeb Ayala Beker               2016-09-20   9907  
4c476991062a0a Johannes Berg             2010-10-04   9908  	if (!rdev->ops->scan)
4c476991062a0a Johannes Berg             2010-10-04   9909  		return -EOPNOTSUPP;
2a519311926906 Johannes Berg             2009-02-10   9910  
8328685682965c Christophe JAILLET        2020-07-12   9911  	if (rdev->scan_req || rdev->scan_msg)
8328685682965c Christophe JAILLET        2020-07-12   9912  		return -EBUSY;
2a519311926906 Johannes Berg             2009-02-10   9913  
2032f3b2f94325 Thomas Pedersen           2020-04-30   9914  	if (info->attrs[NL80211_ATTR_SCAN_FREQ_KHZ]) {
2032f3b2f94325 Thomas Pedersen           2020-04-30   9915  		if (!wiphy_ext_feature_isset(wiphy,
2032f3b2f94325 Thomas Pedersen           2020-04-30   9916  					     NL80211_EXT_FEATURE_SCAN_FREQ_KHZ))
2032f3b2f94325 Thomas Pedersen           2020-04-30   9917  			return -EOPNOTSUPP;
2032f3b2f94325 Thomas Pedersen           2020-04-30   9918  		scan_freqs = info->attrs[NL80211_ATTR_SCAN_FREQ_KHZ];
2032f3b2f94325 Thomas Pedersen           2020-04-30   9919  		scan_freqs_khz = true;
2032f3b2f94325 Thomas Pedersen           2020-04-30   9920  	} else if (info->attrs[NL80211_ATTR_SCAN_FREQUENCIES])
2032f3b2f94325 Thomas Pedersen           2020-04-30   9921  		scan_freqs = info->attrs[NL80211_ATTR_SCAN_FREQUENCIES];
2032f3b2f94325 Thomas Pedersen           2020-04-30   9922  
2032f3b2f94325 Thomas Pedersen           2020-04-30   9923  	if (scan_freqs) {
2032f3b2f94325 Thomas Pedersen           2020-04-30   9924  		n_channels = validate_scan_freqs(scan_freqs);
8328685682965c Christophe JAILLET        2020-07-12   9925  		if (!n_channels)
8328685682965c Christophe JAILLET        2020-07-12   9926  			return -EINVAL;
2a519311926906 Johannes Berg             2009-02-10   9927  	} else {
bdfbec2d2d240e Ilan Peer                 2014-01-09   9928  		n_channels = ieee80211_get_num_supported_channels(wiphy);
2a519311926906 Johannes Berg             2009-02-10   9929  	}
2a519311926906 Johannes Berg             2009-02-10   9930  
2a519311926906 Johannes Berg             2009-02-10   9931  	if (info->attrs[NL80211_ATTR_SCAN_SSIDS])
2a519311926906 Johannes Berg             2009-02-10   9932  		nla_for_each_nested(attr, info->attrs[NL80211_ATTR_SCAN_SSIDS], tmp)
2a519311926906 Johannes Berg             2009-02-10   9933  			n_ssids++;
2a519311926906 Johannes Berg             2009-02-10   9934  
8328685682965c Christophe JAILLET        2020-07-12   9935  	if (n_ssids > wiphy->max_scan_ssids)
8328685682965c Christophe JAILLET        2020-07-12   9936  		return -EINVAL;
2a519311926906 Johannes Berg             2009-02-10   9937  
70692ad2923a37 Jouni Malinen             2009-02-16   9938  	if (info->attrs[NL80211_ATTR_IE])
70692ad2923a37 Jouni Malinen             2009-02-16   9939  		ie_len = nla_len(info->attrs[NL80211_ATTR_IE]);
70692ad2923a37 Jouni Malinen             2009-02-16   9940  	else
70692ad2923a37 Jouni Malinen             2009-02-16   9941  		ie_len = 0;
70692ad2923a37 Jouni Malinen             2009-02-16   9942  
8328685682965c Christophe JAILLET        2020-07-12   9943  	if (ie_len > wiphy->max_scan_ie_len)
8328685682965c Christophe JAILLET        2020-07-12   9944  		return -EINVAL;
18a8365992a804 Johannes Berg             2009-03-31   9945  
f0df91b6a7120d Johannes Berg             2025-06-09   9946  	size = struct_size(request, req.channels, n_channels);
838c7b8f1f2784 Kees Cook                 2024-04-24   9947  	ssids_offset = size;
f0df91b6a7120d Johannes Berg             2025-06-09   9948  	size = size_add(size, array_size(sizeof(*request->req.ssids), n_ssids));
838c7b8f1f2784 Kees Cook                 2024-04-24   9949  	ie_offset = size;
14e05beb10326e Jacob Keller              2023-02-28   9950  	size = size_add(size, ie_len);
14e05beb10326e Jacob Keller              2023-02-28   9951  	request = kzalloc(size, GFP_KERNEL);
8328685682965c Christophe JAILLET        2020-07-12   9952  	if (!request)
8328685682965c Christophe JAILLET        2020-07-12   9953  		return -ENOMEM;
f0df91b6a7120d Johannes Berg             2025-06-09   9954  	request->req.n_channels = n_channels;
2a519311926906 Johannes Berg             2009-02-10   9955  
2a519311926906 Johannes Berg             2009-02-10   9956  	if (n_ssids)
f0df91b6a7120d Johannes Berg             2025-06-09   9957  		request->req.ssids = (void *)request + ssids_offset;
f0df91b6a7120d Johannes Berg             2025-06-09   9958  	request->req.n_ssids = n_ssids;
838c7b8f1f2784 Kees Cook                 2024-04-24   9959  	if (ie_len)
f0df91b6a7120d Johannes Berg             2025-06-09   9960  		request->req.ie = (void *)request + ie_offset;
2a519311926906 Johannes Berg             2009-02-10   9961  
584991dccfd347 Johannes Berg             2009-11-02   9962  	i = 0;
2032f3b2f94325 Thomas Pedersen           2020-04-30   9963  	if (scan_freqs) {
2a519311926906 Johannes Berg             2009-02-10   9964  		/* user specified, bail out if channel not found */
2032f3b2f94325 Thomas Pedersen           2020-04-30   9965  		nla_for_each_nested(attr, scan_freqs, tmp) {
584991dccfd347 Johannes Berg             2009-11-02   9966  			struct ieee80211_channel *chan;
2032f3b2f94325 Thomas Pedersen           2020-04-30   9967  			int freq = nla_get_u32(attr);
584991dccfd347 Johannes Berg             2009-11-02   9968  
2032f3b2f94325 Thomas Pedersen           2020-04-30   9969  			if (!scan_freqs_khz)
2032f3b2f94325 Thomas Pedersen           2020-04-30   9970  				freq = MHZ_TO_KHZ(freq);
584991dccfd347 Johannes Berg             2009-11-02   9971  
2032f3b2f94325 Thomas Pedersen           2020-04-30   9972  			chan = ieee80211_get_channel_khz(wiphy, freq);
584991dccfd347 Johannes Berg             2009-11-02   9973  			if (!chan) {
2a519311926906 Johannes Berg             2009-02-10   9974  				err = -EINVAL;
2a519311926906 Johannes Berg             2009-02-10   9975  				goto out_free;
2a519311926906 Johannes Berg             2009-02-10   9976  			}
584991dccfd347 Johannes Berg             2009-11-02   9977  
584991dccfd347 Johannes Berg             2009-11-02   9978  			/* ignore disabled channels */
3607798ad9bdef Felix Fietkau             2024-10-09   9979  			if (chan->flags & IEEE80211_CHAN_DISABLED ||
3607798ad9bdef Felix Fietkau             2024-10-09   9980  			    !cfg80211_wdev_channel_allowed(wdev, chan))
584991dccfd347 Johannes Berg             2009-11-02   9981  				continue;
584991dccfd347 Johannes Berg             2009-11-02   9982  
f0df91b6a7120d Johannes Berg             2025-06-09   9983  			request->req.channels[i] = chan;
2a519311926906 Johannes Berg             2009-02-10   9984  			i++;
2a519311926906 Johannes Berg             2009-02-10   9985  		}
2a519311926906 Johannes Berg             2009-02-10   9986  	} else {
57fbcce37be7c1 Johannes Berg             2016-04-12   9987  		enum nl80211_band band;
34850ab25d74ab Johannes Berg             2011-07-18   9988  
2a519311926906 Johannes Berg             2009-02-10   9989  		/* all channels */
57fbcce37be7c1 Johannes Berg             2016-04-12   9990  		for (band = 0; band < NUM_NL80211_BANDS; band++) {
2a519311926906 Johannes Berg             2009-02-10   9991  			int j;
7a087e7484c9e4 Kirtika Ruchandani        2016-05-29   9992  
2a519311926906 Johannes Berg             2009-02-10   9993  			if (!wiphy->bands[band])
2a519311926906 Johannes Berg             2009-02-10   9994  				continue;
2a519311926906 Johannes Berg             2009-02-10   9995  			for (j = 0; j < wiphy->bands[band]->n_channels; j++) {
584991dccfd347 Johannes Berg             2009-11-02   9996  				struct ieee80211_channel *chan;
584991dccfd347 Johannes Berg             2009-11-02   9997  
584991dccfd347 Johannes Berg             2009-11-02   9998  				chan = &wiphy->bands[band]->channels[j];
584991dccfd347 Johannes Berg             2009-11-02   9999  
3607798ad9bdef Felix Fietkau             2024-10-09  10000  				if (chan->flags & IEEE80211_CHAN_DISABLED ||
3607798ad9bdef Felix Fietkau             2024-10-09  10001  				    !cfg80211_wdev_channel_allowed(wdev, chan))
584991dccfd347 Johannes Berg             2009-11-02  10002  					continue;
584991dccfd347 Johannes Berg             2009-11-02  10003  
f0df91b6a7120d Johannes Berg             2025-06-09  10004  				request->req.channels[i] = chan;
2a519311926906 Johannes Berg             2009-02-10  10005  				i++;
2a519311926906 Johannes Berg             2009-02-10  10006  			}
2a519311926906 Johannes Berg             2009-02-10  10007  		}
2a519311926906 Johannes Berg             2009-02-10  10008  	}
2a519311926906 Johannes Berg             2009-02-10  10009  
584991dccfd347 Johannes Berg             2009-11-02  10010  	if (!i) {
584991dccfd347 Johannes Berg             2009-11-02  10011  		err = -EINVAL;
584991dccfd347 Johannes Berg             2009-11-02  10012  		goto out_free;
584991dccfd347 Johannes Berg             2009-11-02  10013  	}
584991dccfd347 Johannes Berg             2009-11-02  10014  
f0df91b6a7120d Johannes Berg             2025-06-09  10015  	request->req.n_channels = i;
584991dccfd347 Johannes Berg             2009-11-02  10016  
f0df91b6a7120d Johannes Berg             2025-06-09  10017  	for (i = 0; i < request->req.n_channels; i++) {
f0df91b6a7120d Johannes Berg             2025-06-09  10018  		struct ieee80211_channel *chan = request->req.channels[i];
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  10019  
7b0a0e3c3a8826 Johannes Berg             2022-04-14  10020  		/* if we can go off-channel to the target channel we're good */
7b0a0e3c3a8826 Johannes Berg             2022-04-14  10021  		if (cfg80211_off_channel_oper_allowed(wdev, chan))
7b0a0e3c3a8826 Johannes Berg             2022-04-14  10022  			continue;
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  10023  
7b0a0e3c3a8826 Johannes Berg             2022-04-14  10024  		if (!cfg80211_wdev_on_sub_chan(wdev, chan, true)) {
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  10025  			err = -EBUSY;
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  10026  			goto out_free;
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  10027  		}
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  10028  	}
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  10029  
2a519311926906 Johannes Berg             2009-02-10  10030  	i = 0;
13874e4b23de83 Johannes Berg             2015-01-23  10031  	if (n_ssids) {
2a519311926906 Johannes Berg             2009-02-10  10032  		nla_for_each_nested(attr, info->attrs[NL80211_ATTR_SCAN_SSIDS], tmp) {
57a27e1d6a3bb9 Luciano Coelho            2011-06-07  10033  			if (nla_len(attr) > IEEE80211_MAX_SSID_LEN) {
2a519311926906 Johannes Berg             2009-02-10  10034  				err = -EINVAL;
2a519311926906 Johannes Berg             2009-02-10  10035  				goto out_free;
2a519311926906 Johannes Berg             2009-02-10  10036  			}
f0df91b6a7120d Johannes Berg             2025-06-09  10037  			request->req.ssids[i].ssid_len = nla_len(attr);
f0df91b6a7120d Johannes Berg             2025-06-09  10038  			memcpy(request->req.ssids[i].ssid,
f0df91b6a7120d Johannes Berg             2025-06-09  10039  			       nla_data(attr), nla_len(attr));
2a519311926906 Johannes Berg             2009-02-10  10040  			i++;
2a519311926906 Johannes Berg             2009-02-10  10041  		}
2a519311926906 Johannes Berg             2009-02-10  10042  	}
2a519311926906 Johannes Berg             2009-02-10  10043  
70692ad2923a37 Jouni Malinen             2009-02-16  10044  	if (info->attrs[NL80211_ATTR_IE]) {
f0df91b6a7120d Johannes Berg             2025-06-09  10045  		request->req.ie_len = nla_len(info->attrs[NL80211_ATTR_IE]);
f0df91b6a7120d Johannes Berg             2025-06-09  10046  		memcpy((void *)request->req.ie,
de95a54b1aebe5 Johannes Berg             2009-04-01  10047  		       nla_data(info->attrs[NL80211_ATTR_IE]),
f0df91b6a7120d Johannes Berg             2025-06-09  10048  		       request->req.ie_len);
70692ad2923a37 Jouni Malinen             2009-02-16  10049  	}
70692ad2923a37 Jouni Malinen             2009-02-16  10050  
57fbcce37be7c1 Johannes Berg             2016-04-12  10051  	for (i = 0; i < NUM_NL80211_BANDS; i++)
a401d2bb363d94 Johannes Berg             2011-07-20  10052  		if (wiphy->bands[i])
f0df91b6a7120d Johannes Berg             2025-06-09  10053  			request->req.rates[i] =
a401d2bb363d94 Johannes Berg             2011-07-20  10054  				(1 << wiphy->bands[i]->n_bitrates) - 1;
34850ab25d74ab Johannes Berg             2011-07-18  10055  
34850ab25d74ab Johannes Berg             2011-07-18  10056  	if (info->attrs[NL80211_ATTR_SCAN_SUPP_RATES]) {
34850ab25d74ab Johannes Berg             2011-07-18  10057  		nla_for_each_nested(attr,
34850ab25d74ab Johannes Berg             2011-07-18  10058  				    info->attrs[NL80211_ATTR_SCAN_SUPP_RATES],
34850ab25d74ab Johannes Berg             2011-07-18  10059  				    tmp) {
57fbcce37be7c1 Johannes Berg             2016-04-12  10060  			enum nl80211_band band = nla_type(attr);
34850ab25d74ab Johannes Berg             2011-07-18  10061  
57fbcce37be7c1 Johannes Berg             2016-04-12  10062  			if (band < 0 || band >= NUM_NL80211_BANDS) {
34850ab25d74ab Johannes Berg             2011-07-18  10063  				err = -EINVAL;
34850ab25d74ab Johannes Berg             2011-07-18  10064  				goto out_free;
34850ab25d74ab Johannes Berg             2011-07-18  10065  			}
1b09cd82d8c479 Felix Fietkau             2013-11-20  10066  
1b09cd82d8c479 Felix Fietkau             2013-11-20  10067  			if (!wiphy->bands[band])
1b09cd82d8c479 Felix Fietkau             2013-11-20  10068  				continue;
1b09cd82d8c479 Felix Fietkau             2013-11-20  10069  
34850ab25d74ab Johannes Berg             2011-07-18  10070  			err = ieee80211_get_ratemask(wiphy->bands[band],
34850ab25d74ab Johannes Berg             2011-07-18  10071  						     nla_data(attr),
34850ab25d74ab Johannes Berg             2011-07-18  10072  						     nla_len(attr),
f0df91b6a7120d Johannes Berg             2025-06-09 @10073  						     &request->req.rates[band]);
34850ab25d74ab Johannes Berg             2011-07-18  10074  			if (err)
34850ab25d74ab Johannes Berg             2011-07-18  10075  				goto out_free;
34850ab25d74ab Johannes Berg             2011-07-18  10076  		}
34850ab25d74ab Johannes Berg             2011-07-18  10077  	}
34850ab25d74ab Johannes Berg             2011-07-18  10078  
1d76250bd34af8 Avraham Stern             2016-07-05  10079  	if (info->attrs[NL80211_ATTR_MEASUREMENT_DURATION]) {
f0df91b6a7120d Johannes Berg             2025-06-09  10080  		request->req.duration =
1d76250bd34af8 Avraham Stern             2016-07-05  10081  			nla_get_u16(info->attrs[NL80211_ATTR_MEASUREMENT_DURATION]);
f0df91b6a7120d Johannes Berg             2025-06-09  10082  		request->req.duration_mandatory =
1d76250bd34af8 Avraham Stern             2016-07-05  10083  			nla_get_flag(info->attrs[NL80211_ATTR_MEASUREMENT_DURATION_MANDATORY]);
1d76250bd34af8 Avraham Stern             2016-07-05  10084  	}
1d76250bd34af8 Avraham Stern             2016-07-05  10085  
2d23d0736e3a4a Roee Zamir                2017-08-06  10086  	err = nl80211_check_scan_flags(wiphy, wdev, request, info->attrs,
2d23d0736e3a4a Roee Zamir                2017-08-06  10087  				       false);
ad2b26abc15746 Johannes Berg             2014-06-12  10088  	if (err)
ad2b26abc15746 Johannes Berg             2014-06-12  10089  		goto out_free;
ed47377154310f Sam Leffler               2012-10-11  10090  
f0df91b6a7120d Johannes Berg             2025-06-09  10091  	request->req.no_cck =
e9f935e3e8dc0b Rajkumar Manoharan        2011-09-25  10092  		nla_get_flag(info->attrs[NL80211_ATTR_TX_NO_CCK_RATE]);
e9f935e3e8dc0b Rajkumar Manoharan        2011-09-25  10093  
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10094  	/* Initial implementation used NL80211_ATTR_MAC to set the specific
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10095  	 * BSSID to scan for. This was problematic because that same attribute
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10096  	 * was already used for another purpose (local random MAC address). The
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10097  	 * NL80211_ATTR_BSSID attribute was added to fix this. For backwards
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10098  	 * compatibility with older userspace components, also use the
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10099  	 * NL80211_ATTR_MAC value here if it can be determined to be used for
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10100  	 * the specific BSSID use case instead of the random MAC address
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10101  	 * (NL80211_ATTR_SCAN_FLAGS is used to enable random MAC address use).
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10102  	 */
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10103  	if (info->attrs[NL80211_ATTR_BSSID])
f0df91b6a7120d Johannes Berg             2025-06-09  10104  		memcpy(request->req.bssid,
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10105  		       nla_data(info->attrs[NL80211_ATTR_BSSID]), ETH_ALEN);
f0df91b6a7120d Johannes Berg             2025-06-09  10106  	else if (!(request->req.flags & NL80211_SCAN_FLAG_RANDOM_ADDR) &&
2fa436b3a2a700 Vamsi Krishna             2016-12-02  10107  		 info->attrs[NL80211_ATTR_MAC])
f0df91b6a7120d Johannes Berg             2025-06-09  10108  		memcpy(request->req.bssid,
f0df91b6a7120d Johannes Berg             2025-06-09  10109  		       nla_data(info->attrs[NL80211_ATTR_MAC]),
818965d3917774 Jouni Malinen             2016-02-26  10110  		       ETH_ALEN);
818965d3917774 Jouni Malinen             2016-02-26  10111  	else
f0df91b6a7120d Johannes Berg             2025-06-09  10112  		eth_broadcast_addr(request->req.bssid);
818965d3917774 Jouni Malinen             2016-02-26  10113  
f0df91b6a7120d Johannes Berg             2025-06-09  10114  	request->req.tsf_report_link_id =
f0df91b6a7120d Johannes Berg             2025-06-09  10115  		nl80211_link_id_or_invalid(info->attrs);
f0df91b6a7120d Johannes Berg             2025-06-09  10116  	request->req.wdev = wdev;
f0df91b6a7120d Johannes Berg             2025-06-09  10117  	request->req.wiphy = &rdev->wiphy;
f0df91b6a7120d Johannes Berg             2025-06-09  10118  	request->req.scan_start = jiffies;
2a519311926906 Johannes Berg             2009-02-10  10119  
79c97e97aed7f7 Johannes Berg             2009-07-07  10120  	rdev->scan_req = request;
c8cb5b854b40f2 Tova Mussai               2020-09-18  10121  	err = cfg80211_scan(rdev);
2a519311926906 Johannes Berg             2009-02-10  10122  
504776be46cb61 Christophe JAILLET        2020-07-12  10123  	if (err)
504776be46cb61 Christophe JAILLET        2020-07-12  10124  		goto out_free;
504776be46cb61 Christophe JAILLET        2020-07-12  10125  
fd0142844efa85 Johannes Berg             2012-06-18  10126  	nl80211_send_scan_start(rdev, wdev);
fd0142844efa85 Johannes Berg             2012-06-18  10127  	dev_hold(wdev->netdev);
504776be46cb61 Christophe JAILLET        2020-07-12  10128  
504776be46cb61 Christophe JAILLET        2020-07-12  10129  	return 0;
504776be46cb61 Christophe JAILLET        2020-07-12  10130  
2a519311926906 Johannes Berg             2009-02-10  10131   out_free:
79c97e97aed7f7 Johannes Berg             2009-07-07  10132  	rdev->scan_req = NULL;
2a519311926906 Johannes Berg             2009-02-10  10133  	kfree(request);
3b85875a252dbb Johannes Berg             2009-03-12  10134  
2a519311926906 Johannes Berg             2009-02-10  10135  	return err;
2a519311926906 Johannes Berg             2009-02-10  10136  }
2a519311926906 Johannes Berg             2009-02-10  10137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
