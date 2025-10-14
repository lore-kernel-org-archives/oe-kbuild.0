Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649F26E6F2
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760427239; cv=none; b=VT4jZ2LVi/saU1YRd6/iFDYnhj42IK+xJ5CSySnFlRwdOj7EX+shGhjVQRjTUB7CvXaqoLxE88p2dj+7A0IY9IJQpWPTAyPSZ90isvtQp2X5328AKpMAneG+D34G3/p1fSw8zgRigwzXb75obBtK1aQQ2itxdsspTg/8TdkSmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760427239; c=relaxed/simple;
	bh=rJZBVvFcCZfoZL/WIRUcWWYvpISm45B4Rwe3rWq54PY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VBaAcqL4ffM4zXsnBeBZGHkbddF4gEmdARR49OJvqIpT6Fpu4rztSqt+Sudk9Avd5Gg4vhNhXdIxnYs8dN3XFC1zAngtLCLZydA09Oa7BvIRi8DQ2bcG0dbvGxHCqlD8D62JCdCuIsdnPk8eQRHYMQ/KePrTLa06byn5d5bVdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMrB7+IQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMrB7+IQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f0134ccc0cso3774014f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760427235; x=1761032035; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwG/OchAZjwNRXsTLu0s9JIZNQmUXDtfcvX6l0dZWYY=;
        b=WMrB7+IQwvBbYwQzSW5HA9JY3AgBTG5HpxZb80I+h/bc1BtkL9TTxssCgTDR7co/LR
         KmCYWMt7ypSTWVufdM/Ac5/uGkrpcMJFIYp2VKtUF5vhJHjQuSyVHuGFjg1jG7YbkOb5
         ry0dlHuhFVodFOXgFLsrdur8wU2Brp3lNtclSt4ExBPjvKQT05K/AaK+K3f0h/ziK8Py
         OIC85QIL8TxERVFPHc9iVrBOHh4B5MTYTF3k7C+tQgVHPQTo56HAyTbg5ZkzkLNjN8Te
         Aj2dTleT/dWwoP4Ex/0v596yZ79R+FxI5Tx8T3/Yysqyz26Spi2te/lzk2n8wKUtlOQO
         /aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760427235; x=1761032035;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwG/OchAZjwNRXsTLu0s9JIZNQmUXDtfcvX6l0dZWYY=;
        b=RhRXCI3qGibZaZpIJEwaDS5eflofxUtHj5/tnD5YsmSwSJv6JBXVjBTCkRY88WR6+U
         vdJGypwEN9915UTtY+Vru+LRypYJghNS1tJjxq/ZX0/W1hr1Jk8GbxNRJj2lxfDcd7Qk
         QY6OBOVA2/zTBDixBgxayzE9iidYvquFBrNYUl+2R0l2bqiigqwvziNncFQeotOG6nsc
         AG0mKITCodHTPVrn6I+yXZ9k/7QzKtE5kBUWNP8JSTnWU2IlfKqkovQdaTJMA2aD5th4
         Gxj5FiwLUkv+BrbDuaUcemZRcbJfw1qiWe1B+QhKC+E2W0QvsLjpIwoMAcrrmdKXy6Cp
         8p4g==
X-Gm-Message-State: AOJu0Yzs5NAhnKtRilX3MCx/f5Fhu1oSrJSOXg0ibw9D6WafrTuIvmFV
	28j6gT5sx+VqFDuTDk1I1+X8sag4y3KTB8grX2jXQOCosy5xpzWaxtIZ4rhg6lOHGIkgMiNPAPQ
	M/t6h
X-Gm-Gg: ASbGncu5PFghE6OZ68I1zkT23mAsPXmjKwYrKhxlt/UADDcRnwYQG6OSB9Lqi5AcUyn
	+erJl8hKqO2s8ys+tCnI1I2PcaiOXb1jyvA97itwGfESuIEJ//VZTkHytWbnrSIc4SPAuiP/KvO
	MX9KxxGfVRTDObys1dFgJrDo/EToSLmXGlKGt0Jj+mZRUak8TpqC3SNza5Vi6akvIIb10BGb9A7
	VaUV1K2MCY2emMNo6UMzrIXUEn9zF9GMPImHxvP82QWwK32iG2H9NtqmXcdLvd49vtp1H7l/mCT
	SdTolOqGpnC480290H0F9GEA0isrWcAoLK8JwIgGU7037Zj6O40as1k7Ak3bgGNNJXBHknYHAM4
	CAoU+DY1rV55WEILcqtUa6TpP7nIgGXX9kkq+p4YABOyqQnPAIKo=
