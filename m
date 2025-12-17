Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0113B36403C
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987428; cv=none; b=mqzbk/RKKH8juxLam9FHIryDPjKBLYMRrBgDNGLtVmXhUDFkauMP5EYO6d/LeHoW5iTApBwilL2IZOsTL1HwoSUfkSKUNB/qEQo1c3PnKsVp+t91l13UrrW8Uf1eMKgzneNAyaU04WT98seAtCRYFYytBFM/cBhMZqXCNlXqhZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987428; c=relaxed/simple;
	bh=GlIJ5of1Zl2EkqR+zuhItWNm9NIA78SnJpZyxdS0BDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLokICjK66j5/2asRUFkrnpOeFo/Ljued1DkE1Vj20mOJzy+RQWNcsoJ6X5M9f2bL2B05QNx7ea3eu5Z2aGSSrAB4Xw08UFgBsBdfCop9N2CKHGIHuiRA33SZVk9yL6OvJuUj/yV8ux2ABDYhoHPDWUl66VSKv7X385b0XX13oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CnzfUStl; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnzfUStl"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso4565985e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 08:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765987424; x=1766592224; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRjU4HeFbLAsTOgZNHTW+iAgENcpj7ArfHAuBzphWhc=;
        b=CnzfUStl4+/qLluRBSj6eukeucHvcf6zRNGXp5jTfn2qL646TldbG7Ua6LyeCAwuFd
         fN6y1zo7JMUzYVBpRBCtW90THylfkpCU7H5pYGJURRPUYlM0wkIfB6y9PqZxKMtX3Ut/
         TO1mwfFnBAAsGsEpPe2TBUWODF2rFLNFOHmkSjYTCPLKXgT2xdLSIzWfCL7Oyqrs0TMT
         tp7gDaYE7Jlcoc6moERJOseAt9+P1SxIOBdolKbLxrSoYsBhyxoYed+HBwFrck+A1lFZ
         DSSvHvVXvN56s4BIUwt6cMDTvKG+GRaoFLhXb6BLdBE9eLCxCb3W0jldsPxbVlArsgKW
         YbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987424; x=1766592224;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRjU4HeFbLAsTOgZNHTW+iAgENcpj7ArfHAuBzphWhc=;
        b=OLQf4aM8UITIu124o30bH3YN2IHFfUf06aAvehaNmX9n+6thutRBKHfgD5++t0ZRdK
         aUOWxAnSzIZw4QekfC+QddgwAVoQ+COoUfgZw4c3I2YPn3yHaq2zdPx8r6XimB4bwK2+
         PWdHsABryFJWuiZ0VbCJxokT7KFnUgfLYs7Jo/XiXyGRP9LlTLE4SqT/Nvx1J8KzsZoT
         9JNqdXpePqLiKikm5EBikUVxJMMo8bTyBYJr3SHEJC/mgQmylShHpaOajgKyYT5S58yS
         pu/Zlfh58rYj/pqH7XF9kPdunsJWT9sdUWzRZXRTGbXB1NR4afVoApH32Q4t1nzUl86j
         XKnw==
X-Gm-Message-State: AOJu0Yw8r+I43WBujoW+6FZvxt2qRwQ/ZUCM1cvQOVvodVHs+SJoceNR
	xXERbxnE8RBTl+pGohrRKhqEZTp7v5sA04MMHU0/m4fQ0nIlPL7yFm9jL2kPXsZ0yhBVTjtfsIp
	sTxL0
X-Gm-Gg: AY/fxX7k7tEmJ2ACxTo4h7pT6G4WR2URSufKtunsNLz/ZeKquen6WGrsc6FEG49DooX
	BHQ7SWtCcoDWwS+lUlvalBk5GpsU7qY9OV/nEf9pdSK+6WsSnvHUKwl6+jw1vihedARDySqxhrV
	hYuS2A8zVO8vtR8FY8l70HxYv3C+o86dabGK6R7uDHrAlxm4ooJInUo5sFQk3xElqfXP1gpDZEi
	kb/LYO4mBxEUGRnkT5tVjdTCKRbIIgh8aKRjyDGIbA3mk7rayo26KTYDBn3jidfFSVxaoq+iMAg
	ia5ZYTiNSH3wUy49oodqFRb8AjOyBXqGxAPsoUwB6BxsthmCa928JvLjtk19ff6QN7h2NgK4g1Q
	tM6i0yrSs+iQy3ceQqMVFzZpPV8sQQuwxFumJCz7+wxhsrPVB9iHqcKkGlPeQUuB+3NBIli9B9g
	+4JMMTNy2JpLIFk6nZ
