Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924D313547
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725213; cv=none; b=MD59QEtqYFsvcl6YITjvj/hoJDU6ib9xIznp6dJk1OvTLwpr5V/5OlPwUiRbT3seU6/fZ4OUpGautol07Yxhaik5b1FW65bKbyi16io3gtudI/0EwrXcs2JoWEqpf+cNV10/65tqkEq8cNQkwXrYe+VCSTsuDem+/hKri6NcbQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725213; c=relaxed/simple;
	bh=g4k7E+V4jiEw+k7u7xcW7HqbefUtH0LfysZxURvNgF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFvLwafaHY0tVmEaWsQFBoHlDDoSDkRNOwPR1q/0cTO5f+gKTP1gU+mbpy5T4B6Lvm7BVYIQoa3wc0WqvdjTPmbhSikZ/4D9want+10wy1djbUESbBHhO/z5nuNY8JniY4EqMaqs611vnr701eWxm3hOkhuIO56b4aLPH4BpvAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyP/eAfW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyP/eAfW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4711810948aso51547305e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 01:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761725210; x=1762330010; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/U2hfMcjV9nJGndGjnLzRpawxN69YuqF2yw05LYjj+A=;
        b=MyP/eAfWlZJ7JWVeKDzjy6sn7SBxe6f98bkVMrUPE8NGEKD9SM9NJMz6QGbHbeEtet
         VDx3FtgVBLzrLfd0Ixg4oRU0nuyKqUOLySgw0UD1jzboryk7Ba13lJUgo2i2bgIhFG6p
         WSNZ/N2YILXRJVGT3YfgRviFVLccjCMAnA+Tiq9DZ0Wb0ppc+gQql/3f6xXs0r2fSZ43
         rloJUeI80X2orl+Kxx+/2dmFjMXoABWtYRz8urdH7ccvw9JJi/Ivx/jEfo6c+5V/diCk
         CSIrRKJITIqj7qSFHWXyYyOXd1myV9k74prG5tly6uEj+XfUvgPCH0+5f5jIGdEnIdKa
         m/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725210; x=1762330010;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/U2hfMcjV9nJGndGjnLzRpawxN69YuqF2yw05LYjj+A=;
        b=WxzSagMh7pmVqC0Nns2ePkEHDE5UogIx01rfjZQfNTx5GmiSrAbwkG33yqIkUUPaLo
         T+XVYc3cgzQWUG9ylo6RqMI+IfoDCDcGH0JLLPfLcO7FkzECV+IcsizIuX9C/ujW4dtB
         0CCOVrfP2IS4nZ9854GU+wUaawFFRcPPkH6AZmfda1o7+dkc78Yp98RG9Nw2cxLH6P8z
         OysMRtPNj0pzUQaojY1Ft6j6SCIUT1DMppfTPinT2J6VD5HyGXSglIexXcjr8JfuC4WS
         QiSssWZ17RO6W/Ed6MEw73U6/6R2ZBeKmKQ0eKtDO06aIIzqiTzrOwqRkEWexfBvH9Mi
         eHPg==
X-Gm-Message-State: AOJu0YztjR/BkCvvyajefHjpKLasgcodfuDuOg9YKR5YFpEqL5tLTd+d
	KcWXDbOW26+ksX+c0sWCKh/Zn3sLPY2PXX9la2eOAajl5WTK9nSTyM/cbaD30akwnq88lvCF2bw
	D0GPs
X-Gm-Gg: ASbGncvYeepd7aJy3Zfs5+7nx+82KlYA7EzBba6LN2VFRcKAZyo3CHuHSTkFwHz3IIE
	r5IvrkWYhEk531aMT0WqGwyo8JnCUUBhPfcwGGeL5/S+tnpxv4rXPRa/zCDRIsMWAR7OPoUoMQ6
	udJvZ3J6pSI8Pso2J39bJFafNFPZ5/fLGA6/wbmhAiDObfPJklkHFW4pl3d6I8VKRjB54HptiPu
	Krj4Lk8/eDo8Vq58qnw5MOVf+BVcLbXicpyS6nRGUki3V9+zWGResZdPPjGdgarmBOSX1z2ar+p
	nyw2wpRYCrmZPZzLEtTbEzM00OWrM0xMUg83gjT8556MR2uIx5Cvd2uLw1LGHaZpXPLdZaMPaKu
	9LFKMdXyGVIDsDvCo1gnxrs/4ELrwLzBtu3/Ssy7p33H/kabvtmaL7zWSpeCD/UEkPYTrNcSZ/g
	G1TUWVJ+rQdtTrrwS2xrCPWTo6Blw=
