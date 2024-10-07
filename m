Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0171D4164
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318842; cv=none; b=iFG3fYkwaRuuSmw3rvdXXJFoQWSJH/s9O7WDpluyekyGkVHAae8swBHCe9QOqPfloqQzhaU4nFbHWxJiwxLOB9gjpNZR+IFjvFH4/mh7BQie+jKrziVtO+DCFMBD6OYcvp8jNGO85ux9eh7Ll07cV2eG1gv4v8zhmJzVCOYo2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318842; c=relaxed/simple;
	bh=DdutLgm7LnJZUydsu87UTwymGUlWI6mMAxVG/ZJc31s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gviPbsM8WF55vo0Fam8So3wpKo1fIIfxpzv2+4AxHAltHA3v0cGlKv4z3IEMX9vNqOxWax3b+58odpRxXnYTMkMlDvP+M4QUL6wIf01W+Q1Q9ZUkZP4Cy3Qla2RVjucuE7RdvW5nyJ5fo7ZVwDYnY2LiPhkv1qLDtC+RZQTh3i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Ehp+6V98; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Ehp+6V98"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71dec1cf48fso2579151b3a.0
        for <oe-kbuild@lists.linux.dev>; Mon, 07 Oct 2024 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728318838; x=1728923638; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZWM6QTmBe9B09ML2vqXCSoB0/AzhE/+M2NioGDzKy8=;
        b=Ehp+6V98qq2ncX6XA/QpZWyGmRm5VilUIGjyzHaM97XnZZ6Ycjfcpxanfgp9WKHYxy
         rtabBB1z59Cbj4wz8+ZJatq0Jerwh3HmH+2D3TRtqGp48v5LUka69lFFOLOyIBfzukUq
         8tFKqtRxrd8rQ6OC5USo0fnJEqxZsrPlZFKK1XUep0lUXSHi2iaMcfHeGkW0jEGzb3w2
         elKIwJKNfzn6y9DQb7VaO9Ki7PqVWxj3z87cogDcMLspBziKoQlCr6pV3I/bNLjIlPbL
         xy9YvjKpmfQnVjyMbx7P+MokI8fuVbi2Gsfma5yz2xPh+N/H82Sbi2/kB8hbslwyhoTB
         zTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728318838; x=1728923638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZWM6QTmBe9B09ML2vqXCSoB0/AzhE/+M2NioGDzKy8=;
        b=eFVVUsMb8LQYBIAEBw1zk2B5yvmkokpjC0/c7ZIjOxL5LTbsDkfjqp8si4Td0/nMsp
         rxsiUawaWLGqMXJH88ot085AnDpTK2urknhD4ya9zJCKeY5PMaDgkiAbbhexma+ZR+oL
         j5uBQi08CgRQek1bpBHgB1miyHI/MrF9u31oj2uwMBYXBjbGNA/3G9BzyDA20kkdvAwN
         oINzvF0xhf2NEqU6o/kw0K8bj1W60P331fJyNsNRKdgKl3+gUyzWFxrBes4c+L6ahgFb
         pGLD/bflvUemzgoWr/xQYBwJ09JRIp3y3Xec9g/9NUWbPpIOfhOWbc0X3+C+M+cVohVd
         ryCA==
X-Gm-Message-State: AOJu0YyJlgLl5KcMljA3Zl+c8qCEgZiAU7cFUiKtxqbOy8E5Ldc87VLk
	tOg/WrWZewWs5Hl+IA5sBBwkWAg9p/SD7k3KbFQKJuCTKtga06F7qyJ9E2uN+E0=
X-Google-Smtp-Source: AGHT+IEOn2aNJRc6PNcmA1E8hHomUDAvzvN8DoqLjg4IGSM4t5x9BXT+gVd7xFtvp6ibMbgO/sW9JA==
X-Received: by 2002:a05:6a00:1ad0:b0:717:8044:3169 with SMTP id d2e1a72fcca58-71de23b5f19mr17937448b3a.9.1728318837846;
        Mon, 07 Oct 2024 09:33:57 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d4a1f4sm4590147b3a.113.2024.10.07.09.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 09:33:57 -0700 (PDT)
Date: Mon, 7 Oct 2024 09:33:55 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Message-ID: <ZwQNc9/sO9lhUvmw@x1>
References: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
 <6b3d9f7a-c87b-4ef5-8571-77276f3896a1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b3d9f7a-c87b-4ef5-8571-77276f3896a1@stanley.mountain>

On Mon, Oct 07, 2024 at 06:41:36PM +0300, Dan Carpenter wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Convert-to-thp-mutex-to-guarded-mutex/20241006-033647
> base:   2694868880705e8f6bb61b24b1b25adc42a4a217
> patch link:    https://lore.kernel.org/r/20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00%40tenstorrent.com
> patch subject: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded mutex
> config: parisc-randconfig-r072-20241007 (https://download.01.org/0day-ci/archive/20241007/202410072108.uG2sVTN4-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410072108.uG2sVTN4-lkp@intel.com/
> 
> New smatch warnings:
> drivers/pinctrl/pinctrl-th1520.c:538 th1520_pinctrl_dt_node_to_map() error: uninitialized symbol 'child'.

It seems this is because the scoped iterator declares *child in the
macro and thus no separate declaration is needed:

#define for_each_available_child_of_node_scoped(parent, child) \
	for (struct device_node *child __free(device_node) =		\
	     of_get_next_available_child(parent, NULL);			\
	     child != NULL;						\
	     child = of_get_next_available_child(parent, child))

I'll fix in future revision.

> 
> Old smatch warnings:
> drivers/pinctrl/pinctrl-th1520.c:502 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

This has been fixed in the v2 series [1]

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com/
