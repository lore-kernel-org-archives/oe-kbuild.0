Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C2318EFC8
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jul 2024 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721055236; cv=none; b=IJPTsBV/WkHltGuGkz024oOEk2Z6u1XtIhu+W0VcF5F4l1MaC2lnbIFeDkBURietc5FqMqc9O/p8xhwfA5Gb9EQqiOz4Z/v6c+6QMDNLe3Fk700NzudHak6LECm0Ji+OnFzkJ6P7IzGb6nZfWi/A33/CBpmWY1rwJ/dHNDRVo/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721055236; c=relaxed/simple;
	bh=rIaWGx3IKTWaaXjFXQrymRK2HpZgSL76qP8wLXbpNm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibA5d5yQMtEdajARhspPaX9ndZQ77tSzSWPyMD9sSLC8HILhhCYwGIC2IJy61g6BNTU622T9JnTvALuEqMO34UsoKvDYcbO8LzyWZtFN6FrAOw7M2lzmSVjf685Lpk9hG95MsK7BE2oPrqjKoJygW3csQt3WhV7QgTrKrER9uqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oeh6XgHg; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeh6XgHg"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3dab3b85623so1212983b6e.2
        for <oe-kbuild@lists.linux.dev>; Mon, 15 Jul 2024 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721055233; x=1721660033; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2Ojdz1XICnaU85QYWplXwOlXfLnj/bb3xzIhNQd3iw=;
        b=oeh6XgHgsBPgMEMJpbWYSe3RrCmPf7FUBj+YV8ZC6Mr99YBqKy6vnKbBVs20tlPztu
         kAo0BKINPQDmbvzzAtdWZIE3/2c/l8NcQ1f8bLkMCoNxWjXldmBOhU32KO5RSK/+IBQ/
         WNsCwdHyQcocQXRDeZ0ktGz1Rv0I+eu594LOb+WjrKhmv1ze8ybXoIPE9IgzoVkEk/dk
         MNJFzBag/FZP5wmtLHQFuem/BkWLmzprt+PMBNx3UreRoujERMbwxP1+3utMTMJjwmCj
         7YTWyxgcHeHKX19wz+KvBwHG5x3vY0twOYN4xJM1NnY8pMqnMEWBVqfChnivCeBFmXLR
         9PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721055233; x=1721660033;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2Ojdz1XICnaU85QYWplXwOlXfLnj/bb3xzIhNQd3iw=;
        b=IQStSjQ4/mO736XtPTnFB1h22cEjVaBk0IyNQTneTd523PwgfWAgMLnn3tg6mpDwGF
         gDTnXLne3mWzku49wmEE0TcE1AeE5twq9fTTSIdQVvpOWd2WoA4K4QG9nkDXIY2TCoPu
         DKiA3UwvO1AqDu/41Ji4N8kUb9IO+0VoKR+HUzppsrJA8iYqt/ai/ySs7QCiPG2+VxlN
         k7kCwUh0XzCcgfPf3s2YcrATdZxidL3nHE0awJ6DutNnAkZ7TW5zASC4ccMT4GYKFm1m
         n9g2PicMsQdxwAARpJ6eOdwv1oGHPhsIF5yh+Qp132y3ES7QhfxtRh1w0ayq4QDrlrud
         wh2A==
X-Gm-Message-State: AOJu0YyyIOjrDj/3IYUH3AqcKvnnYDM6noUTUOdVUPvtD0oUFpcLZiBb
	tZEEVya7g4VhSSSv11zZY4IB3XLJ8XcVnRlqmBCoZp1W4DODGKnLG6W+d2niiETy7ZT3DYp/I+t
	u
X-Google-Smtp-Source: AGHT+IEZyrLQNgWsXsoEhFWRPD7u3aYchY9ab2MWkcbF8uRTxrypYwYLH6KmiSeyG1+XPfnUqeHB4Q==
X-Received: by 2002:a05:6808:228f:b0:3d6:3000:9ab3 with SMTP id 5614622812f47-3d93c07bea3mr23990310b6e.40.1721055233660;
        Mon, 15 Jul 2024 07:53:53 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:358f:3413:c118:4021])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dab3e1cb52sm807470b6e.51.2024.07.15.07.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:53:53 -0700 (PDT)
