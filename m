Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5925B1F1
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYy66gPo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3316a4bc37dso3448245f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 02:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700649820; x=1701254620; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxvYEiAdK16hEUnfnJJGpW9bKts3DPTjhH3GkFHM2Cc=;
        b=aYy66gPoyghHi3LB6nUxcIjoeMSJlE8TRMIKqj3D2c8V7IO0YlmW5DAJ01S6DtiASD
         z1Z+ZqQKKmJnWveC44tpSR+fH/rVIDeOznLnSNr2BmH8fpDAk6SimT8kC3/QU7MJf+8H
         hyufzBkfbP7b4FFr6OEfnG7UKS4CR0rHc/f7D8f97wjxeZdYKgEttrI39izF6LXLwHKy
         nTJ2kpwhWjLZyMKuvTksravsKn4qAHpEuc5AgLBPVxxGayt/zTFv0sRhf1Zh6Pg5LvzS
         ZE+XTuG/bUx0xiOHcePC/1+pyqYyaz7SVrom/7Aj2bttrwtlQmivbUvi22MkTkzP9lXy
         l89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700649820; x=1701254620;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxvYEiAdK16hEUnfnJJGpW9bKts3DPTjhH3GkFHM2Cc=;
        b=FNdzCUrMEUvnmD2Xx3gTilvrbDn0Z2b5tsTbCgqcKgZekEHS8AObaGvnlZFkKTi+Ke
         /W/VHCInNfGkMm0E9H+CbU/sHckbRo6gMN3VYIg1LKxLe/fTiP5z67jeyB8YuzJMbUEm
         Su+m+X7KBlSfrkNGV59dBb1S0TIIH0wLiPI4FKsgye8C81NrHetZZZ2nK7vmbsyKAMqd
         UEgYnjwttYXO5CeuUzWPiabgbbyuetc9stMwh0FlVHhkjyT0IEYFW4RG7q3OVmD+IYJR
         Wx4dbvzIE2Kpbrv0D85hre/54hBtNgK52YLZMtz4DUy63PZ7XMZ9noWrsHgygUzHGEOW
         jAlA==
X-Gm-Message-State: AOJu0Yxupl0GFA15wFS1qN4BBoakgjI7Al7MDUgRKx4cwfxy6AN62whk
	ctISv4ydCXLj1avn1uDjh6RAXVBio2rVG86awYM=
X-Google-Smtp-Source: AGHT+IEDZxTP8EA5UdKKS6Vae+fmnJaRF9SBb9RgsfEGdz5fZObyG7C0joEJetvcV0BPBtBITg6AdA==
X-Received: by 2002:a5d:6d8c:0:b0:332:c5f8:a082 with SMTP id l12-20020a5d6d8c000000b00332c5f8a082mr1469372wrs.13.1700649820030;
        Wed, 22 Nov 2023 02:43:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t16-20020adff610000000b0032da4c98ab2sm16796346wrp.35.2023.11.22.02.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:43:39 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Nov 2023 05:43:37 -0500
To: oe-kbuild@lists.linux.dev, Mehdi Djait <mehdi.djait@bootlin.com>,
	mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com, maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v9 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <f39cdd12-4be4-4a9b-9ec6-3704c84e12da@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc65a89e7803782a75bf663158e031356ef7cb1a.1700235276.git.mehdi.djait@bootlin.com>

Hi Mehdi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/dt-bindings-vendor-prefixes-Add-techwell-vendor-prefix/20231117-234411
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/dc65a89e7803782a75bf663158e031356ef7cb1a.1700235276.git.mehdi.djait%40bootlin.com
patch subject: [PATCH v9 3/3] media: i2c: Introduce a driver for the Techwell TW9900 decoder
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221134.0i9KavRs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221134.0i9KavRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311221134.0i9KavRs-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/tw9900.c:628 tw9900_runtime_resume() warn: inconsistent returns '&tw9900->mutex'.

Old smatch warnings:
drivers/media/i2c/tw9900.c:348 tw9900_s_std() error: uninitialized symbol 'mode'.

vim +628 drivers/media/i2c/tw9900.c

cf24af11e0a74c Mehdi Djait 2023-11-17  597  static int tw9900_runtime_resume(struct device *dev)
cf24af11e0a74c Mehdi Djait 2023-11-17  598  {
cf24af11e0a74c Mehdi Djait 2023-11-17  599  	struct i2c_client *client = to_i2c_client(dev);
cf24af11e0a74c Mehdi Djait 2023-11-17  600  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
cf24af11e0a74c Mehdi Djait 2023-11-17  601  	struct tw9900 *tw9900 = to_tw9900(sd);
cf24af11e0a74c Mehdi Djait 2023-11-17  602  	int ret;
cf24af11e0a74c Mehdi Djait 2023-11-17  603  
cf24af11e0a74c Mehdi Djait 2023-11-17  604  	mutex_lock(&tw9900->mutex);
cf24af11e0a74c Mehdi Djait 2023-11-17  605  
cf24af11e0a74c Mehdi Djait 2023-11-17  606  	if (tw9900->reset_gpio)
cf24af11e0a74c Mehdi Djait 2023-11-17  607  		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
cf24af11e0a74c Mehdi Djait 2023-11-17  608  
cf24af11e0a74c Mehdi Djait 2023-11-17  609  	ret = regulator_enable(tw9900->regulator);
cf24af11e0a74c Mehdi Djait 2023-11-17  610  	if (ret < 0)
cf24af11e0a74c Mehdi Djait 2023-11-17  611  		return ret;

mutex_unlock(&tw9900->mutex) before returning.

cf24af11e0a74c Mehdi Djait 2023-11-17  612  
cf24af11e0a74c Mehdi Djait 2023-11-17  613  	usleep_range(50000, 52000);
cf24af11e0a74c Mehdi Djait 2023-11-17  614  
cf24af11e0a74c Mehdi Djait 2023-11-17  615  	if (tw9900->reset_gpio)
cf24af11e0a74c Mehdi Djait 2023-11-17  616  		gpiod_set_value_cansleep(tw9900->reset_gpio, 0);
cf24af11e0a74c Mehdi Djait 2023-11-17  617  
cf24af11e0a74c Mehdi Djait 2023-11-17  618  	usleep_range(1000, 2000);
cf24af11e0a74c Mehdi Djait 2023-11-17  619  
cf24af11e0a74c Mehdi Djait 2023-11-17  620  	ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
cf24af11e0a74c Mehdi Djait 2023-11-17  621  				 ARRAY_SIZE(tw9900_init_regs));
cf24af11e0a74c Mehdi Djait 2023-11-17  622  
cf24af11e0a74c Mehdi Djait 2023-11-17  623  	mutex_unlock(&tw9900->mutex);
cf24af11e0a74c Mehdi Djait 2023-11-17  624  
cf24af11e0a74c Mehdi Djait 2023-11-17  625  	/* This sleep is needed for the Horizontal Sync PLL to lock. */
cf24af11e0a74c Mehdi Djait 2023-11-17  626  	msleep(300);
cf24af11e0a74c Mehdi Djait 2023-11-17  627  
cf24af11e0a74c Mehdi Djait 2023-11-17 @628  	return ret;
cf24af11e0a74c Mehdi Djait 2023-11-17  629  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

