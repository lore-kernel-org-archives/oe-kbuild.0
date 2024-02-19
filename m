Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F29208D3
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708326229; cv=none; b=uNxvgUT/lpqUI0quNMEk2tOsKocjwTRs8NPwq1HAOc/oUfPNQqteR5rY/z0oCTjo3gQz8t5goYFHjbWO7/lNXoMroV1FGrZAPOYYkFQmY+VUkwq/gBBJSC5rxzAehnmtd0vtMf8mwLFvzOL3NTOIAAHMfQpD1nVOPUNljBl/ivg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708326229; c=relaxed/simple;
	bh=zb4HotHoJYoYLWU4szVhgyAvTSz2Rc0cbbOhErMLDCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kHae1E1Ezk5jD9L1u9gD2o+vWrOdV6EGVjBRcNSx6Lr8fA9CYaacW8eH7hWJTpfLe6Lh6EdO+HwDX5YFpp1mVK9By5VxhvpfnmFsMzyRYgChWy1UGxXK1owtVRCvSX0ceHTmq8+EYiqxXZqr0zV7nvdte6TsQp/s0VOYDb8MOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTfccRJm; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTfccRJm"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso100796166b.2
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Feb 2024 23:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708326226; x=1708931026; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hyAX9FR/e1lxZ9EWXTkkj3yByqhkafcG5pIWW80rioo=;
        b=MTfccRJm/Qg1/XbX+de3q/HFisSW41asRsVV0FCcyPUVkShvIVmZYPYE7zjrPm9dxI
         k6yHbo+MH6BsjdjqUgQxB3bjkeknF9gBmvauF4O6dyIxGzTovCzd+7v4QNhP2mokNQfx
         fp/mSJ9J1zfVMuHv4a0NjXvT9UZIEXyNPPMMYbA0xuIfcQbBbYVef+YlrCQlMVUtPmYJ
         7+CxW8WtC632BdPsTnaDV8eqgjzHJQG1fTPqw2AgnL/q6zwlSW179J9Stfqzw5tSPvUO
         YhJ4EhJb/odY6mTfZM+X+oIMcdXWrV5sqUuh0vjePCc3Ph9Of+6pWk+QdOYVAI94LNjK
         LUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708326226; x=1708931026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hyAX9FR/e1lxZ9EWXTkkj3yByqhkafcG5pIWW80rioo=;
        b=VUsMycSH/4hvs9xrhE3O+75d1445EdXtarUTTqDo0/aqjV6XSTEolY/Jt8TW3LrSDb
         vHMZLORdh9Y+E6I05+sGqqKrpZW5Eji2830mj21DzwRTFOWDe8Hugr2DV5a/M75BTKp+
         KGkCK/93IuPBcXzvCRqLsSbUFen2wus4vim0nsnFPwwwf7RQNBlDowBr9MP08dI5qDpU
         VoQL35As149jOYPNncu0gGKAJzLkkvhe9BQL3qFdBlleMh68+dmVHVeM8DLtc6OGaVYb
         k7g5ibl4kWDqGtzAM4FLd9zTLPzXr8yhvU9ABE6P6k2dJ4LyXCXOqHsNv864vm3ee2wJ
         ozpA==
X-Gm-Message-State: AOJu0Ywenhm+Zj2/s/mlr61zDf2v90Kut+1p/i07VRFlULefslfKc031
	DkK5dexOMv92ZA54YZEvg044q0wJg350xMWGMtDNB3z7QLk1x3cJUGn1hHTRRjUknv+8sPJfc0I
	U
X-Google-Smtp-Source: AGHT+IEsxAWeQ+mhBjaepfrAEM0XIvEaEP4hFbQZduopYeBkNXbXxVTrkXou0hqc7E5vnqL62xFQIQ==
X-Received: by 2002:a17:906:c9c6:b0:a3e:272e:7b98 with SMTP id hk6-20020a170906c9c600b00a3e272e7b98mr3058874ejb.40.1708326225687;
        Sun, 18 Feb 2024 23:03:45 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id rs6-20020a170907890600b00a3e48deecd4sm1744095ejc.222.2024.02.18.23.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 23:03:45 -0800 (PST)
