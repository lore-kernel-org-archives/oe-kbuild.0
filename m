Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB463AF647
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437819; cv=none; b=fDThfIOPmb71eZO+BV0j2nGDrhYEtqNk+C8ryUfFEln46nB2mdJvP1aaIIqpKirglWILzXLq6iaBI+klQ7BsuShZwMPYbkAnEfnuf1J22CXSrZb5fVE9TF0uzVrmGV8tn2tp0GohNPUvmsOjurqPhLuafA0zYmS5138NS2yuj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437819; c=relaxed/simple;
	bh=aQPjhGoLjKR6KJbLzFxM9LH/dwDE9aGTxVk3RYZBWn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6RpHt23EDJLw5ocLwNOH/8LlfJhJE4vtd+VLXeL6Pk89We5RDd5H/mdcNqXpfy8OId9DkjzDSrdzJT9/ugVa9SU9ULI/pQ0Ugj3F+zvkjQlnOjZ9YYOjPsyI+MPD7t2lLBCGkSRUaTV3Svu1Aw0xtl55n8AZRU9nIR1PzVIi74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8gSnHzR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8gSnHzR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb112c09so44430335e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774437815; x=1775042615; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNcT6N4Da6oBh6vGHmp71lE7h4MsMXPkCvZSzQpZPVs=;
        b=g8gSnHzRqyX+UdwapjJIuTiT+5/oZZc2YSTRyVT5AYWPXaB1HGv9+fiH/YpWVRjRm/
         eW4WSHvYrgzttsogGIoLp3dJby2MDp18SH+AW2K1Aqi6La286hPKo0qUSyZVyFvE1cEw
         FwUef5kRtebNiVfBYSMlZCX3o2uiuwaNdPb682UvQph+16L5yLAJpPRw/2mzaKN7iuej
         VAlICWLwHlNz56nf1YjUCjowSKvoxkvTrUlH2QEeucwDk0jRGvZRC42H+TRNXdI37mEd
         9UUEmh6DUzZudAl4/tB6TVEhzZBtvu1Ncf9FpTXmjP2B+gC7ShBhfx5z+n9FEQeAb4nz
         BBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437815; x=1775042615;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNcT6N4Da6oBh6vGHmp71lE7h4MsMXPkCvZSzQpZPVs=;
        b=djNv1RwXkDqPdl1ZypyzqJqznOQHWTU/aYdb3007kUOS0MOU8++G1RLtGHKalQbj8Q
         i+EGwlhtQ1H2BB2YnleASrY7xRFUGZ4OqduRwZmF5kB6eIG0chAElKM8x3v0paSnLy9N
         jeRKFDFTNVINSMTpARSHCCoFSOhNXyxQrmu+7vIhv/ZpZlr8ZaBwNeRgb/1SI5cKC+7n
         5IAeue+bHtztOX6F/i0wBtG9CX4GaOSWgrXD1IPMyIgxo6YYuMVx6hU9uylJ6J87jnJS
         D4QEHDUA393+HrdP/L+w6IZAgWOZ79Nc7nMIJDJBhqFV5bSnNMDr6Apscg8FkwGfbF2m
         DkjA==
X-Gm-Message-State: AOJu0Yx8SZ2FxqUVGDu2ZAuM80vqaC720qRbs6sTvGgaDWBe9V9vho+5
	JAolpxd+BeR63Sa+KbZC4gV+Nm0tRy/hXWoG3THB5y9q8gKkN0vLGHOBlIIvQxX1wFhEihfyzSd
	TA7Hn
X-Gm-Gg: ATEYQzzQE/nN76eRuLfiUE2HH+afGRyThUpZsI/kz6MIvv+dXEbWXjHJVSQ4TwE5+Ts
	ybMkId0IK/Yc3meLKGSJqBzPkKZeuJEQGRWkWUKWxDJqlRNMDhWO27M+MT5E1Z6nxF0FHOVTNoJ
	MpP5y7N9QkL+lUMP5Vam5K1mX/3Rtqh/nNq86uUu/IEV2Y8HS41ljh4R+FZIpox9uFtj+HUjSFb
	h8osX6b3PMWEYI/JF+z0IOREoXu0RtuMrjN+bSA04TEgqbYZg/uoAyo/emav2qVYNJp/Ugjhkk/
	eZp4peiq9BsZg1tvgnfmqr0NqoI/FiimgCSF9Cf/weiARtI/FRGUxwkMMf0Tr3gRuyutIy8oG7C
	niVtbFO0rmj82baBFwLHHTf0hrC1XLzqtZfYp+f079S8tRhKPp7eLhhOq9+wtm3+jwfUm3XsP0K
	RIwD/WgKC/4A25WGzcUlXYByVIwFKm
X-Received: by 2002:a05:600c:45d4:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-48715fd607cmr48967895e9.9.1774437815363;
        Wed, 25 Mar 2026 04:23:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871174f2cesm125063335e9.10.2026.03.25.04.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:23:34 -0700 (PDT)
Date: Wed, 25 Mar 2026 14:23:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: arch/s390/include/asm/syscall.h:23 syscall_get_nr() warn: check sign
 expansion for '-1'
Message-ID: <202603251953.xOfBpOhW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260325112331.TgVyHbOMCasihU0E_0MO3H9-sqZo09aTCxUXFFPC3mY@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: e43b8bb56e537bfc8d9076793091e7679020fc9c entry: Inline syscall_exit_to_user_mode()
config: s390-randconfig-r072-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251953.xOfBpOhW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603251953.xOfBpOhW-lkp@intel.com/

smatch warnings:
arch/s390/include/asm/syscall.h:23 syscall_get_nr() warn: check sign expansion for '-1'

vim +23 arch/s390/include/asm/syscall.h

753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  20  static inline long syscall_get_nr(struct task_struct *task,
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  21  				  struct pt_regs *regs)
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  22  {
d3a73acbc26a4a Martin Schwidefsky 2014-04-15 @23  	return test_pt_regs_flag(regs, PIF_SYSCALL) ?
aa33c8cbbae2eb Martin Schwidefsky 2011-12-27  24  		(regs->int_code & 0xffff) : -1;


regs->int_code is a u32, so the -1 becomes UINT_MAX where -1 was
obviously intended.  Maybe change the function to return int or change
the -1 to -1L?

753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  25  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

