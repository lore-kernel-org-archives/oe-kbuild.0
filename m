Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925AD7EA;
	Wed,  4 Jan 2023 08:42:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so23469163wms.0;
        Wed, 04 Jan 2023 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/48lafnV9HeJLQ7bPAsF46WEFJD6qSHxMOTR8fYSa8=;
        b=icSnQ+be+Cq6qP/j6gKgeDC5It5EfCTKbg8pgFAyylivQ8JKC1lV9D2LjWzVWM+3RK
         0/htWKbSeG189Nx8m7Yb9JmUO4JFfZa+XJhVGWgY58uo1022a5xqL43aXS6FzP2ZwlBJ
         YA5Da2zs64rKAllcZb1B/G8yrGdde9uob6ClIL54fRi2t0qd3DpxfLGjgjomKApsCcxM
         dAUNdpQjXZaVN5cygXttSkuBTsw+AbSB9D0Am4MncRblphJ96wdbdxrWt/S22WlR51VI
         KIE1pfGLJ7poa9oy49CbjrHG4kMNjNKIlRiYGrX3WMA6JJGKz4RlQr7Ss8Knq/U9sPiM
         MMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/48lafnV9HeJLQ7bPAsF46WEFJD6qSHxMOTR8fYSa8=;
        b=iKfx7Hg3wLaWlOf4k2cx6gXsTyAkgwh8ZesQSoJv3mdug5XntoqHfvrdQZuDHpArJ7
         c2/ByAhzfcQAzo6v8EBN7Zx3pW6xYuqX5u4Hj5bPkPD1+wKs2qsovLWIFcvWyl18hZ/L
         JrqLpu4cr1iiseMfl4mfVa0pPOz+Qn4twBhiiQU2roP6q1G1UZOkRyDPkQTtFNX/cmFu
         s0q3ameYeKj7eOPXA81TkCvR2F6Bdb1tL0YXVojGy0u1+ctyM9E4CbF+GkJc1q4X0YQe
         /TG0NQSEAEhZrmIZn2bF2IgLisqBqAY1nyzD7Nvbo1mxoycbGykQEQzstcpSjwJA50mg
         RedA==
X-Gm-Message-State: AFqh2koGxQTVorI5OTauVU7psLnHvvUSihqTZumLoJVmBNTOF7MwTEVt
	jOL30pKYhh+aKRSZgRXOUEz7zCrA5Q4JSEcv
X-Google-Smtp-Source: AMrXdXu0ljqWZeLy6Jijoifo0chmGa0llWM40kPZr5F0J4vMwVqd7JsUoeqpUQ56FFvakotNZUIqSA==
X-Received: by 2002:a7b:c7d6:0:b0:3d1:ee3a:62ae with SMTP id z22-20020a7bc7d6000000b003d1ee3a62aemr36153826wmk.8.1672821775588;
        Wed, 04 Jan 2023 00:42:55 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bca41000000b003d1de805de5sm44303503wml.16.2023.01.04.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 00:42:55 -0800 (PST)
Date: Wed, 4 Jan 2023 11:42:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 15/17] fscrypt: allow load/save of extent contexts
Message-ID: <202301040059.T57a5m3x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd5c7a78de125737abe447370fe37f9fe90155d6.1672547582.git.sweettea-kernel@dorminy.me>
Message-ID: <20230104084207.TH3Pcdj0thEHkOVya_9dD-rJqBejmXW6kQ1zZOt7GbQ@z>

Hi Sweet,

url:    https://github.com/intel-lab-lkp/linux/commits/Sweet-Tea-Dorminy/fscrypt-factor-accessing-inode-i_crypt_info/20230101-130927
base:   b7af0635c87ff78d6bd523298ab7471f9ffd3ce5
patch link:    https://lore.kernel.org/r/fd5c7a78de125737abe447370fe37f9fe90155d6.1672547582.git.sweettea-kernel%40dorminy.me
patch subject: [RFC PATCH 15/17] fscrypt: allow load/save of extent contexts
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
fs/crypto/keysetup.c:829 fscrypt_load_extent_info() error: uninitialized symbol 'res'.

vim +/res +829 fs/crypto/keysetup.c

90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  817  int fscrypt_load_extent_info(struct inode *inode, void *buf, size_t len,
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  818  			     struct fscrypt_info **info_ptr)
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  819  {
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  820  	int res;
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  821  	union fscrypt_context ctx;
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  822  	union fscrypt_policy policy;
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  823  
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  824  	if (!fscrypt_has_encryption_key(inode))
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  825  		return -EINVAL;
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  826  
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  827  	memcpy(&ctx, buf, len);
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  828  
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01 @829  	res = fscrypt_policy_from_context(&policy, &ctx, res);
                                                                                                         ^^^
"res" isn't intialized.

90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  830  	if (res) {
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  831  		fscrypt_warn(inode,
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  832  			     "Unrecognized or corrupt encryption context");
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  833  		return res;
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  834  	}
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  835  
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  836  	if (!fscrypt_supported_policy(&policy, inode)) {
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  837  		return -EINVAL;
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  838  	}
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  839  
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  840  	res = fscrypt_setup_encryption_info(inode, &policy,
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  841  					    fscrypt_context_nonce(&ctx),
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  842  					    IS_CASEFOLDED(inode) &&
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  843  					    S_ISDIR(inode->i_mode),
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  844  					    info_ptr);
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  845  
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  846  	if (res == -ENOPKG) /* Algorithm unavailable? */
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  847  		res = 0;
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  848  	return res;
90c90d06cafd64 Sweet Tea Dorminy 2023-01-01  849  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

