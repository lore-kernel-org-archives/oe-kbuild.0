Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCFE1DB356
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160125; cv=none; b=fGvXT8u7AMGYot25rxbjZeuDXTtHnLmKasvAAbQDY9SFZLzNcKUlgqnOJ2rgtwemVEnR5bcAIbWURgp/aWcIO2gNpUKa/HPoQbbZqWj6YSH+EXOcTxppdErVSNsuXriXx6DeV4udMirRg6YgYHh58Qz/pEn+RkwtQ9ONCAagXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160125; c=relaxed/simple;
	bh=O4jMmvxObEHgIUe6Et9nnMEU82aa+Erw7nSLDuYzBec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RnarkIG+/PjMdO/3KEFWt0I21Irh4udW+7sp8+nZe9nlhQnUAJEDDW9Og+eRGzKlPGxh4Uy3SFuCNorsny2HMDCOuqx5iWC1xJYQq3i0ljgmHH5RqMH49nAr04mE8D4gCcKKoxFhqLqX4O8+ZbILhwTr/2nQobghsg5S0m8zlxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYpoMANb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYpoMANb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso149091645e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 02:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736160121; x=1736764921; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiXs66jKfa7Mc5GaX6CeH3zxabRcvrngKVx2PovGglk=;
        b=vYpoMANb4qUSBhIVJqDqBaHYus9j4lncuI5qncBdYq6pEWmWao75fYDzKEM2PR3jAq
         oSFjgQpjBDxfbGmppNoBpy+cePGSgtHuioPft37ikie2AHT07V/x4P0iAbCFc19y3WHk
         jfSncNfOVAX2lOhp50fwu+SGmuAaf/lFmSImuiyxmkCVOBTOS7g93zp2yJ+hPestzeI4
         7VUvcBpJZJTSZeYHIsWNKf0J9JrvxLHK23vmZpp8jsKFeAMIrzzIXCqkGlTdasfITSog
         AlQdnpAmB3YB8+zSWXin28OA3S7Xniqso0KT5xbFD/jyA4A2B2OPV/MjljEFi4OjHevL
         Lxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160121; x=1736764921;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiXs66jKfa7Mc5GaX6CeH3zxabRcvrngKVx2PovGglk=;
        b=bqhe0ovRptwBC/LabwZwi4md0xIVgjKL93Fc4EEMNsz/t+GCn8JaSGf0VDcQiE9Fsp
         IJ03JvOUUr/SNP8n1jMYIgyfChoRDJe1a2jqpGel6yAFGM3hvH6Ws2LWgIIlVyUsNb1I
         EbtBCA3yNE0FhqFiEoKQcn7ripFzNd81aRFSuqxSF458M+UuPZFjvWGd3E3LuV+yJHCF
         ZPiRL055K8SNnxLu17JwldU5v+PgplSlZiFtaUilozEerKYB4AMgyJ+muppQqh/kjBW8
         vfFqiZPZn3cn7nQzHzQuGequMHDGQ0RaTxPtaINWidX/LR+Hh5HCDiUQ8mVFJOtj14hd
         Bf7A==
X-Gm-Message-State: AOJu0YxozKUrHgBt+Q0UukNntbl9euFPkxDdnioYv9/OCfTcZRnB58lh
	ohId9jGZRkSpS0arKhJg/IPS3e++jHVaEXMp/cPAC14JqwpgUH2uoaXY0VXdMmAYUHFkEB+LKRL
	f
X-Gm-Gg: ASbGncsprV5mggPZ34y0ffMMjyZXlY7R+fHrLBKR1e7WpfwrIY0lAcKyQ3K7ygJ39pU
	rMs/ASEvCjc6K69DaUbN3sj2V68B70l/w5JokH9uxaaoUOx2ra7fS9ls78Fq/JWvqj2pRqd3pjV
	D0b7kwUCAAnVTSQs23KV2eSjfgJBu7qMwfCotmN555tWnxF0t6l5DsyAwZowOfjiUmn53UWWV+3
	0wDPR25/lmam1iYvKCkL2PM1THOzfwz/J53o4UTBXbYor6iFuLwXK3HlDri3A==
