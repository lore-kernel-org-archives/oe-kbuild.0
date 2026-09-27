Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1613B14A4
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522547; cv=none; b=OxQYkVCSzQOwbzDal6TscRD5nySquE23MkDQU1ll0v0mac7MmWBk2+doOtnLbzVu0HCsQTIUeU1+8mji8AON/iqW7ARVEZP0i+mGAW0Pc+5DJJvtwMnN94cQt7mGBCQRpuXuP/azj2xiLnJkc+tH3qk0vrlmf/RYVc0u6D/jXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522547; c=relaxed/simple;
	bh=WhKephSsjMer+0AdGthL9sJ8W54L5v4NV/AVdi42PMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfHMQ4/u+oKb25H4t3mZfRpA3ELGooLfpG2nlvYUiFUs8VAn34+zaWQ81pct2oWcNFMHV1Z1i0PXzPb0kCj1fnvhwSMZYTpDTW4j3X1IfduWpCWYhncTPs7Gt6BYo5LVThNYuZ2Ay/LiBFKw9yPTgmGSVRtkcw30R33MRS40xk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RosVzjXd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RosVzjXd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso3847815e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790522544; x=1791127344; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLyhLiW6aMUR/R9iLn2Q9ShBXVKZvDs2mVWUdIwlPLk=;
        b=RosVzjXd+Tbs9A9clDwutklUx0LmE258rkstfNnek4D8NTtCoCvMfK5nVdzft5oq9i
         ygLVOgjFyGuiJ+QUccNuTwgVeC714sHad54rxOeI0zqicOZsRyi9LLCYx2EhmFbwrdUZ
         0QLDTqsqK5KBj2iZskTxNlS9V0+HL3B/mg11e7Ba9MBph83rx358GaxIW3D2BS4dw/Cd
         jRZbmJYO8SHqOz9DBB7ZyJU5p9sVISoyoTiw2Z8TG4+9m2RHEFq3LzsC1nBrRhN8+/uc
         xFuZDOZSBgBVzYa4GDbGAbxdaZzMRgacnYbOjMGjbISsGq7dPXvaXaLCh9lWSJSEHXxW
         n2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790522544; x=1791127344;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLyhLiW6aMUR/R9iLn2Q9ShBXVKZvDs2mVWUdIwlPLk=;
        b=SALE6E2Zi8lpulA7h6zVX/tNO/wmhi0Gt8tHnon37ZpVwCQWskcwISIe/F5LW3YeVq
         1K0ezPgxyYiKDaXerdIpFmuDd5i3qFV1IZNYQrBSbmW74a6TsyaNaPHRFQGa2WrYqzqp
         3jnRR+Xp8NLYQ/b7iX9+Rw0ElNkSMbqH/3ZxfSEfRnXNlu086d8IS3lRl4r2RR0FOsek
         ASSooq/D2bPL0Gc3u8hKeGEY9Clv6rMw62c3ixsMW4OZ465UdkHXpOkq9yhTqD+Nw3di
         pp01WVCvsE56y9Mk1bygWtE53Xg3jSfonqIr6zjCXw1Gf59OVBdZnYgxROH97x/1WQmB
         3OMw==
X-Gm-Message-State: AFuF++larMP0KITtOkNhfrXzIdORhdJcRM3GmumGxrL2YVtJebvdp/JC
	c99pvi0x9Eu20o7sYTX2fPonjNSpsNr54NzCcU0dQ8BeSgx00DgDnxdGM4Lup6T8LKw6ig==
X-Gm-Gg: AYBFou0xoeYMKPNiHrPjGq/jKr5HQGU3f9Ff0Eoj4CK7d9AI10tmK/cGQDTMCQB3AGU
	Ku5J4bHxZa8L0DwZUBxJ137zrz1NBbmQIFhfPPluT9xBsTyqsaNpcUFnorX/c6E2qakI77BQNyY
	/AJS0JYXOP1WhZ2sEJGus8Q6D+5fmW1BKku31mMaE+ocOacP4iyd6H2Uyl/vJuaIC9tB0ko/yDf
	LodxVaK0N4g6jEERX3xDU6bCJQraHPiWcdU1TC/reTuXLzdbXIVZ6pKTGF4dkVdfhZFzM7ruj1A
	bOkh1DD1lyP3poYMrblRB+Az3UV2fNhreQLn4zTm+KzVaenyMoyQqDwNgj1dozXYUumXUBwMzK2
	Nrtlgmc3FA1sY5nREhBQMUPQfwhp3o4KL/T3MlUp+YiaWKJPgeNJRcdbrV7sPJjgeDaJEJ3C5ir
	StRm7wQLQYleFUmpAFW2QQuOb0/toMvDWI68pQozZqnEoUtYqzWjUsCDIqwspAliBot4SLigpj7
	Xul8A==
X-Received: by 2002:a05:600c:354e:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-49fe670b511mr190438245e9.32.1790522544393;
        Sun, 27 Sep 2026 08:22:24 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm83884715e9.11.2026.09.27.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:22:23 -0700 (PDT)
Date: Sun, 27 Sep 2026 18:22:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6294/10910] sound/soc/sof/amd/acp.c:1469
 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow
 'adata->sdw->pdev' 2 <= 3
