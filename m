Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC519ABAC
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 15:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753976586; cv=none; b=kHVMmKSd5CV7dvkl5nv/qjK6OcgbcAwCbyXAXVmQ8B6L/kO0N5c09N0pWI2vz0ugGXhtZm5Kwz3VVbvfvzWXYiGjo2uUbOmFa0F6Ku4zoB1tg+aRV4eSD4BwsVQql5I/qrV02J16Za+UsB4SZIdEWGy8/AhzrYyAJlxXP9Lkc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753976586; c=relaxed/simple;
	bh=fq2ICprLWPkHmqDsc44e1bosAbJrWdJlIPo07QUJEHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oc/ko7H8GOOwmCR4Rmqe617aOoSx+WLWsm1xjj9Q/qwNhM8E9qoNYlEcISV7ApqxmNbxevqex5UIrFKL+w6mXcASskylsBCJGMOhNimolXktj/i4L4YYdrtDjYjAhZ6yw0usqg5y4qO/q+IcHQCzrlEcv10BvqqH+YiNJjwM7p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HLnt0ZqG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HLnt0ZqG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b788feab29so375187f8f.2
        for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753976583; x=1754581383; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qt+Iin4AahpSjwtg4nAj2HWYATcEFwE77Db5A7bUXLA=;
        b=HLnt0ZqGvTUpu5WQNNE3XyfZrdM143HEzAXizTSXmZj7DeQoNCawmTp+3NfkB50O6w
         cm06Icnq5d12NV+3pBbYnvQthCDJQrw6CcchD7dbY9VizTlX1hvh4BYabihFHkZiChy8
         BHv6n2tj+cMKgJjlk5ocfWMSsT60lkLFjmIQNSx5dB9GkPt1ccL4Vsz4WX6Ns357YvYA
         rH74DpIRVJi2r+eq/RpLwXIiNp/Q+LGHLapBXg6t0R+LFZuASAKMES6cQravP+OTDAD+
         HVs35nUUe0K/ZHAi+4iwhrh5BobHyGekjPjlbENdhL1DZHDNgOvFdj8iyeRRZVc5W9TM
         Pb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976583; x=1754581383;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qt+Iin4AahpSjwtg4nAj2HWYATcEFwE77Db5A7bUXLA=;
        b=eY+HB7BNaG/+x7N7jlCVepaX87qyh+6iJaFde7Fvh6HfBPG3HRP3/OVrigIloT6C/C
         ijac4hBdWdVuK1LQxyo+yDmkHSojxYZnOoZ8Z1vBT8p9u53pjsIiI5haPVcfY/Ap8dXS
         MirxyJRghqDNsYwgCwrwybGvESVRlCSEDMVcS4x2juZaVgCrzlP327wJTuzPhQ6du7mf
         ewQNsh3Tb7LdNXdC9jFjWAnylWa+S5WSWyNhRm0wBGDL4xhfv4tzxvDSh50Bw6vwML0w
         mCku1u8ybwJ7SAykrZgcjSkxcgeh8rPxt6FM4z81lJlAXnaWdWNidSrC2VRjw9N/dGeH
         bcUg==
X-Gm-Message-State: AOJu0YzLy7O2HdUZROdYPXmvRQLaBZhhoH3CKzckl2IO5bueLUZy4oNC
	dl8efDj623GuRnzCGZ+ON5T9IcxUVIxs43990lxknHnqdp02ZTye5nNRFt0pFavwZ/v6+kvY+V+
	+5Ip3K5Jofg==
