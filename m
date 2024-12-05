Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0773E1C07C0
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385437; cv=none; b=YuAkEtLYiZ99vfRWQuPyxDrqI3Hd5jTEQm1lY4Gtg8pYbdBnJuNKsDPg7KE4e+OUK4c8/aKjv7lFA2vCMbkVv7mfWmQFjBl70ws8s7XiTna9KxaOvEaQ2jN+4DlTvfGFvO1MqYZ4JpCuBTNOaRXUCRNT3DkU61Mrnl9MTSkkMTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385437; c=relaxed/simple;
	bh=F1vMMuwAFoDkHwZBm++t7q+VR8uPlQsrBpZR8y+yJjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4cmDIxx9jxzkf/6bvBy+dTz87WXd9MIjnUUaf8Bd/+8rU4MVb3trMP+2uYI9Y1SRHDJl8/eoMvq1cqFJi7ff9E+ksULllXOH9jiSI3pSGtYV5z7/MQWjTiD3SDwUhZ31FcEqSkTT6bvG/raQ/VXhcaNO8AHdZcZa1YWA3CbXS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkGPNBpN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkGPNBpN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434ab938e37so3805805e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Dec 2024 23:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733385434; x=1733990234; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSsLlOj6OXc23V42BqNW/gh3fvlV9b+0hdUPS+1BG8A=;
        b=nkGPNBpN4+TaV/bgjdjad+aBl7JlhDrCpQNubLNL3w9JhRLGuuHie3BkhdNYOhyR2/
         zo3ISpTDQg2fAM0jgDqW2vWZhyzTtTmugNcKCRjPiG9KtH5p4tPPiLTLbPgvCliFpBOj
         o8k21Mn4EMrZE8fsXr/uripHQM5HT61dgg+VhAJPDZC8KYOe59VQ3zwUVvg28FnbrKg/
         3Mc5e0Alraq6AkE/bkzU6jBMA6S6Sc0GWbCFlU7vk6AatOL7BghgAsEii8nQWGl453Bz
         3xRT6u60w71ofyhT0g4K+wz03ANzYZr8Iikm8MNiWxO166+p3GUQiBHPPPvF7XYFTQE+
         wwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385434; x=1733990234;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSsLlOj6OXc23V42BqNW/gh3fvlV9b+0hdUPS+1BG8A=;
        b=MefRQ7jSjzpO7q81DqR21E6ChpNCOqSjOd2KUAYJrRTcWKy+8i+TZXk3GXNzUKqGan
         /yuR/nkrzKORXf5178U1O3P5xexL3RvvzsdrQuNARQsbegzT59NvWfvTyAwCrj22zl4Q
         /O7pV/b+R3sRJLoVYuiFGLXgvhjB6925KBp8K/EeEE0ELxo84IjeoKhRxI39dKiKGXkY
         OHJhcvu2ZhnHMSW6tJvP8DmR1sZWhLW3yWupiOByL7hPAQ14nChspgdLl/NGYeLNvxzX
         v4bRp2V19Ny48WI6ZMRpI891j+LaFX+DEzSKyuM29JX8HoJthm2adkAClWaxDqvSXQxc
         8blQ==
X-Gm-Message-State: AOJu0YxGJNxM0C4Hu3LhEHQvqySeusJ7IjvkGpUG3vADCmSLYNpnHpqE
	KZ7/pnkHJTeXxM/am5OpbEq+U0rb0z72dZSnO8EN9/Yk24z+Eq9qHo+cvKC11sOBqUX1+2RURjQ
	I
X-Gm-Gg: ASbGnctaV6CUafPsVcwCn6/pM8ur/Y6P3QYTTYnbxUaeNX3z2Ic+fWeoz4t1Fy+yc3i
	Wu5SP9P/LctTXStfmxk1vG3ZEhapsBrIZEkU2Cig8UlC47iaTDGZQipu3Drd3huZU3mHYCJnlSc
	Lo+9D2W1/FJwsaIBvhFs4zj4t+Cm4eKqhYD/Sgf1KCZgjB1YSLwga8w6i5Ay5hmdmOx1UlrY+Ln
	OmGhZog4gMw81xpTh+koePu8ORpis/peIPW+kBdSfAzsnkjZ5NCKv4=
X-Google-Smtp-Source: AGHT+IHszvKAEabTDYMNv1rnsllHsMOQgvXUR8bPrFp3c/n+BiGL06Sn7/DHAymKBfj/Q8u/ukzA7A==
X-Received: by 2002:a05:600c:4686:b0:434:a830:936a with SMTP id 5b1f17b1804b1-434d3fcc419mr48440785e9.21.1733385434070;
        Wed, 04 Dec 2024 23:57:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113508sm14706285e9.35.2024.12.04.23.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:57:13 -0800 (PST)
Date: Thu, 5 Dec 2024 10:57:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:futex_local_v4 7/11] kernel/futex/core.c:1364
 futex_hash_is_invariant() warn: signedness bug returning '(-22)'
Message-ID: <3f216cca-7830-4aad-a4c4-21713e185590@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v4
head:   e259acd3e886368666385efb91f818174ea67e7a
commit: f660409ae182f97b143c93355f4bb216db994f62 [7/11] futex: Allow to make the number of slots invariant.
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051021.huhObpLe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412051021.huhObpLe-lkp@intel.com/

smatch warnings:
kernel/futex/core.c:1364 futex_hash_is_invariant() warn: signedness bug returning '(-22)'

vim +1364 kernel/futex/core.c

f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1355  bool futex_hash_is_invariant(void)
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1356  {
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1357  	struct futex_hash_bucket_private *hb_p;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1358  	struct mm_struct *mm;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1359  
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1360  	mm = current->mm;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1361  	guard(rcu)();
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1362  	hb_p = rcu_dereference(mm->futex_hash_bucket);
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1363  	if (!hb_p)
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03 @1364  		return -EINVAL;

This should probably be return false?

f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1365  	return hb_p->slots_invariant;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1366  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

