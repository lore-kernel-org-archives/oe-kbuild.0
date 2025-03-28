Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8001E1DE8
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 05:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743139615; cv=none; b=PJoGmK10Zvmvid3rNFE+zJLCAa2a/0iQv/U319hefODsU5ZW+RHN9peUZG2+a9YuZtWxPmzzEVQ4eN6UUdQl+nmXqlweuF0BMbGf+J4wm2W5pmBKGwW6BnQEjTtY1npM7aZZDQ4HZpYlYu0vfUiMzFr0dVOrS1jvk3+fmMejvNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743139615; c=relaxed/simple;
	bh=1zzZ3hAoQgiQKDwuWs4Af8NLyALwZLGxcTpksqLDoW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pnw/rekth9aYG4Z2ckuBdwcEDwd2vDsr98UvP+9yvLWRmQ6yk8jQ87QToavihL0OOMgLD7i1F2h0G8QZHlASbZWdh9Em0Xwt0jxWjg2iNQfVKGeop6Yd4SuOH32EyaC4/l5EJhY3nUqQUxWnnu2/RT26gQh7JA/SC6d+BtlWwP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOn3EAwM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOn3EAwM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so10842005e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 22:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743139611; x=1743744411; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmoyoSA2Dy8iFsEnEBLlb/cn6Ozp+HwWcLRRzXUA8II=;
        b=iOn3EAwM71Paeyzus/cAboWvgHVVv8kp/EOYEcnhT7gD8aHg9v2Ph7zdGFjJRRe7Fj
         flWogClPT3di1pGWjR7cD0NduuWlc70p/1DqVtUHR5C96WzsDt6ORGOcQ3Qzjk+lYFog
         rJa/kYZGxg6MWjZaHdsWc++8Y0iLD7hy5BUKDJQR7q/GlUsBF9whSi//a5v6OSM+WeyY
         rdHxpOJlD63+wolG0404XfxuLElkVF0cVHyuMnsmKobLBnknn7Jy25rtCHIHJ49yekLj
         7EjxIrlrLLusNVmeyb3fMBHiCjf0oYS8cE0TPnZXDIbZDsNDViAID7AHkqsRbIvYV5Y2
         5ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743139611; x=1743744411;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmoyoSA2Dy8iFsEnEBLlb/cn6Ozp+HwWcLRRzXUA8II=;
        b=VSFVtRWIyzvPDiAOD0MWe+B+RLOlwg88o/68m4vUzTt1MZspjNLBt+Wnncf1Xxi8qR
         qc+z0SQUFxt+8rkZLmH4ni2HX9Y404IGY7da3nWibN96CGpL2dXXpQKRjYanAccQeHw9
         jV0fHKQ/7lDMezB/wQPdT3QYGu1n1B0xeQ6toaJ2oHIBeFvRAh2WeTYY7tZvr2PMNuun
         HwMmhUg4Dd9+AiOvYoXXWeS43NKFe3Q166Uj7ZHPcU/T3QgXHa3APwdFdBLByyuv6FjZ
         v2d7UiKCGliQNANgWzmbZxP6826E+3SDhYLsIlyw1dJ3TEh8wU/r96+rlFOG9bb9Z8rf
         lt7Q==
X-Gm-Message-State: AOJu0Yyr4PRd/ER4asRMXiqiHx2uRaWf97FdJ5DqTI+r5ph/eisL9y1c
	9peCg+SJiAMGuBCg8gMbyYco15bDPYVx4nVHn3LPSqxgjHka2ADZFByMfTq9KX5yE7msjB+BLlP
	4
X-Gm-Gg: ASbGncsCQx5TUATE/XRpTSDLABd5fji6mujqR3HaAqBsPJeFTdfIFanQ/PEk2r4IYVT
	w3cWowa2wrdy3Lv/KRWyAZWB1iKVC/19nfJxLxn45C7iIvLNiCJUkkEfo6dWMRCPxfWqJKhJR0q
	88bEjQKtNJEh3Gc7nD+77sQmZ8EWNuKYp2QcxqNHQ+5pqJmhF/fK6NyxYs5dJGp1pTN2Bm0/12p
	houqrMisFjWD9eums3k0Ck15rCOV3J+1Aht10eb5lgm4TOOTnXwD0ds/Acjw1E3F/6kTwhTgVTM
	05y3+LvapySHwxiKDp4PaAgGbqTKj+aD2z0KzeXd/BZP0+u5Mg==
X-Google-Smtp-Source: AGHT+IH6wIHQave/ijbn3USkRE6+YMPxCQbHROwx5BiESapOlb24WCKhxVJv8KMRLhDAEGMVaztxUg==
X-Received: by 2002:a05:600c:6c4f:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43d9105c99fmr12009115e9.9.1743139610634;
        Thu, 27 Mar 2025 22:26:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d82efe678sm58772765e9.20.2025.03.27.22.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 22:26:50 -0700 (PDT)
Date: Fri, 28 Mar 2025 08:26:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alex Markuze <amarkuze@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	ceph-devel@vger.kernel.org
Subject: [ceph-client:tls_logger 19/40] fs/ceph/super.c:1042
 ceph_umount_begin() warn: variable dereferenced before check 'fsc' (see line
 1041)
Message-ID: <7ffc0531-0240-4a83-8062-e77c7710d93d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git tls_logger
head:   3d957afa4285ed4deaaf42d200ba7ee1f3092f8d
commit: 75b56e556ea415e29a13a8b7e98d302fbbec4c01 [19/40] cephsan new logger
config: x86_64-randconfig-r071-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280852.YDB3pxUY-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503280852.YDB3pxUY-lkp@intel.com/

smatch warnings:
fs/ceph/super.c:1042 ceph_umount_begin() warn: variable dereferenced before check 'fsc' (see line 1041)

vim +/fsc +1042 fs/ceph/super.c

631ed4b0828727 Jeff Layton  2021-10-14  1037  void ceph_umount_begin(struct super_block *sb)
16725b9d2a2e3d Sage Weil    2009-10-06  1038  {
5995d90d2d19f3 Xiubo Li     2023-06-12  1039  	struct ceph_fs_client *fsc = ceph_sb_to_fs_client(sb);
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1040  
38d46409c4639a Xiubo Li     2023-06-12 @1041  	doutc(fsc->client, "starting forced umount\n");
                                                      ^^^^^^^^^^^
Dereferenced

3d14c5d2b6e15c Yehuda Sadeh 2010-04-06 @1042  	if (!fsc)
                                                    ^^^^
Checked too late.

3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1043  		return;
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1044  	fsc->mount_state = CEPH_MOUNT_SHUTDOWN;
50c9132ddfb202 Jeff Layton  2020-09-25  1045  	__ceph_umount_begin(fsc);
16725b9d2a2e3d Sage Weil    2009-10-06  1046  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

