Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1043275105
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765517217; cv=none; b=EQM8C/sUfHuhaFPLXcZHlmkk7ot2xnMjaCeoVMuaLMvNHAk8zgtyjhJ8QTvrLRg3F33bW0Peb4MeyEuKvI3zWhNYxmMXjlJJlA6pSUK9k4vFRwXEaeyEb6aGu41zgEAUYc9O/XqBtgesT/Q/vg8RgkOPJHK3PufhGdXPtW+ZgRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765517217; c=relaxed/simple;
	bh=OweqykBhgbppa/7Koee8zmJuboG3Y8BEQhfwJL/dzAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Tldewz6r5UUftURsagzAoUq+ttqT0q5LSwI/sb1s9Fb/QnpXEEcoTEJXQc7GrxNQBwMyrpV0n1s0H+ttUDCt9JfzzrEE4r0+zXFiRPMuwRpFiAqahLsdHHh5nnD5Kcn8OMRaMCE8/Ix8+VK0zik/YACu04FMY9+Y8JrZlDbzAeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oo1RMm53; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oo1RMm53"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so9141725e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 21:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765517214; x=1766122014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBWilNLrbHDRlnFxWjIjseFsePfIOw9zW9A1lO325fE=;
        b=Oo1RMm53vvS6eBhpUk+U0IiiItJwVFRYoMukKV0YnxvZjUxGig/fHx56msVn0D2HMQ
         nvMOyte8f2SdmMVzeLc56FkiCE29Kc5OT929ilF8g3fH5+t0Xb/khVeKhRJfYYbDnVXE
         J5uRk/QUzkRCQpfXZLWeYicNK5zsexSrV1oTgZk50l5MQ0mdqfFGi6aiSPaKZ44Oz81z
         XCfOs8l15ZgiNeMv7RsXljfIoI7/smFqxbv5Mh8allzEDvJitGtu7foE+JVeQ2OSW7ix
         gxtK8Z6yOcqv/mNaPHn/QNqYq/uliKUyojy/Od+WoKcm7v89fTOfgyrTQyceWnm9udmM
         fokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765517214; x=1766122014;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBWilNLrbHDRlnFxWjIjseFsePfIOw9zW9A1lO325fE=;
        b=UiEspuxoFMBzPB73uZUianfykGoa3vyqXWgbbuXlVhgMqyWx9jg2x4tUrhEWNuQH7v
         Qijz8TXOrI9Le1gqjwY8tOliW706ygH2/S2eCU+2/T1azyhVIsZfAq3AVckvkZ4nHYDJ
         mNgL4nrW+vW9CLvJDBV+Plih0J9bdFPw+5lGwadiOwpoULjqV3WCSp62dy1D+qfviv/l
         4hh6lw7D9pDrPJlZF1N66FXrtn2xsBKWSMdv9qEYXmOpcyUUIMjUHsp+iQ9vogkUSLzX
         HbzrwB0encMspzTLctWPXFPMIOVh9p07R78m6g5mev5YulGSNHgYZ0t70mAl0QkjisZx
         7w5A==
X-Gm-Message-State: AOJu0Yy4QunWGWND4bOMRHoF+cs7bD5nb4Op/mY2YFBIYO7ybXP+dGf9
	GVwqW6pGA9T2xYPEu10kIsTicruYmIsLVl3pc0IxIHjfL4DHinORhL7vgQFfGfajc2OJ6WtKBba
	yin1W
X-Gm-Gg: AY/fxX4UJyQjm7ArQ4VDeq3dvNAfIr1vhSla0/26xN9I4ZX+dKFv5X3/N2hT8TUeahV
	UgrmlSpK85bZOLlREL0jtWOHWkfZL8CwgOob/O0wkF+uGnBGr1sYnTwsSnLrnfLxR3va6HJLkjk
	e4NWu1EJ4VQBLLgMnC+cXtOq+Kx7rcDvaf1lq3f4ZqtkZEyLIxNKwAsQzAeh1qZD9qG1iv3tD0b
	0s/XmhsWqwFvQiwDsOYlyxX9OCJPb/KbTzFCkkTIu3+0rCLgFIjhNsThMoGVFsIcOd0KzpXFuRn
	BRS2MFnPsTmnSRKYM6Gv1rV6ZpmUTLxhLqMupYcSN4emoTRjKGtcy3F5gyh5Wer4B7CNEDN6b+D
	m2PW1V9ac89A/eV0HzhnbcKS0cFjh0AZM5s+P31PCmKlrCu15ymlq039gREMWMqu/2ViHSjYv6h
	O2HuCRKbNBGfrwytWaBTkLERmDNdc=
