Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C41C02;
	Fri, 31 Mar 2023 04:39:37 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so14569215wmq.4;
        Thu, 30 Mar 2023 21:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680237576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HB3lvYmnwPAvqI7YqRqQnPg5UbrGJRvfRpu4S+QUYs=;
        b=Rpjvi8WZysdNrAbn7vnXWiqQnhtWzcy3rEYnNoctZ/iPFXSa+JySs03s5Z69MUxO/0
         2o1S5eC2ZIoecdCTk26hMZCe+t3V14Tni1Ksx8hmVSMX6G0UceWlbxY6FgQ/dYhK4K9K
         lxtQzHaJ2njsLOGQZFVbJaNhrrei6F2vbYCSWGct1lDgL4hWOvyWkLpKR85gcRUvgQgL
         d0FH1DVkl3TEMmJ8mE6K1eTHnXZwjYSYozPj4yC36hDrMcnT3FdUMsJJkk8AOuwVTTzp
         YYk7C18VNUetNJexdDny6RzxAPUr52yh2qMjepkZDTw5cPvmucZw1DKQMrJ1O8/hau41
         sRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680237576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HB3lvYmnwPAvqI7YqRqQnPg5UbrGJRvfRpu4S+QUYs=;
        b=3gMCan32svt8IPYJmaj+HCtkJF0xFDy5oKpsORX6W7Ht7/elSKiz7ylNGW+S0H6D8z
         gJfEBdFTo4pgCIltbl8n8/h0BSCbWe43JE2iugAd8SNbd34BgxHCCpyHelbmRjglZm4U
         Mqv/miTdQ74qCvqwe237AqLOgB0icsao24DY3A5O4pW7gmbMexWTF+iOxQoDtNRnxxC4
         ixv+cdbs1HBLCCFBFluCsoJlQGPkhlDJNzyVbdAqUM1DFealWqHSShieKL25Ry+k2CIy
         9OzbGbWySIVSN0URyDGJtXv+3V57auw2h/J6ahCp1SPGAQQgpnytfAAyP2CQ/AYhe7MD
         E1Mg==
X-Gm-Message-State: AO0yUKUdCyogBwTKVQDmCGSa6lYsdONHE6UX8V0ogUji0BczOTFyl1tY
	oJQ612H3V8t0ogSglXDxP7w4RwC9KLI=
X-Google-Smtp-Source: AK7set9JgezVshFtmuiz+4tBPEESBGBiol6PG/SoJbmRUbn8PU8Gtxgp/RPbPrEKMXjGZ9BLITlJTw==
X-Received: by 2002:a7b:c44a:0:b0:3ef:8b0:dbb1 with SMTP id l10-20020a7bc44a000000b003ef08b0dbb1mr19002902wmi.7.1680237575861;
        Thu, 30 Mar 2023 21:39:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o7-20020adfe807000000b002e4cd2ec5c7sm1031604wrm.86.2023.03.30.21.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 21:39:35 -0700 (PDT)
Date: Fri, 31 Mar 2023 07:39:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Roger Lu <roger.lu@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1028/7844] drivers/soc/mediatek/mtk-svs.c:1740
 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'
Message-ID: <5a5f15fd-4b79-4483-b9cd-75ef69fdacc5@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6d9e3034536ba4b68ac34490c02267e6eec9c05
commit: 9f195f3a1e696b6576988c1e58fa7389beae3351 [1028/7844] soc: mediatek: mtk-svs: use svs get efuse common function
config: s390-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310846.H0Ti6K3K-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303310846.H0Ti6K3K-lkp@intel.com/

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

nvmem_cell_get() cannot return NULL.  But if it could then it is a
success case.  I have written a blog about this with more explanation:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/
So this is wrong, but also it can't be NULL so it doesn't affect real
life.

43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1742  		return PTR_ERR(cell);

PTR_ERR(NULL) is success.

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

