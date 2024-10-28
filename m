Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11409190671
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104110; cv=none; b=uhJJjLhet1eZClJ52spWhVikuaDDeLJD9mw6Oj/1AE3meQSLInZklHgRMz9Fj6csU/iflnuGkFGt1Mn1OUOd44DkyqDcpn8RsMz/eLuhMRCnl9U60QU535R4VpvFm51vrRJ3KMvcdZuqjRHnntoauuOVMtOXbbVsIY9MLdQ019Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104110; c=relaxed/simple;
	bh=NVqXPS/L5BH4Gj7hbSyrhwDNjVwxjaH3REBBB+8AaVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=p+jPu6wKDEYbQ+bLxlZL4ohwH2upFe+SaTV+to719Az5jiLN438shuYN84ZV2UYvpOhqFiayuHuaQ5b5GGkzbOkj+OieBYf0MxziCcPR37GnJl0Vz1hzT3c0b0wJzzXQBdRUFlLsARUYtMIflPyoj2XSEou0ZDb/8dx89t+5Qpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGaFi+wl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGaFi+wl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so40696405e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 01:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730104105; x=1730708905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed5R3HTvhdD4zg/QXCYj0XYDAVw0ReLkpicM5ODvyHk=;
        b=TGaFi+wluyuHSPcCFknFi5DJ36Ghhd9IEcMh6ofVPFbE1Iei1MrQXSeaaRETJ5LfzL
         qiaWcIxuDQO3vfyCV7Up+msurbne9mGltk6y7DUv9G7iLQORSrpjjYRQ1aE0viPLGdhH
         IBVo67GLNjZm0iA2DJTQHn1DRKzb2iCIRWKaC4PCfCH6II798WZF2fxoXTj2x6Z1eNx8
         Zgxh5dcuOiuLYcdaPqXRIvGr7zpGxev0i2PSqEyz5FZ1FgnTOvLrUjdmW5OZ/ydxTlZ8
         rXvmPNFaJVEaKaTwoSB8akcPIumHwNZwVkcik5GWtbCkchz9SRT6+UPnwwWwCwuNsQM1
         Ir9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104105; x=1730708905;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ed5R3HTvhdD4zg/QXCYj0XYDAVw0ReLkpicM5ODvyHk=;
        b=ANJupGCoImxklaeiatF0SOFI0U0yuIH1ncQUDNYBsMO8ief9IIW3w3CEpwcvG6K9zc
         QyJ2nzV7of0OvJTDujzJ+/6mk0D8yTdmrev4CZzQ+G9OwBtuRMuF+sp1cgnzqoneDCgQ
         +LBPm952mrc0PEjufGKKi4++ZswBZFA16iuvKvptbfGNsC07LSab5zBqgxQ5egpsxPLF
         3Q8y3GWjZOsQEQ/pSXR3koprvAlknNzHiKIDNSki0/Eqaa1GOYUoFuwHxkKVoJ20pbJt
         tpl6tOuTrZrPijeCeGJAQllJW8t0byMPpIQ+gEmOVHpg0qp6dyGqU8/bKcr/A56Uh5Hv
         D4Tw==
X-Gm-Message-State: AOJu0Yz8NG/B3ODVtDdak6K40BHZZ48kA7LF9ik0T0zllZwYuIf7Y2Qd
	osYIBCzVtVAqH/Yawq6Mji0r/ztBsCLT9AAiuTnD/uzavsQJjYGHJNL6VOpEZHNkknTb87q/ZEA
	ik8c=
X-Google-Smtp-Source: AGHT+IEYWIsUxoaKX8/fpnoCrdG/jrvGQXwhIqgHw0yNtoMJow/Z0Cqr6QdJVulUYioxSRFShPxQEA==
X-Received: by 2002:a05:6000:10d0:b0:37d:30e7:3865 with SMTP id ffacd0b85a97d-380611a3e4amr5808602f8f.34.1730104105211;
        Mon, 28 Oct 2024 01:28:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c4cdsm8808039f8f.24.2024.10.28.01.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:28:24 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:28:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Herve Codina <herve.codina@bootlin.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <9a16ee73-cdc9-47bc-88f7-2fed5fdad2ff@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024095539.1637280-3-herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/dt-bindings-display-bridge-sn65dsi83-Add-interrupt/20241024-175758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241024095539.1637280-3-herve.codina%40bootlin.com
