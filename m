Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3642031A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328468; cv=none; b=iTKMDDKTIUToqvQDH0KrBLp/KSnWugLYN0ux/CaY0dTHOzdvc9gaADtDQBO+/a9ehMMArue9YgHUlCvIvFe9M1DtI5vsBmJ/HI8u1P0fpMwErOwBEjFUZdi7AhABFZO+4cGyuvAST6sZ4OfWGe3KfsMdYt+fyvgO75rBD05akMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328468; c=relaxed/simple;
	bh=TPKgrE8yguYfdAhgejzzCFbbJl2/DUpvh9OK9Y1hXFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q76aB5a2ZzW8hBmdSf+Gkr+rhO5+FQnLyiwIk+zOIozEY+P+zW/8IrA7DrxK6tGfLgPIyp7BHEZKfurO4Jen/+FUFWdD5oulda2pkP84HTkQd30nPsMmELMHb5iB4YzNA36yE8qQihCm/LSKfD1U6yybjRacqRXKrSSAJ3JmnQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmvMTLjN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmvMTLjN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3eafbcb1c5so36276266b.0
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Feb 2024 23:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708328464; x=1708933264; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zo6vK6qM2N5hDQY7Jufi4XxX92JjPkbFc2lf694wvU0=;
        b=mmvMTLjNO+4mNom4DQwgDw2B6zazmP6WNVvMXG3AqjjaiH/ZbGZFFkxztcQlKwS2eI
         rdOnHlTM552F1yZFvZabGYwZOu5ViO7NGIwHtNp/cZtK2jO9Fj3pJ/AfveSV+ltxJGPf
         +UBnx91Pf3uI9GhI++o0wuwHndpbYhFaCtsC8MnE078xCVYRMcbBiW84tA6SES9wruW2
         9k4AQd7cn2EK+S4Ukenb2Sx/YjqsG0UBlbDmnQlTTLPLvgzftOfnx4KJLlCq3rGjHxbo
         LnOC5lYWLV93I/sTvN0f/sqkQEG+ioPZ/m++9ZeE97tEKUwo4t5yGa09GreuyNC64qib
         uy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328464; x=1708933264;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zo6vK6qM2N5hDQY7Jufi4XxX92JjPkbFc2lf694wvU0=;
        b=F88eTEzUoMx6v6qWwyAavffOsLLCIfbNe3/YfHtw6LIwdWzRKz6UBfAFi1oLnampUX
         rBDX+1rWSNsJZcCltZ8Z1HwBUigU4hl9e4fQ5bFrFfW8lG5z7025ygepN95KZiJEiPLe
         08vFxd8OxqfDY7r7muez5GcjkjfRnkD8wXRsyEntqVcJeuE+aL0XOec3sgY3FWTkyPoS
         QT4Y6LA/ReoEt8qsp/JIrpDqhsUpI59gWVQsGu5a+jt+rQQf7QKR8uH9CRcXOJFf6fgn
         AyCLjXDLnwQoxJM0LpOotq2zT5H1lL8fkevwUwsaMKObXdaXVcMVdJSGoZALSCgmcdNy
         72Zw==
X-Gm-Message-State: AOJu0YyIb08Iu0gpKqfY8v+CEmPX7AS2CFJt9fYlnO0CzQgiMPY55BYX
	Sv5qwgjBn2jHClPzogyVHYNXA+uIAWibSaIRmhXGUARqbEIplci/oBs5TcqxYEWHjn3pEFXNbBh
	f
X-Google-Smtp-Source: AGHT+IE/PIDP7DnpWAzlF00BGQVoxe4JQJfG14QXNAURN6G5IpLJKWGs/qwwUD6tjRlRQe8j5CT9Zw==
X-Received: by 2002:a17:906:3941:b0:a3d:2e36:192d with SMTP id g1-20020a170906394100b00a3d2e36192dmr7282199eje.75.1708328463924;
        Sun, 18 Feb 2024 23:41:03 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id wb15-20020a170907d50f00b00a3de52ce260sm2646494ejc.200.2024.02.18.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 23:41:03 -0800 (PST)
Date: Mon, 19 Feb 2024 10:41:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [linux-next:master 6663/7658] drivers/nvmem/zynqmp_nvmem.c:123
 zynqmp_efuse_access() error: uninitialized symbol 'ret'.
