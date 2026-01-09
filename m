Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6B433506B
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952630; cv=none; b=q267deDzRek7lB/9TMIo21yA1cLZJLX6ZyVqXj8VQu0uF02SOOD7FtB59eVvE03bpudZfVD//rU8N7MzuQxr0X6gJ7yFhY8kaIv3fTQp7rRZmahMbl0ja47C0KExUjgGvNiU0F1pFQLWgzHJ7gv71oOOem8HVug2sQcCggHMB3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952630; c=relaxed/simple;
	bh=dz7KB5U3gx3viAJcCdLa2VPDIKl8SwY4jJYjy8LTtOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gvhv8bZFuyVdTCoXrgQcaD4fWvBeYokwcSST30y+eeVDyCEl6k7xT+uuOY+vAPCiqc38GTHbbt++TgxZXxJ74Nxaa0hPh/hPDi2VMNxDNFyNK2Ox2E/LugB/uorwqjqdT8srcb0/Gpl3+LB6nJwNYtwj7RDCJRxb0LUT6/wLsq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3RRot+7; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3RRot+7"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso14790605e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Jan 2026 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767952627; x=1768557427; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RqShnqGsHgQYTVYTqto7aLrJkECk/U5MKTx+2e9Xsk=;
        b=B3RRot+7t3Tkcp0YGXGP9zQ/txw53SHgY3odBl22VFkUrjf7XcBHkaJXiemVEVhi01
         75y5ERmGrKM+zAN0o4k/NT83zHq5TGh8bnpZsAbPhKTYEbvkPb/9HGNT904Zp6rb+C4T
         ggn2+Lj107PbdRnQOE0GR2moHuYGOm+cjUzPnjpB+x1ydgi5notUwP6sC69UWRIy1hkP
         QRVodrK6wx16rvKqmTbDaaZ2UqoueF9Uv9VOf9KFaPQjUVn4+Zo3a01/9Mo/SZ+g6UVv
         DiBZ9ulpe5tfy5Xwh0UMblM3rboHtIv3ciSuRZ3KhkpTnSiPnrVP2LdEJ+XXEpPJjSgg
         9Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952627; x=1768557427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RqShnqGsHgQYTVYTqto7aLrJkECk/U5MKTx+2e9Xsk=;
        b=F7ulB3tV+UZgmr6mnDTjmba5cXZq6Uo+qE8XBMeuxr4+FeFRHeypL8jYLBC0B0TVbd
         eAZ2gCK/XhT+9sWDWKHyqa42C6gMERQQLuyCCO/Re61knWP2aqNqQTkgkUgq+bpwBIns
         k03GjQLnBR0NQ1f/WdyQh3KJIlt1+mi3ANXG26GCLV2AnucqL0rCB1tzKL+dr6sLaqbO
         P1JQBL9MecaLp51z5SPUH5mo+NOwxd/aXa17zygumUaR/bCPxwNsm4hYfQPFhGXRZtFW
         uU1flhFLchXHK7arYEeEaOhbshd3XqJau7146MBg/FgwpX1jImak5TBL5nVHf42RI9uX
         Sj9A==
X-Gm-Message-State: AOJu0YwV3ETQuZ4RGOFM7Up276m5iXxsuWVyaR8ysgdXmlx/3e5+9uzZ
	xjU05kVaFTcaSpMssWzUtiKhfGha27/e+U30+SAR+HTP3U9IcDB4SgFXPtVIVQ9u01b6vcsAEh3
	2rOO8
