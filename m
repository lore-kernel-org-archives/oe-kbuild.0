Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D917747
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jun 2023 14:22:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f8fcaa31c7so65462855e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 21 Jun 2023 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687357360; x=1689949360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5FQ28UXLLS9quprYBX6Hgz3nuVVSc8qCU7+Q260LaE=;
        b=o+/DzAm33ZFGKO4oDnoZZtxgwib4RZXyw9EATQB3KSTyNaYiQfxoZG1iX6u9g/Vxa9
         A1iutDRj6P1M1juZwLwDDJ5dmCeJ2Pb5tegZGPezvazsLP+7lzuVh3tM/L0AjzUXlcX1
         /cOPSofGJcUiezUpvfi9kgPS858T1kk7vhFm+iFTmimsEjAUTMZAHDUPyErHFk9qyo5t
         0zeekHMHXWH0r6PbvTn37sbQx+552G/LPkRpguO7cw+e6Yomp6vMKHYN4G8zGypdkkAr
         8sih1RdVMyKgKX6NFiMoBN8OmTED7JY8UEhNzLQKpgoAyggAxorPTiXhbo87BytSGJMP
         uF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687357360; x=1689949360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5FQ28UXLLS9quprYBX6Hgz3nuVVSc8qCU7+Q260LaE=;
        b=c+V59IhrVklN20gtC1aqGLPMaFRbB6/gWfUrzDXpNO1cy4xeKz13hJ73xyexJ2dhnY
         VMSUYZuuuaX3k5U6/LigJCouXAe2p+i8qZMGctc3t2zRN0wUtJpdZbocUEZPHsB2vvFl
         zLJGEaJhzfyPhs3lQcakZ6PlyEHxZ+mPxnfqcgDXcvjJis82LdPB/UXVbnwF133G/13a
         t6bHldkANryfHRIWc0jvcnW/pHiTa/8ozfgnln+DLYEM6z/5UotG3bFhx/3hk79yET2P
         ajlnt23Go8ZIKOCyUNY4lOri+W4gR3SFMegou5si73kWPFWITlN9NdHR3wRCagbO4h+E
         Q92A==
X-Gm-Message-State: AC+VfDzvTIjd397EiFQL2aLjz4mslFePFeWlbIhSXh0Za0r5CvwHXpWH
	DQsC2pTnqZZaZDJlQJfep8xU3qvfegwn1yDw7X4=
X-Google-Smtp-Source: ACHHUZ4QJ9krB1XYfv5R5c2CltCqvwm514jibjifvAvi1qnREZBLgEhh5Cl2bHJz0BksjYkAJ7yg1A==
X-Received: by 2002:a05:600c:2255:b0:3f9:a6f3:8a55 with SMTP id a21-20020a05600c225500b003f9a6f38a55mr10035034wmm.37.1687357360178;
        Wed, 21 Jun 2023 07:22:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y7-20020a05600c364700b003f8fbe3bf7asm14483974wmq.32.2023.06.21.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 07:22:38 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:22:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 2/10] lib/asn1_encoder.c:345
 asn1_encode_integer_large_positive() error: we previously assumed 'integer'
 could be null (see line 331)
Message-ID: <2fce3745-4b58-4599-9beb-9132ba63edd0@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   a80fa5bd85f66ad910329bbe8bbb004f45b2bd68
commit: af175bd2d0ae71f1c4843947e7405ef8c5902ba1 [2/10] lib/asn1_encoder: Add a function to encode many byte integer values.
config: i386-randconfig-m021-20230620 (https://download.01.org/0day-ci/archive/20230621/202306212123.meq6uVfL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212123.meq6uVfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306212123.meq6uVfL-lkp@intel.com/

smatch warnings:
lib/asn1_encoder.c:345 asn1_encode_integer_large_positive() error: we previously assumed 'integer' could be null (see line 331)

vim +/integer +345 lib/asn1_encoder.c

af175bd2d0ae71 Jonathan Cameron 2022-09-06  318  unsigned char *
af175bd2d0ae71 Jonathan Cameron 2022-09-06  319  asn1_encode_integer_large_positive(unsigned char *data,
af175bd2d0ae71 Jonathan Cameron 2022-09-06  320  				   const unsigned char *end_data, u32 tag,
af175bd2d0ae71 Jonathan Cameron 2022-09-06  321  				   const unsigned char *integer, int len)
af175bd2d0ae71 Jonathan Cameron 2022-09-06  322  {
af175bd2d0ae71 Jonathan Cameron 2022-09-06  323  	int data_len = end_data - data;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  324  	unsigned char *d = &data[2];
af175bd2d0ae71 Jonathan Cameron 2022-09-06  325  	bool found = false;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  326  	int i;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  327  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  328  	if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
af175bd2d0ae71 Jonathan Cameron 2022-09-06  329  		return ERR_PTR(-EINVAL);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  330  
af175bd2d0ae71 Jonathan Cameron 2022-09-06 @331  	if (!integer && WARN(len > 127, "BUG: recode tag is too big (>127)"))

Let's assume !integer and len == 127

af175bd2d0ae71 Jonathan Cameron 2022-09-06  332  		return ERR_PTR(-EINVAL);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  333  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  334  	if (IS_ERR(data))
af175bd2d0ae71 Jonathan Cameron 2022-09-06  335  		return data;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  336  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  337  	if (data_len < 3)
af175bd2d0ae71 Jonathan Cameron 2022-09-06  338  		return ERR_PTR(-EINVAL);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  339  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  340  	data[0] = _tagn(UNIV, PRIM, tag);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  341  	/* Leave space for length */
af175bd2d0ae71 Jonathan Cameron 2022-09-06  342  	data_len -= 2;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  343  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  344  	for (i = 0; i < len; i++) {
af175bd2d0ae71 Jonathan Cameron 2022-09-06 @345  		int byte = integer[i];

Then it would lead to a crash here

af175bd2d0ae71 Jonathan Cameron 2022-09-06  346  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  347  		if (!found && byte == 0)
af175bd2d0ae71 Jonathan Cameron 2022-09-06  348  			continue;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  349  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  350  		/*
af175bd2d0ae71 Jonathan Cameron 2022-09-06  351  		 * as per encode_integer
af175bd2d0ae71 Jonathan Cameron 2022-09-06  352  		 */
af175bd2d0ae71 Jonathan Cameron 2022-09-06  353  		if (!found && (byte & 0x80)) {
af175bd2d0ae71 Jonathan Cameron 2022-09-06  354  			*d++ = 0;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  355  			data_len--;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  356  		}
af175bd2d0ae71 Jonathan Cameron 2022-09-06  357  		found = true;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  358  		if (data_len == 0)
af175bd2d0ae71 Jonathan Cameron 2022-09-06  359  			return ERR_PTR(-EINVAL);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  360  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  361  		*d++ = byte;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  362  		data_len--;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  363  	}
af175bd2d0ae71 Jonathan Cameron 2022-09-06  364  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  365  	data[1] = d - data - 2;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  366  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  367  	return d;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  368  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

