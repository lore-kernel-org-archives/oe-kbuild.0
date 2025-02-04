Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149E8204C09
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Feb 2025 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697990; cv=none; b=n3iF3rVqxtRKLpA/nR0bZ+qDrmXjN1nZgcdCbx7Mcg53HMD+n6xnMIxiVCxG0/FnBFQ+z6g0I8bytSr3cXnuhgA54kTP1TYKpcPflQAnho4gLte9fIGf8AA+qaIGRt1hIpSGj/gLH4tVhPGwgzfkrNy99jfmXBVcc6eZQJqH7jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697990; c=relaxed/simple;
	bh=ZJiDN+nOQE6F2sddgObQCdlw5v60QylJn/xoU10lzpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zl1WKwjxqb7UL6tHxgpuWR1Aqb5JPGTeZYjDWcHLDv6GqKW2k+xAoHP5n2mMAVBgPchTzzkE9sBjpP909yqExbNUJM6qF7nGdvoaZj9MonXcW4UgheNsSGF8vXnfQpxAB0gHv2LW5rZ1Lju9oXvcICRf9nJ+hPchzkrhhSF5cqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tj79p2IC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tj79p2IC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436a03197b2so41942275e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 04 Feb 2025 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738697985; x=1739302785; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvA9+93eZBZ2k96uE5RBukuAK+CxojboLUTlBCqCsGA=;
        b=tj79p2ICFefNG8pgEyGwLAUymiNteBhBZ+3lvNbGflS6Uc/IZCCyR7J0inObbvhjmN
         3Bmn58JMu8zC5LFnW3rxcYbUQaVMVNYBW2tdXoQS8LTisvYB/zrOhhdF2Kodj9eM90SD
         QX4EyjGqXuecOOTqCTaheCgtveNjy4TmaBN/mYsLUDgljoCNpRLFA6V2kKhCpv98Sw6K
         LfwgWMVcLqui4U9vVrbC6B4sO3a0zsGy7oBwJZ5Z7gEy1jjWmPyTsveYB3IkNfA7kqVa
         kpV8W2DEiRe54kR44CNpB9n+H5vpBYFJwhBF4veR+AWC7HK9TjFMEfy2cI0UKEcA1m3O
         WMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738697985; x=1739302785;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvA9+93eZBZ2k96uE5RBukuAK+CxojboLUTlBCqCsGA=;
        b=bedbwQ8967so0BNrwZ8JRcCgJ098LPcKTBeGYuRNrEcX8y73+vL1Y6+YWN2EMehPDJ
         UrDkPsew86oPWORs+f3nSIKLOMZAwvOaPf8oGhYxlOmwitbII4qsVtNNlTzTo1/06JCn
         QeJ7aZ8tMUu0nst/+BrpU6YtpvnOmNWhTF9qOF7aWvyc4tVwKEY7wCcn3XlaLMkAN9OT
         r2Nf/y4afAjPp9sljUfX1HRfRtetOoOmQzivIDKoQORl6gsPbJhhcKoTIcb0jnIQbD3Y
         W5NeNH1+PB6ofmgtI6Cd8ZasX1HQYPE0btNTe+hZJhvrxAp9yzTS03bAgKN/8mzqYO0m
         C2EQ==
X-Gm-Message-State: AOJu0YzuA1LkLpOP2i4qrU3BQ2ZESphI31YOZTgAZHsa8mv3h5f0ObSW
	q3wHzAK6AKI7pCXyIFTkuSaAkQQ1Q5Nzgc0SLdCzTv9nTenZ7CBk3uokObbg56dFySKbl/s0Jow
	5
X-Gm-Gg: ASbGncvjHtVFuB9566kKJ2oxKlkQhu4n0QkkSQjcw0gduwq0JHP2xtwh0m416tlTowk
	Htpyo8RXNjP9GHyZj5aum7ZzFCFRCz/ZVJFeBCcSNEvZgyg9OJ405ADRS0xyc13GgQyqcvQdEp3
	saHQVKLFrUb33vYRPc4hJWzWhJq1drPvfiz83rB8bKf9Hgu2hzx5ZdzTJAmreIesOpyzJ7/bVTq
	+QCdAWB9CfF86DYlXoCH5tKl4GZg2q8UDXJUIf4wr0fnW87Vz2gwE41Ioqjb+c4xYpf/QEKj1Vr
	A3dVK5GkOX14AZJNw/bS