X-Gm-Gg: AY/fxX6trU1nqTvDCYdLkeGNUHeTr4qU4+dDDZ9PwnPYaxBZ+fP8fSV8Sf4BZd1lfAT
	glCyNezEZ9RQle8RR+vC5+5dc45CZGTQog+bW9Tnt+3U1GqN8EMSveQv2DVMEDTZWIcbKx/5KW3
	WLs9EnqPknESeseYdlt6i4MJq0AFCWzkoFSpWrbUlCgSP3brZmi36SfvjAeneBaZtCQ3zC7emGy
	tiHCbPKmAogLTcoy/hDcvh94Vgv89pnwuyTWmC18Gc1soYPah+kHjuCDaAKq9uvBjoRGIBvgQY1
	p1KZdcxC68NWA6YYbGEjEEULlqAk0t2UMA5Tft4CPhilH3uQ/hbQhpHO7MYiIjC3MAOsIDS+FOi
	rkhF3H8gKx7rAGmwGnZhOltRMhnZH+bumn9aAZBhqY1fhmv66993pZdqISPawO8i+hV1r6nGNil
	hnCHP+BFGlmeeZ0nWKLceCoWsMkfA=
X-Google-Smtp-Source: AGHT+IHzh/pNeqZUBGaG4KiRPl2v7SR9G8ylIFzlUQ3MiO5GcK+In2/wGNHZw3ijn2CU17RqJrvdWQ==
X-Received: by 2002:a05:600c:6308:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-47d8486d60dmr81639985e9.9.1767952626449;
        Fri, 09 Jan 2026 01:57:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm211143335e9.1.2026.01.09.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:57:06 -0800 (PST)
Date: Fri, 9 Jan 2026 12:57:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.filename 15/59] fs/namei.c:160 getname_long() warn:
 the 'EMBEDDED_NAME_MAX' macro might need parens
Message-ID: <202601091728.qaU51LaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260109095703.W_DlHsC_wcZgk_kUHquPqc0nYnih9BZQO3xUCyC3l-A@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.filename
head:   30ba070760d3eb039c6eb91ad17d8c1e13335a7b
commit: 2a0db5f7653b3576c430f8821654f365aaa7f178 [15/59] struct filename: saner handling of long names
config: powerpc64-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091728.qaU51LaE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601091728.qaU51LaE-lkp@intel.com/

New smatch warnings:
fs/namei.c:160 getname_long() warn: the 'EMBEDDED_NAME_MAX' macro might need parens

vim +/EMBEDDED_NAME_MAX +160 fs/namei.c

2a0db5f7653b35 Al Viro       2025-11-19  152  static int getname_long(struct filename *name, const char __user *filename)
b8000a3628d80e Al Viro       2025-11-19  153  {
b8000a3628d80e Al Viro       2025-11-19  154  	int len;
2a0db5f7653b35 Al Viro       2025-11-19  155  	char *p __free(kfree) = kmalloc(PATH_MAX, GFP_KERNEL);
b8000a3628d80e Al Viro       2025-11-19  156  	if (unlikely(!p))
2a0db5f7653b35 Al Viro       2025-11-19  157  		return -ENOMEM;
b8000a3628d80e Al Viro       2025-11-19  158  
2a0db5f7653b35 Al Viro       2025-11-19  159  	memcpy(p, &name->iname, EMBEDDED_NAME_MAX);
2a0db5f7653b35 Al Viro       2025-11-19 @160  	len = strncpy_from_user(p + EMBEDDED_NAME_MAX,

It's harmless, but the "p + 192" happens before the
"- sizeof(struct __filename_head)".

b8000a3628d80e Al Viro       2025-11-19  161  				filename + EMBEDDED_NAME_MAX,
b8000a3628d80e Al Viro       2025-11-19  162  				PATH_MAX - EMBEDDED_NAME_MAX);
b8000a3628d80e Al Viro       2025-11-19  163  	if (unlikely(len < 0))
2a0db5f7653b35 Al Viro       2025-11-19  164  		return len;
b8000a3628d80e Al Viro       2025-11-19  165  	if (unlikely(len == PATH_MAX - EMBEDDED_NAME_MAX))
2a0db5f7653b35 Al Viro       2025-11-19  166  		return -ENAMETOOLONG;
2a0db5f7653b35 Al Viro       2025-11-19  167  	name->name = no_free_ptr(p);
2a0db5f7653b35 Al Viro       2025-11-19  168  	return 0;
b8000a3628d80e Al Viro       2025-11-19  169  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

