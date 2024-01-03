Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA9A199A7
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZceENKY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso7407544a12.3
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 05:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704288121; x=1704892921; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGTM85Szdb7BLfIilV9eP3JuDKNbBQmAfzLjLTpXXE0=;
        b=EZceENKY6OTukPnyW0CGovml+zJt8Nt6wFDECLboHJHhRfZarq4Hpc+s9XCn10jlwg
         MABpcshV3NLGkHwLQhNJAaVGt/DR3QYzTW4YXACJ8gtROeUf8mF2XfyErHD73d6kflRC
         fBlB9LhTaQDe+IIk8XtVFezLqzYRotpUgc/bdh4XcV3pzk9S/C/vBmuJIivbXX/Y2BSD
         Et6l5yIdEg5xlALpatdxMO/FN0QwUB+MHwVUz00HZhQp5k1nsErWJabeZW5OAX5RJdaW
         nEGwykhS7BsHehOu4cVNfZwqu9BFRNNzMxh9QXlWwDLNXo4ZzYTjHd7v/YlUQLm3my1P
         F58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288121; x=1704892921;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGTM85Szdb7BLfIilV9eP3JuDKNbBQmAfzLjLTpXXE0=;
        b=PsA+6tm/UrfUjC3UMHc+W++JlxY5Sw4E8tvONvaEG1PznFln22HMxWq+63e+41wwMJ
         MBZ0rqP4kenegEVNxi52IUg/GO8tUHN6Z1CJ323pkAIwkZgwOs6guXRf6cXKyanlG7Gj
         sP1KMTP4kPmO4CFDjDUpNmnbll6FBfmcWn8YQME3/GEYJlG9pw6+WD5xR8ktxfrJviaJ
         kQa0iF9YlIDIvVIFpNp/md8xEz5K7o74cwjQQxP5tlSsNXGM6T4tt3MsKJSiO2Uer38j
         w2EFtNlBCRm4ILx0xEssMvB3yOuNrBtPJz86rXkYP2dSQ4OJwHLm5IOs4umVv98xFhUw
         3sJQ==
X-Gm-Message-State: AOJu0Yz8v5ie7MNNyHzlD002GsvtRUUb4B89HP8H6zNcmqX4HAficTcr
	veN98N1/nMnZKwvVD8gZ3LlQFq0VkkHFJLBQF0ebP4yI+9Y=
X-Google-Smtp-Source: AGHT+IFKj8yhTvbS6SreJeeE6fzzT1ocUFszygO7TCd4YoerrFhCmMRpr07xSG/kFxMyg5hy2Qt5cw==
X-Received: by 2002:a17:907:9303:b0:a28:27df:b38 with SMTP id bu3-20020a170907930300b00a2827df0b38mr1053066ejc.201.1704288121071;
        Wed, 03 Jan 2024 05:22:01 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id wk8-20020a170907054800b00a28aba1f56fsm272705ejb.210.2024.01.03.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:22:00 -0800 (PST)
Date: Wed, 3 Jan 2024 16:21:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jan Kuliga <jankul@alatek.krakow.pl>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9985/10295] drivers/dma/xilinx/xdma.c:894
 xdma_channel_isr() error: potentially dereferencing uninitialized 'desc'.
