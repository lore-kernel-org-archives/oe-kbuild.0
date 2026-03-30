Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0C19CCF5
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881482; cv=none; b=iTcnjNYCTzAAzx6aS0DljD9Wlm0z2+X8nLkQSZcoHb5/7HhctV62I3MiYQiOeskSxzh8nL2YQZap3WNWN2li1l0+lEdgIspI13T/n9GSzrjXgm1fzRmn88Fts2g/cD1ClkZfrW2hyjf2SYGwfIuDnfoPUqRYlm2XXjjZe6AKbMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881482; c=relaxed/simple;
	bh=t8SjH2ybyD9z6ayULCitef11i52T4zV1UXIP6GOzO/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9RnAWg/fOurkrMZxsK9ICaqtxp82NiB2YbbCTrJTEgcEVlVsQgV7GZ9qTPqZzBBKoghHMAKMT/+4uGe6mT3TnWK3rMlWteuhf6BqrRWAQyYHsG7J+Pqd52lgBwoerX6pTWocAFR/4LBBWZVpD7cen/Uyn4U5dQ7nW1lbQjA4T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRj34gT/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRj34gT/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so36028165e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774881480; x=1775486280; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wZZCmpnxv7dV1LZNlmw0lkZ4PSnjTjBHCzu3d76RE5I=;
        b=mRj34gT/6ENdILKgxAhXvN07UAShbFmgheGdN9B2qbWMpjIXY5Rk9jvikQjgu1ggNV
         39sb5TKBrE2kGkY89pBT/ZXwOs5So2pBux7Q7Z5q++UNBzGz3+Mgu0onP/2BJ8O8nRnf
         Sr/F6YehHUg2DsmRLz+KbRez+EMI6/wmsD8tTYERC6Ew9MVnR/HTxK0MnFr+dRR+d0jg
         SkviT1RZoDrizptXAC3e9GD4bfNUzYtcU8AQ1SphgyGnCf+MbbPbflqagldQOnoChN3a
         LjVtW6JqZVWMXSwGDS3qhEFJMbde14LGh10Ph1E7YRRd8BNS6yKOkQ+XazS3/Ix8ggL7
         wNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881480; x=1775486280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZZCmpnxv7dV1LZNlmw0lkZ4PSnjTjBHCzu3d76RE5I=;
        b=ndnWEFfUeMywjc93GU2v//jRNlhu0UZtZaWV2MMlhsnDmZiE/5zx0PKdkpkhYq4Vlb
         8SOQftWtXPYlDo4s+rn0ztOG2r6YI2KX5mEcSIMye5Rze9GkB7r519DXdgy4tNKFWy5X
         7mr7/wJlul7iknaH117xaj7m1miv+SnkwkCAlIBLKSpc+MLKdUyW6KE6sQzKxOs9ozH5
         n9XlDTVtXwOIAKw7wKBG7Pi/qftplwPX0IhFORQOvSMjXV4vysdbfntgHDs9udseJoXZ
         SFjoIeTK7RCdXh5lDr60hsLEp3dxCPnWo8na0KDO9PmveyPbs6ihOoAv3TeX3eFQvDF0
         HpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPATwD1Aj6kjtGct5X94Hlvztk6rPYJcWraQNIAK9yj8ajmjjtJcPs0Jpv5s/V9nfY6OiQarkrgJU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKXeYAm3fKdgE4+rv8B7xqyBTzGCMx9vDOGKKTQCQXY76Uxmre
	+sDQOZgoDZYlB8o7S2OzAiTXb4bkO+wQkmcjiWHx3gpjaYt7U9DUj3zOKJ02sA==
X-Gm-Gg: ATEYQzxmbmD27tGApZMCJneTE/Qp5KDGkLmRDTF5+uPhls282MJqRJRPvHtKYxhyYuX
	fhDMkPQIbilYcAaU8wvAPbTa8N6qMecJKD7JU4HuURkMtiOLVl4b/SRcwrAAvzc08a+B9DmmJ38
	ONfnhmNsbaVhGmHyil8eu883eQOToyldaIEIVuCJGlp7L5J0mBcEJHjxHwqmOvzHp34+EyzJPMJ
	NC7Oqe2OU9DQA2nYUQ9Ue705v/97M0GypTrVXSVFeC/8EI9yVTIAm7MB0o94vucwHWgDdLNVoKj
	hyMgnvFtACaYusSERoScUPpEHH/5pOE6o5zke97CI+X3F7RinsOwbrC0lejlxE9frruv0v9NUf9
	Bg8HuQPXx5SVWsRsaigY1k5DhzciPfv+g6Ou29NjHEx3CjsgAlos/S4bbKZvKV5j7VYdwuEUsW/
	3cQYckb3owDAqgnC6V3rj+MJoPWYJxLQ==
X-Received: by 2002:a05:600c:a12:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-48727d631bamr227966905e9.11.1774881479486;
        Mon, 30 Mar 2026 07:37:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm29469063f8f.0.2026.03.30.07.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:37:58 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:37:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v2 3/4] dmaengine: dma-axi-dmac: fix use-after-free on
 unbind
Message-ID: <acqKw6suDHi-dCfJ@stanley.mountain>
References: <202603300705.jhDfInJk-lkp@intel.com>
 <acqJX2HwDABMAZr8@nsa>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acqJX2HwDABMAZr8@nsa>

On Mon, Mar 30, 2026 at 03:32:25PM +0100, Nuno Sá wrote:
> On Mon, Mar 30, 2026 at 07:40:55AM +0800, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > In-Reply-To: <20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b@analog.com>
> > References: <20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b@analog.com>
> > TO: "Nuno Sá via B4 Relay" <devnull+nuno.sa.analog.com@kernel.org>
> > TO: dmaengine@vger.kernel.org
> > TO: linux-kernel@vger.kernel.org
> > CC: "Lars-Peter Clausen" <lars@metafoo.de>
> > CC: Vinod Koul <vkoul@kernel.org>
> > CC: Frank Li <Frank.Li@kernel.org>
> > 
> > Hi Nuno,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on b7560798466a07d9c3fb011698e92c335ab28baf]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dmaengine-Fix-possuible-use-after-free/20260329-160000
> > base:   b7560798466a07d9c3fb011698e92c335ab28baf
> > patch link:    https://lore.kernel.org/r/20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b%40analog.com
> > patch subject: [PATCH v2 3/4] dmaengine: dma-axi-dmac: fix use-after-free on unbind
> > :::::: branch date: 16 hours ago
> > :::::: commit date: 16 hours ago
> > config: loongarch-randconfig-r071-20260329 (https://download.01.org/0day-ci/archive/20260330/202603300705.jhDfInJk-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 15.2.0
> > smatch: v0.5.0-9004-gb810ac53
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202603300705.jhDfInJk-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/dma/dma-axi-dmac.c:1342 axi_dmac_probe() warn: address of NULL pointer 'dmac'
> 
> Am I missing something or is this a false positive?
> 

It is a false positive, yes.  You're using lei to see unfiltered
results.  Normally I review the warnings and hit resend on the
warnings which might be real.

regards,
dan carpenter