X-Gm-Gg: ASbGnct37cT8WZboDFHXKL7Au0vtNcn7pZNhZ63l/+7mBhUGas1NJOuBdxREdgdUk6O
	2fTLCkW1csrSf+soBNAAZ4bEztwHLjAM+neyUqgfnmTTsKuKv1vWVg/jn7h+o8CGnIefSPqm2wD
	2Sw37fEBcDIhqFkExUHq/GwgDNCg2BmOyuZWztT+y+yMQFqglSu3Fpm2RHzDa4aSPRw6rfUoMW2
	R49vGyS5d36HHyJywfYeBn2Wn1/j+vxMCuWNXX1jXTfuZjDy2iWtuY1CxN/lRXe7FWL94ZAYqkG
	C8kFLfhJTDLtHlsWrLEACAmE6dck5JPZt1oCRoE0xLs/3gTgnJEpA54OyQIa30v6WfqAdHAQuCB
	hmAh5ytQA4zpfe+ymI/7uADWiahEwN5nDR51z9w==
X-Google-Smtp-Source: AGHT+IE6zhkz62nqqtXHAVTKFA2zzWR7h31VQGNP5JyVsyRc+PYuSNkJ8QwKSWXicvElT1O2dBIgmA==
X-Received: by 2002:a05:6000:2f84:b0:3b6:d95:a3a4 with SMTP id ffacd0b85a97d-3b794fbec3emr5710916f8f.4.1753976582890;
        Thu, 31 Jul 2025 08:43:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953cfeaesm76177885e9.16.2025.07.31.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:43:02 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:42:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [pkshih-rtw:rtw-next 6/23] net/mac80211/mlme.c:8558
 ieee80211_latest_active_link_conn_timeout() error: uninitialized symbol
 'latest_timeout'.
Message-ID: <6ac3fe36-40ea-401c-8012-bb6a6cc7f9f0@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/pkshih/rtw rtw-next
head:   754fe848b3b297fc85ec24cd959bad22b6df8cb8
commit: 1bc892d76a6f8778945eaa44af4e7f95faf5fbd4 [6/23] wifi: mac80211: extend connection monitoring for MLO
config: x86_64-randconfig-161-20250720 (https://download.01.org/0day-ci/archive/20250721/202507211228.LTTltR0s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507211228.LTTltR0s-lkp@intel.com/

New smatch warnings:
net/mac80211/mlme.c:8558 ieee80211_latest_active_link_conn_timeout() error: uninitialized symbol 'latest_timeout'.

vim +/latest_timeout +8558 net/mac80211/mlme.c

1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8521  static unsigned long
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8522  ieee80211_latest_active_link_conn_timeout(struct ieee80211_sub_if_data *sdata)
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8523  {
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8524  	unsigned long latest_timeout;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8525  	unsigned int link_id;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8526  	struct sta_info *sta;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8527  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8528  	guard(rcu)();
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8529  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8530  	sta = sta_info_get(sdata, sdata->vif.cfg.ap_addr);
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8531  	if (!sta)
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8532  		return 0;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8533  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8534  	for (link_id = 0; link_id < ARRAY_SIZE(sta->link);
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8535  	     link_id++) {
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8536  		struct link_sta_info *link_sta;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8537  		unsigned long timeout;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8538  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8539  		link_sta = rcu_dereference(sta->link[link_id]);
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8540  		if (!link_sta)
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8541  			continue;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8542  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8543  		timeout = link_sta->status_stats.last_ack;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8544  		if (time_before(timeout, link_sta->rx_stats.last_rx))
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8545  			timeout = link_sta->rx_stats.last_rx;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8546  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8547  		timeout += IEEE80211_CONNECTION_IDLE_TIME;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8548  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8549  		/*
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8550  		 * latest_timeout holds the timeout of the link
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8551  		 * that will expire last among all links in an
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8552  		 * non-AP MLD STA. This ensures that the connection
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8553  		 * monitor timer is only reset if at least one link
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8554  		 * is still active, and it is scheduled to fire at
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8555  		 * the latest possible timeout.
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8556  		 */
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8557  		if (time_is_after_jiffies(timeout) &&
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18 @8558  		    time_after(timeout, latest_timeout))
                                                                                        ^^^^^^^^^^^^^^
This is used before it's initialized.

1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8559  			latest_timeout = timeout;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8560  	}
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8561  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8562  	return latest_timeout;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8563  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

