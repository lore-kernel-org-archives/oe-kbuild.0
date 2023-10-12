Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C0D2EE
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BBOD/o/A"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32d3755214dso618971f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697092659; x=1697697459; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lHHw5osKqU6gm9kVDZUekI35aaS91GhUSW+HjPn+Xo=;
        b=BBOD/o/AVDUeKPiyb2cIuhsemMGyb22Be17o1hqkOkqfUrZWMucN25SVEnKoSHY6oN
         JQixBG9g5UoSuXaTikErdQNi2WfpQKTJjeYmMC6ErAYhMTjz5U3VlhHAMgQtD/KXnbm2
         wm7aTIFc4p2LJO+E1mEe8gZRJqQfcbcQs1yjSdlI3/8NGAswCLGGEMIaDH8VnFWiXKiC
         SyNGDL+Z6AlYBRqM/G9RLsenJHx6wnv0+b6atcZX85iOqiLMFeX90gT6gx5bUzcX3gPb
         N6QvL0rpzkOHeLi5F6DPhtkkJU0MDd3Va5hRFV/vNk50ENQTUKoniH4WpJBQ9wQorc6V
         EtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092659; x=1697697459;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lHHw5osKqU6gm9kVDZUekI35aaS91GhUSW+HjPn+Xo=;
        b=o0JvXWMnC54llyv5Cgk1bX+C6ZgfsjZ0RstTyC6udPrzAAqwwgCYxMLfnSUiEYT7oR
         56hZqfg4T8faEvtRCyDmVWJiBv3lzhfs3d3E4xt721v+jrJhVYVA3AzEnG3A99dobgQb
         NpQsFUfHbiE8ufCW10w4PXQGLxzy3LKsJWFb21v3BPkAiUmDbDUfY+VzmZjqIZ1DdZ7t
         7kGg3Lu4ndmOuiW7cb1pcTb75zQiSaUmJ2MHFh4fedH+kp9HQnEO2hCa1GzECufHiL4k
         q1cAYqDHcDpOMpKrW6FSTYR4xN7otnnus7g2k1tVaaJSRsQC0XZp0spRLw5ShW9nq6kX
         DuSw==
X-Gm-Message-State: AOJu0YwAR/uIf1Lkea3iTwLV86SLmDsTk0niqzz0FvhUldOMlNawrWbw
	YOx5U/fjP0ckVovKDktSCJBq/SwC3I1ta27wDHI=
X-Google-Smtp-Source: AGHT+IGbPDYMCgegSOFqN7ABH5wk4qRswQOklro1xtzl88uT22E4Opuxm79Mo+qIL5fWo/pecXEt/w==
X-Received: by 2002:adf:f641:0:b0:31f:b6ea:af48 with SMTP id x1-20020adff641000000b0031fb6eaaf48mr19769482wrp.49.1697092659497;
        Wed, 11 Oct 2023 23:37:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n9-20020adff089000000b0031ad2f9269dsm17288532wro.40.2023.10.11.23.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:37:39 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:37:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, David Ruth <druth@chromium.org>,
	Deren Wu <deren.wu@mediatek.com>
Subject: [linux-next:master 7796/11428]
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:302
 mt76_connac2_mac_tx_rate_val() warn: variable dereferenced before check
 'vif' (see line 296)
Message-ID: <20d00e88-c5cd-4c5f-8895-449e04f78941@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2933a1156742d8c47550493a77af8e2d81cf3c84
commit: 32b1000db221df33ec8b57794a091ba6075b6c28 [7796/11428] wifi: mt76: mt7921: fix the wrong rate pickup for the chanctx driver
config: i386-randconfig-141-20231011 (https://download.01.org/0day-ci/archive/20231012/202310121311.s9gz7dvC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121311.s9gz7dvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310121311.s9gz7dvC-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:302 mt76_connac2_mac_tx_rate_val() warn: variable dereferenced before check 'vif' (see line 296)

vim +/vif +302 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c

0b8e2d69467f78 Lorenzo Bianconi 2023-01-17  292  u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
0b8e2d69467f78 Lorenzo Bianconi 2023-01-17  293  				 struct ieee80211_vif *vif,
182071cdd594bc Lorenzo Bianconi 2022-06-07  294  				 bool beacon, bool mcast)
182071cdd594bc Lorenzo Bianconi 2022-06-07  295  {
32b1000db221df Sean Wang        2023-09-18 @296  	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
                                                                                                   ^^^^^^^^^^^^^
Unchecked dereference

32b1000db221df Sean Wang        2023-09-18  297  	struct cfg80211_chan_def *chandef = mvif->ctx ?
32b1000db221df Sean Wang        2023-09-18  298  					    &mvif->ctx->def : &mphy->chandef;
32b1000db221df Sean Wang        2023-09-18  299  	u8 nss = 0, mode = 0, band = chandef->chan->band;
182071cdd594bc Lorenzo Bianconi 2022-06-07  300  	int rateidx = 0, mcast_rate;
182071cdd594bc Lorenzo Bianconi 2022-06-07  301  
182071cdd594bc Lorenzo Bianconi 2022-06-07 @302  	if (!vif)
                                                            ^^^^
Check for NULL.  "vif" can be NULL from mt76_connac2_mac_write_txwi().


182071cdd594bc Lorenzo Bianconi 2022-06-07  303  		goto legacy;
182071cdd594bc Lorenzo Bianconi 2022-06-07  304  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

