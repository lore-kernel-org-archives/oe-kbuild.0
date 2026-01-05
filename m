Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8BF2F25F2
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624257; cv=none; b=iRFWL1hESttDPSoP5hGb1fWisINblvJpPro5RcJ1xwAJAQnOlaxGK4t9xG7sS8/b5lSxqYcAz7AnS8gtaxh6aDw2e7fGrCCLcT31k34QZDjK+xvS0uI+H7+tavP//r3BbJB8PZ5gT2ePWvo/uxLcY9Nnv7vX37JLYL3Xo3H165E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624257; c=relaxed/simple;
	bh=O4oHg1x7/FVeYZEjDjsJe5dUJQNff9knQPeiTY9yq70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fiHDPb5SZ2CIUtwltFTK701ry3E18PT5HivVbErc23MmRj51PwdRYiz05zAeupzuil7+aAwvv6R7sjRTJ389DPy79M1npVYnbrQyJUBptX5CAARa4Hnu2qE+dVJAmOTQeFi4bMX1SRqUY966CcoZxzGcjECEni/+41fVZT967yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/Zg6CQO; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/Zg6CQO"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so112700955e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 06:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767624254; x=1768229054; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0s3/W3DhA/SNqTs62gob4briHzwAa6pw4T0S0GTBua4=;
        b=K/Zg6CQOQ3uUTrkQ4b3BoUDzEyNWRFdsfuPb5O5SBAoHlMhPpcGKiDeUGHDwBnJDsw
         Do4SByhH0bSnysOCDSGoCuae5dzMnoES7yklEjSVZ9PfEYPDG3kxSENWLPRvvjDnDKQ3
         uex6xxJyrksdg/ZG2jUUDVZuWD1MjdtsosZImKLDA2FgimMtdixDITTlAdvcaeBd17Oy
         fIbyaYYmU4b+C3rC3n39oITOfp5LlJx+e2dNZlghlge3roLTVAYt6O25Qs7wlwy3J4m9
         wzS6F6HX74x+Fc6o4HTjkVSDB3tqyAmKEpWiUHqqUIpZVeDDYDHhjJpjzEhIU5ttbJ/t
         RQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624254; x=1768229054;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s3/W3DhA/SNqTs62gob4briHzwAa6pw4T0S0GTBua4=;
        b=DOkzD0YlOBO7w6TChzJyE3tSAuUWcsLQvWko0cmTxKSHHqeiWOYEtskJCPqP8Y0I8w
         cSV0Oy9rui+m3y0mam2VqaJQgD4t0WbzPgCJzAPpng6m4fJJf4vfo09xJo+165Ro/23t
         /aUQ21IA+VNyYdl5gdL+nIOw4qVI/g1BG+Ddj+39QeVrwXK0KQAJW9E6sXeS/bdTSEpw
         1uo7Em9WplpyFwZMf5fGWx6iUYDXpJQpgB1OB1+RnkiaDoXwiAIMKYYfnTOCkceKrart
         ZB9V9thHgRecn3iOStloJgbOyL1eZCbiqc0qj1mmpags961bHCfzwGErfYzjodK2OU48
         HJLw==
X-Gm-Message-State: AOJu0Yz6p1oFbeRVgIoaBwV+Crp2Zo/aaN492qrHdb0JiR/ieAr4SrQs
	cfjVz8seCF5M17F2yCT0atuky+TGxVu3LDm3hxbrDs6Z+aiauHd2nBwSnGywiUApGekFAFmcxuG
	xnfa3
X-Gm-Gg: AY/fxX6OH4Ktl0d8MOJBcw8/OJwMcwlqW/q4eQvKXEVT5s8vNZUloAy6z2pw8E8lzeS
	vIVI5vGMhgoNUg25/IH2ESuA3/Q9hdtzh3Skl+5aQPycWmAMhaSqlKNRghKEtsH7vDsSOoUSSYA
	RWqtJe5x7y518iwCrvnFb3mTv19EGjCn1ofp5r0iI7A2DcbLtVCcVe0dQm3SEGZ9wkIEzCe6UbY
	PUoZ3RGl3IP23BgMZnvQcGeRoCG2hgon9CQGkItn4X8sNOOwMCeAfI0XR1Zn3/xrJzn4QGALjoR
	A1uw/jOA7x/bTI1NB291/YJ7Y4pM2UDprc7WAhzdwyse6S2zV6dGgPNjrvr7pgG6pLazWpopmcO
	QmXq93KlK9Tou+qRrmEcQn1RmUs7ghvZ8Hy6p7kUoMo8NY6bEC2E5dAlmMSRL1dsPEqVuvozImt
	pBNU6WSCFitj8ewA+m
X-Google-Smtp-Source: AGHT+IF+l6Cm2NJ3PJQH/LSXQb25Qv7DHVtaG9zUkkcbrEv/3wgVnGZ0HtGojBx5Mjv/+tu2QG36nA==
X-Received: by 2002:a05:600c:444a:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-47d1959eae7mr619888515e9.29.1767624253972;
        Mon, 05 Jan 2026 06:44:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm92348183f8f.21.2026.01.05.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:44:13 -0800 (PST)
Date: Mon, 5 Jan 2026 17:44:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zach Brown <zab@zabbo.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/1] fs/rpdfs/block.c:312 put_block()
 error: uninitialized symbol 'now'.
Message-ID: <202511040921.YBdsnwZz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260105144410.6fFimE2RzicjwsWCGry3l6x7rt9vFq00pbgUYH6o9pA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   e8e76da7ed715ef67ccc4436f4981a5b39983d9f
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/1] rpdfs: initial commit
config: x86_64-randconfig-161-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040921.YBdsnwZz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511040921.YBdsnwZz-lkp@intel.com/

smatch warnings:
fs/rpdfs/block.c:312 put_block() error: uninitialized symbol 'now'.
fs/rpdfs/net.c:301 rpdfs_net_invalid_sizes() warn: impossible condition '(md->ctl_size > 255) => (1-255 > 255)'
fs/rpdfs/super.c:178 rpdfs_parse_param() error: uninitialized symbol 'ret'.

vim +/now +312 fs/rpdfs/block.c

e8e76da7ed715e Zach Brown 2025-08-13  305  static void put_block(struct rpdfs_block *bk)
e8e76da7ed715e Zach Brown 2025-08-13  306  {
e8e76da7ed715e Zach Brown 2025-08-13  307  	s64 now;
e8e76da7ed715e Zach Brown 2025-08-13  308  
e8e76da7ed715e Zach Brown 2025-08-13  309  	if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)

If bk is NULL

e8e76da7ed715e Zach Brown 2025-08-13  310  		free_block(bk);
e8e76da7ed715e Zach Brown 2025-08-13  311  
e8e76da7ed715e Zach Brown 2025-08-13 @312  	WARN_ON_ONCE(now < 0);

Then now is unitialized

e8e76da7ed715e Zach Brown 2025-08-13  313  	WARN_ON_ONCE(now == REMOVAL_REFCOUNT - 1);
e8e76da7ed715e Zach Brown 2025-08-13  314  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

