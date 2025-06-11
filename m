Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2727D782
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Jun 2025 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644392; cv=none; b=AQP1NcwR6pXiWPeL5QofoveBC+jZrw6UdLH5v7n+HOoljgR1OQBYoNalJdAntxQDBdle7AOVLgZWNKDj/IwhW28YnPqFdh/GRSz4YbPHEJmFWmaEN/gfe//hX70rPJOD8D4Dha5iShkZ1kgFovZp0KuyEAv83zmkii6svVwSTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644392; c=relaxed/simple;
	bh=sRn6C8HDbD3mEj0KPv3Y/CPvbkTvzO8o0JmgsXLQjWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ExigoRAxpH0iZn5EbiA4hDvilGnjhDFv623MM0I6aivSCNlpNHT+nxRYGJnmPvd+zABadOpb/dkaxtWRFfOeZ2HmLJ0dPCSwNSAeIyw27nFQWUmvZjdOBpn74aep5srxOLFQ5yPuw6kD4HJcOFW7SVFWmCB6AW540ZxZG6Bsc9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtHadO1r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtHadO1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749644390; x=1781180390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sRn6C8HDbD3mEj0KPv3Y/CPvbkTvzO8o0JmgsXLQjWQ=;
  b=BtHadO1rPpzTkwBK22BtnJ8wtVD25F3kmaZOrsAD4LUvMEAIhBG4AcVG
   jTsEHbfExw7UsvGfNQEhlTx23i7+dDWtTrvquzeaVV9h75AxJ6QJr0I6H
   SkHUCfg4Rwj1Qov0n+S3VkXO65OG12XObq2rj6eEO4GzKWmQ1e8TTTDwu
   c2BMjwqtmwSMwJIzwhO7bQXrQq9njzpDk1fos+yJDOyc+x2kfWCo7rmtx
   JGMOafP0UvrZSE+9x7M1UNo7pV77SgBS58LEa1MAop4ypos8hiWiBh2m9
   xdxJq6cgPeMgFWka3bgdEIO2wVkEmNWy96DixE9LXNw3pBnkQo3hNaULf
   Q==;
X-CSE-ConnectionGUID: +HhhbsTqQHKzWlXb0nymMg==
X-CSE-MsgGUID: DacAL33IQOeCLG0x/H71hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55579448"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="55579448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 05:19:41 -0700
X-CSE-ConnectionGUID: 26PFV2Y1Q7e4NiYu4oTU8g==
X-CSE-MsgGUID: b04161R4TdyBPXnaVRWXCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="148095083"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2025 05:19:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPKQc-000AQK-0i;
	Wed, 11 Jun 2025 12:19:38 +0000
Date: Wed, 11 Jun 2025 20:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH wireless-next 07/15] wifi: cfg80211: hide scan internals
Message-ID: <202506111904.zPyJVeRF-lkp@intel.com>
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
In-Reply-To: <20250609213231.6a62e41858e2.I004f66e9c087cc6e6ae4a24951cf470961ee9466@changeid>
References: <20250609213231.6a62e41858e2.I004f66e9c087cc6e6ae4a24951cf470961ee9466@changeid>
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
TO: linux-wireless@vger.kernel.org
CC: Johannes Berg <johannes.berg@intel.com>
CC: Benjamin Berg <benjamin.berg@intel.com>

Hi Miri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miri-Korenblit/wifi-mac80211-avoid-weird-state-in-error-path/20250610-023727
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250609213231.6a62e41858e2.I004f66e9c087cc6e6ae4a24951cf470961ee9466%40changeid
patch subject: [PATCH wireless-next 07/15] wifi: cfg80211: hide scan internals
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111904.zPyJVeRF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506111904.zPyJVeRF-lkp@intel.com/

New smatch warnings:
net/wireless/nl80211.c:9558 nl80211_trigger_scan() warn: potential spectre issue 'request->req.rates' [r] (local cap)

