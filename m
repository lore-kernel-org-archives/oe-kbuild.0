Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16EA21;
	Thu,  6 Apr 2023 08:50:53 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h17so38718572wrt.8;
        Thu, 06 Apr 2023 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680771052; x=1683363052;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDhNPVA0XWvICvpxlQ+nQDJLerJVHA4kYFUmCS/Urlo=;
        b=C8DQ468SMWzgezaejMfjANSbKSfAKK0TWluRwDMsEU5WtMGa6wt5OCjXNPmlUv+Fh3
         tdQsxpGW4Y/lK48WeMxQhBFM40KoXsWT9NbdMxYvmAPgUFf5s90enKi4wF93FXJXBrOQ
         rx6jW7dM0VY4gg7X4RL+iHZhpz7RB+T3wMcBsnG5xIIu0wz5qro0t0Cigh/aGuydn/h1
         Q7xUnjyWakQEN7YzhPVpftFxWewqfStefEE50oGKpYu/B8zidgT52/Xz3Cqvx7hCn7hE
         hSaWiJmCzqEhX4APN+SOpaTstG/ZuO09Pru2c5fV4FgNhMDe1/vtkRiLAT4DtOpIDAWM
         xxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680771052; x=1683363052;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDhNPVA0XWvICvpxlQ+nQDJLerJVHA4kYFUmCS/Urlo=;
        b=S5/dJ94y0ywZQwtcnFJ+UcuDBQl7acJZOiux72MhgnB2oQEXo9bOitzkQ363zaRA1p
         qOJChEH87b95tghmLLomZ3dO0ZVTkcTAGIr3NQ4DqiGNYSWpnVlb4UrO6TJ1CbxVOCQf
         6qZJO5gMlwUdHvBQpNyfExFH1zeeX4xY3or0mOxNWjCRtlbAA+9dToMjjUJNxWTDTPnR
         vV1hImHsBd6SAthAX9ut0W1S+82nG0z1bPM0G5X4Qpw541RmuA9GyE3r4gSkakeiv7T2
         AOPs3conDieLgOQPDsh2qSEZb/g2slNtuUn0sCMnAZWPawElnJ4MB7P9UXpqtVAsBJZl
         ltVg==
X-Gm-Message-State: AAQBX9ewXQgE8TBZzJUulw9+vlYyW/RNQxWsgLhNIMbLTwncApMEPSSi
	Vl0HitDk4/SW1TpLB/UpVLx9P1ef1iA=
X-Google-Smtp-Source: AKy350aR4cFex0AcIkRKOLWor4z1UMSkpgsWHRC4/Me9NeeD6EH6aaUj4KRVXPnjyFRJ7FODfn/gVg==
X-Received: by 2002:adf:eb05:0:b0:2d1:cc54:11b2 with SMTP id s5-20020adfeb05000000b002d1cc5411b2mr5686136wrn.70.1680771051536;
        Thu, 06 Apr 2023 01:50:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y8-20020adfee08000000b002c5a1bd5280sm1108342wrn.95.2023.04.06.01.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:50:51 -0700 (PDT)
Date: Thu, 6 Apr 2023 11:50:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [ambarus:s25hx02gt-v3 27/31] drivers/mtd/spi-nor/sfdp.c:1310
 spi_nor_parse_sccr_mc() warn: impossible condition '(params->n_dice > 255)
 => (0-255 > 255)'
Message-ID: <ee3873b7-d3da-4ce9-a01b-df1f5dab2d71@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day s25hx02gt-v3
head:   6b55d2284b55c6de88e5722bb756fad85487d3db
commit: 89b7eb9508b28a48c4d0a8b1ef46983202a0d360 [27/31] mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
config: arm-randconfig-m041-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061615.oiFHKH9Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304061615.oiFHKH9Y-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/sfdp.c:1310 spi_nor_parse_sccr_mc() warn: impossible condition '(params->n_dice > 255) => (0-255 > 255)'

vim +1310 drivers/mtd/spi-nor/sfdp.c

89b7eb9508b28a Takahiro Kuwano 2023-02-08  1284  static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1285  				 const struct sfdp_parameter_header *sccr_mc_header)
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1286  {
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1287  	struct spi_nor_flash_parameter *params = nor->params;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1288  	u32 *dwords, addr;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1289  	u8 i, n_dice;
                                                        ^^^^^^^^^^^^

Declaring the iterator as u8 will lead to problems if we ever increase
the max to higher than 255.

89b7eb9508b28a Takahiro Kuwano 2023-02-08  1290  	size_t len;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1291  	int ret;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1292  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1293  	len = sccr_mc_header->length * sizeof(*dwords);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1294  	dwords = kmalloc(len, GFP_KERNEL);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1295  	if (!dwords)
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1296  		return -ENOMEM;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1297  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1298  	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1299  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1300  	if (ret)
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1301  		goto out;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1302  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1303  	le32_to_cpu_array(dwords, sccr_mc_header->length);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1304  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1305  	/*
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1306  	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1307  	 * additional die. Hence, length = 2 * (number of additional dice).
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1308  	 */
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1309  	n_dice = 1 + sccr_mc_header->length / 2;
89b7eb9508b28a Takahiro Kuwano 2023-02-08 @1310  	if (params->n_dice > SCCR_MC_MAX_DICE) {

If "1 + sccr_mc_header->length / 2;" is larger than SCCR_MC_MAX_DICE,
the value of n_dice will still be <= because of truncation.

89b7eb9508b28a Takahiro Kuwano 2023-02-08  1311  		dev_dbg(nor->dev, "Improbable number of dice defined in SCCR MC table, use one die.\n");
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1312  		ret = -EINVAL;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1313  		goto out;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1314  	}
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1315  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1316  	/* Address offset for volatile registers of additional dice */
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1317  	params->vreg_offset =
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1318  			devm_krealloc(nor->dev, params->vreg_offset,
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1319  				      n_dice * sizeof(*dwords),
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1320  				      GFP_KERNEL);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1321  	if (!params->vreg_offset) {
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1322  		ret = -ENOMEM;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1323  		goto out;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1324  	}
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1325  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1326  	for (i = 1; i < n_dice; i++)
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1327  		params->vreg_offset[i] = dwords[SFDP_DWORD(i) * 2];
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1328  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1329  	params->n_dice = n_dice;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1330  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1331  out:
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1332  	kfree(dwords);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1333  	return ret;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1334  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