patch subject: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery mechanism
config: csky-randconfig-r073-20241026 (https://download.01.org/0day-ci/archive/20241026/202410262052.CRR7XezU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410262052.CRR7XezU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/ti-sn65dsi83.c:360 sn65dsi83_reset_pipeline() error: uninitialized symbol 'state'.

vim +/state +360 drivers/gpu/drm/bridge/ti-sn65dsi83.c

caeb909b9ed830 Herve Codina 2024-10-24  330  static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi83)
caeb909b9ed830 Herve Codina 2024-10-24  331  {
caeb909b9ed830 Herve Codina 2024-10-24  332  	struct drm_device *dev = sn65dsi83->bridge.dev;
caeb909b9ed830 Herve Codina 2024-10-24  333  	struct drm_modeset_acquire_ctx ctx;
caeb909b9ed830 Herve Codina 2024-10-24  334  	struct drm_atomic_state *state;

Almost everyone has their compiler set to zero out stack variables these days.
You should set this to struct drm_atomic_state *state = ERR_PTR(-EINVAL);.

caeb909b9ed830 Herve Codina 2024-10-24  335  	int err;
caeb909b9ed830 Herve Codina 2024-10-24  336  
caeb909b9ed830 Herve Codina 2024-10-24  337  	/* Use operation done in drm_atomic_helper_suspend() followed by
caeb909b9ed830 Herve Codina 2024-10-24  338  	 * operation done in drm_atomic_helper_resume() but without releasing
caeb909b9ed830 Herve Codina 2024-10-24  339  	 * the lock between suspend()/resume()
caeb909b9ed830 Herve Codina 2024-10-24  340  	 */
caeb909b9ed830 Herve Codina 2024-10-24  341  
caeb909b9ed830 Herve Codina 2024-10-24  342  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);

This macro has a goto in it.

caeb909b9ed830 Herve Codina 2024-10-24  343  
caeb909b9ed830 Herve Codina 2024-10-24  344  	state = drm_atomic_helper_duplicate_state(dev, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  345  	if (IS_ERR(state)) {
caeb909b9ed830 Herve Codina 2024-10-24  346  		err = PTR_ERR(state);
caeb909b9ed830 Herve Codina 2024-10-24  347  		goto unlock;
caeb909b9ed830 Herve Codina 2024-10-24  348  	}
caeb909b9ed830 Herve Codina 2024-10-24  349  
caeb909b9ed830 Herve Codina 2024-10-24  350  	err = drm_atomic_helper_disable_all(dev, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  351  	if (err < 0)
caeb909b9ed830 Herve Codina 2024-10-24  352  		goto unlock;
caeb909b9ed830 Herve Codina 2024-10-24  353  
caeb909b9ed830 Herve Codina 2024-10-24  354  	drm_mode_config_reset(dev);
caeb909b9ed830 Herve Codina 2024-10-24  355  
caeb909b9ed830 Herve Codina 2024-10-24  356  	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  357  
caeb909b9ed830 Herve Codina 2024-10-24  358  unlock:
caeb909b9ed830 Herve Codina 2024-10-24  359  	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
caeb909b9ed830 Herve Codina 2024-10-24 @360  	if (!IS_ERR(state))
caeb909b9ed830 Herve Codina 2024-10-24  361  		drm_atomic_state_put(state);

Calling drm_atomic_state_put(NULL) leads to an Oops.

caeb909b9ed830 Herve Codina 2024-10-24  362  	return err;
caeb909b9ed830 Herve Codina 2024-10-24  363  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

