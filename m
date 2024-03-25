Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E5E15E5B4
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Mar 2024 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711348778; cv=none; b=vAeTThzcKzUllyXv0uRRbzBaYx43qDsqEiwoPEJNgFLzmR8zVrUifAxkAg7Y4eDSVzY7Ef58S2haoam+DXud2wFvwq1ESpEcKlAd7Bny7zubiPlcLw58xH+s95aDCQWnoe08VvbQocAqds9agxHQ7J0+RFJjCsJttgXrPzWbpIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711348778; c=relaxed/simple;
	bh=SIV82zi3r5N4BJncoDribDKYTgwGOr42okiGFQsTEkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lODt8wmGO0Zs2IfCvDVGmqqBZ2tPHPb4TrSqkCY70yfdfzWFZ+huE26d3NsbU+sGOFd7ke/r6R5ChC/Iscg/QVl+qnRHqH83k5k2+WeJUINayuvehuk+IgESJPDDumBWOyao6Mtte2S+28Fceon5OpQ0eidw1q7+6jgoqL1KGEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpzDM8DV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpzDM8DV"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56b8e4f38a2so5086481a12.3
        for <oe-kbuild@lists.linux.dev>; Sun, 24 Mar 2024 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711348773; x=1711953573; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m22bJYCIhfJpGKXzQTNfSbtfeX8K48/PW126gNHuRe0=;
        b=dpzDM8DVKQ09fZSymsk74ZTInJ2whQ+VD8TnG4uTGFsoGuw4MDQZRicSWoe2U/bYtv
         ytk3LnYQ2rftM7tysyvM74Wzn2vUv5qMovXWTuLQ/XFDh5LbjEtSY2zHPAwDRvYCaGc3
         s1T5BoBSI76SWI6eXsrxW8xu+UhF+hnxYymRTOCOGUISfusTxbivWnaW/pW9wievBomU
         1a43c79JyQiBpSz3VAmMR3F882o303bJamqBjsMJQQv1RAX4t0SgDe51jkBN7U5p+g3p
         Zlfn2CbbRXx/6VZ6/Q1QCXgSfpHQcwN5aFhXaA62HwAFBouuLPXJoZczd7t/h+IKfDIn
         x9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711348773; x=1711953573;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m22bJYCIhfJpGKXzQTNfSbtfeX8K48/PW126gNHuRe0=;
        b=oEma/xQsdWYKg7/jUQZS0s6qEt4L7hqynNbIt1bMWaAJ4iN9ISIfdlZnUuhbfMoXIK
         eYs6Az0KGOSKlQgbI6+Bwd2/pCeG6qO9+fiwPY6GBQbtXDCOhuEyG2CTJiIzcAI4X7YM
         WP5Av/XYtIDzLYnbXaz9tfLvsiAhCyyyxTUdChbS404Wr0ux/i3BVysCaxLvdtGZjn6R
         s6RZuMrDYE35yz6tl4tskkhD61WDwCclhlUC2GIajiTI7gidDsCJAQ4Ugofpjkz/dxE9
         NxDP1I68BMTc1MCoxetgwZEQ5aHGiQCZrTWrAMvtQeHUFA1KcuxfN7xxD6aDFoSfOLag
         tmug==
X-Gm-Message-State: AOJu0YwP81BbnOUEyD281yrXs0UVnA2k1Yr9LMr+uK3QAvdRx7a78Q48
	8Clme5Nd0M+EbcQbrOQKz/G9J/Qpq+jRqgQB7JgFAIfMNtOMXQzBWgQA1J7x8A0Y1YIlA3kTSGz
	L
X-Google-Smtp-Source: AGHT+IE1VQ7GzJbHXLw2VcEb97uklV8RVWzKvaYoS2n3HMPYdajIqcf7bU37lOn6993gzpguEo3xcw==
X-Received: by 2002:aa7:c249:0:b0:56c:19d2:85b2 with SMTP id y9-20020aa7c249000000b0056c19d285b2mr199406edo.35.1711348773084;
        Sun, 24 Mar 2024 23:39:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b23-20020a056402139700b0056c0d96e099sm845782edv.89.2024.03.24.23.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 23:39:32 -0700 (PDT)
