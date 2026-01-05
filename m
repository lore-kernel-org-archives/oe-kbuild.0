Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AFF31353E
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614370; cv=none; b=Rgklm1RJcJQ56/WRtnmE6lARmZalSXL0nBNii9EaTLwA422iYYXoZAPh6loVuk5lAqZgoLqLI9issO3GmM3zdKzS8B5eC2fIoK8pk7X7LJn0PMgptt+c787xFTOWLiVjiQ+x2NW7rJqm6z3wSh+bfjsyJixBsTQA99p8MiKnSbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614370; c=relaxed/simple;
	bh=b5KCYLaZKA3WygmKz2j4I/pJcjtDXvoXLaoefyzXD6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tau6oPvuGmnmd+UeOvsfnvPZtRaMi+0rIcXQ5pvazUp6M/KdU4x00u3NSkdgYvG1gHrLnDBnYTiHW0JCCtAcPVBYphg1QjlYPhXhEsSptUfnwJR9rkfzzTfG8qN0KrFnMf445vX1ySsvPqkqlMhOgx34TaVjJzi3TW36yJ8QONs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hz62kD8y; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hz62kD8y"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477563e28a3so12494765e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 03:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767614367; x=1768219167; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HkI/LsiYFcqFCMlsJ0c1kqetIBQiylKegZnCoBHoYMg=;
        b=hz62kD8yZHuaOksS+In+klb0l1WkV40v0KxnWh6zFy8lTKprZwgQX0nPF9IiBcELPP
         ED3HAieZlLr8caVTcoeGM/SIOZugjcJUxtE94ND8B7d3m/I++Kqs0TzQ+b60Gta0AE2H
         h+xUBJdGd2o5/Ta2RFcLNKrKREScbBOlONEB0bcRnuAC/Mh/JMN7albZvu/wi/O1Spee
         xHnXlcKaLufVyfGgtxoCOdDF0RSkavkdLGv9pLCX7pqIxv8Pwt86S8Io/+DnrrPYysFM
         zvQdg4RAtRJn+iOWyRsRfKNYVU9WtWD+39c7bS/j/P3X8QGCYmWwpgVM1RWIjKOtpLLR
         VBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614367; x=1768219167;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkI/LsiYFcqFCMlsJ0c1kqetIBQiylKegZnCoBHoYMg=;
        b=ucQALwOHS1KkDOwCdhv1eTkyO6/QXb+VwOKLu9cEPZFLOdQTE5xMDPm3pmTejQfbAQ
         0WfMimDRzYVjIjEubRW9AEHNx/R5MGDfn6XeoMSD6ErZh5FOAAQB9qfvqWaWgRO4I437
         AMDCw/bPZkZ+9kyNKhaznxt0JpmuAJCpBp/PYAJLeERITIl3UKitiD7mh7VeBnWZJSGB
         vHOCWdG/HnHOSANBj4GjsAaLN1KSefRZ3mag4LkqqFAshiz3JV07PEaaaHeNvGrGkdth
         NpHCHRQ8QAdpbSrW1vkyDAdl1yCQVZ8FnPoNtrHeLf4B3kp08z4G9ypXy6Zq0dkPXdtP
         CHQQ==
X-Gm-Message-State: AOJu0YxJ+Kel0EnaY4m1QOsudA8ieobBCgV3FgoCRq1MQ3Fckc3IEeU9
	vfr1aqzevIejkcf75ANR/ZwMW8U0rmFKi19tvC5iKyY/pxWuOLIeOfRtwt30TzydSYcMSYtnHYd
	upp8P
X-Gm-Gg: AY/fxX6AZYQtQTALdabaXaPt3Ijd+iGYL/R05OSw0YEbZ9621jBKgS0sc6O1qCVeHo2
	pOFoqSiMjSD7j/nzgUG662HIQhFLkNx3LFPc8/MGHIlq2k017jrHf7yzqpXqMA9/g8TZ61YUkKt
	u+hgPsU6arvjT8sX47Ytx3/gCpJO+Djm/Mu4SrbKVvg6nAAzOlq5oKD6hWPt2TNaO7Mov+ggcau
	qanj1ytAnU44BK1tbOzUzZ4wg3bp0ivGcPdx/5mA53vNoI0K+4VJakAwO4z3TJsY6ZoPVdVZy16
	f+cmP92cmVVT8At3M3XAkJalh+QvFPkf0TQ/XKaUBr4FNS3Ao8tvnQRdgVuAfjQOBzMIET76Wp6
	jGdEvxi5S2M7XY1qSm0iLMksBDuh+I9eBR59T4Pdm9TLYNVxcojP/fAwF2fUDBUCFXiMH3zHDwK
	MbJz7Gz7RQRF57lo2X
X-Google-Smtp-Source: AGHT+IHjwZfvwAd4ftqGevegL2HxY+kjs0ERQL8TxcCiFQWLIzLH2eVmis4KtXNItqG7zkD0FKCHSA==
X-Received: by 2002:a05:600c:630d:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-47d6ba7e42amr109795415e9.1.1767614366523;
        Mon, 05 Jan 2026 03:59:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ba450e7sm58024225e9.1.2026.01.05.03.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:59:26 -0800 (PST)
