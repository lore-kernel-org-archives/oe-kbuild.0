Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89BB189919
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938130; cv=none; b=GIz2xF4BR6PKzNzg7R11WTUNerOXDfaJpajvVdLrxXdf8cTNZLce/aDJlWnPoxQEnoFwr+rgXDK4qteypb2qewc1kE8CQLe5GV6PSEuyVWaRRYW3agjWmMAfRCa76Y1YwdsmLOjJeCH1v/ogN8Tcd0TndVXrHbYuu0ouzRYnkdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938130; c=relaxed/simple;
	bh=TFKMPnY7DyEVxOFjIJ3Z/VwODwE5uOu6Wfsj5MAkP4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Tf6PwboCJCd/YbVK0sf27HGNCACGnS4wh1asyiZlEQpsYbyEzk64VTyi4RV7vTQHcreLL1iK8MaE5WcxAB6hQkWUNcygSr3DKcPdQvsgqZz1yBIJEgrzNMHUmTAvzXfmEbfCS78aIITrAxXMfKk+mQTePnssReqkVtaabT5Orbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XFC25S4A; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XFC25S4A"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1489233f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741938126; x=1742542926; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5VICj1mgoxCCVFexS9kMcpPesi2AHSs3Nxw6/os/EPE=;
        b=XFC25S4AxQ7Iq+E3kxN96bfY5FCNUJNV9FP8LdwKcSvVsDaxIjxeWyFfVM3kR81O/k
         xNyaj1Rg2b+W+bY9vCKFQ7TTzrLQ4lTyqqWqs0BeIohg7zxj1faVGJSL1NtZkhDIgCzF
         8dcolGaTq7OwgZDwWM8m3MoDekszZznHHxy3TO/uMVFxfeqJokiKDVPodqPxvRCnlFnY
         kwx5bgmNFiijp5k7lKUeA7CTfGebkuvrxmz8sg7NxN0p2+r96aCOdntTHtyQ7Wh4WZvS
         2oJiWPMEoon64aY9KpZ4FDGLpS1zFdxPKsF2zbicCmh9F9qfZ/7Y68sUKyM2DsVWIlU4
         I4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741938126; x=1742542926;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VICj1mgoxCCVFexS9kMcpPesi2AHSs3Nxw6/os/EPE=;
        b=UGQdnENmCQSwA7Pp0T92A+QzquEmSCDWLjZaVHHLmgXR5No+G7p0nJmAOjBv++883H
         tuYacphap9q3SBU3jFO2AwAUzRHJMi9TYGu2cOg3H055ZKAcfvaOriFOFDRdtNCLSl52
         9BTVwh71dxQijer3XkzPeVxq8SwZGMBIM5mOSKyBcCbC0XU3oVp1MrHwbuNM6c8zo1AL
         2dzdh8X5sYjL2PWk5+c0UfBcZ908wE85RKrShNnI5Rsv6+fmaN4WvLBwpiuhf2CxCQx+
         Fqy32vii7Bp6dkFau/yyRhgHrVsRydykyUtgv02ClXoG4b5efNPHs8mHwnB6US9Znf3E
         Wsag==
X-Gm-Message-State: AOJu0Yy+jffAGTZI5Cg3rBd9HJ6SzDuW5Y2wA5NKKmythQflvpszC8Vd
	J8lXfILZwDYUQVP65YbIvsk7pLkANsli4kdvHS3hyUt/nkDhP36r+4js2lYA+jgB8qodp3/9Znm
	0
X-Gm-Gg: ASbGncuNpoZ2WuJ/eLG4DDY66sP1lKrcCYtCiF4aUpiX7T7Fqf4OFx1piXnOjBKJ2AP
	2pJq34acRSrwOh216IiD/MDNKlZc2dHgF7WdINvzZP+SLpgNX75gC/eeyxqnJBGM9fsEv6yOlBx
	ZlDJu2+jOZ4IMNGkrfdxISF2ZMr+V02fR5z5AN0aKYJyAb1A1ak+pppVeIaYvyVY6185dgZZaD/
	AkZNf4Kl3EgCEDedW9Y3VYWztGCKp2ruYcKq5c5jN1orj7bteLG+FEGvXin59geJKW2EJ/MITRn
	SHVd/zJdfclyiTlNUk+9i3oyOG9uxuO6ZXUEY2hMq9M5wZWHcV+djLp6aXdD
X-Google-Smtp-Source: AGHT+IFm7E17nEcoSOxY7Tw6+e0xDZ8rnIFbb6oMH7ZJtR8SbLPv6jsqnXgR/epND77bkL5mfCoWCw==
X-Received: by 2002:a5d:598b:0:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-3971d2378a8mr1262317f8f.17.1741938125641;
        Fri, 14 Mar 2025 00:42:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb7ebe4bsm4738082f8f.98.2025.03.14.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:42:05 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:42:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pratap Nirujogi <pratap.nirujogi@amd.com>,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
	dave.stevenson@raspberrypi.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
Message-ID: <237cb63f-6cfa-4a66-8bc7-21cf48c8e760@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228165317.3468075-1-pratap.nirujogi@amd.com>

Hi Pratap,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratap-Nirujogi/media-i2c-Add-OV05C-camera-sensor-driver/20250301-005638
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250228165317.3468075-1-pratap.nirujogi%40amd.com
patch subject: [PATCH] media: i2c: Add OV05C camera sensor driver
config: arm64-randconfig-r071-20250312 (https://download.01.org/0day-ci/archive/20250314/202503140559.3mp2n2oI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503140559.3mp2n2oI-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov05c.c:936 ov05c_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +936 drivers/media/i2c/ov05c.c

6da03431f4f1e18 Pratap Nirujogi 2025-02-28  922  static int ov05c_probe(struct i2c_client *client)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  923  {
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  924  	struct ov05c *ov05c;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  925  	int i, ret;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  926  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  927  	ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  928  	if (!ov05c)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  929  		return -ENOMEM;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  930  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  931  	client->dev.init_name = DRV_NAME;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  932  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  933  	/* create sensor enable gpio control */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  934  	ov05c->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable", GPIOD_OUT_LOW);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  935  	if (IS_ERR_OR_NULL(ov05c->enable_gpio))
6da03431f4f1e18 Pratap Nirujogi 2025-02-28 @936  		return PTR_ERR(ov05c->enable_gpio);

If devm_gpiod_get() returns NULL then we'd return success, but actually
devm_gpiod_get() can't return NULL.  Only error pointers.

6da03431f4f1e18 Pratap Nirujogi 2025-02-28  937  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  938  	/* Initialize subdev */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  939  	v4l2_i2c_subdev_init(&ov05c->sd, client, &ov05c_subdev_ops);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  940  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  941  	/* Initialize CCI */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  942  	ov05c->regmap = devm_cci_regmap_init_i2c(client, 8);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  943  	if (IS_ERR(ov05c->regmap)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

