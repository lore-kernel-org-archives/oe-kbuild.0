Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67341A732
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bl4y62dn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so46949105e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 02:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701254432; x=1701859232; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bm8nLBIkNCr+KZTfcQ7bTcLZdST9mCWQWpCA/O9wn8M=;
        b=Bl4y62dnU2mqiZ15k1FaGYQOn4Kt010r6LUsNKZfD23Qseln6r78132tYoBFR4Dwvz
         Z7L4g0QTKTYHGEsecmJO8231FfhDZVHTCioAEFaPoqB5T/VhvE1JGH8D5A3HTd+QFGXf
         oSBu9uGAlujIXt9Xg4QP+UNW4+ftp/votSrZHWns49BWUimBRsWfndwfGOxG65DFV8sd
         u7Fh539wGdYWLauHCvrmTEh5DOl+KJINQxd6zq/u/K823dpsolYtbTliYMFSm8erWqim
         b931rpIDnlv48dme8+uOk2z76tM7D8+1CcnBjejqik4M77k+xwLJ9tA1EPB7UkeA/5oj
         +I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701254432; x=1701859232;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bm8nLBIkNCr+KZTfcQ7bTcLZdST9mCWQWpCA/O9wn8M=;
        b=mNufkwcrmum42lD0FHcBnXclIeDITgbubzG8re2LcwsITOzt7iHAegYW1/o90Qa1QS
         zs0dwBQBSJFPqyVbcE2bN3ic5VwOcrPWK6tuXBJ0TesWmKLLbxZhmSL+2QQxlTdIHfsq
         QRRt8bH+OUO08/17wvhiYwF1wL9xQFczuPQojt9rgkkeuHMiRelDFShS7GykwNkifX4J
         KuQt/VJxuCV09KWxP91a9Exx4xN2kfOH7bMZqZ+vfuYpb4iHnJ0Z3LYGvFsnJX+EEuMD
         96nViql0YZgLrEAVOLv5Z5aJ9JPRYj7rQzuCriBS55icbeecQ/cHlxrUKu1Wsco1O7gm
         6t0Q==
X-Gm-Message-State: AOJu0YyStR/n3Qh2vHoG1nqllN2XC+vpNUGqYMobRo7qQC0dd/DdQPlK
	3dqj2tyZFiUj9tgwoNlUr9GhxI+Y/2RDrJGpGKwnldDj
X-Google-Smtp-Source: AGHT+IFTmNOn74uSS7KDtgmuHlJSu0eJS/zzswEYkBd3glEdfzje6WSaTZeQIc5qwPDxMRLLBKynXA==
X-Received: by 2002:a05:600c:3583:b0:401:b6f6:d90c with SMTP id p3-20020a05600c358300b00401b6f6d90cmr13516868wmq.35.1701254432319;
        Wed, 29 Nov 2023 02:40:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id az25-20020a05600c601900b0040b2b9bf321sm1778375wmb.9.2023.11.29.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 02:40:31 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Nov 2023 13:40:28 +0300
To: oe-kbuild@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 20/45] drm/vc4: hdmi: Switch to HDMI connector
Message-ID: <72609a09-57ed-45a0-bbba-b51a78ae6718@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-20-c7602158306e@kernel.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-tests-helpers-Add-atomic-helpers/20231128-193409
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231128-kms-hdmi-connector-state-v4-20-c7602158306e%40kernel.org
patch subject: [PATCH v4 20/45] drm/vc4: hdmi: Switch to HDMI connector
config: riscv-randconfig-r071-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291447.R4I3Miat-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291447.R4I3Miat-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311291447.R4I3Miat-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/vc4/vc4_hdmi.c:729 vc4_hdmi_write_infoframe() error: uninitialized symbol 'ret'.

vim +/ret +729 drivers/gpu/drm/vc4/vc4_hdmi.c