Date: Mon, 25 Mar 2024 09:39:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:vivid-cec 59/62]
 drivers/media/test-drivers/vivid/vivid-vid-cap.c:1570
 vivid_update_connected_outputs() warn: variable dereferenced before check
 'dev_tx' (see line 1569)
Message-ID: <acdb463e-9a36-4822-a9f8-af1098ca7491@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vivid-cec
head:   bfe9974b584040f6df7aebada2a3b6a61d0dbb67
commit: 514333e776cd80413971a91ce668634fe7e030c3 [59/62] vivid: drop display_present control, route EDIDs correctly
config: arc-randconfig-r071-20240325 (https://download.01.org/0day-ci/archive/20240325/202403251134.rCvdEVfY-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403251134.rCvdEVfY-lkp@intel.com/

smatch warnings:
drivers/media/test-drivers/vivid/vivid-vid-cap.c:1570 vivid_update_connected_outputs() warn: variable dereferenced before check 'dev_tx' (see line 1569)

vim +/dev_tx +1570 drivers/media/test-drivers/vivid/vivid-vid-cap.c

514333e776cd80 Hans Verkuil 2024-03-22  1554  void vivid_update_connected_outputs(struct vivid_dev *dev)
514333e776cd80 Hans Verkuil 2024-03-22  1555  {
514333e776cd80 Hans Verkuil 2024-03-22  1556  	u16 phys_addr = cec_get_edid_phys_addr(dev->edid, dev->edid_blocks * 128, NULL);
514333e776cd80 Hans Verkuil 2024-03-22  1557  
514333e776cd80 Hans Verkuil 2024-03-22  1558  	for (unsigned int i = 0, j = 0; i < dev->num_inputs; i++) {
514333e776cd80 Hans Verkuil 2024-03-22  1559  		unsigned int menu_idx =
514333e776cd80 Hans Verkuil 2024-03-22  1560  			dev->input_is_connected_to_output[i];
514333e776cd80 Hans Verkuil 2024-03-22  1561  
514333e776cd80 Hans Verkuil 2024-03-22  1562  		if (dev->input_type[i] != HDMI)
514333e776cd80 Hans Verkuil 2024-03-22  1563  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1564  		j++;
514333e776cd80 Hans Verkuil 2024-03-22  1565  		if (menu_idx < FIXED_MENU_ITEMS)
514333e776cd80 Hans Verkuil 2024-03-22  1566  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1567  		struct vivid_dev *dev_tx = vivid_ctrl_hdmi_to_output_instance[menu_idx];
514333e776cd80 Hans Verkuil 2024-03-22  1568  		unsigned int output = vivid_ctrl_hdmi_to_output_index[menu_idx];
514333e776cd80 Hans Verkuil 2024-03-22 @1569  		unsigned int hdmi_output = dev_tx->output_to_iface_index[output];
                                                                                   ^^^^^^^^
Dereference

514333e776cd80 Hans Verkuil 2024-03-22 @1570  		if (!dev_tx)
                                                            ^^^^^^^
Too late.

514333e776cd80 Hans Verkuil 2024-03-22  1571  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1572  		vivid_update_outputs(dev_tx);
514333e776cd80 Hans Verkuil 2024-03-22  1573  		if (dev->edid_blocks) {
514333e776cd80 Hans Verkuil 2024-03-22  1574  			cec_s_phys_addr(dev_tx->cec_tx_adap[hdmi_output],
514333e776cd80 Hans Verkuil 2024-03-22  1575  					v4l2_phys_addr_for_input(phys_addr, j),
514333e776cd80 Hans Verkuil 2024-03-22  1576  					false);
514333e776cd80 Hans Verkuil 2024-03-22  1577  		} else {
514333e776cd80 Hans Verkuil 2024-03-22  1578  			cec_phys_addr_invalidate(dev_tx->cec_tx_adap[hdmi_output]);
514333e776cd80 Hans Verkuil 2024-03-22  1579  		}
514333e776cd80 Hans Verkuil 2024-03-22  1580  	}
514333e776cd80 Hans Verkuil 2024-03-22  1581  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

