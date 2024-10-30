Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29171E8859
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730292557; cv=none; b=rcT8PruHBZv6MXkORwLauOpa0QBhDU/c3+u6SlaLYxx1aEHs8UymGo4xG9B9rEJcs7HHJcJ6xOsmvW2F2dCyY9oH2/mu1d5stcnsX09cXsmAKZ5N8htJtJZUwYm/s4cv8FK6LqalUuAOXMtZbS3nzWusmF+WoTYOQON9Lx2D7Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730292557; c=relaxed/simple;
	bh=nP//XpVCX40+VQoYogV2qVMx8Ts75iECOz9NAjXbez0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H96jn29+/D3udFPi2MAxxqhXb810UqJBzZPQ9LQAqp1vcBiWi+3Wu8RPqAanQtvr4usyswgem3a9X7chzI39gbWpsn0nUiZRXgJLXd3kWZCYGlaudp0YhuBzU4dCwOl8USo44IEpJbyeyLpcIfWVDIvPGNbQ+HQZrgVhbrMWgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxkJC3fn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxkJC3fn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so66000875e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730292553; x=1730897353; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLbWQuyOwSNbO6C9F9YvkyVw3+zNlZhq2daNiveAc9g=;
        b=vxkJC3fnD1XxNCjmOHkU+HcRNE9NilD79cfePSETUJ64m8+YBlatJ4vi/DJXurjUlf
         Zsjg4Dq8puy9D+kqIHfBB9lnmDXrsClTu3d4LBA87YXF+lajXU52NZhNSvwcmDMSv4g7
         zNBsle5+NDtmGYtWjnYfpynJL6TzIeLbxuN+VRpdGCtIrWxZG5Lp6tf4DfCDwbUcdhjf
         MSC9bqyQvy9pzOk4vU6PfZaR4RtCnHp5/k0gRtfsMx7Gt1MzRP4bM2qIY33GEmuf46gU
         JYZoiYrsm5lRFaPe/5QVtmbzhAQCAAroZugRgjep2+Xs1gP6QkIqwmkJUUZ9IHiMahVm
         +YIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730292553; x=1730897353;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLbWQuyOwSNbO6C9F9YvkyVw3+zNlZhq2daNiveAc9g=;
        b=a4NGim0kZy+eQrMsx0pPswekEzL8HC+VjP+zpWZwyvFGbwXMi3PfnOu5Ve9BvLrvoB
         ZXjr13K23fwRszy4hyWyocUF2YzJA/0Qkdl2vYfvBv1MUj+WPeBYfk5Tu7pVb4550EOF
         9frFzTqn1JfWAiIlfCuLybFgOjPmoX2vPBkKk3Grhyz3hinClTm5w6m6iQi7bd44FRnP
         MSXFbzMj9EF9OLdZZ5fUtDl1BfgVe/tk9UodRJ13fNALA84DzCTiOf5ueuzifDkkhnpd
         JLd+2MmraJFLdJH3OrIxxvhI34q+uYvyO9dpIgwg/JoU0LFIb70UVvR2U/rj4BCa96mF
         bo+g==
X-Gm-Message-State: AOJu0YzGsEk7hBF2qHjxr4aFjyuJkJmZPAWiRok0qgptDKWVZSKeeoN3
	y0h/96ltowdY2gzaTW2Ky+A5PMunlKnZB/but3hyfekgMR7zD1GmyBKPwsAs6hNnEx+Gt06XbeS
	m
X-Google-Smtp-Source: AGHT+IFX907nH/xWHWI0I4wgqakVQ2XLLy+4a571Ibgp7bsgSeK0HOLzfcIqBokzVap5alIYstqblQ==
X-Received: by 2002:a05:600c:a085:b0:431:7ca6:57b1 with SMTP id 5b1f17b1804b1-4319ad2d1b4mr140416705e9.32.1730292552825;
        Wed, 30 Oct 2024 05:49:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9aa09fsm20557645e9.37.2024.10.30.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 05:49:12 -0700 (PDT)
Date: Wed, 30 Oct 2024 15:49:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/core 21/21] kernel/events/uprobes.c:718
 hprobe_consume() error: uninitialized symbol 'state'.
Message-ID: <56872672-ddd7-40fc-84a2-ee17ac817dbc@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   72a27524a4939fc0958796a46b51c1fab3729367
commit: 72a27524a4939fc0958796a46b51c1fab3729367 [21/21] uprobes: SRCU-protect uretprobe lifetime (with timeout)
config: i386-randconfig-141-20241030 (https://download.01.org/0day-ci/archive/20241030/202410302020.1jHBLfss-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410302020.1jHBLfss-lkp@intel.com/

smatch warnings:
kernel/events/uprobes.c:718 hprobe_consume() error: uninitialized symbol 'state'.

vim +/state +718 kernel/events/uprobes.c

72a27524a4939f Andrii Nakryiko 2024-10-23  705  static inline struct uprobe *hprobe_consume(struct hprobe *hprobe, enum hprobe_state *hstate)
72a27524a4939f Andrii Nakryiko 2024-10-23  706  {
72a27524a4939f Andrii Nakryiko 2024-10-23  707  	enum hprobe_state state;
72a27524a4939f Andrii Nakryiko 2024-10-23  708  
72a27524a4939f Andrii Nakryiko 2024-10-23  709  	*hstate = xchg(&hprobe->state, HPROBE_CONSUMED);
72a27524a4939f Andrii Nakryiko 2024-10-23  710  	switch (*hstate) {
72a27524a4939f Andrii Nakryiko 2024-10-23  711  	case HPROBE_LEASED:
72a27524a4939f Andrii Nakryiko 2024-10-23  712  	case HPROBE_STABLE:
72a27524a4939f Andrii Nakryiko 2024-10-23  713  		return hprobe->uprobe;
72a27524a4939f Andrii Nakryiko 2024-10-23  714  	case HPROBE_GONE:	/* uprobe is NULL, no SRCU */
72a27524a4939f Andrii Nakryiko 2024-10-23  715  	case HPROBE_CONSUMED:	/* uprobe was finalized already, do nothing */
72a27524a4939f Andrii Nakryiko 2024-10-23  716  		return NULL;
72a27524a4939f Andrii Nakryiko 2024-10-23  717  	default:
72a27524a4939f Andrii Nakryiko 2024-10-23 @718  		WARN(1, "hprobe invalid state %d", state);

s/state/*hstate/?

72a27524a4939f Andrii Nakryiko 2024-10-23  719  		return NULL;
72a27524a4939f Andrii Nakryiko 2024-10-23  720  	}
72a27524a4939f Andrii Nakryiko 2024-10-23  721  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

