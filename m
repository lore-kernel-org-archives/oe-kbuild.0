Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DCA10F9
	for <oe-kbuild@lists.linux.dev>; Mon, 22 May 2023 06:47:46 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f605d8a8a9so4053225e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 21 May 2023 23:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738064; x=1687330064;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpcVzZiQHuJlgNB+1GZ1+0T8mFu8yvELdw33UYkkLl8=;
        b=MhTrOuJMVD/4Pr15dj2MrRWhZPx0is3SfH6Ud6YRvaJxvKiUbbEC7CTqI/Q5+iMV1b
         XxxxSMSIWXe8jdGA2HUktG9hQAPY6LJBIklBVlzrf3IahiQyJxZPIB1XvjrBLr6w8pbu
         jC+xl8sGfRJ+KzUC9kj/iPDhdBXIuMIOwR2dAacfsEGCMIDwc3clIxy3UeCWM5DptFTs
         NBbh0hnEQdkA0Iqa8fBYEvvSiwDTBL601lXW4etNKf3nXesfrtuUBnhhNwaT3l1tLP7c
         5xbiOibZ9X0v8dxTtb9dE9Kx/ViuFGrSX0er5Qug2HQumyMaVpTEHNF6jl/14dUUB1T4
         9KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738064; x=1687330064;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpcVzZiQHuJlgNB+1GZ1+0T8mFu8yvELdw33UYkkLl8=;
        b=QH0WHxJoDIvz1iGwQRcz/4f7bfVHVkoKE6HKdSwVOpw+As0Du82Awv2aphr6FcksM9
         Zjrn8lA+VRyWoDyJ+LaCstc7YOmzZ1z9AUHgXAjH514vGoMQgO61mM+AdmzCKDDJZ9xj
         Y0VBGPIH11jtUGjIiLNNx/woyMGgEP5VBTumTUiQ1e9o7szHHFgwHTpftJASdaYuq246
         rhVtI5JyT5ZoZesngsc7tjW0OV9wS3Rb1OIN1T7j0sIhTAYAj+3UJMDJs6ckkBuzTadO
         7TYn+qdmrQ7PsyJ1cOY9mWJfCh0K6kcVRSW9buewdPICkXjt2AGFTv87UGY3SNwTZKRV
         gmIw==
X-Gm-Message-State: AC+VfDwCLY8ppHiKdfy48yeTP+/DmpzIF49Ao5jFvMaAhdp3ju5/8het
	rBt2B0jryYeYaPBPBiA1GzgeuDj0AwGIajpG7DQ=
X-Google-Smtp-Source: ACHHUZ61taaEnFgdPu7bLIwWViZ4oSt5EKj2mxSI/JiWU2FHciOor4L9SkuxyH8S00xOAaiKFcGkXw==
X-Received: by 2002:a05:600c:281:b0:3f6:41d:24d2 with SMTP id 1-20020a05600c028100b003f6041d24d2mr1546520wmk.39.1684738063644;
        Sun, 21 May 2023 23:47:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c22c400b003f4e47c6504sm10440588wmg.21.2023.05.21.23.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 23:47:42 -0700 (PDT)
Date: Mon, 22 May 2023 09:47:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wenjing Liu <wenjing.liu@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:384
 construct_phy() warn: variable dereferenced before check 'link->link_enc'
 (see line 381)
Message-ID: <aa1f09b5-4e29-48af-8b97-831115a7b682@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d635f6cc934bcd467c5d67148ece74632fd96abf
commit: 76f5dc40ebb188b081e03783541856c03e97f8e0 drm/amd/display: move dc_link functions in link root folder to dc_link_exports
config: ia64-randconfig-m041-20230514
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305201930.FVPVEaPp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:384 construct_phy() warn: variable dereferenced before check 'link->link_enc' (see line 381)

vim +384 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c

54618888d1ea7a Wenjing Liu    2023-01-18  367  	enc_init_data.ctx = dc_ctx;
54618888d1ea7a Wenjing Liu    2023-01-18  368  	bp_funcs->get_src_obj(dc_ctx->dc_bios, link->link_id, 0,
54618888d1ea7a Wenjing Liu    2023-01-18  369  			      &enc_init_data.encoder);
54618888d1ea7a Wenjing Liu    2023-01-18  370  	enc_init_data.connector = link->link_id;
54618888d1ea7a Wenjing Liu    2023-01-18  371  	enc_init_data.channel = get_ddc_line(link);
54618888d1ea7a Wenjing Liu    2023-01-18  372  	enc_init_data.hpd_source = get_hpd_line(link);
54618888d1ea7a Wenjing Liu    2023-01-18  373  
54618888d1ea7a Wenjing Liu    2023-01-18  374  	link->hpd_src = enc_init_data.hpd_source;
54618888d1ea7a Wenjing Liu    2023-01-18  375  
54618888d1ea7a Wenjing Liu    2023-01-18  376  	enc_init_data.transmitter =
54618888d1ea7a Wenjing Liu    2023-01-18  377  		translate_encoder_to_transmitter(enc_init_data.encoder);
54618888d1ea7a Wenjing Liu    2023-01-18  378  	link->link_enc =
54618888d1ea7a Wenjing Liu    2023-01-18  379  		link->dc->res_pool->funcs->link_enc_create(dc_ctx, &enc_init_data);
54618888d1ea7a Wenjing Liu    2023-01-18  380  
54618888d1ea7a Wenjing Liu    2023-01-18 @381  	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
                                                                                                 ^^^^^^^^^^^^^^^^
Dereference

54618888d1ea7a Wenjing Liu    2023-01-18  382  	DC_LOG_DC("BIOS object table - IS_DP2_CAPABLE: %d", link->link_enc->features.flags.bits.IS_DP2_CAPABLE);
                                                                                                    ^^^^^^^^^^^^^^^^
Here too.

54618888d1ea7a Wenjing Liu    2023-01-18  383  
54618888d1ea7a Wenjing Liu    2023-01-18 @384  	if (!link->link_enc) {
                                                     ^^^^^^^^^^^^^^
NULL checked too late.


54618888d1ea7a Wenjing Liu    2023-01-18  385  		DC_ERROR("Failed to create link encoder!\n");
54618888d1ea7a Wenjing Liu    2023-01-18  386  		goto link_enc_create_fail;
54618888d1ea7a Wenjing Liu    2023-01-18  387  	}
54618888d1ea7a Wenjing Liu    2023-01-18  388  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

