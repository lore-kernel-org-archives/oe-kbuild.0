Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C3111B4
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 10:13:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso17001875e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689329599; x=1691921599;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nn5pYfLTlnLQ0tR7WYRkaBtGR7PEHI6wD3jih6vNSKY=;
        b=u4MZ1tmy6ngTAkdZGrdj/QlImoV1JRrA1uyOhR2whmFlapF33cGCoCex+FQ1lQJ9h3
         qqHoleg1b9s6OnV5g/pVK7uXapVJgX0BcjyyJYTBXREkAlACX9cpFAyrAlahqRrL9LVX
         WfKU8ro7Q7m/TqWnZdKjBZk7OQeILUXEZQhygZ/e+cnwuL5ew1wGsLT2mjBtnr54u6au
         XVOGf44+RP/WlYuuilyAnY0FO+5SGnWhtTPMOEK+iq1tXP6q+RY3OaMsdovRoPBtWTDV
         9f1vrWATjDGLctGP/PG3wypy8uiC7J21DAyvjiIyaHLK5BlT1XCOhkYp6cvXytg8FOMo
         A+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329599; x=1691921599;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn5pYfLTlnLQ0tR7WYRkaBtGR7PEHI6wD3jih6vNSKY=;
        b=e2HCKojJU8d7x+irujeMMZKFAy7SwWZIEdhUpOi3FJt/m0fTz4o5i0TJkwYo0rpbZF
         hF0Y2V4R0XTlpaL/Bx8QqrNx3KLGoIhCwZ6Eo7GYx6beSDSDsn8zBN6T62JVXYeJ2HzI
         fbjAuzcDL1byabm2t62meLzMMnWdLKM+ppWYyUhnsgv14McYn0EXZFqV7vuoO6Fg6Qk0
         B0RG5ypJcgcgiL7U2wZkutYUsVb3JopByYHy4JB/bvODqIfSVodrKc3WQBlOGI4EMkVf
         LiA7doqBeQ1doZsvz8EUuytg5wGe9RcIwB1gaAm/4cZxr7LvU5H0CVSXI7nRDWHK7Z/t
         ksTQ==
X-Gm-Message-State: ABy/qLYUbkY7YfYEkoGNI99Rb3sSoVRiqhgL3irk03Ft6I1Wp3vDfotc
	bmeCxvUyDjFgBmiQ/Uumw4Pvv10jYICTkGe2xLU=
X-Google-Smtp-Source: APBJJlFoRc9nYeCBEVX/v2sBEcBKH/mtz9fQOH4VHxNTQrSYi9X+umKKYjEUXEZQFj6vMNI1XdCPyg==
X-Received: by 2002:a7b:cb0c:0:b0:3fb:c990:3b2 with SMTP id u12-20020a7bcb0c000000b003fbc99003b2mr3632625wmj.34.1689329599156;
        Fri, 14 Jul 2023 03:13:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c230c00b003f90b9b2c31sm1064283wmo.28.2023.07.14.03.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 03:13:17 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:13:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
 38/42] sound/soc/codecs/lpass-tx-macro.c:847 tx_macro_put_dec_enum() error:
 uninitialized symbol 'dmic_clk_reg'.
Message-ID: <f25abea7-f50d-4e2b-bf16-ad6822cba761@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
head:   e3b5f5398ba6aa06d39089408493667a98fa0a60
commit: 9e9e574223b5ed43d8d8c9ba0faa1546b6d20919 [38/42] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+
config: m68k-randconfig-m041-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140850.pbc9EDI4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140850.pbc9EDI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307140850.pbc9EDI4-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/lpass-tx-macro.c:847 tx_macro_put_dec_enum() error: uninitialized symbol 'dmic_clk_reg'.

Old smatch warnings:
sound/soc/codecs/lpass-tx-macro.c:851 tx_macro_put_dec_enum() error: uninitialized symbol 'dmic_clk_reg'.

vim +/dmic_clk_reg +847 sound/soc/codecs/lpass-tx-macro.c

d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  796  static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  797  				 struct snd_ctl_elem_value *ucontrol)
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  798  {
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  799  	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  800  	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  801  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  802  	unsigned int val;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  803  	u16 mic_sel_reg;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  804  	u16 dmic_clk_reg;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  805  	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  806  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  807  	val = ucontrol->value.enumerated.item[0];
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  808  	if (val >= e->items)
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  809  		return -EINVAL;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  810  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  811  	switch (e->reg) {
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  812  	case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  813  		mic_sel_reg = CDC_TX0_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  814  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  815  	case CDC_TX_INP_MUX_ADC_MUX1_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  816  		mic_sel_reg = CDC_TX1_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  817  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  818  	case CDC_TX_INP_MUX_ADC_MUX2_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  819  		mic_sel_reg = CDC_TX2_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  820  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  821  	case CDC_TX_INP_MUX_ADC_MUX3_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  822  		mic_sel_reg = CDC_TX3_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  823  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  824  	case CDC_TX_INP_MUX_ADC_MUX4_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  825  		mic_sel_reg = CDC_TX4_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  826  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  827  	case CDC_TX_INP_MUX_ADC_MUX5_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  828  		mic_sel_reg = CDC_TX5_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  829  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  830  	case CDC_TX_INP_MUX_ADC_MUX6_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  831  		mic_sel_reg = CDC_TX6_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  832  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  833  	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  834  		mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  835  		break;
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  836  	default:
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  837  		dev_err(component->dev, "Error in configuration!!\n");
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  838  		return -EINVAL;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  839  	}
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  840  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  841  	if (val != 0) {
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  842  		if (widget->shift) /* MSM DMIC */
710ccba0cf0e12 Srinivas Kandagatla           2022-11-15  843  			snd_soc_component_write_field(component, mic_sel_reg,
710ccba0cf0e12 Srinivas Kandagatla           2022-11-15  844  						      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  845  		else if (tx->data->ver <= LPASS_VER_9_0_0)
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  846  			tx_macro_update_smic_sel_v9(component, widget, tx,
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07 @847  						    mic_sel_reg, dmic_clk_reg,

dmic_clk_reg was never set.

9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  848  						    val);
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  849  		else
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  850  			tx_macro_update_smic_sel_v9_2(component, widget, tx,
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  851  						      mic_sel_reg, dmic_clk_reg,
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  852  						      val);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  853  	}
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  854  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  855  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  856  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

