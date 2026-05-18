Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68870380FC0
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 05:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080539; cv=none; b=eQzOYE42hNvBZ9kKToQ0IT2Lb+b9w++KJcoP1VE4K+aKwlim0y2ABxkjpnKFYH0QvKIgdIR8T13L1+9yWOlhAg9yvoq2gmbKkAE0Fn+3LDrnWelHi6rKe9GOFfYmVAgfmml7yO0Z8KYESriZsaRgB1Vimog1lfU7IvSS1KJohVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080539; c=relaxed/simple;
	bh=wJk729J9hFcJayciAmfuS6hEE3iMNdLSijZ70g86RZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apn3jwr0JQm2HORzGlN90FhByGZm4d84/3I/jJ5NkjTXvN0YosmU0+ccvqFzu/3LRtVOnEqYeFs0x2nsnVVbHN4mtei1a2BU/wLDakhU3PttMrodsHEs9gGfSzls2hpiyiSGXy/A1q73sRscFzyydICaJf3M6cJh6bvvfm6ayvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxSxKQwl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxSxKQwl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0046078so15084675e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080536; x=1779685336; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4b3d+dkGn2jAB9QFWopKTNQvof7u0/leWFWS+6i69I=;
        b=lxSxKQwlr452C6wSqpUJOR+paoO3bK3g6dM/3jxb5xslrFydESg/G3HQCBf4Svm9Y3
         qKktA7VN+Jqsiu1ExarbERFMNy5Ji/FmmifmxZHeFDCYlsEnyOS399f0y/BrlxzXxFF/
         rlW5A698nGCbT3xF11uIj+XUEjJNaTjn9c6O0Tcgu5UYRBRCoiVCU76ffhz/ecoJj/gr
         Cvl+KAIF/Tpu8LsSPDI6aGj7rfK6waQUTF7raeB2iZfWbeDZaqLgjPqnVmUG63bIiRwO
         dAT5ZlCvTZC1emOjMEbhRWD+NDW00dDQ6ryspzQd4kIUEKVc+HDbyY437wjvAwxXAtQp
         AhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080536; x=1779685336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4b3d+dkGn2jAB9QFWopKTNQvof7u0/leWFWS+6i69I=;
        b=ZIVmDQei/rROLDnh/iyRq0s3G+jYsWfG2wdCrt6E0Wgq1WXHljBRycJRLDKuIvgQb7
         PSbvXh3ds20vKot3WFVZO/9TjOkl4CTtgxz+YgqpXPzK+fXkMZlLPHMF22SiBp05e1xq
         Dp5ECmez1GJyRSNXz4N4QeGhote4nEzAN8Px/0epgSk7u6OeCWJdIqO9yuNwVvX7bKwV
         jzw8wSdwZWG4E3Hd/hgknbVi235vWTurMvz1wnCqSUQHjeBg2+kbGufhe5gOUo0E86uS
         dccIy/RXVOxJU4se/mRpdDwaczgOorQukx37jNUDyNEq0izfCdNlww2TifPwgVvdYDCL
         aHFw==
X-Gm-Message-State: AOJu0YxvElbDB+1CTIr8yYduwib06xhWePSq5Gx+tHIZHBocxr+sDcQq
	jn/WjcdXUdzbW6FG5Z2vKoOdrP5kMkXEjBqmRmLNcVes3bEQo+OOr+hhkwphKg==
X-Gm-Gg: Acq92OHs/CRsaht6kSREfCDveOJ4sJ/UxVv13mNNZNtaRNPvLO4sV11cEts3wZ4JRkc
	bAuG/S5lKHepaVdcwsmFjRQ5NEajpmuYUgYKEqcCbYYkH/lvOUH5RQChr9nwGgiF3g9MJ5zWOch
	qwosGl8KZB2L4WD142iG65BCHnPfgNZlx07uOieyoBHFqBgdaE7zu9BuYbmNUlNBBcD/nqUiy5K
	61SkvtXvEvX71K7GwecId3hUYkszpyyXlgPx9OJrLA/qZhl1254yNLMBV1tm78ghRocO1d8Joja
	wgVQ863IjRB8eHFzOmiG9dcVDYBFjMDlCkQ5iJnopLMZcN7QOuWmriYJPBPTxXYHgtFdTVc/XZU
	fPhsmRfwqm436WW+jNr3665MnKBCeYYEfJxjSSN0Rx+UizM64Iod3MduMPQoKclnm0vN54nR+Du
	70QWNOi/XVLLeapS184jo=
X-Received: by 2002:a05:600c:4e47:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48fe61ed3b3mr218628225e9.16.1779080536331;
        Sun, 17 May 2026 22:02:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6faeasm73287305e9.26.2026.05.17.22.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:02:15 -0700 (PDT)
Date: Mon, 18 May 2026 08:02:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:cgrp.struct_ops.v8 9/12]
 kernel/bpf/cgroup.c:513 prog_list_replace_item() error: we previously
 assumed 'pl->link' could be null (see line 510)
Message-ID: <agqdVTjHR3iC2CB1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git cgrp.struct_ops.v8
head:   1ae5eccb04d5d8c62c310b206b5e5dc4ff1d9c71
commit: 32e27daf9a1563276f88eb17d076f61f8cc8b502 [9/12] bpf: Add infrastructure to support attaching struct_ops to cgroups
config: nios2-randconfig-r073-20260517 (https://download.01.org/0day-ci/archive/20260517/202605170734.0Q0GXEJ9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605170734.0Q0GXEJ9-lkp@intel.com/

smatch warnings:
kernel/bpf/cgroup.c:513 prog_list_replace_item() error: we previously assumed 'pl->link' could be null (see line 510)

vim +513 kernel/bpf/cgroup.c

95b27b9bf36972 Martin KaFai Lau 2026-05-13  508  static void prog_list_replace_item(struct bpf_prog_list *pl, struct bpf_prog_array_item *item)
95b27b9bf36972 Martin KaFai Lau 2026-05-13  509  {
32e27daf9a1563 Martin KaFai Lau 2026-05-12 @510  	if (pl->link && pl->link->map)
                                                            ^^^^^^^^
If pl->link is NULL

32e27daf9a1563 Martin KaFai Lau 2026-05-12  511  		WRITE_ONCE(item->kdata, bpf_struct_ops_map_kdata(pl->link->map));
32e27daf9a1563 Martin KaFai Lau 2026-05-12  512  	else
95b27b9bf36972 Martin KaFai Lau 2026-05-13 @513  		WRITE_ONCE(item->prog, pl->link->link.prog);
                                                                                       ^^^^^^^^
it's going to crash here.

95b27b9bf36972 Martin KaFai Lau 2026-05-13  514  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

