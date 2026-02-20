Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027FE31A7E1
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771613911; cv=none; b=Tj2CYBcJmpHv+m7HDo0WTvBMaz1nuq29rW54tosa0HlMHsDp+HfNiWjn7EXEAIWsX6PWxt9fmAT7A+OU0zM2xkqqOZp3tiGvUIElKFfJSywyfKxvC7L7oPPJOUkt076p7Mp2wB7HHz/saxqxZHb06n3g1xWKJLX8OgYMRMrBmx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771613911; c=relaxed/simple;
	bh=Dop34JEoVBBAxQySukbwRZ8BZLG/OxLR8NbiXEwO2dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npkmHQ2ld3fCIsjByweh3J/LAMduPQyXteoLcHbbzh9niqGRZfUq6PJ7OZnp+xN6/zNNuVN50Tt0v+cIyem+5MD3NrTy8HpO89ycw+WeEsR/icjxJpGJfDowkOy44mE3E9NNcGsj1LyVaI2RPHOcJU6PQXFySSXOKcwSqPS1Fhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUUDNwOC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUUDNwOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771613908; x=1803149908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dop34JEoVBBAxQySukbwRZ8BZLG/OxLR8NbiXEwO2dc=;
  b=MUUDNwOCEL8EzVu/EGXzEkRn45ei+vogJKpM7JGlJNM+YoaSoF7YKjwd
   OA0bzsx72zZVAM0jfHEVyRFXRbcvkR0LoPoJzCSR4XkmnVM0kG/DF+MPW
   3c7RWn2Y6CqBOCJDQ2nkEogzH6ktoIdrkvcKQy4AMHhb/6Bso1BmFyOCH
   TQYSK76fuscsCZtlIAc5/pTn4VHWDtpT/CB0sEQBVTkBcn0crV4aTFWUN
   0MelmAWjCs6eW8jPD+s28uxD1MIs04q1mkpTz4BV2TjrCoujk41VyV11J
   GvPNaHyP+AKqndgfe1meaLD2q0jS3HBP83aG3AQmUEJrkRQeNIufTLgs0
   Q==;
X-CSE-ConnectionGUID: 95n7rfLwT/asRIo11fyfvg==
X-CSE-MsgGUID: WkdsUsPOQeGS8MeMxPBE0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76574274"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76574274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:58:27 -0800
X-CSE-ConnectionGUID: vhejU8ELT7Cniiwj3z+Rdg==
X-CSE-MsgGUID: BjhcDv4dR/2p/neyfr+5qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219468156"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Feb 2026 10:58:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtVhn-000000014P2-34c0;
	Fri, 20 Feb 2026 18:58:23 +0000
Date: Sat, 21 Feb 2026 02:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260219142933.13904-2-leon.hwang@linux.dev>
References: <20260219142933.13904-2-leon.hwang@linux.dev>
TO: Leon Hwang <leon.hwang@linux.dev>
TO: bpf@vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Song Liu <song@kernel.org>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: John Fastabend <john.fastabend@gmail.com>
CC: KP Singh <kpsingh@kernel.org>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Hao Luo <haoluo@google.com>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Puranjay Mohan <puranjay@kernel.org>
CC: Xu Kuohai <xukuohai@huaweicloud.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Will Deacon <will@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: x86@kernel.org
CC: "H . Peter Anvin" <hpa@zytor.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Leon Hwang <leon.hwang@linux.dev>
CC: Peilin Ye <yepeilin@google.com>
CC: Luis Gerhorst <luis.gerhorst@fau.de>
CC: Viktor Malik <vmalik@redhat.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Leon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Introduce-64-bit-bitops-kfuncs/20260219-223550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260219142933.13904-2-leon.hwang%40linux.dev
patch subject: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210241.E7Q88vvq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602210241.E7Q88vvq-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:18245 bpf_kfunc_is_fastcall() error: buffer overflow 'special_kfunc_list' 64 <= 64

vim +/special_kfunc_list +18245 kernel/bpf/verifier.c

5b5f51bff1b66c Eduard Zingerman 2024-07-22  18222  
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
966e89879bbea4 Leon Hwang       2026-02-19  18246  		return bpf_jit_inlines_kfunc_call(bpf_ror64);
966e89879bbea4 Leon Hwang       2026-02-19  18247  
966e89879bbea4 Leon Hwang       2026-02-19  18248  	return true;
966e89879bbea4 Leon Hwang       2026-02-19  18249  }
966e89879bbea4 Leon Hwang       2026-02-19  18250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
