Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790ED3E4C61
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609153; cv=none; b=Yd1jY/pxhj8Wy4U97lDOJw6QvSp5/vptcAnP1AwdADxYfJCq7IcaBtC97eiawaA3rd5ODyqAaiDYD5xZJS49jP5CKj5gz9BgC93XYqU5hQ8M+3AujOqzQ28Xzm+QsLcfFuiZYOiZaUzMXusHvR7wt8xlxrCESX9agNjLZ4c/ebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609153; c=relaxed/simple;
	bh=47TLrTH91euHwTmAWHlGWmLZWvb51b3gev6G9GRLSC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tD5Lj4kykeVLwvHdQRIwIunOuK2xCEA/v2WYDa4rUs5pZv6pdDfa3vbwfNCTzRuuVshr522mNh6sQmYOvqZfCbUqsMHdGhFpI2cr6Sv4whcO3BHMXe2fIfXf/77V+4siJ4bD05+5z5iykMiDK6avI4rsuCwz52fdYjT2guGB5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fT4mCdsy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fT4mCdsy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so19989755e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 03:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774609146; x=1775213946; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMs1R3aANdS20W9BH1T38sqaIXeaYHgJNSTENUzzVug=;
        b=fT4mCdsy1pQSAK/jP/k/ZrIfPPdHRzoVCGw7AHKUgY3wF8hQgpr5fM8MlFbCeeNCUh
         yjl/QTmN836GowHKhPodEwg2b67AWkVlTbLODydUeGTcEEsSM+D6YYnRZ3EP1vH15GuN
         idQujnAh9TYUD3cg+0AHrmgzOn9ivrAn3B2Ioyrpae72j41cDROIG8kuYXN8E+Jlcn17
         Ni8o+fEDjT6bKkeZj/bFQC/+v6C0CF3nkbBxapXsPMf7q39HtbHHzMdev9hw1setknwb
         MJ8i9LTkA+x0qlhRpXxd/vQoLdChXp6zUiJ6rCLlNkeWxDQsMzUBkuBk+hDze+I2QYei
         lHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774609146; x=1775213946;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMs1R3aANdS20W9BH1T38sqaIXeaYHgJNSTENUzzVug=;
        b=mG2tHlXiaQ5H25qg2m5hr61nwhJsNbh975yybjU48xVPMOFvBa5LFRGT7K0f1fH+Ui
         77/j2lg6BRQWU4uYI3FkdI6YTrO3ik7emC/H6YRprc8WE8y0rj5bj3uxZxQsZqcDyu4B
         GojzRTe74X5FBs0cFnkdOwGpW8XQQxiSJypCLsypmalu8+DKpGMn5sR8uUR1eec0l+su
         LtS842H5g6GG5pK8kUyk8XyOGU8kavJgkNJdZ15cO70e3L++M3Em908dLL6HGjNL8dUw
         FWem72weYiRQVz5nUqCxU4f5VoOi7fpgrGl47XD5dBwHfRGxb1gsL5252Fa5hNVqhxN3
         yoYg==
X-Gm-Message-State: AOJu0Yw4s7CrW3Fv5YrHyx6QkZB3zwFNlM+pxC3npW1b/FbAWsEYC78n
	CWh69deblBh3nck0AiWW/XBboYW8lkBSsfcyNCNaVBsht1O+b9hSaxNH56GeYqZkIVQvN30JoeH
	EhIwY
X-Gm-Gg: ATEYQzxdwqGiqD3wcSZpB3jlKiClRRAjj+eB/wzDqst7EFqhJa4IwF8S3LGsisNTqlB
	frP696Yoywm1jFz+3jq9l1vBR1ETwBzxBVxWz1xYW5gp0qrj2OGvVOp9atTrWV/Qx6m0cq45lLQ
	LzQcBZtudmrI4gzCtyQBXX21FQM/iKubyGimHbm5VW+8x2ecgHVU+DrdhDbwZi85g+vRgeZTjDq
	aJ+LHh5XEKAVok/HcFrwn7E74B5ofRxof76vykQFc0mnTiO/LWD+YnjHbO8QJ1VvfAXEdHDce3C
	1MQHDzeL+57ExU2jwpejfSYoGc658uBVdh4m5juWh5yJfCvz0ZYtAJgI9BWCRNkpz8zwoIwra0r
	cAJI/8pWiMtora1I3zn961qbt6o4gggRUdKPsek4DNkCOGqubejjXAtj5MwsEt5gdp3gmddvdbR
	7zGdcEpcw0DVuVbM/9x+LO/dyflQB9
