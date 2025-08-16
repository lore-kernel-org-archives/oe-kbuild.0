Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF7321B9FD
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755340349; cv=none; b=PDHyL7yPjBUvkf9k2AkPUeKieu1jxpLMBe0WwQMEHiwJG4BIZP1hss9aicU2Ic15ptX+pLfhtV0MrRxwGrWE0RWzcYEf7v1h/AaGpWnz2jFcWe4Ppc1wMKLenPVdm6Ok34DOx1trL/UIEJOZ9lIzol/KqREnyRNVkZlfvrgm0H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755340349; c=relaxed/simple;
	bh=Pft0D6mYn1gxE273jevOaCLhviwhjfDQQ8yjtwOCjbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YF4ejN3Nma0dGjydfMYXugCR/bcrNdI6llahp9rCyoFTS+A7zsfVSaf4cfohJkWOPLLRFb3q3JYsq0SDXOguA/XAL0PsBIAWkp/KcVeqKf6f2Nb9i53BAW4q68Tp3MyUUj6lVYqHAmrjorBnrqbTtuKA/EokX1tG2NP7HHJ052c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TyUSn3I4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TyUSn3I4"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9d41cd38dso1956819f8f.0
        for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755340345; x=1755945145; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6neuYc8gZEraymLFwxc1gK2y9cQvAvqgKFVYEp/43fw=;
        b=TyUSn3I4wAGsvUZDxdP/i8zMklEtHZ6K3vbcnbWykhU4FeNfIZCgTOlRppFbP0BhLk
         7rggUX4FwoZNRO/WXd2gQNpYiCq2IXRxZ3wXmT1Jf+o431QEEdeC2ObAcXRmyhKoghZc
         nRLb4+2YOpuWKyBb9gcQXCoUT9J2hBJIGFa+CvN9zMv8wjlNbHROxt0VynRDGVGFvHKu
         dFJXxvPaKzBpHz8Fw9K+7mo3EKo6lPpUT7ukYqCJX3V166OrGZIQFlqfklhLozZBBb0c
         H7ZVu4zDTVrBMePiL3+GAU1RateDcA2/UP+tkI1baUiXI4jP68ZqEEM+ZxkrjVYXeOdO
         vJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755340345; x=1755945145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6neuYc8gZEraymLFwxc1gK2y9cQvAvqgKFVYEp/43fw=;
        b=ffEQVv96EHC/1DkEPA0CMuhh8Ntcw/R5/rG+aH5IIPLmv38d8fscktqTjRY0VeIAZe
         7Kxz4YI4SU5BXTIM15e9dMiCSIQXYdJ2wuYkAXL0rwXVxwixtSlgRtiFGQzx/kmgYdyA
         Hoil6w0qGQ8L/iq+kP5GeHvNzkc/BkgYH8A29DM25IB7SLZOy5yzWMqudmOsRU84uxMK
         sBZAZyNq9Y/Zq/dNI4IewJKB3tIPQTy5P3AkM3ez3ttL/wjqKWuEhPhPu5WH4W1lM37R
         nzzIOE+wOoP7zayffAMRmKCCewSIJzt3mFP9obooKhXV0qws0rzsIlWCuE97V0a44x8f
         CZaA==
X-Gm-Message-State: AOJu0Yz6Us8X4vxztZ3uyNdKBGgLX6jW8OzucCNXpIOTT8C5oVNV0b75
	EqDGAroxSEKqzRh7b8dKUnRiM8aUf1jaTp+w4f+WTwE2NMiv6R7l9YQCJGLaEOJ6hH5dEfuooDS
	B+mml