Message-ID: <d824b3df-b542-4e82-b52b-974aa89e94d4@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 01e6d907656134949c4126e7fd64984d4daa4c1e [9985/10295] dmaengine: xilinx: xdma: Implement interleaved DMA transfers
config: x86_64-randconfig-161-20231222 (https://download.01.org/0day-ci/archive/20231223/202312230438.ciSi2tY3-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312230438.ciSi2tY3-lkp@intel.com/

smatch warnings:
drivers/dma/xilinx/xdma.c:894 xdma_channel_isr() error: potentially dereferencing uninitialized 'desc'.

vim +/desc +894 drivers/dma/xilinx/xdma.c

17ce252266c7f0 Lizhi Hou     2023-01-19  868  static irqreturn_t xdma_channel_isr(int irq, void *dev_id)
17ce252266c7f0 Lizhi Hou     2023-01-19  869  {
17ce252266c7f0 Lizhi Hou     2023-01-19  870  	struct xdma_chan *xchan = dev_id;
17ce252266c7f0 Lizhi Hou     2023-01-19  871  	u32 complete_desc_num = 0;
01e6d907656134 Jan Kuliga    2023-12-18  872  	struct xdma_device *xdev = xchan->xdev_hdl;
01e6d907656134 Jan Kuliga    2023-12-18  873  	struct virt_dma_desc *vd, *next_vd;
17ce252266c7f0 Lizhi Hou     2023-01-19  874  	struct xdma_desc *desc;
17ce252266c7f0 Lizhi Hou     2023-01-19  875  	int ret;
cd8c732ce1a561 Miquel Raynal 2023-10-05  876  	u32 st;
01e6d907656134 Jan Kuliga    2023-12-18  877  	bool repeat_tx;
17ce252266c7f0 Lizhi Hou     2023-01-19  878  
17ce252266c7f0 Lizhi Hou     2023-01-19  879  	spin_lock(&xchan->vchan.lock);
17ce252266c7f0 Lizhi Hou     2023-01-19  880  
17ce252266c7f0 Lizhi Hou     2023-01-19  881  	/* get submitted request */
17ce252266c7f0 Lizhi Hou     2023-01-19  882  	vd = vchan_next_desc(&xchan->vchan);
17ce252266c7f0 Lizhi Hou     2023-01-19  883  	if (!vd)
17ce252266c7f0 Lizhi Hou     2023-01-19  884  		goto out;
17ce252266c7f0 Lizhi Hou     2023-01-19  885  
c38d055a7c0211 Jan Kuliga    2023-12-18  886  	/* Clear-on-read the status register */
c38d055a7c0211 Jan Kuliga    2023-12-18  887  	ret = regmap_read(xdev->rmap, xchan->base + XDMA_CHAN_STATUS_RC, &st);
17ce252266c7f0 Lizhi Hou     2023-01-19  888  	if (ret)
17ce252266c7f0 Lizhi Hou     2023-01-19  889  		goto out;
17ce252266c7f0 Lizhi Hou     2023-01-19  890  
c38d055a7c0211 Jan Kuliga    2023-12-18  891  	st &= XDMA_CHAN_STATUS_MASK;
c38d055a7c0211 Jan Kuliga    2023-12-18  892  	if ((st & XDMA_CHAN_ERROR_MASK) ||
c38d055a7c0211 Jan Kuliga    2023-12-18  893  	    !(st & (CHAN_CTRL_IE_DESC_COMPLETED | CHAN_CTRL_IE_DESC_STOPPED))) {
c3fcb6f5575fcf Jan Kuliga    2023-12-18 @894  		desc->error = true;
                                                        ^^^^^^
"desc" isn't initialized at this point.


c38d055a7c0211 Jan Kuliga    2023-12-18  895  		xdma_err(xdev, "channel error, status register value: 0x%x", st);
c38d055a7c0211 Jan Kuliga    2023-12-18  896  		goto out;
c38d055a7c0211 Jan Kuliga    2023-12-18  897  	}
26ee018ff6d1c3 Miquel Raynal 2023-11-30  898  
c38d055a7c0211 Jan Kuliga    2023-12-18  899  	ret = regmap_read(xdev->rmap, xchan->base + XDMA_CHAN_COMPLETED_DESC,
c38d055a7c0211 Jan Kuliga    2023-12-18  900  			  &complete_desc_num);
cd8c732ce1a561 Miquel Raynal 2023-10-05  901  	if (ret)
cd8c732ce1a561 Miquel Raynal 2023-10-05  902  		goto out;
cd8c732ce1a561 Miquel Raynal 2023-10-05  903  
01e6d907656134 Jan Kuliga    2023-12-18  904  	desc = to_xdma_desc(vd);
01e6d907656134 Jan Kuliga    2023-12-18  905  	if (desc->interleaved_dma) {


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

