Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BAE36B063
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 07:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773820030; cv=none; b=B2TXjbjzdslIG843LWkaKPZ7gborxkPcuBjU5mV4NB+5e8m3q3zAfKf1UBEc5pMdWRTGKtKYe+xLz3AD1QJJ0AxRIaXL3W9KIUjXI9TKH5gEAlBJaon73uLHZvKgDH8NjHxfEUxNukz2t9XFLt9uBDLtC/zCksdpsGHgbgcqZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773820030; c=relaxed/simple;
	bh=6AyM+5lJ+dSs+SjiqVmcLVaC5WWE37JafHboRqppUoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kOhNFOaEWoWWBCxIR2Dwkuc766gY2KaWKluTX9gDfOfMUh9PSbry9np7EglKAOQLxfGVC/QkLHdA2FoCpFHcw2r+TYA1DlI0nAC8g0qK9vr4DXrmMkOSl4wf74iiyIt0jRoezL/rjdigpIMTPa0F/rOb8xVrB/9WJogIX2t2j0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZfBR36N2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZfBR36N2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486507134e4so18056635e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 00:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773820027; x=1774424827; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XdQh/lG6wJGknLC6Mk9SsT+zVzn0gaCcGpcDHBd/XtU=;
        b=ZfBR36N2gDdIS6JtuXuHeZix1uAUzO6do5Vp1n5CtHJnZGNRWSScaWiBIoK/qOLJI1
         4vV+5/GDrQjUppJMC4r7Ck3c2ZErFVLKNBF8dcK1rw+AXc/ZOPJragEbssLXsUQEcsHT
         zQorRnPdkWh9DO7VRHCzK689x1zAsYZ+z6efitdsx1VHxwGDjGYrNbl91DK0CKPyTlcg
         grXMOQO8pHqa32PDls2ptSAu7o5WXbpvYGDx88F/uU/v/Ygavchy+y/c2DZt3YiHzVfP
         IPVDsO0aglEOCt+hVrbRFa3zBdT9cxE3fIiwjv5knH0iRx3nSAaa3LyJNLpVyiq2xF8D
         YG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773820027; x=1774424827;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdQh/lG6wJGknLC6Mk9SsT+zVzn0gaCcGpcDHBd/XtU=;
        b=KXFiz6M1Cz4FK4KzSTVspNfhqtom71jKxMA+S6ci2b8LFD/KREL9Psc0I4rbjXHiCD
         WSxMksi4G/nWS73kz61EmX9nfHgmknk1JTVfIA3nqzYiahszjdw2+bApoZDRoPE0wb1f
         fKqHMQAr91wMi+WaGRiSvkuc6aaHKXZhLErORwtU//8HvXTgSMboi+0DOyrVYHoF+4j+
         D/iCVt8B+d3CoxLFElupYzniIgTp6Zed6eoWoYJHyYcItMuTXc3Fb3KuKuRVuBEIAvw6
         gr8j0+4VypBfKVNJydOQ2DjAhWWzZbEP+YDWlICKCGDEexrIm+CP7XbceZrcpwrq+UV9
         URQQ==
X-Gm-Message-State: AOJu0YyNNGRsb1vn+KU506tvOu4Pa6KZPUn7qVV73646o+xV2YUsJP67
	IFv5QUVjcOFAnA09fP1po6Wcr4Nqm3U2QREcQal7yL9fF4TAjCW+uHMvzRMIEYGVN3fDkcsKGCT
	+7dSt
X-Gm-Gg: ATEYQzyPauQwUOUrl69ClceAK4rqG6ZRajqHj5hiztJzOpYREu2e/sncOCxI9Sf1Xkd
	2zzaqhrCRddDuywkozwPfO2oNyT9/2if+mfSYL6V6eAsq2Z0ZYLM74xpaBPMqGJ4iUVSyJvfQFy
	YelZ6aySVPYb7vyyYwKYgtdtzsDMFvLvkkfJni3+GXLyopUKpIP6JafzuyUM9tdxRxX9LbPDxOL
	3tinODqbinyRMGG344oaBi6iZpiJglWAm5FqrdG6kSCsimh2Z7mF+Oex1t+f2o5JF4BbVP24kVc
	brj7VVQYvOoIxYQLY1BuJZiZs1mwekyoTv0KJJEWkhLcTFbeQv2I+AAe2Dz9pvyxCi+KxPxmh2j
	7vKDLBQWocK4DvC1ZmQZVIKQ1Z5H2skjxef6/tFkBU/gdA6A6aHSEy3Z2rrp1tscwAeyKRcmrmg
	/gCgwnVPioW6l0gtxs5z0UmrzxfVJbvqSe0LX6zvo=
X-Received: by 2002:a05:600c:c491:b0:485:3f58:d9f with SMTP id 5b1f17b1804b1-486f4465d04mr38125605e9.30.1773820026579;
        Wed, 18 Mar 2026 00:47:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fad1sm216587555e9.1.2026.03.18.00.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:47:06 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:47:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Rahul Gupta <rahul-rg.gupta@broadcom.com>,
	Ajit Kumar Khaparde <ajit.khaparde@broadcom.com>
Subject: Re: [PATCH net-next v6 06/10] bng_en: add HW stats infra and
 structured ethtool ops
Message-ID: <202603180509.nOQGZrG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310144044.21672-7-bhargava.marreddy@broadcom.com>
Message-ID: <20260318074703.vJ4mhepuQd-MDYPthQrsrHiNvd5-XPrU40F91KTJk7w@z>

Hi Bhargava,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bhargava-Marreddy/bng_en-add-per-PF-workqueue-timer-and-slow-path-task/20260310-231948
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260310144044.21672-7-bhargava.marreddy%40broadcom.com
patch subject: [PATCH net-next v6 06/10] bng_en: add HW stats infra and structured ethtool ops
config: arm64-randconfig-r071-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180509.nOQGZrG0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603180509.nOQGZrG0-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c:1598 bnge_hwrm_port_qstats_ext() warn: missing error code? 'rc'

vim +/rc +1598 drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c

598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1576  	rc = bnge_hwrm_req_init(bd, req_qc, HWRM_QUEUE_PRI2COS_QCFG);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1577  	if (rc)
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1578  		return rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1579  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1580  	req_qc->flags = cpu_to_le32(QUEUE_PRI2COS_QCFG_REQ_FLAGS_IVLAN);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1581  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1582  	resp_qc = bnge_hwrm_req_hold(bd, req_qc);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1583  	rc = bnge_hwrm_req_send(bd, req_qc);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1584  	if (!rc) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1585  		u8 *pri2cos;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1586  		int i, j;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1587  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1588  		pri2cos = &resp_qc->pri0_cos_queue_id;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1589  		for (i = 0; i < 8; i++) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1590  			u8 queue_id = pri2cos[i];
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1591  			u8 queue_idx;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1592  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1593  			/* Per port queue IDs start from 0, 10, 20, etc */
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1594  			queue_idx = queue_id % 10;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1595  			if (queue_idx >= BNGE_MAX_QUEUE) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1596  				bn->pri2cos_valid = false;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1597  				bnge_hwrm_req_drop(bd, req_qc);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10 @1598  				return rc;

return -EINVAL;

598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1599  			}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1600  			for (j = 0; j < bd->max_q; j++) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1601  				if (bd->q_ids[j] == queue_id)
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1602  					bn->pri2cos_idx[i] = queue_idx;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1603  			}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1604  		}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1605  		bn->pri2cos_valid = true;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1606  	}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1607  	bnge_hwrm_req_drop(bd, req_qc);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1608  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1609  	return rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1610  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

