Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814121BB6A1
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719945394; cv=none; b=C+qE3JVggfr7/E3hFn/5a6Vf0hTSbUFWQgFaUumTydEVTnjCCSooblmXEOjzdE9VI93B/Wz0ZmrE70HIZRRzWVgWnXyTAkQgC19dbO8uzOjBl8ObGjrepOqFGMuwKxdPdMLJHQ1nBqyiX08faBXuRq6KigXuj2ELy+RFwQJpi+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719945394; c=relaxed/simple;
	bh=5oNallnJYnln3ghD/006ttbIroaJPxLU8X8H5H11NME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UfdUILQ6asjfJ7CtxRVpfyZUgHV9w7/8t+n2rngFrUTp+yEendH7SVRP1/Vh2Wa2hCWgDUdo7hPbm77pzYZUpLL45ygsa1b8OToZCQ4s4f4UHrk1f7PMbZpnBaqzkEXMiaAIifQzfwqNZ2e+KPSE99nArGq7XvlQwGXB99xearY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtW6/Z94; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtW6/Z94"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-25d75ead52fso3007663fac.1
        for <oe-kbuild@lists.linux.dev>; Tue, 02 Jul 2024 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719945390; x=1720550190; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/89gqYHuk2tlOuHq2oXU0SYerOn3naQLyoMdk2Jyu4=;
        b=TtW6/Z94+FWnz3vo9HK0zxkQAdgf2UqlPXn5Uwmxva2219wPBFwmeFFi2wOJCgplRt
         HU30DJlIfug9bu34R7/IcBi4RFrds+4Nag9Rd1ZdGXgikeKF0kNregRV3YoIf9e5B0i2
         UtiaUJE/0euZROlM3N+SP6t5Xxr+7J7DNOlxtXK11jtFLiUKWm3ZFV4HPmuRAQ6FDWZs
         xQlp/VdFkHP++AA2dRpC1ueVLJc2aiNlNh9/GpGNp69bh2a4agWygFiH3td4ACGbSgB6
         kdEsdaZq5y+56aYPvP3PVjyvztq4+yge3s0wfzcuXLJJjs0MjRp8IoNYWlMGWYPGboKo
         yKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719945390; x=1720550190;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/89gqYHuk2tlOuHq2oXU0SYerOn3naQLyoMdk2Jyu4=;
        b=dYFVL8A7mRYEQalSyL1g1CQfwGJSMeoY8YcrF940nnNEZympz6xAu3nvZY7tts3ksd
         4I0aODCQpepuswM2nTiIjxIWF1jr/255tRUoIGHm5DBlpCx2B1KZlTp3X67hFXJE+0aU
         hUIgnrju3yqsLZDd1Rr8AINcZkjxkbxl9Abx+NbSBCvzLAwHt/973JSD30VI6vR/QrXw
         TFhf8FbT/NFq4H7NUbLiQLRLGPvUgP7W29f+cUgFrqpLi8ctz0kGclwAA20m37qY6u3w
         H4nQNP7xfk4NsoJIC+0ShsPI18COzYbrJbjHiSgvxIdI/nzn3zuOC4sZeS3AgdescHUG
         14Xw==
X-Gm-Message-State: AOJu0YywHWF5YD64zo8t+ix5ofMpCfWcCYp83oEWK9zwK1ke2EJMG+FE
	fYiQn9oUt585qbxjAlug/MPW/2cEpPGL0xFJOowU2OAiVkbbdqfuo6g1OCJeP+cHuGUrW6WkmSS
	O
X-Google-Smtp-Source: AGHT+IHJOEgNGkBu9pOwp5YSlnhNoGJhXVmSa08oeKGD6qGPlmLDhJjmsBU3rexANJRDpVuuQGJlGA==
X-Received: by 2002:a05:6870:f111:b0:254:b6f2:de86 with SMTP id 586e51a60fabf-25db24b976amr4651856fac.11.1719945389191;
        Tue, 02 Jul 2024 11:36:29 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25d8e384209sm2310860fac.53.2024.07.02.11.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 11:36:28 -0700 (PDT)
Date: Tue, 2 Jul 2024 20:36:26 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 3/4] drivers/ufs/core/ufs-mcq.c:293
 ufshcd_mcq_poll_cqe_nolock() error: we previously assumed 'compl_cmd' could
 be null (see line 292)
Message-ID: <6c19ca3b-11b8-420f-927b-fa50559fc420@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   2447b4c0a5ca8efd6579d4a168103269dfac1866
commit: 8563ce58954679187f0c269a504520d8def37e41 [3/4] BACKPORT: FROMLIST: scsi: ufs: Make the polling code report which command has been completed
config: i386-randconfig-141-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030103.OwiRiX9t-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407030103.OwiRiX9t-lkp@intel.com/

smatch warnings:
drivers/ufs/core/ufs-mcq.c:293 ufshcd_mcq_poll_cqe_nolock() error: we previously assumed 'compl_cmd' could be null (see line 292)

vim +/compl_cmd +293 drivers/ufs/core/ufs-mcq.c

31fe4a16211a23 Asutosh Das     2023-01-13  283  unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
8563ce58954679 Bart Van Assche 2024-04-11  284  					 struct ufs_hw_queue *hwq,
8563ce58954679 Bart Van Assche 2024-04-11  285  					 struct scsi_cmnd **compl_cmd)
31fe4a16211a23 Asutosh Das     2023-01-13  286  {
31fe4a16211a23 Asutosh Das     2023-01-13  287  	unsigned long completed_reqs = 0;
31fe4a16211a23 Asutosh Das     2023-01-13  288  
31fe4a16211a23 Asutosh Das     2023-01-13  289  	ufshcd_mcq_update_cq_tail_slot(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  290  	while (!ufshcd_mcq_is_cq_empty(hwq)) {
8563ce58954679 Bart Van Assche 2024-04-11  291  		if (ufshcd_mcq_process_cqe(hba, hwq,
8563ce58954679 Bart Van Assche 2024-04-11 @292  					   compl_cmd ? *compl_cmd : NULL))
                                                                                           ^^^^^^^^^
This line assumes assumes compl_cmd can be NULL

8563ce58954679 Bart Van Assche 2024-04-11 @293  			*compl_cmd = NULL;
                                                                        ^^^^^^^^^^
Unchecked derereference.  Although it could be false positive if
ufshcd_mcq_process_cqe() only returns true for non-NULL.

31fe4a16211a23 Asutosh Das     2023-01-13  294  		ufshcd_mcq_inc_cq_head_slot(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  295  		completed_reqs++;
31fe4a16211a23 Asutosh Das     2023-01-13  296  	}
31fe4a16211a23 Asutosh Das     2023-01-13  297  
31fe4a16211a23 Asutosh Das     2023-01-13  298  	if (completed_reqs)
31fe4a16211a23 Asutosh Das     2023-01-13  299  		ufshcd_mcq_update_cq_head(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  300  
31fe4a16211a23 Asutosh Das     2023-01-13  301  	return completed_reqs;
31fe4a16211a23 Asutosh Das     2023-01-13  302  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

