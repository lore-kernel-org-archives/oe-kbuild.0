Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B41459F6
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726476013; cv=none; b=AbcxcN+B2eGINKZPOT2NRMEVkAjze5kNXb8wr22jJTTVDooxKKqaUkaRun/NWZ8mIfwDhhhKSEzdt8d59QNTNfxk2uHXTsqL2ccYacS3OYBpCgyvLeAZrR9NzxocnbpjYg3EDByfP6qrrWDEDLR+3PfO2zo0ffaKM9HNHG4hwps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726476013; c=relaxed/simple;
	bh=3tezeYk8/oQD4basQb0gA+dGgId/HoFid+ijykAqs54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aDNI8X4+NgWAJ/xp2Xq8BXkSjfva1larK67BieOd+2AVPvTNTcS36vU7Yqj0c8HV3CPWDX6pJHJWWmXPeKqTYAIJkK4U7oQluXoMJwDc7phonznHPQkWgdAEwV0X+wze/SxyM2jcVkI552Fk2rjuOnYd0UkHyqhAMxhAYgMZgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e3kVF+nq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e3kVF+nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726476010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=veTIA8crxMcOp+vthNk0ANAtv78UFR8BCP1ThmDnOAE=;
	b=e3kVF+nqJd8HTM5/5sGwW3cQzn94SGRnt0GmhCYz12GPjyFfPs+XOGQrSmp9SlsmzX3LqM
	i5xG8EI2gXpVzfB5xEUhlAWhfnNa0rE4gOpd13TV6qTgpLVg7YDhqRr1nfWj9OGsjmIs1j
	WurF9yfDhOk93SVWtCUWCrVYoDnbUzA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-M6tIHOMhNbSC-1xBuu4d8A-1; Mon, 16 Sep 2024 04:40:08 -0400
X-MC-Unique: M6tIHOMhNbSC-1xBuu4d8A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374c44e58a9so1748700f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 01:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726476008; x=1727080808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veTIA8crxMcOp+vthNk0ANAtv78UFR8BCP1ThmDnOAE=;
        b=hvHSW3V0DNfAMIenOvIJ3a7tLlBNghyNeXE2ECZzHDWIt7TVan8kDI2ljpZLUUZQwa
         CJBva53e1M+ogq5zw02Ca/++V9hqUCelAHR3DJYV+J/eLYGkvoY9iitPkGo10b4RXx5n
         8fwe1dCc7scpEWeoS9fMdkjVg/mxJqzRUbw4Bt6G/1ANV5kgRUPiPxFaIsfJeiLTujqn
         2OJfMfsIuYFSXNIuRyMxLgFq+EF3hGMtiXGV6FkxyOXPcEg2hUuxyGy86jzK6+Z3MEvf
         e4wcMGg0dL4vmxhfsqpkBthx4Yujx1uZz1PXmBL4+PSHc5QDIPfousgS1nsBAQw6d8rr
         pjUg==
X-Gm-Message-State: AOJu0YwkivbEsSy5VSPMr9ZXA+28otE/LTSqnXj+l+dT5GQsh29+ath0
	cpWPC62fd4ur57OiZbn7E/Ficf3hLOGQiDROfiflZHTol3n9VzLkacoAo5BMBLq6dHZw1AsM8ke
	HxyXK/8+f8n4rr7ElBrLg2MJhc7lFsAZEeDo6Kbt2dHRssEBoVv5mBEr17w==
X-Received: by 2002:adf:a458:0:b0:374:bfe5:bbf2 with SMTP id ffacd0b85a97d-378c2cfec81mr8291020f8f.23.1726476007641;
        Mon, 16 Sep 2024 01:40:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjkHKX55+OZKHOULxziyOYPMnm544RHvaoALWM7Ap8oLjTHl78WxK78L7OHW+ju2++VNt0UA==
X-Received: by 2002:adf:a458:0:b0:374:bfe5:bbf2 with SMTP id ffacd0b85a97d-378c2cfec81mr8290979f8f.23.1726476006731;
        Mon, 16 Sep 2024 01:40:06 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ec:9b4:46f5:ba16:343e:7485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7804483sm6523541f8f.92.2024.09.16.01.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:40:05 -0700 (PDT)
