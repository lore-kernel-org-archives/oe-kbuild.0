Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634C1581E1
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 10:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727259814; cv=none; b=W62G0cPq56s99IaFk6qLthlE+BEAXSUvKfEEGMOm6132UAGNu7DuRLV9CaqvKVCSVkwoHT/CKyUQn9Z9vpwV6j9XhZUbfIzQnNELrkPDkB490Sa97q27XMEO+UD4Kv3RdO4cIJpfJJcZUWy8dON5i4WwoL6Xm3NV+BQEksjXFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727259814; c=relaxed/simple;
	bh=vjWycP45HhhCp3ETqGH7uuChLSDiaSwQ0IlTcy1jKJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G209ay9+SIUxrw/6XccPkiPj4clMExGWcmt0mcD4ZMj0219L4nFS5ujftJ9Ue3JGNc7H/mjdhRHZqBf4JcJG8dQ28w5z92f8tT1GASwo/dGWoUocDAS7kZRfCW90ESBZ78d3BLMAQcDVUwY0N/PxL1T0zf+cZHi/Wn8Xa1KinXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fwr4qrlj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fwr4qrlj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374b25263a3so3948689f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 03:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727259810; x=1727864610; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZziYVmQUzLLCEW/TBrSqZS3UISZIG6me6ba4iQL8NZ4=;
        b=fwr4qrlj2Qa5QNjlXk7ptrZZOto+XW8IfagQQidWJlSMTA1goiPM6bbk/JzT8xj6mU
         qpaBM67cPV0HEfFzQZq3udyXew+yBNkZJzcPFpMWNkyQRYAL/WrB6DMEDI9ckkDmspR3
         Tn9/qBvESgvQVKIJWfw3MXWRDvspsYE7koHwIMp5j7KoUIvAMzf8SFzK8pUhwdlCvE9U
         V/Hk5xljlpeXp8/LIV/Cosgq8lkeOWWfrPScgIvcTG0KgfXMqGHeXepSx0A2dP9AcVWJ
         0KsseRtiGGSTq3LzYKnxfIBzD0pIcLzQemPGNXFkmTZTm71vgPUI6AfB3rJdXCBF/mdg
         RRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259810; x=1727864610;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZziYVmQUzLLCEW/TBrSqZS3UISZIG6me6ba4iQL8NZ4=;
        b=PL+P8X+0+9r7vFNL4Mo2lp7auR+950ZRSjYk9+XG95ijBb1+ndaSW4pmGzF47pBzL7
         i7TuTlln5ZUuh7wOu4sdiSu1XrGTDQIU7+t5XichY8rGB/P5PYvfLbme7VemOirRlhpH
         Sj/gh+GdVngWoqvbU17T39xZFGQR9FVxsd7nSH0GR5d07U2Vv8gGqMkZOB3mb/OAapw+
         wZFisEVr6Ss8bqt+KY7OXrqNiuYrTnFSKkie6vHZOXPt6WR6OWgoooWrjm7SGYMMqWEi
         U+DCExci9lRbV+nSON5Yadn8dK1HB9yz0cBaHKsixDA4tOgxGUBouU/bdrXuhmjW/H8A
         e8xQ==
X-Gm-Message-State: AOJu0Ywz4dyoYNHSW5WYIgyMA9rfNpQUQU1P9BdcyKI37umuO6DYiR6N
	GyWtoIJ9XNZEUYzWPnfNE35cQohWP837V9hOSod+ZjZcLQaSrfDEQD1ffThJxVcByVC/yYecG3W
	r
X-Google-Smtp-Source: AGHT+IEt3Ucx92nE4o8sPcm5FzMm8vaXledTlK+sxljdxxDzyyiUHK3Swgy39bKRoFqZFE6YNyIfxg==
X-Received: by 2002:adf:f28e:0:b0:374:c712:507a with SMTP id ffacd0b85a97d-37cc2479442mr1256564f8f.32.1727259809740;
        Wed, 25 Sep 2024 03:23:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8af4sm3578413f8f.1.2024.09.25.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:23:28 -0700 (PDT)
Date: Wed, 25 Sep 2024 13:23:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
	Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>,
	Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:573
 atmel_hlcdc_plane_update_buffers() error: uninitialized symbol 'sr'.
Message-ID: <dea96f7e-ace6-4f8e-aeca-6cb627a42d23@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8eb5bd9a818cc5f2a1e50b22b0091830b28cc36
commit: d498771b0b830140a70cb8118ee0ee522be94f39 drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops
config: sparc-randconfig-r071-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240320.MZPgi3Up-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409240320.MZPgi3Up-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:573 atmel_hlcdc_plane_update_buffers() error: uninitialized symbol 'sr'.

vim +/sr +573 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c

aa71584b323acf Manikandan Muralidharan 2024-04-24  556  static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
aa71584b323acf Manikandan Muralidharan 2024-04-24  557  					     struct atmel_hlcdc_plane_state *state)
aa71584b323acf Manikandan Muralidharan 2024-04-24  558  {
aa71584b323acf Manikandan Muralidharan 2024-04-24  559  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
aa71584b323acf Manikandan Muralidharan 2024-04-24  560  	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
aa71584b323acf Manikandan Muralidharan 2024-04-24  561  	struct drm_framebuffer *fb = state->base.fb;
aa71584b323acf Manikandan Muralidharan 2024-04-24  562  	u32 sr;
aa71584b323acf Manikandan Muralidharan 2024-04-24  563  	int i;
aa71584b323acf Manikandan Muralidharan 2024-04-24  564  
d498771b0b8301 Manikandan Muralidharan 2024-04-24  565  	if (!dc->desc->is_xlcdc)
aa71584b323acf Manikandan Muralidharan 2024-04-24  566  		sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);

Uninitialized on else path.

aa71584b323acf Manikandan Muralidharan 2024-04-24  567  
aa71584b323acf Manikandan Muralidharan 2024-04-24  568  	for (i = 0; i < state->nplanes; i++) {
aa71584b323acf Manikandan Muralidharan 2024-04-24  569  		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
aa71584b323acf Manikandan Muralidharan 2024-04-24  570  
aa71584b323acf Manikandan Muralidharan 2024-04-24  571  		state->dscrs[i]->addr = gem->dma_addr + state->offsets[i];
aa71584b323acf Manikandan Muralidharan 2024-04-24  572  
aa71584b323acf Manikandan Muralidharan 2024-04-24 @573  		dc->desc->ops->lcdc_update_buffers(plane, state, sr, i);
                                                                                                                         ^^

aa71584b323acf Manikandan Muralidharan 2024-04-24  574  
9a45d33cdf82f1 Boris Brezillon         2017-02-06  575  		if (desc->layout.xstride[i])
9a45d33cdf82f1 Boris Brezillon         2017-02-06  576  			atmel_hlcdc_layer_write_cfg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon         2017-02-06  577  						    desc->layout.xstride[i],
9a45d33cdf82f1 Boris Brezillon         2017-02-06  578  						    state->xstride[i]);
9a45d33cdf82f1 Boris Brezillon         2017-02-06  579  
9a45d33cdf82f1 Boris Brezillon         2017-02-06  580  		if (desc->layout.pstride[i])
9a45d33cdf82f1 Boris Brezillon         2017-02-06  581  			atmel_hlcdc_layer_write_cfg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon         2017-02-06  582  						    desc->layout.pstride[i],
2389fc1305fc1e Boris Brezillon         2015-02-05  583  						    state->pstride[i]);
1a396789f65a22 Boris Brezillon         2015-01-06  584  	}
1a396789f65a22 Boris Brezillon         2015-01-06  585  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

