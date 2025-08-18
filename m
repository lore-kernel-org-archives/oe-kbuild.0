Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5848270EAB;
	Mon, 18 Aug 2025 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505067; cv=none; b=Z5kS1yZO/w7uUStkXR5LN/nZudTGqlFG8VkbVSDXKwg4tcgClceQweBjpNsd83FU/FJHHD1tTfkWmR+fJ0Q+xtSL2i1eh1Ftr6hfon+sWiyYjOzgZ/ZUUAoF/c42GkGJjjQDmvcOep9ql7C+1f12QgTTZqtWL87kzRhInLuZKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505067; c=relaxed/simple;
	bh=9JGcY+0KyGyjTEiI5T8vpORcywSVro7t9EHHHh/kPzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9qCN36+b2+clih28MnAP5Zayxyic4PfTIknIfI6brJGbiPz8yBDUEM3kirCMF1tEYLFYcZrMr7k+KCUwkEft2Z4IGiEQyh75IP5GEJzjcWRSPBOKmES7Sl3qUIhQoNfAAvLbxLWUYMo2eL7hclKcGVMcQTMYEuStak7xazeA14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNpvlh0E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNpvlh0E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b001f55so15360195e9.0;
        Mon, 18 Aug 2025 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755505064; x=1756109864; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ekE4nPja3ASUDhMh9k5/LZ4ut0A0tgRnQwCXeXPp50=;
        b=aNpvlh0EUWz/1v9rLBtqTHUG4TuRAowy4ClC+uTlM0CzMJNnHSED2oc36gnf20jUPq
         wgbc93EbjNcfz2jLcfkre2YGsc+1or/kEZTdX5WX9MMGaia0+EG/48+TjJ8sGdD5YYhE
         QpZ9lOHSldjitn1oeeIXVoerInzW2InKe1NeK5X7ZpaHBjyg4abdblSTyiMsFj/st9Z7
         p+i92380x3t2BHgEWxLwFG2KQR5inhpfZANTMFTeXr94H9CIpdd+q7LoCuRkyG2tSX8W
         EJZyUCxqY+y8vophq/mnRzx+w/cuMV2Rlttt9VJMZmTLKki8dZA7zXHDhpkIodiMp+HV
         RbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505064; x=1756109864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ekE4nPja3ASUDhMh9k5/LZ4ut0A0tgRnQwCXeXPp50=;
        b=VoKCBH68I7Q5TiFK54A1b/1mfCbRUscd8zYDgGQ314gZooouPWLQ79jcgIONgYxr7/
         Iqin5pWsAo6FVBulGDlkQu4SCzPu5vXe2v/5k01k7z4iBwyjzCUcXnX6enAzK/xwegcb
         iBaDDRxaim7jU2lBcsZVL9ioksZIV6kGmUjJsAu4B0RCl6//qFmSjOnxEoO/qWO+7QFM
         zL6CHuKIaKFZPdeSRav5NKtXl1piTyj0VJXsslQj8CgPAvBtKLYjt+pR/+bJ7QyV4Ylf
         ymuBNIlIXV6aXuMWtCdQoB5X+lTamnr82z87ME0F2xixCR5iU2v2RuRmmb1gUjEPcIfC
         ZpXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdVcho5XgOySp3GBn0SA2thBywxJMZeTDIv6ielZZQmwwQd8/CMfapuzkWl2gZ9XGaMxGNQ66yol+wNDqF@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5bLJO07Sb33aOYnwwcjaQE1nENws+IQ6qnwfR7Hbg6Pd9xmeB
	i9/JlzcgbIP+zbjCWq6nZ/pE3uXn2ZQNjD7/HFuwvergqjg58O1e6HNg
