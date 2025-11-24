Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D02E03E6
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971614; cv=none; b=C6FwRuisX6t8W0+fOzvgzAhnNZlZBUzgEDbxEG/S+noPF5PzLdZHBhkuBbqFMpmKyY8oka0ufoA3BLtdEh/vkLUdTLo11v+JiideGSblTclEWmKi44Nw782esB9y9f9SbnImHNA/406Kvm8OqoehYuyZhZ9nlsTj45dOkPyHsIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971614; c=relaxed/simple;
	bh=04CAVc9NYmzBARlfFLXzpIVPUPs15woRVlixT8WhzEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F9eKYAf/OAeYlFJpgugVK/J9dsYSTzxDonzXmcS7f7lQKcS5Vn3pF807pL5pb3MaK/dEoBpnlq5q0ATvXOdqWr1/yLN8wdj1CCJs/kye0V1dbxzS6VfCr36iTY9PDALOJXZzQ4+m7GO/gy7GKW7OX1fxOKPg4DWaG5n1GM/bUi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MeBKpO2z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MeBKpO2z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so33623295e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 00:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763971611; x=1764576411; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uc/0gP/rCNw1M7RpPfA6xqpTqag4xQiO55TVkmbdX2o=;
        b=MeBKpO2zydtZlRKv22PhNOd+H+ekciw5OU3mBfk65MRPP61yw23cnkZuv562yufpws
         bgnIavHqXHO23JxMXK28F+hC8+/aFpM8SvGS4t1FjWen0m7q9qhZZhVxflpWHpKu+k85
         nqn1m1hOgoygBeKwV30AvZBtDktVw0MbCrdTrWryPEQqOgg8ofDOehnYBlnMdhMue1Hs
         2Kd9/DK5eL2ZMcLWdam/bzSVc/jdAXCDDgeBDZRSUHlWb1TyArMDr+rQyVlMM2MJJiUH
         B3nXm7/lROUuxNjR/cB9lX2j8T/zYu/cAZI9AVmJ4A61DKsUiv2nhqk3eTWfh0/u2FAW
         GTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971611; x=1764576411;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc/0gP/rCNw1M7RpPfA6xqpTqag4xQiO55TVkmbdX2o=;
        b=cpKzVs5GZp9ANh2b87MCeimh5ajhh/HXFNKfN2t32ZCBhaWS4zoQ12Ramhfwq2bfi+
         lOHW2w1rGt+6ZKqRxRIcU87xqAX6LZAZ5rCoexbLN9K208ved4iXmsgI/xIqfJHtkSfA
         xYufJkujMbrWK8pztA9ZC3e7ocs5F0oUE1e5j65ZOnfN/3ZL2vgonoK3PhHSi7GL49Wm
         ETA5qN9Iwei+wx+Ks9bsbgIxtBnC6xHQXAa4NGBZO4hqlXIivPUhEQdhm6FtL7m3doOM
         ZObHvDWlgPfUv9C/G/kT0ECESkoS46Im8JGSgLv7XlXmvKGER7dUo34ngnTEcHDSwx2W
         ly4w==
X-Gm-Message-State: AOJu0Yy/SZjw3iCPElkMwiBee0IE4mCr82fBbEFRgg0yci/4FC4+A6lr
	VfAVGsPi2q5xJ2H042HWZ/3SoZ4bA7mgwQa3VowUzVtz7Z4q3N4G0sR8i5qxqiVcqSnZSTWeGyK
	nwh0L
