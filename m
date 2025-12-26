Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F0B74BE1
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766754983; cv=none; b=XTCJeLbS1EydxsPVU6etGg/9msF/UtxVk6ZMX09AdPircDDBmgUD5xl74oG8UTVXKLpwpgg1edBJim3NfNxy2EtXFdPIsU9/jStDO8KWfmNxI3PX2FaHZgd2XDJnMBbQVVfLRlCVP1AswXHygQr002Kbmt9y57x6cJavxcY1K68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766754983; c=relaxed/simple;
	bh=ePCLF0+U5PH0D1QwLM/NEWsufMqlHD+8llI+LAu09Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SYbWVckoduG5mwEaP6ca85HtWMF/fabLWestsRgqsyJqREQ44/QSfaSqUNP1MovAdLXVOn9DnBvHLCoZWygI22adPJIlCxEjrJKUyAWluqQYXrUmmM6gUF+HtLxIzhb5Tv0cVTgYKIYk9iD97swCbBKQdtXkjyHY8D0+tQMKWrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fw93ln20; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fw93ln20"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso73691205e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 05:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766754980; x=1767359780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mLYTmA/S5B7NWsO5yTK7ps7c43RbU+FEL5oxBwqrhhI=;
        b=fw93ln20tqY6E+uj202/h3vA+V41RJW9D2SFbB3Jx4kddtYp5sTo8VMQTO1nKRLWCg
         xR9WFiWCMrCRvLWJWcPJkoZlTTiS80mAE7zfN9jzHLdFv3UCi4VoLfuStMuYqK2eJaiX
         v2obl0BXG/ZdHQOZ1LyZegzPdLsryRTxhi0L2UDF9r3QP81zlZEtad7esdrFWHHY1alP
         jK5cQ9w0aUtK0agY2SH+1YIiwFNRElKSjp4n6SYe5ZxN/uR8rQP+VMdlszHadpBrK/Tt
         AtnQY9476tHmee8pU9NaILHceXVmeZpTZ2hRwTe4Y2STDLGmg5X6TG/g2adK9mIoGGr2
         BTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766754980; x=1767359780;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLYTmA/S5B7NWsO5yTK7ps7c43RbU+FEL5oxBwqrhhI=;
        b=cmyx3ZsL6YFbmgTYFtQDSdOkpCfXJoaP9fGUuY8D6cOKbI1/hy3qe87Sk+n/Ne1LKW
         tq2k2TMbwIwGfBZQ5deODPrcVwx1EY6Jvv7R9dk9xEj/BjWQM3IoUIhfE6g5/oOZBcj5
         /NZ/+fdug2BW616FZB86VBy6xJyG7fAiWpZPMdxBi0Pw7e7gY0EZpREl4elA1gp6bwm7
         IdTO6hLkayi5/BuDs6JffPkywdfUYXKqAy9TBkXCcFkUchZUGtUwft33lHp+b8K9nV/B
         nvGGdphaIiaUZoZcauCiBLy0+szga0Qp+PrmHLLjWQVB0rr8L9jYYgjilecT40KK0eJv
         w7Fw==
X-Gm-Message-State: AOJu0Yy2O/maflnSTY2UbwIQjh7c1rTWuq7/N95arLmFtfK/SSiQHO4w
	bSgsSa7rjq4dbVPxVM9d4pyGFITyNGssVSHxFB4T8dXFxg2IW37iZONG550xG8/zuFO/jh07vrZ
	wF2qD
X-Gm-Gg: AY/fxX5iHJyL4Tyi4LP+twnraVm+KHgukSR0MkYUlRQxty2nq0JF8drszphQ7NzyQws
	0ZoevUPP3/xFp25a/ioxekeMFXkeABupasRoYdego553t5YMVgprmVbmwHWeLzxj7PFJBex8ZPg
	vCP2ldYfJhOJSSO8JZVqwOl3A8vko4bD5MQlavW+3EAItoiKygsLIwmG60yEkoWcQ76pKTmJMR3
	NloZ191d0jGCB62JbjNCpUOIrMwmBFeg7cjdQQ0Qq1STpRyALM7F0pmOJBhVfP7T9R4VH7lHS/J
	LemFD3dMwMcgpFV55wVe6dnACgb9nDsIPDHWdv4cBeyDFR1yw7p/Xg1egFNGaBo52rQlzGayVSD
	KBmsLAZlesHC5vfmkY5dBh2R8wLBc2K59dIZmCOMOFtgkMeYNepZ/h+G/nJemdbjp8xUibtbNeu
	vlML3L5vfp7rM6KMef
X-Google-Smtp-Source: AGHT+IG6KOaHc002Jau962JclhyU3PaiLFwCfbbj62iM16sFpVmrkcOuMMki81OpWlQKkh03OthYlg==
X-Received: by 2002:a05:600c:8b8c:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47d195aaf01mr226341035e9.35.1766754979895;
        Fri, 26 Dec 2025 05:16:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be396c909sm172227245e9.0.2025.12.26.05.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:16:19 -0800 (PST)
Date: Fri, 26 Dec 2025 16:16:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Horst Birthelmer <hbirthelmer@googlemail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/2] fuse: add compound command to combine
 multiple requests
Message-ID: <202512251445.2TjxtZmH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-fuse-compounds-upstream-v2-1-0f7b4451c85e@ddn.com>
Message-ID: <20251226131616.myK_Lb34fw6o6wiSWuDzUgE-g4Ol3bbNLiOhUdMcvT4@z>

Hi Horst,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Horst-Birthelmer/fuse-add-compound-command-to-combine-multiple-requests/20251224-061921
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251223-fuse-compounds-upstream-v2-1-0f7b4451c85e%40ddn.com
patch subject: [PATCH RFC v2 1/2] fuse: add compound command to combine multiple requests
config: hexagon-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251445.2TjxtZmH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512251445.2TjxtZmH-lkp@intel.com/

smatch warnings:
fs/fuse/compound.c:79 fuse_compound_validate_header() warn: variable dereferenced before check 'compound' (see line 76)

vim +/compound +79 fs/fuse/compound.c

17b8291f4d636a9 Horst Birthelmer 2025-12-23   70  static int fuse_compound_validate_header(struct fuse_compound_req *compound)
17b8291f4d636a9 Horst Birthelmer 2025-12-23   71  {
17b8291f4d636a9 Horst Birthelmer 2025-12-23   72  	struct fuse_compound_in *in_header = &compound->compound_header;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   73  	size_t offset = 0;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   74  	int i;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   75  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  @76  	if (compound->buffer_pos > compound->buffer_size)
                                                            ^^^^^^^^^^             ^^^^^^^^^^
Dereferenced

17b8291f4d636a9 Horst Birthelmer 2025-12-23   77  		return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   78  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  @79  	if (!compound || !compound->buffer)
                                                            ^^^^^^^^^
And then checked for NULL.

17b8291f4d636a9 Horst Birthelmer 2025-12-23   80  		return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   81  
17b8291f4d636a9 Horst Birthelmer 2025-12-23   82  	if (compound->buffer_pos < sizeof(struct fuse_in_header))
17b8291f4d636a9 Horst Birthelmer 2025-12-23   83  		return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

