Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3A78F4C
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 05:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742795785; cv=none; b=Nr/rgKkb6eZzRJxY9bhiDItDexT2CI3r6H8X3xeglDzIgEWG6LcWYM2GFKIt2AknIRFM+jrj723r4k+8fEBlJi6EEfTB3T7t++asde7SSSCZ0xOdpf/YIHp/PUQ8lhpROMhNKximGWBjrPNeDnbROUePDhIOyF03aP2yOKeTH64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742795785; c=relaxed/simple;
	bh=5JSzVamqwVRuSFqtBYFlnR125Pl8KQAilfnxXNmC5WU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvtb3PBXyyrb3wMu6ltuMGfRqiT2CSdl6jsKHadctLWfM8bU/f7fN6J3sebitOWfLqoAtyGNclNFVCnX2aI849+IWAG3L21J0IieTv+jOqY6yn3hNOF6GOGE4UhHNLQ28Q18mEDxoMgyWtU1cFV4Q97E24qNowjdfXIDxt6eAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yKeF1ZFx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yKeF1ZFx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39149bccb69so3586741f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 22:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742795782; x=1743400582; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+6pwWa6he3+pCbdopBNUBhXlGjd7OULRaNtIIymoYBA=;
        b=yKeF1ZFxRLN+g2nE2CwG0P/vrm/Xc1oo7hMydEsGfHPm0dWTcAAC26jukUVT+EBeOV
         zZvGWvYnjNXm/qoARzhPNW+Sv+WTRlebmEQVEG1tianZEVKTHpbTaBYiZ3bNdZCNuQ47
         9AuREHRtO5ks9FoLv3Vz7rYfIK7PRoLXCNU2fUEH8TiczjzsWNOINwrFOV86HcNfpqV2
         tbrPV4jbLa+j40N7+MJxHmagYrBboWJwkVnU2bMbPV1WnHH9MNz7IfcA5clOb941O3Vb
         f6HdcbZAc0MV1Fwwu64J9WvJdB8sf0X2wx9ZaI8tSAmYqb9mYU6g5ijVWRMR4N2yE4YW
         CRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742795782; x=1743400582;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6pwWa6he3+pCbdopBNUBhXlGjd7OULRaNtIIymoYBA=;
        b=hGOpupXy5N2p8+ulpPQ9dPqLt9YWGQ9nV8+FB4uFXX5YqaqQrAi7X06Jo5siKQxQ1v
         FqZFUDWe6sJ2JJvv8RcEhYIYix4Irxw6TUnUD2yTLt0BRZNxNm77AMhfNdoeBaMyDey1
         8GnGBJ+EO2Iif5VJgrRr91wCFw7AkpRQW05Q2lGUVJ0TrulKgYSggRqfEd0bpTNNoj0A
         /RU5F2c88s+KrBd5NObMrVv5FGNs/1+e6JFmB3p7R57uw52r6oUJDegGlzhoED7GwnKV
         RqnWRpptEB1GiN+dMCbm2u+53w5VFwlPVoEixw7ixIIvMYtZ2FUdsKBDyhpbjEJGT2fQ
         wKCQ==
X-Gm-Message-State: AOJu0YwstgzAmEVm2nUidU9lAmbk+FEERsQXS/5+zXW+T75MaDMicUY0
	5S3Vd93/sjGOpqPibej0wfUr7fC+lKZph5r618+MruwpjAppzFumdwBRkRHoFp8d7Cb1aNVZvIZ
	ldew=
X-Gm-Gg: ASbGnctDXK6DgiDImcnrREXmkk8xsuoJqXOw1Zi627pkF1yI/+dKgrOw2dJqBk0FXgn
	QhAfC6s5jb/dQY/cFlgJSn7gXRO+xU5zKSxMGt8e0siJnAycyIzH+7G7vHgCb7Tz3Ex5kg1Rnq9
	YO0nW7nhjCtGTYZn/ihMYJRZQaa/OJuh0GTZh+CmbzQ44Ct3IbOXgzjDcfUoR58YF8e91yqoTmF
	0mGqNmUvIfQPisIu3YifnXpXxWFWVRmJGyww7nd1l+MsTAg9yZqfw4FJdm3YDFBFrN9yWL3QgXz
	gs2hLRIDnqitSTqVn5iEeDoWGpXYfpWq+bwkp3J3994CRJNAM2l7ZFqf5o5m
X-Google-Smtp-Source: AGHT+IFgSYd3tGNrLeeNlfYVRBMhd66+rvxqqOD0P6htQBiI/5z9/RxhNR+VV3jG0zn1ovErmXXs1A==
X-Received: by 2002:a05:6000:154a:b0:391:2ba9:4c51 with SMTP id ffacd0b85a97d-3997f939077mr10686121f8f.44.1742795781669;
        Sun, 23 Mar 2025 22:56:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9e6667sm10003439f8f.72.2025.03.23.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 22:56:21 -0700 (PDT)
