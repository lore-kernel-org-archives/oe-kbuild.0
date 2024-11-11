Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CF31474A2
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318470; cv=none; b=Uu8TrgVuIoai8c4UcbOTHndIA2ZZ34703oIEvVCj+aBTGgJJwgy2/4he3iNB798j7ykshI/imI9JyMoCIMuZk3Q/F60VRI/EZkdEQDymN18bmjXg38Q2WZ3zZV3IV7bZO8BaaUZatQwEZExAOCmS63eldrWJbwqCpS2chzJMNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318470; c=relaxed/simple;
	bh=kc8cr65BxklqUcOaTnY4Pi22Rjl3H4L5YgE9Oa2FdnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nOnyySkpU7CkMks65EbrZ2RcsF5UoBmlNZFlkGtRrWRVoP1eeT2PWwUU9yX5AV7PhLCcVNdAowegkNCmq1q0S4WhgG9Xi2HG8brCKCiR33ewmM3KGGSmeWD5qjT8wWR/0OaKaYm61rwRJXal+X1XEcOb3qRg6kAxjzIGywfUpt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GeX8Yunx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GeX8Yunx"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cec93719ccso5887074a12.2
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731318466; x=1731923266; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkJz7Vtx33IWQ/FbsMvhDuknhNQdiPskHnhrYja0V98=;
        b=GeX8YunxfytWNT08zylt0qrCWnn94E+f2f9BkgLCXZIT5RnPt/MzNaOD/mQoRf7Yfd
         ornKIlOyYkND+wKvSz8a9OfM/c6zrYhreMHHBUUq3EZpM2MD551bf60wKdfeoBaQ0bGD
         WAD5/q/1PPigUG59wu669vmhEJe6rfmVhX60LDI+QWKS9BGmDRJv9ZZniUY05U0dNERr
         /jrRGaWhqdklMad4cdYrDQqhR5CMoUBSN4/UqwznT5HDrBRD4yxCpBVt1ogsgBiBeOsB
         Bogh3vaV3/jBELsPzA4Ryvwan+yXcZ7vI2pW2A+phNpiJCY4a6V/iSzdjoPPgJZp4jxh
         wBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318466; x=1731923266;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkJz7Vtx33IWQ/FbsMvhDuknhNQdiPskHnhrYja0V98=;
        b=qmr4SCvBQj51W7QOXfexzl+7p3BeSVWYqglSx0jSfYbbPZhuBZex92ZnFl4Wyx35Lf
         6keANGRst7kupg17JH19X+v+d+OoPHdtGNEwx8PsjcTILqlzGSw6fkQFECqNNpd/an97
         jd1vz7Xvp2bvbXyjutQdQkjbugS9MRKT3WgU7qOdM/bxGstxoKOwlwhGHMz8EORlmavz
         5aXqvokB/j+mY+Rv13GpEQDvl2USWHPKcjN6gWLeJ1XJWU9u3F0f4YIc4Jo+bGHJUed6
         b9la3FY4PO2MBEbEdXADlNDnyIrVriEioAR8pytLCeJjd/zRQ2YCwaCwCisooF4kfak4
         T2PA==
X-Gm-Message-State: AOJu0Ywb6XOcsT/mQ+M6HfYOAFfIQ7b9hkGCHHYvmqLi3iB7hQvs2kw+
	3yKjsRklj9fWjUVYMRFfdwrFpD2mFGcspHdHdhJdcP3A2iQk/3xVyEa5YenEWgn7F65Rp65ZaEN
	qi5s=
X-Google-Smtp-Source: AGHT+IGsq8EjON+rP2OVtt9iLFlIq2jH+I5Ii92nliEf8BTTGnn5CC3vbCltiddot8IsnXDQqpKGYg==
X-Received: by 2002:a17:907:60c8:b0:a99:89e9:a43d with SMTP id a640c23a62f3a-a9eefff0af1mr1148526266b.39.1731318465847;
        Mon, 11 Nov 2024 01:47:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee3c906d6sm547557366b.49.2024.11.11.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:47:45 -0800 (PST)
Date: Mon, 11 Nov 2024 12:47:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Guixin Liu <kanie@linux.alibaba.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Subject: [linux-nvme:nvme-6.13 7/7] drivers/nvme/target/pr.c:851
 nvmet_execute_pr_report() warn: potential pointer math issue ('ctrl_eds' is
 a 512 bit pointer)
