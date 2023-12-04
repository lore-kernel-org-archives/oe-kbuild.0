Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57196C127
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dz3FkyTT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b595bf5d2so42918655e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Dec 2023 23:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701676239; x=1702281039; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MfuyjfI5rrot2b9MMBgHHf0/98+FnGTUcM8RRu9KaxI=;
        b=dz3FkyTTrd05QOD4CMzPqNrwHczzq2FzL81UFSFSq9YiV7mave2b5ulWUKZ3x91zgL
         8GIg0B6SMR93TP/UDh1ojOLmCxYFOB4/o9SU1VavPJh8EGy9wVk52MfecYmnPsbjykei
         I+UdRnLBlux5mBZ0tbtarrauw5Sp6HNnGtEtlQjsm21oSMxQZJV1LjlsPJt2V7/D/t1y
         DVrsve+VL9/arJ1ieKzZ/e2ZCfwtq9BJV20XwmC6JivfqmOCp1wjnI59ofLaHmHOS63e
         fDSrN7b6CVzZeMC0Xg6QBNsMrgXOuyIXuA+lw5YbjSh7oagZfNoAaDDYxNnwn1hqkfIv
         OZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701676239; x=1702281039;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfuyjfI5rrot2b9MMBgHHf0/98+FnGTUcM8RRu9KaxI=;
        b=WOpkboswhyJsW4FiqhUyXcONE3wkRoiSYdK8Ob+4P+7huJvCnLOQLf2rMP2+PuWRaB
         YwvIwOx9+labfIWd4eATxUAe4ZRgqm9Z8vrLfFBrNWpqNGX+jEVOJuJOkpcDfraN5i83
         GngvHFg9uDvUyetffXTiCTRE9ZTvdFaiCSXsJp/Pm7yBIUFWSn5kSzpt08PW53wFFCL2
         RYvwVnDSqtYnWzlwKm12FAG+SNg8MiRZCLsyw4JUdluB03AuSxp0jgyfui3+55V7xNLE
         2FGvBriiX88oKz7UtSPSRRVJW8Xrs5LoVFLy/oUXlML6pBrQNAA/ZO1uEE3EawjjIsmG
         E6Ow==
X-Gm-Message-State: AOJu0YytA65kdWkCouprulxayYXSut0hRI4yb8RBgRI2SjztgSyBWo7Y
	+bQ66eB/bGzmUYpnhXPfflWBdiU5DOc4Nojeas8=
X-Google-Smtp-Source: AGHT+IHbASZQoLoy6RN0GqhWWZK5CgZjrGLQtZNFlTvZiBv33lm0s2DYxwn7PAhZqQ035t2VpWvJIw==
X-Received: by 2002:a05:600c:219a:b0:40c:d1d:7822 with SMTP id e26-20020a05600c219a00b0040c0d1d7822mr157525wme.135.1701676238639;
        Sun, 03 Dec 2023 23:50:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r21-20020a05600c35d500b0040b3e79bad3sm13947798wmq.40.2023.12.03.23.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 23:50:38 -0800 (PST)
Date: Mon, 4 Dec 2023 10:50:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dragos Bogdan <dragos.bogdan@analog.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>,
	Beniamin Bia <beniamin.bia@analog.com>
Subject: drivers/clk/uniphier/clk-uniphier-mux.c:47
 uniphier_clk_mux_get_parent() warn: signedness bug returning '(-22)'
Message-ID: <6322ed2e-8f2d-49e5-bebf-2fb109790cd4@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dragos,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: f26e433185cb2830b933df3a4d378558fe2fccd9 arch: nios2: Enable the common clk subsystem on Nios2
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231204/202312041541.LK8ZbiIf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312041541.LK8ZbiIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312041541.LK8ZbiIf-lkp@intel.com/

smatch warnings:
drivers/clk/uniphier/clk-uniphier-mux.c:47 uniphier_clk_mux_get_parent() warn: signedness bug returning '(-22)'

vim +47 drivers/clk/uniphier/clk-uniphier-mux.c

734d82f4a678e8 Masahiro Yamada 2016-09-16  31  static u8 uniphier_clk_mux_get_parent(struct clk_hw *hw)
734d82f4a678e8 Masahiro Yamada 2016-09-16  32  {
734d82f4a678e8 Masahiro Yamada 2016-09-16  33  	struct uniphier_clk_mux *mux = to_uniphier_clk_mux(hw);
734d82f4a678e8 Masahiro Yamada 2016-09-16  34  	int num_parents = clk_hw_get_num_parents(hw);
734d82f4a678e8 Masahiro Yamada 2016-09-16  35  	int ret;
c0ce317f0c8863 Masahiro Yamada 2016-10-17  36  	unsigned int val;
734d82f4a678e8 Masahiro Yamada 2016-09-16  37  	u8 i;
734d82f4a678e8 Masahiro Yamada 2016-09-16  38  
734d82f4a678e8 Masahiro Yamada 2016-09-16  39  	ret = regmap_read(mux->regmap, mux->reg, &val);
734d82f4a678e8 Masahiro Yamada 2016-09-16  40  	if (ret)
734d82f4a678e8 Masahiro Yamada 2016-09-16  41  		return ret;
734d82f4a678e8 Masahiro Yamada 2016-09-16  42  
734d82f4a678e8 Masahiro Yamada 2016-09-16  43  	for (i = 0; i < num_parents; i++)
734d82f4a678e8 Masahiro Yamada 2016-09-16  44  		if ((mux->masks[i] & val) == mux->vals[i])
734d82f4a678e8 Masahiro Yamada 2016-09-16  45  			return i;
734d82f4a678e8 Masahiro Yamada 2016-09-16  46  
734d82f4a678e8 Masahiro Yamada 2016-09-16 @47  	return -EINVAL;

kbuild has decided to dig through ancient warnings today.  This function
is type u8 so returning -EINVAL doesn't work.

734d82f4a678e8 Masahiro Yamada 2016-09-16  48  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