Date: Mon, 16 Sep 2024 04:40:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Srujana Challa <schalla@marvell.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Shijith Thotton <sthotton@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>
Subject: Re: drivers/vdpa/octeon_ep/octep_vdpa_hw.c:143 octep_process_mbox()
 warn: missing error code? 'ret'
Message-ID: <20240916043819-mutt-send-email-mst@kernel.org>
References: <7e8141cb-44e6-477c-b77e-aa9b4bc5af3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7e8141cb-44e6-477c-b77e-aa9b4bc5af3a@stanley.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2024 at 10:35:28AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   98f7e32f20d28ec452afb208f9cffc08448a2652
> commit: 8b6c724cdab85d8923dd8c474a5a9464228379c5 virtio: vdpa: vDPA driver for Marvell OCTEON DPU devices
> date:   10 weeks ago
> config: i386-randconfig-141-20240912 (https://download.01.org/0day-ci/archive/20240916/202409160431.bRhZWhiU-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409160431.bRhZWhiU-lkp@intel.com/
> 
> New smatch warnings:
> drivers/vdpa/octeon_ep/octep_vdpa_hw.c:143 octep_process_mbox() warn: missing error code? 'ret'
> drivers/vdpa/octeon_ep/octep_vdpa_hw.c:478 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
> 
> Old smatch warnings:
> drivers/vdpa/octeon_ep/octep_vdpa_hw.c:479 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
> drivers/vdpa/octeon_ep/octep_vdpa_hw.c:480 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
> drivers/vdpa/octeon_ep/octep_vdpa_hw.c:481 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
> drivers/vdpa/octeon_ep/octep_vdpa_hw.c:514 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
> 
> vim +/ret +143 drivers/vdpa/octeon_ep/octep_vdpa_hw.c
> 
> 8b6c724cdab85d Srujana Challa 2024-06-14  102  static int octep_process_mbox(struct octep_hw *oct_hw, u16 id, u16 qid, void *buffer,
> 8b6c724cdab85d Srujana Challa 2024-06-14  103  			      u32 buf_size, bool write)
> 8b6c724cdab85d Srujana Challa 2024-06-14  104  {
> 8b6c724cdab85d Srujana Challa 2024-06-14  105  	struct octep_mbox __iomem *mbox = octep_get_mbox(oct_hw);
> 8b6c724cdab85d Srujana Challa 2024-06-14  106  	struct pci_dev *pdev = oct_hw->pdev;
> 8b6c724cdab85d Srujana Challa 2024-06-14  107  	u32 *p = (u32 *)buffer;
> 8b6c724cdab85d Srujana Challa 2024-06-14  108  	u16 data_wds;
> 8b6c724cdab85d Srujana Challa 2024-06-14  109  	int ret, i;
> 8b6c724cdab85d Srujana Challa 2024-06-14  110  	u32 val;
> 8b6c724cdab85d Srujana Challa 2024-06-14  111  
> 8b6c724cdab85d Srujana Challa 2024-06-14  112  	if (!IS_ALIGNED(buf_size, 4))
> 8b6c724cdab85d Srujana Challa 2024-06-14  113  		return -EINVAL;
> 8b6c724cdab85d Srujana Challa 2024-06-14  114  
> 8b6c724cdab85d Srujana Challa 2024-06-14  115  	/* Make sure mbox space is available */
> 8b6c724cdab85d Srujana Challa 2024-06-14  116  	ret = octep_wait_for_mbox_avail(mbox);
> 8b6c724cdab85d Srujana Challa 2024-06-14  117  	if (ret) {
> 8b6c724cdab85d Srujana Challa 2024-06-14  118  		dev_warn(&pdev->dev, "Timeout waiting for previous mbox data to be consumed\n");
> 8b6c724cdab85d Srujana Challa 2024-06-14  119  		return ret;
> 8b6c724cdab85d Srujana Challa 2024-06-14  120  	}
> 8b6c724cdab85d Srujana Challa 2024-06-14  121  	data_wds = buf_size / 4;
> 8b6c724cdab85d Srujana Challa 2024-06-14  122  
> 8b6c724cdab85d Srujana Challa 2024-06-14  123  	if (write) {
> 8b6c724cdab85d Srujana Challa 2024-06-14  124  		for (i = 1; i <= data_wds; i++) {
> 8b6c724cdab85d Srujana Challa 2024-06-14  125  			octep_write32_word(mbox, i, *p);
> 8b6c724cdab85d Srujana Challa 2024-06-14  126  			p++;
> 8b6c724cdab85d Srujana Challa 2024-06-14  127  		}
> 8b6c724cdab85d Srujana Challa 2024-06-14  128  	}
> 8b6c724cdab85d Srujana Challa 2024-06-14  129  	octep_write32_word(mbox, 0, (u32)qid);
> 8b6c724cdab85d Srujana Challa 2024-06-14  130  	octep_write_sts(mbox, 0);
> 8b6c724cdab85d Srujana Challa 2024-06-14  131  
> 8b6c724cdab85d Srujana Challa 2024-06-14  132  	octep_write_hdr(mbox, id, MBOX_REQ_SIG);
> 8b6c724cdab85d Srujana Challa 2024-06-14  133  
> 8b6c724cdab85d Srujana Challa 2024-06-14  134  	ret = octep_wait_for_mbox_rsp(mbox);
> 8b6c724cdab85d Srujana Challa 2024-06-14  135  	if (ret) {
> 8b6c724cdab85d Srujana Challa 2024-06-14  136  		dev_warn(&pdev->dev, "Timeout waiting for mbox : %d response\n", id);
> 8b6c724cdab85d Srujana Challa 2024-06-14  137  		return ret;
> 8b6c724cdab85d Srujana Challa 2024-06-14  138  	}
> 8b6c724cdab85d Srujana Challa 2024-06-14  139  
> 8b6c724cdab85d Srujana Challa 2024-06-14  140  	val = octep_read_sig(mbox);
> 8b6c724cdab85d Srujana Challa 2024-06-14  141  	if ((val & 0xFFFF) != MBOX_RSP_SIG) {
> 8b6c724cdab85d Srujana Challa 2024-06-14  142  		dev_warn(&pdev->dev, "Invalid Signature from mbox : %d response\n", id);
> 8b6c724cdab85d Srujana Challa 2024-06-14 @143  		return ret;
> 
> return -EINVAL;
> 
> The other warnings are because we should use %p to print pointers.  Depening on
> the .config the kernel will mask out pointers so that they aren't disclosed to
> the users.  Otherwise it risks being an information leak to defeat KSALR.
> 
> 8b6c724cdab85d Srujana Challa 2024-06-14  144  	}
> 8b6c724cdab85d Srujana Challa 2024-06-14  145  
> 8b6c724cdab85d Srujana Challa 2024-06-14  146  	val = octep_read_sts(mbox);
> 8b6c724cdab85d Srujana Challa 2024-06-14  147  	if (val & MBOX_RC_MASK) {
> 8b6c724cdab85d Srujana Challa 2024-06-14  148  		ret = MBOX_RSP_TO_ERR(val);
> 8b6c724cdab85d Srujana Challa 2024-06-14  149  		dev_warn(&pdev->dev, "Error while processing mbox : %d, err %d\n", id, ret);
> 8b6c724cdab85d Srujana Challa 2024-06-14  150  		return ret;
> 8b6c724cdab85d Srujana Challa 2024-06-14  151  	}
> 8b6c724cdab85d Srujana Challa 2024-06-14  152  
> 8b6c724cdab85d Srujana Challa 2024-06-14  153  	if (!write)
> 8b6c724cdab85d Srujana Challa 2024-06-14  154  		for (i = 1; i <= data_wds; i++)
> 8b6c724cdab85d Srujana Challa 2024-06-14  155  			*p++ = octep_read32_word(mbox, i);
> 8b6c724cdab85d Srujana Challa 2024-06-14  156  
> 8b6c724cdab85d Srujana Challa 2024-06-14  157  	return 0;
> 8b6c724cdab85d Srujana Challa 2024-06-14  158  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


Indeed. 
Srujana Challa, pls post a fixup patch ASAP, I will squash it.

-- 
MST

