Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED68C3DB633
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748454; cv=none; b=TQvLGzMXU8AR43Q3g6ltsmkHEuwlTDo1wXDwhvOmtJ9nIaiY2Din6RKBIV30F7JNa16+MJXZ8njBJnLR1LTyT/AcQnblf/pPFfDnw9jTg63QQZZmE8L00XliZAtRtJ7NUa8dkSgufLulQc6YwnFmSXjZnuGruNwXkOePO2QxRag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748454; c=relaxed/simple;
	bh=/M4O9MdEk7wkh/g9A5rB6DDLkw3Hh00ADHbqT+hBwrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fz1/KIqiBiwpwMz+DX4hkgUm757WeyVo4n2YgeOTPezibn8dtLPhkh5NxwKL6QN5cCPM+9HqFpvTbjF6aL4qZxSLArO9st2qvC8hDatn+YV3cmt1RC04H/68mbffqr/laXmTKJ9fazm+Uf5hConQ7xi86VXtE/rQ+P7uI9rPzCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSX5+jMf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSX5+jMf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44b052142e1so4331642f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778748449; x=1779353249; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FruKmvkekS8OQpchFD41wcI4xO6AhYjyTf5iNxETto0=;
        b=LSX5+jMf+t39KdBB4ErqpSwQSvQjNo8j+771kJ6QggS0MAwCvYCBFiZVLuMFeaeQXS
         06IUtCCIzDTbs5kUl72UwLYo3FGaOg3eiYFztrPGpUwnicMdi0YWZpzF2eFD7+vVNDQ/
         IuBivhfAX9RksqAkDahXI7ZBMVaOUNqY9S5Ai+WC6ChGTogzbUzI6sRQ5BUzqy6rW0/N
         oHUQV0aB2SvzJk0QmcL88EZ5+9ZCN4Jjdd7wjpFRUsC2X/AQFZYXla3gwDTU6zp/DtRR
         Uve61jtmRfSuJElIjJuex9qasbubhg/2n8hN44IcuMkbx8hhJXSQ+jsRyYmD4ZBb7rER
         0j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778748449; x=1779353249;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FruKmvkekS8OQpchFD41wcI4xO6AhYjyTf5iNxETto0=;
        b=Ng9GiQ5zvYPotlhdgCYHVx4W9Q0vS1UTkMTcB6B3wqu/sEkUyWSfCvBfY8x337NPq6
         tGXbG6eIvyusKT/wyN5cFf9RshVbVoTtCpFnIENLFTk2FQ1oIPFi5TVNOEPA+g8p5B5t
         zcXjAnJlcqz6s9MDrcvUvkoQyQmbsc3JqyzacHIbn6msytKnn9v6GI2G7Ikor2DvwsvS
         XJ8+6DtbW3HW6Ao48aJg5UHe0j9LMusPxAn7/ExBZo/5Ywqlh6P2sN8nR1nzGClJZDvU
         WLtHEWqF2+Vi95iP8eyAnC06i6YbesHw3o8U7nr47ajPk6gnncLgkyjFM6Ei53vDB0lv
         V1dA==
X-Gm-Message-State: AOJu0YwFe22/RjFjh3/+y6lU7VamkLoh/bZ4UTB8dofWKKSntOBA3BI9
	qkmtd8A4b3xqTrF5hAjVtnU29Qr2g2ifPoFYc/4qsh/FJoinkaiv4gHzgx09aw==
X-Gm-Gg: Acq92OFyvqVAw4M6UgojUPTZ/KPdAbgvnzYy6Oo0DrGpgijJLzv7Lx4Xt3hmVc084Ju
	nJchylplLFtPn0+V+IHGoitFUttviULRFyp4WUZTuYCLZVYLIQYPiTf+ECnBJozdCElKiuVS6D5
	VO7BScSz3OLKXGIKIxAZiDckB1Qis19GObYm2vmt4ksb2kz0PFzQ7hzwv7ntHKeTMpC5IvmHymt
	OZ9C1Hc4U/OwbsIEwOZNMKr2c4GhveJO9r8FK/VRyq2Bm3/qY0xkeQBrFXBMsCt54TWQ8MQ4cBJ
	KaKCg8rJx/bDc4wYL8bgcFt6jSUMSTuabK2qSfzR3CH0esHfUJu+qYRMHdhli+xoAMOw4LjX2CX
	ZgQTAHYbaMqPXuKR2Dchr7EspA3lMz4Gp1IPWGl+sRy76SsLqJxH2y+8MFZMqfbymv7oOIpQQyg
	pv3cHrcXc7fgUPhqjrknE=
X-Received: by 2002:a05:6000:24c3:b0:45b:d891:4ef1 with SMTP id ffacd0b85a97d-45c597030d7mr10665791f8f.34.1778748449454;
        Thu, 14 May 2026 01:47:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm5181999f8f.5.2026.05.14.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:47:28 -0700 (PDT)
Date: Thu, 14 May 2026 11:47:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Joshua Hay <joshua.a.hay@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Madhu Chittim <madhu.chittim@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>
Subject: drivers/net/ethernet/intel/idpf/idpf_idc.c:93
 idpf_plug_core_aux_dev() error: dereferencing freed memory 'adev' (line 75)
