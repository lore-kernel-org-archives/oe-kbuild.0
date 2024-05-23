Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449AB657
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716476976; cv=none; b=OD9JjGDR3KG1TMzoV2hdMvunhq5XJkk+dqJMpTbNs8LnIhSLNtdE5EzMV/JDqDokdW6f5XVoFzTzxv8ztGTfVAGO7EMU9RpPIktXmXj3+1NAzHYAlFzHSI27voVovHucnWn6r+2XbyL5bNeFcQlRzLlCkAIvCfgueH73gZL4sRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716476976; c=relaxed/simple;
	bh=ju4mwWD7HTNSueQOnNPpV57Ec+J9+tFLImbUclsgOIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k9UCvjbCDiLPbXX4PG2+bK4NkxnuiMl4+Oao+2wT2RFnmf3VIViiLmWBd0XiPIPsaK2I1ecug0lxQaOcgNj5psGswrRhEhovriWCPypJDu/FtWhKiduR/sCMeT78SFIGnxEddl/ueEmY2Ao19qGsIAndagOKdDZlBcYi449YTcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pfFuNh9c; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pfFuNh9c"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41f9ce16ed8so25537595e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716476972; x=1717081772; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBRzWW8ABwwrAgp/rRaEloFhYaP4tJ5xVJxQiF1nl4w=;
        b=pfFuNh9cQaGuV15QNbhzMXVf26k4CbybybmyUPZxhCZO/XxXr0KTSyHUANDCIRnmLC
         esKscLGbhOc15A8TrSIRGMB76WXDMqBeCeiHhLWjV47vM4Oj64zHCenl84qyULktigwL
         QH/AlICWRqeNY0An++yDS+vytZpnSa3LZ3sXM7A4GImPc+w5WOEwf2FTrUe2MAPkzlKl
         SQs3m432UuRb0FGHWHt/d/tWbr5g8xOUJb5ihf6D2SNGlQHOs39BkJ+ajE0r4hOP0Uyh
         BCDgXYkWbCmvtt3F95b0o0JawJkLqG0qbK+36tJ3qTEyWRXCmg6SrjZwTbuuPSG1rKB5
         rxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476972; x=1717081772;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBRzWW8ABwwrAgp/rRaEloFhYaP4tJ5xVJxQiF1nl4w=;
        b=ElkGqDdxhEIJatdhe03r1XkLTtSdAaxkfsakdZCMfjacvGfxgxQRaiA9B+20Mlsgk7
         VnbZFyEcYeNS/jmJZlma4N1htgk0DbK9eTDLn7Q8j9QFBS4Oe0JRxTaUSn1S2w/R+uEM
         1ghE+i7Kdhzt+8Aso6A1ja1hPUA2KmEpBou128yPzNbDNuUHrBpljjVnvApbYqGar+Vn
         9f0ffq+GlzubRwTBGq+l8SDVBEMnDZpGhZ2BRREPBQfkG71czNLAEiE0OvjlzH2HJWFl
         PZ3Bfxkj41BGx8ZyCd3sv6b6xfSalzVVnKvH55YG06ZUFXERmnYsGbhwdkZb/weDb3iE
         HhBA==
X-Gm-Message-State: AOJu0YyfA9djSH5f7YLKLfZ637242tBHel/u+5YajHwnLIsnqE/tt8Ra
	XKQVNS01lhHfjxteB6DLEQP1IakAXfuex9RT1PKX9GeJ7jtaquEtYY8shRH1EW4hGAjw6o0TJrC
	eUIU=
X-Google-Smtp-Source: AGHT+IGJnIP6trm/n/Ivi0WcjoGiFwJeK/q3hka33wn1C3QSjG5oxm0brSYLE1MXWh7b+L8cgcim0Q==
X-Received: by 2002:a7b:c391:0:b0:41b:bb90:4af with SMTP id 5b1f17b1804b1-420fd322d7emr44539235e9.20.1716476971597;
        Thu, 23 May 2024 08:09:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f5a27asm27906775e9.21.2024.05.23.08.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:09:30 -0700 (PDT)
Date: Thu, 23 May 2024 18:09:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vasant Hegde <vasant.hegde@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: drivers/iommu/amd/iommu.c:2011 init_gcr3_table() warn: missing error
 code? 'ret'
