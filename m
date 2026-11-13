Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554331;
	b=id/DE9CjvYNo/BOKd+1LtNcZ704xAHeR/8Ro8Sm7Af2pjjot9QWvzFSMrPwsTB+6dKK+
	 TSs0VjoTef3CKc3mj/HRpzwq+QOzl0cxocsJRSmNuqsrt/dDnPq1ZyYNdN8VPWQ+5E5Xl
	 KvXcrMpbdIEu7Sn5x/0fK58emAKFTci0fwBiTxErOeKsgkz6e2Ogc8KnplFxwYYt9GIqp
	 bWbZqyN9RurLnlC4PHxz8EFVPg5P/rUFKylYaZPP1chXDp9Qvg+qg3q2vmIAiVtXED2Y9
	 sWOs2YgRvKh336Usn1FXlsmHep90xgJaeXQ3+jhQVSgKHt3ncinMzN3TVRmLBz9jQzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=CunFNSp2/vDLrfhDOylaPCv63mK4n2/bJ1fZmlHYspM=;
	b=ntyKSRJHmTpyge8mAQOjKvxKPQLSYklEh9KrlLbGAyBk9Zy7Kmq7gP8tapPEk4p/IR5M
	 9zXR2XRt2NBFrOM4W1ms5HgYK175auQ+3v54nt19DqoxQQvh3wqaE/dJ6KB2bTFW/9LhL
	 43yY3JCZA0kWUlAM6wXmYjoumjdMZG7OBa8cZGyvF8J4d5PqZPqSY02lHifRsIq4BxhKr
	 7h4ynV3IUgp3JYWSfNlOa3HvmXdXyjsX+dyew3XLIk9J7Fw+/UIAsxWNnmsQJuQlzGtNH
	 Ivfeq3N8yX38GN1YsIAeA/11w264jHAeiVqCgaef/jNP7G9xbzl+MkW0R8p0He4o6zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=cryspen-com.20260707.gappssmtp.com header.i=@cryspen-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oa3U0X9o;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F507606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 07:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F507606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cryspen-com.20260707.gappssmtp.com header.i=@cryspen-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oa3U0X9o
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so8432565e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 23:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryspen-com.20260707.gappssmtp.com; s=20260707; t=1794554330; x=1795159130; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CunFNSp2/vDLrfhDOylaPCv63mK4n2/bJ1fZmlHYspM=;
        b=oa3U0X9oAfwCs+hxT/a+vs2TZPP+tRpSWIL6FLn+jhs0NhLZAg5pbK8tLP6RHAVgvw
         B2hfiYQ46hT1Gz3h04K7vNLFuF6VDrtXm4s7pDJlsHXT5B+WX+nZW+eCfd2bgCeFfQQt
         DoaAvE9DQjTikC9jxlXfc7s3VarjGXPGFsGuOZgwh8s9FTT9xc4xvu3mvp8e19xUPXrJ
         To9iesn97a6zEl9vVv6khrSpG7QI7tIGHsAvMpSTpcQExedvgeOXa6/w4AnAJEmLpUm4
         zFQyqh4Xrt2gyo5TjxcppwaRJZ1mBBSarbBCoOXD7CVC4X0hZrRA9mVpPEXiFCvLCSS4
         1xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554330; x=1795159130;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CunFNSp2/vDLrfhDOylaPCv63mK4n2/bJ1fZmlHYspM=;
        b=VDrZGxjxZ1vm1F+jml7YhFeuLqAYdfYNMfsKbS1MRDQ0SxyIRDq63Y90Uf+nVdxmse
         x65yh6qhDaxRu5zoGTwmakhJpCJ5QUpAOIY5Wnj0Zgu7iXcipFBhAMQZfR9eDVZplXSG
         KAr9sIHPZWqmBPOAGMcov/hlZKTXnHUispPmjA7g1H9EmVniHbbu7avbfekgMTVaS6sV
         Xl4PEo1O75M138em71LkN4B53rsDChKYm6V2SBbzn6JSYeJT7ePOZY0KG0GAgeRdkAEg
         b/Ne/TLB4KP8AQY8jjwENj03g0czMBWIwerzUzsYBaKwimQmBxmPLzERDNCQH/SXYUKg
         oXww==
