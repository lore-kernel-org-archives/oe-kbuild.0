Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9714F21360
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UpbRFi0V"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a26f73732c5so47528866b.3
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Jan 2024 04:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704369908; x=1704974708; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z071ZOVrV7cQhPIZSpfbxn2i/ugENcMb4cwQcQkzR+I=;
        b=UpbRFi0VgwEHVFkDneumZhRijKnZylN5ezbYPfe4ROKedGwBSgzWTZ9YyMRMUS0CIX
         LX8Vt2n5tw2RTmktR+Lvv+sjMtG924L7iGGL1acL3FSEhxYn/uf6BkQNo6k0wzd/XfSD
         +FNC8APbQLpb+VOk7Fc3nVOcFSCoxi0MZPGi4duBqpVa75xtuO6pnGeMLZ5741jH0v/l
         U6PvqhGD5E51Kk7QgQDIZ2ApXfJwydgmc0aGM3hc9ArADVOxbYE8epgYFr9e3FfZP19t
         YC5muMuqNVZCs5cACYD7Qs44++AH6iB0wSy+ALoGMQdHSUI1TM7tutuHu6hHTNS/7gSz
         lJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704369908; x=1704974708;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z071ZOVrV7cQhPIZSpfbxn2i/ugENcMb4cwQcQkzR+I=;
        b=OdZHP0bFe+tj0cRRA1FOKkpic/UUVLrCcjcFMwvZn8LweRHyHF2mYjOWwUOe6+JayD
         svKY8+RWX3JFZj1P1616xxVcf88Rsd7571hmViKT0cFrsTlKVFtaHlLn0Q6jWLr+Dbz4
         QRp7BYn6o7g0ROVySy7novBMcyAhsUdfkB0JICA8obgI9/1AUO0pKH4yUZ7hW1b4/Wj+
         VBVMiA6wSgGgAMJ9Xrx0oDjTHTaVg48LZFlvU7+opyLp2tTenZh/ejNreJjQN5Uvthf8
         C6eYNitnRwekI3+96aKUzCq79R1BI9kTgynFvCS1hWQ5uJE9LJYqEc0hUh138/ctR5nX
         ykCw==
X-Gm-Message-State: AOJu0Yxuoqm5GI5Iw6rE89A+90pqhC0S81qxr0acZeknPqxSHkRZrdS1
	IcLXvkUX77Is6MFCofQ0EvkNdxqaCO1qaW6/Ndvel0xp+xk=
X-Google-Smtp-Source: AGHT+IFR64NY/NROAmz9WSpobH9bCqoNuzeYJ5wmYxSEhL49XMX06krXPHW0OI/sdYjgJj00Se8mlw==
X-Received: by 2002:a17:906:5a51:b0:a28:e2d7:b41d with SMTP id my17-20020a1709065a5100b00a28e2d7b41dmr260021ejc.0.1704369907666;
        Thu, 04 Jan 2024 04:05:07 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id ew18-20020a170907951200b00a1dd58874b8sm13592133ejc.119.2024.01.04.04.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:05:07 -0800 (PST)
Date: Thu, 4 Jan 2024 15:05:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alex Hung <alex.hung@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 4679/10295]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9280
 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'acrtc' could be
 null (see line 9277)
Message-ID: <7e5c7ab1-4ee9-4221-b585-6a9aa2c6dcc3@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: f872e2f5f0beabd34c03799a5c597f6ba47b51cc [4679/10295] drm/amd/display: Add writeback enable field (wb_enabled)
config: x86_64-randconfig-161-20231228 (https://download.01.org/0day-ci/archive/20240101/202401010520.1VZfOvg0-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401010520.1VZfOvg0-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9280 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'acrtc' could be null (see line 9277)

vim +/acrtc +9280 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

e7b07ceef2a650 Harry Wentland      2017-08-10  9263  
c81e13b929df2f Alex Hung           2023-12-01  9264  	/* Enable writeback */
c81e13b929df2f Alex Hung           2023-12-01  9265  	for_each_new_connector_in_state(state, connector, new_con_state, i) {
c81e13b929df2f Alex Hung           2023-12-01  9266  		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
c81e13b929df2f Alex Hung           2023-12-01  9267  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
c81e13b929df2f Alex Hung           2023-12-01  9268  
c81e13b929df2f Alex Hung           2023-12-01  9269  		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
c81e13b929df2f Alex Hung           2023-12-01  9270  			continue;
c81e13b929df2f Alex Hung           2023-12-01  9271  
c81e13b929df2f Alex Hung           2023-12-01  9272  		if (!new_con_state->writeback_job)
c81e13b929df2f Alex Hung           2023-12-01  9273  			continue;
c81e13b929df2f Alex Hung           2023-12-01  9274  
c81e13b929df2f Alex Hung           2023-12-01  9275  		new_crtc_state = NULL;
c81e13b929df2f Alex Hung           2023-12-01  9276  
c81e13b929df2f Alex Hung           2023-12-01 @9277  		if (acrtc)
                                                                    ^^^^^
Check for NULL

c81e13b929df2f Alex Hung           2023-12-01  9278  			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
c81e13b929df2f Alex Hung           2023-12-01  9279  
f872e2f5f0beab Alex Hung           2023-12-01 @9280  		if (acrtc->wb_enabled)
                                                                    ^^^^^^^^^^^^^^^^^
Unchecked dereference

f872e2f5f0beab Alex Hung           2023-12-01  9281  			continue;
f872e2f5f0beab Alex Hung           2023-12-01  9282  
c81e13b929df2f Alex Hung           2023-12-01  9283  		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
c81e13b929df2f Alex Hung           2023-12-01  9284  
c81e13b929df2f Alex Hung           2023-12-01  9285  		dm_set_writeback(dm, dm_new_crtc_state, connector, new_con_state);
f872e2f5f0beab Alex Hung           2023-12-01  9286  		acrtc->wb_enabled = true;
c81e13b929df2f Alex Hung           2023-12-01  9287  	}
c81e13b929df2f Alex Hung           2023-12-01  9288  
6ce8f316673f61 Nicholas Kazlauskas 2019-07-11  9289  	/* Update audio instances for each connector. */
6ce8f316673f61 Nicholas Kazlauskas 2019-07-11  9290  	amdgpu_dm_commit_audio(dev, state);
6ce8f316673f61 Nicholas Kazlauskas 2019-07-11  9291  
7230362c78d441 Alex Deucher        2020-12-10  9292  	/* restore the backlight level */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