X-Google-Smtp-Source: AGHT+IFgNUQ4crpN+QHSB0hxcM/8JVshSVJCNnrfYqxRW/4TkIjQ5SJTOS1BT/mreoy5qhKaiaWMNA==
X-Received: by 2002:a05:6000:2c03:b0:427:53e:ab25 with SMTP id ffacd0b85a97d-429aefca402mr1395557f8f.49.1761725209704;
        Wed, 29 Oct 2025 01:06:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952b7b43sm25201579f8f.6.2025.10.29.01.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:06:49 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:06:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Niranjan H Y <niranjan.hy@ti.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: sound/soc/codecs/tas2783-sdw.c:814 tas2783_fw_ready() error:
 uninitialized symbol 'ret'.
Message-ID: <202510291226.2R3fbYNh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251029080646.wZ_UaxF_DONDTXYRlK6JWi1zCtvcg-KWu_XqjH1rkkw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8eefed8f65cc17c31fdf4ab32292b794b34893ad
commit: 4cc9bd8d7b32d59b86cb489a96aa8a7b9dd6a21b ASoc: tas2783A: Add soundwire based codec driver
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291226.2R3fbYNh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510291226.2R3fbYNh-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/tas2783-sdw.c:814 tas2783_fw_ready() error: uninitialized symbol 'ret'.

vim +/ret +814 sound/soc/codecs/tas2783-sdw.c

4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  748  static void tas2783_fw_ready(const struct firmware *fmw, void *context)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  749  {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  750  	struct tas2783_prv *tas_dev =
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  751  		(struct tas2783_prv *)context;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  752  	const u8 *buf = NULL;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  753  	s32 offset = 0, img_sz, file_blk_size, ret;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  754  	struct bin_header_t hdr;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  755  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  756  	if (!fmw || !fmw->data) {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  757  		/* No firmware binary, devices will work in ROM mode. */
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  758  		dev_err(tas_dev->dev,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  759  			"Failed to read %s, no side-effect on driver running\n",
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  760  			tas_dev->rca_binaryname);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  761  		ret = -EINVAL;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  762  		goto out;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  763  	}
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  764  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  765  	mutex_lock(&tas_dev->pde_lock);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  766  	img_sz = fmw->size;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  767  	buf = fmw->data;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  768  	offset += FW_DL_OFFSET;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  769  	while (offset < (img_sz - FW_FL_HDR)) {

If the firmware is too small the "ret" value might be uninitialized.

4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  770  		memset(&hdr, 0, sizeof(hdr));
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  771  		offset += read_header(&buf[offset], &hdr);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  772  		dev_dbg(tas_dev->dev,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  773  			"vndr=%d, file=%d, version=%d, len=%d, off=%d\n",
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  774  			hdr.vendor_id, hdr.file_id, hdr.version,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  775  			hdr.length, offset);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  776  		/* size also includes the header */
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  777  		file_blk_size = hdr.length - FW_FL_HDR;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  778  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  779  		switch (hdr.file_id) {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  780  		case 0:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  781  			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  782  					       PRAM_ADDR_START, file_blk_size,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  783  					       &buf[offset]);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  784  			if (ret < 0)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  785  				dev_err(tas_dev->dev,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  786  					"PRAM update failed: %d", ret);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  787  			break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  788  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  789  		case 1:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  790  			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  791  					       YRAM_ADDR_START, file_blk_size,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  792  					       &buf[offset]);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  793  			if (ret < 0)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  794  				dev_err(tas_dev->dev,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  795  					"YRAM update failed: %d", ret);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  796  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  797  			break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  798  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  799  		default:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  800  			ret = -EINVAL;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  801  			dev_err(tas_dev->dev, "Unsupported file");
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  802  			break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  803  		}
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  804  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  805  		if (ret == 0)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  806  			offset += file_blk_size;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  807  		else
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  808  			break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  809  	};
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  810  	mutex_unlock(&tas_dev->pde_lock);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  811  	tas2783_update_calibdata(tas_dev);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  812  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  813  out:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12 @814  	if (!ret)
                                                    ^^^^
Here.

4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  815  		tas_dev->fw_dl_success = true;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  816  	tas_dev->fw_dl_task_done = true;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  817  	wake_up(&tas_dev->fw_wait);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  818  	if (fmw)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  819  		release_firmware(fmw);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  820  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