Message-ID: <202609271355.u0pymQoF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260927152220.X7_oCkJraLnTzw02e7HrMRHjptxpC5yp0tcFwbeZg-A@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: be2823854e00558f46f5bbb124bb3f3a3bb9a94a [6294/10910] ASoC: SOF: amd: add SoundWire PM ops for ACP7.B/7.F
config: i386-randconfig-2200-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271355.u0pymQoF-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609271355.u0pymQoF-lkp@intel.com/

New smatch warnings:
sound/soc/sof/amd/acp.c:1469 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3

Old smatch warnings:
sound/soc/sof/amd/acp.c:663 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
sound/soc/sof/amd/acp.c:666 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
sound/soc/sof/amd/acp.c:1472 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3

vim +1469 sound/soc/sof/amd/acp.c

be2823854e0055 Vijendar Mukunda 2026-09-10  1440  static void handle_amd_sof_acp7x_sdw_pme_event(struct snd_sof_dev *sdev)
be2823854e0055 Vijendar Mukunda 2026-09-10  1441  {
be2823854e0055 Vijendar Mukunda 2026-09-10  1442  	struct acp_dev_data *adata;
be2823854e0055 Vijendar Mukunda 2026-09-10  1443  	struct amd_sdw_manager *amd_manager;
be2823854e0055 Vijendar Mukunda 2026-09-10  1444  	u32 sdw_pme_stat;
be2823854e0055 Vijendar Mukunda 2026-09-10  1445  	u32 sdw_wake_en;
be2823854e0055 Vijendar Mukunda 2026-09-10  1446  	u32 pme_reg;
be2823854e0055 Vijendar Mukunda 2026-09-10  1447  	u32 wake_mask;
be2823854e0055 Vijendar Mukunda 2026-09-10  1448  	unsigned int instance;
be2823854e0055 Vijendar Mukunda 2026-09-10  1449  
be2823854e0055 Vijendar Mukunda 2026-09-10  1450  	adata = sdev->pdata->hw_pdata;
be2823854e0055 Vijendar Mukunda 2026-09-10  1451  	if (!adata->sdw)
be2823854e0055 Vijendar Mukunda 2026-09-10  1452  		return;
be2823854e0055 Vijendar Mukunda 2026-09-10  1453  
be2823854e0055 Vijendar Mukunda 2026-09-10  1454  	for (instance = 0; instance < ACP7X_SDW_MAX_MANAGER_COUNT; instance++) {
be2823854e0055 Vijendar Mukunda 2026-09-10  1455  		pme_reg = ACP7X_SW_PME_STS + (instance * 4);
be2823854e0055 Vijendar Mukunda 2026-09-10  1456  		wake_mask = ACP7X_SW_WAKE_EN_MASK << instance;
be2823854e0055 Vijendar Mukunda 2026-09-10  1457  
be2823854e0055 Vijendar Mukunda 2026-09-10  1458  		sdw_pme_stat = snd_sof_dsp_read(sdev, ACP_DSP_BAR, pme_reg);
be2823854e0055 Vijendar Mukunda 2026-09-10  1459  		if (!sdw_pme_stat)
be2823854e0055 Vijendar Mukunda 2026-09-10  1460  			continue;
be2823854e0055 Vijendar Mukunda 2026-09-10  1461  
be2823854e0055 Vijendar Mukunda 2026-09-10  1462  		mutex_lock(&adata->acp_lock);
be2823854e0055 Vijendar Mukunda 2026-09-10  1463  		sdw_wake_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP7X_SW_WAKE_EN);
be2823854e0055 Vijendar Mukunda 2026-09-10  1464  		sdw_wake_en &= ~wake_mask;
be2823854e0055 Vijendar Mukunda 2026-09-10  1465  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_SW_WAKE_EN, sdw_wake_en);
be2823854e0055 Vijendar Mukunda 2026-09-10  1466  		mutex_unlock(&adata->acp_lock);
be2823854e0055 Vijendar Mukunda 2026-09-10  1467  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, pme_reg, sdw_pme_stat);
be2823854e0055 Vijendar Mukunda 2026-09-10  1468  
be2823854e0055 Vijendar Mukunda 2026-09-10 @1469  		if (!adata->sdw->pdev[instance])
                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
Feels like a bug.  AMD_SDW_MAX_MANAGER_COUNT(2) vs ACP7X_SDW_MAX_MANAGER_COUNT(4)

be2823854e0055 Vijendar Mukunda 2026-09-10  1470  			continue;
be2823854e0055 Vijendar Mukunda 2026-09-10  1471  
be2823854e0055 Vijendar Mukunda 2026-09-10  1472  		amd_manager = dev_get_drvdata(&adata->sdw->pdev[instance]->dev);
be2823854e0055 Vijendar Mukunda 2026-09-10  1473  		if (amd_manager)
be2823854e0055 Vijendar Mukunda 2026-09-10  1474  			pm_request_resume(amd_manager->dev);
be2823854e0055 Vijendar Mukunda 2026-09-10  1475  	}
be2823854e0055 Vijendar Mukunda 2026-09-10  1476  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

