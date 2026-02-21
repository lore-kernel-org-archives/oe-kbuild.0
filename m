Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B83016E2
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Feb 2026 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771667889; cv=none; b=peOuE81qS11Rgz++smhQOFYUiN3M3+Fddp8rq55FYFPa8fS1RaSiy8878b5u3InWCieyS+U/0xWdJcPG/mUdX+LDABhG8I8yzDM+PMn1Mn9nqEdoYuX8gDGXupzPALaPjR2UIUO4etp76URZ/ioHv+V+WTXCo609E4PV3XU5esk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771667889; c=relaxed/simple;
	bh=yeFPaj6dVZUGfQ6mk7TVN6TVYypxiVGLknPgkecZgsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DG1UtGPp3GsREzMp1itxFC+pBvjsBVJKfxmgkwzScVHjXuy9XxJyaU/J4vdgPZuw9MTVSiheN1HMY59VD+S0DpnEvm1J6ijGi7Jj2v1OPb/l/T1n5Eago4MViJz87fTgp2kf8YXEKockqZ3ctMWW2SbVzTNOKoBlBccUtPBrpA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIeMlcOG; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIeMlcOG"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so1821187f8f.0
        for <oe-kbuild@lists.linux.dev>; Sat, 21 Feb 2026 01:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771667886; x=1772272686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iG95ysl0cBzDn6owjLxKJa0jdHI3ZVF2zQtfxEizLIg=;
        b=aIeMlcOGEncsdeMyNJysNMlTBBmRu3Tu9rLKSSsaDJyZo9SNnozfBh8hr1a1Noiaro
         WEbJc09lriV4hcCcnd1E8RoA9CDU4BL/tEOEMY9ZTuZfVz2LJDS06QXC85ZKq/Sp08Bv
         QW9V8xhxarOgL67ZbDVRR49GU4nqRZUeZL5pYtf6c/t1T++MnxRpU2qd7jvZCtpLWxdV
         tcjl6r3NaexwioEQuLjs1M8T6x1/BP2OICUJDvwHq4+2GWMmcL3l8NYP+4woEyLRy0QV
         Ymiit2V8EHugj9fjFaYv7mk0UkxLK/UwCcsno/od5OOErkwrH6KUJGK76SL29GVcG38D
         bRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771667886; x=1772272686;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG95ysl0cBzDn6owjLxKJa0jdHI3ZVF2zQtfxEizLIg=;
        b=MlNA7A+GH5R1rfAYqJ7Et7ma7LOrdLQXGtQytfEIs9l+wQsodj8fRIdl7foRmPo4P/
         IE0tkT/Wb1EO9ALdgWzUk1tXuolc+oEYiaK+nJaXv42++DD6UxpbuOscWUpd8gtxChB0
         2+BlGhKK2pgI644DeRhX42lEK4Osxpi67LdVA7bngMtW950W3QvYU5xfckn4khG7IhJD
         WCSMmshnEke+ypFO2IjrV5Cn3iBMriwdoZskjZy/oO+Qw/QvvqvA8trkEcI0uF0vu2L1
         aaYPhv0SuPCH6B5GM9Kt2qPH34rt/j8kXWfWr86NVP39GxfPhqveqQ7KmQzt57V8j1D5
         VJHQ==
X-Gm-Message-State: AOJu0YwAiV1958cOU0Rv9NfxLnO+ji3r3vYnpYC0T5Jr7fnhGQDkVUgS
	XSvkhSPDbFB8woIIL5GImssRhOfLgH+U4kPS8I/WsTfcxgZtfIrEq3OqZcImK8NwEb1bo8uzX29
	7LEGz
X-Gm-Gg: AZuq6aLifjCVG1qmuD3JuVTXFLKhgP1mOrpIVcJl1OhTmG+OAgNp6IC9zfUpiWwBvLi
	pS1nTolqcHjh65EIDHz7QQ7lLkDVtmgoNVWCrour3CP/7OhziQyCrJRUy1qyPp0LECr91Or18xp
	VqQklt7y6DfuZFlC+Lb5LnrOjNaYbtt1A93Y6TOktVw4r38U4E5qm7NEAMmJkOr+GZQSJBG3dGQ
	m9XCL5VtykXnTDqgENzoIDHWMM0r9puQkazzO6UHH5mCUQNG9iipOjd509AWiWkhOJ1960d8F9f
	9YZCNAVCdyCFIlU1/hXpps8Ksjkk7zxYu5uJUkDKI4Vrao4cFnfyrv54fMDM61uRopHH9sAURjL
	n6ImcW9SCUuTuxf2dobdA7pgs/mDqMgQ71XBthFxeDeqSNm+Tdj77DquXMpnLccwRAYIjPFg4XK
	fCApP2b3R8ffojnm+bGmyYMZpwB64IkfSXtMtQzpY=
