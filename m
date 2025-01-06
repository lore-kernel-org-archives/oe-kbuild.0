Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD91D935E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157926; cv=none; b=YiZLSNECp3RiW/xvnXOIXWedRyyzdlGWAGSDRnlv3HZ3exVUp7rOLAgC1BujyucvuR4OOct2ifrwqc0RC4jTaheS6u0L0maKqWkhUwiPpE6lgqtShNJUPbB5baAiec+CaZ+smQnETkbmV9SYrNx3/gfDDccqIlVhqK2XhMg/SLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157926; c=relaxed/simple;
	bh=lUn+M5Zy6trOi6wrXsrHJQTCwXdFFJRf9ku/RcsF31M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dk7HtUAjFVwJmr8xuNZcgBNdDMZILZgD6cvhflCIvbw6wKb5AQe01yiNQMc+3/hK3yi5fCOcWmjoy0d8Mzjm1JMt9RpP//WiKixWLAmf+CzsWgSeXZ5uIAgAtaiAjJ4Td+0LmU1/MCpsV+6GZZvLOS2I32a3d8P4AUTEbvxVkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SeveE3Tc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SeveE3Tc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f796586so146527835e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 02:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736157922; x=1736762722; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aFuwxRJ1BLmIcHxDipA4iDhvwHUfxFdxsK1ms3FFHY=;
        b=SeveE3TcPMgCwBAP7aeTobcJf0iUH0v+2F8Yh/7evfEkX2+wlSPjzN/qRJuRmfXsSS
         7sMZUnlAB5WYV3AyyqKfjg71KF7b77raibHI7mB0l9A2u3b52VnH/i9MaNx0e8KaLeGo
         rG172SlJ/nmbqysLDHNUeLe3ENd4BluRoRqj1jXUIVuVXDy7aDBuRirXGzgJZGhTRi3r
         hLVZ5M8f2Ir4y8p/o/2DRIqEqlPjGfC8wHjoxulWO6Fxub0tTGnLwu5W3CJUUCh6k76V
         Fk5Vi34vzszmcJEHhj26X9cqfZHVMomEVaKu+TXv8aHn6NdwRteWTYQrvKkUa5np7o4A
         SXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157922; x=1736762722;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aFuwxRJ1BLmIcHxDipA4iDhvwHUfxFdxsK1ms3FFHY=;
        b=PT8uR0UMK9lpO3x/ytvVCB8hc2FGlFKzUd1TWhURDqiFsopP1HAa63U88KqJ3v+ckm
         YlJcSA+0+0IiPc/EoIrio/S/NxjJFeM5zxDQ2duZ+usPQFahjncuFgxhkVZPl9bKxxkB
         IinQg3GKw4UzbhN8z3dnhFN8dcLmM+hDejMP+477Y9VXqReVkY5+qFqHMkjhflDaDrHq
         Aqo88UMxEHfZ1sOIoiGVx1EueGdlYl1zvtmKBT+ADrKH+k4D2ArCIx2bQdtkWU2tOLu7
         WV3hIqd5rraUKoHORb1tqW4Mfq47lfP0asGJi7ZG3ITWPcSY7ujEctn/IGuYJHR7Rvva
         3/YA==
X-Gm-Message-State: AOJu0YyvGQfwtq//vqQ13Jg1J+H/UGu1Is9xwIFel8sy1SyT4UXHFghx
	PwQaaj5YkBTehEU8nurSp93vhngbEGhvmw4YizWxcX49SAdhGUb5/iW5IhZh32am5goNc9kAZ6h
	4
X-Gm-Gg: ASbGncvtzZDjm0GlPdrcNpAL5tHmSmI6qO6Yy4rBc5skG2IAgBTUoezIP8YGoXTa8bK
	fxB/AoOYxpUlKrJqcNSxAp6Kl71PvclxIVGc/AdLNq+detbzZVK7ObthCT++h2HmKPVpu9xDjJh
	PP9THyXbOAQFGCkdi6OuTDZMousCGvBt9hoDCPmowh1oAht1k7DEtjGrp8TW/ILJEHFjW8bsT7O
	LNXDhPjsSZF+OitlZWWpx2C6CNoDZgfpiHpAw7ynqzXOPHmSW6hdEe3kpvlBg==
