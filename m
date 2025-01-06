Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414B11E505
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156840; cv=none; b=qUyJwZwBrrFpnQ5sRc9QrpDLY/g6STblYiUimfxsYFlZdNU2S8WEz+m/LBJTIuNLGlaxfkmUeEnYf5TOeVnCZv6iNkrg3XMqJfPyGyJS/aci4839fgBcW6+kY9GOOt+HhCK2AJ1Zo/Szk7A5U1+GpL/hVQPF50MpizBaV08mVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156840; c=relaxed/simple;
	bh=4FeV6ZPr3jGASfKnVKZgWxePWMd6SkcF8XKyp9R5ZL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=S5NrKeUYPs/1C1JEXIaCz/lhfDpdPyeAfOK3CPrq1/WqjDjj2Q2KwrziJDpjfdOV2ydthgsk4AO1YywSTYaARXfSfzCeB39V7wpRhRKDgxCUaHtib4kCJDI8QYFMcfubJiXBgCqlzjCbRYieC4sRN2QaxH/b1RsvB3ScZ6/p96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ADp/aGhk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ADp/aGhk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385d7f19f20so6191641f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156836; x=1736761636; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=drQE5mfG6UfY6qmLY59TYj//IZAj9bk+9THlcgSH/G4=;
        b=ADp/aGhkrjjxQqaD3QnVQcjf2AhL+t/nvZKqQ1b1fOMGe5n5pszGR1NLDJI+vJU5J8
         FtKqmLWMC3nUkNnwW1YrzvYTmc15cR7UCjEj+N6fvCy2angquOV2W4jr5468lILFIqV0
         nKNJqqdPYlniEFPCUKKEtjwbK3AiUinGR7BjxBsznmSOu19FC2lq7lDKzFWe73tBiE3G
         JB0ypt8WVKLcej0J/FmCMdU5wuiBr/jXXS5kAOGkV/TBkF7HIlQjXZseLiXj8fctB1yo
         oP5qExz3T2lEoGslYNp7VfDwNw0RVgDu1nxjVyFUWJgOf543HsPFqYirjk5IP5oa4DBA
         SN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156836; x=1736761636;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drQE5mfG6UfY6qmLY59TYj//IZAj9bk+9THlcgSH/G4=;
        b=eTPaQK1eQ3ZF6Ra8YBrP7MLR0tNO4TmNSom+lrZ+00BOuYlnmW8Z7TK+BKYYULQx8a
         xF45BJn6EEzKlG13C/0lyXrSL4bhRM/WvS54zhOhFqv1fBKwvzBHwHNPdRFmDxdPxS1o
         2YioG8TtPTtYHDCpNj4zD3S2tJQWOcz5P/NdS4eyg8oessmXISe9VXRykbBr66sV8YQV
         Wyx2JiUyAbxYAyvsuA1IjTBgtA4mWbU7f+0HKY1VpoFpYbrM1FgWyKkFeOrWjAGWJFgL
         fxwhg58fIU0ewzJ4Ciajk4tg1yWuord2qGdijRRQxFOFpMKvjRrcwSrNSqdW9OtKq7hV
         jkeA==
X-Gm-Message-State: AOJu0YztA4d7bh7H3rZKbQB84Bm9gOjQxXbBwrOTTSmj+AU9BcMj/IxU
	uPBsMxuWpMLfuzshD1DsC51sf6of1rBeCHZqgVCK1oXgY/YA5buw2BOEMOSSJlZa94eROyeLv0O
	h
X-Gm-Gg: ASbGnct/zOkJ7SFGi0opcfdL+B5QvMVapt7V8q1F5sCjhFmkuE1SvokttZZTWSmuy7L
	8WZ2BDpSewJXZvxdxwu7c5EgJlwDXmjQJPgrOsYDvy7CQAlmHA4S/VBzXHULkgPAWmYYAlc9UG3
	3hcpw+zNENFPBfqS/5nhxH0UqsZQnt6wptBIsvDmMHnYygOXvkPd1o4F4JaOZtOm008ZDDoMReD
	HYFOdKX4pBBCm1Ojpb+vxIUAXS0bZzrRkhgQopNKFhgYHjJBzBD27qhpCkgSg==
