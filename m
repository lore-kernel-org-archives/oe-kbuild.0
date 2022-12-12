Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB317B;
	Mon, 12 Dec 2022 07:21:36 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so4346759wmb.2;
        Sun, 11 Dec 2022 23:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlqQFJZsv0WrGLoh5IhfmrcZ4gs96nv45/eei3MHPpU=;
        b=gu2YmdPD+mrWtk7IRpY6Yp3ae/4fIHowbR1VEHIoeWbdSnZZETN7xLUmtNX2Sc/mjX
         yT2UAW+Td57sOk7+JZ+8T9skiOtVKp03u9SXegpvNax+xD/3uCtvQUtof0ChpGR+H11O
         VCFnMuRiwAKSOGEMhDAshMFlcy458n0rdaZ9gQtEGTwzKAi3MMGkOm2rA3TXuuc+9S4q
         gm3mszKFKuzWULzi4Y7wYhoyHR+T8EDoZ1nDx7tcW4sCIsw+sKkxgARkLlVnlAsWAJzj
         /iHtSLjgBtFknTNpe9nwijqYElif5ak2T/nuKrJR070QrWGcDGLIGVZZeYW7Jxbyd7nU
         BMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlqQFJZsv0WrGLoh5IhfmrcZ4gs96nv45/eei3MHPpU=;
        b=bAUKe7ObN96mrFlt4e34qQ69X+SlRpfcCkh8G4oBn1WdUsc0HEYL2uvxbYg0fuH5S4
         8DQ2D7MukgBcePA4SEaY5lkx4W1E2cl/+GpdcXmeBiBg2mvetw/8tUW/Zo6V/CLAcfc6
         rvXQ1nCFw+Vzk0YQ8qah8F3Nxm4WkyqWNmTkFsX3YzIO/TC82T4WWAbU6RwyNxnWg93A
         L5xcYPdQzm1hBQw0rs3NHDUp3kKNaPNjr4wURvJFCrPwawPH4kOLGPWDBBAtU9+IE7T5
         aj0aLXM4KjX2mXN0ldtLWgujD3TpM2qD+UeDC+dU90Gq8xSrnnhIe5MvjkrQMB9wvouX
         DSNw==
X-Gm-Message-State: ANoB5pnFCU+IRK5zz0XIkPeTeQOGaUy6fr1HlS4z37RbZ0qtar3zwa5t
	QfWsf4ifJUoyi86IUZDd6pcKQF/H8lUeGA==
X-Google-Smtp-Source: AA0mqf5rV0VAKHtApr50JFqi1s/UM0+La3343NMIGe8UXBiY/XA867Q/fWiDFXpJ/vdl+tig0GtxjQ==
X-Received: by 2002:a05:600c:3501:b0:3c6:e63d:b898 with SMTP id h1-20020a05600c350100b003c6e63db898mr11396566wmq.7.1670829694657;
        Sun, 11 Dec 2022 23:21:34 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m18-20020adff392000000b00242109cf587sm7980683wro.28.2022.12.11.23.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:21:34 -0800 (PST)
Date: Mon, 12 Dec 2022 10:21:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Stafford Horne <shorne@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1699
 amdgpu_dm_fini() error: we previously assumed 'adev->dm.dc' could be null
 (see line 1695)
Message-ID: <202212110728.v8ny7lxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221212072130.SfegOkj-imoxRM2JZ-9PFYbTZHr6IggTYQbxV-Mo4gk@z>

Hi Stafford,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   296a7b7eb79246912de31ee799cb85220931231a
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
config: openrisc-randconfig-m031-20221210
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1699 amdgpu_dm_fini() error: we previously assumed 'adev->dm.dc' could be null (see line 1695)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1726 amdgpu_dm_fini() warn: variable dereferenced before check 'adev->dm.dc' (see line 1699)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2707 dm_resume() error: we previously assumed 'aconnector->dc_link' could be null (see line 2694)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3995 amdgpu_dm_backlight_update_status() error: testing array offset 'i' after use.
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4037 amdgpu_dm_backlight_get_brightness() error: testing array offset 'i' after use.
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5409 fill_blending_from_plane_state() warn: variable dereferenced before check 'per_pixel_alpha' (see line 5384)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6504 create_stream_for_sink() error: we previously assumed 'aconnector->dc_sink' could be null (see line 6403)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8891 handle_cursor_update() error: we previously assumed 'afb' could be null (see line 8850)