Message-ID: <202605141659.ITAp29HS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260514084725.-Wc0WL8jyPXKCdK-LN3BOYTCyRB7ih0wg8E3jvyuJlA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: f4312e6bfa2a98e94dacc75f96f916b76bdf4259 idpf: implement core RDMA auxiliary dev create, init, and destroy
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141659.ITAp29HS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4312e6bfa2a ("idpf: implement core RDMA auxiliary dev create, init, and destroy")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141659.ITAp29HS-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_idc.c:93 idpf_plug_core_aux_dev() error: dereferencing freed memory 'adev' (line 75)

vim +/adev +93 drivers/net/ethernet/intel/idpf/idpf_idc.c

f4312e6bfa2a98 Joshua Hay 2025-07-08   54  static int idpf_plug_core_aux_dev(struct iidc_rdma_core_dev_info *cdev_info)
f4312e6bfa2a98 Joshua Hay 2025-07-08   55  {
f4312e6bfa2a98 Joshua Hay 2025-07-08   56  	struct iidc_rdma_core_auxiliary_dev *iadev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   57  	char name[IDPF_IDC_MAX_ADEV_NAME_LEN];
f4312e6bfa2a98 Joshua Hay 2025-07-08   58  	struct auxiliary_device *adev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   59  	int ret;
f4312e6bfa2a98 Joshua Hay 2025-07-08   60  
f4312e6bfa2a98 Joshua Hay 2025-07-08   61  	iadev = kzalloc(sizeof(*iadev), GFP_KERNEL);
f4312e6bfa2a98 Joshua Hay 2025-07-08   62  	if (!iadev)
f4312e6bfa2a98 Joshua Hay 2025-07-08   63  		return -ENOMEM;
f4312e6bfa2a98 Joshua Hay 2025-07-08   64  
f4312e6bfa2a98 Joshua Hay 2025-07-08   65  	adev = &iadev->adev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   66  	cdev_info->adev = adev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   67  	iadev->cdev_info = cdev_info;
f4312e6bfa2a98 Joshua Hay 2025-07-08   68  
f4312e6bfa2a98 Joshua Hay 2025-07-08   69  	ret = ida_alloc(&idpf_idc_ida, GFP_KERNEL);
f4312e6bfa2a98 Joshua Hay 2025-07-08   70  	if (ret < 0) {
f4312e6bfa2a98 Joshua Hay 2025-07-08   71  		pr_err("failed to allocate unique device ID for Auxiliary driver\n");
f4312e6bfa2a98 Joshua Hay 2025-07-08   72  		goto err_ida_alloc;
f4312e6bfa2a98 Joshua Hay 2025-07-08   73  	}
f4312e6bfa2a98 Joshua Hay 2025-07-08   74  	adev->id = ret;
f4312e6bfa2a98 Joshua Hay 2025-07-08  @75  	adev->dev.release = idpf_core_adev_release;
f4312e6bfa2a98 Joshua Hay 2025-07-08   76  	adev->dev.parent = &cdev_info->pdev->dev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   77  	sprintf(name, "%04x.rdma.core", cdev_info->pdev->vendor);
f4312e6bfa2a98 Joshua Hay 2025-07-08   78  	adev->name = name;
f4312e6bfa2a98 Joshua Hay 2025-07-08   79  
f4312e6bfa2a98 Joshua Hay 2025-07-08   80  	ret = auxiliary_device_init(adev);
f4312e6bfa2a98 Joshua Hay 2025-07-08   81  	if (ret)
f4312e6bfa2a98 Joshua Hay 2025-07-08   82  		goto err_aux_dev_init;
f4312e6bfa2a98 Joshua Hay 2025-07-08   83  
f4312e6bfa2a98 Joshua Hay 2025-07-08   84  	ret = auxiliary_device_add(adev);
f4312e6bfa2a98 Joshua Hay 2025-07-08   85  	if (ret)
f4312e6bfa2a98 Joshua Hay 2025-07-08   86  		goto err_aux_dev_add;
f4312e6bfa2a98 Joshua Hay 2025-07-08   87  
f4312e6bfa2a98 Joshua Hay 2025-07-08   88  	return 0;
f4312e6bfa2a98 Joshua Hay 2025-07-08   89  
f4312e6bfa2a98 Joshua Hay 2025-07-08   90  err_aux_dev_add:
f4312e6bfa2a98 Joshua Hay 2025-07-08   91  	auxiliary_device_uninit(adev);
f4312e6bfa2a98 Joshua Hay 2025-07-08   92  err_aux_dev_init:
f4312e6bfa2a98 Joshua Hay 2025-07-08  @93  	ida_free(&idpf_idc_ida, adev->id);
                                                                        ^^^^^^^^^
I could have sworn I saw patches to fix this use after free months ago
but it's still a bug in net-next.  idpf_core_adev_release() frees iadev
and adev is a to inside iadev.

f4312e6bfa2a98 Joshua Hay 2025-07-08   94  err_ida_alloc:
f4312e6bfa2a98 Joshua Hay 2025-07-08   95  	cdev_info->adev = NULL;
f4312e6bfa2a98 Joshua Hay 2025-07-08   96  	kfree(iadev);
f4312e6bfa2a98 Joshua Hay 2025-07-08   97  
f4312e6bfa2a98 Joshua Hay 2025-07-08   98  	return ret;
f4312e6bfa2a98 Joshua Hay 2025-07-08   99  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