Date: Mon, 5 Jan 2026 14:59:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chao Yu <chao@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:feature/lock_trace 1/12] fs/f2fs/checkpoint.c:80
 trace_lock_elapsed_time_end() error: uninitialized symbol 'running_time'.
Message-ID: <202512292145.pYzliixm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260105115923.G7PsZOZKn31ymtJp0p9GtSTrkgyESedediT6tCiqSGs@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   38316221f39afd9be305c1a9d7de368ac7d10a74
commit: c40d7d27f9806cf8ede8c91311f9431fa7df791b [1/12] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
config: microblaze-randconfig-r072-20251229 (https://download.01.org/0day-ci/archive/20251229/202512292145.pYzliixm-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251229/202512292145.pYzliixm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512292145.pYzliixm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

New smatch warnings:
fs/f2fs/checkpoint.c:80 trace_lock_elapsed_time_end() error: uninitialized symbol 'running_time'.

vim +/running_time +80 fs/f2fs/checkpoint.c

c40d7d27f9806c Chao Yu 2025-12-16  51  static inline void trace_lock_elapsed_time_end(struct f2fs_rwsem *sem,
c40d7d27f9806c Chao Yu 2025-12-16  52  				struct f2fs_lock_context *lc, bool is_write)
c40d7d27f9806c Chao Yu 2025-12-16  53  {
c40d7d27f9806c Chao Yu 2025-12-16  54  	struct f2fs_time_stat tts;
c40d7d27f9806c Chao Yu 2025-12-16  55  	unsigned long long total_time, running_time;
c40d7d27f9806c Chao Yu 2025-12-16  56  	unsigned long long runnable_time = 0;
c40d7d27f9806c Chao Yu 2025-12-16  57  	unsigned long long io_sleep_time = 0;
c40d7d27f9806c Chao Yu 2025-12-16  58  	unsigned long long other_time = 0;
c40d7d27f9806c Chao Yu 2025-12-16  59  
c40d7d27f9806c Chao Yu 2025-12-16  60  	if (!lc->lock_trace)
c40d7d27f9806c Chao Yu 2025-12-16  61  		return;
c40d7d27f9806c Chao Yu 2025-12-16  62  
c40d7d27f9806c Chao Yu 2025-12-16  63  	get_lock_elapsed_time(&tts);
c40d7d27f9806c Chao Yu 2025-12-16  64  
c40d7d27f9806c Chao Yu 2025-12-16  65  	total_time = (tts.total_time - lc->ts.total_time) / NSEC_PER_MSEC;
c40d7d27f9806c Chao Yu 2025-12-16  66  	if (total_time <= MAX_LOCK_ELAPSED_TIME)
c40d7d27f9806c Chao Yu 2025-12-16  67  		return;
c40d7d27f9806c Chao Yu 2025-12-16  68  
c40d7d27f9806c Chao Yu 2025-12-16  69  #ifdef CONFIG_64BIT
c40d7d27f9806c Chao Yu 2025-12-16  70  	running_time = (tts.running_time - lc->ts.running_time) / NSEC_PER_MSEC;
c40d7d27f9806c Chao Yu 2025-12-16  71  #endif
c40d7d27f9806c Chao Yu 2025-12-16  72  #if defined(CONFIG_SCHED_INFO) && defined(CONFIG_SCHEDSTATS)
c40d7d27f9806c Chao Yu 2025-12-16  73  	runnable_time = (tts.runnable_time - lc->ts.runnable_time) /
c40d7d27f9806c Chao Yu 2025-12-16  74  							NSEC_PER_MSEC;
c40d7d27f9806c Chao Yu 2025-12-16  75  #endif
c40d7d27f9806c Chao Yu 2025-12-16  76  #ifdef CONFIG_TASK_DELAY_ACCT
c40d7d27f9806c Chao Yu 2025-12-16  77  	io_sleep_time = (tts.io_sleep_time - lc->ts.io_sleep_time) /
c40d7d27f9806c Chao Yu 2025-12-16  78  							NSEC_PER_MSEC;
c40d7d27f9806c Chao Yu 2025-12-16  79  #endif
c40d7d27f9806c Chao Yu 2025-12-16 @80  	if (total_time > running_time + io_sleep_time + runnable_time)

running_time is uninitialized on 32 bit systems.

c40d7d27f9806c Chao Yu 2025-12-16  81  		other_time = total_time - running_time -
c40d7d27f9806c Chao Yu 2025-12-16  82  				io_sleep_time - runnable_time;
c40d7d27f9806c Chao Yu 2025-12-16  83  
c40d7d27f9806c Chao Yu 2025-12-16  84  	trace_f2fs_lock_elapsed_time(sem->sbi, sem->name, is_write, current,
c40d7d27f9806c Chao Yu 2025-12-16  85  			get_current_ioprio(), total_time, running_time,
c40d7d27f9806c Chao Yu 2025-12-16  86  			runnable_time, io_sleep_time, other_time);
c40d7d27f9806c Chao Yu 2025-12-16  87  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