X-Google-Smtp-Source: AGHT+IGp3YCHi5t7UsBO/+Q0WIL1yrj9Ezk1Z36xacbIdhsyNWYE/FAd3rLiRRgeKXh9dlNSTuaffw==
X-Received: by 2002:a05:6000:186b:b0:385:e877:c037 with SMTP id ffacd0b85a97d-38a223f82f4mr42706303f8f.42.1736157922229;
        Mon, 06 Jan 2025 02:05:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a412f778esm33215177f8f.4.2025.01.06.02.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:05:21 -0800 (PST)
Date: Mon, 6 Jan 2025 13:05:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [selinuxproject-selinux:pr/72 12/22]
 security/selinux/ss/conditional.c:436 cond_read_list() warn: missing unwind
 goto?
Message-ID: <acd3d4e7-80b3-4aaa-bc01-064f44d17515@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/SELinuxProject/selinux-kernel pr/72
head:   658ac7dc269a7bc68b2040caf9953fcf2ec7d9b1
commit: 3ec5d7b95729824a7373521ca15951c852fb7125 [12/22] selinux: check length fields in policies
config: alpha-randconfig-r073-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241405.LK8YTZqp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412241405.LK8YTZqp-lkp@intel.com/

smatch warnings:
security/selinux/ss/conditional.c:436 cond_read_list() warn: missing unwind goto?

vim +436 security/selinux/ss/conditional.c

006caddaada8c9 Christian Göttsche 2024-11-14  418  int cond_read_list(struct policydb *p, struct policy_file *fp)
^1da177e4c3f41 Linus Torvalds     2005-04-16  419  {
b5bf6c55edf94e Alexey Dobriyan    2005-09-03  420  	__le32 buf[1];
b5bf6c55edf94e Alexey Dobriyan    2005-09-03  421  	u32 i, len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  422  	int rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  423  
65d96351b135c2 Ethan Edwards      2020-06-24  424  	rc = next_entry(buf, fp, sizeof(buf));
5241c1074f6e2f Dan Carpenter      2010-06-12  425  	if (rc)
5241c1074f6e2f Dan Carpenter      2010-06-12  426  		return rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  427  
^1da177e4c3f41 Linus Torvalds     2005-04-16  428  	len = le32_to_cpu(buf[0]);
^1da177e4c3f41 Linus Torvalds     2005-04-16  429  
3ec5d7b9572982 Christian Göttsche 2024-11-14  430  	rc = oom_check(2 * sizeof(u32), len, fp);
3ec5d7b9572982 Christian Göttsche 2024-11-14  431  	if (rc)
3ec5d7b9572982 Christian Göttsche 2024-11-14  432  		goto err;
3ec5d7b9572982 Christian Göttsche 2024-11-14  433  
60abd3181db29e Ondrej Mosnacek    2020-02-03  434  	p->cond_list = kcalloc(len, sizeof(*p->cond_list), GFP_KERNEL);
60abd3181db29e Ondrej Mosnacek    2020-02-03  435  	if (!p->cond_list)
292fed1fc89509 Wei Yongjun        2020-04-27 @436  		return -ENOMEM;

goto err?

60abd3181db29e Ondrej Mosnacek    2020-02-03  437  
3232c110b56bd0 Yuichi Nakamura    2007-08-24  438  	rc = avtab_alloc(&(p->te_cond_avtab), p->te_avtab.nel);
3232c110b56bd0 Yuichi Nakamura    2007-08-24  439  	if (rc)
3232c110b56bd0 Yuichi Nakamura    2007-08-24  440  		goto err;
3232c110b56bd0 Yuichi Nakamura    2007-08-24  441  
60abd3181db29e Ondrej Mosnacek    2020-02-03  442  	p->cond_list_len = len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  443  
60abd3181db29e Ondrej Mosnacek    2020-02-03  444  	for (i = 0; i < len; i++) {
60abd3181db29e Ondrej Mosnacek    2020-02-03  445  		rc = cond_read_node(p, &p->cond_list[i], fp);
5241c1074f6e2f Dan Carpenter      2010-06-12  446  		if (rc)
^1da177e4c3f41 Linus Torvalds     2005-04-16  447  			goto err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  448  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  449  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  450  err:
60abd3181db29e Ondrej Mosnacek    2020-02-03  451  	cond_list_destroy(p);
5241c1074f6e2f Dan Carpenter      2010-06-12  452  	return rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  453  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

