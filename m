Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C0322F01
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 08:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755504431; cv=none; b=VUx3iXZsX1/eCBi6rnPonhDxgskqg1l1zgZtu5ywcSLWTBamqYM7vAYBeZg02bhFjGXMZ+DGI9DXcm7u4h5b0ILBFWfTciMUIMWeZr7x0M7UbkWXuB3YP5ExzMcyrEiIkv+4xmvnQx79qATzlpcVVPh9t4r7hvTzoZRihCpeGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755504431; c=relaxed/simple;
	bh=GeRmeBnspDWFz8RBxlv470wgjPvwTzUFuzHg0zUu7lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORCIvZwHCukRW8djignQ+uN6zkJWQAqEJiIJ73qxjU4kvbEYYKGzfJf2dHx3d9ksHAl8ulBuWYdvR8A4Qi4RgD7jOjPsJNrwfW7FA43LyeDc0nrv71EtULmdS5/Mkuf6lKTRldW5M8Cx16yGCWjcfQwMcrwEUZGWn3bNHsI3tRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+HI+hUr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+HI+hUr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9edf0e4efso2710127f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755504428; x=1756109228; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vr63C9F7Vxwf9wbtxAedaNNw3W1EQmWq9TQaBSm9Lp4=;
        b=h+HI+hUrF7lue+sY76xqgJhMGKgwEA8tJ/ZKaGxKItjWv4wA3Tz3CcbQVPc1IZT9oi
         wxT7OP1wqZMd3CwXnQFQJw7I2lvvwJ7RN17mFOCl6SJQD2PUqa9u21SdxOQYp2+cbcjs
         S5QBP3zuMhEe3rlgVLOo/Hf4sznXMl/fPOOnCuu7GI3/qeBSlnHvRKx0DM/VAiQhDsLq
         d+Rji/Mza8VKFOJMRgE9zXyri5pZ4gwqRAEPd88Nw0xaEctagiYGTnjPlTlU1xYxhdGw
         /Ch8UEtzAUSc//qc9Y7JbxUE0mfNY64Pb1U12flBmOmOkH4+vihX0r+7C7Z5WIy7ZZ+U
         QATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504428; x=1756109228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr63C9F7Vxwf9wbtxAedaNNw3W1EQmWq9TQaBSm9Lp4=;
        b=uC5l1W/6Rkgb25rB6ygKk58e9jhg2Ebf4fo0xZvHG1qu1WAgRIvyMVyFn07Ru+LRmC
         bxT+n5NAPxkGUrGkKdY9phBD4wH+XVo5RlJXZxyMGb6gxheMSyOV/w2y9X3WcBFHfGLI
         TvhlecdRvS2nHiPsTKym2Ss5BSy3UABAmrY77enpJzC8RZBGWqKMbhvpo2P1fiXddFHm
         SxTHs3vwzbq+D2NoCn3efemK4qAF6sbMu1Kej38Z83UhnamQCxApw5iVywTAyZNUiZ0i
         u8uVKJV8kgz7ODUUlMFICt1GoAaW1GOPJYQ5MdWhYJnbm+XhD7po0lYziBFTTY7Z2H48
         YoHA==
X-Gm-Message-State: AOJu0YwaWl9RrqpzIFSF+SmVf+h6nEOR+G8gOu6WuHu8KqlAXR9M7y91
	3/ucx+admiiWzlBDilgUAdEP4oW2JEuUUIa864LAQ38cDCutcFIdbbpKuS9+lf6qbV4=
X-Gm-Gg: ASbGncvGLNtBowGps0zFx6sCuIuyJYlOJQWh7M0WTiRi9XmSGOU8E0kVn3JjCF730CF
	obA5ARq0U9NbqgdaWXsNVsVUg5J4Yyykv41uR2tU43/RssHqkMT42lPwJHyJgAgDY1F1EHT7pn+
	CtZZyS4PR15Z6PmOhH1wtjEKHQFxzn0CFWc3eiEOK6QOGXkxNwBBMgdf8uihfb+8SEFKpp40kh6
	Zb9183vTQJSq3SKESbF+buxSImX44Z+vqIFdo5vptmgnpKjEexKLkthrd6Q6pUzLRd4DmDF5Laj
	jycRVKVl0C/VRAwOMp4dAFzylBBogmxolJPr7ZongLO76qW3hkejuhmhg52MTvEt98vUBjvU5j2
	a5do619uSyiLUPStHc9sNrjXUV6s=
X-Google-Smtp-Source: AGHT+IHSz876FI/cLGK0ny07sWb75lsaIEn5nq7yEaH+NsoKBv5Qv/xqepawaWIvQIhO6c4cAml83Q==
X-Received: by 2002:a5d:5f48:0:b0:3b7:b3f2:f8c3 with SMTP id ffacd0b85a97d-3bb69699cd7mr8936286f8f.57.1755504427832;
        Mon, 18 Aug 2025 01:07:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb5d089e07sm11841541f8f.0.2025.08.18.01.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:07:07 -0700 (PDT)
Date: Mon, 18 Aug 2025 11:07:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [drm-i915:for-linux-next 11/18]
 drivers/gpu/drm/i915/i915_switcheroo.c:21 i915_switcheroo_set_state() warn:
 variable dereferenced before check 'i915' (see line 18)
Message-ID: <aKLfKK7DpMxMBFrG@stanley.mountain>
References: <202508160035.hmzuKiww-lkp@intel.com>
 <6be63b523eafadf77d38d8319a011951c283bf9e@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6be63b523eafadf77d38d8319a011951c283bf9e@intel.com>

On Mon, Aug 18, 2025 at 10:18:14AM +0300, Jani Nikula wrote:
> On Fri, 15 Aug 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
> > head:   63e0b17ae79a4365e874d7e2ff3816db2e6d55b5
> > commit: d2e184f8e16ab85876ddcc0779358fbfe5162414 [11/18] drm/i915/switcheroo: pass display to HAS_DISPLAY()
> > config: i386-randconfig-141-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160035.hmzuKiww-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202508160035.hmzuKiww-lkp@intel.com/
> 
> Side note, this triplet of tags leads to checkpatch warning:
> 
> WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately
> followed by Closes: with a URL to the report
> 

It's hard to know what to do about that...  There is only one link but
both zero day and I rely on Reported-by tags to justify our saleries..

regards,
dan carpenter

