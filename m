Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA221DC997
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161073; cv=none; b=WqMRq4/p0G7M8N7rya/DuNBcb1EsKlsEKfFtTfp2D9EotCcrxCDi9QNHQbIvSB16mtfrJ8XSkDZGRv2Xg/cM/pVrzXqPe1C8C82U9JYPOcqInIx3PwT3Zamt2RJMrJEkZTdcv5RILRfCI/pEwq+fgiE6uvJrYBDtAuBztv3MXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161073; c=relaxed/simple;
	bh=UCgVkiom8nz4fIeV6EvMKy0EzhRWuAARQZZdbRoyRGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNUzPwGovsU6V8nQhnDDkUbUI1JNJIO0gK8CkMHxx8LNFV7zhdl5O+UzhDBxJhZ4+w9gLC5JwfslJ6HzedmGN1SvGTqjB9Jyh1l8fM1AxfSmx3aCTzDhKzbpSmNSP1bvLjxu5UHYC2wyWMi3RGYXEDKoKtE+5t4FTdI9XPfXrLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVGE7MV7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zVGE7MV7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so149224475e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 02:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736161067; x=1736765867; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPRobQRsKCwgVrxpSoPXkw2vC8TTf35HhDAtS269Z9g=;
        b=zVGE7MV7H4d5hKc+wdGz71GO+fyEDUO1TM9WuM+clSOrQwQVo1Pkdo2GJe4Rq7RDUz
         +WInpqXFkYTwhvUmOlYmXnbdXpIBe8nk8wwF2fO4T+MSH+O9Pe0GzhmKAJk3VmulCE18
         U+H7xLjbT063oVPKeAu6so2e5KJ5zq9dCni/CtBZu7a63k7SFAB7VGd0SiC6RW2Ax9Xq
         cT+pBO2BOC6PTb0BhxM1kmp1FAyBphdZK7uMxuvbpy9NzX2PlL9dKGWi6k4ebDUYcK9j
         bi0eRVcfW8SiRzx/q9hI9Cs7pKHKK7Hj42Aj+hqP5U4AKQiJOBVwFKb10BJ4i3nIRLJJ
         vfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161067; x=1736765867;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPRobQRsKCwgVrxpSoPXkw2vC8TTf35HhDAtS269Z9g=;
        b=jERrmaLLU22wtppSze/74eDuSBIjYI3q0zGUEkyew7hfoEokAqpriSYibaph3lbxws
         qk4LSwKQ4Rm3ZHy7DCtftSXg1HcpZY1azPM46bAHyDyV7VIIS09wwZ2ShqF7ryvhyj1W
         mttRzdf+7VvT42OD85H8vA0DyoJ5ATE5yjeqtXzpo+3+rPN0xIA5s1d2UGDtxrv6r67S
         rfi6lYspas/Tku3QfCHDYbgVlZCF83gmt56ZBrR0cuTvgLvxMlVmGGUONyDrInEnP1Uo
         cQ5F0xfyaG8EPUGhFPiarUDiGwgx0FHlMYS6eA2rdkZAS/0JcWDsarDrJySxccJ1Og2Q
         gJ9g==
X-Gm-Message-State: AOJu0YwnbogIKFZF8cnyH26iWD7Rar4NRfoQqg8jk0i51SBjLslOfh6r
	AjZcyXjC2x1tWbCCInBiUSsdPnj5eL2fA1nzdZV7TZ7oemQHVlv/Y3shl9rrYV+rJppXcMJyI8y
	G
X-Gm-Gg: ASbGncuqaRof2teHFWqKW7oq0VoqdH4xtRLcA1NLnpTL7TuE/lYO2I+bf+Rt9ePkB6f
	S6wOPHZDpywWa5rzQOZHfbueAHVEYc+geSnJAA0NjwR/PgLpwtg7S31dtSkfD2YWLwfP2ry5C3Y
	U7di6OW4oKMkuKOB+9BJzh0wxf7SVavRcU59B/OLHw+TsFUosvfQvlCQJtqdXkBxjMvYlCsefCT
	qywVhhVSyyIG35lBBUHX0CwB8JnDQh47XAidIa2MfOyOpWtYxxXJbnmRECFeQ==
X-Google-Smtp-Source: AGHT+IEENb3C2pGCCmedXyTv7pK4hdKmlEB7QTh/OUuMs1YXX+u96gMpPfBQoZbIzeQgcvSEa3mFqw==
X-Received: by 2002:a05:600c:1d07:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-43668548986mr482710945e9.4.1736161066989;
        Mon, 06 Jan 2025 02:57:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b00cf6sm606610235e9.10.2025.01.06.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:57:46 -0800 (PST)
