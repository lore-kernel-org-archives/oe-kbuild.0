Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22FB1F186
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 14:14:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3112f2b9625so5613180f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687443284; x=1690035284;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfX6S9OowWMb6sUG+mepNdVVGBJ4KPy5SvO+ayQZZac=;
        b=u7ZZMrU+t8YcO9ZBmaHYCTTHFGW2KNJ5fRHRMZ3J0E0245APLWB7SYDoS18ZfgaYiO
         j9Ww4JENsGuw77b6lF/S9fKv776w0PcjNuJ1tr+PgKd9GjNSt6q/KuiEPAHgPY/wI6m0
         96aKgTEoSRAoD1sdJEiCc4CHjeh5S0zAI42sJYXnQzpRX0fESKgc1QnTYuzFFovHO6xD
         H8Bcs+s4h9RUK/CzBf8r7KcNeibfx8UGqK4KKCAkFYOcgz8XTOwTRBTDPQXHRRoEEy+O
         j3jEXlLa+Wt1V3VQvPdaZ4wL1SufqB7qGU9n0PD6xVCRcYgbzday+Q2vo0NXabbtbUHe
         Uq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443284; x=1690035284;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfX6S9OowWMb6sUG+mepNdVVGBJ4KPy5SvO+ayQZZac=;
        b=TdFUn1ob3QppekRrQ5PABOgrqwdgDNxIi+8MTK+cQc/CFQgFPV8sR4nH9JWdlETER3
         uPu8YGhaAqxd9MEMjKNCsgjS2+eVsoywjVnvJgQ/Yc9ag2mROKGOPiY5KQPf03fjC06U
         3kQt0gvVt3/11KMQMBbOG1P8ViNZ1fpj67ncuZAnemsHG7hT3mZhDE5d8ek6WlsuYzn3
         ZL0qtZfLDZsRdhGQ9UbyC1kESNEY6ujLr79ZbCxy54TOjRL0T87NAi9pVV2OnsOOWyvw
         2gn5IQS3V8LCIv76hKcgnWWNYeNg72QprUgwM0aQEDR087GNWSmnPDPAcQwuE22dS+aE
         Oi1Q==
X-Gm-Message-State: AC+VfDxHiNFYh7CcXoRHzYESfH48dwiuMg/KOPuWP7Mj5EDGti4KKp4/
	xWq/GbYmSwXWI3bA/378htso4wW6XKrMpuI1Pzg=
X-Google-Smtp-Source: ACHHUZ5IRYDOppEO4192S+gCKuJCmc4/7++Z/4J+9t60AsTnCc7smADETO8AlE2mUNvvzq/cAoegSw==
X-Received: by 2002:a5d:6386:0:b0:2f9:c2ab:e1de with SMTP id p6-20020a5d6386000000b002f9c2abe1demr14535921wru.14.1687443284022;
        Thu, 22 Jun 2023 07:14:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w3-20020adfee43000000b0030e5b1fffc3sm7263993wro.9.2023.06.22.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:14:42 -0700 (PDT)
Date: Thu, 22 Jun 2023 17:14:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 7316/11867]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1673
 amdgpu_dm_init() error: we previously assumed 'adev->dm.dc' could be null
 (see line 1669)
Message-ID: <8889c4d2-2629-4d69-bc4a-9b46fe0c5997@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c87d46a9e8ebd2f2c3960927b1d21687096d1109
commit: 9788d087caffd8358d6e14349ee69d9385666719 [7316/11867] drm/amd/display: improve the message printed when loading DC
config: mips-randconfig-m031-20230620 (https://download.01.org/0day-ci/archive/20230622/202306222109.GOpiisJ1-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306222109.GOpiisJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306222109.GOpiisJ1-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1673 amdgpu_dm_init() error: we previously assumed 'adev->dm.dc' could be null (see line 1669)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1905 amdgpu_dm_fini() error: we previously assumed 'adev->dm.dc' could be null (see line 1889)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6079 create_stream_for_sink() error: we previously assumed 'aconnector->dc_sink' could be null (see line 5971)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8708 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'aconnector->dc_link' could be null (see line 8689)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8961 dm_force_atomic_commit() error: 'crtc_state' dereferencing possible ERR_PTR()

vim +1673 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

0dd79532340568 Zhan Liu            2021-03-08  1662  	INIT_LIST_HEAD(&adev->dm.da_list);
57b9f3384c64e3 Fangzhi Zuo         2022-07-06  1663  
57b9f3384c64e3 Fangzhi Zuo         2022-07-06  1664  	retrieve_dmi_info(&adev->dm);
57b9f3384c64e3 Fangzhi Zuo         2022-07-06  1665  
4562236b3bc0a2 Harry Wentland      2017-09-12  1666  	/* Display Core create. */
4562236b3bc0a2 Harry Wentland      2017-09-12  1667  	adev->dm.dc = dc_create(&init_data);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Allocation

4562236b3bc0a2 Harry Wentland      2017-09-12  1668  
423788c7a866cb Ernst Sjöstrand     2017-11-07 @1669  	if (adev->dm.dc) {
                                                            ^^^^^^^^^^^
Check for allocation failure


9788d087caffd8 Aurabindo Pillai    2023-05-05  1670  		DRM_INFO("Display Core v%s initialized on %s\n", DC_VER,
bf7fda0b3736f9 Rodrigo Siqueira    2023-04-25  1671  			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
423788c7a866cb Ernst Sjöstrand     2017-11-07  1672  	} else {
9788d087caffd8 Aurabindo Pillai    2023-05-05 @1673  		DRM_INFO("Display Core v%s failed to initialize on %s\n", DC_VER,
9788d087caffd8 Aurabindo Pillai    2023-05-05  1674  			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
                                                                                               ^^^^^^^^^^^^^
NULL pointer dereference

423788c7a866cb Ernst Sjöstrand     2017-11-07  1675  		goto error;
423788c7a866cb Ernst Sjöstrand     2017-11-07  1676  	}
4562236b3bc0a2 Harry Wentland      2017-09-12  1677  
8a791dabea1816 Harry Wentland      2020-05-01  1678  	if (amdgpu_dc_debug_mask & DC_DISABLE_PIPE_SPLIT) {
8a791dabea1816 Harry Wentland      2020-05-01  1679  		adev->dm.dc->debug.force_single_disp_pipe_split = false;
8a791dabea1816 Harry Wentland      2020-05-01  1680  		adev->dm.dc->debug.pipe_split_policy = MPC_SPLIT_AVOID;
8a791dabea1816 Harry Wentland      2020-05-01  1681  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