X-Google-Smtp-Source: AGHT+IFcq5X/rgP39w3ouyuMZgsKabYvnG7gJzZhlFGA5V31Y5whTm8H4/ZHY2Xw1qy6oxxHEXPKqw==
X-Received: by 2002:a05:600c:3495:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-47a8f90e7c9mr7490195e9.26.1765517213522;
        Thu, 11 Dec 2025 21:26:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4ef38bsm13361905e9.0.2025.12.11.21.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 21:26:53 -0800 (PST)
Date: Fri, 12 Dec 2025 08:26:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Md Haris Iqbal <haris.iqbal@ionos.com>,
	linux-rdma@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, bvanassche@acm.org,
	leon@kernel.org, jgg@ziepe.ca, haris.iqbal@ionos.com,
	jinpu.wang@ionos.com, grzegorz.prajsner@ionos.com,
	Kim Zhu <zhu.yanjun@ionos.com>
Subject: Re: [PATCH 2/9] RDMA/rtrs: Add error description to the logs
Message-ID: <202512120133.BuJVeI6M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208161513.127049-3-haris.iqbal@ionos.com>
Message-ID: <20251212052649.S3TtTLnZIaBd88XNkfXy4_Zx7EcTwFvc_kMj-1c8Es8@z>

Hi Md,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Haris-Iqbal/RDMA-rtrs-srv-fix-SG-mapping/20251209-001817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20251208161513.127049-3-haris.iqbal%40ionos.com
patch subject: [PATCH 2/9] RDMA/rtrs: Add error description to the logs
config: arm-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251212/202512120133.BuJVeI6M-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512120133.BuJVeI6M-lkp@intel.com/

smatch warnings:
drivers/infiniband/ulp/rtrs/rtrs-srv.c:885 process_info_req() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +885 drivers/infiniband/ulp/rtrs/rtrs-srv.c

