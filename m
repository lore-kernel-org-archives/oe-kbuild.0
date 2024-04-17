Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB699146D7F
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713367462; cv=none; b=eUKsNAyB5f2UMg222RP0AXexrjZwCWTlfYNnN+UdJ3EAdg7NPVB5xTaZk21fXrqVsN0Ou5mPO0xHOVET1KrFdilI2+zqFhkuBexbke93cxi1FEJZGyMf/j9ZvX9K/YcGrF+wGS8JhpmuRps6zCp9VHSRsiqyP96CCGzVn76D2os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713367462; c=relaxed/simple;
	bh=wv6TzIexs3gOSYNLydcDjikuOWnq0Lw+6o//JvAaFE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nzu3KakB2YD1qKm+JTqlOdBYxP3b2oT1DFEU3dXumXQFgD3e3TOPqf9mI2SEyic6QHspqO1ldFF6VCbDZlqY74HnTRqciEdUuAlN8tynBzg5xHWb0qOkF0VgE8X9JTX7JRp/bMb55TqNmvgRWCvajz/j+6e99D0IqB/hyNNJ7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qDGffqH7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qDGffqH7"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516db2214e6so7220085e87.1
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713367458; x=1713972258; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0JTVW4GlCOZN1AlXtV9zVy9VXkvFGVMaMHEsnX5OLE=;
        b=qDGffqH76lHKIGlTbfs9/BBoC/vQR5LbQ1HzTKDLNjW6NqyuCvx298wS27WiQLvnN6
         vYHOv9s65xilhVV8CP7Uav7gOW1E5GdoW82A4U23Oqdm81IID9sc14n54iTH/PeM/fYw
         XcmhX3ZKZvAimmtVA0JT9F/6vBgOdt4nbXDpxK4Tv9rhqHh8ORYTjXHFiwDyCTlm2oMq
         7tvjkcPNXhis0XxKErb3T/mcKHNPjrH2OJygbWJ3zviP2Tz0QSbsYX3yWBmp+ZCztAJf
         IwiUylPRpV/BvIYGMSIQ1R4BYPIAPRniUdtnVneGVF5npCSj3Jzqsb8+Zi1HRs7J1bN4
         En5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713367458; x=1713972258;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0JTVW4GlCOZN1AlXtV9zVy9VXkvFGVMaMHEsnX5OLE=;
        b=go4GfbvCRfJS8FIvruI/6oAaLPj3qrW/mkHlSUxvITeLNlK3VeD5iwX0SVh7shGr9B
         mE21wvktVccC2AtbOsFxI/KpnkcWb8FqlNzPH2FbRSO0CmPB0JiuREoEr/6LyPK/L3iK
         V3sOPnA4UrrXm4um3as4B1MR7rQKgzZlQTSyMTJZKPoCbBb2/+bAoka0aOosizfxfJ77
         0XRfAVeVrO4/PpPzvfHuEvTmRVEflI9D4Bhe1RnUGWwtGYcCAE1TublIzGdgh0mcI29b
         9ZS2qr9DO0aoH4nfC86X/LQg3xv8Ehr7M/NEhwUb9MbmB58O41Q4D0nAgVB1UZ6HzWrW
         KDbg==
X-Gm-Message-State: AOJu0YwNeVUTMcukRvgB3Hn2fDYSATOWyx4MOn+E9klhhgvKWCOPKxS5
	SIzEzNVp6t7QAHQYmt4GwktqGEbHsWWMUwqi1OS0qls1l82/AM5wp+Xh2JNPo+rqiqIN8kqOudw
	n
X-Google-Smtp-Source: AGHT+IFgQBi2Xw9wKHUCyJbBXYQp48oCH3X/nexHrDVmbWbgpcrBlr5KOsli0evrQgiutu/jauHOXQ==
X-Received: by 2002:ac2:4e07:0:b0:518:b865:eab4 with SMTP id e7-20020ac24e07000000b00518b865eab4mr9274971lfr.60.1713367458254;
        Wed, 17 Apr 2024 08:24:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bl22-20020a170906c25600b00a522bf06d8fsm7739567ejb.14.2024.04.17.08.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 08:24:17 -0700 (PDT)