vim +1699 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

7578ecda14d521 Alex Deucher        2017-10-10  1667  static void amdgpu_dm_fini(struct amdgpu_device *adev)
4562236b3bc0a2 Harry Wentland      2017-09-12  1668  {
f74367e492ba24 Alex Deucher        2020-07-10  1669  	int i;
f74367e492ba24 Alex Deucher        2020-07-10  1670  
09a5df6c444cf0 Nicholas Kazlauskas 2021-08-03  1671  	if (adev->dm.vblank_control_workqueue) {
09a5df6c444cf0 Nicholas Kazlauskas 2021-08-03  1672  		destroy_workqueue(adev->dm.vblank_control_workqueue);
09a5df6c444cf0 Nicholas Kazlauskas 2021-08-03  1673  		adev->dm.vblank_control_workqueue = NULL;
09a5df6c444cf0 Nicholas Kazlauskas 2021-08-03  1674  	}
09a5df6c444cf0 Nicholas Kazlauskas 2021-08-03  1675  
f74367e492ba24 Alex Deucher        2020-07-10  1676  	for (i = 0; i < adev->dm.display_indexes_num; i++) {
f74367e492ba24 Alex Deucher        2020-07-10  1677  		drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
f74367e492ba24 Alex Deucher        2020-07-10  1678  	}
f74367e492ba24 Alex Deucher        2020-07-10  1679  
4562236b3bc0a2 Harry Wentland      2017-09-12  1680  	amdgpu_dm_destroy_drm_device(&adev->dm);
c8bdf2b63e5b6b Emily Deng          2019-05-27  1681  
9a65df19310859 Wayne Lin           2021-03-02  1682  #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
9a65df19310859 Wayne Lin           2021-03-02  1683  	if (adev->dm.crc_rd_wrk) {
9a65df19310859 Wayne Lin           2021-03-02  1684  		flush_work(&adev->dm.crc_rd_wrk->notify_ta_work);
9a65df19310859 Wayne Lin           2021-03-02  1685  		kfree(adev->dm.crc_rd_wrk);
9a65df19310859 Wayne Lin           2021-03-02  1686  		adev->dm.crc_rd_wrk = NULL;
9a65df19310859 Wayne Lin           2021-03-02  1687  	}
9a65df19310859 Wayne Lin           2021-03-02  1688  #endif
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1689  #ifdef CONFIG_DRM_AMD_DC_HDCP
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1690  	if (adev->dm.hdcp_workqueue) {
e96b1b2974989c Nirmoy Das          2021-02-10  1691  		hdcp_destroy(&adev->dev->kobj, adev->dm.hdcp_workqueue);
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1692  		adev->dm.hdcp_workqueue = NULL;
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1693  	}
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1694  
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24 @1695  	if (adev->dm.dc)
                                                            ^^^^^^^^^^^
Checked for NULL

52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1696  		dc_deinit_callbacks(adev->dm.dc);
52704fcaf74bc9 Bhawanpreet Lakha   2019-05-24  1697  #endif
51ba691206e354 Qingqing Zhuo       2021-03-09  1698  
9a71c7d31734f7 Nicholas Kazlauskas 2019-10-28 @1699  	dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
                                                                             ^^^^^^^^^^^
and then dereferenced without checking.

9a71c7d31734f7 Nicholas Kazlauskas 2019-10-28  1700  
81927e2808be5a Jude Shih           2021-04-20  1701  	if (dc_enable_dmub_notifications(adev->dm.dc)) {
81927e2808be5a Jude Shih           2021-04-20  1702  		kfree(adev->dm.dmub_notify);
81927e2808be5a Jude Shih           2021-04-20  1703  		adev->dm.dmub_notify = NULL;
e27c41d5b0681c Jude Shih           2021-07-25  1704  		destroy_workqueue(adev->dm.delayed_hpd_wq);
e27c41d5b0681c Jude Shih           2021-07-25  1705  		adev->dm.delayed_hpd_wq = NULL;
81927e2808be5a Jude Shih           2021-04-20  1706  	}
81927e2808be5a Jude Shih           2021-04-20  1707  
743b9786b14ae0 Nicholas Kazlauskas 2019-10-24  1708  	if (adev->dm.dmub_bo)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

