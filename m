Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7B17738
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ride5kxs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c0fc1cf3dso21973675e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 06 Dec 2023 00:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701850232; x=1702455032; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+gV9P+LLtbcV288f8bcnkug+5SdmrVHFSfaWr3WP8M=;
        b=Ride5kxs/w/z9rznE/h5D19fk4CrVn1EzwYO1y01L+RaTDzL0CPAn3vLmHJCnrnk5h
         wVEbTPh9hXfDwSDRjDAridLsOnC3aK2NjPMNDjIH5vOBGJk6du4YJZkc2ZnTfoqOpeuw
         8GELgnhHRS7AWmMRq/2/g+CCStohe6rkT+7IB2BxliBM4SQQYcDsf4FVarvRFzdj9NTO
         kNse7qj3QGPIOGBspaeTgcDOUk3XthQ0kcTEQ37SLZNMul2KCjQOxnuXSeCb8wEDi1mn
         qph0epQCsJSZgwDaPoh2/bAHbTxjdNUuECIKEGx4Uyq+OEI/lGmkhqW8FxKh2wLSmRXv
         ojLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850232; x=1702455032;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F+gV9P+LLtbcV288f8bcnkug+5SdmrVHFSfaWr3WP8M=;
        b=pYPk6gExpa9qjYVq36+RD0E4TP1qSV3q9pZnCSlOulHIxzrmTbZ4lS933rKVk33AhB
         rvB7hp+d7PTiRj+9TZookgst3/QQ36Id17Tw7wb1ofjROLmKjC7mGbg2vcQN1ea+yod+
         99MIFCiy+5qSA6D/lc0CAriduUoTzHAncsS04Z95363hwLlVI7iX0btH38t+HR988VH6
         uU9Rk5Ftih5hi38xX7lFCm43/mdMVyVmUzvZLCLUe/3umjnSV9Tkz88nL/HyQrvtLBaB
         1LUJu6lXhez3JF2jlZFpbQb7xDCPPQZbgsMteT4wl3WJ0YGXzk6atiZ9R5DO+UjOt1j8
         qZdg==
X-Gm-Message-State: AOJu0YzPFVnBtvK1c0ZqVbhxCqovl9yE9SHyGvjdCSnBPtMHpbOe/nWE
	IIFdt6VVN9Txg7a0xkmM/TYBfA==
X-Google-Smtp-Source: AGHT+IF3+jzIgYagYuozgaSQvR5QgLTRcig4lGIsn6hG2LwuH0IBqpbb5tT5ziahhcs3FJWNjZfgbA==
X-Received: by 2002:a7b:cb91:0:b0:40b:5e59:c591 with SMTP id m17-20020a7bcb91000000b0040b5e59c591mr305772wmi.187.1701850231928;
        Wed, 06 Dec 2023 00:10:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f855:6075:9365:8b70? ([2a01:e0a:982:cbb0:f855:6075:9365:8b70])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c471500b0040836519dd9sm21114204wmo.25.2023.12.06.00.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 00:10:31 -0800 (PST)
Message-ID: <99ec05e1-8bcd-48a5-84b6-760ac7c93317@linaro.org>
Date: Wed, 6 Dec 2023 09:10:30 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US, fr
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1a09512c-aaff-4fb6-914e-db755ce6e667@suswa.mountain>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <1a09512c-aaff-4fb6-914e-db755ce6e667@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 06/12/2023 06:39, Dan Carpenter wrote:
> Hi Neil,
> 
> kernel test robot noticed the following build warnings:

Thanks for the report, I'll fix all this
Neil

> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-dt-bindings-document-WCD939x-Audio-Codec/20231202-000916
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa%40linaro.org
> patch subject: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
> config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312060127.FLhplIP3-lkp@intel.com/
> 
> New smatch warnings:
> sound/soc/codecs/wcd939x.c:3168 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3221 wcd939x_swap_gnd_mic() warn: signedness bug returning '(-22)'
> 
> Old smatch warnings:
> sound/soc/codecs/wcd939x.c:3170 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3173 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3174 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3176 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3177 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3179 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> 
> vim +/wcd939x +3168 sound/soc/codecs/wcd939x.c
> 
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3164  static int wcd939x_typec_mux_set(struct typec_mux_dev *mux,
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3165  				 struct typec_mux_state *state)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3166  {
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3167  	struct wcd939x_priv *wcd939x = typec_mux_get_drvdata(mux);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3168  	unsigned int previous_mode = wcd939x->typec_mode;
> 
> The Kconfig should probably depend on CONFIG_TYPEC to avoid a crash here.
> 
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3169
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3170  	if (!wcd939x->wcd_mbhc)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3171  		return -EINVAL;
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3172
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3173  	if (wcd939x->typec_mode != state->mode) {
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3174  		wcd939x->typec_mode = state->mode;
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3175
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3176  		if (wcd939x->typec_mode == TYPEC_MODE_AUDIO)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3177  			return wcd_mbhc_typec_report_plug(wcd939x->wcd_mbhc);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3178  		else if (previous_mode == TYPEC_MODE_AUDIO)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3179  			return wcd_mbhc_typec_report_unplug(wcd939x->wcd_mbhc);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3180  	}
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3181
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3182  	return 0;
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3183  }
> 
> [ snip ]
> 
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3216  static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component, bool active)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3217  {
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3218  	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3219
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3220  	if (!wcd939x->typec_analog_mux || !wcd939x->typec_switch)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3221  		return -EINVAL;
> 
> This is type bool.  return false?
> 
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3222
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3223  	/* Report inversion via Type Switch of USBSS */
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3224  	return typec_switch_set(wcd939x->typec_switch,
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3225  				wcd939x->typec_orientation == TYPEC_ORIENTATION_REVERSE ?
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3226  					TYPEC_ORIENTATION_NORMAL : TYPEC_ORIENTATION_REVERSE);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3227  }
> 

