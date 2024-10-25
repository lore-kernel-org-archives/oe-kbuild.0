Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E20618C935
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729841821; cv=none; b=CFeR6gxYsv34f9T2t3twwruLW/ZPDNQXMtViJyYM9OPQPpjh/Ooc6J0RcP10uxbQvUoN+JN8ofRKKAdUV3ASAWTkZethQ5oYuylkRt6zQwpwmSfgQYRdEyTHHW4SAMxE57nUSz3/QKsuSMQjOnbEKU/vqsxDlLNN0rq7rrSF85o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729841821; c=relaxed/simple;
	bh=Z7SiB+LqEbLMO/o1Bt1vSxMTz1GWzTnzXMO4ACTmoK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZVLpS/ACpVQOfQZz14LE/2oPylI3+opgEMJUu/qCEKg7QxhB6jAl7ToMWEGh6yd0qPnKB9rofvWIXFCeSC21R97Ao0Y6QzW3Wm/VD8eqW8xOmGFwobivzq6QrpAAumktkhoMCxpxm2/Z2NL8n32qd8kRLu2Ve0blu2209M1wWys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L020sck+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L020sck+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37f52925fc8so1198460f8f.1
        for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 00:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729841817; x=1730446617; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veXYQwtmDRavjPuCQQXGHKCeeVy6UPnN7/+dsEWJD4k=;
        b=L020sck+wEh9kzDKTNGyeBO0rBMLWI02PNxu+ob04CK6Mxsg6qgGlW/MkrLSuddror
         MpFzKulS8hVPBcTT2Kv5ynJZcfyH6RuCJ2wXtZd/F/VXu5VrBxOj5VVLMkv0YBEc6aS7
         Q/sBYongZy//KMlTlO5+4nbzh/V+dHYod+U0HHJq8x4MOflwnT0IgS+xTqhmdez6uhnj
         rnO0DCti1tGZvqhN5hqhYTfWXejMzEptLH1GD2CkOGqu0iCS78sx7FSRKxKMhqPtvqg6
         +sp+OwBxWUVMQMmTI4A6oL5x6aiiJoUjzl878HT9dhR4nEi0+mhaX+lrwLusrT//aK5T
         rziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729841817; x=1730446617;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veXYQwtmDRavjPuCQQXGHKCeeVy6UPnN7/+dsEWJD4k=;
        b=qKsbd52+ZSARFYZ6uBQdOVzQDeTUgvs0lx0JxQHFOGKu3ya6DW5k5fykYS9ur7NLgs
         PAcrN6Du/c3vsejKjYqDjgb05yUrt91MsxYfcSNUG7PC5ZnOnWajBqSda2lGIlnt+am/
         X8afi9aFWa5iJhgrz0XxTCvbPWWK53bzO0aiLCi0PBhZOwvYprpSiYDuYMUAxunPGi52
         piFg7KLEB9TdAiX9l1FP97Mk78XKwgVQKLWws2rtZVjxbsSJ0ofgQa1nDqXl/YZ5YCJE
         r9ITJqvWD/XvmeNjoBt0QLPqodVOr+H9RGRFBdPk0dWQ5jXwibzPH0aPzdpnsNdPsmCI
         FyFg==
X-Gm-Message-State: AOJu0YyKWFqaBTj2xezfE2ZHwWAFxt9gbCak+ZHTat59aeVZavEnY/FB
	wWJwr4MK3MYLa5nQPoODjKLDJS1zVA8MGcLU0q3BNRQLDOMeIL5wGtbp6lVVP9AJO/x0lueID7T
	2c0fZQw==
X-Google-Smtp-Source: AGHT+IE1HMa+UJGOQlVpyW2tRbd/xNeDb7P38b7MEb//J1ghs6sMp6lGLK5DVdY5NBNrPabhy9MTBw==
X-Received: by 2002:a05:6000:e07:b0:37d:446b:7dfb with SMTP id ffacd0b85a97d-37efcf843d1mr5972300f8f.45.1729841816056;
        Fri, 25 Oct 2024 00:36:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b712cbsm819573f8f.77.2024.10.25.00.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:36:55 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:36:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:645
 mt7925_load_clc() error: buffer overflow 'phy->clc' 2 <= 2
