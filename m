Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB4374746
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782516; cv=none; b=S00NSZR/y3m32vvQTDVWH3HFYLJ9Li9cR8uJEnvwPObMwqeq+lihJwyFaG1nd5320zwoCC3Fqbjk3oh2280orKKRnBMmqCXOh9swqGigtY7T6d8erPXrxVA87IMRgfGnAjdqjN3R4FqoBMPl6y44HQT1tlK9VsoyI4tD7JOLU1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782516; c=relaxed/simple;
	bh=6UStxTN0ltHJ/GkEo7bx/EfcLlbOuCrV481hg4emXsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=s+0Bk5kBeSXXyiHGiD9Dd/vXgNQ5aZb1MfN9xORQRBAJ6aE2PlJgZ9dPtPFMq2kLWwQMAaj9fDeTKQ/LSVUFIEm+JT1e8gjZv5hWH+8QeE6739UJ/KrRw7WKVrxPaja+AG0LjHcrAZmBEeEIqj/bQtV82XqypwjiKTdoD7L9hIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcIjlPhG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcIjlPhG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso78064835e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 05 Mar 2026 23:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772782513; x=1773387313; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6XoprPGy2obVCQE2uQgSeOts5auhhet8rC7x7T+9nI=;
        b=pcIjlPhGuIOQbb80tXEX7J7v7VlcFxzWy77OCDiC6uRkM2wqaKToja7X42fml42iVB
         JQ3aJsaW4v9tF+7fHhjnyWLPRIcTV3lsvcjOzibbG9dmQ9rwja0E5evJV8aMqLQgBi7+
         RXyqy26qdC7ii2a4Y/hNfs3oriJIfTTJma+9EZoZjEQKi+rFTbC5baL2IffFNgAICfgD
         gHou0Y94WkCyJ3+LfiaoPx6Pj/ved3Lggd+NklqpYAzmuFLSyauNyt99qhlHwUY0mfi2
         ig9v16q98l9UBNfZ6OjEM/3t2Zxq4ikuCl0ytcHpomVwZXbhvlsKkQNL9knzj3qDzNAl
         Sv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772782513; x=1773387313;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6XoprPGy2obVCQE2uQgSeOts5auhhet8rC7x7T+9nI=;
        b=MQCje54TuRP+2WeM57vN9+5psH7nTj8FzTzj8pn4W8KJH+VdikCyIcX5O6Vvlw8OoO
         EC+Yzm/LjV2zhi+wMSVDGrFlLcYYpPsZI3UNIGoQWCQMq1Qj9wfgC3coMju9y6WkVtYI
         Cd/oyDBlji8MY2poJY6RQBEk9bqoHTHjKMKYyEgD4lVg585k3aNeXNxRirrvfk0GN2hR
         DprraVFRCQDoWgXmE7JbiHn6OB09riq3K9CeWrtD7n1mu15Od8haR9mvbkn6ZqCqdIwy
         hHHK7euCpppSopptAZnfVEUosa9qzsfV3EN156jhM6e0HxR8baacVEreZ+Jpj+LYJOMp
         +O/g==
X-Gm-Message-State: AOJu0YyaORlXRec+NsRe0PTzpoRUKY4yXtvKsOwJaG2dgXfAwo3GsDRg
	Yyyi0R9EZQv8rGlk9z/ddoK1PvuWft9qVKuktGkJdrTUkDv+mjvKVP0gZZKJENfxC5xeVkOvM1x
	6lyga
X-Gm-Gg: ATEYQzzZE5w4i31ED/zzO/PQT3TVU5F6m9mBJ96TPaLX8uNxvReZF2hocEVlsksPz0Y
	HMCFqpKYrYawZYGnn5Bvyg5fA4ppJh+9guEp5vWGQ1k7OHiW8YoAkWT1UhR+DeXwNNUuYSuKXq0
	lycZokaYdmoSeg30HyPHMuSxloDs0S4QbI5n/fru4BR1kWnnN5GP5uvpldvGfB8djmsFI+D/3eB
	ERQNrJ3KPCo4Lv9qSPq1DzktRSdec9BvNXmy645eroZV/wDPmh+7QC44MFX7246OlBy/JR6eLH0
	9c/cUVigzVqKP182IrOFUcj5dVLaIVe3kHZu+iRLTABm9O2s7FUo+1lRDJzzoUmOQiT/PEx4ZIY
	3BWnilc0Y7ckQGw8pyD2/SWVi6YgJgGVFkhrTrpve+/LVtYGuhxUHFPeA234voJxpBg7/HaFnBe
	utuTiHPCpcuxVHsEgmSab92p1K6DeYzyzJ+evfii8=
X-Received: by 2002:a05:600c:4e89:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-48526951430mr16785555e9.21.1772782512990;
        Thu, 05 Mar 2026 23:35:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm1953812f8f.25.2026.03.05.23.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:35:12 -0800 (PST)
Date: Fri, 6 Mar 2026 10:35:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shenwei Wang <shenwei.wang@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Message-ID: <202603060910.Q5zBquzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304211808.1437846-5-shenwei.wang@nxp.com>
Message-ID: <20260306073509.S83Am6de0Q5ydNDQUNx30xRL8r-AAOnztWyjzwaF0qg@z>

Hi Shenwei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/docs-driver-api-gpio-rpmsg-gpio-driver-over-rpmsg-bus/20260305-052440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260304211808.1437846-5-shenwei.wang%40nxp.com
patch subject: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
config: x86_64-randconfig-161-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060910.Q5zBquzF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603060910.Q5zBquzF-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-rpmsg.c:188 rpmsg_gpio_imx_send_fixed_up() error: buffer overflow 'imx_std_cmd_map' 7 <= 27

vim +/imx_std_cmd_map +188 drivers/gpio/gpio-rpmsg.c

49a0cb20cd49a59 Shenwei Wang 2026-03-04  176  static int rpmsg_gpio_imx_send_fixed_up(struct rpmsg_gpio_info *info,
49a0cb20cd49a59 Shenwei Wang 2026-03-04  177  				   struct rpmsg_gpio_packet *msg)
49a0cb20cd49a59 Shenwei Wang 2026-03-04  178  {
49a0cb20cd49a59 Shenwei Wang 2026-03-04  179  	struct rpmsg_gpio_nxp_packet imx_msg;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  180  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  181  	if (msg->cmd >= sizeof(imx_std_cmd_map))

This looks like a sizeof() vs ARRAY_SIZE() bug.

49a0cb20cd49a59 Shenwei Wang 2026-03-04  182  		return -EINVAL;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  183  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  184  	imx_msg.id = IMX_RPMSG_ID;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  185  	imx_msg.vendor = IMX_RPMSG_VENDOR;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  186  	imx_msg.version = IMX_RPMSG_VERSION;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  187  	imx_msg.type = msg->type;
49a0cb20cd49a59 Shenwei Wang 2026-03-04 @188  	imx_msg.cmd = imx_std_cmd_map[msg->cmd];
                                                                              ^^^^^^^^
Out of bounds.

49a0cb20cd49a59 Shenwei Wang 2026-03-04  189  	imx_msg.port_idx = msg->port_idx;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  190  	imx_msg.line = msg->line;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  191  	imx_msg.val1 = msg->val1;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  192  	imx_msg.val2 = msg->val2;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

