Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB002046BD
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739347948; cv=none; b=qI+tvEGf5a0pjO2a3NEJaBc8hLVgDVNLNNNFCZdW26rESuOVRpTDLV4LtnuVbKAfp2L+T5mDXAr9IG27+nlYEFJYZ/5HjBNMGQhjLjWBOin2vpLT8GKqx1qn6C8Jo8tlezZjehd0EBV+/7EIDBDCwlPOcw3txma31Pl5UqtPSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739347948; c=relaxed/simple;
	bh=AOD6ZTunC21zm4VwIcT7DXopXjPX+m1lXeFUPn6bV8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AG/OOSTm73ddNF5ca39MzqnY0edBoNuyBHtBr4iuoPbLKqgGIRC7XlCd1GpLShGj9ZE6O/fKP94ibVHjArW+vdVTLWsLtWSttbxxwCPpkntzJaSatIn/TLuxcDBGKB0VFWJ1/3Dhq+TdbYzmEdaPmAo0XL33LR9SeLBpX1YD7AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BSHxksWW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BSHxksWW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7d58aa674so330448866b.0
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 00:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739347944; x=1739952744; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WPK4Zi+QKUvwDdcamJCtnHelUZQ7YZ84gTdE+DX9L4=;
        b=BSHxksWWg99cdaWa8llm5WAb+MzNrRb3nVf6/Wj+d6Dg6+S4TLH5FiDxDvsdvdCHfc
         NnPhGcgnX8b3m6xxOEgGO87/fKzPCuUvlPE8LKgbcnSr+FWOWzFa7GnVxIPpiOdg8j5c
         MLyvOLlWXIkwTHGaaBq+11YPI05ehvxohTi/TkJc3dGlqYTVseW/2+3qLkgxzN6Y73gw
         3MKZsXb2pgdJsUQbA6Zxm73bXr1+CK43IDFXah6mcaKjkv4hJcKiKCUrtz/usU7Hc3XE
         +ATy9I6vXMJ5Z7lb7aSVT2GkcUK/ZJ3r0Uz4eaaTRwlJ9P0HSAtwGOyKNuVx2fH0rv+n
         ZauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739347944; x=1739952744;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WPK4Zi+QKUvwDdcamJCtnHelUZQ7YZ84gTdE+DX9L4=;
        b=NVk7/mkcnSpxgmAIZN6rjAWE9Znu/XZk0+WlWyDZ51quFtmWedpclCzQzcYkyD9OU4
         xcIAz2UrP8CnHAJDTEIetEBScje9H24X3uu4T44MIcbudlk+oeKAuhssET5jA6dBoHin
         4muVULeyudYhkYe9uwLZpcoqOu9Xew3vQZtI3R/jNNn0d12r1K7yuekzwdomEupcm//f
         zklSi6H/5frUZIrVLXF/HJobDjTQEvbh2OV8jAMxoM2Eh/ftgsh33o4kDx6SCYuF4ENM
         9Rk5fyyHuER6RTF+akm7DtuSVZbmZdvm3r2cop8FQ7nas6PP+l7WYL40pRCY8/IWUplO
         5b2g==
X-Gm-Message-State: AOJu0YxBs11mHRfeLHcfhP8T6GH2iKZ92NC/Clg9uWo/vPXwrtTdJAJ6
	1OOwFoVv3zm760sihTsxjzVddc5aVXIizpwBu9y/agphUn/EY06sqF3rrEVU9YEEaMJ8+ac1PI6
	5
X-Gm-Gg: ASbGncsxpEfrM04AvXSstSwnACPFC8cCWphqKoMrprTGehfR91xayHjluPkGINOvtrd
	Q+aAEA0LEuF8Qfmk+PNiHrccGTETuxmsJS2CxiTMIRQHt5SoH72VhsLXUjR9QISyXSrkXHW9wWZ
	oTEiBtK9V3sU3LOKawJ+HdclvvyfXqSo3WRaTk1U5A3nrmVnq8dF93PuqDW0cl3tF9OmK7bm7Qs
	cLWQDS6UQw8s/6MYW4YbDMY2b/o17wBGleXB9YE1qGj2U34v8P6DWFwEtM1N+QIcWKCjX4iUZG/
	lBx33+AZAukJOeMT573o
X-Google-Smtp-Source: AGHT+IF6IqLQYVe3EfTRNtikkldoS6I8k4VVb8J5QhmXRUgUnhuaoEsvkH5JB9m/Sji1AzWb4VpBCA==
X-Received: by 2002:a17:907:94c5:b0:ab7:c6f4:9529 with SMTP id a640c23a62f3a-ab7f33781f4mr217865066b.7.1739347943434;
        Wed, 12 Feb 2025 00:12:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7e04bbbcesm284498966b.163.2025.02.12.00.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 00:12:23 -0800 (PST)
Date: Wed, 12 Feb 2025 11:12:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-freecounters 2/5] fs/xfs/xfs_super.c:1100
 xfs_init_percpu_counters() error: buffer overflow 'mp->m_free' 2 <= u32max
