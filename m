Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB61CFBC
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Jul 2025 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753034065; cv=none; b=oQPIS0P2vgjj16T+KH3DvWTH7f0fECTtwyUQoEoNqTO2Vb/LiKf805wQvSdqS/psB2Z6HEFOcSEb506eh02tC2+xbZxwvOqoWMa2sbuH2tNGNJOoSi9JMMv18B3RemzATC1v/3wS7U0rlCmJZlTNbCik5ytKdRpJe7MK/7l74dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753034065; c=relaxed/simple;
	bh=t8fldCC59vQdy1maPpAMuqFQIWBxrZrWYPD6Ky2Zz9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByG8jZKpfrPUEnh/hozwomCECp/Z0m2ZGGzRXJdd+vdNfnUd3HFJ4DzpFDR7NO2LNa04NCa5tung3AGqVIip4clZJVK7M1uPehX2DroHNIQQJKwJXrTgQ/IvIFfhHt6WhGRQwDyKwibyosvTVvGlD8kkbJXrIUkQSxjn82GiO1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+dKzK7l; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+dKzK7l"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-41b8e837427so1030368b6e.3
        for <oe-kbuild@lists.linux.dev>; Sun, 20 Jul 2025 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753034062; x=1753638862; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QodmD/yvlOqsTdlCDmntCJr5Lebf8mVpdPIZogItMbg=;
        b=s+dKzK7lAQjoKxxdPct7DpWkAW+yoBwtiD/bfVJ0YTHuWj7piLfXutBPwAzWv1iy99
         aKM11569X29sHu0T4krsduCGBy26Fvr/Y9uFXxwUqZ3ILKPT94HpV4aQlPusOuPYHlRM
         YSqPaqyQ711Ae63SpEQTbX4EMD/f4EzTVkriTvO/xK+U307wUELYrS9Et48lTenSnRXL
         S+7vElO9vLrfscJ/+VJ/ZHHJrjZRu9g8v/4G3wSJsa64FLLET6oB1xBXJnnZ25nNPrSk
         XC/Vsswg2CvmXpr1xusuGniTuNI2/kIYasFqyV57WxccRYWw+Uwhv8UO4GTzlzMBMu6A
         P63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753034062; x=1753638862;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QodmD/yvlOqsTdlCDmntCJr5Lebf8mVpdPIZogItMbg=;
        b=q31Q0GJR2r5MdOenjKAVuyARC7cwEhB1NyFof8QfogIdJj16Ke0GJVyu3nPli38k7z
         MktOk4U3hSFZ4jHFrEML8F6Ez4j4S1DBZ72euklLelV/AqHIQmQvhly3rLWoCvHHCvXJ
         T+lssmYZa8PqCMQR3LoF7jcy+y29W47FnvFwAbN0gBGjL43qA/BCcpy6n5E7QrBwzD+N
         UC/aK6FlGG3HyI6U9gOc/MjTjlJqDo/JpqGgY3yjHIy9Et7pBqSd289acbFoDbKvYCB0
         J4kO9V3GzZz+Ki7qeywBobBfz3OaR3AQ2XU9cqz11w9AZHDZWzz9cHk7O9K0u1TyjtET
         3Q+g==
X-Gm-Message-State: AOJu0Yw6mSqcud+6N00TUvKgejOfVFUWkGAQsOxUT/iLZsedeWdjFUtC
	KVmSML8cZGVVigmcicjRYrhR0v8kDamQfynrkE/ZavSgXK/parcWhtABNlbalHLYCFZiCpC6HnL
	yUmFhTOI=
X-Gm-Gg: ASbGncseao1eiw2uB/9APJtHq1VcF41+kc1vxygFZF3axJl6th9GjPTtNJ6IRtc9/np
	yH9ILfYp8oHT3//YRm/lJHhcxU58kCKMcRtYkD3CzqQlnKp3OThUmP22jIJs7jxxTJXTdQ/DXH1
	tAdRGurPPTRdfuVFCVyOBbD/akLg7N8S2OuIsEXaOO27uC5SD18H6+yU3L64KMgIq/1yfAgYydO
	4S6V6E+tzXwZaC4jxitq3YtG04eXztnwmFEZj3J2OC4LFx3X0PQSQpxzvlx9Jb8ui9aCVSl+Ptn
	T45wE5S7Ql1xaMRgjq+TET3/3k4+lme6t8sFLOicOiPsw3muEB1u1mToiiptopsvPga3EmckESe
	s7O5RF/sj/0k=
X-Google-Smtp-Source: AGHT+IHPwQkE5NSlkXOKRsOfydGsriWJ3Ga2PLKGrZ2nY/ltysZNpCiHTjFlTFa8Bc65x0aknK/gOw==
X-Received: by 2002:a05:6808:250a:b0:404:b5c6:46f3 with SMTP id 5614622812f47-41d04996bd5mr12711168b6e.21.1753034062146;
        Sun, 20 Jul 2025 10:54:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41fd10c0d67sm1720370b6e.6.2025.07.20.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 10:54:20 -0700 (PDT)
Date: Sun, 20 Jul 2025 20:54:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 8/212] fs/bcachefs/journal.c:1091
 __bch2_next_write_buffer_flush_journal_buf() warn: 'ret' is an error pointer
 or valid