Old smatch warnings:
net/wireless/nl80211.c:277 validate_ie_attr() warn: potential spectre issue 'elem->data' [r]
net/wireless/nl80211.c:4080 nl80211_send_iface() error: we previously assumed 'rdev->ops->get_channel' could be null (see line 4003)
net/wireless/nl80211.c:5368 nl80211_parse_tx_bitrate_mask() warn: potential spectre issue 'rdev->wiphy.bands' [r] (local cap)
net/wireless/nl80211.c:5369 nl80211_parse_tx_bitrate_mask() warn: possible spectre second half.  'sband'
net/wireless/nl80211.c:5378 nl80211_parse_tx_bitrate_mask() warn: potential spectre issue 'mask->control' [w] (local cap)
net/wireless/nl80211.c:9555 nl80211_trigger_scan() warn: potential spectre issue 'wiphy->bands' [r] (local cap)

vim +9558 net/wireless/nl80211.c

2d23d0736e3a4a Roee Zamir                2017-08-06  9374  
2a519311926906 Johannes Berg             2009-02-10  9375  static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
2a519311926906 Johannes Berg             2009-02-10  9376  {
4c476991062a0a Johannes Berg             2010-10-04  9377  	struct cfg80211_registered_device *rdev = info->user_ptr[0];
fd0142844efa85 Johannes Berg             2012-06-18  9378  	struct wireless_dev *wdev = info->user_ptr[1];
655f189ad02b2c Johannes Berg             2025-06-09  9379  	struct cfg80211_scan_request_int *request;
2032f3b2f94325 Thomas Pedersen           2020-04-30  9380  	struct nlattr *scan_freqs = NULL;
2032f3b2f94325 Thomas Pedersen           2020-04-30  9381  	bool scan_freqs_khz = false;
2a519311926906 Johannes Berg             2009-02-10  9382  	struct nlattr *attr;
2a519311926906 Johannes Berg             2009-02-10  9383  	struct wiphy *wiphy;
83f5e2cf79390f Johannes Berg             2009-06-17  9384  	int err, tmp, n_ssids = 0, n_channels, i;
14e05beb10326e Jacob Keller              2023-02-28  9385  	size_t ie_len, size;
838c7b8f1f2784 Kees Cook                 2024-04-24  9386  	size_t ssids_offset, ie_offset;
2a519311926906 Johannes Berg             2009-02-10  9387  
79c97e97aed7f7 Johannes Berg             2009-07-07  9388  	wiphy = &rdev->wiphy;
2a519311926906 Johannes Berg             2009-02-10  9389  
cb3b7d87652aeb Ayala Beker               2016-09-20  9390  	if (wdev->iftype == NL80211_IFTYPE_NAN)
cb3b7d87652aeb Ayala Beker               2016-09-20  9391  		return -EOPNOTSUPP;
cb3b7d87652aeb Ayala Beker               2016-09-20  9392  
4c476991062a0a Johannes Berg             2010-10-04  9393  	if (!rdev->ops->scan)
4c476991062a0a Johannes Berg             2010-10-04  9394  		return -EOPNOTSUPP;
2a519311926906 Johannes Berg             2009-02-10  9395  
8328685682965c Christophe JAILLET        2020-07-12  9396  	if (rdev->scan_req || rdev->scan_msg)
8328685682965c Christophe JAILLET        2020-07-12  9397  		return -EBUSY;
2a519311926906 Johannes Berg             2009-02-10  9398  
2032f3b2f94325 Thomas Pedersen           2020-04-30  9399  	if (info->attrs[NL80211_ATTR_SCAN_FREQ_KHZ]) {
2032f3b2f94325 Thomas Pedersen           2020-04-30  9400  		if (!wiphy_ext_feature_isset(wiphy,
2032f3b2f94325 Thomas Pedersen           2020-04-30  9401  					     NL80211_EXT_FEATURE_SCAN_FREQ_KHZ))
2032f3b2f94325 Thomas Pedersen           2020-04-30  9402  			return -EOPNOTSUPP;
2032f3b2f94325 Thomas Pedersen           2020-04-30  9403  		scan_freqs = info->attrs[NL80211_ATTR_SCAN_FREQ_KHZ];
2032f3b2f94325 Thomas Pedersen           2020-04-30  9404  		scan_freqs_khz = true;
2032f3b2f94325 Thomas Pedersen           2020-04-30  9405  	} else if (info->attrs[NL80211_ATTR_SCAN_FREQUENCIES])
2032f3b2f94325 Thomas Pedersen           2020-04-30  9406  		scan_freqs = info->attrs[NL80211_ATTR_SCAN_FREQUENCIES];
2032f3b2f94325 Thomas Pedersen           2020-04-30  9407  
2032f3b2f94325 Thomas Pedersen           2020-04-30  9408  	if (scan_freqs) {
2032f3b2f94325 Thomas Pedersen           2020-04-30  9409  		n_channels = validate_scan_freqs(scan_freqs);
8328685682965c Christophe JAILLET        2020-07-12  9410  		if (!n_channels)
8328685682965c Christophe JAILLET        2020-07-12  9411  			return -EINVAL;
2a519311926906 Johannes Berg             2009-02-10  9412  	} else {
bdfbec2d2d240e Ilan Peer                 2014-01-09  9413  		n_channels = ieee80211_get_num_supported_channels(wiphy);
2a519311926906 Johannes Berg             2009-02-10  9414  	}
2a519311926906 Johannes Berg             2009-02-10  9415  
2a519311926906 Johannes Berg             2009-02-10  9416  	if (info->attrs[NL80211_ATTR_SCAN_SSIDS])
2a519311926906 Johannes Berg             2009-02-10  9417  		nla_for_each_nested(attr, info->attrs[NL80211_ATTR_SCAN_SSIDS], tmp)
2a519311926906 Johannes Berg             2009-02-10  9418  			n_ssids++;
2a519311926906 Johannes Berg             2009-02-10  9419  
8328685682965c Christophe JAILLET        2020-07-12  9420  	if (n_ssids > wiphy->max_scan_ssids)
8328685682965c Christophe JAILLET        2020-07-12  9421  		return -EINVAL;
2a519311926906 Johannes Berg             2009-02-10  9422  
70692ad2923a37 Jouni Malinen             2009-02-16  9423  	if (info->attrs[NL80211_ATTR_IE])
70692ad2923a37 Jouni Malinen             2009-02-16  9424  		ie_len = nla_len(info->attrs[NL80211_ATTR_IE]);
70692ad2923a37 Jouni Malinen             2009-02-16  9425  	else
70692ad2923a37 Jouni Malinen             2009-02-16  9426  		ie_len = 0;
70692ad2923a37 Jouni Malinen             2009-02-16  9427  
8328685682965c Christophe JAILLET        2020-07-12  9428  	if (ie_len > wiphy->max_scan_ie_len)
8328685682965c Christophe JAILLET        2020-07-12  9429  		return -EINVAL;
18a8365992a804 Johannes Berg             2009-03-31  9430  
655f189ad02b2c Johannes Berg             2025-06-09  9431  	size = struct_size(request, req.channels, n_channels);
838c7b8f1f2784 Kees Cook                 2024-04-24  9432  	ssids_offset = size;
655f189ad02b2c Johannes Berg             2025-06-09  9433  	size = size_add(size, array_size(sizeof(*request->req.ssids), n_ssids));
838c7b8f1f2784 Kees Cook                 2024-04-24  9434  	ie_offset = size;
14e05beb10326e Jacob Keller              2023-02-28  9435  	size = size_add(size, ie_len);
14e05beb10326e Jacob Keller              2023-02-28  9436  	request = kzalloc(size, GFP_KERNEL);
8328685682965c Christophe JAILLET        2020-07-12  9437  	if (!request)
8328685682965c Christophe JAILLET        2020-07-12  9438  		return -ENOMEM;
655f189ad02b2c Johannes Berg             2025-06-09  9439  	request->req.n_channels = n_channels;
2a519311926906 Johannes Berg             2009-02-10  9440  
2a519311926906 Johannes Berg             2009-02-10  9441  	if (n_ssids)
655f189ad02b2c Johannes Berg             2025-06-09  9442  		request->req.ssids = (void *)request + ssids_offset;
655f189ad02b2c Johannes Berg             2025-06-09  9443  	request->req.n_ssids = n_ssids;
838c7b8f1f2784 Kees Cook                 2024-04-24  9444  	if (ie_len)
655f189ad02b2c Johannes Berg             2025-06-09  9445  		request->req.ie = (void *)request + ie_offset;
2a519311926906 Johannes Berg             2009-02-10  9446  
584991dccfd347 Johannes Berg             2009-11-02  9447  	i = 0;
2032f3b2f94325 Thomas Pedersen           2020-04-30  9448  	if (scan_freqs) {
2a519311926906 Johannes Berg             2009-02-10  9449  		/* user specified, bail out if channel not found */
2032f3b2f94325 Thomas Pedersen           2020-04-30  9450  		nla_for_each_nested(attr, scan_freqs, tmp) {
584991dccfd347 Johannes Berg             2009-11-02  9451  			struct ieee80211_channel *chan;
2032f3b2f94325 Thomas Pedersen           2020-04-30  9452  			int freq = nla_get_u32(attr);
584991dccfd347 Johannes Berg             2009-11-02  9453  
2032f3b2f94325 Thomas Pedersen           2020-04-30  9454  			if (!scan_freqs_khz)
2032f3b2f94325 Thomas Pedersen           2020-04-30  9455  				freq = MHZ_TO_KHZ(freq);
584991dccfd347 Johannes Berg             2009-11-02  9456  
2032f3b2f94325 Thomas Pedersen           2020-04-30  9457  			chan = ieee80211_get_channel_khz(wiphy, freq);
584991dccfd347 Johannes Berg             2009-11-02  9458  			if (!chan) {
2a519311926906 Johannes Berg             2009-02-10  9459  				err = -EINVAL;
2a519311926906 Johannes Berg             2009-02-10  9460  				goto out_free;
2a519311926906 Johannes Berg             2009-02-10  9461  			}
584991dccfd347 Johannes Berg             2009-11-02  9462  
584991dccfd347 Johannes Berg             2009-11-02  9463  			/* ignore disabled channels */
3607798ad9bdef Felix Fietkau             2024-10-09  9464  			if (chan->flags & IEEE80211_CHAN_DISABLED ||
3607798ad9bdef Felix Fietkau             2024-10-09  9465  			    !cfg80211_wdev_channel_allowed(wdev, chan))
584991dccfd347 Johannes Berg             2009-11-02  9466  				continue;
584991dccfd347 Johannes Berg             2009-11-02  9467  
655f189ad02b2c Johannes Berg             2025-06-09  9468  			request->req.channels[i] = chan;
2a519311926906 Johannes Berg             2009-02-10  9469  			i++;
2a519311926906 Johannes Berg             2009-02-10  9470  		}
2a519311926906 Johannes Berg             2009-02-10  9471  	} else {
57fbcce37be7c1 Johannes Berg             2016-04-12  9472  		enum nl80211_band band;
34850ab25d74ab Johannes Berg             2011-07-18  9473  
2a519311926906 Johannes Berg             2009-02-10  9474  		/* all channels */
57fbcce37be7c1 Johannes Berg             2016-04-12  9475  		for (band = 0; band < NUM_NL80211_BANDS; band++) {
2a519311926906 Johannes Berg             2009-02-10  9476  			int j;
7a087e7484c9e4 Kirtika Ruchandani        2016-05-29  9477  
2a519311926906 Johannes Berg             2009-02-10  9478  			if (!wiphy->bands[band])
2a519311926906 Johannes Berg             2009-02-10  9479  				continue;
2a519311926906 Johannes Berg             2009-02-10  9480  			for (j = 0; j < wiphy->bands[band]->n_channels; j++) {
584991dccfd347 Johannes Berg             2009-11-02  9481  				struct ieee80211_channel *chan;
584991dccfd347 Johannes Berg             2009-11-02  9482  
584991dccfd347 Johannes Berg             2009-11-02  9483  				chan = &wiphy->bands[band]->channels[j];
584991dccfd347 Johannes Berg             2009-11-02  9484  
3607798ad9bdef Felix Fietkau             2024-10-09  9485  				if (chan->flags & IEEE80211_CHAN_DISABLED ||
3607798ad9bdef Felix Fietkau             2024-10-09  9486  				    !cfg80211_wdev_channel_allowed(wdev, chan))
584991dccfd347 Johannes Berg             2009-11-02  9487  					continue;
584991dccfd347 Johannes Berg             2009-11-02  9488  
655f189ad02b2c Johannes Berg             2025-06-09  9489  				request->req.channels[i] = chan;
2a519311926906 Johannes Berg             2009-02-10  9490  				i++;
2a519311926906 Johannes Berg             2009-02-10  9491  			}
2a519311926906 Johannes Berg             2009-02-10  9492  		}
2a519311926906 Johannes Berg             2009-02-10  9493  	}
2a519311926906 Johannes Berg             2009-02-10  9494  
584991dccfd347 Johannes Berg             2009-11-02  9495  	if (!i) {
584991dccfd347 Johannes Berg             2009-11-02  9496  		err = -EINVAL;
584991dccfd347 Johannes Berg             2009-11-02  9497  		goto out_free;
584991dccfd347 Johannes Berg             2009-11-02  9498  	}
584991dccfd347 Johannes Berg             2009-11-02  9499  
655f189ad02b2c Johannes Berg             2025-06-09  9500  	request->req.n_channels = i;
584991dccfd347 Johannes Berg             2009-11-02  9501  
655f189ad02b2c Johannes Berg             2025-06-09  9502  	for (i = 0; i < request->req.n_channels; i++) {
655f189ad02b2c Johannes Berg             2025-06-09  9503  		struct ieee80211_channel *chan = request->req.channels[i];
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  9504  
7b0a0e3c3a8826 Johannes Berg             2022-04-14  9505  		/* if we can go off-channel to the target channel we're good */
7b0a0e3c3a8826 Johannes Berg             2022-04-14  9506  		if (cfg80211_off_channel_oper_allowed(wdev, chan))
7b0a0e3c3a8826 Johannes Berg             2022-04-14  9507  			continue;
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  9508  
7b0a0e3c3a8826 Johannes Berg             2022-04-14  9509  		if (!cfg80211_wdev_on_sub_chan(wdev, chan, true)) {
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  9510  			err = -EBUSY;
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  9511  			goto out_free;
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  9512  		}
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  9513  	}
34373d12f3cbb7 Vasanthakumar Thiagarajan 2017-02-27  9514  
2a519311926906 Johannes Berg             2009-02-10  9515  	i = 0;
13874e4b23de83 Johannes Berg             2015-01-23  9516  	if (n_ssids) {
2a519311926906 Johannes Berg             2009-02-10  9517  		nla_for_each_nested(attr, info->attrs[NL80211_ATTR_SCAN_SSIDS], tmp) {
57a27e1d6a3bb9 Luciano Coelho            2011-06-07  9518  			if (nla_len(attr) > IEEE80211_MAX_SSID_LEN) {
2a519311926906 Johannes Berg             2009-02-10  9519  				err = -EINVAL;
2a519311926906 Johannes Berg             2009-02-10  9520  				goto out_free;
2a519311926906 Johannes Berg             2009-02-10  9521  			}
655f189ad02b2c Johannes Berg             2025-06-09  9522  			request->req.ssids[i].ssid_len = nla_len(attr);
655f189ad02b2c Johannes Berg             2025-06-09  9523  			memcpy(request->req.ssids[i].ssid,
655f189ad02b2c Johannes Berg             2025-06-09  9524  			       nla_data(attr), nla_len(attr));
2a519311926906 Johannes Berg             2009-02-10  9525  			i++;
2a519311926906 Johannes Berg             2009-02-10  9526  		}
2a519311926906 Johannes Berg             2009-02-10  9527  	}
2a519311926906 Johannes Berg             2009-02-10  9528  
70692ad2923a37 Jouni Malinen             2009-02-16  9529  	if (info->attrs[NL80211_ATTR_IE]) {
655f189ad02b2c Johannes Berg             2025-06-09  9530  		request->req.ie_len = nla_len(info->attrs[NL80211_ATTR_IE]);
655f189ad02b2c Johannes Berg             2025-06-09  9531  		memcpy((void *)request->req.ie,
de95a54b1aebe5 Johannes Berg             2009-04-01  9532  		       nla_data(info->attrs[NL80211_ATTR_IE]),
655f189ad02b2c Johannes Berg             2025-06-09  9533  		       request->req.ie_len);
70692ad2923a37 Jouni Malinen             2009-02-16  9534  	}
70692ad2923a37 Jouni Malinen             2009-02-16  9535  
57fbcce37be7c1 Johannes Berg             2016-04-12  9536  	for (i = 0; i < NUM_NL80211_BANDS; i++)
a401d2bb363d94 Johannes Berg             2011-07-20  9537  		if (wiphy->bands[i])
655f189ad02b2c Johannes Berg             2025-06-09  9538  			request->req.rates[i] =
a401d2bb363d94 Johannes Berg             2011-07-20  9539  				(1 << wiphy->bands[i]->n_bitrates) - 1;
34850ab25d74ab Johannes Berg             2011-07-18  9540  
34850ab25d74ab Johannes Berg             2011-07-18  9541  	if (info->attrs[NL80211_ATTR_SCAN_SUPP_RATES]) {
34850ab25d74ab Johannes Berg             2011-07-18  9542  		nla_for_each_nested(attr,
34850ab25d74ab Johannes Berg             2011-07-18  9543  				    info->attrs[NL80211_ATTR_SCAN_SUPP_RATES],
34850ab25d74ab Johannes Berg             2011-07-18  9544  				    tmp) {
57fbcce37be7c1 Johannes Berg             2016-04-12  9545  			enum nl80211_band band = nla_type(attr);
34850ab25d74ab Johannes Berg             2011-07-18  9546  
57fbcce37be7c1 Johannes Berg             2016-04-12  9547  			if (band < 0 || band >= NUM_NL80211_BANDS) {
34850ab25d74ab Johannes Berg             2011-07-18  9548  				err = -EINVAL;
34850ab25d74ab Johannes Berg             2011-07-18  9549  				goto out_free;
34850ab25d74ab Johannes Berg             2011-07-18  9550  			}
1b09cd82d8c479 Felix Fietkau             2013-11-20  9551  
1b09cd82d8c479 Felix Fietkau             2013-11-20  9552  			if (!wiphy->bands[band])
1b09cd82d8c479 Felix Fietkau             2013-11-20  9553  				continue;
1b09cd82d8c479 Felix Fietkau             2013-11-20  9554  
34850ab25d74ab Johannes Berg             2011-07-18  9555  			err = ieee80211_get_ratemask(wiphy->bands[band],
34850ab25d74ab Johannes Berg             2011-07-18  9556  						     nla_data(attr),
34850ab25d74ab Johannes Berg             2011-07-18  9557  						     nla_len(attr),
655f189ad02b2c Johannes Berg             2025-06-09 @9558  						     &request->req.rates[band]);
34850ab25d74ab Johannes Berg             2011-07-18  9559  			if (err)
34850ab25d74ab Johannes Berg             2011-07-18  9560  				goto out_free;
34850ab25d74ab Johannes Berg             2011-07-18  9561  		}
34850ab25d74ab Johannes Berg             2011-07-18  9562  	}
34850ab25d74ab Johannes Berg             2011-07-18  9563  
1d76250bd34af8 Avraham Stern             2016-07-05  9564  	if (info->attrs[NL80211_ATTR_MEASUREMENT_DURATION]) {
655f189ad02b2c Johannes Berg             2025-06-09  9565  		request->req.duration =
1d76250bd34af8 Avraham Stern             2016-07-05  9566  			nla_get_u16(info->attrs[NL80211_ATTR_MEASUREMENT_DURATION]);
655f189ad02b2c Johannes Berg             2025-06-09  9567  		request->req.duration_mandatory =
1d76250bd34af8 Avraham Stern             2016-07-05  9568  			nla_get_flag(info->attrs[NL80211_ATTR_MEASUREMENT_DURATION_MANDATORY]);
1d76250bd34af8 Avraham Stern             2016-07-05  9569  	}
1d76250bd34af8 Avraham Stern             2016-07-05  9570  
2d23d0736e3a4a Roee Zamir                2017-08-06  9571  	err = nl80211_check_scan_flags(wiphy, wdev, request, info->attrs,
2d23d0736e3a4a Roee Zamir                2017-08-06  9572  				       false);
ad2b26abc15746 Johannes Berg             2014-06-12  9573  	if (err)
ad2b26abc15746 Johannes Berg             2014-06-12  9574  		goto out_free;
ed47377154310f Sam Leffler               2012-10-11  9575  
655f189ad02b2c Johannes Berg             2025-06-09  9576  	request->req.no_cck =
e9f935e3e8dc0b Rajkumar Manoharan        2011-09-25  9577  		nla_get_flag(info->attrs[NL80211_ATTR_TX_NO_CCK_RATE]);
e9f935e3e8dc0b Rajkumar Manoharan        2011-09-25  9578  
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9579  	/* Initial implementation used NL80211_ATTR_MAC to set the specific
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9580  	 * BSSID to scan for. This was problematic because that same attribute
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9581  	 * was already used for another purpose (local random MAC address). The
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9582  	 * NL80211_ATTR_BSSID attribute was added to fix this. For backwards
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9583  	 * compatibility with older userspace components, also use the
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9584  	 * NL80211_ATTR_MAC value here if it can be determined to be used for
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9585  	 * the specific BSSID use case instead of the random MAC address
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9586  	 * (NL80211_ATTR_SCAN_FLAGS is used to enable random MAC address use).
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9587  	 */
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9588  	if (info->attrs[NL80211_ATTR_BSSID])
655f189ad02b2c Johannes Berg             2025-06-09  9589  		memcpy(request->req.bssid,
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9590  		       nla_data(info->attrs[NL80211_ATTR_BSSID]), ETH_ALEN);
655f189ad02b2c Johannes Berg             2025-06-09  9591  	else if (!(request->req.flags & NL80211_SCAN_FLAG_RANDOM_ADDR) &&
2fa436b3a2a700 Vamsi Krishna             2016-12-02  9592  		 info->attrs[NL80211_ATTR_MAC])
655f189ad02b2c Johannes Berg             2025-06-09  9593  		memcpy(request->req.bssid,
655f189ad02b2c Johannes Berg             2025-06-09  9594  		       nla_data(info->attrs[NL80211_ATTR_MAC]),
818965d3917774 Jouni Malinen             2016-02-26  9595  		       ETH_ALEN);
818965d3917774 Jouni Malinen             2016-02-26  9596  	else
655f189ad02b2c Johannes Berg             2025-06-09  9597  		eth_broadcast_addr(request->req.bssid);
818965d3917774 Jouni Malinen             2016-02-26  9598  
655f189ad02b2c Johannes Berg             2025-06-09  9599  	request->req.tsf_report_link_id =
655f189ad02b2c Johannes Berg             2025-06-09  9600  		nl80211_link_id_or_invalid(info->attrs);
655f189ad02b2c Johannes Berg             2025-06-09  9601  	request->req.wdev = wdev;
655f189ad02b2c Johannes Berg             2025-06-09  9602  	request->req.wiphy = &rdev->wiphy;
655f189ad02b2c Johannes Berg             2025-06-09  9603  	request->req.scan_start = jiffies;
2a519311926906 Johannes Berg             2009-02-10  9604  
79c97e97aed7f7 Johannes Berg             2009-07-07  9605  	rdev->scan_req = request;
c8cb5b854b40f2 Tova Mussai               2020-09-18  9606  	err = cfg80211_scan(rdev);
2a519311926906 Johannes Berg             2009-02-10  9607  
504776be46cb61 Christophe JAILLET        2020-07-12  9608  	if (err)
504776be46cb61 Christophe JAILLET        2020-07-12  9609  		goto out_free;
504776be46cb61 Christophe JAILLET        2020-07-12  9610  
fd0142844efa85 Johannes Berg             2012-06-18  9611  	nl80211_send_scan_start(rdev, wdev);
fd0142844efa85 Johannes Berg             2012-06-18  9612  	dev_hold(wdev->netdev);
504776be46cb61 Christophe JAILLET        2020-07-12  9613  
504776be46cb61 Christophe JAILLET        2020-07-12  9614  	return 0;
504776be46cb61 Christophe JAILLET        2020-07-12  9615  
2a519311926906 Johannes Berg             2009-02-10  9616   out_free:
79c97e97aed7f7 Johannes Berg             2009-07-07  9617  	rdev->scan_req = NULL;
2a519311926906 Johannes Berg             2009-02-10  9618  	kfree(request);
3b85875a252dbb Johannes Berg             2009-03-12  9619  
2a519311926906 Johannes Berg             2009-02-10  9620  	return err;
2a519311926906 Johannes Berg             2009-02-10  9621  }
2a519311926906 Johannes Berg             2009-02-10  9622  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