X-Gm-Message-State: APuU4Z+sUOrs0Hy+mWAiQTreaNX8ZgSHSUgSALgKhks5k7HFKEM80kbC
	MXDX2Pyf6ltPUYDEbgcWqHxuiXoIDnFNvnS2Csz17j1EMa6g7bl1efr38yCumqDWB83z3fIHu/i
	lv1ftafzgjA==
X-Gm-Gg: AYBFou3MiRvOxRytNglX1msNDo1mTFtU4fZQrnp1yk9eDvXLRYRWeByfy7uaJjEFraO
	o/wImoFV/ks/KN0AL6tOOrwyDDXbL02cg41jAd/x3szsx19gAU/Q8WFgaEo2eunNz28briYxNx1
	inwL4DK1EKky3lewnOjjrCzflyFXitH6q8aEpjyagT+NCKhhf5WgZRyS12OV+XSHDHQVnDciBPH
	yeYB9GTP+nFgn5N0VKs90qkhoXcLaY59KoUA+VW4SYccnm03bFFmVmVzJWsNTefHrq0LVo//deQ
	r7qICFMX96kknXfP6cGey2bG0BXnAy5qFq//wjcB1KvkisGZb0hVNGppJA7IZvmXTZV3vLgLkdh
	R9750P+Ya4DyM4sEowJ5D1ZnltQ/rLjTBuQhrmZiLq7Qx1hHKXBEbCiXNoEe8RLfvAPUmlCMi9m
	ajUw4MrNTetrDLnthgKT/XLOYubGhDOt3YxPNrxjQPMKsP4IQxrLJMlU/drbAidgAQ8AhmPI+fH
	azYLx0WceoJNn0W6ZzGR5wWziFOl3jABuzdThZ/KVQM6vKmZx75IEYvX5Jp+Uug0ixHBuNufNR+
	8tXx9Ex70buEE3IesBGV5CeYFQ==
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr32122805e9.34.1794554329667;
        Thu, 12 Nov 2026 23:18:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm3692391f8f.23.2026.11.12.23.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:18:49 -0800 (PST)
From: Dan Carpenter <dan@cryspen.com>
X-Google-Original-From: Dan Carpenter <error27@gmail.com>
Date: Fri, 13 Nov 2026 10:18:45 +0300
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 448/448]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1071 amdgpu_is_kicker_fw() warn:
 if statement not indented
Message-ID: <202611122110.Nh7W56Zp-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261113071845.7hoWunLapWdrQkj6ZeyKTQnmnI6MWoXMg6nflEjJEmg@z>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ec4ee04f96442af315eacc59a21b3381640069ae
commit: e0b33ebf77d967e563a0db05f608fa2313232fe8 [448/448] drm/amdgpu: Add kicker device detection
config: i386-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261112/202611122110.Nh7W56Zp-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611122110.Nh7W56Zp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1071 amdgpu_is_kicker_fw() warn: if statement not indented

vim +1071 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c

e0b33ebf77d967 Frank Min 2025-06-04  1066  bool amdgpu_is_kicker_fw(struct amdgpu_device *adev)
e0b33ebf77d967 Frank Min 2025-06-04  1067  {
e0b33ebf77d967 Frank Min 2025-06-04  1068  	int i;
e0b33ebf77d967 Frank Min 2025-06-04  1069  
e0b33ebf77d967 Frank Min 2025-06-04  1070  	for (i = 0; i < ARRAY_SIZE(kicker_device_list); i++) {
e0b33ebf77d967 Frank Min 2025-06-04 @1071  		if (adev->pdev->device == kicker_device_list[i].device &&
e0b33ebf77d967 Frank Min 2025-06-04  1072  			adev->pdev->revision == kicker_device_list[i].revision)
e0b33ebf77d967 Frank Min 2025-06-04  1073  		return true;

Missing tab.

e0b33ebf77d967 Frank Min 2025-06-04  1074  	}
e0b33ebf77d967 Frank Min 2025-06-04  1075  
e0b33ebf77d967 Frank Min 2025-06-04  1076  	return false;
e0b33ebf77d967 Frank Min 2025-06-04  1077  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