Date: Mon, 19 Feb 2024 10:03:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH 4/6] drm/i915/psr: Silence period and lfps half cycle
Message-ID: <022eff5e-47ca-41d6-a3f5-24ebd5d92f5b@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215104934.2395239-5-jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-display-Add-missing-aux-less-alpm-wake-related-bits/20240215-185209
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240215104934.2395239-5-jouni.hogander%40intel.com
patch subject: [PATCH 4/6] drm/i915/psr: Silence period and lfps half cycle
config: i386-randconfig-141-20240217 (https://download.01.org/0day-ci/archive/20240217/202402171830.n4hwR2iD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402171830.n4hwR2iD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:1253 _lnl_compute_aux_less_alpm_params() error: uninitialized symbol 'silence_period'.

vim +/silence_period +1253 drivers/gpu/drm/i915/display/intel_psr.c

e4870a4a3cd051 Jouni Högander 2024-02-15  1235  static int _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
e4870a4a3cd051 Jouni Högander 2024-02-15  1236  					     struct intel_crtc_state *crtc_state)
e4870a4a3cd051 Jouni Högander 2024-02-15  1237  {
e4870a4a3cd051 Jouni Högander 2024-02-15  1238  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
410818227325ec Jouni Högander 2024-02-15  1239  	int aux_less_wake_time, aux_less_wake_lines, switch_to_active_lines,
410818227325ec Jouni Högander 2024-02-15  1240  		silence_period, lfps_half_cycle;
e4870a4a3cd051 Jouni Högander 2024-02-15  1241  
e4870a4a3cd051 Jouni Högander 2024-02-15  1242  	aux_less_wake_time =
e4870a4a3cd051 Jouni Högander 2024-02-15  1243  		_lnl_compute_aux_less_wake_time(crtc_state->port_clock / 1000);
e4870a4a3cd051 Jouni Högander 2024-02-15  1244  	aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
e4870a4a3cd051 Jouni Högander 2024-02-15  1245  						       aux_less_wake_time);
e4870a4a3cd051 Jouni Högander 2024-02-15  1246  
e31171d1611687 Jouni Högander 2024-02-15  1247  	switch_to_active_lines =
e31171d1611687 Jouni Högander 2024-02-15  1248  		intel_usecs_to_scanlines(
e31171d1611687 Jouni Högander 2024-02-15  1249  			&crtc_state->hw.adjusted_mode,
e31171d1611687 Jouni Högander 2024-02-15  1250  			_lnl_compute_switch_to_active_time(crtc_state->port_clock / 1000));
e31171d1611687 Jouni Högander 2024-02-15  1251  
410818227325ec Jouni Högander 2024-02-15  1252  	if (aux_less_wake_lines > 32 || switch_to_active_lines > 32 ||
410818227325ec Jouni Högander 2024-02-15 @1253  	    silence_period > 256 || silence_period < 0 ||
                                                            ^^^^^^^^^^^^^^          ^^^^^^^^^^^^^^
Uninitialized

410818227325ec Jouni Högander 2024-02-15  1254  	    !_lnl_get_silence_period_and_lfps_half_cycle(intel_dp->link_rate,
410818227325ec Jouni Högander 2024-02-15  1255  							 &silence_period,
410818227325ec Jouni Högander 2024-02-15  1256  							 &lfps_half_cycle))
e4870a4a3cd051 Jouni Högander 2024-02-15  1257  		return false;
e4870a4a3cd051 Jouni Högander 2024-02-15  1258  
e31171d1611687 Jouni Högander 2024-02-15  1259  	if (i915->display.params.psr_safest_params) {
e4870a4a3cd051 Jouni Högander 2024-02-15  1260  		aux_less_wake_lines = 32;
e31171d1611687 Jouni Högander 2024-02-15  1261  		switch_to_active_lines = 32;
e31171d1611687 Jouni Högander 2024-02-15  1262  	}
e4870a4a3cd051 Jouni Högander 2024-02-15  1263  
e4870a4a3cd051 Jouni Högander 2024-02-15  1264  	intel_dp->psr.alpm_parameters.aux_less_wake_lines = aux_less_wake_lines;
e31171d1611687 Jouni Högander 2024-02-15  1265  	intel_dp->psr.alpm_parameters.switch_to_active_lines = switch_to_active_lines;
410818227325ec Jouni Högander 2024-02-15  1266  	intel_dp->psr.alpm_parameters.silence_period_sym_clocks = silence_period;
410818227325ec Jouni Högander 2024-02-15  1267  	intel_dp->psr.alpm_parameters.lfps_half_cycle_num_of_syms = lfps_half_cycle;
e4870a4a3cd051 Jouni Högander 2024-02-15  1268  
e4870a4a3cd051 Jouni Högander 2024-02-15  1269  	return true;
e4870a4a3cd051 Jouni Högander 2024-02-15  1270  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

