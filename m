Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC82CA64
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 05:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cuQyob0T"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66cso56336495e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 05 Dec 2023 21:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701841153; x=1702445953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O4u7u9EhMLinCMKXbsJZZCgBovG/kdzoMMlzODKZOcY=;
        b=cuQyob0TGD+XwyNyPwTdIH6AbVl4MawXujWBwfUTORuOKmEmX1dZcUydwt5527navs
         0QDtRJWpx6KaPihNCxQ+l8VfsPsAD/20vBO/bYyd/+qb6feBruz+0/sWZS/BSszbIZDy
         Qx0pdLo4ie7uKe614ZlzEEsYugdveroRU1+A4ig91epuRlzUiKHu3+wcDSaZMRyuqQ1u
         Tq7oXds1p6VchPv17432dioxcctLm5FfCakPbeNg5wuHVqmn94/gsA07aEQm/sI8EJTR
         RrIhrPwAK/1Aqj4Fbret8CnUOTtsvJQWdNJXovKk/QthTEYMP3YkSR7Iu2ijFmbCM8Nb
         Hx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701841153; x=1702445953;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4u7u9EhMLinCMKXbsJZZCgBovG/kdzoMMlzODKZOcY=;
        b=lgRqXcxzKHDXHEKUssWzxV8myabPKlEypZpItMPAwypjRYkjagImRw+2MqqviMnuqa
         ULXaTpGOYiVbeuIErhUskySvESyPXjLnlOW4bXrQKuhc4PC2vDZ28rT2RucHxVw9onCN
         Z8A08g92QY8BUfp7kpcDhHJH+WJTOOPuBI3N8Na1sEe3XuwlURu/qqALrsYWMj7bFzmO
         guS4Huypp0RPv9V0BHoPjzHR7sd//1XgXNGvqD6eq7lYrMgp84CLKOvFVH4C2pVvqLfR
         DyV5D8D7q1TdBR7atNf2d1B/DwVmiZOirbNaxqFG6NCca6XpmktcHA7kumKZhtmbQ/Ci
         RQ8Q==
X-Gm-Message-State: AOJu0YyvcLzRrHz7z/rktr6UGmgVF50pHDnGMf9DPcQjFXdhaden3FZs
	N53NEAjVidobAMVqHcUosVFWnDLWFPqVeZ3Nx4A=
X-Google-Smtp-Source: AGHT+IFAy6YDNnloe+CZg+064fYW1hphxl7Aimv9oj+A8PdlsOtVdmaSug/MC0yOqj37RYmzI49Gwg==
X-Received: by 2002:a05:600c:4f15:b0:40c:192f:6ae8 with SMTP id l21-20020a05600c4f1500b0040c192f6ae8mr258952wmq.115.1701841153488;
        Tue, 05 Dec 2023 21:39:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm20593171wmb.6.2023.12.05.21.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 21:39:13 -0800 (PST)
Date: Wed, 6 Dec 2023 08:39:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <1a09512c-aaff-4fb6-914e-db755ce6e667@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>

Hi Neil,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-dt-bindings-document-WCD939x-Audio-Codec/20231202-000916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa%40linaro.org
patch subject: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312060127.FLhplIP3-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/wcd939x.c:3168 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3221 wcd939x_swap_gnd_mic() warn: signedness bug returning '(-22)'

Old smatch warnings:
sound/soc/codecs/wcd939x.c:3170 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3173 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3174 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3176 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3177 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3179 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()

vim +/wcd939x +3168 sound/soc/codecs/wcd939x.c

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3164  static int wcd939x_typec_mux_set(struct typec_mux_dev *mux,
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3165  				 struct typec_mux_state *state)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3166  {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3167  	struct wcd939x_priv *wcd939x = typec_mux_get_drvdata(mux);
6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3168  	unsigned int previous_mode = wcd939x->typec_mode;

The Kconfig should probably depend on CONFIG_TYPEC to avoid a crash here.

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3169  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3170  	if (!wcd939x->wcd_mbhc)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3171  		return -EINVAL;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3172  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3173  	if (wcd939x->typec_mode != state->mode) {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3174  		wcd939x->typec_mode = state->mode;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3175  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3176  		if (wcd939x->typec_mode == TYPEC_MODE_AUDIO)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3177  			return wcd_mbhc_typec_report_plug(wcd939x->wcd_mbhc);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3178  		else if (previous_mode == TYPEC_MODE_AUDIO)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3179  			return wcd_mbhc_typec_report_unplug(wcd939x->wcd_mbhc);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3180  	}
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3181  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3182  	return 0;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3183  }

[ snip ]

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3216  static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component, bool active)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3217  {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3218  	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3219  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3220  	if (!wcd939x->typec_analog_mux || !wcd939x->typec_switch)
6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3221  		return -EINVAL;

This is type bool.  return false?

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3222  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3223  	/* Report inversion via Type Switch of USBSS */
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3224  	return typec_switch_set(wcd939x->typec_switch,
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3225  				wcd939x->typec_orientation == TYPEC_ORIENTATION_REVERSE ?
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3226  					TYPEC_ORIENTATION_NORMAL : TYPEC_ORIENTATION_REVERSE);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3227  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

