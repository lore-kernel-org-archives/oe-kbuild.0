Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC0A32D42B
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 11:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612679; cv=none; b=HGtsBtNl4L3D1EyGGhhBNHIiHKdXtsXIgrA+tG4Ro8WQFVz+8PLkiYkXDs/oLhmMKQxGy1hVFiG+ux7baRkz2D55SOJylp8kZCR8/BGamKeW6gR/YfOdAojqV/4qa3NJr1t4ZjOfrJZ+6L51whjwgXI9pc0x5rkdCwUqUmjs4/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612679; c=relaxed/simple;
	bh=RwslXUww9C+siFbZbnejEMWpUu+MZlD1rXxwd1MJR7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7bAxLeBBIuVtmVm6fDNNpP9qZFaNSVvz2vIhFVmGTHVgJuMQxLg6QBKMNwivz/ZI1bTqL7MlvNY3vCtl+rb+ijjxI0RYR931aoa3UZwfGcJ/ZURV0UJf1RfxjcLJ3n9sbanKBViIPZYG0K4gke8yQ7gx1fck7davws6Br5Luxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HOqrAqY8; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HOqrAqY8"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-42fbc305914so9442297f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 03:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767612675; x=1768217475; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9sJfwhc1yW8izLaVZiPz2QYrizVCNw4hM3HoCt2Dro=;
        b=HOqrAqY8IWbwS3zdEIFV2rIzK0EWs65BCCVox2ER7gt6KpR1+3bei8VoEd919598u7
         Cveab5MqAI2xtr2pOMVIm3Pwh0L5dFULGdF10RL94P8yoLQp1EH4SY54GUCLKCvXbH+X
         AlEzk2c8YxYNQqY72hgMWfpxBz0QA9Yud2UuUe2BlGWDA+MNvvyKbjbxKGuaVVWib5CC
         Y4BKvdvjP/rKFWM5o0IT6FxfjiCsfE/Raz/BjxMzReUkaYhLfpHn/yPrZ5PmebGwC+B1
         llIzM1AJmD8dHwvXHmwlwBFY6ylaGX4abB9b67a3WrfilzVlI986Iz7Egf4vws22dGmo
         FwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767612675; x=1768217475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9sJfwhc1yW8izLaVZiPz2QYrizVCNw4hM3HoCt2Dro=;
        b=Md7PyMJvtqF3MQZQKrwDS8+EJvF3pcRX0CrF5M2r5gSEDzhuplMkmvIfIWdqaEA88M
         ZURTRTA22oaBVxLP4TEZo6hDNtifC7IJdEsHlSJJQX9lzKVPMng2/pwnA/7oGuKrRPWd
         kt+VnSxAdL7hoao0MZTAyMsZeakPYFZbDJ19BFqBBeEXhWi5pHPFKMpwgOqa6JoySrVq
         SDLsW0+TDEIKhk2Ro4ydd3xHwa/0K0oH67yvlz68C/xj0O1dyJgph5GaogdNq/SISU7h
         WaRhMbPhQg/ggwp0no4Tz+2DUdTarp4ArVpunoyOrjzOdQJMqM3FD0WSTUqAhZFXn2mj
         7yzg==
X-Gm-Message-State: AOJu0YziMglGhngf+g2aCYV3Azkaf4sk8bLfi/KydX5ixzWEK4RU9w0d
	c2ia9b8u95zbtUYp5FPdp/cNUJrI24HqRe3nDnHvR8EI4MmhW26CDBBEtIaupGiqh7k=
X-Gm-Gg: AY/fxX4iOxlx2DoyoGGV0zejrEz57cJiesL1MTB/jQBPm/z0VvL6X2Z2Saxd0O3m2HU
	hSTO+Ldf4RqQ4gMMEcZdUgQlnFCNldb6OgG28xXOS07jFXjCEd9HK5Ts8e8R4UECtSRvw3ax9i1
	ekL7HWwbMtY7tMwX2+ZNmcmAz2CKbIoHzpocf+sV7JPQjJAKnyudbvQk37fFjC/uDpJbsOBIvsl
	EJEdxLNtErF26K+YCE3csaugK1WV4yoP45VFIYbUQrCcXMFheoHn2Z8Drc/n37gRO/C4ScIzXTL
	mNlR1bsjV0Y8J+gJQfggYD3oH/fTFhiPOlNvWMG4bhAw1DttIAWGnuvsB1y0v7UB7JOnkI/0Rea
	5l9yrgHLjlaQStQGPEQfx9G9wgHpGj+oZxrZaP5BcNiCinKx8yLZeKtI/zsnaeOIg3YELFhtJ6V
	TqBvQdsBUFK6vpBajy