Date: Mon, 6 Jan 2025 13:57:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 99/99] drivers/mailbox/mailbox.c:485
 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()
Message-ID: <14cf2535-55ed-40ce-85b6-fa22ebd961f0@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   470a6487b5bb9674538d8dc645791263251b6996
commit: 71e4fcb288df366078213ba4fcf976f12a14d5e2 [99/99] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
config: i386-randconfig-141-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310057.CBZZURC9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412310057.CBZZURC9-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox.c:485 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()

vim +/chan +485 drivers/mailbox/mailbox.c

2b6d83e2b8b7de Jassi Brar      2014-06-12  444  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
2b6d83e2b8b7de Jassi Brar      2014-06-12  445  {
2b6d83e2b8b7de Jassi Brar      2014-06-12  446  	struct device *dev = cl->dev;
2b6d83e2b8b7de Jassi Brar      2014-06-12  447  	struct mbox_controller *mbox;
2b6d83e2b8b7de Jassi Brar      2014-06-12  448  	struct of_phandle_args spec;
2b6d83e2b8b7de Jassi Brar      2014-06-12  449  	struct mbox_chan *chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  450  	int ret;
2b6d83e2b8b7de Jassi Brar      2014-06-12  451  
2b6d83e2b8b7de Jassi Brar      2014-06-12  452  	if (!dev || !dev->of_node) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  453  		pr_debug("%s: No owner device node\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  454  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  455  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  456  
2b6d83e2b8b7de Jassi Brar      2014-06-12  457  	mutex_lock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  458  
2b6d83e2b8b7de Jassi Brar      2014-06-12  459  	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
2b6d83e2b8b7de Jassi Brar      2014-06-12  460  				       "#mbox-cells", index, &spec)) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  461  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  462  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  463  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  464  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  465  
2d805fc1c6b2ec Benson Leung    2015-05-04  466  	chan = ERR_PTR(-EPROBE_DEFER);
2b6d83e2b8b7de Jassi Brar      2014-06-12  467  	list_for_each_entry(mbox, &mbox_cons, node)
2b6d83e2b8b7de Jassi Brar      2014-06-12  468  		if (mbox->dev->of_node == spec.np) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  469  			chan = mbox->of_xlate(mbox, &spec);
8ed82e23875e60 Mikko Perttunen 2018-11-28  470  			if (!IS_ERR(chan))
2b6d83e2b8b7de Jassi Brar      2014-06-12  471  				break;
2b6d83e2b8b7de Jassi Brar      2014-06-12  472  		}
2b6d83e2b8b7de Jassi Brar      2014-06-12  473  
2b6d83e2b8b7de Jassi Brar      2014-06-12  474  	of_node_put(spec.np);
2b6d83e2b8b7de Jassi Brar      2014-06-12  475  
2d805fc1c6b2ec Benson Leung    2015-05-04  476  	if (IS_ERR(chan)) {
2d805fc1c6b2ec Benson Leung    2015-05-04  477  		mutex_unlock(&con_mutex);
2d805fc1c6b2ec Benson Leung    2015-05-04  478  		return chan;
2d805fc1c6b2ec Benson Leung    2015-05-04  479  	}
2d805fc1c6b2ec Benson Leung    2015-05-04  480  
85a953806557db Elliot Berman   2023-04-10  481  	ret = __mbox_bind_client(chan, cl);
85a953806557db Elliot Berman   2023-04-10  482  	if (ret)
2b6d83e2b8b7de Jassi Brar      2014-06-12  483  		chan = ERR_PTR(ret);

chan is an error pointer.

2b6d83e2b8b7de Jassi Brar      2014-06-12  484  
71e4fcb288df36 Jason-JH.Lin    2024-06-14 @485  	if (chan->mbox->ops->power_put)
                                                            ^^^^^^
Crashes

71e4fcb288df36 Jason-JH.Lin    2024-06-14  486  		chan->mbox->ops->power_put(chan);
71e4fcb288df36 Jason-JH.Lin    2024-06-14  487  
2b6d83e2b8b7de Jassi Brar      2014-06-12  488  	mutex_unlock(&con_mutex);
71e4fcb288df36 Jason-JH.Lin    2024-06-14  489  
2b6d83e2b8b7de Jassi Brar      2014-06-12  490  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  491  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

