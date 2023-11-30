Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E7134BC
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5RNbMok"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3331974c2ceso428646f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 23:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701329047; x=1701933847; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjOMOlSbGpDdM1F2qP0y99RJ7pyZzeVwxLqIhJcqxf8=;
        b=w5RNbMokEsEHIDsDmFYKCh52yGGm9gKnAd1Lx4l7q7Fu3lbP4SJ20K+XK68irkUwrS
         qX/G6CpBbiUYkuBNS6QBNyibFnIrXIUOzCfs7zqKbvD+Jm//aM1X08zkiO02k2lF6aHG
         5aMU9AFMqHw8uqYK1g+laTcNFWIiv06dj78KsYAK3/RE5nY2H8XnhvzKUrSVZcnu0rGo
         uvmw6QEn+IdhMHzJt5cQM8Gcxs/t9A53LS4oapURTibToXM3hUmUe2c09+IlfZRMSCmK
         mKahgLWzdKZ5CsK8HXItpZD/V4+1eVFDd6+f8Wm/qNRRXRk9UgSQltAYjlGv11imlWx3
         wQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701329047; x=1701933847;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjOMOlSbGpDdM1F2qP0y99RJ7pyZzeVwxLqIhJcqxf8=;
        b=ovPuUI17Q5J4nquwS7xZ2wFM2Cd3mh/kySXAozIB7H98Lt9eADFwQlhKPyFChqFG1H
         uQE83Pn+Wi83XwGZOldBOyVVcABBy9FUbwNGS4rfwfT/uNumG3BY41uszJpY6/MvF+Ws
         Qx0eu1ck7pWPwiDEbeegZwWF1FanGC/i9sEF/lY4Ug8m6E1i8sIdtka4fNdb7TA4W0m4
         vftinAFw6lB1JbWIW/VXntx+cx6ikgqZtrHO7Z1AItbv59msIBAvWd+1d3aJHw6j+URE
         OpH0vsV2gZ9e38t2eAJvLZjQW62kDNzQIxpYOs8JqMZMfiAH97KS/j4/XqLmqXWKcO4t
         Nw0w==
X-Gm-Message-State: AOJu0YwLe7rKRMcb94lSvu3HBagNzm2Js9J8N4NLDwAxMCLwPdLHd1xS
	QfP5D77Np9CaSk9gbvk4ORrClhUfyzfTIga+WAQ=
X-Google-Smtp-Source: AGHT+IH/ZewBkbSKs62H7w8mJgPEn2IOZmi3DRWa5SeqLSUTJPUHztyguUOl1UVm34l190rsDubfbw==
X-Received: by 2002:adf:f1c6:0:b0:333:75c:362f with SMTP id z6-20020adff1c6000000b00333075c362fmr7400313wro.45.1701329047178;
        Wed, 29 Nov 2023 23:24:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p12-20020adfce0c000000b00332e75eae4asm678713wrn.85.2023.11.29.23.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:24:06 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Nov 2023 10:24:04 +0300
To: oe-kbuild@lists.linux.dev, Paul Elder <paul.elder@ideasonboard.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [pinchartl:mtk/v6.7/thp7312/next 4/4]
 drivers/media/i2c/thp7312.c:1838 thp7312_fw_write() warn: inconsistent
 returns '&thp7312->fw_lock'.
Message-ID: <2722aad9-73e3-4e29-aaa6-a05117452409@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.7/thp7312/next
head:   7a3a1ee25e6b83ebe88d64bb1038d8e141bb824f
commit: 7a3a1ee25e6b83ebe88d64bb1038d8e141bb824f [4/4] media: i2c: Add driver for THine THP7312
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231130/202311300837.i0Yl4NPb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300837.i0Yl4NPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311300837.i0Yl4NPb-lkp@intel.com/

smatch warnings:
drivers/media/i2c/thp7312.c:1838 thp7312_fw_write() warn: inconsistent returns '&thp7312->fw_lock'.

vim +1838 drivers/media/i2c/thp7312.c

7a3a1ee25e6b83 Paul Elder 2023-06-20  1797  static enum fw_upload_err thp7312_fw_write(struct fw_upload *fw_upload,
7a3a1ee25e6b83 Paul Elder 2023-06-20  1798  					   const u8 *data, u32 offset,
7a3a1ee25e6b83 Paul Elder 2023-06-20  1799  					   u32 size, u32 *written)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1800  {
7a3a1ee25e6b83 Paul Elder 2023-06-20  1801  	struct thp7312_device *thp7312 = fw_upload->dd_handle;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1802  	struct device *dev = thp7312->dev;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1803  	u16 header_size = size - THP7312_FW_RAM_SIZE;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1804  	enum fw_upload_err ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1805  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1806  	mutex_lock(&thp7312->fw_lock);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1807  	if (thp7312->fw_cancel)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1808  		return FW_UPLOAD_ERR_CANCELED;

I can't tell if this is intentional or not.  It makes me itch to look
at.  It needs some sort of comment.

7a3a1ee25e6b83 Paul Elder 2023-06-20  1809  	mutex_unlock(&thp7312->fw_lock);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1810  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1811  	ret = thp7312_flash_erase(thp7312);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1812  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1813  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1814  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1815  	ret = thp7312_fw_load_to_ram(thp7312, data, THP7312_FW_RAM_SIZE);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1816  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1817  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1818  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1819  	ret = thp7312_fw_write_to_flash(thp7312, 0, 0x1ffff);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1820  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1821  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1822  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1823  	ret = thp7312_fw_load_to_ram(thp7312, data + THP7312_FW_RAM_SIZE, header_size);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1824  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1825  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1826  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1827  	ret = thp7312_fw_write_to_flash(thp7312, 0x20000, header_size - 1);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1828  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1829  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1830  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1831  	ret = thp7312_fw_check_crc(thp7312, data, size);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1832  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1833  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1834  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1835  	dev_info(dev, "Successfully wrote firmware\n");
7a3a1ee25e6b83 Paul Elder 2023-06-20  1836  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1837  	*written = size;
7a3a1ee25e6b83 Paul Elder 2023-06-20 @1838  	return FW_UPLOAD_ERR_NONE;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1839  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