Message-ID: <61ac311c-ca48-4ab7-9b77-32164288cbaa@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.13
head:   4c0ce9416cd06e9ef0e049f7a9226707c3786b1a
commit: 4c0ce9416cd06e9ef0e049f7a9226707c3786b1a [7/7] nvmet: support reservation feature
config: i386-randconfig-141-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081457.mmSUxHMU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411081457.mmSUxHMU-lkp@intel.com/

smatch warnings:
drivers/nvme/target/pr.c:851 nvmet_execute_pr_report() warn: potential pointer math issue ('ctrl_eds' is a 512 bit pointer)

vim +851 drivers/nvme/target/pr.c

4c0ce9416cd06e Guixin Liu 2024-11-06  803  static void nvmet_execute_pr_report(struct nvmet_req *req)
4c0ce9416cd06e Guixin Liu 2024-11-06  804  {
4c0ce9416cd06e Guixin Liu 2024-11-06  805  	u32 cdw11 = le32_to_cpu(req->cmd->common.cdw11);
4c0ce9416cd06e Guixin Liu 2024-11-06  806  	u32 cdw10 = le32_to_cpu(req->cmd->common.cdw10);
4c0ce9416cd06e Guixin Liu 2024-11-06  807  	u32 num_bytes = 4 * (cdw10 + 1); /* cdw10 is number of dwords */
4c0ce9416cd06e Guixin Liu 2024-11-06  808  	u8 eds = cdw11 & 1; /* Extended data structure, bit 00 */
4c0ce9416cd06e Guixin Liu 2024-11-06  809  	struct nvme_registered_ctrl_ext *ctrl_eds;
4c0ce9416cd06e Guixin Liu 2024-11-06  810  	struct nvme_reservation_status_ext *data;
4c0ce9416cd06e Guixin Liu 2024-11-06  811  	struct nvmet_pr *pr = &req->ns->pr;
4c0ce9416cd06e Guixin Liu 2024-11-06  812  	struct nvmet_pr_registrant *holder;
4c0ce9416cd06e Guixin Liu 2024-11-06  813  	struct nvmet_pr_registrant *reg;
4c0ce9416cd06e Guixin Liu 2024-11-06  814  	u16 num_ctrls = 0;
4c0ce9416cd06e Guixin Liu 2024-11-06  815  	u16 status;
4c0ce9416cd06e Guixin Liu 2024-11-06  816  	u8 rtype;
4c0ce9416cd06e Guixin Liu 2024-11-06  817  
4c0ce9416cd06e Guixin Liu 2024-11-06  818  	/* nvmet hostid(uuid_t) is 128 bit. */
4c0ce9416cd06e Guixin Liu 2024-11-06  819  	if (!eds) {
4c0ce9416cd06e Guixin Liu 2024-11-06  820  		req->error_loc = offsetof(struct nvme_common_command, cdw11);
4c0ce9416cd06e Guixin Liu 2024-11-06  821  		status = NVME_SC_HOST_ID_INCONSIST | NVME_STATUS_DNR;
4c0ce9416cd06e Guixin Liu 2024-11-06  822  		goto out;
4c0ce9416cd06e Guixin Liu 2024-11-06  823  	}
4c0ce9416cd06e Guixin Liu 2024-11-06  824  
4c0ce9416cd06e Guixin Liu 2024-11-06  825  	if (num_bytes < sizeof(struct nvme_reservation_status_ext)) {
4c0ce9416cd06e Guixin Liu 2024-11-06  826  		req->error_loc = offsetof(struct nvme_common_command, cdw10);
4c0ce9416cd06e Guixin Liu 2024-11-06  827  		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
4c0ce9416cd06e Guixin Liu 2024-11-06  828  		goto out;
4c0ce9416cd06e Guixin Liu 2024-11-06  829  	}
4c0ce9416cd06e Guixin Liu 2024-11-06  830  
4c0ce9416cd06e Guixin Liu 2024-11-06  831  	data = kmalloc(num_bytes, GFP_KERNEL);
4c0ce9416cd06e Guixin Liu 2024-11-06  832  	if (!data) {
4c0ce9416cd06e Guixin Liu 2024-11-06  833  		status = NVME_SC_INTERNAL;
4c0ce9416cd06e Guixin Liu 2024-11-06  834  		goto out;
4c0ce9416cd06e Guixin Liu 2024-11-06  835  	}
4c0ce9416cd06e Guixin Liu 2024-11-06  836  	memset(data, 0, num_bytes);
4c0ce9416cd06e Guixin Liu 2024-11-06  837  	data->gen = cpu_to_le32(atomic_read(&pr->generation));
4c0ce9416cd06e Guixin Liu 2024-11-06  838  	data->ptpls = 0;
4c0ce9416cd06e Guixin Liu 2024-11-06  839  	ctrl_eds = data->regctl_eds;
4c0ce9416cd06e Guixin Liu 2024-11-06  840  
4c0ce9416cd06e Guixin Liu 2024-11-06  841  	rcu_read_lock();
4c0ce9416cd06e Guixin Liu 2024-11-06  842  	holder = rcu_dereference(pr->holder);
4c0ce9416cd06e Guixin Liu 2024-11-06  843  	rtype = holder ? holder->rtype : 0;
4c0ce9416cd06e Guixin Liu 2024-11-06  844  	data->rtype = rtype;
4c0ce9416cd06e Guixin Liu 2024-11-06  845  
4c0ce9416cd06e Guixin Liu 2024-11-06  846  	list_for_each_entry_rcu(reg, &pr->registrant_list, entry) {
4c0ce9416cd06e Guixin Liu 2024-11-06  847  		num_ctrls++;
4c0ce9416cd06e Guixin Liu 2024-11-06  848  		/*
4c0ce9416cd06e Guixin Liu 2024-11-06  849  		 * continue to get the number of all registrans.
4c0ce9416cd06e Guixin Liu 2024-11-06  850  		 */
4c0ce9416cd06e Guixin Liu 2024-11-06 @851  		if ((void *)(ctrl_eds + sizeof(*ctrl_eds)) >

The parenthesis are in the wrong place so it's a pointer math bug.

4c0ce9416cd06e Guixin Liu 2024-11-06  852  			(void *)(data + num_bytes))

This is wrong too.  I'm disappointed that Smatch doesn't catch this.  I thought
it would...

	if ((void *)ctrl_eds + sizeof(*ctrl_eds) > (void *)data + num_bytes) {

4c0ce9416cd06e Guixin Liu 2024-11-06  853  			continue;
4c0ce9416cd06e Guixin Liu 2024-11-06  854  		/*
4c0ce9416cd06e Guixin Liu 2024-11-06  855  		 * Dynamic controller, set cntlid to 0xffff.
4c0ce9416cd06e Guixin Liu 2024-11-06  856  		 */
4c0ce9416cd06e Guixin Liu 2024-11-06  857  		ctrl_eds->cntlid = NVME_CNTLID_DYNAMIC;
4c0ce9416cd06e Guixin Liu 2024-11-06  858  		if (rtype == NVME_PR_WRITE_EXCLUSIVE_ALL_REGS ||
4c0ce9416cd06e Guixin Liu 2024-11-06  859  		    rtype == NVME_PR_EXCLUSIVE_ACCESS_ALL_REGS)
4c0ce9416cd06e Guixin Liu 2024-11-06  860  			ctrl_eds->rcsts = 1;
4c0ce9416cd06e Guixin Liu 2024-11-06  861  		if (reg == holder)
4c0ce9416cd06e Guixin Liu 2024-11-06  862  			ctrl_eds->rcsts = 1;
4c0ce9416cd06e Guixin Liu 2024-11-06  863  		uuid_copy((uuid_t *)&ctrl_eds->hostid, &reg->hostid);
4c0ce9416cd06e Guixin Liu 2024-11-06  864  		ctrl_eds->rkey = cpu_to_le64(reg->rkey);
4c0ce9416cd06e Guixin Liu 2024-11-06  865  		ctrl_eds++;
4c0ce9416cd06e Guixin Liu 2024-11-06  866  	}
4c0ce9416cd06e Guixin Liu 2024-11-06  867  	rcu_read_unlock();
4c0ce9416cd06e Guixin Liu 2024-11-06  868  
4c0ce9416cd06e Guixin Liu 2024-11-06  869  	put_unaligned_le16(num_ctrls, data->regctl);
4c0ce9416cd06e Guixin Liu 2024-11-06  870  	status = nvmet_copy_to_sgl(req, 0, data, num_bytes);
4c0ce9416cd06e Guixin Liu 2024-11-06  871  	kfree(data);
4c0ce9416cd06e Guixin Liu 2024-11-06  872  out:
4c0ce9416cd06e Guixin Liu 2024-11-06  873  	nvmet_req_complete(req, status);
4c0ce9416cd06e Guixin Liu 2024-11-06  874  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

