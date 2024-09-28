Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A696FB9
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727554700; cv=none; b=hc7mshkskLnE+Uj21MuYRBWYLQDe+EhnJHvxIHeMyZZmNddYzRLnvYjfEcEEXaCe1kAkDzdSwxkeOW1SRYf8FzIZCS/gaKZD1MToBxianq3TK2cfLysMnbOLnU6UvuhmZElB/nm50nrbH+HkBV+dkojLCq4xiKnctHnxoph9JmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727554700; c=relaxed/simple;
	bh=QCzE7OXt3scz4J/0HLDEKu9efP83CBbDiO11fRHRyqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5TlztOWZe9PEtaADY/kLQ6wu9InEEO9i7z/Sb1paRa3g/kvyT6AT0qNRPc48k5qF6ileKR4ZUfS0Z2SEdBghdX3RBOrrWsAtibwFHWqo/177IMSJ7DLZ+R5yTVLGsOjbu0JT2JN3z/moj0AKiEV/8nyY0SJQrKcQH4U+2GiJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFHMz8oR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFHMz8oR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so30431985e9.0
        for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 13:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727554695; x=1728159495; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFl91JysbasP8S+08NGKkITxqA5MV+KiGkiucFOgOL8=;
        b=fFHMz8oRw2jZWhNEUaQkJgicH6rK7o7smd3vwZflOiOu+O4I99VOGtyYijXreraLrX
         KCGVhEhqw8ZIDTvE3OrYnn19D7nWr0CWhvZsi8AWXyOmhAiHDJSHoLQd4T7Tf15F411J
         F9IGvqgLiPp+IqYkS98XQ/7y/edAkmrJoIuLZmOnTRU747xX6sCoGyePB0L8jSZRTwNy
         n6JFoyKUHV5n5RsOehPhK+h0PjoSWNGneKK/0w3P5kczZbIImXfTpHvwJLrcgPcWDS1i
         74CzaD5axutw0Q/HZVwSfAVKHwtDjCqILE8+6XMllfowfAt2qKjgjszTaS6DjBj2wwcf
         1N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727554695; x=1728159495;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFl91JysbasP8S+08NGKkITxqA5MV+KiGkiucFOgOL8=;
        b=THWVoeyu22vZrmhO0a1mPImjaWY3DLC5Skgpqw80bAXu1JYPi7q4sNUxxRrj80fYIH
         iuPoJBgztnnKNvNN/5QtnAhgv/Hwe+2fwz6els9v5hJ83W9U7tci5n8peokMQYtdogZt
         OE0DB2D9df9fG4TqCaI0TxJ+dMuoq3nH7xe/dLNnzvdSu1JpgVTEdWRpAMNeA5TdAPU/
         zpXS7egF2rIP2roW2R0SWVgb3nSI4QYZzCaq5dp1P/mYndriq29ATWct/9ZSfHSLvNS4
         qb8WfIHi/oTrDVnM0kN/bLVbj4ZjIOLul7SAxsUDrm1VDMB1BINC/t0IdeSmdsP6sQ6C
         OGhQ==
X-Gm-Message-State: AOJu0Yy70M6wA5E0S0u06QI9oSh6LGOuSJM1YYXYWFjQT10DCL0S2Ebq
	HItnzMP+5p/okl+O/cZ+D795essDfElV3ra4F3nnM9Yz7fqGL7RZVJ/ix6H6qkThzO2cXBNwQJk
	F
X-Google-Smtp-Source: AGHT+IEHbDZESleRy4/azf5b9hvaQINvWVvXfDSIzbFy3fvT7zn3KjQ2rrQat0uzOeD/McAnYss4HQ==
X-Received: by 2002:a05:600c:3b14:b0:42d:8340:cd13 with SMTP id 5b1f17b1804b1-42f5840d99fmr55840465e9.2.1727554695316;
        Sat, 28 Sep 2024 13:18:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e13314sm62017815e9.35.2024.09.28.13.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 13:18:14 -0700 (PDT)
Date: Sat, 28 Sep 2024 23:18:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Otavio Salvador <otavio@ossystems.com.br>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1073/16788]
 drivers/video/fbdev/mxc/mxc_edid.c:285 mxc_edid_parse_ext_blk() warn:
 returning -1 instead of -ENOMEM is sloppy
Message-ID: <571e197f-3b73-446b-9d04-7fdce25faeb5@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 5186caddfc7d3885dd5dfd4c6d15caad2f900c4c [1073/16788] video: fbdev: mxc: add Northwest Logic DSI driver support
config: i386-randconfig-141-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282041.TApWUfvs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409282041.TApWUfvs-lkp@intel.com/

smatch warnings:
drivers/video/fbdev/mxc/mxc_edid.c:285 mxc_edid_parse_ext_blk() warn: returning -1 instead of -ENOMEM is sloppy

vim +285 drivers/video/fbdev/mxc/mxc_edid.c