X-Google-Smtp-Source: AGHT+IE0SibgFOUsTOWb11Xe06KS5AooYnMfuV3qZwF21RGoTYuiMhvM5xxFKgxQQAvf0jDG3bRS2A==
X-Received: by 2002:a05:6000:1ac8:b0:3f7:b7ac:f3d4 with SMTP id ffacd0b85a97d-42666abbbc1mr17933769f8f.5.1760427235501;
        Tue, 14 Oct 2025 00:33:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e8a06sm22182799f8f.55.2025.10.14.00.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 00:33:55 -0700 (PDT)
Date: Tue, 14 Oct 2025 10:33:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Randolph Lin <randolph@andestech.com>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, pjw@kernel.org, randolph.sklin@gmail.com,
	tim609@andestech.com, Randolph Lin <randolph@andestech.com>
Subject: Re: [PATCH v6 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <202510092111.fZmvx6jO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003023527.3284787-5-randolph@andestech.com>
Message-ID: <20251014073351.fVAYrS51QMarFalLoiMEldRud7ZS1M4EoPMF5LAQOeg@z>

Hi Randolph,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Randolph-Lin/PCI-dwc-Allow-adjusting-the-number-of-ob-ib-windows-in-glue-driver/20251003-104100
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251003023527.3284787-5-randolph%40andestech.com
patch subject: [PATCH v6 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver support
config: powerpc-randconfig-r071-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092111.fZmvx6jO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510092111.fZmvx6jO-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-andes-qilai.c:157 qilai_pcie_host_fix_ob_iatu_count() error: uninitialized symbol 'ranges_32bits'.

vim +/ranges_32bits +157 drivers/pci/controller/dwc/pcie-andes-qilai.c

816cad1ac60166 Randolph Lin 2025-10-03  133  static int qilai_pcie_host_fix_ob_iatu_count(struct dw_pcie_rp *pp)
816cad1ac60166 Randolph Lin 2025-10-03  134  {
816cad1ac60166 Randolph Lin 2025-10-03  135  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
816cad1ac60166 Randolph Lin 2025-10-03  136  	struct device *dev = pci->dev;
816cad1ac60166 Randolph Lin 2025-10-03  137  	struct resource_entry *entry;
816cad1ac60166 Randolph Lin 2025-10-03  138  	/* Reserved 1 ob iATU for config space */
816cad1ac60166 Randolph Lin 2025-10-03  139  	int count = 1;
816cad1ac60166 Randolph Lin 2025-10-03  140  	int ranges_32bits;

This should be bool and initialized to false.

816cad1ac60166 Randolph Lin 2025-10-03  141  	u64 pci_addr;
816cad1ac60166 Randolph Lin 2025-10-03  142  	u64 size;
816cad1ac60166 Randolph Lin 2025-10-03  143  
816cad1ac60166 Randolph Lin 2025-10-03  144  	resource_list_for_each_entry(entry, &pp->bridge->windows) {
816cad1ac60166 Randolph Lin 2025-10-03  145  		if (resource_type(entry->res) != IORESOURCE_MEM)
816cad1ac60166 Randolph Lin 2025-10-03  146  			continue;
816cad1ac60166 Randolph Lin 2025-10-03  147  
816cad1ac60166 Randolph Lin 2025-10-03  148  		size = resource_size(entry->res);
816cad1ac60166 Randolph Lin 2025-10-03  149  		if (size < SZ_4G)
816cad1ac60166 Randolph Lin 2025-10-03  150  			count++;
816cad1ac60166 Randolph Lin 2025-10-03  151  
816cad1ac60166 Randolph Lin 2025-10-03  152  		pci_addr = entry->res->start - entry->offset;
816cad1ac60166 Randolph Lin 2025-10-03  153  		if (pci_addr < SZ_4G)
816cad1ac60166 Randolph Lin 2025-10-03  154  			ranges_32bits = true;
816cad1ac60166 Randolph Lin 2025-10-03  155  	}
816cad1ac60166 Randolph Lin 2025-10-03  156  
816cad1ac60166 Randolph Lin 2025-10-03 @157  	if (!ranges_32bits) {
816cad1ac60166 Randolph Lin 2025-10-03  158  		dev_err(dev, "Bridge window must contain 32-bits address\n");
816cad1ac60166 Randolph Lin 2025-10-03  159  		return -EINVAL;
816cad1ac60166 Randolph Lin 2025-10-03  160  	}
816cad1ac60166 Randolph Lin 2025-10-03  161  
816cad1ac60166 Randolph Lin 2025-10-03  162  	pci->num_ob_windows = count;
816cad1ac60166 Randolph Lin 2025-10-03  163  
816cad1ac60166 Randolph Lin 2025-10-03  164  	return 0;
816cad1ac60166 Randolph Lin 2025-10-03  165  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

