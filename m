Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F21E32D4
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740639735; cv=none; b=PPXc0Ozx0095HoP3VmZXaJQoRzJBdhUXGmSJ8J94/jc5VOHd2Utr+vj2gIKHnP3CXhUmaXfK32LU3sWA0+5Gjl+OuXbTHNNioQIJqpMp1EuRnd5WlMI0RsxvXqi8wb4hqHtGEpVIC/f1dKynSSEQMUz5fuaBAlkNU+xLEMlhoM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740639735; c=relaxed/simple;
	bh=1VQKSHbB56NTrKI9rhK1gz3w3fRv4eTAztp7gty4Ydo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dkh4bXQsYHyBPSHxoX6dhZinqUoWO/E+fQhPAlRHL1td0jnCP+bfNFEn8jMqaMTOE8WlhXXt61gq78fkui4mcQTyFXLMjkusiBqPTYbUENmV0Ow+q5RrSE6VvzejDUuFazxZGLFr9hmihVISO6Zsfx3wuYOeQhCdL4nm1QsCHW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ix7j4BW1; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ix7j4BW1"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abbae92be71so53378666b.2
        for <oe-kbuild@lists.linux.dev>; Wed, 26 Feb 2025 23:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740639731; x=1741244531; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bo13w7x737OdjbLPlzuZ5GFRTZoG+8uVoqfsoKMASiY=;
        b=Ix7j4BW1oCwbrqr2cWIY409dm3g8+bMydOk4MJ8P7sGnvcd0nfAnc45vuop4jID5m3
         jq5u7mdcwL102QPhWqVQCY0gjEPWxSG9pOvtLpOx+YfCtjFaEwqz4ssSZGvzM2+9BEz+
         U/wZ1eLfh3Aqy5BSbpzqptvEyvPpQtto357JL/2MSfE3H7iT2okNOHuQuDTypy/WJnC/
         /rZz1oH9dftB0l+ltTuj6WL5HR/vcIinHS52A0ktLPcV/JMFj8Mqaph5YiJfNcDj2hu6
         RKe+cSeeEidarDaAOxcNc5A1WFE9e/jpFWGOuBUFjgT4ChFdwOyK5HS/oJS44wLIlYXr
         6Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639731; x=1741244531;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo13w7x737OdjbLPlzuZ5GFRTZoG+8uVoqfsoKMASiY=;
        b=GPPU8fK4Q5X2OJsU5hOs4BBz+qRurQWOdyiplUOMT7ahRSXhgEKFaYsS9RpaY2iJcm
         U4/wGiHFl2QoXsOEacLwGZ/sXJVYeuXUrJA1jwifZdHBK/iTlGq2ZJ27cVLl8sMf1JRp
         Z+lkQ+F4ALNoC4Dt3IOnKJ+fGRUGom8QhEFg9piBfReOhAafedtGtnRkZQx2EkSMxK47
         Ud4kd2YOLRB09fdUppJUKbgt2IvVBEYx9HOtlicw2LbS/glzIRuOquK1DSjPsVwcuWWs
         gta7D8pYh0XwYb/Wo8mmbH0QZVTUe+JgYdjD9/UM80+X0Gdgv1YMtQHtdIYR27EpQxyH
         QIRw==
X-Gm-Message-State: AOJu0Yw5sSwzKHY1jnXZ9qtOVyrEa11+bS950VLs590LITI0dY0fUqaJ
	6Dr+YlJEbq5kwA2bexs2EhjQAR00yWW+FFNJbtagmmj6GzKfJt1sV9gtgqH1U/3AFyiJR5JJEoq
	7
X-Gm-Gg: ASbGncuRlizomFEwLDKZ8EWgX6t/rTmm1A81QdU2goAscn3Ly3JL7qm13K8i9UXz+ZI
	iknqRJqGzhG+zOLdg/IgOS9PNIYxe7KgwGZI9Z4f0VaHl2RKIl+beuzW4FlrxhEHawJO5IQivfs
	573S8Ootlua5kab0MUsobTuYYeriC4hTDPB9lx9UKIskjnatCtaWI31A/KkYo6Nk12ma90G8M+c
	40vsoKWWpwzWmrnY8E2DT2byvi3rH/oOiVqPcuWC3Lpt2hipHr+39v0QczdlX4f5RZyq03TSwEs
	YqJXpv28x3VGifuweFu4chOaYFvAVdM=
