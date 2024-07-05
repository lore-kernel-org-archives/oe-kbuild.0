Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461615FA6B
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720190654; cv=none; b=R+jZlCz+e55xqCNxtF9P+8+ojr9B5iJrQ8Rk2pOpwaJNcUxsiJtWQzjBmXYSCi6qr+4YHW4UdwvhVG+QEql99et+m8QojW4k7LjRBSLctSviTzBPRzZM5hW8rgwyouu0wo4lDkIVwhiJWow5WZ3JoU+oECaEuzaK1DumFKRxQWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720190654; c=relaxed/simple;
	bh=vnx/n166sYPO6lB/RaRfPnzGC6Xrv2iyNstcyz4412A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bn0WCHHPsEjjL175U80JVXpcOl5GkeducGQyeHTALaiqM152Th4dB8zfLB6ApoOM+vSKSQ2wsAeF0+SGW4INqeXavs9ACCIsmIzQmn/L2lC91TTy27+FtnPoKZUyW06X9lsWQbaOLv90Ll502lSc21z26kaCyLR5B/0PDg7k0EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkjTAOtI; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkjTAOtI"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-700d3ffc28cso891104a34.2
        for <oe-kbuild@lists.linux.dev>; Fri, 05 Jul 2024 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720190651; x=1720795451; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=go8MaNmDmlSh8ngHkjtJjHiFwtKNDcZDTh37FXUcoTw=;
        b=QkjTAOtIDRIm55vKRTQ1a9fbQvzTIbbGJboCVgVFFHfHJ+iMDKWRYCIL9rWHt4mYKg
         hA4vPhbyd3Wrr/8EqM+pFCTKsehPZZ1WaCWwP9xLNhciQs4jbqkptPc4DVLE3kN+MaX1
         6fZZsi05RgCvVaXBSihzzdt+fwlpbDQKXOSrsxA4Y1q/Xc/dqvbGBZqakgihSR1vOfjv
         T8ucgpnCHh2ztwWUM7zhp6sFs3E3yR9edQt3cSe2NKO6/h45afFkLaS9OzOsDu40Zt5S
         wMYtaKyMJfmWiu2dRl7Q6O5Pgfg9yZTXkBEvOJekwJxwp1xqSxrRnbXrPwfDSEn9leVb
         d2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720190651; x=1720795451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=go8MaNmDmlSh8ngHkjtJjHiFwtKNDcZDTh37FXUcoTw=;
        b=cyVMxUYg3cYbk/zytqNNUBozb4oRu6p8xw+W9q/wC5J/NjiprNO0BrNaJkvBDiIUUf
         u4oGY4ulnoxveuAha9njrIR//dNJvgy3LEsZo6Yrdkwj/aI5UstCL5V5cMmfqV2tDiqM
         e/VeGfWTcUQ17hvfR3tBnIWTcXJqVotbtSTpJeNiS7XdjvO5lQ/IpZ6BwULBaEgvxViI
         7Kp95jpcXGKT3c2Ldv9fcyW78drUi57GzIcE7kIAPPoj0kJKM1IvipM3wKhzP1wxKvuU
         Ovtb5FoqxJG0Wvc/TwCbSmiD2Mkn/eto6IuzEVLEtSlzYrj4/kli6/wNihvDhwJMs11P
         CUQg==
X-Gm-Message-State: AOJu0YwtzQfc6H4qvXmzETTZwzO8kVKbqXRRrzHSHtCBw7+n4GomVMjU
	owGDNEqR0bGyp2I3QL1LoqTO1fI2tb0DC0gVdW/lhFqsxiiWfO5/i+Zt7phDjr5CVVB/8JpZrvb
	/
X-Google-Smtp-Source: AGHT+IFAGp9LtTfpu9z8EhYL6BqoJlBfzZas+23cCIzgJHWI7W70YBxqoZwtsNQo1lCjfJDGbKdx3w==
X-Received: by 2002:a05:6830:3b0e:b0:702:1de9:1434 with SMTP id 46e09a7af769-7034a552d3bmr5646005a34.0.1720190651355;
        Fri, 05 Jul 2024 07:44:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:45d:774f:47f7:bb6a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7a99a58sm2627991a34.12.2024.07.05.07.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 07:44:10 -0700 (PDT)
Date: Fri, 5 Jul 2024 16:44:08 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Yu Liao <liaoyu15@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22235/23252]
 arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable
 dereferenced before check 'hv_vp_index' (see line 195)
Message-ID: <ba42dba4-4efa-45cf-9179-d8eef2f8a266@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1b4ca2a2c1253c9e2d2428cc4fae541fdf3b326d
commit: 1f51ce689904768e1e45fc37c687784abb6eb3ed [22235/23252] x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup fails
config: x86_64-randconfig-161-20240704 (https://download.01.org/0day-ci/archive/20240705/202407051108.WAaMOZbt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407051108.WAaMOZbt-lkp@intel.com/

smatch warnings:
arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable dereferenced before check 'hv_vp_index' (see line 195)

vim +/hv_vp_index +204 arch/x86/hyperv/hv_init.c

93286261de1b46 Vitaly Kuznetsov    2018-01-24  190  void set_hv_tscchange_cb(void (*cb)(void))
93286261de1b46 Vitaly Kuznetsov    2018-01-24  191  {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  192  	struct hv_reenlightenment_control re_ctrl = {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  193  		.vector = HYPERV_REENLIGHTENMENT_VECTOR,
93286261de1b46 Vitaly Kuznetsov    2018-01-24  194  		.enabled = 1,
93286261de1b46 Vitaly Kuznetsov    2018-01-24 @195  		.target_vp = hv_vp_index[smp_processor_id()]
                                                                             ^^^^^^^^^^^
hv_vp_index dereferenced here

93286261de1b46 Vitaly Kuznetsov    2018-01-24  196  	};
93286261de1b46 Vitaly Kuznetsov    2018-01-24  197  	struct hv_tsc_emulation_control emu_ctrl = {.enabled = 1};
93286261de1b46 Vitaly Kuznetsov    2018-01-24  198  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  199  	if (!hv_reenlightenment_available()) {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  200  		pr_warn("Hyper-V: reenlightenment support is unavailable\n");
93286261de1b46 Vitaly Kuznetsov    2018-01-24  201  		return;
93286261de1b46 Vitaly Kuznetsov    2018-01-24  202  	}
93286261de1b46 Vitaly Kuznetsov    2018-01-24  203  
1f51ce68990476 Sean Christopherson 2024-04-26 @204  	if (!hv_vp_index)
                                                             ^^^^^^^^^^^
Checked too late

1f51ce68990476 Sean Christopherson 2024-04-26  205  		return;
1f51ce68990476 Sean Christopherson 2024-04-26  206  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  207  	hv_reenlightenment_cb = cb;
93286261de1b46 Vitaly Kuznetsov    2018-01-24  208  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  209  	/* Make sure callback is registered before we write to MSRs */
93286261de1b46 Vitaly Kuznetsov    2018-01-24  210  	wmb();
93286261de1b46 Vitaly Kuznetsov    2018-01-24  211  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  212  	wrmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *((u64 *)&re_ctrl));
93286261de1b46 Vitaly Kuznetsov    2018-01-24  213  	wrmsrl(HV_X64_MSR_TSC_EMULATION_CONTROL, *((u64 *)&emu_ctrl));
93286261de1b46 Vitaly Kuznetsov    2018-01-24  214  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

