Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B520FAAE
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733725498; cv=none; b=XoftoXJeEQqJDKTQlFP27/HmxPkxOXLUacp2/oJ10uPFYEYAAVrZp53026Qa52PueVTIBGSPAjeu8FI3jOBvDo3DSXJqlNOATPRIfMSYQN5OOto2f4/6Dd0Thsc0M0xdxcb6ZryuDJ6fWPS+cieUg+mmk1Pjb8LQ6fjRwiBrpxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733725498; c=relaxed/simple;
	bh=mGTYY/S1tcZ7mB4hZaQXD2gGwB9lm/gy74p2V9lOMBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DATpqMUVToGwU5rHXqqEASeUmOwSif5hN8oayPnoL2EGh75HSQlQy38jFPR5mKTv9RlW/Hh2LgyG4TDOzBvRxqrt9XmSXMiQynczkIXhhTsK1msQuBRQzLKFUNXspg7e1+Turywxk+YNpPNpWjwvqH0rA4UXuQoY7cekVpkjJ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XgpcTx86; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XgpcTx86"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349f160d62so25986205e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 08 Dec 2024 22:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733725494; x=1734330294; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSWdbzUv/klyRC+VpwtXiylS3X8oQQ/HWEE9CGjI/X4=;
        b=XgpcTx86Qg9+CRzfSFLflTO1Ao1cQn2ZVyo0UdzK948La+UpXd0+HfvnWiWEHpkeLi
         NYsJfQfh5uwJUth55e3ZuBPwGMmTte/5Hb9OMDSeA0p7ZWMt/i5BZe0Hx7gK2vC4zXRK
         Xr2D2UaMf6ID6/pWxamZb1BrgTRF3mjJtRDqoTp5t4fbr6m+RuAL8ZkaoJSPAPoY8C8d
         NbRV0JfVR+L9lyfLlHcbXdhUoWc/YOzURa4WIFKPxHdGu8emPHppfISdtD2kiaBmqLtf
         ObHhmPl4RKp5eZr2DP/Zb6dMfV1MrNvsb99zqG+yZifE3YPbceYmHPSoIHwwaVaksLdX
         CltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733725494; x=1734330294;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSWdbzUv/klyRC+VpwtXiylS3X8oQQ/HWEE9CGjI/X4=;
        b=UrRI0eMyKc6CCy4d+G9oxpJ1K9QjGc1brsPZy0KQ5MdAxzVdnMNsU+pNlXG0FJ6Ik8
         ZkWcFTfKFTs0t+Hj1VLO4qBn9XgJGuSlQtwoB8amj1tqTaxIh1xW0S4gR4LhiVKmrXdd
         UDUCZkuG1BpelpPfSipfChtU5pUS83V48Cq83A7LNLyKTuDnfFUM7+CddYiBMZk0j9SE
         vBfZfhAsnVnRctji0mwhfeB6vbus0gk+PVe5BPxuXNnlAiY+onP5U89p9wOc0RJry8uJ
         40c1HKb8PJbQXg/UQ7/5DlLBcJ+EEPJ1uYzWyvn3MQnIzOWCdJ1WFzLMyH6QLb0YmLKP
         WEHw==
X-Gm-Message-State: AOJu0YwG+B7ZtsBNDDioFPibN2CyLy9gUY+pdNCLf4f57yl0QH+0LcvE
	ZTjxVXJ0QDPNxeMAJtzaNlHEg3/12V3vk4sLW/av2xBN9cZV267U+GLV+Wd9o2t3Apj8rFSPnVJ
	S
X-Gm-Gg: ASbGncvJz3w6oELyEZJSqifx/P22s4clypRElAHNT8J/uAldzvE67Ewzy3aKbOj25vz
	GkZFIJNCSaBRUBl1IxZqBJzlKTd54LLSET1ZaY6MjrPizx03SFJz1ybX0XE+L8F7EmK7Z07Ssys
	4tIzYRT3PhIB/yYH2etovWirKhUJ12xvtk/9VNi5CjkQhNC1ZchoRiK5dn+UJuVWgBwI/LruqpE
	LUznqYPDDpI2SXdLKYhIlHcbiTT3ASajceLb+MvYYWR12S5+vuCfsg=