X-Google-Smtp-Source: AGHT+IHL/eAonSBI4FOtiHxiCDBvDxT4TphXeie4KJGpYgwSqO3k3EQIIdzaatHA9/x5ZY8WcU+06Q==
X-Received: by 2002:a05:6000:178d:b0:430:f7ae:af3e with SMTP id ffacd0b85a97d-4324e5063d7mr61828078f8f.32.1767612675114;
        Mon, 05 Jan 2026 03:31:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm99663477f8f.5.2026.01.05.03.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:31:14 -0800 (PST)
Date: Mon, 5 Jan 2026 14:31:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: drivers/net/wireless/ath/wcn36xx/smd.c:1988
 wcn36xx_smd_send_beacon() warn: potential spectre issue 'msg_body.beacon'
 [r]
Message-ID: <aVug_6CyqRXGVasA@stanley.mountain>
References: <202512240945.s16QxOuf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512240945.s16QxOuf-lkp@intel.com>

I'm going to silence these warnings.

regards,
dan carpenter

On Wed, Dec 24, 2025 at 09:04:22AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Kees Cook <kees@kernel.org>
> CC: Nathan Chancellor <nathan@kernel.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b927546677c876e26eba308550207c2ddf812a43
> commit: d70da12453ac3797e0c54884305ccc894e8c817b hardening: Enable i386 FORTIFY_SOURCE on Clang 16+
> date:   10 months ago
> :::::: branch date: 31 hours ago
> :::::: commit date: 10 months ago
> config: i386-randconfig-r072-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240945.s16QxOuf-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202512240945.s16QxOuf-lkp@intel.com/
> 
> New smatch warnings:
> drivers/net/wireless/ath/wcn36xx/smd.c:1988 wcn36xx_smd_send_beacon() warn: potential spectre issue 'msg_body.beacon' [r]
> 
> Old smatch warnings:
> drivers/net/wireless/ath/wcn36xx/smd.c:521 wcn36xx_smd_load_nv() error: we previously assumed 'wcn->nv' could be null (see line 512)
> drivers/net/wireless/ath/wcn36xx/smd.c:569 wcn36xx_smd_load_nv() warn: 'wcn->nv' from request_firmware() not released on lines: 569.
> 
> vim +1988 drivers/net/wireless/ath/wcn36xx/smd.c
> 
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1948  
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1949  int wcn36xx_smd_send_beacon(struct wcn36xx *wcn, struct ieee80211_vif *vif,
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1950  			    struct sk_buff *skb_beacon, u16 tim_off,
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1951  			    u16 p2p_off)
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1952  {
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1953  	struct wcn36xx_hal_send_beacon_req_msg msg_body;
> f0eea2772a6baf Daniel Mack      2018-06-29  1954  	int ret, pad, pvm_len;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1955  
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1956  	mutex_lock(&wcn->hal_mutex);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1957  	INIT_HAL_MSG(msg_body, WCN36XX_HAL_SEND_BEACON_REQ);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1958  
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1959  	pvm_len = skb_beacon->data[tim_off + 1] - 3;
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1960  	pad = TIM_MIN_PVM_SIZE - pvm_len;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1961  
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1962  	/* Padding is irrelevant to mesh mode since tim_off is always 0. */
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1963  	if (vif->type == NL80211_IFTYPE_MESH_POINT)
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1964  		pad = 0;
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1965  
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1966  	msg_body.beacon_length = skb_beacon->len + pad;
> 25d217d6e07234 Pontus Fuchs     2016-04-18  1967  	/* TODO need to find out why + 6 is needed */
> 25d217d6e07234 Pontus Fuchs     2016-04-18  1968  	msg_body.beacon_length6 = msg_body.beacon_length + 6;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1969  
> 25d217d6e07234 Pontus Fuchs     2016-04-18  1970  	if (msg_body.beacon_length > BEACON_TEMPLATE_SIZE) {
> d7809bd9eae67b Colin Ian King   2020-01-23  1971  		wcn36xx_err("Beacon is too big: beacon size=%d\n",
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1972  			      msg_body.beacon_length);
> 95b48c2cdae764 Dan Carpenter    2013-11-08  1973  		ret = -ENOMEM;
> 95b48c2cdae764 Dan Carpenter    2013-11-08  1974  		goto out;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1975  	}
> 25d217d6e07234 Pontus Fuchs     2016-04-18  1976  	memcpy(msg_body.beacon, skb_beacon->data, skb_beacon->len);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1977  	memcpy(msg_body.bssid, vif->addr, ETH_ALEN);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1978  
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1979  	if (pad > 0) {
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1980  		/*
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1981  		 * The wcn36xx FW has a fixed size for the PVM in the TIM. If
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1982  		 * given the beacon template from mac80211 with a PVM shorter
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1983  		 * than the FW expectes it will overwrite the data after the
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1984  		 * TIM.
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1985  		 */
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1986  		wcn36xx_dbg(WCN36XX_DBG_HAL, "Pad TIM PVM. %d bytes at %d\n",
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1987  			    pad, pvm_len);
> 91c3eeba45e13a Pontus Fuchs     2016-04-18 @1988  		memmove(&msg_body.beacon[tim_off + 5 + pvm_len + pad],
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1989  			&msg_body.beacon[tim_off + 5 + pvm_len],
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1990  			skb_beacon->len - (tim_off + 5 + pvm_len));
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1991  		memset(&msg_body.beacon[tim_off + 5 + pvm_len], 0, pad);
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1992  		msg_body.beacon[tim_off + 1] += pad;
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1993  	}
> 91c3eeba45e13a Pontus Fuchs     2016-04-18  1994  
> 8e84c25821698b Eugene Krasnikov 2013-10-08  1995  	/* TODO need to find out why this is needed? */
> fa643ae2ce4e75 Chun-Yeow Yeoh   2013-12-06  1996  	if (vif->type == NL80211_IFTYPE_MESH_POINT)
> fa643ae2ce4e75 Chun-Yeow Yeoh   2013-12-06  1997  		/* mesh beacon don't need this, so push further down */
> fa643ae2ce4e75 Chun-Yeow Yeoh   2013-12-06  1998  		msg_body.tim_ie_offset = 256;
> fa643ae2ce4e75 Chun-Yeow Yeoh   2013-12-06  1999  	else
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2000  		msg_body.tim_ie_offset = tim_off+4;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2001  	msg_body.p2p_ie_offset = p2p_off;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2002  	PREPARE_HAL_BUF(wcn->hal_buf, msg_body);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2003  
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2004  	wcn36xx_dbg(WCN36XX_DBG_HAL,
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2005  		    "hal send beacon beacon_length %d\n",
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2006  		    msg_body.beacon_length);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2007  
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2008  	ret = wcn36xx_smd_send_and_wait(wcn, msg_body.header.len);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2009  	if (ret) {
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2010  		wcn36xx_err("Sending hal_send_beacon failed\n");
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2011  		goto out;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2012  	}
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2013  	ret = wcn36xx_smd_rsp_status_check(wcn->hal_buf, wcn->hal_rsp_len);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2014  	if (ret) {
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2015  		wcn36xx_err("hal_send_beacon response failed err=%d\n", ret);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2016  		goto out;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2017  	}
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2018  out:
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2019  	mutex_unlock(&wcn->hal_mutex);
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2020  	return ret;
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2021  }
> 8e84c25821698b Eugene Krasnikov 2013-10-08  2022  
> 
> :::::: The code at line 1988 was first introduced by commit
> :::::: 91c3eeba45e13ab7edfb50610df8672d52809394 wcn36xx: Pad TIM PVM if needed
> 
> :::::: TO: Pontus Fuchs <pontus.fuchs@gmail.com>
> :::::: CC: Kalle Valo <kvalo@qca.qualcomm.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
