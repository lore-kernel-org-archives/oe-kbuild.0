Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EDD1A718
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nHdLOQqm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2345aaeb05so1094513566b.0
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704294061; x=1704898861; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGjgMb+A+P+cYKpGgkK1co5ulQJkcrThHtUGUkqnxS0=;
        b=nHdLOQqmtAvGHFrvwZWbo9SAS3WvBafFBosbYwCV7ZPlTbiFSfPaCMqdrbWlR1qhO5
         7gqTVaWz/1VssCaEMsC7XXzFs/myExV4sk43jNIAixyJShCsDbTaFdHAyYTxXETqnTQ+
         dcTXhmx/bjGHzp+eKIE+rkEIAbsQXT3EbuNJz/dY/+DqPDkS/O65uy6+hl0s4UWAdyRv
         aJq2xDtCkXx3d/8aBLLkCqN16VyvTrNpNXMRLz7HJKBc6/czv89Itu7pzlfJpkCv5tV7
         Gb4pKuFMPRx5rlmuNv2tQxxxgjMjQGaKBMxJ/SLDSK0wynS815U7i8LKh0+Fx9tbJb8u
         lg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704294061; x=1704898861;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGjgMb+A+P+cYKpGgkK1co5ulQJkcrThHtUGUkqnxS0=;
        b=dzXd1mRAN+lVI3+BSk8ECpdjtbeteamUmpPgubBp1jN/tpFTfTLvU7JM9xz518qjyc
         Q/MmeBVYv9NgaEAgua8GSVyppOEnglRCJ6MWNuqZlHC/IGn/Kz8WPfaVxmRd9R/5kh50
         DMxObnGIDk76t7MYfqhyvG7ILLxkOYNV4DDrFIfAIh6qqJHCNatvk9eE2FOZsPXjtdch
         dHh0B5cLuGrHt5qOVZ8+S/zkovXjMtYnv4/AUU56qJ9Nn04sbZ1mHvOuio1wcZ9iq4He
         lUQm8Fsi3yeZsSkgPHyhgLqHjQYJD42TamiEHKPum0Vw/drLcTTvk5OX7Uc0zTjz9fJK
         9ePw==
X-Gm-Message-State: AOJu0YyQgdOeuWTdZLIAyMISaby4sR7BZHpItgoFgwyTebOx5AGGPoLs
	zMwV/69tOZBUBOcwhT13Y42Y72vS3WYYOcMla9dgYRj0TSA=
X-Google-Smtp-Source: AGHT+IExSQIGvVguxTUhSDoKkkAWegBcyNsK3dL11qb8yWF0m+CU2FgHvzEa70AfBmObZAqMUh3xCg==
X-Received: by 2002:a17:907:3e9e:b0:a23:6282:528d with SMTP id hs30-20020a1709073e9e00b00a236282528dmr9822600ejc.43.1704294061320;
        Wed, 03 Jan 2024 07:01:01 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id y2-20020a1709063da200b00a26e4986df8sm9678971ejh.58.2024.01.03.07.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:01:01 -0800 (PST)
Date: Wed, 3 Jan 2024 18:00:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 6/21] crypto/krb5/kdf.c:116
 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
Message-ID: <279d5e84-02b1-45cb-9b0b-17a800723019@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ebd44e15422341724b06a3a13590ea80244ebbd6
commit: b468b20c76d24a3eee1e29352769251daae938f9 [6/21] crypto/krb5: Provide infrastructure and key derivation
config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231228/202312280208.kXOfvCcb-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312280208.kXOfvCcb-lkp@intel.com/

smatch warnings:
crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
crypto/krb5/kdf.c:161 crypto_krb5_get_Ke() error: buffer overflow 'buf' 4 <= 4
crypto/krb5/kdf.c:206 crypto_krb5_get_Ki() error: buffer overflow 'buf' 4 <= 4

vim +/buf +116 crypto/krb5/kdf.c

b468b20c76d24a David Howells 2020-09-03  103  int crypto_krb5_get_Kc(const struct krb5_enctype *krb5,
b468b20c76d24a David Howells 2020-09-03  104  		       const struct krb5_buffer *TK,
b468b20c76d24a David Howells 2020-09-03  105  		       u32 usage,
b468b20c76d24a David Howells 2020-09-03  106  		       struct krb5_buffer *key,
b468b20c76d24a David Howells 2020-09-03  107  		       struct crypto_shash **_shash,
b468b20c76d24a David Howells 2020-09-03  108  		       gfp_t gfp)
b468b20c76d24a David Howells 2020-09-03  109  {
b468b20c76d24a David Howells 2020-09-03  110  	struct crypto_shash *shash;
b468b20c76d24a David Howells 2020-09-03  111  	int ret;
b468b20c76d24a David Howells 2020-09-03  112  	u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
b468b20c76d24a David Howells 2020-09-03  113  	struct krb5_buffer usage_constant = { .len = 5, .data = buf };
b468b20c76d24a David Howells 2020-09-03  114  
b468b20c76d24a David Howells 2020-09-03  115  	*(__be32 *)buf = cpu_to_be32(usage);
b468b20c76d24a David Howells 2020-09-03 @116  	buf[4] = KEY_USAGE_SEED_CHECKSUM;

There must be a power PC config where CRYPTO_MINALIGN is 4.

b468b20c76d24a David Howells 2020-09-03  117  
b468b20c76d24a David Howells 2020-09-03  118  	key->len = krb5->Kc_len;
b468b20c76d24a David Howells 2020-09-03  119  	ret = krb5->profile->calc_Kc(krb5, TK, &usage_constant, key, gfp);
b468b20c76d24a David Howells 2020-09-03  120  	if (ret < 0)
b468b20c76d24a David Howells 2020-09-03  121  		return ret;
b468b20c76d24a David Howells 2020-09-03  122  
b468b20c76d24a David Howells 2020-09-03  123  	if (_shash) {
b468b20c76d24a David Howells 2020-09-03  124  		shash = crypto_alloc_shash(krb5->cksum_name, 0, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

