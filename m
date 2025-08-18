Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E732C08CB
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503828; cv=none; b=a/FAPGmFjgumbgTaCzE+cVVtAtDcYWEO8C+pVLwLPNUUr0jremxrlNYWeubFFh7/HHP2QDmBie7IiUViW8WkQCMG1X5JhZMywXKSXqJHEsVceOEemQ1fkvOICNTO7qO4MudUjOUDZdMdBlARkQMYjfxPhpyqqeIG6QAHZoFwU2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503828; c=relaxed/simple;
	bh=irkUYFM4/paMAk6Wy0dyId7dBz+H2TNcYXRcWrpe4Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KtfPogzuuJ1KfYTmUrbwIsRTZw1zDMXPyNc0m0KkFfZFpsfXmWVkOEG54N8nFvKdqo94RFECr1zlS18DsCWmvD8m3mSZSq4g/SHP7DW9fF746KClVxBpjuX4fAwmBNV8WDErMnOYJzCs8Md56OJRzddlXUVsTyFI303agisdm28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+pteSrs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+pteSrs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b0d231eso20432125e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755503825; x=1756108625; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5JGOjRrEBDm9X/sEa4+YcCwfIvA42r2B08SfP6T1iQ=;
        b=U+pteSrsRikvEGUvL3oj95UnNx4ElOFv1xkQ9QHV+WynQocJ819auKq2wubJenw6Ok
         AX3jB/jS4Bo4W59FvoUHyGbS3XRlPysnLkExrBexTUaaErtH8gGfjqJc7tJvZGLBnUOz
         hsC7JG7A9wr1oU38RWbDUUr473iMVKB4AYKkYm78CZolDehqSe/uhaUg2VVjJ7BUFKcS
         RYUt36CTmX+GN1I3UoGhN4dXkWy5p0L+XKP+S29W5JBLZXLVOnUfw1eAxfjemm8mKVP5
         lovy3icOL4H7SGU/XkWl4eVmDn0yms/DGoDxfkQ5jqZsM9hz8owfR22pKEhW4re0yTwl
         BwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503825; x=1756108625;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5JGOjRrEBDm9X/sEa4+YcCwfIvA42r2B08SfP6T1iQ=;
        b=L7NRsvVt1bMUp+0JgiGiVBfWbG3pNPe0ZdjQTXM+Efkhd9OQtMFsxD2ZHHAxFcEZk8
         MTPDIEjJwBwN8QbaMW8NoVDTchj2ljjM/Ge15kOEIgVCFfB0xUOc3o2xN7g1IxfquT+Z
         QQwDL5oM82Hbe+gFAeOQBHI5rUjCwGd+2Hfp3iGG+nin3gNHcdN8/N/RAOQGFcOICY2D
         ZkLDYY9Whu+WjY9BC+NXwpbc6ikEFSMwJ2alDwCIMpbCtACERqZPtGBKeJrc69/jIhec
         d8IBdJzH1YyMxWVrmSEu6oeHjdwV/22An+aDyoQCepPJtpxW5J7KOeqfC8Tdgf3EnbDY
         ZJ2A==
X-Gm-Message-State: AOJu0Yyq/DKpbd/V1PinLexYb74WkTmH/YUSSzeLtkE5bVD3fcogiJa1
	1iJoEOOLuIeLiFEc5PO7xf6dT/fezbVXCYOGUzv0IUJUCNq6oP07meXAcsqlIyxNV3t8R3ylANt
	Zb9qR
X-Gm-Gg: ASbGnctGHCaTlXfTUGQoUg2fqScxybrh1+VTQIgAOwvyUvSpLk9iNJ9n8fqWvYz5jMv
	6eeJzYs79bl5SBNklvkSGCpIHUTRIWdkUmIv1JjMlaFE6DIqT1/1D4/e3iIccuuByojfP/xhIGc
	uAcEVqfr1cKYdKcl/3Gx1C5qBpzY/Kw2UdUDz5M8WPQjWZk4YYQtWm5ew8pGCtLxJ4WdjWUS0Bo
	tk11Lu9IBul03uqz1Qx/MKTn7JNUTgg0WqXjoZdyxHK65NDtONzGqml2hvKpXeSjKw7hObWwzAF
	pwlp2zun+qZ2+7/xWU/8pAJsVMZwtJdZAczzxoFDK+mNLfyF6Yx+ZqSNEvMLdJldbPp6ZtmUTNM
	D0J+eepU+RN/MEyPqUtbxg0oB+pk=
X-Google-Smtp-Source: AGHT+IHrJBk4bWXGj1nwyV4v635UJ8iUxXiG9MG7O5UHiJQO4NEljj+USKB+JTzmq9N/S2OxSSJhng==
X-Received: by 2002:a05:600c:19d2:b0:459:db5a:b0b9 with SMTP id 5b1f17b1804b1-45a218582f8mr64812345e9.28.1755503825202;
        Mon, 18 Aug 2025 00:57:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bc5aba02e2sm9484162f8f.3.2025.08.18.00.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:57:04 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:57:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anton Protopopov <a.s.protopopov@gmail.com>,
	bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Anton Protopopov <aspsk@isovalent.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 bpf-next 08/11] bpf, x86: add support for indirect
 jumps
Message-ID: <202508180805.aUCPtTuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816180631.952085-9-a.s.protopopov@gmail.com>
Message-ID: <20250818075701.fnQXFU797IDxikSIWXC4_z_epSDx5cGDmB36GG5LqkY@z>

Hi Anton,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-fix-the-return-value-of-push_stack/20250817-020411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250816180631.952085-9-a.s.protopopov%40gmail.com
patch subject: [PATCH v1 bpf-next 08/11] bpf, x86: add support for indirect jumps
config: x86_64-randconfig-161-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180805.aUCPtTuQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508180805.aUCPtTuQ-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:25013 compute_scc() warn: unsigned 'succ_cnt' is never less than zero.

vim +/w +25013 kernel/bpf/verifier.c
 24891  static int compute_scc(struct bpf_verifier_env *env)
 24892  {
 24893          const u32 NOT_ON_STACK = U32_MAX;
 24894  
 24895          struct bpf_insn_aux_data *aux = env->insn_aux_data;
 24896          const u32 insn_cnt = env->prog->len;
 24897          int stack_sz, dfs_sz, err = 0;
 24898          u32 *stack, *pre, *low, *dfs;
 24899          u32 succ_cnt, i, j, t, w;
                ^^^^^^^^^^^^

 24900          u32 next_preorder_num;
 24901          u32 next_scc_id;
 24902          bool assign_scc;
 24903  
 24904          next_preorder_num = 1;
 24905          next_scc_id = 1;
 24906          /*

[ snip ]

 25008                                  next_preorder_num++;
 25009                                  stack[stack_sz++] = w;
 25010                          }
 25011                          /* Visit 'w' successors */
 25012                          succ_cnt = insn_successors(env, env->prog, w, &succ);
 25013                          if (succ_cnt < 0) {
                                    ^^^^^^^^^^^^
unsigned can't be negative.

 25014                                  err = succ_cnt;
 25015                                  goto exit;
 25016  
 25017                          }
 25018                          for (j = 0; j < succ_cnt; ++j) {
 25019                                  if (pre[succ[j]]) {
 25020                                          low[w] = min(low[w], low[succ[j]]);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

