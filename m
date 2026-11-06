Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941608;
	b=LYe6+meYhP23ErM9D02tWqrYdnAgJQZA6gUKtl7VdzmbReqfn399xM6QZt2+KX66PAyu
	 pCg13HapLQ7IKy7Or+hHjPwtYXbBTNoOG0aFa46K+vP/IkrCNlSLUGubBGCyz9cGWspdk
	 hBKPs9OaQATsZixdqd8GTweW+RM0Ica/x5e5cahBJiWsNgm7uJcCpaFX89TgHteArjNKs
	 ssjDgwuBi/aSvmFc/qMC/iDY//KofBBlnAY1zktgjH1SQgQqMpJRzinH/q8uuvpiBBiWn
	 65Ap4noksAk7Wzlz811kCWr9Twithfc3AfUGZ+jCmFrKTIsl8uLuZ/dFtFlUbn1niAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=L+nkk/Z6dYHahYLqYnz/str0XrICAT9C2M+7AZPoEHw=;
	b=kUwsaE8oV+M6aUy6TS/EXkeHKAYnQBprHMHSlrFD6gndt831kmu/6JeMXQ8KFfmvwopf
	 +Fx821Ho8HBz0jiOWISlaoqQV66V3ZbFccUjriMWSwNtRlLNYq2HjFOtVqgb8olRcV683
	 tXovDBnRgcDYY4ffhmcIhwUzzx9yzRLwwQVn2dJURfND43X17DZVepkOHw0HMF3qIV2eI
	 35pv4gLZjJToao+U78RVxiQ+YffQoipeS91w1/6Nr94oV3dwD93W/drPFRkxcKvSZZLXr
	 NkR3cgqOp3gcgxNWnkrix8W2osIfEl+jN75AdYPI3cz1sp8d34HG5tQebYxNyV3WNdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjEhndmI;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C94606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 05:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C94606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjEhndmI
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2293195e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 05 Nov 2026 21:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793941606; x=1794546406; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+nkk/Z6dYHahYLqYnz/str0XrICAT9C2M+7AZPoEHw=;
        b=VjEhndmIl98DvE5jxf+yStlIwT7qSbTlpVpPLBDM7pd/8Xu9Ru4T7KowNaWPloLnJP
         H2hLZu12geHYvG0f4DbV9dE3gMKCnfC7rIjVEpbBnFbyl+hmFaJfkbLNpFMaOVa3YffW
         /hzRrV3MvBr3VwkVOwQ9NJwtjt0rLmyXu1SKcZ9LDudWJkqS78jkBtG9IEJV9Z8Juaix
         WiVpbs1ce6/zD8H4ohVZZF437pR2u5jFIAMiyCxMSvJ245FcpBxSLrm4jbEAPNsDUl2Q
         K9Krfr2C+vUZgv1jUCcm88nmkANw5LEQXbRt9dMQpDhygQ/Q6klB8uDZvKehlNhnoIie
         OtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941606; x=1794546406;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+nkk/Z6dYHahYLqYnz/str0XrICAT9C2M+7AZPoEHw=;
        b=lKSmoYMam7FR3UdYKzDLV3lQ3U4VrFkjnOnOKhXtWj8GWN1ejUL5ZnK16rX7w35GWS
         U+PGA2G02nbt2MiJn2xK9khaA1VowsLBqVAmk49SozuqA+9B34Ky7Ajw7Zt5Vnuj6jwT
         j0id5CVOqcRNvbQBi5W2mVFGakIvAPCp/k6l180R/AHAee4uK+DT2fuUkhZH0u4a5UA5
         ce1Nc8TK8NXK4FeqODyG/lN9+NicVrefO4aVTtVdEffuxAg+ZQvKB8OVm3Y4ht8GsK0U
         Zl60jRDw7y7pf8OF4NNM5XtX5RUDWz1jY0IfjKoEsWQdcc2h2eab1RCkGKRgCDTa0du/
         ARug==
X-Gm-Message-State: APuU4Z8nQoCZaaqa5ARUWwD5C+iCUvcaiopbJCjg2CHdvma1o1RYniKv
	YGWsHN8C9xxpWtM1lxZgYlA/sQzLGUdu7vhpX4toql6N7XxSSmgmd5XpYUCe/rcdX8MOcgFp