5186caddfc7d38 Fancy Fang 2019-08-19  269  int mxc_edid_parse_ext_blk(unsigned char *edid,
5186caddfc7d38 Fancy Fang 2019-08-19  270  		struct mxc_edid_cfg *cfg,
5186caddfc7d38 Fancy Fang 2019-08-19  271  		struct fb_monspecs *specs)
5186caddfc7d38 Fancy Fang 2019-08-19  272  {
5186caddfc7d38 Fancy Fang 2019-08-19  273  	char detail_timing_desc_offset;
5186caddfc7d38 Fancy Fang 2019-08-19  274  	struct fb_videomode *mode, *m;
5186caddfc7d38 Fancy Fang 2019-08-19  275  	unsigned char index = 0x0;
5186caddfc7d38 Fancy Fang 2019-08-19  276  	unsigned char *block;
5186caddfc7d38 Fancy Fang 2019-08-19  277  	int i, num = 0, revision;
5186caddfc7d38 Fancy Fang 2019-08-19  278  
5186caddfc7d38 Fancy Fang 2019-08-19  279  	if (edid[index++] != 0x2) /* only support cea ext block now */
5186caddfc7d38 Fancy Fang 2019-08-19  280  		return 0;
5186caddfc7d38 Fancy Fang 2019-08-19  281  	revision = edid[index++];
5186caddfc7d38 Fancy Fang 2019-08-19  282  	DPRINTK("cea extent revision %d\n", revision);
5186caddfc7d38 Fancy Fang 2019-08-19  283  	mode = kzalloc(50 * sizeof(struct fb_videomode), GFP_KERNEL);

kcalloc();

5186caddfc7d38 Fancy Fang 2019-08-19  284  	if (mode == NULL)

Run this through checkpatch.

5186caddfc7d38 Fancy Fang 2019-08-19 @285  		return -1;

return -ENOMEM;

5186caddfc7d38 Fancy Fang 2019-08-19  286  
5186caddfc7d38 Fancy Fang 2019-08-19  287  	detail_timing_desc_offset = edid[index++];
5186caddfc7d38 Fancy Fang 2019-08-19  288  
5186caddfc7d38 Fancy Fang 2019-08-19  289  	if (revision >= 2) {
5186caddfc7d38 Fancy Fang 2019-08-19  290  		cfg->cea_underscan = (edid[index] >> 7) & 0x1;
5186caddfc7d38 Fancy Fang 2019-08-19  291  		cfg->cea_basicaudio = (edid[index] >> 6) & 0x1;
5186caddfc7d38 Fancy Fang 2019-08-19  292  		cfg->cea_ycbcr444 = (edid[index] >> 5) & 0x1;
5186caddfc7d38 Fancy Fang 2019-08-19  293  		cfg->cea_ycbcr422 = (edid[index] >> 4) & 0x1;
5186caddfc7d38 Fancy Fang 2019-08-19  294  
5186caddfc7d38 Fancy Fang 2019-08-19  295  		DPRINTK("CEA underscan %d\n", cfg->cea_underscan);
5186caddfc7d38 Fancy Fang 2019-08-19  296  		DPRINTK("CEA basicaudio %d\n", cfg->cea_basicaudio);
5186caddfc7d38 Fancy Fang 2019-08-19  297  		DPRINTK("CEA ycbcr444 %d\n", cfg->cea_ycbcr444);
5186caddfc7d38 Fancy Fang 2019-08-19  298  		DPRINTK("CEA ycbcr422 %d\n", cfg->cea_ycbcr422);
5186caddfc7d38 Fancy Fang 2019-08-19  299  	}
5186caddfc7d38 Fancy Fang 2019-08-19  300  
5186caddfc7d38 Fancy Fang 2019-08-19  301  	if (revision >= 3) {
5186caddfc7d38 Fancy Fang 2019-08-19  302  		/* short desc */
5186caddfc7d38 Fancy Fang 2019-08-19  303  		DPRINTK("CEA Short desc timmings\n");
5186caddfc7d38 Fancy Fang 2019-08-19  304  		index++;
5186caddfc7d38 Fancy Fang 2019-08-19  305  		while (index < detail_timing_desc_offset) {
5186caddfc7d38 Fancy Fang 2019-08-19  306  			unsigned char tagcode, blklen;
5186caddfc7d38 Fancy Fang 2019-08-19  307  
5186caddfc7d38 Fancy Fang 2019-08-19  308  			tagcode = (edid[index] >> 5) & 0x7;
5186caddfc7d38 Fancy Fang 2019-08-19  309  			blklen = (edid[index]) & 0x1f;
5186caddfc7d38 Fancy Fang 2019-08-19  310  
5186caddfc7d38 Fancy Fang 2019-08-19  311  			DPRINTK("Tagcode %x Len %d\n", tagcode, blklen);
5186caddfc7d38 Fancy Fang 2019-08-19  312  
5186caddfc7d38 Fancy Fang 2019-08-19  313  			switch (tagcode) {
5186caddfc7d38 Fancy Fang 2019-08-19  314  			case 0x2: /*Video data block*/
5186caddfc7d38 Fancy Fang 2019-08-19  315  				{
5186caddfc7d38 Fancy Fang 2019-08-19  316  					int cea_idx;
5186caddfc7d38 Fancy Fang 2019-08-19  317  					i = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  318  					while (i < blklen) {
5186caddfc7d38 Fancy Fang 2019-08-19  319  						index++;
5186caddfc7d38 Fancy Fang 2019-08-19  320  						cea_idx = edid[index] & 0x7f;
5186caddfc7d38 Fancy Fang 2019-08-19  321  						if (cea_idx < ARRAY_SIZE(mxc_cea_mode) &&
5186caddfc7d38 Fancy Fang 2019-08-19  322  								(mxc_cea_mode[cea_idx].xres)) {
5186caddfc7d38 Fancy Fang 2019-08-19  323  							DPRINTK("Support CEA Format #%d\n", cea_idx);
5186caddfc7d38 Fancy Fang 2019-08-19  324  							mode[num] = mxc_cea_mode[cea_idx];
5186caddfc7d38 Fancy Fang 2019-08-19  325  							mode[num].flag |= FB_MODE_IS_STANDARD;
5186caddfc7d38 Fancy Fang 2019-08-19  326  							num++;
5186caddfc7d38 Fancy Fang 2019-08-19  327  						}
5186caddfc7d38 Fancy Fang 2019-08-19  328  						i++;
5186caddfc7d38 Fancy Fang 2019-08-19  329  					}
5186caddfc7d38 Fancy Fang 2019-08-19  330  					break;
5186caddfc7d38 Fancy Fang 2019-08-19  331  				}
5186caddfc7d38 Fancy Fang 2019-08-19  332  			case 0x3: /*Vendor specific data*/
5186caddfc7d38 Fancy Fang 2019-08-19  333  				{
5186caddfc7d38 Fancy Fang 2019-08-19  334  					unsigned char IEEE_reg_iden[3];
5186caddfc7d38 Fancy Fang 2019-08-19  335  					unsigned char deep_color;
5186caddfc7d38 Fancy Fang 2019-08-19  336  					unsigned char latency_present;
5186caddfc7d38 Fancy Fang 2019-08-19  337  					unsigned char I_latency_present;
5186caddfc7d38 Fancy Fang 2019-08-19  338  					unsigned char hdmi_video_present;
5186caddfc7d38 Fancy Fang 2019-08-19  339  					unsigned char hdmi_3d_present;
5186caddfc7d38 Fancy Fang 2019-08-19  340  					unsigned char hdmi_3d_multi_present;
5186caddfc7d38 Fancy Fang 2019-08-19  341  					unsigned char hdmi_vic_len;
5186caddfc7d38 Fancy Fang 2019-08-19  342  					unsigned char hdmi_3d_len;
5186caddfc7d38 Fancy Fang 2019-08-19  343  					unsigned char index_inc = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  344  					unsigned char vsd_end;
5186caddfc7d38 Fancy Fang 2019-08-19  345  
5186caddfc7d38 Fancy Fang 2019-08-19  346  					vsd_end = index + blklen;
5186caddfc7d38 Fancy Fang 2019-08-19  347  
5186caddfc7d38 Fancy Fang 2019-08-19  348  					IEEE_reg_iden[0] = edid[index+1];
5186caddfc7d38 Fancy Fang 2019-08-19  349  					IEEE_reg_iden[1] = edid[index+2];
5186caddfc7d38 Fancy Fang 2019-08-19  350  					IEEE_reg_iden[2] = edid[index+3];
5186caddfc7d38 Fancy Fang 2019-08-19  351  					cfg->physical_address[0] = (edid[index+4] & 0xf0) >> 4;
5186caddfc7d38 Fancy Fang 2019-08-19  352  					cfg->physical_address[1] = (edid[index+4] & 0x0f);
5186caddfc7d38 Fancy Fang 2019-08-19  353  					cfg->physical_address[2] = (edid[index+5] & 0xf0) >> 4;
5186caddfc7d38 Fancy Fang 2019-08-19  354  					cfg->physical_address[3] = (edid[index+5] & 0x0f);
5186caddfc7d38 Fancy Fang 2019-08-19  355  
5186caddfc7d38 Fancy Fang 2019-08-19  356  					if ((IEEE_reg_iden[0] == 0x03) &&
5186caddfc7d38 Fancy Fang 2019-08-19  357  							(IEEE_reg_iden[1] == 0x0c) &&
5186caddfc7d38 Fancy Fang 2019-08-19  358  							(IEEE_reg_iden[2] == 0x00))
5186caddfc7d38 Fancy Fang 2019-08-19  359  						cfg->hdmi_cap = 1;
5186caddfc7d38 Fancy Fang 2019-08-19  360  
5186caddfc7d38 Fancy Fang 2019-08-19  361  					if (blklen > 5) {
5186caddfc7d38 Fancy Fang 2019-08-19  362  						deep_color = edid[index+6];
5186caddfc7d38 Fancy Fang 2019-08-19  363  						if (deep_color & 0x80)
5186caddfc7d38 Fancy Fang 2019-08-19  364  							cfg->vsd_support_ai = true;
5186caddfc7d38 Fancy Fang 2019-08-19  365  						if (deep_color & 0x40)
5186caddfc7d38 Fancy Fang 2019-08-19  366  							cfg->vsd_dc_48bit = true;
5186caddfc7d38 Fancy Fang 2019-08-19  367  						if (deep_color & 0x20)
5186caddfc7d38 Fancy Fang 2019-08-19  368  							cfg->vsd_dc_36bit = true;
5186caddfc7d38 Fancy Fang 2019-08-19  369  						if (deep_color & 0x10)
5186caddfc7d38 Fancy Fang 2019-08-19  370  							cfg->vsd_dc_30bit = true;
5186caddfc7d38 Fancy Fang 2019-08-19  371  						if (deep_color & 0x08)
5186caddfc7d38 Fancy Fang 2019-08-19  372  							cfg->vsd_dc_y444 = true;
5186caddfc7d38 Fancy Fang 2019-08-19  373  						if (deep_color & 0x01)
5186caddfc7d38 Fancy Fang 2019-08-19  374  							cfg->vsd_dvi_dual = true;
5186caddfc7d38 Fancy Fang 2019-08-19  375  					}
5186caddfc7d38 Fancy Fang 2019-08-19  376  
5186caddfc7d38 Fancy Fang 2019-08-19  377  					DPRINTK("VSD hdmi capability %d\n", cfg->hdmi_cap);
5186caddfc7d38 Fancy Fang 2019-08-19  378  					DPRINTK("VSD support ai %d\n", cfg->vsd_support_ai);
5186caddfc7d38 Fancy Fang 2019-08-19  379  					DPRINTK("VSD support deep color 48bit %d\n", cfg->vsd_dc_48bit);
5186caddfc7d38 Fancy Fang 2019-08-19  380  					DPRINTK("VSD support deep color 36bit %d\n", cfg->vsd_dc_36bit);
5186caddfc7d38 Fancy Fang 2019-08-19  381  					DPRINTK("VSD support deep color 30bit %d\n", cfg->vsd_dc_30bit);
5186caddfc7d38 Fancy Fang 2019-08-19  382  					DPRINTK("VSD support deep color y444 %d\n", cfg->vsd_dc_y444);
5186caddfc7d38 Fancy Fang 2019-08-19  383  					DPRINTK("VSD support dvi dual %d\n", cfg->vsd_dvi_dual);
5186caddfc7d38 Fancy Fang 2019-08-19  384  
5186caddfc7d38 Fancy Fang 2019-08-19  385  					if (blklen > 6)
5186caddfc7d38 Fancy Fang 2019-08-19  386  						cfg->vsd_max_tmdsclk_rate = edid[index+7] * 5;
5186caddfc7d38 Fancy Fang 2019-08-19  387  					DPRINTK("VSD MAX TMDS CLOCK RATE %d\n", cfg->vsd_max_tmdsclk_rate);
5186caddfc7d38 Fancy Fang 2019-08-19  388  
5186caddfc7d38 Fancy Fang 2019-08-19  389  					if (blklen > 7) {
5186caddfc7d38 Fancy Fang 2019-08-19  390  						latency_present = edid[index+8] >> 7;
5186caddfc7d38 Fancy Fang 2019-08-19  391  						I_latency_present =  (edid[index+8] & 0x40) >> 6;
5186caddfc7d38 Fancy Fang 2019-08-19  392  						hdmi_video_present = (edid[index+8] & 0x20) >> 5;
5186caddfc7d38 Fancy Fang 2019-08-19  393  						cfg->vsd_cnc3 = (edid[index+8] & 0x8) >> 3;
5186caddfc7d38 Fancy Fang 2019-08-19  394  						cfg->vsd_cnc2 = (edid[index+8] & 0x4) >> 2;
5186caddfc7d38 Fancy Fang 2019-08-19  395  						cfg->vsd_cnc1 = (edid[index+8] & 0x2) >> 1;
5186caddfc7d38 Fancy Fang 2019-08-19  396  						cfg->vsd_cnc0 = edid[index+8] & 0x1;
5186caddfc7d38 Fancy Fang 2019-08-19  397  
5186caddfc7d38 Fancy Fang 2019-08-19  398  						DPRINTK("VSD cnc0 %d\n", cfg->vsd_cnc0);
5186caddfc7d38 Fancy Fang 2019-08-19  399  						DPRINTK("VSD cnc1 %d\n", cfg->vsd_cnc1);
5186caddfc7d38 Fancy Fang 2019-08-19  400  						DPRINTK("VSD cnc2 %d\n", cfg->vsd_cnc2);
5186caddfc7d38 Fancy Fang 2019-08-19  401  						DPRINTK("VSD cnc3 %d\n", cfg->vsd_cnc3);
5186caddfc7d38 Fancy Fang 2019-08-19  402  						DPRINTK("latency_present %d\n", latency_present);
5186caddfc7d38 Fancy Fang 2019-08-19  403  						DPRINTK("I_latency_present %d\n", I_latency_present);
5186caddfc7d38 Fancy Fang 2019-08-19  404  						DPRINTK("hdmi_video_present %d\n", hdmi_video_present);
5186caddfc7d38 Fancy Fang 2019-08-19  405  
5186caddfc7d38 Fancy Fang 2019-08-19  406  					} else {
5186caddfc7d38 Fancy Fang 2019-08-19  407  						index += blklen;
5186caddfc7d38 Fancy Fang 2019-08-19  408  						break;
5186caddfc7d38 Fancy Fang 2019-08-19  409  					}
5186caddfc7d38 Fancy Fang 2019-08-19  410  
5186caddfc7d38 Fancy Fang 2019-08-19  411  					index += 9;
5186caddfc7d38 Fancy Fang 2019-08-19  412  
5186caddfc7d38 Fancy Fang 2019-08-19  413  					/*latency present */
5186caddfc7d38 Fancy Fang 2019-08-19  414  					if (latency_present) {
5186caddfc7d38 Fancy Fang 2019-08-19  415  						cfg->vsd_video_latency = edid[index++];
5186caddfc7d38 Fancy Fang 2019-08-19  416  						cfg->vsd_audio_latency = edid[index++];
5186caddfc7d38 Fancy Fang 2019-08-19  417  
5186caddfc7d38 Fancy Fang 2019-08-19  418  						if (I_latency_present) {
5186caddfc7d38 Fancy Fang 2019-08-19  419  							cfg->vsd_I_video_latency = edid[index++];
5186caddfc7d38 Fancy Fang 2019-08-19  420  							cfg->vsd_I_audio_latency = edid[index++];
5186caddfc7d38 Fancy Fang 2019-08-19  421  						} else {
5186caddfc7d38 Fancy Fang 2019-08-19  422  							cfg->vsd_I_video_latency = cfg->vsd_video_latency;
5186caddfc7d38 Fancy Fang 2019-08-19  423  							cfg->vsd_I_audio_latency = cfg->vsd_audio_latency;
5186caddfc7d38 Fancy Fang 2019-08-19  424  						}
5186caddfc7d38 Fancy Fang 2019-08-19  425  
5186caddfc7d38 Fancy Fang 2019-08-19  426  						DPRINTK("VSD latency video_latency  %d\n", cfg->vsd_video_latency);
5186caddfc7d38 Fancy Fang 2019-08-19  427  						DPRINTK("VSD latency audio_latency  %d\n", cfg->vsd_audio_latency);
5186caddfc7d38 Fancy Fang 2019-08-19  428  						DPRINTK("VSD latency I_video_latency  %d\n", cfg->vsd_I_video_latency);
5186caddfc7d38 Fancy Fang 2019-08-19  429  						DPRINTK("VSD latency I_audio_latency  %d\n", cfg->vsd_I_audio_latency);
5186caddfc7d38 Fancy Fang 2019-08-19  430  					}
5186caddfc7d38 Fancy Fang 2019-08-19  431  
5186caddfc7d38 Fancy Fang 2019-08-19  432  					if (hdmi_video_present) {
5186caddfc7d38 Fancy Fang 2019-08-19  433  						hdmi_3d_present = edid[index] >> 7;
5186caddfc7d38 Fancy Fang 2019-08-19  434  						hdmi_3d_multi_present = (edid[index] & 0x60) >> 5;
5186caddfc7d38 Fancy Fang 2019-08-19  435  						index++;
5186caddfc7d38 Fancy Fang 2019-08-19  436  						hdmi_vic_len = (edid[index] & 0xe0) >> 5;
5186caddfc7d38 Fancy Fang 2019-08-19  437  						hdmi_3d_len = edid[index] & 0x1f;
5186caddfc7d38 Fancy Fang 2019-08-19  438  						index++;
5186caddfc7d38 Fancy Fang 2019-08-19  439  
5186caddfc7d38 Fancy Fang 2019-08-19  440  						DPRINTK("hdmi_3d_present %d\n", hdmi_3d_present);
5186caddfc7d38 Fancy Fang 2019-08-19  441  						DPRINTK("hdmi_3d_multi_present %d\n", hdmi_3d_multi_present);
5186caddfc7d38 Fancy Fang 2019-08-19  442  						DPRINTK("hdmi_vic_len %d\n", hdmi_vic_len);
5186caddfc7d38 Fancy Fang 2019-08-19  443  						DPRINTK("hdmi_3d_len %d\n", hdmi_3d_len);
5186caddfc7d38 Fancy Fang 2019-08-19  444  
5186caddfc7d38 Fancy Fang 2019-08-19  445  						if (hdmi_vic_len > 0) {
5186caddfc7d38 Fancy Fang 2019-08-19  446  							for (i = 0; i < hdmi_vic_len; i++) {
5186caddfc7d38 Fancy Fang 2019-08-19  447  								cfg->hdmi_vic[i] = edid[index++];
5186caddfc7d38 Fancy Fang 2019-08-19  448  								DPRINTK("HDMI_vic=%d\n", cfg->hdmi_vic[i]);
5186caddfc7d38 Fancy Fang 2019-08-19  449  							}
5186caddfc7d38 Fancy Fang 2019-08-19  450  						}
5186caddfc7d38 Fancy Fang 2019-08-19  451  
5186caddfc7d38 Fancy Fang 2019-08-19  452  						if (hdmi_3d_len > 0) {
5186caddfc7d38 Fancy Fang 2019-08-19  453  							if (hdmi_3d_present) {
5186caddfc7d38 Fancy Fang 2019-08-19  454  								if (hdmi_3d_multi_present == 0x1) {
5186caddfc7d38 Fancy Fang 2019-08-19  455  									cfg->hdmi_3d_struct_all = (edid[index] << 8) | edid[index+1];
5186caddfc7d38 Fancy Fang 2019-08-19  456  									index_inc = 2;
5186caddfc7d38 Fancy Fang 2019-08-19  457  								} else if (hdmi_3d_multi_present == 0x2) {
5186caddfc7d38 Fancy Fang 2019-08-19  458  									cfg->hdmi_3d_struct_all = (edid[index] << 8) | edid[index+1];
5186caddfc7d38 Fancy Fang 2019-08-19  459  									cfg->hdmi_3d_mask_all = (edid[index+2] << 8) | edid[index+3];
5186caddfc7d38 Fancy Fang 2019-08-19  460  									index_inc = 4;
5186caddfc7d38 Fancy Fang 2019-08-19  461  								} else
5186caddfc7d38 Fancy Fang 2019-08-19  462  									index_inc = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  463  							}
5186caddfc7d38 Fancy Fang 2019-08-19  464  
5186caddfc7d38 Fancy Fang 2019-08-19  465  							DPRINTK("HDMI 3d struct all =0x%x\n", cfg->hdmi_3d_struct_all);
5186caddfc7d38 Fancy Fang 2019-08-19  466  							DPRINTK("HDMI 3d mask all =0x%x\n", cfg->hdmi_3d_mask_all);
5186caddfc7d38 Fancy Fang 2019-08-19  467  
5186caddfc7d38 Fancy Fang 2019-08-19  468  							/* Read 2D vic 3D_struct */
5186caddfc7d38 Fancy Fang 2019-08-19  469  							if ((hdmi_3d_len - index_inc) > 0) {
5186caddfc7d38 Fancy Fang 2019-08-19  470  								DPRINTK("Support 3D video format\n");
5186caddfc7d38 Fancy Fang 2019-08-19  471  								i = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  472  								while ((hdmi_3d_len - index_inc) > 0) {
5186caddfc7d38 Fancy Fang 2019-08-19  473  
5186caddfc7d38 Fancy Fang 2019-08-19  474  									cfg->hdmi_3d_format[i].vic_order_2d = edid[index+index_inc] >> 4;
5186caddfc7d38 Fancy Fang 2019-08-19  475  									cfg->hdmi_3d_format[i].struct_3d = edid[index+index_inc] & 0x0f;
5186caddfc7d38 Fancy Fang 2019-08-19  476  									index_inc++;
5186caddfc7d38 Fancy Fang 2019-08-19  477  
5186caddfc7d38 Fancy Fang 2019-08-19  478  									if (cfg->hdmi_3d_format[i].struct_3d ==  8) {
5186caddfc7d38 Fancy Fang 2019-08-19  479  										cfg->hdmi_3d_format[i].detail_3d = edid[index+index_inc] >> 4;
5186caddfc7d38 Fancy Fang 2019-08-19  480  										index_inc++;
5186caddfc7d38 Fancy Fang 2019-08-19  481  									} else if (cfg->hdmi_3d_format[i].struct_3d > 8) {
5186caddfc7d38 Fancy Fang 2019-08-19  482  										cfg->hdmi_3d_format[i].detail_3d = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  483  										index_inc++;
5186caddfc7d38 Fancy Fang 2019-08-19  484  									}
5186caddfc7d38 Fancy Fang 2019-08-19  485  
5186caddfc7d38 Fancy Fang 2019-08-19  486  									DPRINTK("vic_order_2d=%d, 3d_struct=%d, 3d_detail=0x%x\n",
5186caddfc7d38 Fancy Fang 2019-08-19  487  											cfg->hdmi_3d_format[i].vic_order_2d,
5186caddfc7d38 Fancy Fang 2019-08-19  488  											cfg->hdmi_3d_format[i].struct_3d,
5186caddfc7d38 Fancy Fang 2019-08-19  489  											cfg->hdmi_3d_format[i].detail_3d);
5186caddfc7d38 Fancy Fang 2019-08-19  490  									i++;
5186caddfc7d38 Fancy Fang 2019-08-19  491  								}
5186caddfc7d38 Fancy Fang 2019-08-19  492  							}
5186caddfc7d38 Fancy Fang 2019-08-19  493  						}
5186caddfc7d38 Fancy Fang 2019-08-19  494  					}
5186caddfc7d38 Fancy Fang 2019-08-19  495  
5186caddfc7d38 Fancy Fang 2019-08-19  496  					index = vsd_end;
5186caddfc7d38 Fancy Fang 2019-08-19  497  
5186caddfc7d38 Fancy Fang 2019-08-19  498  					break;
5186caddfc7d38 Fancy Fang 2019-08-19  499  				}
5186caddfc7d38 Fancy Fang 2019-08-19  500  			case 0x1: /*Audio data block*/
5186caddfc7d38 Fancy Fang 2019-08-19  501  				{
5186caddfc7d38 Fancy Fang 2019-08-19  502  					u8 audio_format, max_ch, byte1, byte2, byte3;
5186caddfc7d38 Fancy Fang 2019-08-19  503  
5186caddfc7d38 Fancy Fang 2019-08-19  504  					i = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  505  					cfg->max_channels = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  506  					cfg->sample_rates = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  507  					cfg->sample_sizes = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  508  
5186caddfc7d38 Fancy Fang 2019-08-19  509  					while (i < blklen) {
5186caddfc7d38 Fancy Fang 2019-08-19  510  						byte1 = edid[index + 1];
5186caddfc7d38 Fancy Fang 2019-08-19  511  						byte2 = edid[index + 2];
5186caddfc7d38 Fancy Fang 2019-08-19  512  						byte3 = edid[index + 3];
5186caddfc7d38 Fancy Fang 2019-08-19  513  						index += 3;
5186caddfc7d38 Fancy Fang 2019-08-19  514  						i += 3;
5186caddfc7d38 Fancy Fang 2019-08-19  515  
5186caddfc7d38 Fancy Fang 2019-08-19  516  						audio_format = byte1 >> 3;
5186caddfc7d38 Fancy Fang 2019-08-19  517  						max_ch = (byte1 & 0x07) + 1;
5186caddfc7d38 Fancy Fang 2019-08-19  518  
5186caddfc7d38 Fancy Fang 2019-08-19  519  						DPRINTK("Audio Format Descriptor : %2d\n", audio_format);
5186caddfc7d38 Fancy Fang 2019-08-19  520  						DPRINTK("Max Number of Channels  : %2d\n", max_ch);
5186caddfc7d38 Fancy Fang 2019-08-19  521  						DPRINTK("Sample Rates            : %02x\n", byte2);
5186caddfc7d38 Fancy Fang 2019-08-19  522  
5186caddfc7d38 Fancy Fang 2019-08-19  523  						/* ALSA can't specify specific compressed
5186caddfc7d38 Fancy Fang 2019-08-19  524  						 * formats, so only care about PCM for now. */
5186caddfc7d38 Fancy Fang 2019-08-19  525  						if (audio_format == AUDIO_CODING_TYPE_LPCM) {
5186caddfc7d38 Fancy Fang 2019-08-19  526  							if (max_ch > cfg->max_channels)
5186caddfc7d38 Fancy Fang 2019-08-19  527  								cfg->max_channels = max_ch;
5186caddfc7d38 Fancy Fang 2019-08-19  528  
5186caddfc7d38 Fancy Fang 2019-08-19  529  							cfg->sample_rates |= byte2;
5186caddfc7d38 Fancy Fang 2019-08-19  530  							cfg->sample_sizes |= byte3 & 0x7;
5186caddfc7d38 Fancy Fang 2019-08-19  531  							DPRINTK("Sample Sizes            : %02x\n",
5186caddfc7d38 Fancy Fang 2019-08-19  532  								byte3 & 0x7);
5186caddfc7d38 Fancy Fang 2019-08-19  533  						}
5186caddfc7d38 Fancy Fang 2019-08-19  534  					}
5186caddfc7d38 Fancy Fang 2019-08-19  535  					break;
5186caddfc7d38 Fancy Fang 2019-08-19  536  				}
5186caddfc7d38 Fancy Fang 2019-08-19  537  			case 0x4: /*Speaker allocation block*/
5186caddfc7d38 Fancy Fang 2019-08-19  538  				{
5186caddfc7d38 Fancy Fang 2019-08-19  539  					i = 0;
5186caddfc7d38 Fancy Fang 2019-08-19  540  					while (i < blklen) {
5186caddfc7d38 Fancy Fang 2019-08-19  541  						cfg->speaker_alloc = edid[index + 1];
5186caddfc7d38 Fancy Fang 2019-08-19  542  						index += 3;
5186caddfc7d38 Fancy Fang 2019-08-19  543  						i += 3;
5186caddfc7d38 Fancy Fang 2019-08-19  544  						DPRINTK("Speaker Alloc           : %02x\n", cfg->speaker_alloc);
5186caddfc7d38 Fancy Fang 2019-08-19  545  					}
5186caddfc7d38 Fancy Fang 2019-08-19  546  					break;
5186caddfc7d38 Fancy Fang 2019-08-19  547  				}
5186caddfc7d38 Fancy Fang 2019-08-19  548  			case 0x7: /*User extended block*/
5186caddfc7d38 Fancy Fang 2019-08-19  549  			default:
5186caddfc7d38 Fancy Fang 2019-08-19  550  				/* skip */
5186caddfc7d38 Fancy Fang 2019-08-19  551  				DPRINTK("Not handle block, tagcode = 0x%x\n", tagcode);
5186caddfc7d38 Fancy Fang 2019-08-19  552  				index += blklen;
5186caddfc7d38 Fancy Fang 2019-08-19  553  				break;
5186caddfc7d38 Fancy Fang 2019-08-19  554  			}
5186caddfc7d38 Fancy Fang 2019-08-19  555  
5186caddfc7d38 Fancy Fang 2019-08-19  556  			index++;
5186caddfc7d38 Fancy Fang 2019-08-19  557  		}
5186caddfc7d38 Fancy Fang 2019-08-19  558  	}
5186caddfc7d38 Fancy Fang 2019-08-19  559  
5186caddfc7d38 Fancy Fang 2019-08-19  560  	/* long desc */
5186caddfc7d38 Fancy Fang 2019-08-19  561  	DPRINTK("CEA long desc timmings\n");
5186caddfc7d38 Fancy Fang 2019-08-19  562  	index = detail_timing_desc_offset;
5186caddfc7d38 Fancy Fang 2019-08-19  563  	block = edid + index;
5186caddfc7d38 Fancy Fang 2019-08-19  564  	while (index < (EDID_LENGTH - DETAILED_TIMING_DESCRIPTION_SIZE)) {
5186caddfc7d38 Fancy Fang 2019-08-19  565  		if (!(block[0] == 0x00 && block[1] == 0x00)) {
5186caddfc7d38 Fancy Fang 2019-08-19  566  			get_detailed_timing(block, &mode[num]);
5186caddfc7d38 Fancy Fang 2019-08-19  567  			num++;
5186caddfc7d38 Fancy Fang 2019-08-19  568  		}
5186caddfc7d38 Fancy Fang 2019-08-19  569  		block += DETAILED_TIMING_DESCRIPTION_SIZE;
5186caddfc7d38 Fancy Fang 2019-08-19  570  		index += DETAILED_TIMING_DESCRIPTION_SIZE;
5186caddfc7d38 Fancy Fang 2019-08-19  571  	}
5186caddfc7d38 Fancy Fang 2019-08-19  572  
5186caddfc7d38 Fancy Fang 2019-08-19  573  	if (!num) {
5186caddfc7d38 Fancy Fang 2019-08-19  574  		kfree(mode);
5186caddfc7d38 Fancy Fang 2019-08-19  575  		return 0;
5186caddfc7d38 Fancy Fang 2019-08-19  576  	}
5186caddfc7d38 Fancy Fang 2019-08-19  577  
5186caddfc7d38 Fancy Fang 2019-08-19  578  	m = kmalloc((num + specs->modedb_len) *
5186caddfc7d38 Fancy Fang 2019-08-19  579  			sizeof(struct fb_videomode), GFP_KERNEL);
5186caddfc7d38 Fancy Fang 2019-08-19  580  	if (!m) {
5186caddfc7d38 Fancy Fang 2019-08-19  581  		kfree(mode);
5186caddfc7d38 Fancy Fang 2019-08-19  582  		return 0;

return -ENOMEM;

5186caddfc7d38 Fancy Fang 2019-08-19  583  	}
5186caddfc7d38 Fancy Fang 2019-08-19  584  
5186caddfc7d38 Fancy Fang 2019-08-19  585  	if (specs->modedb_len) {
5186caddfc7d38 Fancy Fang 2019-08-19  586  		memmove(m, specs->modedb,
5186caddfc7d38 Fancy Fang 2019-08-19  587  			specs->modedb_len * sizeof(struct fb_videomode));
5186caddfc7d38 Fancy Fang 2019-08-19  588  		kfree(specs->modedb);
5186caddfc7d38 Fancy Fang 2019-08-19  589  	}
5186caddfc7d38 Fancy Fang 2019-08-19  590  	memmove(m+specs->modedb_len, mode,
5186caddfc7d38 Fancy Fang 2019-08-19  591  		num * sizeof(struct fb_videomode));
5186caddfc7d38 Fancy Fang 2019-08-19  592  	kfree(mode);
5186caddfc7d38 Fancy Fang 2019-08-19  593  
5186caddfc7d38 Fancy Fang 2019-08-19  594  	specs->modedb_len += num;
5186caddfc7d38 Fancy Fang 2019-08-19  595  	specs->modedb = m;
5186caddfc7d38 Fancy Fang 2019-08-19  596  
5186caddfc7d38 Fancy Fang 2019-08-19  597  	return 0;
5186caddfc7d38 Fancy Fang 2019-08-19  598  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

