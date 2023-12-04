Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C2138A
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 04:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wbrhvSA0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3332f1512e8so2537389f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Dec 2023 20:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701664700; x=1702269500; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVQn0i2hfX92sEXFDpbefnTwnACZ1HnUoqi+/6j93j8=;
        b=wbrhvSA0US0El8swsD0rKhbcC28pHaRzUr4yRwpv+8EEzlt/gZEJ6tRfnTJwmHxCw8
         aYObclV42hwfT+H3t3E4/iPrR5Ss0MHgs217PLHsnVLvM2DvJEN/cx3sboGTLWuaW8Z1
         BpSa0FgJG26meeAtZvwCBWLC3gTLdy2zmckVWS9U6Jw64prTzKqUXY4LPtbmZ2x22fN9
         oT7XceO9/F+d4H9nk8zijWHvvXim+JxqQrQ1O6/PP9/Fi8ECYzzBFWv1DwBrJ33zk0lU
         Q0T5mEBTOkMQOiIiZEscq/4YEDLCqo8w6mZ++/7fzqaUWx3TcfakWeXWOWssH1Uqf360
         Lveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701664700; x=1702269500;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVQn0i2hfX92sEXFDpbefnTwnACZ1HnUoqi+/6j93j8=;
        b=W0F0l+AIZehOwQUXjRaYtmcjwJNJVrASV46gbuvy24u7NZiSky+vqAw0EEdDi4I2qV
         yxmkMu9mUxAQ801ybhUyKmOndU++cOo0McGbADkfYIj8qrepYRg8q5xVOPnORivSf5Hu
         pISH6hr2ESe/WXxu5Q9t/WusAhnavxtd2ewoFzI1wcIQtOrSwQYNsbhpPtfbqoAJGlxQ
         XzQBVpzKcyWth4YRSikFM7u7PjY4KtO1ghBIPnrAxh+zLAvafT0kp7fBPr9VA/64NdY9
         H0qwNuFIO+u4rRbk8zLFZ8OHtHIQYRXNR7dqH0QQzXiWYEveYyEv58/Hi1Oj0OZnKhSQ
         6PjA==
X-Gm-Message-State: AOJu0Yze+acH1KGNbZHdImM4Qf3yzA2Ei1of/Az7iPCsljOPe+LXo+wJ
	hchbWLEKMW4p9TAPfLME8PqqNGkVcL1Li1akDO0=
X-Google-Smtp-Source: AGHT+IELbIovpSTTHbjvjBC+0p6JC2qnWO3TVU8MRU19xKwPNO0iWFc//mgnvGbqB+waFxweUaauQQ==
X-Received: by 2002:a05:6000:12ca:b0:333:2fd2:6f59 with SMTP id l10-20020a05600012ca00b003332fd26f59mr3133348wrx.99.1701664700336;
        Sun, 03 Dec 2023 20:38:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b0033335cabb9csm6139719wru.28.2023.12.03.20.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 20:38:20 -0800 (PST)
Date: Mon, 4 Dec 2023 07:38:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/nouveau/nouveau_dp.c:237 nouveau_dp_irq() warn:
 variable dereferenced before check 'outp' (see line 232)
Message-ID: <18b847e9-a8ab-455f-a293-a3ac5fba2653@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 773eb04d14a11552b2c3953097ed09cde2ab4831 drm/nouveau/disp: expose conn event class
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231202/202312021916.U9nxtVaD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312021916.U9nxtVaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312021916.U9nxtVaD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nouveau_dp.c:237 nouveau_dp_irq() warn: variable dereferenced before check 'outp' (see line 232)

vim +/outp +237 drivers/gpu/drm/nouveau/nouveau_dp.c

773eb04d14a115 Ben Skeggs 2022-06-01  225  void
773eb04d14a115 Ben Skeggs 2022-06-01  226  nouveau_dp_irq(struct work_struct *work)
a0922278f83eae Lyude Paul 2020-08-26  227  {
773eb04d14a115 Ben Skeggs 2022-06-01  228  	struct nouveau_connector *nv_connector =
773eb04d14a115 Ben Skeggs 2022-06-01  229  		container_of(work, typeof(*nv_connector), irq_work);
a0922278f83eae Lyude Paul 2020-08-26  230  	struct drm_connector *connector = &nv_connector->base;
a0922278f83eae Lyude Paul 2020-08-26  231  	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
773eb04d14a115 Ben Skeggs 2022-06-01 @232  	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
                                                                                      ^^^^^^
Dereference

a0922278f83eae Lyude Paul 2020-08-26  233  	struct nv50_mstm *mstm;
016dacb60e6d4b Ben Skeggs 2022-06-01  234  	u64 hpd = 0;
a4efad354cf1b9 Lyude Paul 2020-08-26  235  	int ret;
a0922278f83eae Lyude Paul 2020-08-26  236  
a0922278f83eae Lyude Paul 2020-08-26 @237  	if (!outp)
                                                    ^^^^^
Too late.

a0922278f83eae Lyude Paul 2020-08-26  238  		return;
a0922278f83eae Lyude Paul 2020-08-26  239  
a0922278f83eae Lyude Paul 2020-08-26  240  	mstm = outp->dp.mstm;
a0922278f83eae Lyude Paul 2020-08-26  241  	NV_DEBUG(drm, "service %s\n", connector->name);
a0922278f83eae Lyude Paul 2020-08-26  242  
a0922278f83eae Lyude Paul 2020-08-26  243  	mutex_lock(&outp->dp.hpd_irq_lock);
a0922278f83eae Lyude Paul 2020-08-26  244  
a0922278f83eae Lyude Paul 2020-08-26  245  	if (mstm && mstm->is_mst) {
a0922278f83eae Lyude Paul 2020-08-26  246  		if (!nv50_mstm_service(drm, nv_connector, mstm))
773eb04d14a115 Ben Skeggs 2022-06-01  247  			hpd |= NVIF_CONN_EVENT_V0_UNPLUG;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