Date: Mon, 15 Jul 2024 09:53:52 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 3529/9999] kernel/ptrace.c:205
 ptrace_unfreeze_traced() warn: mixing irq and irqsave
Message-ID: <8115decc-ca5d-4813-9b12-50e66da96d68@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   642e819a3c30d3536e6d66a631b761886a0316e7
commit: 7103517ca97f4d7eeb361aec644e6ed7afce5ff3 [3529/9999] ptrace: fix ptrace_unfreeze_traced() race with rt-lock
config: i386-randconfig-141-20240714 (https://download.01.org/0day-ci/archive/20240715/202407150032.OnfFrSgT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407150032.OnfFrSgT-lkp@intel.com/

smatch warnings:
kernel/ptrace.c:205 ptrace_unfreeze_traced() warn: mixing irq and irqsave

vim +205 kernel/ptrace.c

9899d11f654474 Oleg Nesterov      2013-01-21  192  static void ptrace_unfreeze_traced(struct task_struct *task)
9899d11f654474 Oleg Nesterov      2013-01-21  193  {
7103517ca97f4d Oleg Nesterov      2020-11-03  194  	unsigned long flags;
7103517ca97f4d Oleg Nesterov      2020-11-03  195  	bool frozen = true;
9899d11f654474 Oleg Nesterov      2013-01-21  196  
9899d11f654474 Oleg Nesterov      2013-01-21  197  	WARN_ON(!task->ptrace || task->parent != current);
9899d11f654474 Oleg Nesterov      2013-01-21  198  
5402e97af667e3 bsegall@google.com 2017-04-07  199  	/*
5402e97af667e3 bsegall@google.com 2017-04-07  200  	 * PTRACE_LISTEN can allow ptrace_trap_notify to wake us up remotely.
5402e97af667e3 bsegall@google.com 2017-04-07  201  	 * Recheck state under the lock to close this race.
5402e97af667e3 bsegall@google.com 2017-04-07  202  	 */
9899d11f654474 Oleg Nesterov      2013-01-21  203  	spin_lock_irq(&task->sighand->siglock);

This assumes no callers have IRQs disabled.

7103517ca97f4d Oleg Nesterov      2020-11-03  204  
7103517ca97f4d Oleg Nesterov      2020-11-03 @205  	raw_spin_lock_irqsave(&task->pi_lock, flags);

This assumes that they might.  #inconsistent  It's harmless so long as
the first assumption is true.

7103517ca97f4d Oleg Nesterov      2020-11-03  206  	if (task->state == __TASK_TRACED)
9899d11f654474 Oleg Nesterov      2013-01-21  207  		task->state = TASK_TRACED;
7103517ca97f4d Oleg Nesterov      2020-11-03  208  	else if (task->saved_state == __TASK_TRACED)
7103517ca97f4d Oleg Nesterov      2020-11-03  209  		task->saved_state = TASK_TRACED;
7103517ca97f4d Oleg Nesterov      2020-11-03  210  	else
7103517ca97f4d Oleg Nesterov      2020-11-03  211  		frozen = false;
7103517ca97f4d Oleg Nesterov      2020-11-03  212  	raw_spin_unlock_irqrestore(&task->pi_lock, flags);
7103517ca97f4d Oleg Nesterov      2020-11-03  213  
7103517ca97f4d Oleg Nesterov      2020-11-03  214  	if (frozen && __fatal_signal_pending(task))
7103517ca97f4d Oleg Nesterov      2020-11-03  215  		wake_up_state(task, __TASK_TRACED);
7103517ca97f4d Oleg Nesterov      2020-11-03  216  
9899d11f654474 Oleg Nesterov      2013-01-21  217  	spin_unlock_irq(&task->sighand->siglock);
9899d11f654474 Oleg Nesterov      2013-01-21  218  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

