Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66B93793AC
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253528; cv=none; b=YTMkKGdUTWkWo0+89mPR/PB58goN30kzU6FDMu0Tole20Ush5ZaVMC1gxVvTwX5fYKcIyXqwPfPGpTBagEpdCh/DN0ucFygBNWTWFu4SOsX/84IVSs7CpFgwBZgd15J0TlYiKa1LAjoeAIkyNEvv0CxYM5rjgT+l++bcsvxvGYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253528; c=relaxed/simple;
	bh=PLCs5NV8GSZH9as7kyIhc7mjPehoJUe5dTLfJEwb4As=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDjRotuxvrA7cOsjk5LQ69M8o3XruMNVozx+llvAIrVNVVdKZp4w+PayOLJnhkO7HkpNPfbG7HzAO3RjejKJXZrj+DnNTN52e+Lhs7cN4xFwZtxy9N7lSHOax42zgGpfgt/N5HublCT1GSi4DnUmPocuxSw22uvuGsTVW/Cdy7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mxx0pVuv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mxx0pVuv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so28880335e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774253522; x=1774858322; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qU2YzTy7ZSWGexZVKGiNCKGEO0C+xkUwcvfXto+gkIw=;
        b=mxx0pVuv2ArW8QHKQbx8Z67sycp+Gn5dbIyaEM48uV9xnYmRWXHyVlwDcTC2tWdWiT
         bWBC7VgGHDqHyG9G6aprv2jy10b2nE5uvRW7M15kFn38776vhHELlu51/zC6ExWn/CLG
         A8XT7bfWnb1fVxUL7eqBUX9p/g8ZDDeTewIH/eCYPK6iqU2OELQyP2wTlH4B1AIIwN9W
         Q59dJGMmTCPMvCyJhlRmFG5jMBYfrmOIPcUkKbcTEU9w5HVAjhn5VZmMUNL0qjDgA0RM
         1SOP3lxtzPRN/uBMXYhk+/gn17FMOn9O6nM3Qvvqn85db2CoJB9YGQIA9YETzCJ9LcR0
         3bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253522; x=1774858322;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qU2YzTy7ZSWGexZVKGiNCKGEO0C+xkUwcvfXto+gkIw=;
        b=DVyODmNN3rHl4X4quUQ78m2jhsSPXq0ACaFxJT4oD0XYCNa33CJP32xrL3wllU1Nuj
         MIZdoVDoPWvCriF+3BMJYEgNPLdq9cQkVmgBwbklZ59+CQur6nVccw2hO93lUoFzhqRr
         esrINWnnvHvQLJJ01t76V9j0aBQ4z5kY5Hpg+aVyKpA8yAqsEiA5UV0824+1HFH85SiP
         o3USz2ErNBwMkHAomlya/lhYPZdMP4fxaIxaGD8j+825YoKbq4kiNXwn7AkNgV8balUz
         9mi8LhNi6yOkLWw9TtKmxCmhmHccT/eND8Apmgzpujalz8iy9QcNPsl+Y49AwLiR21Nn
         qb7A==
X-Gm-Message-State: AOJu0YwDviuQwoqlPEJXN6Av0vlZRAqCwnJisc8xjSnS+HUmDRrVJlL6
	2m/mhMVmnPvwUv5aSheoqMUm+Ex+DZI0f5TCtZrWcGakZHDgFv5EGQSF9XJcBkdPrhyq3efKP/d
	gZx8N
X-Gm-Gg: ATEYQzwIOETTkhrFk5JeBnKQvEQDNyOEaDOonMMfRUpBMYVlYv16GhGzG9gCmpfXsvU
	vaRngyeVQi84wkAkJpoEp1DWjtnVJvWHv+XQavSi7PZvSgM6aC98xXW0gpvxCTvLT9ExnHGhE2E
	bu2b5zUrqiYZaP96LIj8Ae9271cTHaXIWKXjG6HlSfp8B0loKMy5QT2uJkzNSeEAyffvul7n3ZK
	3GhR3/rK4q5QjOYtUcMpHvQH/tAzUvAsVcpLtbvpD0cGFGpMBj7wvtRVNDamMW1yogwnzSkP3fg
	TMQdgc3rvQSx+48FyOmSo9iPk/O8wz00ouL8FP2gTzCiYzKp22n1mHa3dMc6q5MIXSTwBCfbIMg
	Zy31ysLAMHsb1QCD6izSnPJnAPKbQwHBgwvajhNkaQ923kOtUSxcsKUCCqLrxRzVuV4bATH++ZP
	H/GpfTZ+Qva0O8SqzKSxMwGGD/hj4Z
