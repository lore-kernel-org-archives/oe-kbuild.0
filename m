Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A3421257E
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756127079; cv=none; b=fRkJgHZ9FJaYbgFN7U73iBdl0ntHVR+yGg7fYwZawJd5Mphqar63aAGmsrZ+YwZVfoaUJ5hfxT+RFLBtltVv68FJBTJyT9ij4qLTbeqhVQ1di3u2L6/QdWeXmE+j1Vwlgu56I+dWjpFtXJVCzNgeO0FkSn/8ESqWGGp03rlXS38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756127079; c=relaxed/simple;
	bh=opFb1gxgcEF24Psznxc91Reb7NqPoIFXHn+O+SyBDys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hbtx8kWybeBEHLEWIA4xwX70h2nr8CkTr9C4EmaaeJGWs9Z3IwXSAy7eMCW5fwI6NuxxNpdI43d339KpupWcjgB8tE4R20cgSnpN+lAniQ8I29pZZnQHj6c2oaPQvlt+QRbjStsHMhGyopzGwrF9hRbWdVZ8noYDiYUzVYzgU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N9paMDZT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9paMDZT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso24738425e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 06:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756127074; x=1756731874; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn/SviJD49c7rc7vSoZpIs1ZaUK/bPx4EhxTEwUIQvk=;
        b=N9paMDZTKjQqtkQzA5JRWjTJc+W9oChfUoWD2WKWftVWv++HLk0DSF/oZAkQpCWGMS
         MUHJZq/D58chexfrT5lPfnvpFdihEhIKRhyg2VLG2/alzirTI1DTuHyJMzOKg1/ZuBGj
         CQ02WHzzVDTw6B5nV3LFEzIM6XvVgOwy4xjvv0gtRc5TcZOabvEN4D8m6bs462MOVHlN
         TgjyIlNOax9aenCLsIAa/ovRmSsXl8Z3NATC2zjjYW6s7UBs8Gi4t5ahsBxYDQ9eTKJj
         iDA1M7HV7bxxKho5JvBdvaUwsDQ+CLPHnFWp4OVTie7nkz2GlDJRN19h5XKVleyQPvgB
         TwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756127074; x=1756731874;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qn/SviJD49c7rc7vSoZpIs1ZaUK/bPx4EhxTEwUIQvk=;
        b=UjOQX6jS+Dc82SGijOu2TmuTxe2fvR/KQXhPLMvr8npnAn4nkjUENGHdm9/oN4XPxg
         5llnfgRsZEZOoaXGpHkWrmKbdeHqb6ZubA6RVmG77sVv5opyGiLr0qq5+FN6G+jclI39
         /7Kc+lCHhfWWBl/szDpeFzFp3tyVuyCQdGHqJgZu1hxC98VkbIkdx6/ODdTGnpKxSdAa
         brkn7snck8I1zvWuEqXWdUon8M8YZh05l9TidSS4ZPpGmV7rLcpMxuDzeFOP2M7aku+8
         0gvytaMe1vJ8B2+Se6feg21r5GDtGz6gonvZOG/yPbqw+GFVcaANsWkBDevBaOhMOsaQ
         pZnA==
X-Gm-Message-State: AOJu0Yz/tSnhdsmySEJPdTqSoKpLSGQ8XMLqYENUIi8MDMQOr6Kd1VNC
	RGK1pQ7UbNGT1BPMq46uANFMUn3MAUKDLcaSig8cJE5ImwnS+Sdml9FYo4xTRUz7zNdUR3beU8f
	kEzXs
X-Gm-Gg: ASbGncuL+IsejnyT6iM3kFBqWQd8vLT3snEQBoSPyggSuSuGva7/g3sVLonbL8lLm+/
	apGQCHAxd8vloPhNjdsqvsaOV2aClLwh5KF3vc5gk95k/T52Wy4FQ0wCacUZDwkqeoZnMdEYdPD
	+3nD+vltfQYpFr/pedSZi7hruU92EDHQBXSWOzoyQW2nIih2Ih0EWEUKOOee/3Fwf9W1ZWVtRKc
	O3qkPfnN1tsaW03dprghDk4z9KCJ6VGtFrhpzuiM402knJzejgbFcusSF2Xd/1gL+l2S/31gQ+5
	MP+wblyng+43llxyslOI5NAWmZcJhBCzT0beu4V+xhVydarWa7q4py0OVouLQ8Cyi3ZcF2nF/iZ
	owaUjYL5NF21n9Yo6trGeSC0w06A=
X-Google-Smtp-Source: AGHT+IFLTANhGv+KQFDBIFZjxSd5yvOaXONO+ygW9Srw+cCR8S/bQ48zKRnQ+aqZqSS//O4r2HbX5A==
X-Received: by 2002:a05:600c:3596:b0:458:bd31:2c35 with SMTP id 5b1f17b1804b1-45b517cca56mr108449475e9.25.1756127074447;
        Mon, 25 Aug 2025 06:04:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b57492878sm108933675e9.19.2025.08.25.06.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 06:04:33 -0700 (PDT)
Date: Mon, 25 Aug 2025 16:04:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>,
	johannes@sipsolutions.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org, arien.judge@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: Re: [PATCH wireless] wifi: mac80211: increase scan_ies_len for S1G
Message-ID: <202508251233.r1IFboEm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822062020.904196-1-lachlan.hodges@morsemicro.com>
Message-ID: <20250825130430.K3tWQGc6OgGl1R18mu6yu5gG7tstTlQ5agci27XNcqQ@z>

Hi Lachlan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lachlan-Hodges/wifi-mac80211-increase-scan_ies_len-for-S1G/20250822-142135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250822062020.904196-1-lachlan.hodges%40morsemicro.com
patch subject: [PATCH wireless] wifi: mac80211: increase scan_ies_len for S1G
config: x86_64-randconfig-161-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251233.r1IFboEm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508251233.r1IFboEm-lkp@intel.com/

New smatch warnings:
net/mac80211/main.c:1277 ieee80211_register_hw() error: uninitialized symbol 'supp_s1g'.

vim +/supp_s1g +1277 net/mac80211/main.c

de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1262  
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1263  		/*
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1264  		 * Due to the way the aggregation code handles this and it
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1265  		 * being an HT capability, we can't really support delayed
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1266  		 * BA in MLO (yet).
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1267  		 */
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1268  		if (WARN_ON(sband->ht_cap.ht_supported &&
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1269  			    (sband->ht_cap.cap & IEEE80211_HT_CAP_DELAY_BA) &&
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1270  			    hw->wiphy->flags & WIPHY_FLAG_SUPPORTS_MLO))
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1271  			return -EINVAL;
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1272  
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1273  		if (max_bitrates < sband->n_bitrates)
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1274  			max_bitrates = sband->n_bitrates;
5ef2d41afb7fce net/mac80211/main.c      Johannes Berg         2009-03-31  1275  		supp_ht = supp_ht || sband->ht_cap.ht_supported;
ba0afa2f22e1e3 net/mac80211/main.c      Mahesh Palivela       2012-07-02  1276  		supp_vht = supp_vht || sband->vht_cap.vht_supported;
0eafa59746812a net/mac80211/main.c      Lachlan Hodges        2025-08-22 @1277  		supp_s1g = supp_s1g || sband->s1g_cap.s1g;
                                                                                                           ^^^^^^^^
Initialize supp_s1g to 0 at the start of the function.

04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1278  
e8c1841278a783 net/mac80211/main.c      Johannes Berg         2023-08-28  1279  		for_each_sband_iftype_data(sband, i, iftd) {
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1280  			u8 he_40_mhz_cap;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

