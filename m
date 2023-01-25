Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D31381;
	Wed, 25 Jan 2023 08:11:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so658937wmb.2;
        Wed, 25 Jan 2023 00:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8sDHnz2X4jKlZi40pxASQBhXqJeasoMyGKYQxA9bpA0=;
        b=D76ZlgQ5Dq8oV9oaLZqa86dGqCTEFAQtwrvjLGFuuDbcbrLNbdJiuHVJPT4aH0pKJG
         kf1LpuZ9eLsS6U/ut8X7LB6hZGAVnelXyvm6I+8bnSSTsWM6PF1b7x+340HzDHDTlk3Y
         fVq45d+z3U7N571zUUUq13nZoWkd3zfxgBnNtTlcwxEK9rdEFzH6luyf2d8zgJduDqM+
         yNkmEpnQuvHde/fTKZAvH4EKQ4/cy51Wzpq1vMkJImIojuzgYd4XmB5gPjkAgozwrEvq
         k8IvCXkHKtMiNTdWFva65WHcFILqdPTP/sjVOM+PWewZg69o0eiqkQSh25VPnzQSrPk7
         7YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sDHnz2X4jKlZi40pxASQBhXqJeasoMyGKYQxA9bpA0=;
        b=jsR9X8RCroFRB/hbVQTXnFqaw4cD6lZClJ4Zoq4oCOM1CxK1yvE0ZA5IkbjZLbimPC
         EGdn2fkCSm1jzurZYFxz1d+orAH7cDXKXwpWXteOGii9CQI0EfE0/n4tpibdkVucG1qP
         Me62MJcnRkYpAWaPbGYHCTTcPh6WIbZsP++JRVzXQuAyldm1IcYSJvaXESXgrZefl09B
         OaettkiQdX0Mh1eUsDjp0wr7fjXBObsQ4vMzX34xROyHB7+sQwxHdnDLN4FMEjFmFakC
         GlUPxbhexUqFaI3sBsE9VQUoihHrXcSOtLMkOfcuBfx4HxUGXCDyG/qx1vA+jtT+yEbM
         jrdA==
X-Gm-Message-State: AFqh2kqjUD7yBILpkq424AgMMFpYtRWUSNDzj2a9WHJ1p2Ke2aIlSaMl
	Y/H2FqcHJ4Xmo7bD4OSQGNeXeG2R2HrpCQ==
X-Google-Smtp-Source: AMrXdXvLvmk+e7CCpAMCVatDLnDV1rWjI+W1eNdhnaSXIdHiHuDK2WgOl2cNyyZp7MrRoGtgZGLr+Q==
X-Received: by 2002:a05:600c:a4d:b0:3db:1d6:16f7 with SMTP id c13-20020a05600c0a4d00b003db01d616f7mr27730831wmq.23.1674634263285;
        Wed, 25 Jan 2023 00:11:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c4e8900b003d990372dd5sm1172789wmq.20.2023.01.25.00.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:11:02 -0800 (PST)
Date: Wed, 25 Jan 2023 11:10:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.01.19a 55/61]
 kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for
 statement not indented
Message-ID: <Y9DkEpSWDthHDRGn@kadam>
References: <202301241716.MgPWF6fU-lkp@intel.com>
 <Y8+tTlFbtbVMhUNI@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8+tTlFbtbVMhUNI@kadam>

On Tue, Jan 24, 2023 at 01:05:02PM +0300, Dan Carpenter wrote:
> On Tue, Jan 24, 2023 at 12:32:14PM +0300, Dan Carpenter wrote:
> > Should probably
> > create a static checker warning for nested loops where the inside loop
> > resets the outside iterator to zero.
> 
> Done!  I'll test that out tonight.
> 
> kernel/rcu/rcutorture.c:3582 rcu_torture_init_srcu_lockdep() warn: re-using outside iterator: 'i'

This check is delightful.  :)  I'm going to send patches for these.

drivers/gpu/drm/msm/adreno/a5xx_gpu.c:95 a5xx_submit_in_rb() warn: re-using outside iterator: 'i'
drivers/gpu/drm/vc4/vc4_kms.c:561 vc4_ctm_atomic_check() warn: re-using outside iterator: 'i'
drivers/net/ethernet/cavium/liquidio/lio_ethtool.c:2755 cn23xx_read_csr_reg() warn: re-using outside iterator: 'i'
drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:936 mvpp2_bm_pool_update_priv_fc() warn: re-using outside iterator: 'i'
drivers/net/wireless/marvell/mwifiex/11n.c:912 mwifiex_update_ampdu_txwinsize() warn: re-using outside iterator: 'i'
drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c:870 mwifiex_update_ampdu_rxwinsize() warn: re-using outside iterator: 'i'
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188f.c:1265 rtl8188fu_phy_iq_calibrate() warn: re-using outside iterator: 'i'
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8723b.c:1168 rtl8723bu_phy_iq_calibrate() warn: re-using outside iterator: 'i'
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:3298 rtl8xxxu_gen1_phy_iq_calibrate() warn: re-using outside iterator: 'i'
drivers/net/wireless/realtek/rtlwifi/rtl8188ee/phy.c:1989 rtl88e_phy_iq_calibrate() warn: re-using outside iterator: 'i'
drivers/net/wireless/realtek/rtlwifi/rtl8192c/phy_common.c:1429 rtl92c_phy_iq_calibrate() warn: re-using outside iterator: 'i'
drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:2294 rtl92d_phy_iq_calibrate() warn: re-using outside iterator: 'i'
drivers/net/wireless/realtek/rtlwifi/rtl8723ae/phy.c:1393 rtl8723e_phy_iq_calibrate() warn: re-using outside iterator: 'i'
drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c:2321 rtl8723be_phy_iq_calibrate() warn: re-using outside iterator: 'i'
drivers/staging/media/atomisp/pci/sh_css.c:8538 ia_css_stream_destroy() warn: re-using outside iterator: 'i'
drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c:1717 PHY_IQCalibrate_8723B() warn: re-using outside iterator: 'i'
sound/pci/lx6464es/lx_core.c:497 lx_buffer_ask() warn: re-using outside iterator: 'i'

regards,
dan carpenter