X-Google-Smtp-Source: AGHT+IFBto4Yfrx+pv3ASlNQe/3a3g3g5C2AxRS3XdYTeSZtg6kA2LXtYVN1NzUSxdF0yl5jdyXPsg==
X-Received: by 2002:a05:6000:178a:b0:385:f417:ee46 with SMTP id ffacd0b85a97d-3862b33b786mr8183957f8f.2.1733725493969;
        Sun, 08 Dec 2024 22:24:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386394dd379sm4517942f8f.24.2024.12.08.22.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:24:53 -0800 (PST)
Date: Mon, 9 Dec 2024 09:24:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Akhil R <akhilrajeev@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: drivers/crypto/tegra/tegra-se-aes.c:1596 tegra_cmac_do_one_req()
 error: uninitialized symbol 'ret'.
Message-ID: <134e89a8-49a0-4675-8e07-4f257828f51d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 0880bb3b00c855fc244b7177ffdaafef4d0aa1e0 crypto: tegra - Add Tegra Security Engine driver
date:   8 months ago
config: nios2-randconfig-r073-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071747.flPux4oB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412071747.flPux4oB-lkp@intel.com/

smatch warnings:
drivers/crypto/tegra/tegra-se-aes.c:1596 tegra_cmac_do_one_req() error: uninitialized symbol 'ret'.

vim +/ret +1596 drivers/crypto/tegra/tegra-se-aes.c

0880bb3b00c855f Akhil R 2024-04-03  1577  static int tegra_cmac_do_one_req(struct crypto_engine *engine, void *areq)
0880bb3b00c855f Akhil R 2024-04-03  1578  {
0880bb3b00c855f Akhil R 2024-04-03  1579  	struct ahash_request *req = ahash_request_cast(areq);
0880bb3b00c855f Akhil R 2024-04-03  1580  	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
0880bb3b00c855f Akhil R 2024-04-03  1581  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
0880bb3b00c855f Akhil R 2024-04-03  1582  	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
0880bb3b00c855f Akhil R 2024-04-03  1583  	struct tegra_se *se = ctx->se;
0880bb3b00c855f Akhil R 2024-04-03  1584  	int ret;
0880bb3b00c855f Akhil R 2024-04-03  1585  
0880bb3b00c855f Akhil R 2024-04-03  1586  	if (rctx->task & SHA_UPDATE) {
0880bb3b00c855f Akhil R 2024-04-03  1587  		ret = tegra_cmac_do_update(req);
0880bb3b00c855f Akhil R 2024-04-03  1588  		rctx->task &= ~SHA_UPDATE;
0880bb3b00c855f Akhil R 2024-04-03  1589  	}
0880bb3b00c855f Akhil R 2024-04-03  1590  
0880bb3b00c855f Akhil R 2024-04-03  1591  	if (rctx->task & SHA_FINAL) {
0880bb3b00c855f Akhil R 2024-04-03  1592  		ret = tegra_cmac_do_final(req);
0880bb3b00c855f Akhil R 2024-04-03  1593  		rctx->task &= ~SHA_FINAL;
0880bb3b00c855f Akhil R 2024-04-03  1594  	}

Is it possible for both SHA_UPDATE and SHA_FINAL to be clear?

0880bb3b00c855f Akhil R 2024-04-03  1595  
0880bb3b00c855f Akhil R 2024-04-03 @1596  	crypto_finalize_hash_request(se->engine, req, ret);
                                                                                              ^^^
If so then this is uninitialized.

0880bb3b00c855f Akhil R 2024-04-03  1597  
0880bb3b00c855f Akhil R 2024-04-03  1598  	return 0;
0880bb3b00c855f Akhil R 2024-04-03  1599  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