Date: Mon, 24 Mar 2025 08:56:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 7/21] drivers/virtio/virtio_msg.c:534
 virtio_msg_register() error: we previously assumed 'vmdev' could be null
 (see line 509)
Message-ID: <223a386d-996f-4e6c-88c9-b13e30274cce@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   dd4f28ef237ef9221a468ffabacdaebb282483c4
commit: 0b9cfce02499ff45fc7c387c0cbcdbba91967b4c [7/21] virtio-msg: Add support for FFA based channel bus
config: arm64-randconfig-r071-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230220.eCERpgG9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503230220.eCERpgG9-lkp@intel.com/

smatch warnings:
drivers/virtio/virtio_msg.c:534 virtio_msg_register() error: we previously assumed 'vmdev' could be null (see line 509)
drivers/virtio/virtio_msg.c:534 virtio_msg_register() error: we previously assumed 'vmdev->ops' could be null (see line 509)

vim +/vmdev +534 drivers/virtio/virtio_msg.c

1dea9ff9390f7a Viresh Kumar 2024-08-16  500  int virtio_msg_register(struct virtio_msg_device *vmdev)
1dea9ff9390f7a Viresh Kumar 2024-08-16  501  {
1dea9ff9390f7a Viresh Kumar 2024-08-16  502  	int ret;
1dea9ff9390f7a Viresh Kumar 2024-08-16  503  
1dea9ff9390f7a Viresh Kumar 2024-08-16  504  	/*
1dea9ff9390f7a Viresh Kumar 2024-08-16  505  	 * Field expected to be filled by underlying architecture specific
1dea9ff9390f7a Viresh Kumar 2024-08-16  506  	 * transport layer are vmdev->data (optional), vmdev->ops, and
1dea9ff9390f7a Viresh Kumar 2024-08-16  507  	 * vmdev->vdev.dev.parent.
1dea9ff9390f7a Viresh Kumar 2024-08-16  508  	 */
1dea9ff9390f7a Viresh Kumar 2024-08-16 @509  	if (!vmdev || !vmdev->ops || !vmdev->ops->send) {
1dea9ff9390f7a Viresh Kumar 2024-08-16  510  		ret = -EINVAL;
1dea9ff9390f7a Viresh Kumar 2024-08-16  511  		goto out;

This should be return -EINVAL.  The goto will crash.

1dea9ff9390f7a Viresh Kumar 2024-08-16  512  	}
1dea9ff9390f7a Viresh Kumar 2024-08-16  513  
1dea9ff9390f7a Viresh Kumar 2024-08-16  514  	virtio_msg_async_init(&vmdev->async);
1dea9ff9390f7a Viresh Kumar 2024-08-16  515  	vmdev->vdev.config = &virtio_msg_config_ops;
1dea9ff9390f7a Viresh Kumar 2024-08-16  516  	vmdev->vdev.dev.release = virtio_msg_release_dev;
1dea9ff9390f7a Viresh Kumar 2024-08-16  517  	INIT_LIST_HEAD(&vmdev->virtqueues);
1dea9ff9390f7a Viresh Kumar 2024-08-16  518  	spin_lock_init(&vmdev->lock);
1dea9ff9390f7a Viresh Kumar 2024-08-16  519  
1dea9ff9390f7a Viresh Kumar 2024-08-16  520  	if (vmdev->ops->synchronize_cbs)
1dea9ff9390f7a Viresh Kumar 2024-08-16  521  		virtio_msg_config_ops.synchronize_cbs = vmsg_synchronize_cbs;
1dea9ff9390f7a Viresh Kumar 2024-08-16  522  
1dea9ff9390f7a Viresh Kumar 2024-08-16  523  	ret = vmsg_get_device_info(vmdev);
1dea9ff9390f7a Viresh Kumar 2024-08-16  524  	if (ret)
1dea9ff9390f7a Viresh Kumar 2024-08-16  525  		goto out;
1dea9ff9390f7a Viresh Kumar 2024-08-16  526  
1dea9ff9390f7a Viresh Kumar 2024-08-16  527  	ret = register_virtio_device(&vmdev->vdev);
1dea9ff9390f7a Viresh Kumar 2024-08-16  528  	if (ret)
1dea9ff9390f7a Viresh Kumar 2024-08-16  529  		put_device(&vmdev->vdev.dev);
1dea9ff9390f7a Viresh Kumar 2024-08-16  530  
1dea9ff9390f7a Viresh Kumar 2024-08-16  531  	return ret;
1dea9ff9390f7a Viresh Kumar 2024-08-16  532  
1dea9ff9390f7a Viresh Kumar 2024-08-16  533  out:
1dea9ff9390f7a Viresh Kumar 2024-08-16 @534  	vmdev->ops->release(vmdev);
1dea9ff9390f7a Viresh Kumar 2024-08-16  535  	return ret;
1dea9ff9390f7a Viresh Kumar 2024-08-16  536  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

