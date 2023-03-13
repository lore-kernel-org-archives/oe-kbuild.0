Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C88184F;
	Mon, 13 Mar 2023 04:48:24 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso6954889wms.5;
        Sun, 12 Mar 2023 21:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678682902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M21+fx8VgRvCtJkZ4erGQfjLhdoMaFXaxiDc3wHZ8+s=;
        b=QJ+EtW5lU4yDqocoA6jVvVh/chHzJmzdYAvzma92JGjE0LSGeyjehkyPC/BARqOYXD
         8RQtNWZyuZMZB51bMqaT+MHlOZT2+qamLc1raOBdFlLYpDlfogC+ZPMl0zgbAvG9DK9Y
         F6oUPaakBADv3KS4+y7lqrIfes9UClmx/b+Cb4wM3j54pMtJBLkpCtkTdHC7b28PVsXQ
         M5/c5UzxffjOnxAzR90qI23xrQAQcQD82hleW0OJsAQkkMOQnpx7JgD7pry14C1tHzMP
         AQlkVjtOmkq2VqRrPhEE1pdH/7fGrRwvfiXk3lJQV6CynkP/jwUDwFRoTEOT20yp1Oyn
         42Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678682902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M21+fx8VgRvCtJkZ4erGQfjLhdoMaFXaxiDc3wHZ8+s=;
        b=cbp0GeXCvVyf3VNqj2GAEclOqUBb1VAqwN/EhEqyGZ8o6DOQyJ3ZUhffwPT/mN10In
         tSJS4JSFiUA5qIJaJ1bd+fBo5RJpBcPaTpdRYCH+Vpsh8+SWEOkfDkm39424w0xwPfut
         75tMRKDulEr+AoE2y2tGoXjyyPTyrQvAuWsuf59pshdRSD7V0W1sj+GgrimxBJllgyLm
         FTRc/LoCfFkzWtV7+JOR3ip55s4MAb4PTP63NJIJjCJP7SsHaZcwurpaNj7QCHMcYfqK
         SZ49xe4M0OUzuCWbQ+H2jTjRau4yaIYeDrLQ7ZOQZZvtgkQwcSqtGCrXj0kmfhXJad4W
         vf3A==
X-Gm-Message-State: AO0yUKUzgFlu+UzhLsv1INyN3auA9y6FTSVyGCGJG0GHSastKvNYTKJv
	FUAXxPMg/ya0oiTx5HBDuzSRWyju9t0=
X-Google-Smtp-Source: AK7set/hh9csBOA4mQDggSQD6w5M1WtyEWGzF+5eUyn4XBVei8qHu3hQ515fCP20XP1o6DuPbd5OPw==
X-Received: by 2002:a05:600c:1c95:b0:3db:3e8:feca with SMTP id k21-20020a05600c1c9500b003db03e8fecamr7743729wms.15.1678682901937;
        Sun, 12 Mar 2023 21:48:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p25-20020a05600c205900b003eaf666cbe0sm7842351wmg.27.2023.03.12.21.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:48:21 -0700 (PDT)
Date: Mon, 13 Mar 2023 07:48:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Roger Lu <roger.lu@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [linux-next:master 1161/2655] drivers/soc/mediatek/mtk-svs.c:1740
 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'
Message-ID: <ff08eeea-d898-4f60-b90b-23e233d28239@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   24469a0e5052ba01a35a15f104717a82b7a4798b
commit: 9f195f3a1e696b6576988c1e58fa7389beae3351 [1161/2655] soc: mediatek: mtk-svs: use svs get efuse common function
config: s390-randconfig-m031-20230310 (https://download.01.org/0day-ci/archive/20230312/202303120758.x4oFgtr4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303120758.x4oFgtr4-lkp@intel.com/

New smatch warnings:
drivers/soc/mediatek/mtk-svs.c:1740 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/soc/mediatek/mtk-svs.c:1742 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1740 drivers/soc/mediatek/mtk-svs.c

9f195f3a1e696b Roger Lu                   2023-02-02  1732  static int svs_get_efuse_data(struct svs_platform *svsp,
9f195f3a1e696b Roger Lu                   2023-02-02  1733  			      const char *nvmem_cell_name,
9f195f3a1e696b Roger Lu                   2023-02-02  1734  			      u32 **svsp_efuse, size_t *svsp_efuse_max)
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1735  {
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1736  	struct nvmem_cell *cell;
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1737  
9f195f3a1e696b Roger Lu                   2023-02-02  1738  	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1739  	if (IS_ERR_OR_NULL(cell)) {
9f195f3a1e696b Roger Lu                   2023-02-02 @1740  		dev_err(svsp->dev, "no \"%s\"? %ld\n",
9f195f3a1e696b Roger Lu                   2023-02-02  1741  			nvmem_cell_name, PTR_ERR(cell));
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1742  		return PTR_ERR(cell);

I guess this warning is showing up as new because you renamed the
svs_get_efuse_data() function.

The bug is that if nvmem_cell_get() returns NULL then the return is not
handled correctly.  But nvmem_cell_get() never returns NULL.  So it's
bad code, but in run time the bug is impossible to hit.

43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1743  	}
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1744  
9f195f3a1e696b Roger Lu                   2023-02-02  1745  	*svsp_efuse = nvmem_cell_read(cell, svsp_efuse_max);
9f195f3a1e696b Roger Lu                   2023-02-02  1746  	if (IS_ERR(*svsp_efuse)) {
9f195f3a1e696b Roger Lu                   2023-02-02  1747  		dev_err(svsp->dev, "cannot read \"%s\" efuse: %ld\n",
9f195f3a1e696b Roger Lu                   2023-02-02  1748  			nvmem_cell_name, PTR_ERR(*svsp_efuse));
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1749  		nvmem_cell_put(cell);
9f195f3a1e696b Roger Lu                   2023-02-02  1750  		return PTR_ERR(*svsp_efuse);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1751  	}
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1752  
9f195f3a1e696b Roger Lu                   2023-02-02  1753  	*svsp_efuse_max /= sizeof(u32);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1754  	nvmem_cell_put(cell);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1755  
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1756  	return 0;
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1757  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