X-Received: by 2002:a05:600c:4f53:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-48727ee988cmr29994685e9.3.1774609145762;
        Fri, 27 Mar 2026 03:59:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm175083035e9.9.2026.03.27.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:59:05 -0700 (PDT)
Date: Fri, 27 Mar 2026 13:59:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 204/525] drivers/misc/bcm-vk/bcm_vk_msg.c:1054
 bcm_vk_read() error: we previously assumed 'entry' could be null (see line
 1045)
Message-ID: <202603271746.xX5EENwP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260327105902.GFCvjQgMMTQdRAUarML3K2p9aki0kS7r8esfPJsX_qk@z>


This was fixed in ba75ecb97d3f ("misc: bcm_vk: Fix possible null-pointer
dereferences in bcm_vk_read()").  Why are you working against a 2 year
old tree, Jens?  :P


tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   520344cda122ca1903fafb19768f56509e3db8b1
commit: 0629d32f614c429b7dc371a2ac04475bb82b909f [204/525] misc: bcm_vk: convert to iterators
config: loongarch-randconfig-r072-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271746.xX5EENwP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603271746.xX5EENwP-lkp@intel.com/

smatch warnings:
drivers/misc/bcm-vk/bcm_vk_msg.c:1054 bcm_vk_read() error: we previously assumed 'entry' could be null (see line 1045)

vim +/entry +1054 drivers/misc/bcm-vk/bcm_vk_msg.c

0629d32f614c429 Jens Axboe    2024-04-05  1002  ssize_t bcm_vk_read(struct kiocb *iocb, struct iov_iter *to)
111d746bb4767ad Scott Branden 2021-01-20  1003  {
111d746bb4767ad Scott Branden 2021-01-20  1004  	ssize_t rc = -ENOMSG;
0629d32f614c429 Jens Axboe    2024-04-05  1005  	struct bcm_vk_ctx *ctx = iocb->ki_filp->private_data;
111d746bb4767ad Scott Branden 2021-01-20  1006  	struct bcm_vk *vk = container_of(ctx->miscdev, struct bcm_vk,
111d746bb4767ad Scott Branden 2021-01-20  1007  					 miscdev);
111d746bb4767ad Scott Branden 2021-01-20  1008  	struct device *dev = &vk->pdev->dev;
111d746bb4767ad Scott Branden 2021-01-20  1009  	struct bcm_vk_msg_chan *chan = &vk->to_h_msg_chan;
88517757a829e9c Jakob Koschel 2022-03-27  1010  	struct bcm_vk_wkent *entry = NULL, *iter;
0629d32f614c429 Jens Axboe    2024-04-05  1011  	size_t count = iov_iter_count(to);
111d746bb4767ad Scott Branden 2021-01-20  1012  	u32 q_num;
111d746bb4767ad Scott Branden 2021-01-20  1013  	u32 rsp_length;
111d746bb4767ad Scott Branden 2021-01-20  1014  
111d746bb4767ad Scott Branden 2021-01-20  1015  	if (!bcm_vk_drv_access_ok(vk))
111d746bb4767ad Scott Branden 2021-01-20  1016  		return -EPERM;
111d746bb4767ad Scott Branden 2021-01-20  1017  
111d746bb4767ad Scott Branden 2021-01-20  1018  	dev_dbg(dev, "Buf count %zu\n", count);
111d746bb4767ad Scott Branden 2021-01-20  1019  
111d746bb4767ad Scott Branden 2021-01-20  1020  	/*
111d746bb4767ad Scott Branden 2021-01-20  1021  	 * search through the pendq on the to_h chan, and return only those
111d746bb4767ad Scott Branden 2021-01-20  1022  	 * that belongs to the same context.  Search is always from the high to
111d746bb4767ad Scott Branden 2021-01-20  1023  	 * the low priority queues
111d746bb4767ad Scott Branden 2021-01-20  1024  	 */
111d746bb4767ad Scott Branden 2021-01-20  1025  	spin_lock(&chan->pendq_lock);
111d746bb4767ad Scott Branden 2021-01-20  1026  	for (q_num = 0; q_num < chan->q_nr; q_num++) {
88517757a829e9c Jakob Koschel 2022-03-27  1027  		list_for_each_entry(iter, &chan->pendq[q_num], node) {
88517757a829e9c Jakob Koschel 2022-03-27  1028  			if (iter->ctx->idx == ctx->idx) {
111d746bb4767ad Scott Branden 2021-01-20  1029  				if (count >=
88517757a829e9c Jakob Koschel 2022-03-27  1030  				    (iter->to_h_blks * VK_MSGQ_BLK_SIZE)) {
88517757a829e9c Jakob Koschel 2022-03-27  1031  					list_del(&iter->node);
111d746bb4767ad Scott Branden 2021-01-20  1032  					atomic_dec(&ctx->pend_cnt);
88517757a829e9c Jakob Koschel 2022-03-27  1033  					entry = iter;
111d746bb4767ad Scott Branden 2021-01-20  1034  				} else {
111d746bb4767ad Scott Branden 2021-01-20  1035  					/* buffer not big enough */
111d746bb4767ad Scott Branden 2021-01-20  1036  					rc = -EMSGSIZE;
111d746bb4767ad Scott Branden 2021-01-20  1037  				}
111d746bb4767ad Scott Branden 2021-01-20  1038  				goto read_loop_exit;
111d746bb4767ad Scott Branden 2021-01-20  1039  			}
111d746bb4767ad Scott Branden 2021-01-20  1040  		}
111d746bb4767ad Scott Branden 2021-01-20  1041  	}
111d746bb4767ad Scott Branden 2021-01-20  1042  read_loop_exit:
111d746bb4767ad Scott Branden 2021-01-20  1043  	spin_unlock(&chan->pendq_lock);
111d746bb4767ad Scott Branden 2021-01-20  1044  
88517757a829e9c Jakob Koschel 2022-03-27 @1045  	if (entry) {
                                                            ^^^^^

111d746bb4767ad Scott Branden 2021-01-20  1046  		/* retrieve the passed down msg_id */
111d746bb4767ad Scott Branden 2021-01-20  1047  		set_msg_id(&entry->to_h_msg[0], entry->usr_msg_id);
111d746bb4767ad Scott Branden 2021-01-20  1048  		rsp_length = entry->to_h_blks * VK_MSGQ_BLK_SIZE;
0629d32f614c429 Jens Axboe    2024-04-05  1049  		if (!copy_to_iter_full(entry->to_h_msg, rsp_length, to))
111d746bb4767ad Scott Branden 2021-01-20  1050  			rc = rsp_length;
111d746bb4767ad Scott Branden 2021-01-20  1051  
111d746bb4767ad Scott Branden 2021-01-20  1052  		bcm_vk_free_wkent(dev, entry);
111d746bb4767ad Scott Branden 2021-01-20  1053  	} else if (rc == -EMSGSIZE) {
0629d32f614c429 Jens Axboe    2024-04-05 @1054  		struct vk_msg_blk tmp_msg = entry->to_h_msg[0];
                                                                                            ^^^^^^^
entry is NULL at this point.

0629d32f614c429 Jens Axboe    2024-04-05  1055  
111d746bb4767ad Scott Branden 2021-01-20  1056  		/*
111d746bb4767ad Scott Branden 2021-01-20  1057  		 * in this case, return just the first block, so
111d746bb4767ad Scott Branden 2021-01-20  1058  		 * that app knows what size it is looking for.
111d746bb4767ad Scott Branden 2021-01-20  1059  		 */
0629d32f614c429 Jens Axboe    2024-04-05  1060  		set_msg_id(&tmp_msg, entry->usr_msg_id);
0629d32f614c429 Jens Axboe    2024-04-05  1061  		tmp_msg.size = entry->to_h_blks - 1;
0629d32f614c429 Jens Axboe    2024-04-05  1062  		if (!copy_to_iter_full(&tmp_msg, VK_MSGQ_BLK_SIZE, to)) {
111d746bb4767ad Scott Branden 2021-01-20  1063  			dev_err(dev, "Error return 1st block in -EMSGSIZE\n");
111d746bb4767ad Scott Branden 2021-01-20  1064  			rc = -EFAULT;
111d746bb4767ad Scott Branden 2021-01-20  1065  		}
111d746bb4767ad Scott Branden 2021-01-20  1066  	}
111d746bb4767ad Scott Branden 2021-01-20  1067  	return rc;
111d746bb4767ad Scott Branden 2021-01-20  1068  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