X-Google-Smtp-Source: AGHT+IG8/trVIvT9OAnzIkJD18llR8tc6FVRTdKhsOlGZ5chkknGa49/r/KHdA2+qcmDHsdJRdHF2Q==
X-Received: by 2002:a05:6402:2812:b0:5df:25e8:26d2 with SMTP id 4fb4d7f45d1cf-5e444853ee3mr26222525a12.5.1740639731365;
        Wed, 26 Feb 2025 23:02:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c3bb733asm645217a12.38.2025.02.26.23.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 23:02:10 -0800 (PST)
Date: Thu, 27 Feb 2025 10:02:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: [linux-next:master 4924/6583] drivers/iommu/iommufd/device.c:327
 iommufd_sw_msi_get_map() error: 'cur' dereferencing possible ERR_PTR()
Message-ID: <8aafd350-322b-4ce7-b228-ccf2c36e0333@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: 598749522d4254afb33b8a6c1bea614a95896868 [4924/6583] iommufd: Implement sw_msi support natively
config: i386-randconfig-141-20250226 (https://download.01.org/0day-ci/archive/20250227/202502271339.a2nWr9UA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502271339.a2nWr9UA-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:327 iommufd_sw_msi_get_map() error: 'cur' dereferencing possible ERR_PTR()

vim +/cur +327 drivers/iommu/iommufd/device.c

598749522d4254 Jason Gunthorpe 2025-02-19  303  static __maybe_unused struct iommufd_sw_msi_map *
598749522d4254 Jason Gunthorpe 2025-02-19  304  iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
598749522d4254 Jason Gunthorpe 2025-02-19  305  		       phys_addr_t sw_msi_start)
598749522d4254 Jason Gunthorpe 2025-02-19  306  {
598749522d4254 Jason Gunthorpe 2025-02-19  307  	struct iommufd_sw_msi_map *cur;
598749522d4254 Jason Gunthorpe 2025-02-19  308  	unsigned int max_pgoff = 0;
598749522d4254 Jason Gunthorpe 2025-02-19  309  
598749522d4254 Jason Gunthorpe 2025-02-19  310  	lockdep_assert_held(&ictx->sw_msi_lock);
598749522d4254 Jason Gunthorpe 2025-02-19  311  
598749522d4254 Jason Gunthorpe 2025-02-19  312  	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
598749522d4254 Jason Gunthorpe 2025-02-19  313  		if (cur->sw_msi_start != sw_msi_start)
598749522d4254 Jason Gunthorpe 2025-02-19  314  			continue;
598749522d4254 Jason Gunthorpe 2025-02-19  315  		max_pgoff = max(max_pgoff, cur->pgoff + 1);
598749522d4254 Jason Gunthorpe 2025-02-19  316  		if (cur->msi_addr == msi_addr)
598749522d4254 Jason Gunthorpe 2025-02-19  317  			return cur;
598749522d4254 Jason Gunthorpe 2025-02-19  318  	}
598749522d4254 Jason Gunthorpe 2025-02-19  319  
598749522d4254 Jason Gunthorpe 2025-02-19  320  	if (ictx->sw_msi_id >=
598749522d4254 Jason Gunthorpe 2025-02-19  321  	    BITS_PER_BYTE * sizeof_field(struct iommufd_sw_msi_maps, bitmap))
598749522d4254 Jason Gunthorpe 2025-02-19  322  		return ERR_PTR(-EOVERFLOW);
598749522d4254 Jason Gunthorpe 2025-02-19  323  
598749522d4254 Jason Gunthorpe 2025-02-19  324  	cur = kzalloc(sizeof(*cur), GFP_KERNEL);
598749522d4254 Jason Gunthorpe 2025-02-19  325  	if (!cur)
598749522d4254 Jason Gunthorpe 2025-02-19  326  		cur = ERR_PTR(-ENOMEM);

return ERR_PTR(-ENOMEM);

598749522d4254 Jason Gunthorpe 2025-02-19 @327  	cur->sw_msi_start = sw_msi_start;
598749522d4254 Jason Gunthorpe 2025-02-19  328  	cur->msi_addr = msi_addr;
598749522d4254 Jason Gunthorpe 2025-02-19  329  	cur->pgoff = max_pgoff;
598749522d4254 Jason Gunthorpe 2025-02-19  330  	cur->id = ictx->sw_msi_id++;
598749522d4254 Jason Gunthorpe 2025-02-19  331  	list_add_tail(&cur->sw_msi_item, &ictx->sw_msi_list);
598749522d4254 Jason Gunthorpe 2025-02-19  332  	return cur;
598749522d4254 Jason Gunthorpe 2025-02-19  333  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

