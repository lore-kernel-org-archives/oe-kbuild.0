Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053F322F151
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 19:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741635074; cv=none; b=EfPo2lP8tVl8MgiFJ+tH5pLx8NVdWxfwprmRSoxfId9LcrBDXTOQTxi/MeD/Ptc24w6BxXv+cUOmgEvChQExx/ifVvwDmijeO7kdDrM8f9Ht6CMxJr1+IOtWqoVqDRgGR0f9P2M7IG3d+495O26hTnAZG2gYgXAX7hk6B/UtTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741635074; c=relaxed/simple;
	bh=v+b/kzEodLCVvkZx2b6X8TmLaTIIRtwT31F+hHamOgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=m2OGmdkk/ynX4PcA4ax0ImEmlfLcgbXsLY9IRFGQywb2mdDtpLKELXGQEy7nn7Jn/UbCDp8V5R1QrMtD2yhqoEZSLz4X68yFq+MRFxh1WRUqi6lI+QFPnMo84bX981ZGzijwPqlLKV7E2GEKDioZ0p7Li26ya+OSuaza00hgI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcXJYDbP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcXJYDbP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so6768535e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741635071; x=1742239871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FMNf5pDA6wndQOsjZsgjA/SqjQu85AYtNnsbK/6BwAU=;
        b=pcXJYDbPgzm9vR++rCq8s8u+GRaMsOZedgN8lNebGbirMXsy22Y/mQbElpzVkHwO1y
         qjNfOuLYbqsWuZiVapY5fJq+JmHB659w9ZfumgeSg59yiRhim+1he7UjAUeZZ6R1Dk0F
         qMY5enrFh2oYMLA2nhoSZcBL632EZena2W+HxxXp34BrJySiSJUoJNnWHCMC7HQiRRg9
         3mPZ89y0MshBt7ujm1T4TnwobgPelViLThG35pJtOqaX04fBkNm2v17rCmxhY+R+pk97
         dJUvwBdefKCa38TW2bMK40QEhniVRR0W6H0WB/rOKs60Jt5Ge7IrbML/gDsQkBfLHx2v
         3kYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741635071; x=1742239871;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMNf5pDA6wndQOsjZsgjA/SqjQu85AYtNnsbK/6BwAU=;
        b=skRA/w8MuvB89wN3PiXMbDfP0k22ijKJ0O+/ZmIW+0iR3eH9vxq8eF+BBvq329902p
         HiNaCoHtFceIQMFWUBx+NQvz9kP2Wt/54Rtf6As4/FmaYl0iK59PGXWUTHxD2UOcXKZ7
         LpzzGsu4QzjPbsaweNL9GgOXSprLOyh7Wwp5tJT8Zq40psbtXUsjlUUb5qLAedPDlNSa
         q+VenDRomySz7RuOOigYmSoJ81xZ1yWy3N+ezTrFECluxf/GjKjOHiNAgdM8HOLrT/Wj
         YQCA85kXiRVf4QhVTEHm+IELYEVWkPUlcy6j9+ElfnKlEZgwl3wIzVnlDQW44fW++ZrU
         07Ug==
X-Gm-Message-State: AOJu0Yxl5LK1pn85yMC4rNzM0BddQKTSA7lgIxLjf53FHX52G53rPYW3
	gn7XWWgtzrKGVRBrCsH0KeaABULsGyK4z4MxKs0h8Q4kK1RcV5GnCmlpOJI1H2CoiaYzaPsSA34
	O
