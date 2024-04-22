Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2E4149C6C
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713791128; cv=none; b=W6mgFqQyn3o/DJuNyMgLQktUlHjTS6Sompz0B6DqMUGew718O8A6h5I715XUFw1KullmZeoRzygwg4S16mCoFeDVSdP5EDpBmVrMRk176SI/VCyrrbdTjJo7DkRZHlizsFJCsLns36nVxZfEmBDrygp32JaN8oMU3BCUD3QqkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713791128; c=relaxed/simple;
	bh=eej4AOWjIVIIMLtPYDL4xedOGwfEQx5LbPlaeypwX+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ok11tATSMWc1HD/lBEsBlMSOqaxEXIH05CyAKi+449HZeouJDlKz5YgEZbtyfAtca342n1+lM+yuI3vlWgRXLazAEP/jYzrCnDBeNtYPnZOtUNU7qRkm6/Er/7G6ZMA84FBV7jtfvooX+DRE2eoimJXAyX+USz5SxzxIXrAR/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7XRPQ2W; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7XRPQ2W"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a556d22fa93so503860666b.3
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 06:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713791124; x=1714395924; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZP23TlG/Qf9wXyMcwi8ZrAa4z5rWRpgCcr0CTAEoVc=;
        b=Y7XRPQ2WAsjZIvzSOnjh0ukhWPYZtGDHVWJElkbcp8M4cdOAqohoKGN2RiX8pXun4v
         apWTMsRdSWVbVdVvz+huoO/O+NpUINY4+mBr5zHdyl98IAnnFKCoZH/NN0zmDkzgWFDN
         4J517GoKx01oC/Snb2uKk3+fWnhAmvkx2l/n2vZRiIv/Px3Ip7Sdysu35RxEbnltGH72
         RViAmGTASnStL5scc5VFSD6zHJKlIaZ29Tip064zQDXJqRvcZHAwFBYb7I6Kjbk5tCzx
         7tnQG1k8mifRwjo4yylTMQSab2hBXhmLM1d4vM0cLZ/nVQj/k2gxOxzUV2bDDZRVlx+A
         q0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713791124; x=1714395924;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZP23TlG/Qf9wXyMcwi8ZrAa4z5rWRpgCcr0CTAEoVc=;
        b=B/MHsUkJquKMDy8ITk3j01RlTsmcFmjJPVxP5LVqJ+dVNpoRFdDld7+Al2k/WaFElz
         wIuOPxOfU8bDTCyJA4M2/TrrCBTHBLKyjbBspJps5oFL+lLQamyg+tz/Wu5dsepeDXDh
         RWZ4+HsCEXp8yDNs5nNmYfdMzZ0nWB7jtyyCDU+Esm0jVUTEBqCFi02a9wcJP9fBNBX9
         d36nY9JIBLVPOzwwtc0K1jyQ5SlrKJU7Ag87FtwGYkTlKWCU0TwIRIYYbbfSkpaRiX+8
         TxVkq5BvK4S+SEuP45sLPeiqneHdeUamepJQ0BL1/UHPs7ePg4Mo2ZaMnFezhVEcwucx
         lLmA==
X-Gm-Message-State: AOJu0YwxvO0nEdVTz9+HoK1RZBPN+M+iENTKn2HuMtGWWauYoyLVY9va
	PPepQV2Q//Dj6nLNlwiJG8Ahiw0aXXVuPUiH7U4VcIdAJ1Mx1vyn6PGeBkEu7cLbi1K/3EHZkMb
	K
X-Google-Smtp-Source: AGHT+IEEM8g7RlOgzgrl4BH987J4JCsS0BsN8F7WyHbp0KfrLER0KCnJ+cL7q/5oHRQnwTOWGJi4mg==
X-Received: by 2002:a17:906:318c:b0:a52:362f:be1a with SMTP id 12-20020a170906318c00b00a52362fbe1amr5941787ejy.18.1713791124235;
        Mon, 22 Apr 2024 06:05:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dq16-20020a170907735000b00a524318c380sm5750418ejc.80.2024.04.22.06.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:05:23 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:05:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:1316 epf_ntb_bind() warn:
 missing error code 'ret'
