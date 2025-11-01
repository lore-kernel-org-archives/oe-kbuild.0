Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB37269D17
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762017163; cv=none; b=BcqvP0CWe9PvIMHni2D8O4BKtKckQhUbV4fzomLDEgtaKN2DxYdszM0iubfbkowrEBZNH/N/3DKUhMMYQ68zbUzKC32gvi8ks1GdTLULbEEH4ETBScN/HfiTTAC0P6UHDkhlz0fci3doswwaTlQBOy55/H4i79sO8jxgoFvOoaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762017163; c=relaxed/simple;
	bh=DyINKo0/YhKkpS7w4FALHV7Q/e/QT/TgdizweYFgq2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W38bdSbfr7X1HJjdcH9puslFOXZHOvjnZB5FTEVlmiRWU8WFAenBrH+GB9wFQBx7oZ4z2LI1HW8eI7+9BcsZPWVih51IFKUKHo2qd53FphlTWToD7SKb5ghlqylKWpHK1mhtT133C7WHqE9CgmK1bhgUTYOkm48kdjaOpumpyOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKQgGa7a; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKQgGa7a"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429c8632fcbso329764f8f.1
        for <oe-kbuild@lists.linux.dev>; Sat, 01 Nov 2025 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762017160; x=1762621960; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvWsBmCdH58+zYk8ZHfU1SN4734pPMBJNCa1nK1eTy4=;
        b=DKQgGa7aHkis15i2sCq3zz0CRR7Oi9Jjh94Q+flVrQmLVmxyBIznku5NEkv6QTXewe
         trnTxCZ3AcclYUiEbU5l1QdOYgSbHRDSUaMNj2oS9A1RlWz0oLjBQNnkxISerPg4YZtB
         ausYKXTZsqVmkwvtG5ElqgIITkhJTtCaAQ7w65GoiDNcktllQjQaCY7SY/SeEaY31jUn
         TIMRMEyYNVo60s9Qev0UH2XAGuVopTi0AxlPWALNZHLgctR3vABhK5fbIPRD+U8h5DSN
         XiyBlirREW6W0y9kVxPS/n6mdaJC8K3ZjGKcQT921M7XrXIB/7T5O4lhIM001qycSLX6
         QwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762017160; x=1762621960;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvWsBmCdH58+zYk8ZHfU1SN4734pPMBJNCa1nK1eTy4=;
        b=oCHP192mCNkD+nLsoMs0YNKi/vIZ7iXiPcSxLXAiFy6z4EhFaq9JHozkxbr5sqyES5
         y9z7xXByBojWpv9R5l/ZSiuR3XWkaFSWyuSgLScVIADoc1ZfhpekztH8s/V5GgOjgrBZ
         H4o5vAlvvm2oLXGgPBb/trp5Gm/XE9WfxqOf/daDzninh6/ftD/suhs4XANtmMdfHx11
         /f45EseuI5oJ2b5rM9e6LkupHUtlBtxkjigkah4L/SFC85XI10P6VfhjdTQY6jCm52IB
         A/qyaCAS2aIw2huVyvbVvstP/x9eEMWJCR7zLAqma0JWbY62oSnnqOZhg5EX6tgk02cH
         qQ6A==
X-Gm-Message-State: AOJu0Yx7Qid5r+CDR6ZfjZ24k7Jv9kd14TX0IJ69DmqG+/Q+/OIrMhfW
	2AC8a1pMaDAorm8s83K6XushG01pLfjXbjqKZ+1tQUMXx1v/sIlD8JSboP2vxW3hxZF3aAlfbrh
	uY8Gv
X-Gm-Gg: ASbGnctQK05lWndmDplyOwCfEsGZkjqVPfz4v5bXx8sLWfxxVTZFA9YDfYQ3O7K37pn
	Nz2iVLIK5vD6JmBeBrpoD60FRxazS9GyjFhG/BindNOtDyzRIUrABdGpe2//IvduuVKvdSTTXCU
	qvFDtA0vwu+odjjiZIaKzjJHLj8u238GhgpVw8bCsFvL8b72DGYUBYVm2/y4/B6W1peNSFKn7WA
	iTbCoaxWrL+nq6VU+oX4aJjmZAFp58usAR//auyIA8eSHC2zuQBPUJ21Q6hVllwIWSPhZj7OuEy
	76mCLngGNKDalYwTI2n9S/3OmeI45fNlzQdDjj/KgCiMKPPghldBcW3hp3EJlqEBgScVSloP/V6
	xpGDcN4if4Z7DUg/YQwd9EvXjXEHqnTi+S6t9KD5bMOOKzByJW1HjWYghhOP+PN0PqpZFEuB4H9
	iwHPw/xTZqyfTzIuLF
X-Google-Smtp-Source: AGHT+IFszts67rjuc+tAypA5oGV+Ow5/fn6H7/oMZqJjYkvzSnkBEM/NgpDq4zQAGXmVfaip/KC1yw==
X-Received: by 2002:a05:6000:1841:b0:425:7e38:419f with SMTP id ffacd0b85a97d-429bd68876cmr6663084f8f.16.1762017159777;
        Sat, 01 Nov 2025 10:12:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c1125ad0sm10230829f8f.13.2025.11.01.10.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 10:12:39 -0700 (PDT)
Date: Sat, 1 Nov 2025 20:12:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 9/17] net/vmw_vsock/af_vsock.c:2164
 vsock_connectible_sendmsg() warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202511011754.hK4vDkZ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251101171235.CO-uBVtwCazvtzNlTsNmpltUfSWXK-AEwjCw7N7wRwM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   cdc52122313863bdce40a9403e5ccf7ca915fc36
commit: 49768ad0eb9d67ed71368ca9295185dd000674a1 [9/17] vsock: Add memory sharing support
config: powerpc-randconfig-r071-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011754.hK4vDkZ2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511011754.hK4vDkZ2-lkp@intel.com/

smatch warnings:
net/vmw_vsock/af_vsock.c:2164 vsock_connectible_sendmsg() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +2164 net/vmw_vsock/af_vsock.c

49768ad0eb9d67 Viresh Kumar       2025-10-15  2156  					/* Token used previously ? */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2157  					if (old)
49768ad0eb9d67 Viresh Kumar       2025-10-15  2158  						fput(old);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2159  				} else {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2160  					/* The fd must belong to a dma-buf */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2161  					struct dma_buf *dbuf = dma_buf_get(fd);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2162  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2163  					if (IS_ERR(dbuf) || !dbuf->ops->shmem) {
49768ad0eb9d67 Viresh Kumar       2025-10-15 @2164  						err = PTR_ERR(dbuf);

Imagine dbuf->ops->shmem is NULL, then dbug would be a valid pointer
so we can't pass it to PTR_ERR().

49768ad0eb9d67 Viresh Kumar       2025-10-15  2165  						goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2166  					}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2167  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2168  					err = dbuf->ops->shmem(dbuf, &desc);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2169  					if (err)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

