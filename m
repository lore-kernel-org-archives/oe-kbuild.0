Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FEE1E51E0
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345822; cv=none; b=UE4VQnn2u4jIucMqRp6loUgV9+d7MpnN4Nw5CwbQK7jaS2i7vqG5cNyQDhuSMzoiDrYKE+DFZ/aXHPbM+XZcnKjczDeQ8FhFsbzIsdkIdQYCnH1j2lR68HhlJAJRa7URjmvlHnZapOYkgtedMkLKIx7RXZ1i0aEz2SDke10S6mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345822; c=relaxed/simple;
	bh=i1or7lfYrJasdzUBDU2CYmfBqBXRiW6aszut76YN7VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3oCvBQI5h4S1lvY8BNK3FUlofnPQ1y2tlpfSy+QrH7Vb8VYLaLXt+qfDrkb1N4sDei2Cb50gzXyCyK/htsDPWIU/xtbZxa+01YVykywy0PL8UOdtR+hpDhCUMbony6h1hyGkrCacMjL/5iM0z7AlIp84Osnne4wJRWLtkOq/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meyasEPH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meyasEPH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso50264535e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 23:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779345819; x=1779950619; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0nk0X5ql1Aa+Eq592qHsNAZpmf5nSU6Z+1lKWyV7hY=;
        b=meyasEPHCxCzj4+gPFsg69mLWoBd35Mwbv7F+15xfOTs/dZs/x1I8lJjv+om2/wmJA
         ydibl/oywVsrySy/deoojtE8gbQmfIjGR11QXuupOGgAHbvwOpKqg4WgR4oYgChmhyBU
         2ZGgXUsUDSJhOfGmdpcxQ7+zDNOudq/MS1Dx+tjUGou7jYxtOR7FDfSyQn/7Ip0+f4SU
         GTkvEKBpicDoOjPUZVf/Grqv/taSVEQZe4+9DDg0szr78EC88bpkhIuNGCydtRIq6esk
         0hfEQB6uh6jhH79f0JMckocAdAh0tB7SEARD1+8TJiZO/3vwWjW5MTYqy6/KJuQo35iL
         yrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345819; x=1779950619;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0nk0X5ql1Aa+Eq592qHsNAZpmf5nSU6Z+1lKWyV7hY=;
        b=bDehGikLF08X1okiFSOmiKZ17xR9iBNVhmZP0e4DlRVTBAUla2ocAZ1NE4fvKpHaLh
         3UfHbliAv9L9Gm89ee5w+/Unh2N90BErKBXXS16xLAKaXgsxi769VNOHi7NSWrwu9Qt8
         yPklm3Ps2H/fYKUIJuu6d7JO5a8QQyA6lsySytr7RrboeRHHBiJWnqR9HnwQNjDf4oN1
         F7ee2GIAdcQ6MH/cUzTtofKYYKpAkIEPv39Ca1LRU5zY8a8c4gocyufDnKzlymXNzLOn
         0NXwZABJYX2RQSmmDrSJhSPrR/G9JzESAg+36vOF0EImr/MvxPcnmYmDLCBLomSTw085
         9Yvw==
X-Gm-Message-State: AOJu0YzWujfVCnFkogN+uv1NDJl3Pn/BN2Mzk+cfW7dSzeyKBTbvj1tw
	uXXAGFx02NUiA6wSvfR2HzhDow9y/Q8II1mOA8fvl7EMTWN6i+6v1z8h0JVgUw==
X-Gm-Gg: Acq92OFXbjk3nT72sGD6ELcXtehX3sa05r2ZglfX15yPbM3yo0cbasRFm9EAkwBjY2K
	Lj9nqOhwSOCrvWpNtrUbyd9PSR9PlGcpWz7IlWWoQYyhkT3EtxEZW7C5Srbk7TIbi1cALFnJLtW
	uuDlFIXIl1m9uTIh8LZ6ltggqr1FksNI0di8dGUM/5oI74k8pyxtVC8E7T9UHae2o5p6Fbqaf4o
	HjOzlXmx4CtFXhweVu+vrNrDU+eBlWlDPXF/bat7uzY018ODeohXYYdJSvUq/runi/cnpOP2YiL
	OOFTg1lKjgPkwjEx/ApgKkBFvQ72Brg4AxIL+JigQ4A5LvTcxXUTohhtPifVGukGsoOZJzrangr
	l4ISSyX4hMe+9I43JuUs9zLrEnIxZOGRoGZ7VrV3ZLpKYIPWAmkTHcwhHX3LdfjbLyd9GNwlbzO
	O35ttdf8upmgEakoVPIHNgdIP7sIf3FDqT8g==
