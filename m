Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411E37EA;
	Wed,  4 Jan 2023 08:41:16 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id s9so202402wru.13;
        Wed, 04 Jan 2023 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3kht5c7R/bDxLs1R15CaC2JjXppkUaxhQMa2gSrLEU=;
        b=Tpz+t7ijJg7+fiiaw32iSRGydIDOFitpNOCJRygJrOSpKzrIGvXvo4NswFjubsu9WB
         4Bw6wa0cGQueOi3kje+UI+irqHJGmlvOm7aEjlHAG1VWsZHl1619f1S68LFbbAja54v2
         dUquW5wJ1x8SUvFKbYBxWQfUju+LJVrithHLbfaqc9rEa1NWM17SWrwa/ks8kcs0O5fM
         wyePpCHYBVPBoffayLQ8mfkAJ0cuSuV/mhm9+UIoEGzxYXYVMEihP0GXtkNZWLNC6ndJ
         ljgdgW6KoA25rFCqHilzAU2fQxUxIf7zTijRfgtZ71RRhFKeRhFcG1Noq70mlwXAun37
         BOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3kht5c7R/bDxLs1R15CaC2JjXppkUaxhQMa2gSrLEU=;
        b=v1NTniB0DHfZpgF6q+1UsYKs5ZAfUdAUaHdnh6mYgrW/5zwVHcEPZ5ICVJZKUHXJ/k
         tdhtL36uCuQEqyJ04DWxIt4Rv4sEui5SIM+vOz8R2nUjHRBJu2HrLMlE0KmVfVlB87YD
         gU91jeMGTSv+/+resFkWPkzKhmr7OzgvdEjKTQK+Xm/aS2xIgPle+Iv0o33xywzWJKJ3
         TwQEiplWcB+0wcEHjOSelpqxfDG62dkGB0NkxXwi0ZsKKwvVgFUuYyTY6Y1L7xR9HQ5i
         9E+9TwiasAqNiQKhV0P+rJa/k0W7PJaF/RVR1zHPTK0PfaLyZUdnsNREIDe2j5nNzVnq
         szxw==
X-Gm-Message-State: AFqh2krWabtxjF6VKiCJ2LmLlzlxrvkZsl2M7AWlLa3wGS+ctvVqogEQ
	CaKXt2r5iF8MyCddECWDMxZPqNBxsQ0OnAp9
X-Google-Smtp-Source: AMrXdXt1cEjP/FWe9Sz6sTlBB/HCmNmtLt4vNsWm09kHJJVJSB+QiAMz+0gUvYMNgPQIRXKy3DLtMw==
X-Received: by 2002:adf:e383:0:b0:267:b8df:932b with SMTP id e3-20020adfe383000000b00267b8df932bmr36865489wrm.23.1672821674211;
        Wed, 04 Jan 2023 00:41:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w17-20020a5d5451000000b0023662d97130sm33512251wrv.20.2023.01.04.00.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 00:41:13 -0800 (PST)
Date: Wed, 4 Jan 2023 11:41:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/17] fscrypt: add creation/usage/freeing of
 per-extent infos
Message-ID: <202301032351.WJOSX4jj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e1c2b101025a3388a6b31a8bdfb2b1cf59bf97c.1672547582.git.sweettea-kernel@dorminy.me>
Message-ID: <20230104084111.7RiKBmDkQRedGe-i6GA30kfS7mzOCV-lfiUF5cV0Y6w@z>

Hi Sweet,

url:    https://github.com/intel-lab-lkp/linux/commits/Sweet-Tea-Dorminy/fscrypt-factor-accessing-inode-i_crypt_info/20230101-130927
base:   b7af0635c87ff78d6bd523298ab7471f9ffd3ce5
patch link:    https://lore.kernel.org/r/9e1c2b101025a3388a6b31a8bdfb2b1cf59bf97c.1672547582.git.sweettea-kernel%40dorminy.me
patch subject: [RFC PATCH 14/17] fscrypt: add creation/usage/freeing of per-extent infos
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/crypto/crypto.c:121 fscrypt_crypt_block() warn: variable dereferenced before check 'ci' (see line 114)

vim +/ci +121 fs/crypto/crypto.c

f47fcbb2b578bd Eric Biggers       2019-05-20  102  int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
58ae74683ae2c0 Richard Weinberger 2016-12-19  103  			u64 lblk_num, struct page *src_page,
58ae74683ae2c0 Richard Weinberger 2016-12-19  104  			struct page *dest_page, unsigned int len,
58ae74683ae2c0 Richard Weinberger 2016-12-19  105  			unsigned int offs, gfp_t gfp_flags)
0b81d077907269 Jaegeuk Kim        2015-05-15  106  {
8094c3ceb21ad9 Eric Biggers       2019-01-06  107  	union fscrypt_iv iv;
d407574e794821 Linus Torvalds     2016-03-21  108  	struct skcipher_request *req = NULL;
d0082e1a7c8dfe Gilad Ben-Yossef   2017-10-18  109  	DECLARE_CRYPTO_WAIT(wait);
0b81d077907269 Jaegeuk Kim        2015-05-15  110  	struct scatterlist dst, src;
e87879ea12c3b6 Sweet Tea Dorminy  2023-01-01  111  	u64 ci_offset = 0;
e87879ea12c3b6 Sweet Tea Dorminy  2023-01-01  112  	struct fscrypt_info *ci = fscrypt_get_lblk_info(inode, lblk_num,
e87879ea12c3b6 Sweet Tea Dorminy  2023-01-01  113  						        &ci_offset, NULL);
5fee36095cda45 Satya Tangirala    2020-07-02 @114  	struct crypto_skcipher *tfm = ci->ci_enc_key.tfm;
                                                                                      ^^^^
Dereference.

0b81d077907269 Jaegeuk Kim        2015-05-15  115  	int res = 0;
0b81d077907269 Jaegeuk Kim        2015-05-15  116  
eeacfdc68a1049 Eric Biggers       2019-05-20  117  	if (WARN_ON_ONCE(len <= 0))
eeacfdc68a1049 Eric Biggers       2019-05-20  118  		return -EINVAL;
63cec1389e116a Eric Biggers       2022-04-04  119  	if (WARN_ON_ONCE(len % FSCRYPT_CONTENTS_ALIGNMENT != 0))
eeacfdc68a1049 Eric Biggers       2019-05-20  120  		return -EINVAL;
938fa42307b18b Sweet Tea Dorminy  2023-01-01 @121  	if (!ci) {
                                                            ^^^
Checked too late.

938fa42307b18b Sweet Tea Dorminy  2023-01-01  122  		fscrypt_err(inode,
938fa42307b18b Sweet Tea Dorminy  2023-01-01  123  			    "Error %d getting extent info for block %llu",
938fa42307b18b Sweet Tea Dorminy  2023-01-01  124  			    res, lblk_num);
938fa42307b18b Sweet Tea Dorminy  2023-01-01  125  		return -EINVAL;
938fa42307b18b Sweet Tea Dorminy  2023-01-01  126  	}
1400451f04f2ff David Gstir        2016-12-06  127  
e87879ea12c3b6 Sweet Tea Dorminy  2023-01-01  128  	fscrypt_generate_iv(&iv, ci_offset, ci);
b7e7cf7a66a27e Daniel Walter      2017-06-19  129  
b32e4482aadfd1 Jaegeuk Kim        2016-04-11  130  	req = skcipher_request_alloc(tfm, gfp_flags);
c90fd775624791 Eric Biggers       2018-04-30  131  	if (!req)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

