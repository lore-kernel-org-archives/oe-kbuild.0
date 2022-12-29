Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248631C06;
	Thu, 29 Dec 2022 09:21:27 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id bk16so3682667wrb.11;
        Thu, 29 Dec 2022 01:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gV8zkytSIxFdA1gfddCUQSfndGX/x2fwl4EcvCd27uo=;
        b=gZIsGvTVIPkVBreWBZUqhG6tJ6TQG/e2nkgRlmxPFjOZP3sWE7Mzh9ZnzHltkfeagl
         vNa7GNSmuzK26wHYU75od9NuT1Zx9+xElfsnGR48kkHxt2Wn1/WVap2O51ualnbvHQBS
         fESS6Wf9aT2G7FSepKTHQqM7cY5afjA6mCvk+X2J2BQUYz+Aoe/nzPbW1zLfRKeYjku9
         M9GOp3NZqPsnIxfTx54yojHYlxRlvsjfbq0VgoZ+z2pXjXDrZHxC+KKusAhujwnoxzxr
         ueR6whlLnAyAZ7rUbjHL2RtY74zNHGQvv+vdFyCMLrz3HcrmM9F3qz/qtZTsA0Pr+Fa5
         p5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gV8zkytSIxFdA1gfddCUQSfndGX/x2fwl4EcvCd27uo=;
        b=TgY2u25RTobMwbQze+xZ8V596V5/C4UXFSx12q2Bae5gUVybUJ3538vIs6yH9lCy9+
         j+8xXBp0QmDi7HjYA4y6K/DGym2MSq07nMoUICikLh+rAzQDkDuxg0IcXgP/V0ZKN8VJ
         s+rXHj6dmnQiv4VrHF6UCCDBSYZdRatwiAKCy1yYg+hFL9pll/V7mRsAAi2ODoWRvADR
         S8WjkHKatXvuf677rAcH9s4fxKT4d9zI5fRCNq/S15FHp8XndR8I5kvErJn2iMsQCwhL
         gPauz55YnZyE6h9WNTNHGT8Njfw2KMz5MO+SEzxghC35SSSvfKkiKbZnb8SpnSEWPaZo
         Z/Og==
X-Gm-Message-State: AFqh2koPhnbRjCCVQXYn2LCL2lP95qcbhBPSzey0Bt/VlIr2DNzuQYCb
	uvR/GJRnqrc8P5M67V+gXe1ifOVKwuYuLe6g
X-Google-Smtp-Source: AMrXdXu8uslP5kkZ6Op0IWp56ubHVeC5h/fhOMnfLfNmq5qDVaWBUav0s0f9JohP1U3b8gcCl9ti1Q==
X-Received: by 2002:a5d:6210:0:b0:236:695b:82d4 with SMTP id y16-20020a5d6210000000b00236695b82d4mr16636511wru.30.1672305685076;
        Thu, 29 Dec 2022 01:21:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b003a6125562e1sm26483603wms.46.2022.12.29.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:21:24 -0800 (PST)
Date: Thu, 29 Dec 2022 12:20:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Angel Iglesias <ang.iglesiasg@gmail.com>,
	linux-iio@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] iio: pressure: bmp280: Add support for new sensor
 BMP580
Message-ID: <202212260352.XQTIlVGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a1c9341102fdce2f49d151f0cba76f1ba9ba279.1671986815.git.ang.iglesiasg@gmail.com>
Message-ID: <20221229092044.PbkcyFY3E3J_tSD_PpJ-4hyi6dqyETfD2UzcUWvAE3Y@z>

Hi Angel,

url:    https://github.com/intel-lab-lkp/linux/commits/Angel-Iglesias/iio-pressure-bmp280-Add-enumeration-to-handle-chip-variants/20221226-010158
base:   e807541c2b273677e82ef50b5747ec7ae7d652b9
patch link:    https://lore.kernel.org/r/5a1c9341102fdce2f49d151f0cba76f1ba9ba279.1671986815.git.ang.iglesiasg%40gmail.com
patch subject: [PATCH 3/5] iio: pressure: bmp280: Add support for new sensor BMP580
config: i386-randconfig-m021-20221226
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/iio/pressure/bmp280-core.c:1654 bmp580_preinit() warn: missing error code? 'ret'

vim +/ret +1654 drivers/iio/pressure/bmp280-core.c

ce037d81e52ecb Angel Iglesias 2022-12-25  1631  static int bmp580_preinit(struct bmp280_data *data)
ce037d81e52ecb Angel Iglesias 2022-12-25  1632  {
ce037d81e52ecb Angel Iglesias 2022-12-25  1633  	unsigned int reg;
ce037d81e52ecb Angel Iglesias 2022-12-25  1634  	int ret;
ce037d81e52ecb Angel Iglesias 2022-12-25  1635  
ce037d81e52ecb Angel Iglesias 2022-12-25  1636  	/* Issue soft-reset command */
ce037d81e52ecb Angel Iglesias 2022-12-25  1637  	ret = bmp580_cmd(data, BMP580_SOFT_RESET_CMD);
ce037d81e52ecb Angel Iglesias 2022-12-25  1638  	if (ret)
ce037d81e52ecb Angel Iglesias 2022-12-25  1639  		return ret;
ce037d81e52ecb Angel Iglesias 2022-12-25  1640  	/* Post powerup sequence */
ce037d81e52ecb Angel Iglesias 2022-12-25  1641  	ret = regmap_read(data->regmap, BMP580_REG_CHIP_ID, &reg);
ce037d81e52ecb Angel Iglesias 2022-12-25  1642  	if (ret)
ce037d81e52ecb Angel Iglesias 2022-12-25  1643  		return ret;
ce037d81e52ecb Angel Iglesias 2022-12-25  1644  	if (reg != BMP580_CHIP_ID) {
ce037d81e52ecb Angel Iglesias 2022-12-25  1645  		dev_err(data->dev, "preinit: unexpected chip_id\n");
ce037d81e52ecb Angel Iglesias 2022-12-25  1646  		return ret;
ce037d81e52ecb Angel Iglesias 2022-12-25  1647  	}
ce037d81e52ecb Angel Iglesias 2022-12-25  1648  	ret = regmap_read(data->regmap, BMP580_REG_STATUS, &reg);
ce037d81e52ecb Angel Iglesias 2022-12-25  1649  	if (ret)
ce037d81e52ecb Angel Iglesias 2022-12-25  1650  		return ret;
ce037d81e52ecb Angel Iglesias 2022-12-25  1651  	/* Check nvm status */
ce037d81e52ecb Angel Iglesias 2022-12-25  1652  	if (!(reg & BMP580_STATUS_NVM_RDY_MASK) || (reg & BMP580_STATUS_NVM_ERR_MASK)) {
ce037d81e52ecb Angel Iglesias 2022-12-25  1653  		dev_err(data->dev, "preinit: nvm error on powerup sequence\n");
ce037d81e52ecb Angel Iglesias 2022-12-25 @1654  		return ret;

"ret" is zero.  It should be return -EINVAL or something.

ce037d81e52ecb Angel Iglesias 2022-12-25  1655  	}
ce037d81e52ecb Angel Iglesias 2022-12-25  1656  
ce037d81e52ecb Angel Iglesias 2022-12-25  1657  	return 0;
ce037d81e52ecb Angel Iglesias 2022-12-25  1658  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

