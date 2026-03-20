Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A0035DCE3
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995830; cv=none; b=Ed3qnwlv9CCaLBXFA0bG0+uUqMsqtfg0I+kQFFYDZCrbX20J8nxS5JkJ6gaip4ZfodpCeojXyu6ujFKlePifWicKAh4elgKpI35xwmDQVgLESsXSgNEePIlr55QJBN/rC5pL0i0VEH9m5+GhBfEjLm70O8/uwQjf2gSBSQkvVQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995830; c=relaxed/simple;
	bh=aubSRWOk/G5nMShy731v1i3p/4qj70+D9lPp6TThzE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fMBC4kaRbcv7jD1b08DhILw2LV1Jc5nPLiwI8m2upCuZ8C1zVBNe/GVV0fhub+FN2JY0OltlXdS5Bl9ez9mp1WFla8LdvXEJBWKlrN+BbqCIe4FcK+IszAwKjwuN3+WAtpsiImKHpw/QNPtwhrCwaVMlqN+uSo9jif0ddEsuD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yh9yWe8k; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh9yWe8k"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso1089471f8f.1
        for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773995827; x=1774600627; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=751vzObume+CAZzdt7A8eq8P7pep03Yg0q+zRI38A24=;
        b=Yh9yWe8ki+htJPQK6u9OldwVo/DAFD6Qfx2Ve+lZbDej9bklF7kL+g+Y2Bd2jbPDY6
         TYSEItr40/iu9058xk9sQ3lljmb7zEhuH6s7EuXbXKR8nO4e9g9ZgFm2w+QdbVkExBv7
         1id3yHyTb/HcZ+95uvpH9SizZNwCxwEZQKug2tSFUSTmxxpfr7y/UrdWAEP0XCPOw2W2
         tqyH6hWAV4unwbiksrlgCZMpsCfB3wmllNrH0kiKP5Y37/GdaTdZ1CEJ9ElvoTwFrzha
         eshdQTFC7D+D/xuCQdNcqNx8vSEtD4V9lqZBrYwo82mekEDkYJc/CuflykfxDRjtmX1L
         qgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995827; x=1774600627;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=751vzObume+CAZzdt7A8eq8P7pep03Yg0q+zRI38A24=;
        b=h1/7PvO4QNnEnm80veVrm+uhiHVeY5p2V/5+cGMD7m7+37NN06Z81VEExX7JthJlup
         bf9/FsENe1sJPxOQ5qPrngv6R3paaOXqhk/EaS25sNG8tfj+89olfOpgOEAe75EVs4Cu
         p22rScAodczUBBDLnh/2obL35wahB4dl+I1Fs4Y/4VBTETFNQ1eu8lfwq2wRr0CNzELj
         QvbJ+9Giv5390d23MWepfexWoBRa89kuWzFdp2sIaJB/YqPzUqb+0WiGDxg+TJze6wRj
         hRZUd2nFtNrzYn1tvfqkHOasxnQ/7GW0Zm24Rn/0r9E/xQBMeCEt3a980yQmx/BoXfUu
         pm6Q==
X-Gm-Message-State: AOJu0YxZQLl6IFmTYoJq2/ILeN5zEphb9dIQF4W6zQmCI1HljdoWZraU
	j9vqwSrppbDA4I/aoJziIyTTLcEA5YDGtFdA03W8GJTJRe986UNdfL2zwg22cbp4cuObfQr2Kad
	vtnc8
X-Gm-Gg: ATEYQzz28troKln00m2jVM4EEBpcYeZTtduJ10bXgAFnS7VQDuNye5TvlgWXTUcyodX
	KYhnAJnEXEkzNg/oNXiNiPlaQQlPJ52Ns+G3zV9cITu1R7wi/7yts4h8vQkp1SUupeJEo536kAM
	wTfUJc0ZlXCMbbOf7a+JavJjOKOGNpuDZaTs62bFuLqD30F2dwqi82Gv+LpJ/BJp7VIpeVJZmv9
	F3aN7j9JVe/+Os0hWUUZYpZC9C8/Hi+GmnMjg+HhHR9ZhnByaL4gpWRBL2ubxJ69nOn5Igkyvt6
	TaAam9W+wFvTFDBOGy9ggAdtRWVNj2EB8M+WOJ0+SjC6jm7nMA901UkX56EN4VVsi10feODx8Q4
	4j6Kjh8bw9pu3wp+JUPLmt8S9VHvIO1ktdUlt3zPY6Hg0ibcEQRXaT8yMGHlYz8jKuVTE/Q6xm1
	QsDanjIGGtPSRIE/7qlOov7fglV6yW
X-Received: by 2002:a5d:5f53:0:b0:439:be04:13c4 with SMTP id ffacd0b85a97d-43b6423d85bmr3740008f8f.4.1773995827294;
        Fri, 20 Mar 2026 01:37:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm4288450f8f.19.2026.03.20.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:37:06 -0700 (PDT)
Date: Fri, 20 Mar 2026 11:37:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Support struct btf_struct_meta via
 KF_IMPLICIT_ARGS
Message-ID: <202603200410.ZnghNupo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318223544.1789748-1-ihor.solodrai@linux.dev>
Message-ID: <20260320083703.0DsFmnPrlEU1g2E7efdxmAvXugYyLZ_Enl47pyT-Elk@z>

Hi Ihor,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Ihor-Solodrai/selftests-bpf-Update-kfuncs-using-btf_struct_meta-to-new-variants/20260319-070652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260318223544.1789748-1-ihor.solodrai%40linux.dev
patch subject: [PATCH bpf-next v2 1/2] bpf: Support struct btf_struct_meta via KF_IMPLICIT_ARGS
config: x86_64-randconfig-161-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200410.ZnghNupo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603200410.ZnghNupo-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:12760 is_bpf_rbtree_add_kfunc() error: buffer overflow 'special_kfunc_list' 64 <= 64

vim +/special_kfunc_list +12760 kernel/bpf/verifier.c

3700d7c829341d Ihor Solodrai   2026-03-18  12758  static bool is_bpf_rbtree_add_kfunc(u32 func_id)
3700d7c829341d Ihor Solodrai   2026-03-18  12759  {
3700d7c829341d Ihor Solodrai   2026-03-18 @12760  	return func_id == special_kfunc_list[KF_bpf_rbtree_add] ||
                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Out of bounds. We need to make the special_kfunc_list[] bigger if we're
going to keep adding new special_kfunc_type values.

3700d7c829341d Ihor Solodrai   2026-03-18  12761  	       func_id == special_kfunc_list[KF_bpf_rbtree_add_impl];
3700d7c829341d Ihor Solodrai   2026-03-18  12762  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