X-Gm-Gg: ASbGnct7UsPhCLG+3vekFrs4QR1p+YD6Wa3zbF6kJ4Quf7ohUlLXcEo1jw/kmsaZiI0
	hlqXC4tSjbN7MBoO15wAxlTwL4o04hT+SZ5C0b9vKPRZJXEsvic22fETJ66Zff+bMY1+P8iXjr0
	NDnMD3LWPWVsvQ37dUxS415bjgYaG/4svbAfODc/mHwBH4rbj0Z6ZrKgv8PGRBom+nS0FQt1Shg
	fZBG5jVWz7X0OifwDZ0xXRJTMd6L2PSu+c4QDdXMF3vkwanhI01RuaDd3EzbabSeYoiOT9rCVl9
	oYcMXa+AVQivopIHG4bScmgPYfBn3vjCtaLbAv6LgnUMi+TtvXxKpfdvDktIt0yxnC1fX9n68lD
	Wxb0/REiFjhkgCRp8cMLGvViBoKQ=
X-Google-Smtp-Source: AGHT+IHAnFs9UneWAmPfL3Wz0z6TEUSaBJgX0v41HAMyqMGMLN60ShzpFjC9lI8eUnUV8SafBAymaQ==
X-Received: by 2002:a05:6000:2285:b0:3b8:f8e6:867b with SMTP id ffacd0b85a97d-3bb68545ebbmr4510434f8f.31.1755340345363;
        Sat, 16 Aug 2025 03:32:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb652f75aesm5243990f8f.23.2025.08.16.03.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:32:25 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:32:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 4/9] ovl: Create ovl_casefold() to support casefolded
 strncmp()
Message-ID: <202508161416.sbuLMXuI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814-tonyk-overlayfs-v5-4-c5b80a909cbd@igalia.com>
Message-ID: <20250816103221.EcBLQXhvcb6zFgTO1wpJTUdewfNMmVTqdTTrii3tYGM@z>

Hi André,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/fs-Create-sb_encoding-helper/20250815-013213
base:   0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
patch link:    https://lore.kernel.org/r/20250814-tonyk-overlayfs-v5-4-c5b80a909cbd%40igalia.com
patch subject: [PATCH v5 4/9] ovl: Create ovl_casefold() to support casefolded strncmp()
config: alpha-randconfig-r071-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161416.sbuLMXuI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508161416.sbuLMXuI-lkp@intel.com/

New smatch warnings:
fs/overlayfs/readdir.c:82 ovl_casefold() warn: variable dereferenced before check 'dst' (see line 80)

vim +/dst +82 fs/overlayfs/readdir.c

3f345b5617fb37 André Almeida  2025-08-14  72  static int ovl_casefold(struct unicode_map *map, const char *str, int len, char **dst)
3f345b5617fb37 André Almeida  2025-08-14  73  {
3f345b5617fb37 André Almeida  2025-08-14  74  	const struct qstr qstr = { .name = str, .len = len };
3f345b5617fb37 André Almeida  2025-08-14  75  	int cf_len;
3f345b5617fb37 André Almeida  2025-08-14  76  
3f345b5617fb37 André Almeida  2025-08-14  77  	if (!IS_ENABLED(CONFIG_UNICODE) || !map || is_dot_dotdot(str, len))
3f345b5617fb37 André Almeida  2025-08-14  78  		return 0;
3f345b5617fb37 André Almeida  2025-08-14  79  
3f345b5617fb37 André Almeida  2025-08-14 @80  	*dst = kmalloc(NAME_MAX, GFP_KERNEL);
3f345b5617fb37 André Almeida  2025-08-14  81  
3f345b5617fb37 André Almeida  2025-08-14 @82  	if (dst) {

s/dst/*dst/

3f345b5617fb37 André Almeida  2025-08-14  83  		cf_len = utf8_casefold(map, &qstr, *dst, NAME_MAX);
3f345b5617fb37 André Almeida  2025-08-14  84  
3f345b5617fb37 André Almeida  2025-08-14  85  		if (cf_len > 0)
3f345b5617fb37 André Almeida  2025-08-14  86  			return cf_len;
3f345b5617fb37 André Almeida  2025-08-14  87  	}
3f345b5617fb37 André Almeida  2025-08-14  88  
3f345b5617fb37 André Almeida  2025-08-14  89  	kfree(*dst);
3f345b5617fb37 André Almeida  2025-08-14  90  	return 0;
3f345b5617fb37 André Almeida  2025-08-14  91  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