X-Gm-Gg: ASbGnctdjJZHDKVM9a6IwN0Vufsq87w/LU9+QvH0vM9xRt/EcbQn3LHZ1k7B2aPV7ha
	Zs/mEUvKPoXvECZEfgzyjCAml29vJLC1A0nwHNNDxAxQ0CLtPPMYCu7d1MUVAtr5YKCYzzAsiL6
	D+uNHF+MbI0DlKTXO+lavPVdRr/9c88iJwZPE2e9E3wGTMfi/WyluYRayhyzDkW0bnO/lGIwlXm
	TzgEyJ7xfZiDRkPYESUSZ+msNfSxfQU9P43Vn1UEvwz2b6t+uVg/pZK1Dwta6En15HiuHu1nYCY
	bEYcPpAiol1Vj4GGIUCaMWMqb0edarucFF21V0O8E2UO0qV+P1PwlAyClzdS8jSkPokP60y3MyB
	nM5ZVtA7EIjf/k+hdXHLxWGFPkrCiD9OYyDYTSsXCgM81
X-Google-Smtp-Source: AGHT+IHdkOU/yckvYyJTLfiij8WfT1dmp/CIFFww4DkTU6TlWAp7UgvkJLt3ORbMny7QTjBU+t6sFA==
X-Received: by 2002:a05:600c:5253:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-45a26784347mr57370025e9.18.1755505063765;
        Mon, 18 Aug 2025 01:17:43 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a2221136dsm123154315e9.5.2025.08.18.01.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:17:43 -0700 (PDT)
Date: Mon, 18 Aug 2025 08:22:24 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Anton Protopopov <aspsk@isovalent.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 bpf-next 08/11] bpf, x86: add support for indirect
 jumps
Message-ID: <aKLiwL5awqPcngf8@mail.gmail.com>
References: <20250816180631.952085-9-a.s.protopopov@gmail.com>
 <202508180805.aUCPtTuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508180805.aUCPtTuQ-lkp@intel.com>

On 25/08/18 10:57AM, Dan Carpenter wrote:
> Hi Anton,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-fix-the-return-value-of-push_stack/20250817-020411
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20250816180631.952085-9-a.s.protopopov%40gmail.com
> patch subject: [PATCH v1 bpf-next 08/11] bpf, x86: add support for indirect jumps
> config: x86_64-randconfig-161-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180805.aUCPtTuQ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508180805.aUCPtTuQ-lkp@intel.com/
> 
> smatch warnings:
> kernel/bpf/verifier.c:25013 compute_scc() warn: unsigned 'succ_cnt' is never less than zero.
> 
> vim +/w +25013 kernel/bpf/verifier.c
>  24891  static int compute_scc(struct bpf_verifier_env *env)
>  24892  {
>  24893          const u32 NOT_ON_STACK = U32_MAX;
>  24894  
>  24895          struct bpf_insn_aux_data *aux = env->insn_aux_data;
>  24896          const u32 insn_cnt = env->prog->len;
>  24897          int stack_sz, dfs_sz, err = 0;
>  24898          u32 *stack, *pre, *low, *dfs;
>  24899          u32 succ_cnt, i, j, t, w;
>                 ^^^^^^^^^^^^
> 
>  24900          u32 next_preorder_num;
>  24901          u32 next_scc_id;
>  24902          bool assign_scc;
>  24903  
>  24904          next_preorder_num = 1;
>  24905          next_scc_id = 1;
>  24906          /*
> 
> [ snip ]
> 
>  25008                                  next_preorder_num++;
>  25009                                  stack[stack_sz++] = w;
>  25010                          }
>  25011                          /* Visit 'w' successors */
>  25012                          succ_cnt = insn_successors(env, env->prog, w, &succ);
>  25013                          if (succ_cnt < 0) {
>                                     ^^^^^^^^^^^^
> unsigned can't be negative.

Thanks! Fixed, will squash into v2.

>  25014                                  err = succ_cnt;
>  25015                                  goto exit;
>  25016  
>  25017                          }
>  25018                          for (j = 0; j < succ_cnt; ++j) {
>  25019                                  if (pre[succ[j]]) {
>  25020                                          low[w] = min(low[w], low[succ[j]]);
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
