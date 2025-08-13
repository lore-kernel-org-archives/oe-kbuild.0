Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC232BEC2E
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063500; cv=none; b=jI7W0CHxwsgoV+mITGcopwcF0sxI4gnf1fsB6cR7QMuMrOgvq40BEQ/k/MqxxyLoB5mhl1MrxNZYZNtZdEfjIejRVAKVv38kXArOPS0LYa5ljqGtCu1+pPKk4+gHwcdVGMYVWQktYaf5GDtGuVyvdIg9Iuv9raQ9atXdoJ8pEDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063500; c=relaxed/simple;
	bh=c5Ei5s0bbyGnWWYKgHHqCrmJYLgM0IPx3Azf26D17aY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PsOl+RE2sZn8dMOyCHkyk58LyRF8m5zOUCBymF/E6qKUn8+QXifkA3hJXe5v9hkjhauillxWShR+HGOz9/EwVLVeoJPBzpFj9itj/e/u0iMtAByRdNZ9MfRqMeRolPyFhxMqzB91kGQuWv1NrjoeNsszwDCdFTaBLiyT5wRXjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvxkpnHI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvxkpnHI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-459ddb41539so19415635e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 22:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755063496; x=1755668296; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kF2LKwxp97OVBAZMUUlNOfxaXKM458RyHFBvfI0CATw=;
        b=zvxkpnHIuGeDaC8wW5jeGQSot1cKsiHIRZJIViKNZ3rssXtLsf3zUt5/hhYrwFqfyN
         rdgmJaQMjagsktlHXoCAnfDrzLMwHwQMY2dXzvKfxHqdk0e/DaYA/bWcjXdWitfVXw/i
         TzJ5mczS+MBiZ8dBIKriyy8NhEQrpjuh9E9dA/i1l2sdz+lrRWQmUp0wL3XsUcYXT64d
         2A54CQUrUuP0bLbqlhaiNTES0Y6bEsjK4M7nSccMpfcnhr+ppww0mOFctOfKSmjEytVk
         tsX593VFcwAxr+NSJzRzTCWyN9BvVXYo/CqnQvSdXdljO7gcxC6AEabcLLgImN0ZlUoN
         yLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755063496; x=1755668296;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kF2LKwxp97OVBAZMUUlNOfxaXKM458RyHFBvfI0CATw=;
        b=iDBATZYg26rsZMBqvVlS+tyN3ZwfAAkKcnFrxJ2c6ZKkFh78/+7kKRwkgq0w7ZQoFC
         dBe5lUe3NoizdNm6Mz2nb89ZDA2xijL/oFPo/3GiDqm59P2Vkq3JU3i2bi91SfFEQUTY
         JMATxAHW9YtWE7t3Nr4dfWqJIOKofVgco5oR8X65mYdltvD/kTt0F1h2nYB2DS7ivhxr
         oZvIPLbWz9eBk9QnT/XaAhUB2ngvQjfoKcMpvCMa2KCzKi8YmYT2MbCM7382gM5XFaD4
         CEUz84k3Y9egBSSOMMK69TIiNKW+mvTzUWVpiRyTNxIkZbo+6iiZdHSBhDLhtUNsWHVu
         D9Lg==
X-Gm-Message-State: AOJu0Ywz6JuCORZEezVPR2+mdRpMTdf6IGEtkzcjym4tJncG0bY9OoPk
	PvSCy3+56KOjAyZ6ozRzgj3wFwNbs5CqLdyadsOEVTLSxe/yRdYZ4t5rVHDbzshYR4DQ7x6tvMf
	i2lEq
X-Gm-Gg: ASbGnct8KWFfrq5FWwjYL7Otn6fAJpfd/kFl7vKVgyLUDVzE4GFcl0RzFZmERcdLhpH
	3ZeBgHKanB3JvPmGxQoaDj5AnrIyHMv7e4eLaC4ZXcEZeVPhUB7n0jsXjbQcR3QYgiDvAgy/rEt
	UUzkUDMbTgibDEQLxSNn4KUITRixPrVg7XBzbC9FiYy1vQpxKZ9MdY7X8tO/iwedsZTp/jBaKRx
	sjurBVQ7jBeeDWGoAajwy1x4hI4qcBcUJcmtzfST3m+H6LHu34yTKHmiwz3MLcoWQjGFuBcD0Hp
	n4P5l2Xen4Jgpo22/OWquX1zMaQOXeIskQ6JtMOSvndpP+6y7F0/Rq7AodqcHCPheS2rbGGxkOl
	bu1K77VXIO1jTXRZ84T1jhATGCjNyaw5dbJe89n+g/nw=