X-Gm-Gg: AYBFou3sLfnd9+2WPq1dYqsGKBSXJf4oVwicsDby5J+asyOTnYRvdgOdml6kYQtgn+d
	wkNelgjfrxWBXx4qReeRMKYTC3nZqf1JpU35ZtXat3wgOi98jH3ikukMtfgLUEbTmk3QwDNErfj
	R8BlYt9kdyi8Ocdo/wZ+X6gOQZMLFVFE7ArzL5L5PjxNAQZWHq2Y6wI19TfDj+RhTogLDvaNaMR
	Xcn2XCkc3aldlSyDTv0kW/7Oyr3eBA3n3WrWF/PKaylXSbXjjqq3c3A3nufjBbgNFkCnNhk4E+P
	//w+72UwKXFWif0lDzeD6/AkUdKmyBi5E/IFKUmEQZW3s6LgJR6PAcsv6j6iLdLM3P2otbzFw8z
	y4U1RAUEqmacpm07xFQA5o382rRlgYu78KqkXyPqKgmKM8CUEcNDoMdQhA6JxVY+0j4RGYpy3tq
	5RQ46xXY6E1Ov+BcmeD1WO+TusYcMjm5JFQa/srHVcZWbw9KIT0C6MvKSwlBQs4fTfZ8IAhkzEz
	rvTVD261YepPlFkTqSGgvV9XJMq5nco63jbF0NZwfF+61OwBt4FYSp6TJJPengRHU9+w0TFCAEM
	zzeLsFu2d1vRaRYbNmcz13lB/MNqy+8p6FxHfYkkDYldW0iuE5P4g/Q9R1WCq0LkZIVZGf6pBXl
	LGhJNxGGjubXufCmYWo1rsmX/8t9AefPhm9KxuiLxdB7h4REbOKJotRhbORjH97xJWAmzAlL/hd
	jDojoao1BXcW4=
X-Received: by 2002:a05:600c:4f13:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4b6de1c645dmr18639845e9.20.1793941606054;
        Thu, 05 Nov 2026 21:06:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b75ff3a19esm4223885e9.0.2026.11.05.21.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:06:45 -0800 (PST)
Date: Fri, 6 Nov 2026 08:06:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_apei_v5 51/55]
 drivers/firmware/riscv/riscv_sbi_sse.c:1253 sse_ghes_handler() error: we
 previously assumed 'cb' could be null (see line 1254)
Message-ID: <202611060143.FmE9sikJ-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261106050642.zdVY8tMTp7-C-6aEwhB4LcoRN2DUrFfiU7T0HinKgtY@z>

tree:   https://github.com/avpatel/linux.git riscv_acpi_apei_v5
head:   14cf6b25f78f759a54f0f4b4c2a62b8de4d67549
commit: 08384c64ea14c3dc8f269ae07c9ac14f339b5d7c [51/55] riscv: Add functions to register ghes having SSE notification
config: riscv-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060143.FmE9sikJ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060143.FmE9sikJ-lkp@intel.com/

smatch warnings:
drivers/firmware/riscv/riscv_sbi_sse.c:1253 sse_ghes_handler() error: we previously assumed 'cb' could be null (see line 1254)

vim +/cb +1253 drivers/firmware/riscv/riscv_sbi_sse.c

08384c64ea14c3 Himanshu Chauhan 2026-09-24  1248  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1249  {
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1250  	struct sse_ghes_event_data *ev_data = arg;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1251  	struct sse_ghes_callback *cb = NULL;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1252  
08384c64ea14c3 Himanshu Chauhan 2026-09-24 @1253  	list_for_each_entry(cb, &ev_data->callback_list, head) {
08384c64ea14c3 Himanshu Chauhan 2026-09-24 @1254  		if (cb && cb->ghes && cb->callback)
                                                                    ^^
Delete this unnecessary NULL check

08384c64ea14c3 Himanshu Chauhan 2026-09-24  1255  			cb->callback(ev_data->event_num, cb->ghes, regs);
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1256  	}
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1257  
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1258  	return 0;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1259  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