Message-ID: <70391d67-e5b9-4b8e-9462-20bb01dcd897@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   c52b9710c83d3b8ab63bb217cc7c8b61e13f12cd
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: x86_64-randconfig-161-20240419 (https://download.01.org/0day-ci/archive/20240419/202404190553.UtOSurIn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404190553.UtOSurIn-lkp@intel.com/

New smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:1316 epf_ntb_bind() warn: missing error code 'ret'

vim +/ret +1316 drivers/pci/endpoint/functions/pci-epf-vntb.c

e2b6ef72b7aea9 Frank Li 2022-02-22  1279  static int epf_ntb_bind(struct pci_epf *epf)
e2b6ef72b7aea9 Frank Li 2022-02-22  1280  {
e2b6ef72b7aea9 Frank Li 2022-02-22  1281  	struct epf_ntb *ntb = epf_get_drvdata(epf);
e2b6ef72b7aea9 Frank Li 2022-02-22  1282  	struct device *dev = &epf->dev;
e2b6ef72b7aea9 Frank Li 2022-02-22  1283  	int ret;
e2b6ef72b7aea9 Frank Li 2022-02-22  1284  
e2b6ef72b7aea9 Frank Li 2022-02-22  1285  	if (!epf->epc) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1286  		dev_dbg(dev, "PRIMARY EPC interface not yet bound\n");
e2b6ef72b7aea9 Frank Li 2022-02-22  1287  		return 0;
e2b6ef72b7aea9 Frank Li 2022-02-22  1288  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1289  
e2b6ef72b7aea9 Frank Li 2022-02-22  1290  	ret = epf_ntb_init_epc_bar(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1291  	if (ret) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1292  		dev_err(dev, "Failed to create NTB EPC\n");
e2b6ef72b7aea9 Frank Li 2022-02-22  1293  		goto err_bar_init;
e2b6ef72b7aea9 Frank Li 2022-02-22  1294  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1295  
e2b6ef72b7aea9 Frank Li 2022-02-22  1296  	ret = epf_ntb_config_spad_bar_alloc(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1297  	if (ret) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1298  		dev_err(dev, "Failed to allocate BAR memory\n");
e2b6ef72b7aea9 Frank Li 2022-02-22  1299  		goto err_bar_alloc;
e2b6ef72b7aea9 Frank Li 2022-02-22  1300  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1301  
e2b6ef72b7aea9 Frank Li 2022-02-22  1302  	ret = epf_ntb_epc_init(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1303  	if (ret) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1304  		dev_err(dev, "Failed to initialize EPC\n");
e2b6ef72b7aea9 Frank Li 2022-02-22  1305  		goto err_bar_alloc;
e2b6ef72b7aea9 Frank Li 2022-02-22  1306  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1307  
e2b6ef72b7aea9 Frank Li 2022-02-22  1308  	epf_set_drvdata(epf, ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1309  
e2b6ef72b7aea9 Frank Li 2022-02-22  1310  	pci_space[0] = (ntb->vntb_pid << 16) | ntb->vntb_vid;
e2b6ef72b7aea9 Frank Li 2022-02-22  1311  	pci_vntb_table[0].vendor = ntb->vntb_vid;
e2b6ef72b7aea9 Frank Li 2022-02-22  1312  	pci_vntb_table[0].device = ntb->vntb_pid;
e2b6ef72b7aea9 Frank Li 2022-02-22  1313  
e2b6ef72b7aea9 Frank Li 2022-02-22  1314  	if (pci_register_driver(&vntb_pci_driver)) {

ret = pci_register_driver(&vntb_pci_driver);
if (ret) {

e2b6ef72b7aea9 Frank Li 2022-02-22  1315  		dev_err(dev, "failure register vntb pci driver\n");
e2b6ef72b7aea9 Frank Li 2022-02-22 @1316  		goto err_bar_alloc;
e2b6ef72b7aea9 Frank Li 2022-02-22  1317  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1318  
e2b6ef72b7aea9 Frank Li 2022-02-22  1319  	vpci_scan_bus(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1320  
e2b6ef72b7aea9 Frank Li 2022-02-22  1321  	return 0;
e2b6ef72b7aea9 Frank Li 2022-02-22  1322  
e2b6ef72b7aea9 Frank Li 2022-02-22  1323  err_bar_alloc:
e2b6ef72b7aea9 Frank Li 2022-02-22  1324  	epf_ntb_config_spad_bar_free(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1325  
e2b6ef72b7aea9 Frank Li 2022-02-22  1326  err_bar_init:
e2b6ef72b7aea9 Frank Li 2022-02-22  1327  	epf_ntb_epc_destroy(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1328  
e2b6ef72b7aea9 Frank Li 2022-02-22  1329  	return ret;
e2b6ef72b7aea9 Frank Li 2022-02-22  1330  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