9cb837480424e7 Jack Wang        2020-05-11  808  static int process_info_req(struct rtrs_srv_con *con,
9cb837480424e7 Jack Wang        2020-05-11  809  			    struct rtrs_msg_info_req *msg)
9cb837480424e7 Jack Wang        2020-05-11  810  {
d9372794717f44 Vaishali Thakkar 2022-01-05  811  	struct rtrs_path *s = con->c.path;
ae4c81644e9105 Vaishali Thakkar 2022-01-05  812  	struct rtrs_srv_path *srv_path = to_srv_path(s);
9cb837480424e7 Jack Wang        2020-05-11  813  	struct ib_send_wr *reg_wr = NULL;
9cb837480424e7 Jack Wang        2020-05-11  814  	struct rtrs_msg_info_rsp *rsp;
9cb837480424e7 Jack Wang        2020-05-11  815  	struct rtrs_iu *tx_iu;
9cb837480424e7 Jack Wang        2020-05-11  816  	struct ib_reg_wr *rwr;
9cb837480424e7 Jack Wang        2020-05-11  817  	int mri, err;
9cb837480424e7 Jack Wang        2020-05-11  818  	size_t tx_sz;
9cb837480424e7 Jack Wang        2020-05-11  819  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  820  	err = post_recv_path(srv_path);
4693d6b767d6ca Gioh Kim         2021-08-06  821  	if (err) {
94ae3ce9b375c6 Kim Zhu          2025-12-08  822  		rtrs_err(s, "post_recv_path(), err: %d(%pe)\n", err, ERR_PTR(err));
9cb837480424e7 Jack Wang        2020-05-11  823  		return err;
9cb837480424e7 Jack Wang        2020-05-11  824  	}
07c14027295a32 Gioh Kim         2021-05-28  825  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  826  	if (strchr(msg->pathname, '/') || strchr(msg->pathname, '.')) {
ae4c81644e9105 Vaishali Thakkar 2022-01-05  827  		rtrs_err(s, "pathname cannot contain / and .\n");
dea7bb3ad3e08f Md Haris Iqbal   2021-09-22  828  		return -EINVAL;
dea7bb3ad3e08f Md Haris Iqbal   2021-09-22  829  	}
dea7bb3ad3e08f Md Haris Iqbal   2021-09-22  830  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  831  	if (exist_pathname(srv_path->srv->ctx,
ae4c81644e9105 Vaishali Thakkar 2022-01-05  832  			   msg->pathname, &srv_path->srv->paths_uuid)) {
ae4c81644e9105 Vaishali Thakkar 2022-01-05  833  		rtrs_err(s, "pathname is duplicated: %s\n", msg->pathname);
07c14027295a32 Gioh Kim         2021-05-28  834  		return -EPERM;
07c14027295a32 Gioh Kim         2021-05-28  835  	}
ae4c81644e9105 Vaishali Thakkar 2022-01-05  836  	strscpy(srv_path->s.sessname, msg->pathname,
ae4c81644e9105 Vaishali Thakkar 2022-01-05  837  		sizeof(srv_path->s.sessname));
07c14027295a32 Gioh Kim         2021-05-28  838  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  839  	rwr = kcalloc(srv_path->mrs_num, sizeof(*rwr), GFP_KERNEL);
4693d6b767d6ca Gioh Kim         2021-08-06  840  	if (!rwr)
9cb837480424e7 Jack Wang        2020-05-11  841  		return -ENOMEM;
9cb837480424e7 Jack Wang        2020-05-11  842  
9cb837480424e7 Jack Wang        2020-05-11  843  	tx_sz  = sizeof(*rsp);
ae4c81644e9105 Vaishali Thakkar 2022-01-05  844  	tx_sz += sizeof(rsp->desc[0]) * srv_path->mrs_num;
ae4c81644e9105 Vaishali Thakkar 2022-01-05  845  	tx_iu = rtrs_iu_alloc(1, tx_sz, GFP_KERNEL, srv_path->s.dev->ib_dev,
9cb837480424e7 Jack Wang        2020-05-11  846  			       DMA_TO_DEVICE, rtrs_srv_info_rsp_done);
4693d6b767d6ca Gioh Kim         2021-08-06  847  	if (!tx_iu) {
9cb837480424e7 Jack Wang        2020-05-11  848  		err = -ENOMEM;
9cb837480424e7 Jack Wang        2020-05-11  849  		goto rwr_free;
9cb837480424e7 Jack Wang        2020-05-11  850  	}
9cb837480424e7 Jack Wang        2020-05-11  851  
9cb837480424e7 Jack Wang        2020-05-11  852  	rsp = tx_iu->buf;
9cb837480424e7 Jack Wang        2020-05-11  853  	rsp->type = cpu_to_le16(RTRS_MSG_INFO_RSP);
ae4c81644e9105 Vaishali Thakkar 2022-01-05  854  	rsp->sg_cnt = cpu_to_le16(srv_path->mrs_num);
9cb837480424e7 Jack Wang        2020-05-11  855  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  856  	for (mri = 0; mri < srv_path->mrs_num; mri++) {
ae4c81644e9105 Vaishali Thakkar 2022-01-05  857  		struct ib_mr *mr = srv_path->mrs[mri].mr;
9cb837480424e7 Jack Wang        2020-05-11  858  
9cb837480424e7 Jack Wang        2020-05-11  859  		rsp->desc[mri].addr = cpu_to_le64(mr->iova);
9cb837480424e7 Jack Wang        2020-05-11  860  		rsp->desc[mri].key  = cpu_to_le32(mr->rkey);
9cb837480424e7 Jack Wang        2020-05-11  861  		rsp->desc[mri].len  = cpu_to_le32(mr->length);
9cb837480424e7 Jack Wang        2020-05-11  862  
9cb837480424e7 Jack Wang        2020-05-11  863  		/*
9cb837480424e7 Jack Wang        2020-05-11  864  		 * Fill in reg MR request and chain them *backwards*
9cb837480424e7 Jack Wang        2020-05-11  865  		 */
9cb837480424e7 Jack Wang        2020-05-11  866  		rwr[mri].wr.next = mri ? &rwr[mri - 1].wr : NULL;
9cb837480424e7 Jack Wang        2020-05-11  867  		rwr[mri].wr.opcode = IB_WR_REG_MR;
9cb837480424e7 Jack Wang        2020-05-11  868  		rwr[mri].wr.wr_cqe = &local_reg_cqe;
9cb837480424e7 Jack Wang        2020-05-11  869  		rwr[mri].wr.num_sge = 0;
e8ae7ddb48a1b8 Jack Wang        2020-12-17  870  		rwr[mri].wr.send_flags = 0;
9cb837480424e7 Jack Wang        2020-05-11  871  		rwr[mri].mr = mr;
9cb837480424e7 Jack Wang        2020-05-11  872  		rwr[mri].key = mr->rkey;
9cb837480424e7 Jack Wang        2020-05-11  873  		rwr[mri].access = (IB_ACCESS_LOCAL_WRITE |
9cb837480424e7 Jack Wang        2020-05-11  874  				   IB_ACCESS_REMOTE_WRITE);
9cb837480424e7 Jack Wang        2020-05-11  875  		reg_wr = &rwr[mri].wr;
9cb837480424e7 Jack Wang        2020-05-11  876  	}
9cb837480424e7 Jack Wang        2020-05-11  877  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  878  	err = rtrs_srv_create_path_files(srv_path);
4693d6b767d6ca Gioh Kim         2021-08-06  879  	if (err)
9cb837480424e7 Jack Wang        2020-05-11  880  		goto iu_free;
ae4c81644e9105 Vaishali Thakkar 2022-01-05  881  	kobject_get(&srv_path->kobj);
ae4c81644e9105 Vaishali Thakkar 2022-01-05  882  	get_device(&srv_path->srv->dev);
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  883  	err = rtrs_srv_change_state(srv_path, RTRS_SRV_CONNECTED);
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  884  	if (!err) {

Probably remove the !?

94ae3ce9b375c6 Kim Zhu          2025-12-08 @885  		rtrs_err(s, "rtrs_srv_change_state(), err: %d(%pe)\n", err, ERR_PTR(err));

err is zero.  Or is this a success path?

ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  886  		goto iu_free;
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  887  	}
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  888  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  889  	rtrs_srv_start_hb(srv_path);
9cb837480424e7 Jack Wang        2020-05-11  890  
9cb837480424e7 Jack Wang        2020-05-11  891  	/*
9cb837480424e7 Jack Wang        2020-05-11  892  	 * We do not account number of established connections at the current
9cb837480424e7 Jack Wang        2020-05-11  893  	 * moment, we rely on the client, which should send info request when
9cb837480424e7 Jack Wang        2020-05-11  894  	 * all connections are successfully established.  Thus, simply notify
9cb837480424e7 Jack Wang        2020-05-11  895  	 * listener with a proper event if we are the first path.
9cb837480424e7 Jack Wang        2020-05-11  896  	 */
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  897  	err = rtrs_srv_path_up(srv_path);
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  898  	if (err) {
94ae3ce9b375c6 Kim Zhu          2025-12-08  899  		rtrs_err(s, "rtrs_srv_path_up(), err: %d(%pe)\n", err, ERR_PTR(err));
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  900  		goto iu_free;
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  901  	}
9cb837480424e7 Jack Wang        2020-05-11  902  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  903  	ib_dma_sync_single_for_device(srv_path->s.dev->ib_dev,
ae4c81644e9105 Vaishali Thakkar 2022-01-05  904  				      tx_iu->dma_addr,
9cb837480424e7 Jack Wang        2020-05-11  905  				      tx_iu->size, DMA_TO_DEVICE);
9cb837480424e7 Jack Wang        2020-05-11  906  
9cb837480424e7 Jack Wang        2020-05-11  907  	/* Send info response */
9cb837480424e7 Jack Wang        2020-05-11  908  	err = rtrs_iu_post_send(&con->c, tx_iu, tx_sz, reg_wr);
4693d6b767d6ca Gioh Kim         2021-08-06  909  	if (err) {
94ae3ce9b375c6 Kim Zhu          2025-12-08  910  		rtrs_err(s, "rtrs_iu_post_send(), err: %d(%pe)\n", err, ERR_PTR(err));
9cb837480424e7 Jack Wang        2020-05-11  911  iu_free:
ae4c81644e9105 Vaishali Thakkar 2022-01-05  912  		rtrs_iu_free(tx_iu, srv_path->s.dev->ib_dev, 1);
9cb837480424e7 Jack Wang        2020-05-11  913  	}
9cb837480424e7 Jack Wang        2020-05-11  914  rwr_free:
9cb837480424e7 Jack Wang        2020-05-11  915  	kfree(rwr);
9cb837480424e7 Jack Wang        2020-05-11  916  
9cb837480424e7 Jack Wang        2020-05-11  917  	return err;
9cb837480424e7 Jack Wang        2020-05-11  918  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