X-Received: by 2002:a05:600d:10:b0:48f:cfae:b654 with SMTP id 5b1f17b1804b1-490360340e5mr16868235e9.1.1779345819287;
        Wed, 20 May 2026 23:43:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm45607445e9.11.2026.05.20.23.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:43:38 -0700 (PDT)
Date: Thu, 21 May 2026 09:43:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Maurizio Lombardi <mlombard@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
	Daniel Wagner <dwagner@suse.de>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Hannes Reinecke <hare@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-7.2 2/7] drivers/nvme/host/core.c:5259
 nvme_wait_freeze_timeout() warn: 'timeout' unsigned <= 0
Message-ID: <202605211257.STzj2Ujv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260521064335.EQOlv5eSKCA65D5TErM8OijF-8RjqZ_QbPDKeLcAkGw@z>

tree:   git://git.infradead.org/nvme.git nvme-7.2
head:   00d7b33351aac0ea55d17167561e12bbeca73138
commit: 23b6d2cbf75ff15647efbb7c0e5c03bd7ed1fe1a [2/7] nvme: remove redundant timeout argument from nvme_wait_freeze_timeout
config: s390-randconfig-r073-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211257.STzj2Ujv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605211257.STzj2Ujv-lkp@intel.com/

smatch warnings:
drivers/nvme/host/core.c:5259 nvme_wait_freeze_timeout() warn: 'timeout' unsigned <= 0

vim +/timeout +5259 drivers/nvme/host/core.c

23b6d2cbf75ff15 Maurizio Lombardi 2026-05-14  5249  int nvme_wait_freeze_timeout(struct nvme_ctrl *ctrl)
302ad8cc09339ea Keith Busch       2017-03-01  5250  {
23b6d2cbf75ff15 Maurizio Lombardi 2026-05-14  5251  	unsigned long timeout = NVME_IO_TIMEOUT;
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is unsigned.  NVME_IO_TIMEOUT is 30 * HZ.  Can the &ctrl->namespaces
list ever be empty?

302ad8cc09339ea Keith Busch       2017-03-01  5252  	struct nvme_ns *ns;
be647e2c76b27f4 Keith Busch       2024-05-21  5253  	int srcu_idx;
302ad8cc09339ea Keith Busch       2017-03-01  5254  
be647e2c76b27f4 Keith Busch       2024-05-21  5255  	srcu_idx = srcu_read_lock(&ctrl->srcu);
6d1c69945ce63a9 Breno Leitao      2024-11-04  5256  	list_for_each_entry_srcu(ns, &ctrl->namespaces, list,
6d1c69945ce63a9 Breno Leitao      2024-11-04  5257  				 srcu_read_lock_held(&ctrl->srcu)) {
302ad8cc09339ea Keith Busch       2017-03-01  5258  		timeout = blk_mq_freeze_queue_wait_timeout(ns->queue, timeout);
302ad8cc09339ea Keith Busch       2017-03-01 @5259  		if (timeout <= 0)

blk_mq_freeze_queue_wait_timeout() returns 0 on timeout and >= 1 on
success.

302ad8cc09339ea Keith Busch       2017-03-01  5260  			break;
302ad8cc09339ea Keith Busch       2017-03-01  5261  	}
be647e2c76b27f4 Keith Busch       2024-05-21  5262  	srcu_read_unlock(&ctrl->srcu, srcu_idx);
7cf0d7c0f3c3b02 Sagi Grimberg     2020-07-30  5263  	return timeout;

This returns is nonsense.  ;)  >= 1 on success or empty.  0 on timeout.

302ad8cc09339ea Keith Busch       2017-03-01  5264  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

