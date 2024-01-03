Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF11B270
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fIDHXCS9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-556ea884968so127899a12.3
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704294107; x=1704898907; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WEI0BbxFzSQSQxsy1ptWBnjaL7TttPuF7j0Y5q/vTXo=;
        b=fIDHXCS99tbXA1nNydlbKqRYnEFlhv2zx5ziUkDxFiDDVpE2Yi5SXLfDenyQuW9EsS
         4mDp5M68VTkUkuiU2hAp7pXCuSv2CA0EW1dEUK7ZesSqrXn4+wxn5kg72jF6rvpRKiu6
         +PxniGcBRHfcm28to+DaNQ30hgu/oeBNGXcQVPOAEbYKY6AlWtkgC8Ug0Y9+r0KytIkj
         jF4d+Hbrep73oUKIPWaxQbv7WS+XgLt3qcGTUHBs+LecVsea/y/zrB9pDyqPewmVbzFC
         fo+yTmRQBFkinVO/AYWvf0v3B9eoN9gxciVQAvJJrQaSzsp9Cl5kJcegmmOeyLV3bKw3
         qc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704294107; x=1704898907;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WEI0BbxFzSQSQxsy1ptWBnjaL7TttPuF7j0Y5q/vTXo=;
        b=U71iDIUQNMkDWNVMg3b5nS/y8ojgv6irS0Rz2/mUhSekLofH2GN9Ei/jYFArjMUCx+
         AwpNULFM7IIs4pqm2kdpNxwhNOyJS77Eq6QB0F6u8jQBHaz9eBIuvImkDzQpm9sG6WhS
         aOHOyDhGEUybKr+3y0M9Riin0eJwtemh7xORcEFkM8sslgRAVX7Euu/fwZAQI/OSHZGI
         jTlzlZrt4myjhi+RcE+KhXGbVpeyO7IMNCEAzCPY/UFruXXpwi9gd4wNpF8m9J+SvbsQ
         an7IWTEQ49/lpVER/EpDZ3nXaNeydXHKzESGQxeeyQlmwp5mzlIE41UVnoJujZLcdxXB
         H8lQ==
X-Gm-Message-State: AOJu0YxgVXi7GwmRzYEhT/mjndxayBLVViEe/VeQBVKqsWnunLgm/tLM
	M2QoUviOfd0/BFeS80x0ML0F/oyaNHdyMG2FtzwHzr54Pk8=
X-Google-Smtp-Source: AGHT+IEkwKDk3u8O3qgr0FFvu59EBKgEvpfCaNiDHiI3OLOzA9AGHdmXtWRC3ft+yRo3sPelsTerig==
X-Received: by 2002:a50:d01a:0:b0:556:b1ee:c844 with SMTP id j26-20020a50d01a000000b00556b1eec844mr286774edf.65.1704294107359;
        Wed, 03 Jan 2024 07:01:47 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id cf26-20020a0564020b9a00b00554af5ec62asm13635855edb.8.2024.01.03.07.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:01:47 -0800 (PST)
Date: Wed, 3 Jan 2024 18:01:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 7/21] crypto/krb5/rfc3961_simplified.c:127
 rfc3961_calc_H() warn: use 'gfp' here instead of GFP_KERNEL?
Message-ID: <0c5f40aa-f889-4e07-884d-a09aa12548c8@moroto.mountain>
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
commit: 214632aabe1103adbf7c0a3810c2afb9dcc09eee [7/21] crypto/krb5: Implement the Kerberos5 rfc3961 key derivation
config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231228/202312281032.f339mEEs-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312281032.f339mEEs-lkp@intel.com/

smatch warnings:
crypto/krb5/rfc3961_simplified.c:127 rfc3961_calc_H() warn: use 'gfp' here instead of GFP_KERNEL?

vim +/gfp +127 crypto/krb5/rfc3961_simplified.c

214632aabe1103 David Howells 2020-09-03  111  static int rfc3961_calc_H(const struct krb5_enctype *krb5,
214632aabe1103 David Howells 2020-09-03  112  			  const struct krb5_buffer *data,
214632aabe1103 David Howells 2020-09-03  113  			  struct krb5_buffer *digest,
214632aabe1103 David Howells 2020-09-03  114  			  gfp_t gfp)
214632aabe1103 David Howells 2020-09-03  115  {
214632aabe1103 David Howells 2020-09-03  116  	struct crypto_shash *tfm;
214632aabe1103 David Howells 2020-09-03  117  	struct shash_desc *desc;
214632aabe1103 David Howells 2020-09-03  118  	size_t desc_size;
214632aabe1103 David Howells 2020-09-03  119  	int ret = -ENOMEM;
214632aabe1103 David Howells 2020-09-03  120  
214632aabe1103 David Howells 2020-09-03  121  	tfm = crypto_alloc_shash(krb5->hash_name, 0, 0);
214632aabe1103 David Howells 2020-09-03  122  	if (IS_ERR(tfm))
214632aabe1103 David Howells 2020-09-03  123  		return (PTR_ERR(tfm) == -ENOENT) ? -ENOPKG : PTR_ERR(tfm);
214632aabe1103 David Howells 2020-09-03  124  
214632aabe1103 David Howells 2020-09-03  125  	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
214632aabe1103 David Howells 2020-09-03  126  
214632aabe1103 David Howells 2020-09-03 @127  	desc = kzalloc(desc_size, GFP_KERNEL);

s/GFP_KERNEL/gfp/

214632aabe1103 David Howells 2020-09-03  128  	if (!desc)
214632aabe1103 David Howells 2020-09-03  129  		goto error_tfm;
214632aabe1103 David Howells 2020-09-03  130  
214632aabe1103 David Howells 2020-09-03  131  	digest->len = crypto_shash_digestsize(tfm);
214632aabe1103 David Howells 2020-09-03  132  	digest->data = kzalloc(digest->len, gfp);
214632aabe1103 David Howells 2020-09-03  133  	if (!digest->data)
214632aabe1103 David Howells 2020-09-03  134  		goto error_desc;
214632aabe1103 David Howells 2020-09-03  135  
214632aabe1103 David Howells 2020-09-03  136  	desc->tfm = tfm;
214632aabe1103 David Howells 2020-09-03  137  	ret = crypto_shash_init(desc);
214632aabe1103 David Howells 2020-09-03  138  	if (ret < 0)
214632aabe1103 David Howells 2020-09-03  139  		goto error_digest;
214632aabe1103 David Howells 2020-09-03  140  
214632aabe1103 David Howells 2020-09-03  141  	ret = crypto_shash_finup(desc, data->data, data->len, digest->data);
214632aabe1103 David Howells 2020-09-03  142  	if (ret < 0)
214632aabe1103 David Howells 2020-09-03  143  		goto error_digest;
214632aabe1103 David Howells 2020-09-03  144  
214632aabe1103 David Howells 2020-09-03  145  	goto error_desc;
214632aabe1103 David Howells 2020-09-03  146  
214632aabe1103 David Howells 2020-09-03  147  error_digest:
214632aabe1103 David Howells 2020-09-03  148  	kfree_sensitive(digest->data);
214632aabe1103 David Howells 2020-09-03  149  error_desc:
214632aabe1103 David Howells 2020-09-03  150  	kfree_sensitive(desc);
214632aabe1103 David Howells 2020-09-03  151  error_tfm:
214632aabe1103 David Howells 2020-09-03  152  	crypto_free_shash(tfm);
214632aabe1103 David Howells 2020-09-03  153  	return ret;
214632aabe1103 David Howells 2020-09-03  154  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