X-Received: by 2002:a05:600c:1f86:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-486fedb5916mr170412585e9.12.1774253521680;
        Mon, 23 Mar 2026 01:12:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc4d90f4sm365081475e9.1.2026.03.23.01.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:12:01 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:stacklive 12/29] kernel/bpf/liveness.c:1991
 print_subprog_arg_access() warn: variable dereferenced before check
 'info->at_in' (see line 1953)
Message-ID: <202603222317.iHk1aquO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260323081158.Its0y99iZ4aTHxrlRq4-fr7HjI1g3PRS1YGL5foHfVA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   bbe7785d7fc2e977a12e62212e014ed6ff8f05f2
commit: 732f9788ec36481a13570fef2056408590d06413 [12/29] bpf: Add per-subprog arg tracking analysis
config: microblaze-randconfig-r072-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222317.iHk1aquO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603222317.iHk1aquO-lkp@intel.com/

smatch warnings:
kernel/bpf/liveness.c:1991 print_subprog_arg_access() warn: variable dereferenced before check 'info->at_in' (see line 1953)

vim +1991 kernel/bpf/liveness.c

732f9788ec3648 Alexei Starovoitov 2026-03-08  1912  static void print_subprog_arg_access(struct bpf_verifier_env *env,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1913  				     int subprog,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1914  				     struct subprog_at_info *info,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1915  				     struct arg_track (*at_stack_in)[MAX_ARG_SPILL_SLOTS],
732f9788ec3648 Alexei Starovoitov 2026-03-08  1916  				     struct insn_live_regs *state,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1917  				     u64 (*nonlocal_use)[MAX_CALL_FRAMES][2],
732f9788ec3648 Alexei Starovoitov 2026-03-08  1918  				     u64 (*nonlocal_def)[MAX_CALL_FRAMES][2])
732f9788ec3648 Alexei Starovoitov 2026-03-08  1919  {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1920  	struct bpf_insn *insns = env->prog->insnsi;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1921  	int start = env->subprog_info[subprog].start;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1922  	int len = info->len;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1923  	int i, r, f;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1924  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1925  	if (!(env->log.level & BPF_LOG_LEVEL2))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1926  		return;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1927  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1928  	verbose(env, "subprog#%d %s:\n", subprog,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1929  		env->prog->aux->func_info
732f9788ec3648 Alexei Starovoitov 2026-03-08  1930  		? btf_name_by_offset(env->prog->aux->btf,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1931  				     btf_type_by_id(env->prog->aux->btf,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1932  						    env->prog->aux->func_info[subprog].type_id)->name_off)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1933  		: "");
732f9788ec3648 Alexei Starovoitov 2026-03-08  1934  	for (i = 0; i < len; i++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1935  		int idx = start + i;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1936  		bool has_extra = false;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1937  		u8 cls = BPF_CLASS(insns[idx].code);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1938  		bool is_ldx_stx_call = cls == BPF_LDX || cls == BPF_STX ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  1939  				       insns[idx].code == (BPF_JMP | BPF_CALL);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1940  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1941  		verbose(env, "%3d: ", idx);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1942  		verbose_insn(env, &insns[idx]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1943  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1944  		/* Collect what needs printing */
732f9788ec3648 Alexei Starovoitov 2026-03-08  1945  		has_extra = !spis_is_zero(state[idx].stack_def) ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  1946  			    !spis_is_zero(state[idx].stack_use);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1947  		for (f = 0; f < MAX_CALL_FRAMES; f++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1948  			if (!spis_is_zero(nonlocal_use[i][f]) ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  1949  			    !spis_is_zero(nonlocal_def[i][f]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1950  				has_extra = true;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1951  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1952  		if (is_ldx_stx_call &&
732f9788ec3648 Alexei Starovoitov 2026-03-08 @1953  		    info->at_in[i][0].frame != ARG_UNVISITED) {
                                                                    ^^^^^^^^^^^^^^^^^
info->at_in dereferenced without checking

732f9788ec3648 Alexei Starovoitov 2026-03-08  1954  			for (r = 0; r < MAX_BPF_REG - 1; r++)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1955  				if (info->at_in[i][r].frame != ARG_NONE &&
732f9788ec3648 Alexei Starovoitov 2026-03-08  1956  				    info->at_in[i][r].frame != ARG_UNVISITED)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1957  					has_extra = true;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1958  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1959  		if (is_ldx_stx_call) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1960  			for (r = 0; r < MAX_ARG_SPILL_SLOTS; r++)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1961  				if (at_stack_in[i][r].frame != ARG_NONE &&
732f9788ec3648 Alexei Starovoitov 2026-03-08  1962  				    at_stack_in[i][r].frame != ARG_UNVISITED)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1963  					has_extra = true;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1964  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1965  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1966  		if (!has_extra) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1967  			if (bpf_is_ldimm64(&insns[idx]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1968  				i++;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1969  			continue;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1970  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1971  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1972  		bpf_vlog_reset(&env->log, env->log.end_pos - 1);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1973  		verbose(env, " //");
732f9788ec3648 Alexei Starovoitov 2026-03-08  1974  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1975  		if (!spis_is_zero(state[idx].stack_def))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1976  			verbose(env, " stack_def=%llx:%llx",
732f9788ec3648 Alexei Starovoitov 2026-03-08  1977  				state[idx].stack_def[1], state[idx].stack_def[0]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1978  		if (!spis_is_zero(state[idx].stack_use))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1979  			verbose(env, " stack_use=%llx:%llx",
732f9788ec3648 Alexei Starovoitov 2026-03-08  1980  				state[idx].stack_use[1], state[idx].stack_use[0]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1981  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1982  		for (f = 0; f < MAX_CALL_FRAMES; f++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1983  			if (!spis_is_zero(nonlocal_use[i][f]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1984  				verbose(env, " nonlocal_use[%d]=%llx:%llx",
732f9788ec3648 Alexei Starovoitov 2026-03-08  1985  					f, nonlocal_use[i][f][1], nonlocal_use[i][f][0]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1986  			if (!spis_is_zero(nonlocal_def[i][f]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1987  				verbose(env, " nonlocal_def[%d]=%llx:%llx",
732f9788ec3648 Alexei Starovoitov 2026-03-08  1988  					f, nonlocal_def[i][f][1], nonlocal_def[i][f][0]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1989  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1990  
732f9788ec3648 Alexei Starovoitov 2026-03-08 @1991  		if (is_ldx_stx_call && info->at_in &&
                                                                                       ^^^^^^^^^^^
This check is too late.

732f9788ec3648 Alexei Starovoitov 2026-03-08  1992  		    info->at_in[i][0].frame != ARG_UNVISITED) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1993  			for (r = 0; r < MAX_BPF_REG - 1; r++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1994  				if (info->at_in[i][r].frame == ARG_NONE ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  1995  				    info->at_in[i][r].frame == ARG_UNVISITED)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1996  					continue;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1997  				verbose(env, " r%d=", r);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1998  				verbose_arg_track(env, &info->at_in[i][r]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1999  			}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2000  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2001  
732f9788ec3648 Alexei Starovoitov 2026-03-08  2002  		if (is_ldx_stx_call) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  2003  			for (r = 0; r < MAX_ARG_SPILL_SLOTS; r++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  2004  				if (at_stack_in[i][r].frame == ARG_NONE ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  2005  				    at_stack_in[i][r].frame == ARG_UNVISITED)
732f9788ec3648 Alexei Starovoitov 2026-03-08  2006  					continue;
732f9788ec3648 Alexei Starovoitov 2026-03-08  2007  				verbose(env, " fp%+d=", -(r + 1) * 8);
732f9788ec3648 Alexei Starovoitov 2026-03-08  2008  				verbose_arg_track(env, &at_stack_in[i][r]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  2009  			}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2010  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2011  
732f9788ec3648 Alexei Starovoitov 2026-03-08  2012  		verbose(env, "\n");
732f9788ec3648 Alexei Starovoitov 2026-03-08  2013  		if (bpf_is_ldimm64(&insns[idx]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  2014  			i++;
732f9788ec3648 Alexei Starovoitov 2026-03-08  2015  	}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2016  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