Message-ID: <2ecbbcd0-b5da-474f-b1f7-f32060352c92@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-freecounters
head:   3bbffc404041adfe745be0979943086ab448915d
commit: 401cd937aa9d718776bb7ce5379d248388c093bf [2/5] xfs: generalize the freespace and reserved blocks handling
config: riscv-randconfig-r073-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121406.RZwuvkY4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502121406.RZwuvkY4-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_super.c:1100 xfs_init_percpu_counters() error: buffer overflow 'mp->m_free' 2 <= u32max

vim +1100 fs/xfs/xfs_super.c

8757c38f2cf6e5 Ian Kent          2019-11-04  1066  static int
8757c38f2cf6e5 Ian Kent          2019-11-04  1067  xfs_init_percpu_counters(
8757c38f2cf6e5 Ian Kent          2019-11-04  1068  	struct xfs_mount	*mp)
8757c38f2cf6e5 Ian Kent          2019-11-04  1069  {
8757c38f2cf6e5 Ian Kent          2019-11-04  1070  	int			error;
401cd937aa9d71 Christoph Hellwig 2025-02-09  1071  	enum xfs_free_counter	i;

In GCC enums are unsigned int where possible.

8757c38f2cf6e5 Ian Kent          2019-11-04  1072  
8757c38f2cf6e5 Ian Kent          2019-11-04  1073  	error = percpu_counter_init(&mp->m_icount, 0, GFP_KERNEL);
8757c38f2cf6e5 Ian Kent          2019-11-04  1074  	if (error)
8757c38f2cf6e5 Ian Kent          2019-11-04  1075  		return -ENOMEM;
8757c38f2cf6e5 Ian Kent          2019-11-04  1076  
8757c38f2cf6e5 Ian Kent          2019-11-04  1077  	error = percpu_counter_init(&mp->m_ifree, 0, GFP_KERNEL);
8757c38f2cf6e5 Ian Kent          2019-11-04  1078  	if (error)
8757c38f2cf6e5 Ian Kent          2019-11-04  1079  		goto free_icount;
8757c38f2cf6e5 Ian Kent          2019-11-04  1080  
8757c38f2cf6e5 Ian Kent          2019-11-04  1081  	error = percpu_counter_init(&mp->m_delalloc_blks, 0, GFP_KERNEL);
8757c38f2cf6e5 Ian Kent          2019-11-04  1082  	if (error)
401cd937aa9d71 Christoph Hellwig 2025-02-09  1083  		goto free_ifree;
8757c38f2cf6e5 Ian Kent          2019-11-04  1084  
7099bd0f243fa7 Christoph Hellwig 2024-04-22  1085  	error = percpu_counter_init(&mp->m_delalloc_rtextents, 0, GFP_KERNEL);
2229276c528326 Darrick J. Wong   2022-04-12  1086  	if (error)
2229276c528326 Darrick J. Wong   2022-04-12  1087  		goto free_delalloc;
2229276c528326 Darrick J. Wong   2022-04-12  1088  
401cd937aa9d71 Christoph Hellwig 2025-02-09  1089  	for (i = 0; i < XC_FREE_NR; i++) {
401cd937aa9d71 Christoph Hellwig 2025-02-09  1090  		error = percpu_counter_init(&mp->m_free[i].count, 0,
401cd937aa9d71 Christoph Hellwig 2025-02-09  1091  				GFP_KERNEL);
7099bd0f243fa7 Christoph Hellwig 2024-04-22  1092  		if (error)
401cd937aa9d71 Christoph Hellwig 2025-02-09  1093  			goto free_freecounters;

Assume i is zero

401cd937aa9d71 Christoph Hellwig 2025-02-09  1094  	}
7099bd0f243fa7 Christoph Hellwig 2024-04-22  1095  
8757c38f2cf6e5 Ian Kent          2019-11-04  1096  	return 0;
8757c38f2cf6e5 Ian Kent          2019-11-04  1097  
401cd937aa9d71 Christoph Hellwig 2025-02-09  1098  free_freecounters:
401cd937aa9d71 Christoph Hellwig 2025-02-09  1099  	while (--i > 0)

This should be: while (i-- > 0) {.

401cd937aa9d71 Christoph Hellwig 2025-02-09 @1100  		percpu_counter_destroy(&mp->m_free[i].count);
                                                                                                   ^
Out of bounds.

7099bd0f243fa7 Christoph Hellwig 2024-04-22  1101  	percpu_counter_destroy(&mp->m_delalloc_rtextents);
2229276c528326 Darrick J. Wong   2022-04-12  1102  free_delalloc:
2229276c528326 Darrick J. Wong   2022-04-12  1103  	percpu_counter_destroy(&mp->m_delalloc_blks);
8757c38f2cf6e5 Ian Kent          2019-11-04  1104  free_ifree:
8757c38f2cf6e5 Ian Kent          2019-11-04  1105  	percpu_counter_destroy(&mp->m_ifree);
8757c38f2cf6e5 Ian Kent          2019-11-04  1106  free_icount:
8757c38f2cf6e5 Ian Kent          2019-11-04  1107  	percpu_counter_destroy(&mp->m_icount);
8757c38f2cf6e5 Ian Kent          2019-11-04  1108  	return -ENOMEM;
8757c38f2cf6e5 Ian Kent          2019-11-04  1109  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

