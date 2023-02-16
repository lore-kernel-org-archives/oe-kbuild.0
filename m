Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E420FB;
	Thu, 16 Feb 2023 07:16:47 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id dr8so2860257ejc.12;
        Wed, 15 Feb 2023 23:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCHIGxN51CRobbkEADA4BzKdh7TSEUJqG3lA19pd1rE=;
        b=EkJYWYVMU02XsHWCdGrlqqXEiRwq6rVsf0iqekUAtUZviaLpx6p2a7wbkPr3GQRzpf
         LxQG+UTXecBBlNERPA8JhvSKWtnXFNkWNGQBBdP93VVwgVKkVK8P9XN0EjvQesTxJpY+
         +9XjCxm4he6u6OPDt59d2ls8lNEkcQbhx8OzDTMosigcRbInHS6CNu7qTcsXTpt03chp
         W/FimudEqy5MEVwuwFRDXqfPKBTWdRUhkSHAOik2CYAS4Wjraa5VAFvMR2vBGoawvBQ7
         oDBY/yl8dYV1eV9CFZiuk81mwnKk9EstsnMG58fSSVy1Y00YKTW9OQly1tCDA/BAu91F
         OTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCHIGxN51CRobbkEADA4BzKdh7TSEUJqG3lA19pd1rE=;
        b=B1nzfxiEyOF0olDFVmyaN+VvC+R9ZLC6pLHwO4mRI+a+Z9pGheENxMQHu/Bg21kkYP
         exodLjHNazP3ZEwncG4i+BLU3QbMMtLkzOepRl6kqSiuNFM8ACEZtOWJXZo1D9DYM/YG
         belXisVizsV+3I54yw60hIA/9DzcVHeLip81h4Mehqk5cTJPxgsI4J0f9ivPcx34ZpI8
         WLu+a+LCVzXZg6KPCunqrZfvpjpTKSn5aIkF8WFH8YH1XAbo9GezJDR/2PLy5IdEPkI9
         2YNeSKr5fhoJYUJQ1Lxrl2IzT/hG3Q6WohSNYBru0PofSNSoX5M2KOcXKIDUbkZCGXLh
         sqyg==
X-Gm-Message-State: AO0yUKURJ4NE00FBVKyFwLNAxT1evuAqiVqZtORk2Pc5UXoCv2heo6ro
	wnHPExNI/7QGIctIXIs1+CQKuaXX8eQ=
X-Google-Smtp-Source: AK7set9NIQgaNj7V6HF8wwXt9aZyCSQgne1wJG1yuSbONyXpWK4Wj0gxwiN3wEoTfQYVsah72LBqVA==
X-Received: by 2002:a17:906:48c6:b0:8af:5154:ff8e with SMTP id d6-20020a17090648c600b008af5154ff8emr4272719ejt.15.1676531805708;
        Wed, 15 Feb 2023 23:16:45 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id qp14-20020a170907206e00b008b126882334sm418150ejb.39.2023.02.15.23.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 23:16:45 -0800 (PST)
Date: Thu, 16 Feb 2023 10:16:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Roger Lu <roger.lu@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [matthias-bgg:v6.3-tmp/soc 42/48]
 drivers/soc/mediatek/mtk-svs.c:1740 svs_get_efuse_data() warn: passing zero
 to 'PTR_ERR'
Message-ID: <202302160720.N64SWT4l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230216071641.r7EfzaGcEnE26GR71B7k4FXBIw4IVYf63rTy8lCmqDA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.3-tmp/soc
head:   d19b23050ea976b42a6527a623cdd5774c290b8b
commit: 6c7174fd90a4690e2154a6a77ad2ffa119166217 [42/48] soc: mediatek: mtk-svs: use svs get efuse common function
config: microblaze-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230216/202302160720.N64SWT4l-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302160720.N64SWT4l-lkp@intel.com/

New smatch warnings:
drivers/soc/mediatek/mtk-svs.c:1740 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/soc/mediatek/mtk-svs.c:1742 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1740 drivers/soc/mediatek/mtk-svs.c

6c7174fd90a4690 Roger Lu                   2023-02-02  1732  static int svs_get_efuse_data(struct svs_platform *svsp,
6c7174fd90a4690 Roger Lu                   2023-02-02  1733  			      const char *nvmem_cell_name,
6c7174fd90a4690 Roger Lu                   2023-02-02  1734  			      u32 **svsp_efuse, size_t *svsp_efuse_max)
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1735  {
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1736  	struct nvmem_cell *cell;
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1737  
6c7174fd90a4690 Roger Lu                   2023-02-02  1738  	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1739  	if (IS_ERR_OR_NULL(cell)) {

nvmem_cell_get() cannot return NULL so checking for NULL is wrong here.
If it could return NULL then this code is handling it incorrectly.  I
wrote a blog about this:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

6c7174fd90a4690 Roger Lu                   2023-02-02 @1740  		dev_err(svsp->dev, "no \"%s\"? %ld\n",
6c7174fd90a4690 Roger Lu                   2023-02-02  1741  			nvmem_cell_name, PTR_ERR(cell));
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1742  		return PTR_ERR(cell);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1743  	}
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1744  
6c7174fd90a4690 Roger Lu                   2023-02-02  1745  	*svsp_efuse = nvmem_cell_read(cell, svsp_efuse_max);
6c7174fd90a4690 Roger Lu                   2023-02-02  1746  	if (IS_ERR(*svsp_efuse)) {
6c7174fd90a4690 Roger Lu                   2023-02-02  1747  		dev_err(svsp->dev, "cannot read \"%s\" efuse: %ld\n",
6c7174fd90a4690 Roger Lu                   2023-02-02  1748  			nvmem_cell_name, PTR_ERR(*svsp_efuse));
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1749  		nvmem_cell_put(cell);
6c7174fd90a4690 Roger Lu                   2023-02-02  1750  		return PTR_ERR(*svsp_efuse);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1751  	}
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1752  
6c7174fd90a4690 Roger Lu                   2023-02-02  1753  	*svsp_efuse_max /= sizeof(u32);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1754  	nvmem_cell_put(cell);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1755  
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1756  	return 0;
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1757  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