Message-ID: <fa25ceb7-ab86-44a9-b5b8-b3ef68b45f28@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d37e1e4c52bc60578969f391fb81f947c3e83118
commit: 30c624c97d08d37765ca3a23762f8c79bd6ab26e [6663/7658] nvmem: zynqmp_nvmem: Add support to access efuse
config: arm64-randconfig-r081-20240216 (https://download.01.org/0day-ci/archive/20240218/202402180509.Aj5wp9zz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402180509.Aj5wp9zz-lkp@intel.com/

smatch warnings:
drivers/nvmem/zynqmp_nvmem.c:123 zynqmp_efuse_access() error: uninitialized symbol 'ret'.

vim +/ret +123 drivers/nvmem/zynqmp_nvmem.c

30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   59  static int zynqmp_efuse_access(void *context, unsigned int offset,
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   60  			       void *val, size_t bytes, enum efuse_access flag,
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   61  			       unsigned int pufflag)
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   62  {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   63  	struct device *dev = context;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   64  	struct xilinx_efuse *efuse;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   65  	dma_addr_t dma_addr;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   66  	dma_addr_t dma_buf;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   67  	size_t words = bytes / WORD_INBYTES;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   68  	int ret;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   69  	int value;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   70  	char *data;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   71  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   72  	if (bytes % WORD_INBYTES != 0) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   73  		dev_err(dev, "Bytes requested should be word aligned\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   74  		return -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   75  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   76  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   77  	if (pufflag == 0 && offset % WORD_INBYTES) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   78  		dev_err(dev, "Offset requested should be word aligned\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   79  		return -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   80  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   81  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   82  	if (pufflag == 1 && flag == EFUSE_WRITE) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   83  		memcpy(&value, val, bytes);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   84  		if ((offset == EFUSE_PUF_START_OFFSET ||
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   85  		     offset == EFUSE_PUF_MID_OFFSET) &&
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   86  		    value & P_USER_0_64_UPPER_MASK) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   87  			dev_err(dev, "Only lower 4 bytes are allowed to be programmed in P_USER_0 & P_USER_64\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   88  			return -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   89  		}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   90  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   91  		if (offset == EFUSE_PUF_END_OFFSET &&
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   92  		    (value & P_USER_127_LOWER_4_BIT_MASK)) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   93  			dev_err(dev, "Only MSB 28 bits are allowed to be programmed for P_USER_127\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   94  			return -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   95  		}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   96  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   97  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   98  	efuse = dma_alloc_coherent(dev, sizeof(struct xilinx_efuse),
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   99  				   &dma_addr, GFP_KERNEL);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  100  	if (!efuse)
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  101  		return -ENOMEM;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  102  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  103  	data = dma_alloc_coherent(dev, sizeof(bytes),
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  104  				  &dma_buf, GFP_KERNEL);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  105  	if (!data) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  106  		ret = -ENOMEM;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  107  		goto efuse_data_fail;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  108  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  109  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  110  	if (flag == EFUSE_WRITE) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  111  		memcpy(data, val, bytes);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  112  		efuse->flag = EFUSE_WRITE;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  113  	} else {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  114  		efuse->flag = EFUSE_READ;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  115  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  116  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  117  	efuse->src = dma_buf;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  118  	efuse->size = words;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  119  	efuse->offset = offset;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  120  	efuse->pufuserfuse = pufflag;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  121  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  122  	zynqmp_pm_efuse_access(dma_addr, (u32 *)&ret);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02 @123  	if (ret != 0) {

Depending on the .config the zynqmp_pm_efuse_access() function can be
a no-op.

30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  124  		if (ret == EFUSE_NOT_ENABLED) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  125  			dev_err(dev, "efuse access is not enabled\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  126  			ret = -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  127  		} else {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  128  			dev_err(dev, "Error in efuse read %x\n", ret);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  129  			ret = -EPERM;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  130  		}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  131  		goto efuse_access_err;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  132  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  133  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  134  	if (flag == EFUSE_READ)
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  135  		memcpy(val, data, bytes);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  136  efuse_access_err:
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  137  	dma_free_coherent(dev, sizeof(bytes),
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  138  			  data, dma_buf);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  139  efuse_data_fail:
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  140  	dma_free_coherent(dev, sizeof(struct xilinx_efuse),
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  141  			  efuse, dma_addr);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  142  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  143  	return ret;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  144  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