X-Received: by 2002:a05:6000:2601:b0:437:81b0:6638 with SMTP id ffacd0b85a97d-4396f188767mr4885393f8f.59.1771667886111;
        Sat, 21 Feb 2026 01:58:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa015sm4427011f8f.8.2026.02.21.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:58:05 -0800 (PST)
Date: Sat, 21 Feb 2026 12:58:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Leon Hwang <leon.hwang@linux.dev>,
	bpf@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Leon Hwang <leon.hwang@linux.dev>, Peilin Ye <yepeilin@google.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Viktor Malik <vmalik@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
Message-ID: <202602210241.E7Q88vvq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219142933.13904-2-leon.hwang@linux.dev>
Message-ID: <20260221095802.cm-rCMQppinmu0ruIiNhYuoTlJnO0vWS3njuf73GUFI@z>

Hi Leon,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Introduce-64-bit-bitops-kfuncs/20260219-223550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260219142933.13904-2-leon.hwang%40linux.dev
patch subject: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
config: i386-randconfig-141-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210241.E7Q88vvq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602210241.E7Q88vvq-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:18245 bpf_kfunc_is_fastcall() error: buffer overflow 'special_kfunc_list' 64 <= 64

vim +/special_kfunc_list +18245 kernel/bpf/verifier.c

966e89879bbea4 Leon Hwang       2026-02-19  18223  static bool bpf_kfunc_is_fastcall(struct bpf_verifier_env *env, u32 func_id, u32 flags)
966e89879bbea4 Leon Hwang       2026-02-19  18224  {
966e89879bbea4 Leon Hwang       2026-02-19  18225  	if (!(flags & KF_FASTCALL))
966e89879bbea4 Leon Hwang       2026-02-19  18226  		return false;
966e89879bbea4 Leon Hwang       2026-02-19  18227  
966e89879bbea4 Leon Hwang       2026-02-19  18228  	if (!env->prog->jit_requested)
966e89879bbea4 Leon Hwang       2026-02-19  18229  		return true;
966e89879bbea4 Leon Hwang       2026-02-19  18230  
966e89879bbea4 Leon Hwang       2026-02-19  18231  	if (func_id == special_kfunc_list[KF_bpf_clz64])
966e89879bbea4 Leon Hwang       2026-02-19  18232  		return bpf_jit_inlines_kfunc_call(bpf_clz64);
966e89879bbea4 Leon Hwang       2026-02-19  18233  	if (func_id == special_kfunc_list[KF_bpf_ctz64])
966e89879bbea4 Leon Hwang       2026-02-19  18234  		return bpf_jit_inlines_kfunc_call(bpf_ctz64);
966e89879bbea4 Leon Hwang       2026-02-19  18235  	if (func_id == special_kfunc_list[KF_bpf_ffs64])
966e89879bbea4 Leon Hwang       2026-02-19  18236  		return bpf_jit_inlines_kfunc_call(bpf_ffs64);
966e89879bbea4 Leon Hwang       2026-02-19  18237  	if (func_id == special_kfunc_list[KF_bpf_fls64])
966e89879bbea4 Leon Hwang       2026-02-19  18238  		return bpf_jit_inlines_kfunc_call(bpf_fls64);
966e89879bbea4 Leon Hwang       2026-02-19  18239  	if (func_id == special_kfunc_list[KF_bpf_bitrev64])
966e89879bbea4 Leon Hwang       2026-02-19  18240  		return bpf_jit_inlines_kfunc_call(bpf_bitrev64);
966e89879bbea4 Leon Hwang       2026-02-19  18241  	if (func_id == special_kfunc_list[KF_bpf_popcnt64])
966e89879bbea4 Leon Hwang       2026-02-19  18242  		return bpf_jit_inlines_kfunc_call(bpf_popcnt64);
966e89879bbea4 Leon Hwang       2026-02-19  18243  	if (func_id == special_kfunc_list[KF_bpf_rol64])
966e89879bbea4 Leon Hwang       2026-02-19  18244  		return bpf_jit_inlines_kfunc_call(bpf_rol64);
966e89879bbea4 Leon Hwang       2026-02-19 @18245  	if (func_id == special_kfunc_list[KF_bpf_ror64])
                                                                                          ^^^^^^^^^^^^
special_kfunc_list[] has 64 elements and KF_bpf_ror64 is 64 so
this is out of bounds.

966e89879bbea4 Leon Hwang       2026-02-19  18246  		return bpf_jit_inlines_kfunc_call(bpf_ror64);
966e89879bbea4 Leon Hwang       2026-02-19  18247  
966e89879bbea4 Leon Hwang       2026-02-19  18248  	return true;
966e89879bbea4 Leon Hwang       2026-02-19  18249  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