Message-ID: <7765e9c3-414d-444a-8943-7e244c945e57@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   29c73fc794c83505066ee6db893b2a83ac5fac63
commit: c9e8701132e6cc162d082e7dad8a2e9110f5f8fd iommu/amd: Setup GCR3 table in advance if domain is SVA capable
config: x86_64-randconfig-161-20240522 (https://download.01.org/0day-ci/archive/20240522/202405221116.X7cP3GzG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405221116.X7cP3GzG-lkp@intel.com/

smatch warnings:
drivers/iommu/amd/iommu.c:2011 init_gcr3_table() warn: missing error code? 'ret'

vim +/ret +2011 drivers/iommu/amd/iommu.c

c9e8701132e6cc Vasant Hegde 2024-04-18  1986  static int init_gcr3_table(struct iommu_dev_data *dev_data,
c9e8701132e6cc Vasant Hegde 2024-04-18  1987  			   struct protection_domain *pdom)
c9e8701132e6cc Vasant Hegde 2024-04-18  1988  {
c9e8701132e6cc Vasant Hegde 2024-04-18  1989  	struct amd_iommu *iommu = get_amd_iommu_from_dev_data(dev_data);
c9e8701132e6cc Vasant Hegde 2024-04-18  1990  	int max_pasids = dev_data->max_pasids;
c9e8701132e6cc Vasant Hegde 2024-04-18  1991  	int ret = 0;
c9e8701132e6cc Vasant Hegde 2024-04-18  1992  
c9e8701132e6cc Vasant Hegde 2024-04-18  1993  	 /*
c9e8701132e6cc Vasant Hegde 2024-04-18  1994  	  * If domain is in pt mode then setup GCR3 table only if device
c9e8701132e6cc Vasant Hegde 2024-04-18  1995  	  * is PASID capable
c9e8701132e6cc Vasant Hegde 2024-04-18  1996  	  */
c9e8701132e6cc Vasant Hegde 2024-04-18  1997  	if (pdom_is_in_pt_mode(pdom) && !pdev_pasid_supported(dev_data))
c9e8701132e6cc Vasant Hegde 2024-04-18  1998  		return ret;
c9e8701132e6cc Vasant Hegde 2024-04-18  1999  
c9e8701132e6cc Vasant Hegde 2024-04-18  2000  	/*
c9e8701132e6cc Vasant Hegde 2024-04-18  2001  	 * By default, setup GCR3 table to support MAX PASIDs
c9e8701132e6cc Vasant Hegde 2024-04-18  2002  	 * supported by the device/IOMMU.
c9e8701132e6cc Vasant Hegde 2024-04-18  2003  	 */
c9e8701132e6cc Vasant Hegde 2024-04-18  2004  	ret = setup_gcr3_table(&dev_data->gcr3_info, iommu,
c9e8701132e6cc Vasant Hegde 2024-04-18  2005  			       max_pasids > 0 ?  max_pasids : 1);
c9e8701132e6cc Vasant Hegde 2024-04-18  2006  	if (ret)
c9e8701132e6cc Vasant Hegde 2024-04-18  2007  		return ret;
c9e8701132e6cc Vasant Hegde 2024-04-18  2008  
c9e8701132e6cc Vasant Hegde 2024-04-18  2009  	/* Setup GCR3[0] only if domain is setup with v2 page table mode */
c9e8701132e6cc Vasant Hegde 2024-04-18  2010  	if (!pdom_is_v2_pgtbl_mode(pdom))
c9e8701132e6cc Vasant Hegde 2024-04-18 @2011  		return ret;

From the comment, this looks like a false positive, but could you please
change it to "return 0;"

c9e8701132e6cc Vasant Hegde 2024-04-18  2012  
c9e8701132e6cc Vasant Hegde 2024-04-18  2013  	ret = update_gcr3(dev_data, 0, iommu_virt_to_phys(pdom->iop.pgd), true);
c9e8701132e6cc Vasant Hegde 2024-04-18  2014  	if (ret)
c9e8701132e6cc Vasant Hegde 2024-04-18  2015  		free_gcr3_table(&dev_data->gcr3_info);
c9e8701132e6cc Vasant Hegde 2024-04-18  2016  
c9e8701132e6cc Vasant Hegde 2024-04-18  2017  	return ret;
c9e8701132e6cc Vasant Hegde 2024-04-18  2018  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