X-Gm-Gg: ASbGncutXVuUI9YM7EV2qE71WTBNPVdIUOmOBVdaP/4Mski3QUPlk0ZXI1pU9JgdVwl
	CRZeCz267Z+FG42YNV+SDsJUkej0DDZxyAnMhBoiNPNViRw+LTGDj7QVxlhvLa6tKgaJRILmNbV
	CFp7TNmYIHxYp70DZKYp9Oh1c0O9E+kySPGMC+9NH66pqMDeCDEFjhPhxWBRLXbVr8VNKgcCHLG
	zkbUIY179Se+vRRyR+g/FOm9UHOPEcfW53/sIAj4BVZqt5dEl33JStfPw8XognarPmXGb3AhIQf
	/3DmNe3iHwRRWtr0Qvca7qYiJ1FeO5UiYg2RsF+DUNOYBgHjXg==
X-Google-Smtp-Source: AGHT+IEDcYCxs5mJAYlFaRGvShPNEs8pMoKoXux3iFgrh12kYqXw0trLLD+c5oeL3en7Z2PLwfzJvQ==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43cf5139ae7mr52691985e9.13.1741635070877;
        Mon, 10 Mar 2025 12:31:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ce48165c0sm100711905e9.26.2025.03.10.12.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 12:31:10 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:31:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Kanchana P Sridhar <kanchana.p.sridhar@intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [v3 PATCH 7/8] crypto: scomp - Remove support for most
 non-trivial destination SG lists
Message-ID: <914f6ea6-bb6c-4feb-a4ac-23508a8ff335@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <205f05023b5ff0d8cf7deb6e0a5fbb4643f02e00.1741488107.git.herbert@gondor.apana.org.au>

Hi Herbert,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-api-Add-cra_type-destroy-hook/20250309-104526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/205f05023b5ff0d8cf7deb6e0a5fbb4643f02e00.1741488107.git.herbert%40gondor.apana.org.au
patch subject: [v3 PATCH 7/8] crypto: scomp - Remove support for most non-trivial destination SG lists
config: um-randconfig-r072-20250310 (https://download.01.org/0day-ci/archive/20250311/202503110237.GjZvyi0K-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503110237.GjZvyi0K-lkp@intel.com/

New smatch warnings:
crypto/scompress.c:180 scomp_acomp_comp_decomp() error: we previously assumed 'req->dst' could be null (see line 174)

vim +180 crypto/scompress.c

1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  159  static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  160  {
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  161  	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
5b855462cc7e3f3 Herbert Xu                2025-03-09  162  	struct crypto_scomp **tfm_ctx = acomp_tfm_ctx(tfm);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  163  	struct crypto_scomp *scomp = *tfm_ctx;
e77b9947333baa6 Herbert Xu                2025-03-09  164  	struct crypto_acomp_stream *stream;
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  165  	struct scomp_scratch *scratch;
5b855462cc7e3f3 Herbert Xu                2025-03-09  166  	unsigned int slen = req->slen;
5b855462cc7e3f3 Herbert Xu                2025-03-09  167  	unsigned int dlen = req->dlen;
77292bb8ca69c80 Barry Song                2024-03-02  168  	void *src, *dst;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  169  	int ret;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  170  
5b855462cc7e3f3 Herbert Xu                2025-03-09  171  	if (!req->src || !slen)
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  172  		return -EINVAL;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  173  
5b855462cc7e3f3 Herbert Xu                2025-03-09 @174  	if (req->dst && !dlen)
                                                                    ^^^^^^^^
Is this check necessary?

71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  175  		return -EINVAL;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  176  
5b855462cc7e3f3 Herbert Xu                2025-03-09  177  	if (sg_nents(req->dst) > 1)
5b855462cc7e3f3 Herbert Xu                2025-03-09  178  		return -ENOSYS;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  179  
5b855462cc7e3f3 Herbert Xu                2025-03-09 @180  	if (req->dst->offset >= PAGE_SIZE)
                                                                    ^^^^^^^^^^
Unchecked dereference

5b855462cc7e3f3 Herbert Xu                2025-03-09  181  		return -ENOSYS;
744e1885922a994 Chengming Zhou            2023-12-27  182  
5b855462cc7e3f3 Herbert Xu                2025-03-09  183  	if (req->dst->offset + dlen > PAGE_SIZE)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