X-Google-Smtp-Source: AGHT+IE1QA9GPbRGZrUYTaXeGGbTxlnKdAg52i/b75L7wR5SaTyuDJ7JMDNCeaS8O+uXqqVvObeBRQ==
X-Received: by 2002:a05:6000:156b:b0:385:e30a:e0f7 with SMTP id ffacd0b85a97d-38a221fab38mr48263786f8f.22.1736156835874;
        Mon, 06 Jan 2025 01:47:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ace0esm46740074f8f.106.2025.01.06.01.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:47:15 -0800 (PST)
Date: Mon, 6 Jan 2025 12:47:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, mtk22730 <Cloud.Zhang@mediatek.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Cloud Zhang <cloud.zhang@mediatek.com>
Subject: Re: [PATCH] [v1] spi: spi-mtk-nor: Modify the clock architecture of
 nor controller
Message-ID: <63ddb297-822c-47bd-a33b-e2203fe1fad1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212092206.14071-1-Cloud.Zhang@mediatek.com>

Hi mtk22730,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mtk22730/spi-spi-mtk-nor-Modify-the-clock-architecture-of-nor-controller/20241212-172704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20241212092206.14071-1-Cloud.Zhang%40mediatek.com
patch subject: [PATCH] [v1] spi: spi-mtk-nor: Modify the clock architecture of nor controller
config: parisc-randconfig-r073-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232136.cWvRuwoD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412232136.cWvRuwoD-lkp@intel.com/

smatch warnings:
drivers/spi/spi-mtk-nor.c:746 mtk_nor_parse_clk() warn: impossible condition '(cnt == -22) => (1-255 == (-22))'

vim +746 drivers/spi/spi-mtk-nor.c

87d65a23444841 Cloud Zhang   2024-12-12  738  static int mtk_nor_parse_clk(struct device *dev, struct mtk_nor *sp)
87d65a23444841 Cloud Zhang   2024-12-12  739  {
87d65a23444841 Cloud Zhang   2024-12-12  740  	struct device_node *np = dev->of_node;
87d65a23444841 Cloud Zhang   2024-12-12  741  	int ret;
87d65a23444841 Cloud Zhang   2024-12-12  742  	const char *name;
87d65a23444841 Cloud Zhang   2024-12-12  743  	u8 cnt, i;
                                                ^^^^^^

87d65a23444841 Cloud Zhang   2024-12-12  744  
87d65a23444841 Cloud Zhang   2024-12-12  745  	cnt = of_property_count_strings(np, "clock-names");
87d65a23444841 Cloud Zhang   2024-12-12 @746  	if (!cnt || (cnt == -EINVAL)) {
                                                             ^^^^^^^^^^^^^^
cnt needs to be declared as an int.

87d65a23444841 Cloud Zhang   2024-12-12  747  		dev_err(dev, "Unable to find clocks\n");
87d65a23444841 Cloud Zhang   2024-12-12  748  		ret = -EINVAL;
87d65a23444841 Cloud Zhang   2024-12-12  749  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  750  	} else if (cnt < 0) {
                                                           ^^^^^^^
It's weird that this doesn't trigger a warning.

87d65a23444841 Cloud Zhang   2024-12-12  751  		dev_err(dev, "Count clock strings failed, err %d\n", cnt);
87d65a23444841 Cloud Zhang   2024-12-12  752  		ret = cnt;
87d65a23444841 Cloud Zhang   2024-12-12  753  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  754  	} else if (cnt > MAX_CLOCK_CNT) {
87d65a23444841 Cloud Zhang   2024-12-12  755  		ret = -EINVAL;
87d65a23444841 Cloud Zhang   2024-12-12  756  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  757  	}
87d65a23444841 Cloud Zhang   2024-12-12  758  
87d65a23444841 Cloud Zhang   2024-12-12  759  	sp->clock_cnt = cnt;
87d65a23444841 Cloud Zhang   2024-12-12  760  
87d65a23444841 Cloud Zhang   2024-12-12  761  	for (i = 0; i < cnt; i++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

