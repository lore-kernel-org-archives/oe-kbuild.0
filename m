Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA792744C
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 07:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718866884; cv=none; b=CjHJkGVx5LMp77XDjaZ9XaGitqsJmgdyUVDzg3tIPVcrYlh8CUFDIgNmhAaZfO69qJoqOsRC09S8VVW6Ey5rIBTXM6XDYTHWBPITOAxUP4DLndtz/pbn2kFgVPDR3Yf/AJTO+uF488EuUzZ4k2MZ3VbrKIhHsY04ixlKyws8tDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718866884; c=relaxed/simple;
	bh=isauZ7k0ZpTHtWLGd/wkdbq2RXdGrqTdvPzcEcLlyLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTFbn08SF1bGMluQfxMWg65rP0vIlDi51054E/igFlfOJ7ftAIGp4xQE709923RXwqGC48GwrsrZN9YM0/OqSA2J0DB9J9JwlXIcnXuYDof0yICqN0PStwTTXYLY+pTujIjib+MB7kHQGgMUufuwjACcfvDax3PaqSLj1tM5PIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N4zIy2Ev; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N4zIy2Ev"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cfe600cbeso503502a12.2
        for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 00:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718866880; x=1719471680; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cT5I/31AaplzGom5lF24S3BCZ0h190+/RreTb9X3yE8=;
        b=N4zIy2Ev29xF4f1V18vtx495oCqJ3cuQaRHLGIm9a/Hd2LKV0r8+XQMOFZOvc8tqXU
         Cjl9yt5JPWE/knj8CNNMO/kfoHEueHJWG/6wBVrFtrH3g8scy1iefJQwY7cAK1dPxbCY
         d3wB9Y0pO7RPswruZfQh/UemQDzQAXdtDUghA2Lqod/ku8BB7PTesj+J9zBSZUKW3YIq
         8YnWDaLWotjGPHKjpE+juOHxAsIYbsKuylvOQ/qYMWr1ULOQ72qzrs0Mllm2asdC3rvB
         1AOQ5tq9e/iV/QCA1Khqmhgv+cfMC/AYrxojpkTQuP3uakUX7142w03et1PVT1ksQTiE
         TJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718866880; x=1719471680;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cT5I/31AaplzGom5lF24S3BCZ0h190+/RreTb9X3yE8=;
        b=VWIBjSqABDsW8S58OlOjtVllSH/QUffIlT54chzEhJ8m5LW/31taY/d9vDHexVdSiK
         Jx4pBdVjs0fwev3eafPW+8E0w8UEy3ISo7UZgzgtOBgKOrvai0eMmjr6+m3N+n4jlQzp
         dcBc2QOaR4cuw29OQLe8iCgMIIx05xECxwVMyB3rI1Wcq5xDtGZBrOA+Gml+FFueP347
         2Bf055PY2fsdsasrDnW6cn6pxNWu9S3g6Dmt29W7WHKbKR7Pq7a7n/Hj5UZIp7W1ivsB
         psFC6ZoRXkNkzDQnS9zlC6oZSIQEmWvAX5hvIjNWO35j9rwKIeAPCjLZYHVxcWuk2IrV
         2auw==
X-Gm-Message-State: AOJu0YztNCboOQ8JCWIPnfmjo+2dlBV0eN/OxGTQ8kp40iZC51moLxqo
	+mZ4GanKKKIQafXdD3tTua3GW4dHbNY88aGxl30rFcJ26yslElZSlZvhtWV8sTwCbDwPTx6Bdu/
	S
X-Google-Smtp-Source: AGHT+IGfRU6654Uc2vw7FSMjRFb2ASxFek1SQDBpBCnlBMtF57kKLTSmNkQevZuvZbH4fv6gvQ6/tA==
X-Received: by 2002:a17:907:d383:b0:a68:eb4d:3963 with SMTP id a640c23a62f3a-a6fab7d7ca5mr288954666b.67.1718866879680;
        Thu, 20 Jun 2024 00:01:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f57b5e7b2sm731229766b.68.2024.06.20.00.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 00:01:19 -0700 (PDT)
Date: Thu, 20 Jun 2024 10:01:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [linux-next:master 6398/7105] drivers/gpu/drm/xe/xe_oa.c:384
 xe_oa_stream_open_ioctl() error: we previously assumed 'oa->xe' could be
 null (see line 383)
Message-ID: <150a2951-1139-4f8a-b355-7c97c55adf99@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: b6fd51c6211910b1db072a3fa2a17ba85cb3dd51 [6398/7105] drm/xe/oa/uapi: Define and parse OA stream properties
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201042.bFrB7KXl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406201042.bFrB7KXl-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_oa.c:384 xe_oa_stream_open_ioctl() error: we previously assumed 'oa->xe' could be null (see line 383)

vim +384 drivers/gpu/drm/xe/xe_oa.c

b6fd51c6211910b Ashutosh Dixit 2024-06-17  374  int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
b6fd51c6211910b Ashutosh Dixit 2024-06-17  375  {
b6fd51c6211910b Ashutosh Dixit 2024-06-17  376  	struct xe_oa *oa = &to_xe_device(dev)->oa;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  377  	struct xe_file *xef = to_xe_file(file);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  378  	struct xe_oa_open_param param = {};
b6fd51c6211910b Ashutosh Dixit 2024-06-17  379  	const struct xe_oa_format *f;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  380  	bool privileged_op = true;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  381  	int ret;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  382  
b6fd51c6211910b Ashutosh Dixit 2024-06-17 @383  	if (!oa->xe) {
                                                             ^^^^^^

b6fd51c6211910b Ashutosh Dixit 2024-06-17 @384  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
                                                                        ^^^^^^^^^^^^

b6fd51c6211910b Ashutosh Dixit 2024-06-17  385  		return -ENODEV;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  386  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