X-Google-Smtp-Source: AGHT+IGWpXhuggxM6b45Knw0C849qblvhFH2i9u2Vx0XfSWoeEeYDL2GBKZJTuX8RwWmO451J8ANMA==
X-Received: by 2002:a05:600c:1444:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-47a89ecc2a7mr176545925e9.12.1765987423867;
        Wed, 17 Dec 2025 08:03:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade8072sm5700285f8f.25.2025.12.17.08.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:03:43 -0800 (PST)
Date: Wed, 17 Dec 2025 19:03:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, SeongJae Park <sj@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 44/115] mm/damon/sysfs.c:920
 damon_sysfs_sample_add_dirs() warn: missing unwind goto?
Message-ID: <202512141528.AD9GSzHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251217160340.0YqK3ekvp1GRF0S8IMxBGIWcUP1z_ZKhyQBKBsLX9Cc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   4daf22e4c21ef13ee2779580295eb0073dc3163b
commit: f4df9946a1d00c8aa6326f28807efec79af1c2ea [44/115] mm/damon/sysfs: implement sample/filters/ directory
config: i386-randconfig-141-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141528.AD9GSzHJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512141528.AD9GSzHJ-lkp@intel.com/

smatch warnings:
mm/damon/sysfs.c:920 damon_sysfs_sample_add_dirs() warn: missing unwind goto?

vim +920 mm/damon/sysfs.c

4242d70b872082 SeongJae Park 2025-12-02  901  static int damon_sysfs_sample_add_dirs(
4242d70b872082 SeongJae Park 2025-12-02  902  		struct damon_sysfs_sample *sample)
4242d70b872082 SeongJae Park 2025-12-02  903  {
4242d70b872082 SeongJae Park 2025-12-02  904  	struct damon_sysfs_primitives *primitives;
f4df9946a1d00c SeongJae Park 2025-12-02  905  	struct damon_sysfs_sample_filters *filters;
4242d70b872082 SeongJae Park 2025-12-02  906  	int err;
4242d70b872082 SeongJae Park 2025-12-02  907  
4242d70b872082 SeongJae Park 2025-12-02  908  	primitives = damon_sysfs_primitives_alloc(true, false);
4242d70b872082 SeongJae Park 2025-12-02  909  	if (!primitives)
4242d70b872082 SeongJae Park 2025-12-02  910  		return -ENOMEM;
4242d70b872082 SeongJae Park 2025-12-02  911  	err = kobject_init_and_add(&primitives->kobj,
4242d70b872082 SeongJae Park 2025-12-02  912  			&damon_sysfs_primitives_ktype, &sample->kobj,
4242d70b872082 SeongJae Park 2025-12-02  913  			"primitives");
4242d70b872082 SeongJae Park 2025-12-02  914  	if (err)
4242d70b872082 SeongJae Park 2025-12-02  915  		goto put_primitives_out;
4242d70b872082 SeongJae Park 2025-12-02  916  	sample->primitives = primitives;
4242d70b872082 SeongJae Park 2025-12-02  917  
f4df9946a1d00c SeongJae Park 2025-12-02  918  	filters = damon_sysfs_sample_filters_alloc();
f4df9946a1d00c SeongJae Park 2025-12-02  919  	if (!filters)
f4df9946a1d00c SeongJae Park 2025-12-02 @920  		return -ENOMEM;

goto put_primitives_out;?

f4df9946a1d00c SeongJae Park 2025-12-02  921  	err = kobject_init_and_add(&filters->kobj,
f4df9946a1d00c SeongJae Park 2025-12-02  922  			&damon_sysfs_sample_filters_ktype, &sample->kobj,
f4df9946a1d00c SeongJae Park 2025-12-02  923  			"filters");
f4df9946a1d00c SeongJae Park 2025-12-02  924  	if (err)
f4df9946a1d00c SeongJae Park 2025-12-02  925  		goto put_filters_out;
f4df9946a1d00c SeongJae Park 2025-12-02  926  	sample->filters = filters;
f4df9946a1d00c SeongJae Park 2025-12-02  927  	return 0;
f4df9946a1d00c SeongJae Park 2025-12-02  928  put_filters_out:
f4df9946a1d00c SeongJae Park 2025-12-02  929  	kobject_put(&filters->kobj);
f4df9946a1d00c SeongJae Park 2025-12-02  930  	sample->filters = NULL;
4242d70b872082 SeongJae Park 2025-12-02  931  put_primitives_out:
4242d70b872082 SeongJae Park 2025-12-02  932  	kobject_put(&primitives->kobj);
4242d70b872082 SeongJae Park 2025-12-02  933  	sample->primitives = NULL;
4242d70b872082 SeongJae Park 2025-12-02  934  	return err;
4242d70b872082 SeongJae Park 2025-12-02  935  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