X-Google-Smtp-Source: AGHT+IFNWvD6NvvDhpB82LWN1FYRnfaMgfQURPzQMaeDvstK6yqFp+sb4byiALVIy8hf+6SrDlX8ow==
X-Received: by 2002:a05:600c:2313:b0:434:fbcd:1382 with SMTP id 5b1f17b1804b1-438dc3be21fmr302287695e9.11.1738697985504;
        Tue, 04 Feb 2025 11:39:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc2f17dsm234958395e9.23.2025.02.04.11.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:39:45 -0800 (PST)
Date: Tue, 4 Feb 2025 22:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: [usb:usb-next 5/12] drivers/usb/typec/ucsi/ucsi.c:88
 ucsi_sync_control_common() error: we previously assumed 'cci' could be null
 (see line 84)
Message-ID: <0052316a-72c2-4e36-9cb2-ba88e9c918b3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   9682c35ff6ecd76d9462d4749b8b413d3e8e605e
commit: 667ecac55861281c1f5e107c8550ae893b3984f6 [5/12] usb: typec: ucsi: return CCI and message from sync_control callback
config: csky-randconfig-r072-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050227.tDYOqQsX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502050227.tDYOqQsX-lkp@intel.com/

New smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:88 ucsi_sync_control_common() error: we previously assumed 'cci' could be null (see line 84)

Old smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:746 ucsi_get_pd_caps() warn: passing zero to 'ERR_PTR'
drivers/usb/typec/ucsi/ucsi.c:1456 ucsi_dr_swap() warn: missing error code 'ret'

vim +/cci +88 drivers/usb/typec/ucsi/ucsi.c

667ecac55861281 Dmitry Baryshkov 2025-01-20  58  int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
667ecac55861281 Dmitry Baryshkov 2025-01-20  59  			     void *data, size_t size)
584e8df58942338 Dmitry Baryshkov 2024-06-27  60  {
584e8df58942338 Dmitry Baryshkov 2024-06-27  61  	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
584e8df58942338 Dmitry Baryshkov 2024-06-27  62  	int ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  63  
584e8df58942338 Dmitry Baryshkov 2024-06-27  64  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  65  		set_bit(ACK_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  66  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  67  		set_bit(COMMAND_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  68  
e37b383df91ba9b Łukasz Bartosik  2024-12-03  69  	reinit_completion(&ucsi->complete);
e37b383df91ba9b Łukasz Bartosik  2024-12-03  70  
584e8df58942338 Dmitry Baryshkov 2024-06-27  71  	ret = ucsi->ops->async_control(ucsi, command);
584e8df58942338 Dmitry Baryshkov 2024-06-27  72  	if (ret)
584e8df58942338 Dmitry Baryshkov 2024-06-27  73  		goto out_clear_bit;
584e8df58942338 Dmitry Baryshkov 2024-06-27  74  
584e8df58942338 Dmitry Baryshkov 2024-06-27  75  	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
584e8df58942338 Dmitry Baryshkov 2024-06-27  76  		ret = -ETIMEDOUT;
584e8df58942338 Dmitry Baryshkov 2024-06-27  77  
584e8df58942338 Dmitry Baryshkov 2024-06-27  78  out_clear_bit:
584e8df58942338 Dmitry Baryshkov 2024-06-27  79  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  80  		clear_bit(ACK_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  81  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  82  		clear_bit(COMMAND_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  83  
667ecac55861281 Dmitry Baryshkov 2025-01-20 @84  	if (!ret && cci)
                                                                    ^^^
This code assumes cci can be NULL

667ecac55861281 Dmitry Baryshkov 2025-01-20  85  		ret = ucsi->ops->read_cci(ucsi, cci);
667ecac55861281 Dmitry Baryshkov 2025-01-20  86  
667ecac55861281 Dmitry Baryshkov 2025-01-20  87  	if (!ret && data &&
667ecac55861281 Dmitry Baryshkov 2025-01-20 @88  	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
                                                             ^^^^
But here it's dereferenced without checking

667ecac55861281 Dmitry Baryshkov 2025-01-20  89  		ret = ucsi->ops->read_message_in(ucsi, data, size);
667ecac55861281 Dmitry Baryshkov 2025-01-20  90  
584e8df58942338 Dmitry Baryshkov 2024-06-27  91  	return ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  92  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

