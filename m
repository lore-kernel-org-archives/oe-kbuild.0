Received: from helios.alatek.com.pl (helios.alatek.com.pl [85.14.123.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755A19BC3;
	Wed,  3 Jan 2024 13:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alatek.krakow.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alatek.krakow.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=alatek.krakow.pl header.i=@alatek.krakow.pl header.b="SMqnTVmd"
Received: from localhost (localhost [127.0.0.1])
	by helios.alatek.com.pl (Postfix) with ESMTP id 0547E2CA18F2;
	Wed,  3 Jan 2024 14:50:10 +0100 (CET)
Received: from helios.alatek.com.pl ([127.0.0.1])
 by localhost (helios.alatek.com.pl [127.0.0.1]) (amavis, port 10032)
 with ESMTP id roAUe43Vbw-p; Wed,  3 Jan 2024 14:50:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by helios.alatek.com.pl (Postfix) with ESMTP id 3947D2CA18FC;
	Wed,  3 Jan 2024 14:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 helios.alatek.com.pl 3947D2CA18FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alatek.krakow.pl;
	s=99EE5E86-D06A-11EC-BE24-DBCCD0A148D3; t=1704289805;
	bh=jZyC/xRh1udeLwfEgIKwoXnc6gksKtoO6QmGrQfRqE8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=SMqnTVmdZQpMKibWU2Bvgb+2bfWFbj9tG3R+JBDzRw8a55ZaLjMZp8rkv0FRGj1yg
	 Kb76SBh+Vou2XN+Xi2ot61NwOasuw4eYzL4eA8/J/B/3tK+M7oGOP7f0P5xkvNIu69
	 cypDvUy/6HwiNz/0NKX5Kyv6haGVLlDYg5EXdafRtgd6x+4FBITlr+MuruGEFAzHo3
	 GMO2d5c+4Q3RxXYfwKeW/+bxyHoIOxZBqWnCLfHvdrCpSJgMs/ih2whkcluKE4YqDo
	 X3c7OhCGGSQb5lQMY8QNa7pJBI49lChSIWkk0t7qBAHe4i32GC+Q/Or6CdupVAbVKE
	 Lwg0pXLMlxp5g==
X-Virus-Scanned: amavis at alatek.com.pl
Received: from helios.alatek.com.pl ([127.0.0.1])
 by localhost (helios.alatek.com.pl [127.0.0.1]) (amavis, port 10026)
 with ESMTP id pj_ahR7P3cbF; Wed,  3 Jan 2024 14:50:05 +0100 (CET)
Received: from [10.125.125.3] (unknown [10.125.125.3])
	by helios.alatek.com.pl (Postfix) with ESMTPSA id 9E52E2CA18F2;
	Wed,  3 Jan 2024 14:50:04 +0100 (CET)
Message-ID: <a0329e3f-b9d9-4132-b738-26c48d898e5a@alatek.krakow.pl>
Date: Wed, 3 Jan 2024 14:50:03 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9985/10295] drivers/dma/xilinx/xdma.c:894
 xdma_channel_isr() error: potentially dereferencing uninitialized 'desc'.
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Nathan Chancellor <nathan@kernel.org>
References: <d824b3df-b542-4e82-b52b-974aa89e94d4@moroto.mountain>
From: Jan Kuliga <jankul@alatek.krakow.pl>
In-Reply-To: <d824b3df-b542-4e82-b52b-974aa89e94d4@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3.01.2024 14:21, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   39676dfe52331dba909c617f213fdb21015c8d10
> commit: 01e6d907656134949c4126e7fd64984d4daa4c1e [9985/10295] dmaengine: xilinx: xdma: Implement interleaved DMA transfers
> config: x86_64-randconfig-161-20231222 (https://download.01.org/0day-ci/archive/20231223/202312230438.ciSi2tY3-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312230438.ciSi2tY3-lkp@intel.com/
> 
> smatch warnings:
> drivers/dma/xilinx/xdma.c:894 xdma_channel_isr() error: potentially dereferencing uninitialized 'desc'.
> 
> vim +/desc +894 drivers/dma/xilinx/xdma.c
> 
> 17ce252266c7f0 Lizhi Hou     2023-01-19  868  static irqreturn_t xdma_channel_isr(int irq, void *dev_id)
> 17ce252266c7f0 Lizhi Hou     2023-01-19  869  {
> 17ce252266c7f0 Lizhi Hou     2023-01-19  870  	struct xdma_chan *xchan = dev_id;
> 17ce252266c7f0 Lizhi Hou     2023-01-19  871  	u32 complete_desc_num = 0;
> 01e6d907656134 Jan Kuliga    2023-12-18  872  	struct xdma_device *xdev = xchan->xdev_hdl;
> 01e6d907656134 Jan Kuliga    2023-12-18  873  	struct virt_dma_desc *vd, *next_vd;
> 17ce252266c7f0 Lizhi Hou     2023-01-19  874  	struct xdma_desc *desc;
> 17ce252266c7f0 Lizhi Hou     2023-01-19  875  	int ret;
> cd8c732ce1a561 Miquel Raynal 2023-10-05  876  	u32 st;
> 01e6d907656134 Jan Kuliga    2023-12-18  877  	bool repeat_tx;
> 17ce252266c7f0 Lizhi Hou     2023-01-19  878  
> 17ce252266c7f0 Lizhi Hou     2023-01-19  879  	spin_lock(&xchan->vchan.lock);
> 17ce252266c7f0 Lizhi Hou     2023-01-19  880  
> 17ce252266c7f0 Lizhi Hou     2023-01-19  881  	/* get submitted request */
> 17ce252266c7f0 Lizhi Hou     2023-01-19  882  	vd = vchan_next_desc(&xchan->vchan);
> 17ce252266c7f0 Lizhi Hou     2023-01-19  883  	if (!vd)
> 17ce252266c7f0 Lizhi Hou     2023-01-19  884  		goto out;
> 17ce252266c7f0 Lizhi Hou     2023-01-19  885  
> c38d055a7c0211 Jan Kuliga    2023-12-18  886  	/* Clear-on-read the status register */
> c38d055a7c0211 Jan Kuliga    2023-12-18  887  	ret = regmap_read(xdev->rmap, xchan->base + XDMA_CHAN_STATUS_RC, &st);
> 17ce252266c7f0 Lizhi Hou     2023-01-19  888  	if (ret)
> 17ce252266c7f0 Lizhi Hou     2023-01-19  889  		goto out;
> 17ce252266c7f0 Lizhi Hou     2023-01-19  890  
> c38d055a7c0211 Jan Kuliga    2023-12-18  891  	st &= XDMA_CHAN_STATUS_MASK;
> c38d055a7c0211 Jan Kuliga    2023-12-18  892  	if ((st & XDMA_CHAN_ERROR_MASK) ||
> c38d055a7c0211 Jan Kuliga    2023-12-18  893  	    !(st & (CHAN_CTRL_IE_DESC_COMPLETED | CHAN_CTRL_IE_DESC_STOPPED))) {
> c3fcb6f5575fcf Jan Kuliga    2023-12-18 @894  		desc->error = true;
>                                                         ^^^^^^
> "desc" isn't initialized at this point.
> 
This issue has already been noticed and fixed by Nathan Chancellor in a thread below: 
https://lore.kernel.org/dmaengine/d3ada600-c0ed-486d-98d0-e161059099f3@alatek.krakow.pl/T/#m51990dd92dd78eaf34333ba96f9ada2ed61ae2f9
> 
> c38d055a7c0211 Jan Kuliga    2023-12-18  895  		xdma_err(xdev, "channel error, status register value: 0x%x", st);
> c38d055a7c0211 Jan Kuliga    2023-12-18  896  		goto out;
> c38d055a7c0211 Jan Kuliga    2023-12-18  897  	}
> 26ee018ff6d1c3 Miquel Raynal 2023-11-30  898  
> c38d055a7c0211 Jan Kuliga    2023-12-18  899  	ret = regmap_read(xdev->rmap, xchan->base + XDMA_CHAN_COMPLETED_DESC,
> c38d055a7c0211 Jan Kuliga    2023-12-18  900  			  &complete_desc_num);
> cd8c732ce1a561 Miquel Raynal 2023-10-05  901  	if (ret)
> cd8c732ce1a561 Miquel Raynal 2023-10-05  902  		goto out;
> cd8c732ce1a561 Miquel Raynal 2023-10-05  903  
> 01e6d907656134 Jan Kuliga    2023-12-18  904  	desc = to_xdma_desc(vd);
> 01e6d907656134 Jan Kuliga    2023-12-18  905  	if (desc->interleaved_dma) {
> 
> 

Thanks,
Jan