X-Google-Smtp-Source: AGHT+IGuTo0nTJ9LBGNpaB6IU5jAOCfl2vTZ90KYEs8NHOIO4CnW1bAUkIEy5pCEMXW6pogviXiuqQ==
X-Received: by 2002:a05:600c:c490:b0:459:e440:61c7 with SMTP id 5b1f17b1804b1-45a1660c711mr13210325e9.31.1755063496537;
        Tue, 12 Aug 2025 22:38:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a16df1cf8sm13762145e9.24.2025.08.12.22.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:38:16 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:09:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Logan Gunthorpe <logang@deltatee.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kelvin Cao <kelvin.cao@microchip.com>,
	George Ge <george.ge@microchip.com>, Christoph Hellwig <hch@lst.de>
Subject: [sbates130272-p2pmem:switchtec-dma-v9 2/3]
 drivers/dma/switchtec_dma.c:429 switchtec_dma_cleanup_completed() error:
 uninitialized symbol 'i'.
Message-ID: <202508130828.LQq27XRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250813050926.831MQBPTWUlFXshzA9IF7_kkhiSv_A5UeNFMTvPvlzk@z>

tree:   https://github.com/sbates130272/linux-p2pmem.git switchtec-dma-v9
head:   9c53658085c7c2f6dd1707ba385702659ec58ddf
commit: 969ba8a3fe0ed09d888d754bd416c6e96f3366ba [2/3] dmaengine: switchtec-dma: Implement hardware initialization and cleanup
config: i386-randconfig-141-20250813 (https://download.01.org/0day-ci/archive/20250813/202508130828.LQq27XRK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508130828.LQq27XRK-lkp@intel.com/

smatch warnings:
drivers/dma/switchtec_dma.c:429 switchtec_dma_cleanup_completed() error: uninitialized symbol 'i'.

vim +/i +429 drivers/dma/switchtec_dma.c

969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  397  static void
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  398  switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  399  {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  400  	struct device *chan_dev = &swdma_chan->dma_chan.dev->device;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  401  	struct switchtec_dma_desc *desc;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  402  	struct switchtec_dma_hw_ce *ce;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  403  	struct dmaengine_result res;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  404  	int tail, cid, se_idx, i;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  405  	__le16 phase_tag;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  406  	u32 sts_code;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  407  	__le32 *p;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  408  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  409  	do {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  410  		spin_lock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  411  		if (!swdma_chan->comp_ring_active) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  412  			spin_unlock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  413  			break;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  414  		}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  415  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  416  		ce = &swdma_chan->hw_cq[swdma_chan->cq_tail];
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  417  		/*
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  418  		 * phase_tag is updated by hardware, ensure the value is
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  419  		 * not from the cache
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  420  		 */
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  421  		phase_tag = smp_load_acquire(&ce->phase_tag);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  422  		if (le16_to_cpu(phase_tag) == swdma_chan->phase_tag) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  423  			spin_unlock_bh(&swdma_chan->complete_lock);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  424  			break;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  425  		}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  426  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  427  		cid = le16_to_cpu(ce->cid);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  428  		se_idx = cid & (SWITCHTEC_DMA_SQ_SIZE - 1);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05 @429  		desc = swdma_chan->desc_ring[i];
                                                                                             ^
uninitialized.  s/i/se_idx/?

969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  430  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  431  		tail = swdma_chan->tail;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  432  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  433  		res.residue = desc->orig_size - le32_to_cpu(ce->cpl_byte_cnt);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  434  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  435  		sts_code = le32_to_cpu(ce->sts_code);
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  436  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  437  		if (!(sts_code & SWITCHTEC_CE_SC_MASK)) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  438  			res.result = DMA_TRANS_NOERROR;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  439  		} else {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  440  			if (sts_code & SWITCHTEC_CE_SC_D_RD_CTO)
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  441  				res.result = DMA_TRANS_READ_FAILED;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  442  			else
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  443  				res.result = DMA_TRANS_WRITE_FAILED;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  444  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  445  			dev_err(chan_dev, "CID 0x%04x failed, SC 0x%08x\n", cid,
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  446  				(u32)(sts_code & SWITCHTEC_CE_SC_MASK));
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  447  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  448  			p = (__le32 *)ce;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  449  			for (i = 0; i < sizeof(*ce) / 4; i++) {
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  450  				dev_err(chan_dev, "CE DW%d: 0x%08x\n", i,
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  451  					le32_to_cpu(*p));
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  452  				p++;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  453  			}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  454  		}
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  455  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  456  		desc->completed = true;
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  457  
969ba8a3fe0ed0 Logan Gunthorpe 2025-08-05  458  		swdma_chan->cq_tail++;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