X-Google-Smtp-Source: AGHT+IFFbL3/UJS7YOsKC61qAsl6V0MH3eRyKaLo6PWURFKFeqg7gEQ4TfTlsT4jHqAfvgfc7t1paQ==
X-Received: by 2002:a05:600c:1c12:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-4366d356dfcmr520636765e9.31.1736160121445;
        Mon, 06 Jan 2025 02:42:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm597654505e9.3.2025.01.06.02.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:42:00 -0800 (PST)
Date: Mon, 6 Jan 2025 13:41:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, alejandro.lucero-palau@amd.com,
	linux-cxl@vger.kernel.org, netdev@vger.kernel.org,
	dan.j.williams@intel.com, martin.habets@xilinx.com,
	edward.cree@amd.com, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@google.com, dave.jiang@intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alejandro Lucero <alucerop@amd.com>
Subject: Re: [PATCH v8 06/27] cxl: add function for type2 cxl regs setup
Message-ID: <0fe103b3-76d5-47a0-900b-3769b9c59cee@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216161042.42108-7-alejandro.lucero-palau@amd.com>

Hi,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/alejandro-lucero-palau-amd-com/cxl-add-type2-device-basic-support/20241217-001923
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241216161042.42108-7-alejandro.lucero-palau%40amd.com
patch subject: [PATCH v8 06/27] cxl: add function for type2 cxl regs setup
config: arm64-randconfig-r072-20241225 (https://download.01.org/0day-ci/archive/20241227/202412270320.Aydp9B4U-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412270320.Aydp9B4U-lkp@intel.com/

smatch warnings:
drivers/cxl/core/pci.c:1134 cxl_pci_accel_setup_regs() warn: missing error code? 'rc'

vim +/rc +1134 drivers/cxl/core/pci.c

cfbd1d00295bff Alejandro Lucero 2024-12-16  1118  int cxl_pci_accel_setup_regs(struct pci_dev *pdev, struct cxl_dev_state *cxlds)
cfbd1d00295bff Alejandro Lucero 2024-12-16  1119  {
cfbd1d00295bff Alejandro Lucero 2024-12-16  1120  	int rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1121  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1122  	rc = cxl_pci_setup_memdev_regs(pdev, cxlds);
cfbd1d00295bff Alejandro Lucero 2024-12-16  1123  	if (rc)
cfbd1d00295bff Alejandro Lucero 2024-12-16  1124  		return rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1125  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1126  	rc = cxl_pci_setup_regs(pdev, CXL_REGLOC_RBI_COMPONENT,
cfbd1d00295bff Alejandro Lucero 2024-12-16  1127  				&cxlds->reg_map, cxlds->capabilities);
cfbd1d00295bff Alejandro Lucero 2024-12-16  1128  	if (rc) {
cfbd1d00295bff Alejandro Lucero 2024-12-16  1129  		dev_warn(&pdev->dev, "No component registers (%d)\n", rc);
cfbd1d00295bff Alejandro Lucero 2024-12-16  1130  		return rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1131  	}
cfbd1d00295bff Alejandro Lucero 2024-12-16  1132  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1133  	if (!test_bit(CXL_CM_CAP_CAP_ID_RAS, cxlds->capabilities))
cfbd1d00295bff Alejandro Lucero 2024-12-16 @1134  		return rc;

This looks like it's supposed to be return -EPERM.

cfbd1d00295bff Alejandro Lucero 2024-12-16  1135  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1136  	rc = cxl_map_component_regs(&cxlds->reg_map,
cfbd1d00295bff Alejandro Lucero 2024-12-16  1137  				    &cxlds->regs.component,
cfbd1d00295bff Alejandro Lucero 2024-12-16  1138  				    BIT(CXL_CM_CAP_CAP_ID_RAS));
cfbd1d00295bff Alejandro Lucero 2024-12-16  1139  	if (rc)
cfbd1d00295bff Alejandro Lucero 2024-12-16  1140  		dev_dbg(&pdev->dev, "Failed to map RAS capability.\n");
cfbd1d00295bff Alejandro Lucero 2024-12-16  1141  
cfbd1d00295bff Alejandro Lucero 2024-12-16  1142  	return rc;
cfbd1d00295bff Alejandro Lucero 2024-12-16  1143  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