X-Gm-Gg: ASbGncszErGq/MDzLKYH0iiIfe2GdA2wGhkdG/OaEVky6ZDBba5QIT3W5pRUhzASHDk
	6LT5N/aq2idFtBauzUqVh7LsEfFG7rVnJ+imhpU0g5q9bE7ryy8RR2NjeoFfhrnyRSVAk4tiv5u
	4SUf6jsVvpgN/p+St61g5EAZl7i4BGhM4l1b7K3Ib6Qer0yUjDuqROCHjTvDZkpjZZLBfzrbGRd
	xKAn8MHQjpw2HgtIzAlJhqqgPUU/DJ71n/FdKLvXf3Ew96T6A+M2bJnrpm8BqiqakzRov4928cN
	5eOb1yCmO/yeblD8ZGXfDU9GhHy0p4Sr4OlL2Vexa1PqTHSn4j3nlqrEWDax2TSncmO6OAF4KJ5
	UUt6AuDTzERRtXLpJHAl9Tb0L3NwdB4+pBKDsIymLGK/lEj4OcEIPkI53hJxXjoZnL4d7IBZjb+
	pGdEMvECXl9m0q/her
X-Google-Smtp-Source: AGHT+IHaBdWDTMD3cQHQ5iFQbx0Sba2kNBDM7GMIrebSlU8eWt1vCYVEhaxFP/6Tk9w3EISTiZORgQ==
X-Received: by 2002:a05:600c:4591:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-477c018a016mr136300645e9.15.1763971611110;
        Mon, 24 Nov 2025 00:06:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf1e872esm180713855e9.5.2025.11.24.00.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 00:06:50 -0800 (PST)
Date: Mon, 24 Nov 2025 11:06:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 16/52] fs/open.c:1424
 do_sys_openat2() error: uninitialized symbol 'tmp'.
Message-ID: <202511220547.BX8AdVlr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251124080647.ifa_ccdxw0QRIYSruFljoGD0uqS-1B9I3HJiAzhM2IQ@z>

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   09ba3707485de081133d97c9bdc7fa364d318f46
commit: a290be3972f9df5a58b630e081d53caa1305ca1c [16/52] open: convert do_sys_openat2() to FD_PREPARE()
config: loongarch-randconfig-r072-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220547.BX8AdVlr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511220547.BX8AdVlr-lkp@intel.com/

smatch warnings:
fs/open.c:1424 do_sys_openat2() error: uninitialized symbol 'tmp'.

vim +/tmp +1424 fs/open.c

29d80d506b18384 Yuichiro Tsuji      2025-01-21  1420  static int do_sys_openat2(int dfd, const char __user *filename,
fddb5d430ad9fa9 Aleksa Sarai        2020-01-18  1421  			  struct open_how *how)
^1da177e4c3f415 Linus Torvalds      2005-04-16  1422  {
47c805dc2d2dff6 Al Viro             2011-02-23  1423  	struct open_flags op;
a290be3972f9df5 Christian Brauner   2025-11-18 @1424  	struct filename *tmp __free(putname);
a290be3972f9df5 Christian Brauner   2025-11-18  1425  	int err;
f9652e10c12b43d Al Viro             2013-06-11  1426  
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1427  	err = build_open_flags(how, &op);
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1428  	if (unlikely(err))
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1429  		return err;

tmp is uninitialized.

f9652e10c12b43d Al Viro             2013-06-11  1430  
f9652e10c12b43d Al Viro             2013-06-11  1431  	tmp = getname(filename);
f9652e10c12b43d Al Viro             2013-06-11  1432  	if (IS_ERR(tmp))
f9652e10c12b43d Al Viro             2013-06-11  1433  		return PTR_ERR(tmp);
ef3daeda7b58f04 Yoav Zach           2005-06-23  1434  
a290be3972f9df5 Christian Brauner   2025-11-18  1435  	FD_PREPARE(fdf, how->flags, do_filp_open(dfd, tmp, &op)) {
a290be3972f9df5 Christian Brauner   2025-11-18  1436  		if (fd_prepare_failed(fdf))
a290be3972f9df5 Christian Brauner   2025-11-18  1437  			return fd_prepare_error(fdf);
a290be3972f9df5 Christian Brauner   2025-11-18  1438  
a290be3972f9df5 Christian Brauner   2025-11-18  1439  		return fd_publish(fdf);
fed2fc18a4567d6 Telemaque Ndizihiwe 2005-06-23  1440  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  1441  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