05f440faa3b81a Maxime Ripard 2023-11-28  655  static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
05f440faa3b81a Maxime Ripard 2023-11-28  656  				    enum hdmi_infoframe_type type,
05f440faa3b81a Maxime Ripard 2023-11-28  657  				    const u8 *infoframe, size_t len)
21317b3fba5428 Eric Anholt   2016-09-29  658  {
05f440faa3b81a Maxime Ripard 2023-11-28  659  	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
05f440faa3b81a Maxime Ripard 2023-11-28  660  	struct drm_device *drm = connector->dev;
05f440faa3b81a Maxime Ripard 2023-11-28  661  	u32 packet_id = type - 0x80;
311e305fdb4e82 Maxime Ripard 2020-09-03  662  	const struct vc4_hdmi_register *ram_packet_start =
311e305fdb4e82 Maxime Ripard 2020-09-03  663  		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
311e305fdb4e82 Maxime Ripard 2020-09-03  664  	u32 packet_reg = ram_packet_start->offset + VC4_HDMI_PACKET_STRIDE * packet_id;
b6079d1578dc4b Dom Cobley    2022-06-13  665  	u32 packet_reg_next = ram_packet_start->offset +
b6079d1578dc4b Dom Cobley    2022-06-13  666  		VC4_HDMI_PACKET_STRIDE * (packet_id + 1);
311e305fdb4e82 Maxime Ripard 2020-09-03  667  	void __iomem *base = __vc4_hdmi_get_field_base(vc4_hdmi,
311e305fdb4e82 Maxime Ripard 2020-09-03  668  						       ram_packet_start->reg);
b6079d1578dc4b Dom Cobley    2022-06-13  669  	uint8_t buffer[VC4_HDMI_PACKET_STRIDE] = {};
81fb55e500a82a Maxime Ripard 2021-10-25  670  	unsigned long flags;
05f440faa3b81a Maxime Ripard 2023-11-28  671  	ssize_t i;
21317b3fba5428 Eric Anholt   2016-09-29  672  	int ret;
cd00ed5187bff0 Maxime Ripard 2022-07-11  673  	int idx;
cd00ed5187bff0 Maxime Ripard 2022-07-11  674  
cd00ed5187bff0 Maxime Ripard 2022-07-11  675  	if (!drm_dev_enter(drm, &idx))
05f440faa3b81a Maxime Ripard 2023-11-28  676  		return 0;
05f440faa3b81a Maxime Ripard 2023-11-28  677  
05f440faa3b81a Maxime Ripard 2023-11-28  678  	if (len > sizeof(buffer))
05f440faa3b81a Maxime Ripard 2023-11-28  679  		goto out;

ret = -EINVAL;

05f440faa3b81a Maxime Ripard 2023-11-28  680  
05f440faa3b81a Maxime Ripard 2023-11-28  681  	memcpy(buffer, infoframe, len);
21317b3fba5428 Eric Anholt   2016-09-29  682  
311e305fdb4e82 Maxime Ripard 2020-09-03  683  	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
21317b3fba5428 Eric Anholt   2016-09-29  684  		    VC4_HDMI_RAM_PACKET_ENABLE),
21317b3fba5428 Eric Anholt   2016-09-29  685  		  "Packet RAM has to be on to store the packet.");
21317b3fba5428 Eric Anholt   2016-09-29  686  
05f440faa3b81a Maxime Ripard 2023-11-28  687  	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
21317b3fba5428 Eric Anholt   2016-09-29  688  	if (ret) {
21317b3fba5428 Eric Anholt   2016-09-29  689  		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
cd00ed5187bff0 Maxime Ripard 2022-07-11  690  		goto out;
21317b3fba5428 Eric Anholt   2016-09-29  691  	}
21317b3fba5428 Eric Anholt   2016-09-29  692  
81fb55e500a82a Maxime Ripard 2021-10-25  693  	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  694  
21317b3fba5428 Eric Anholt   2016-09-29  695  	for (i = 0; i < len; i += 7) {
311e305fdb4e82 Maxime Ripard 2020-09-03  696  		writel(buffer[i + 0] << 0 |
21317b3fba5428 Eric Anholt   2016-09-29  697  		       buffer[i + 1] << 8 |
311e305fdb4e82 Maxime Ripard 2020-09-03  698  		       buffer[i + 2] << 16,
311e305fdb4e82 Maxime Ripard 2020-09-03  699  		       base + packet_reg);
21317b3fba5428 Eric Anholt   2016-09-29  700  		packet_reg += 4;
21317b3fba5428 Eric Anholt   2016-09-29  701  
311e305fdb4e82 Maxime Ripard 2020-09-03  702  		writel(buffer[i + 3] << 0 |
21317b3fba5428 Eric Anholt   2016-09-29  703  		       buffer[i + 4] << 8 |
21317b3fba5428 Eric Anholt   2016-09-29  704  		       buffer[i + 5] << 16 |
311e305fdb4e82 Maxime Ripard 2020-09-03  705  		       buffer[i + 6] << 24,
311e305fdb4e82 Maxime Ripard 2020-09-03  706  		       base + packet_reg);
21317b3fba5428 Eric Anholt   2016-09-29  707  		packet_reg += 4;
21317b3fba5428 Eric Anholt   2016-09-29  708  	}
21317b3fba5428 Eric Anholt   2016-09-29  709  
b6079d1578dc4b Dom Cobley    2022-06-13  710  	/*
b6079d1578dc4b Dom Cobley    2022-06-13  711  	 * clear remainder of packet ram as it's included in the
b6079d1578dc4b Dom Cobley    2022-06-13  712  	 * infoframe and triggers a checksum error on hdmi analyser
b6079d1578dc4b Dom Cobley    2022-06-13  713  	 */
b6079d1578dc4b Dom Cobley    2022-06-13  714  	for (; packet_reg < packet_reg_next; packet_reg += 4)
b6079d1578dc4b Dom Cobley    2022-06-13  715  		writel(0, base + packet_reg);
b6079d1578dc4b Dom Cobley    2022-06-13  716  
311e305fdb4e82 Maxime Ripard 2020-09-03  717  	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
311e305fdb4e82 Maxime Ripard 2020-09-03  718  		   HDMI_READ(HDMI_RAM_PACKET_CONFIG) | BIT(packet_id));
81fb55e500a82a Maxime Ripard 2021-10-25  719  
81fb55e500a82a Maxime Ripard 2021-10-25  720  	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  721  
311e305fdb4e82 Maxime Ripard 2020-09-03  722  	ret = wait_for((HDMI_READ(HDMI_RAM_PACKET_STATUS) &
21317b3fba5428 Eric Anholt   2016-09-29  723  			BIT(packet_id)), 100);
21317b3fba5428 Eric Anholt   2016-09-29  724  	if (ret)
21317b3fba5428 Eric Anholt   2016-09-29  725  		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
cd00ed5187bff0 Maxime Ripard 2022-07-11  726  
cd00ed5187bff0 Maxime Ripard 2022-07-11  727  out:
cd00ed5187bff0 Maxime Ripard 2022-07-11  728  	drm_dev_exit(idx);
05f440faa3b81a Maxime Ripard 2023-11-28 @729  	return ret;
21317b3fba5428 Eric Anholt   2016-09-29  730  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

