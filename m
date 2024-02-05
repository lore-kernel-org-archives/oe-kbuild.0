Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AC6BE48
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707114509; cv=none; b=AsqjzkpqBqc+Os2hzPTcLREKI0DO7CcdNtj5dRoxrbnAXqr7uTQEI+eBlRS115P9vtVzE8r2gH+V4QJ7fzrOQUUrL3GxMWunETKPVG9igJigEJ+shXHbdsFwEeZExrpZqetm7jV99h6+WM+DaHJ36EAaTEwc7GGPsiyDt4KjTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707114509; c=relaxed/simple;
	bh=6KsMRlo+MFtTR+dq31aHvWv1L4og7up2s45Cs5qPyvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4jKZncm9vJTPIkjLis/rtBP7D+hfTghPc6NrdrGdSeqenbdYQxpKPFv3oaqvc9AY6n5ZLC4CKyiUDvGCiFkeQRF6cqlZy5Pxk4W3Iae3PoHvHwAyf2M7DfrrB/Cqt0cThlO1itAodW6oAbEUAk8gsG2wo21NInT170OBhKjUGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=unXFKKfb; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="unXFKKfb"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55ff5f6a610so2716887a12.3
        for <oe-kbuild@lists.linux.dev>; Sun, 04 Feb 2024 22:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707114505; x=1707719305; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmMoLu9PreqWVQOR3G2OG/M+QfwMHHwa1cg0igMNie0=;
        b=unXFKKfbo7ETQrdjDuCXt8BS9vlkMRwZHobBLl94qGw8Jb7T1n9/aAuJo9oEhRj/vb
         IiBShEHsL6mvgJFbXHZH8yfES5vWUQZ6r1jB/nRBR5q07MOZ1tLWLfc4iteXoNlWwv/2
         E2K2lLH457Lx3MCswq7Qlai1R+u9Ed2tvLO8WBqykHFdRA86V9zt/73sUtpDHK2FYHMf
         mum0VBgzv7dEBjOW5kXZ/cRZbn8ru2BM515KDju510+X9B+Bs/AKB1/WttHrZYavYOi0
         kTgWwmHxROv0EibaUUjGalJIJ3sv9lcZWu5+S4m5Ui06+73pGem5hKERd2vwR4wn6ter
         zVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707114505; x=1707719305;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmMoLu9PreqWVQOR3G2OG/M+QfwMHHwa1cg0igMNie0=;
        b=f7Xo3+c8sbxVo85p9/0+kl6h3YXeFrWkHZG0go4ete38LAUocJPd+pw4XKYnWE6KDd
         jkQAk7b9R0tUwMptJriva3JWSHv4/BYoWeHMhS9fYjI1BverVzdGvYmOmpbZqR2cayl6
         IY6E2zxkXgdCYVaYUl5pzSmUspk+w9/2RO3DjfOHRZm4WhtmuMQESw2QxPx36gwMcw+J
         9t2XydSYsWf6ezRbE0mT19xv3sXb/a0W/JRyrg6sS3Qv+Uai66RTfDHl1fFvUdeWZEg+
         NYsaMeZ/1yjKU+pBccOq89VlPYCTSybEt1JCOpjqvUMFV/wrk8o7bNmw56TbMNq+gnBG
         Sh7w==
X-Gm-Message-State: AOJu0Yx/SFH1KNc3XWdaua4xy9tY1a4017cp64nKEe0+ueJiXKHCNU3r
	kABTVQGIxzZANT8c6uO+KPNLJO2jC8IgX6pT2yoKKKleQwlvpaCmTaBpZxAW2aGHorhn64sA76K
	C
X-Google-Smtp-Source: AGHT+IFd4uZeCluQLRtH1P73d+QxZZL3L5sStMacnkc7NuYLeU74TtJ2q0BUZnGVYiR4hZdvRycKzg==
X-Received: by 2002:a05:6402:1a26:b0:560:4dbd:4f24 with SMTP id be6-20020a0564021a2600b005604dbd4f24mr1999039edb.5.1707114505224;
        Sun, 04 Feb 2024 22:28:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU2l/9JLCZ4RiH3CnDV/JgiaDJkTMhVW5JSJ1RreJd6q8Z72wldUjotl1tfs3u5sw7DztE+GfsdnPsP8KlHi995WfwhgjR32m+QSXOzbQA2sIocr5GZpJf9RTBVFUMNrLqsIA7Cf3VtHLVz3g8irUJrfkHxHSfZH6FQycOfYGYy8uDFkmeCZVNX97xUe6OB1Q==
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d13-20020a50fb0d000000b00557d839727esm3390196edq.7.2024.02.04.22.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 22:28:24 -0800 (PST)
Date: Mon, 5 Feb 2024 09:28:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shayne Chen <shayne.chen@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 33/45]
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:286
 __mt76_connac_mcu_alloc_sta_req() error: we previously assumed 'wcid' could
 be null (see line 281)
Message-ID: <32409dfe-249f-4a69-ae49-b8cf755dbe8a@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   9f806d96c7054c92c1e0c0005a16d80e124964b7
commit: cbc8d409f650e3e275059888f766af70a0a0ba51 [33/45] wifi: mt76: connac: set correct muar_idx for mt799x chipsets
config: i386-randconfig-141-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041909.mUA4dToD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402041909.mUA4dToD-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:286 __mt76_connac_mcu_alloc_sta_req() error: we previously assumed 'wcid' could be null (see line 281)

vim +/wcid +286 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c

d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  275  struct sk_buff *
e2c93b68cb5444 Lorenzo Bianconi 2021-12-19  276  __mt76_connac_mcu_alloc_sta_req(struct mt76_dev *dev, struct mt76_vif *mvif,
e2c93b68cb5444 Lorenzo Bianconi 2021-12-19  277  				struct mt76_wcid *wcid, int len)
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  278  {
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  279  	struct sta_req_hdr hdr = {
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  280  		.bss_idx = mvif->idx,
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26 @281  		.muar_idx = wcid ? mvif->omac_idx : 0,
                                                                            ^^^^
"wcid" can be NULL

d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  282  		.is_tlv_append = 1,
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  283  	};
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  284  	struct sk_buff *skb;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  285  
cbc8d409f650e3 Shayne Chen      2024-01-26 @286  	if (is_mt799x(dev) && !wcid->sta)
                                                                               ^^^^^^^^^
Unchecked dereference

cbc8d409f650e3 Shayne Chen      2024-01-26  287  		hdr.muar_idx = 0xe;
cbc8d409f650e3 Shayne Chen      2024-01-26  288  
67aa27431c7f87 Lorenzo Bianconi 2021-01-28  289  	mt76_connac_mcu_get_wlan_idx(dev, wcid, &hdr.wlan_idx_lo,
67aa27431c7f87 Lorenzo Bianconi 2021-01-28  290  				     &hdr.wlan_idx_hi);
e2c93b68cb5444 Lorenzo Bianconi 2021-12-19  291  	skb = mt76_mcu_msg_alloc(dev, NULL, len);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  292  	if (!skb)
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  293  		return ERR_PTR(-ENOMEM);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  294  
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  295  	skb_put_data(skb, &hdr, sizeof(hdr));
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  296  
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  297  	return skb;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  298  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