Message-ID: <e3c426c9-c3d0-4b72-b2db-8780d61b1583@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4e46774408d942efe4eb35dc62e5af3af71b9a30
commit: 9679ca7326e52282cc923c4d71d81c999cb6cd55 wifi: mt76: mt7925: fix a potential array-index-out-of-bounds issue for clc
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250608.Ly4Aj2NI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410250608.Ly4Aj2NI-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:645 mt7925_load_clc() error: buffer overflow 'phy->clc' 2 <= 2

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:1158 mt7925_mcu_set_mlo_roc() warn: variable dereferenced before check 'mconf' (see line 1130)

vim +645 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

c948b5da6bbec7 Deren Wu       2023-09-18  589  static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
c948b5da6bbec7 Deren Wu       2023-09-18  590  {
c948b5da6bbec7 Deren Wu       2023-09-18  591  	const struct mt76_connac2_fw_trailer *hdr;
c948b5da6bbec7 Deren Wu       2023-09-18  592  	const struct mt76_connac2_fw_region *region;
c948b5da6bbec7 Deren Wu       2023-09-18  593  	const struct mt7925_clc *clc;
c948b5da6bbec7 Deren Wu       2023-09-18  594  	struct mt76_dev *mdev = &dev->mt76;
c948b5da6bbec7 Deren Wu       2023-09-18  595  	struct mt792x_phy *phy = &dev->phy;
c948b5da6bbec7 Deren Wu       2023-09-18  596  	const struct firmware *fw;
c948b5da6bbec7 Deren Wu       2023-09-18  597  	int ret, i, len, offset = 0;
c948b5da6bbec7 Deren Wu       2023-09-18  598  	u8 *clc_base = NULL;
c948b5da6bbec7 Deren Wu       2023-09-18  599  
c948b5da6bbec7 Deren Wu       2023-09-18  600  	if (mt7925_disable_clc ||
c948b5da6bbec7 Deren Wu       2023-09-18  601  	    mt76_is_usb(&dev->mt76))
c948b5da6bbec7 Deren Wu       2023-09-18  602  		return 0;
c948b5da6bbec7 Deren Wu       2023-09-18  603  
c948b5da6bbec7 Deren Wu       2023-09-18  604  	ret = request_firmware(&fw, fw_name, mdev->dev);
c948b5da6bbec7 Deren Wu       2023-09-18  605  	if (ret)
c948b5da6bbec7 Deren Wu       2023-09-18  606  		return ret;
c948b5da6bbec7 Deren Wu       2023-09-18  607  
c948b5da6bbec7 Deren Wu       2023-09-18  608  	if (!fw || !fw->data || fw->size < sizeof(*hdr)) {
c948b5da6bbec7 Deren Wu       2023-09-18  609  		dev_err(mdev->dev, "Invalid firmware\n");
c948b5da6bbec7 Deren Wu       2023-09-18  610  		ret = -EINVAL;
c948b5da6bbec7 Deren Wu       2023-09-18  611  		goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  612  	}
c948b5da6bbec7 Deren Wu       2023-09-18  613  
c948b5da6bbec7 Deren Wu       2023-09-18  614  	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
c948b5da6bbec7 Deren Wu       2023-09-18  615  	for (i = 0; i < hdr->n_region; i++) {
c948b5da6bbec7 Deren Wu       2023-09-18  616  		region = (const void *)((const u8 *)hdr -
c948b5da6bbec7 Deren Wu       2023-09-18  617  					(hdr->n_region - i) * sizeof(*region));
c948b5da6bbec7 Deren Wu       2023-09-18  618  		len = le32_to_cpu(region->len);
c948b5da6bbec7 Deren Wu       2023-09-18  619  
c948b5da6bbec7 Deren Wu       2023-09-18  620  		/* check if we have valid buffer size */
c948b5da6bbec7 Deren Wu       2023-09-18  621  		if (offset + len > fw->size) {
c948b5da6bbec7 Deren Wu       2023-09-18  622  			dev_err(mdev->dev, "Invalid firmware region\n");
c948b5da6bbec7 Deren Wu       2023-09-18  623  			ret = -EINVAL;
c948b5da6bbec7 Deren Wu       2023-09-18  624  			goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  625  		}
c948b5da6bbec7 Deren Wu       2023-09-18  626  
c948b5da6bbec7 Deren Wu       2023-09-18  627  		if ((region->feature_set & FW_FEATURE_NON_DL) &&
c948b5da6bbec7 Deren Wu       2023-09-18  628  		    region->type == FW_TYPE_CLC) {
c948b5da6bbec7 Deren Wu       2023-09-18  629  			clc_base = (u8 *)(fw->data + offset);
c948b5da6bbec7 Deren Wu       2023-09-18  630  			break;
c948b5da6bbec7 Deren Wu       2023-09-18  631  		}
c948b5da6bbec7 Deren Wu       2023-09-18  632  		offset += len;
c948b5da6bbec7 Deren Wu       2023-09-18  633  	}
c948b5da6bbec7 Deren Wu       2023-09-18  634  
c948b5da6bbec7 Deren Wu       2023-09-18  635  	if (!clc_base)
c948b5da6bbec7 Deren Wu       2023-09-18  636  		goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  637  
c948b5da6bbec7 Deren Wu       2023-09-18  638  	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
c948b5da6bbec7 Deren Wu       2023-09-18  639  		clc = (const struct mt7925_clc *)(clc_base + offset);
c948b5da6bbec7 Deren Wu       2023-09-18  640  
9679ca7326e522 Ming Yen Hsieh 2024-08-19  641  		if (clc->idx > ARRAY_SIZE(phy->clc))

This should be >= instead of >.

9679ca7326e522 Ming Yen Hsieh 2024-08-19  642  			break;
9679ca7326e522 Ming Yen Hsieh 2024-08-19  643  
c948b5da6bbec7 Deren Wu       2023-09-18  644  		/* do not init buf again if chip reset triggered */
c948b5da6bbec7 Deren Wu       2023-09-18 @645  		if (phy->clc[clc->idx])
c948b5da6bbec7 Deren Wu       2023-09-18  646  			continue;
c948b5da6bbec7 Deren Wu       2023-09-18  647  
c948b5da6bbec7 Deren Wu       2023-09-18  648  		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
c948b5da6bbec7 Deren Wu       2023-09-18  649  						  le32_to_cpu(clc->len),
c948b5da6bbec7 Deren Wu       2023-09-18  650  						  GFP_KERNEL);
c948b5da6bbec7 Deren Wu       2023-09-18  651  
c948b5da6bbec7 Deren Wu       2023-09-18  652  		if (!phy->clc[clc->idx]) {
c948b5da6bbec7 Deren Wu       2023-09-18  653  			ret = -ENOMEM;
c948b5da6bbec7 Deren Wu       2023-09-18  654  			goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  655  		}
c948b5da6bbec7 Deren Wu       2023-09-18  656  	}
c948b5da6bbec7 Deren Wu       2023-09-18  657  
c948b5da6bbec7 Deren Wu       2023-09-18  658  	ret = mt7925_mcu_set_clc(dev, "00", ENVIRON_INDOOR);
c948b5da6bbec7 Deren Wu       2023-09-18  659  out:
c948b5da6bbec7 Deren Wu       2023-09-18  660  	release_firmware(fw);
c948b5da6bbec7 Deren Wu       2023-09-18  661  
c948b5da6bbec7 Deren Wu       2023-09-18  662  	return ret;
c948b5da6bbec7 Deren Wu       2023-09-18  663  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