Message-ID: <1d25d6b1-987a-44b7-85b8-10bfbf0e0d66@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   d156fb9d839cefc9bfff54b421e93c9178afc40f
commit: a911a076477d96cc41e74e849af6960b2c5694c3 [8/212] bcachefs: Add missing barriers around journal reservations
config: i386-randconfig-141-20250720 (https://download.01.org/0day-ci/archive/20250720/202507202116.ELQyRxI3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507202116.ELQyRxI3-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal.c:1091 __bch2_next_write_buffer_flush_journal_buf() warn: 'ret' is an error pointer or valid

vim +/ret +1091 fs/bcachefs/journal.c

0eaac0b44fa93a Kent Overstreet 2024-04-23  1060  static struct journal_buf *__bch2_next_write_buffer_flush_journal_buf(struct journal *j,
0eaac0b44fa93a Kent Overstreet 2024-04-23  1061  						u64 max_seq, bool *blocked)
09caeabe1a5daa Kent Overstreet 2023-11-02  1062  {
09caeabe1a5daa Kent Overstreet 2023-11-02  1063  	struct journal_buf *ret = NULL;
09caeabe1a5daa Kent Overstreet 2023-11-02  1064  
72e71bf0298c7e Kent Overstreet 2024-05-06  1065  	/* We're inside wait_event(), but using mutex_lock(: */
72e71bf0298c7e Kent Overstreet 2024-05-06  1066  	sched_annotate_sleep();
09caeabe1a5daa Kent Overstreet 2023-11-02  1067  	mutex_lock(&j->buf_lock);
09caeabe1a5daa Kent Overstreet 2023-11-02  1068  	spin_lock(&j->lock);
09caeabe1a5daa Kent Overstreet 2023-11-02  1069  	max_seq = min(max_seq, journal_cur_seq(j));
09caeabe1a5daa Kent Overstreet 2023-11-02  1070  
09caeabe1a5daa Kent Overstreet 2023-11-02  1071  	for (u64 seq = journal_last_unwritten_seq(j);
09caeabe1a5daa Kent Overstreet 2023-11-02  1072  	     seq <= max_seq;
09caeabe1a5daa Kent Overstreet 2023-11-02  1073  	     seq++) {
09caeabe1a5daa Kent Overstreet 2023-11-02  1074  		unsigned idx = seq & JOURNAL_BUF_MASK;
09caeabe1a5daa Kent Overstreet 2023-11-02  1075  		struct journal_buf *buf = j->buf + idx;
09caeabe1a5daa Kent Overstreet 2023-11-02  1076  
09caeabe1a5daa Kent Overstreet 2023-11-02  1077  		if (buf->need_flush_to_write_buffer) {
09caeabe1a5daa Kent Overstreet 2023-11-02  1078  			union journal_res_state s;
09caeabe1a5daa Kent Overstreet 2023-11-02  1079  			s.v = atomic64_read_acquire(&j->reservations.counter);
09caeabe1a5daa Kent Overstreet 2023-11-02  1080  
0eaac0b44fa93a Kent Overstreet 2024-04-23  1081  			unsigned open = seq == journal_cur_seq(j) && __journal_entry_is_open(s);
0eaac0b44fa93a Kent Overstreet 2024-04-23  1082  
0eaac0b44fa93a Kent Overstreet 2024-04-23  1083  			if (open && !*blocked) {
0eaac0b44fa93a Kent Overstreet 2024-04-23  1084  				__bch2_journal_block(j);
0eaac0b44fa93a Kent Overstreet 2024-04-23  1085  				*blocked = true;
0eaac0b44fa93a Kent Overstreet 2024-04-23  1086  			}
0eaac0b44fa93a Kent Overstreet 2024-04-23  1087  
898bda5b72a72a Kent Overstreet 2025-01-23  1088  			ret = journal_state_count(s, idx & JOURNAL_STATE_BUF_MASK) > open
09caeabe1a5daa Kent Overstreet 2023-11-02  1089  				? ERR_PTR(-EAGAIN)
                                                                                  ^^^^^^^^^^^^^^^^
ret is set to an error pointer.

09caeabe1a5daa Kent Overstreet 2023-11-02  1090  				: buf;
a911a076477d96 Kent Overstreet 2025-07-17 @1091  			if (!ret)
                                                                            ^^^^^
Impossible

a911a076477d96 Kent Overstreet 2025-07-17  1092  				smp_mb();
09caeabe1a5daa Kent Overstreet 2023-11-02  1093  			break;
09caeabe1a5daa Kent Overstreet 2023-11-02  1094  		}
09caeabe1a5daa Kent Overstreet 2023-11-02  1095  	}
09caeabe1a5daa Kent Overstreet 2023-11-02  1096  
09caeabe1a5daa Kent Overstreet 2023-11-02  1097  	spin_unlock(&j->lock);
09caeabe1a5daa Kent Overstreet 2023-11-02  1098  	if (IS_ERR_OR_NULL(ret))
09caeabe1a5daa Kent Overstreet 2023-11-02  1099  		mutex_unlock(&j->buf_lock);
09caeabe1a5daa Kent Overstreet 2023-11-02  1100  	return ret;
09caeabe1a5daa Kent Overstreet 2023-11-02  1101  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