Date: Wed, 17 Apr 2024 18:24:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Geetha sowjanya <gakula@marvell.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kuba@kernel.org,
	davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
	sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
	hkelam@marvell.com
Subject: Re: [net-next PATCH 3/9] octeontx2-pf: Create representor netdev
Message-ID: <a55c4d98-030c-420e-b29d-3836e1ce0876@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416050616.6056-4-gakula@marvell.com>

Hi Geetha,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Geetha-sowjanya/octeontx2-pf-Refactoring-RVU-driver/20240416-131052
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240416050616.6056-4-gakula%40marvell.com
patch subject: [net-next PATCH 3/9] octeontx2-pf: Create representor netdev
config: alpha-randconfig-r081-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172208.4REfSKKS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404172208.4REfSKKS-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:170 rvu_rep_create() error: dereferencing freed memory 'ndev'

vim +/ndev +170 drivers/net/ethernet/marvell/octeontx2/nic/rep.c

f9a5b510759eeb Geetha sowjanya 2024-04-16  131  
f9a5b510759eeb Geetha sowjanya 2024-04-16  132  int rvu_rep_create(struct otx2_nic *priv)
f9a5b510759eeb Geetha sowjanya 2024-04-16  133  {
f9a5b510759eeb Geetha sowjanya 2024-04-16  134  	int rep_cnt = priv->rep_cnt;
f9a5b510759eeb Geetha sowjanya 2024-04-16  135  	struct net_device *ndev;
f9a5b510759eeb Geetha sowjanya 2024-04-16  136  	struct rep_dev *rep;
f9a5b510759eeb Geetha sowjanya 2024-04-16  137  	int rep_id, err;
f9a5b510759eeb Geetha sowjanya 2024-04-16  138  	u16 pcifunc;
f9a5b510759eeb Geetha sowjanya 2024-04-16  139  
f9a5b510759eeb Geetha sowjanya 2024-04-16  140  	priv->reps = devm_kcalloc(priv->dev, rep_cnt, sizeof(struct rep_dev), GFP_KERNEL);
f9a5b510759eeb Geetha sowjanya 2024-04-16  141  	if (!priv->reps)
f9a5b510759eeb Geetha sowjanya 2024-04-16  142  		return -ENOMEM;
f9a5b510759eeb Geetha sowjanya 2024-04-16  143  
f9a5b510759eeb Geetha sowjanya 2024-04-16  144  	for (rep_id = 0; rep_id < rep_cnt; rep_id++) {
f9a5b510759eeb Geetha sowjanya 2024-04-16  145  		ndev = alloc_etherdev(sizeof(*rep));
f9a5b510759eeb Geetha sowjanya 2024-04-16  146  		if (!ndev) {
f9a5b510759eeb Geetha sowjanya 2024-04-16  147  			dev_err(priv->dev, "PFVF representor:%d creation failed\n", rep_id);
f9a5b510759eeb Geetha sowjanya 2024-04-16  148  			err = -ENOMEM;
f9a5b510759eeb Geetha sowjanya 2024-04-16  149  			goto exit;
f9a5b510759eeb Geetha sowjanya 2024-04-16  150  		}
f9a5b510759eeb Geetha sowjanya 2024-04-16  151  
f9a5b510759eeb Geetha sowjanya 2024-04-16  152  		rep = netdev_priv(ndev);
f9a5b510759eeb Geetha sowjanya 2024-04-16  153  		priv->reps[rep_id] = rep;
f9a5b510759eeb Geetha sowjanya 2024-04-16  154  		rep->mdev = priv;
f9a5b510759eeb Geetha sowjanya 2024-04-16  155  		rep->netdev = ndev;
f9a5b510759eeb Geetha sowjanya 2024-04-16  156  		rep->rep_id = rep_id;
f9a5b510759eeb Geetha sowjanya 2024-04-16  157  
f9a5b510759eeb Geetha sowjanya 2024-04-16  158  		ndev->min_mtu = OTX2_MIN_MTU;
f9a5b510759eeb Geetha sowjanya 2024-04-16  159  		ndev->max_mtu = priv->hw.max_mtu;
f9a5b510759eeb Geetha sowjanya 2024-04-16  160  		pcifunc = priv->rep_pf_map[rep_id];
f9a5b510759eeb Geetha sowjanya 2024-04-16  161  		rep->pcifunc = pcifunc;
f9a5b510759eeb Geetha sowjanya 2024-04-16  162  
f9a5b510759eeb Geetha sowjanya 2024-04-16  163  		snprintf(ndev->name, sizeof(ndev->name), "r%dp%dv%d", rep_id,
f9a5b510759eeb Geetha sowjanya 2024-04-16  164  			 rvu_get_pf(pcifunc), (pcifunc & RVU_PFVF_FUNC_MASK));
f9a5b510759eeb Geetha sowjanya 2024-04-16  165  
f9a5b510759eeb Geetha sowjanya 2024-04-16  166  		eth_hw_addr_random(ndev);
f9a5b510759eeb Geetha sowjanya 2024-04-16  167  		if (register_netdev(ndev)) {

err = register_netdev(ndev);
if (err) {

f9a5b510759eeb Geetha sowjanya 2024-04-16  168  			dev_err(priv->dev, "PFVF reprentator registration failed\n");
f9a5b510759eeb Geetha sowjanya 2024-04-16  169  			free_netdev(ndev);
                                                                                    ^^^^
freed

f9a5b510759eeb Geetha sowjanya 2024-04-16 @170  			ndev->netdev_ops = NULL;
                                                                        ^^^^^^^^^^^^^^^^^^^^^^^
Use after free

f9a5b510759eeb Geetha sowjanya 2024-04-16  171  			goto exit;
f9a5b510759eeb Geetha sowjanya 2024-04-16  172  		}
f9a5b510759eeb Geetha sowjanya 2024-04-16  173  	}
f9a5b510759eeb Geetha sowjanya 2024-04-16  174  	err = rvu_rep_napi_init(priv);
f9a5b510759eeb Geetha sowjanya 2024-04-16  175  	if (err)
f9a5b510759eeb Geetha sowjanya 2024-04-16  176  		goto exit;
f9a5b510759eeb Geetha sowjanya 2024-04-16  177  
f9a5b510759eeb Geetha sowjanya 2024-04-16  178  	return 0;
f9a5b510759eeb Geetha sowjanya 2024-04-16  179  exit:
f9a5b510759eeb Geetha sowjanya 2024-04-16  180  	rvu_rep_free_netdev(priv);

rvu_rep_free_netdev() also calls free_netdev() so it's a double free.  I
would normally write this as:

exit:
	while (--rep_id >= 0) {
		unregister_netdev(priv->reps[rep_id]);
		free_netdev(priv->reps[rep_id]);
	}

	return err;

When you write it that way then rvu_rep_free_netdev() can be made easier
as well:

static void rvu_rep_free_netdev(struct otx2_nic *priv)
{
	int rep_id;

	for (rep_id = 0; rep_id < priv->rep_cnt; rep_id++) {
		unregister_netdev(priv->reps[rep_id]);
		free_netdev(priv->reps[rep_id]);
	}
}

There should be no need to call devm_kfree(priv->dev, priv->reps);.

f9a5b510759eeb Geetha sowjanya 2024-04-16 @181  	return err;
f9a5b510759eeb Geetha sowjanya 2024-04-16  182  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

