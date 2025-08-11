Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A02D8DAF
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754895581; cv=none; b=ra2EF/7jI7wXOw7B7fx8PvO7lPScxZCqMmCr1jq0u5kTD3BnoBNpjpToMmUUZ/Y9HhvZfgnc3d3HyNbtCuAFIe2xhedd1E3WdUQWeXitLNcVQALgiqLCh4WJHZCDiixamoxzynCt/RpaaqlA9gIEAJK7HxeSvN7pvn/schNTRfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754895581; c=relaxed/simple;
	bh=4lwU9+q711HqVGjPLzGuSavNjV7DO3nHbtVZal8A69Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=izhf905kCUCl9+5QEXkYVOzkYR7x7KIqZIwaspYu9OuEGfTokWCpmOasPnxy1EIZwZQshNxGH1XmYsooqrSk/cmJF7sghx/gL1u0jciGolztQ8gm9GxlYB0YLla4hgPx9cIsqWHNfC4Rj4Tr7RyoPiOIH3LTuk7T7rNJu6xsOqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eoPwXSKh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eoPwXSKh"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78bca0890so1907500f8f.3
        for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754895577; x=1755500377; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7txx+mSdY4Vw7Odwo/qpUnHfmvBZyooVGgPGBs/FjgM=;
        b=eoPwXSKhEZzLmDnc9AYv3yzmHgTFzOgCBGbM9QQ0rI/HcT0wP9NRe1hFSYmCAZ8iVt
         QB2ouVrCIcS/0AjCTLA1OA+IwOsFm3gF1ow0hZESEsr0SuFKVD2+svxN9PRF0MpzKRvi
         Sqz32w1SfqUVNBoQ3+hn1OggzN2SwXM6Q0AJpzmRR9DtlO38DuEm2PHiYuc806QKMOpL
         K6NSUMEBookGnhYoOgTk3FnJKUFvs02Z6FYUKXF/rgnZipfDitioE7Rf2yTo7YH2S00u
         BZATMf4pJxj83hYQhMSS2sMwIQa/OiPVxGXgzYoAE3kA1Xd4ofp32wQw9zEb5c/BSLMP
         iKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895577; x=1755500377;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7txx+mSdY4Vw7Odwo/qpUnHfmvBZyooVGgPGBs/FjgM=;
        b=l/rVjWPOMJKtrPnqULSO6NrFJ94UiFfrirRjU5W52iGXPdULnSCLEtgx4Wa64qnelV
         6WdqTdMpl3hzwgijjVIFEAcSccgd30mOKxxDNuWXMIMOpduH7jb/mD3nNTewUdBZVZw1
         ZnvkBB3Vp6i0d02s+QjWLnqJ/SiXPt95joFNOILDKOglnthcFWdHGpp2DtyDKLsvHdww
         9P5SCDr6W5A3usagzR+X3+DIRmZDocAodYz0bgwr8ce5CyvhkSvN820xRqeGHZcWXKAd
         b5hllZlPPKYfhEW77GkCJwHVyu54hMBrx+ethbTotwzQA/NFCDbhcESMzKC++a1UdvlL
         Bjpw==
X-Gm-Message-State: AOJu0YynjhYUucsTAw90e/Pol571ii+n27+hAIf82hOtprxlgWsXFvpf
	bX/WgxE0W0fdySByDHK97KLArNdtURD8ZHuqhxf/hTjzuT3UnB/3s+Dvj3jnJ6/n/s4xO4/YrQo
	NaE5t
X-Gm-Gg: ASbGncspMLn7KfWWu578SEe9QosebPtMZp9HZfRZ281WzBG+Ba4Cyujnh9ucfm+um7b
	NE3uSKAw/RIICWzgHfyaTz0KK2sfMOtO4jdjYOae9qri4gpt6mLejrVUrKomUN6SM6hahDTzCJM
	A+AO6nv6hHjQksUSufBdeM76KV9mzLhOElKhvrFa6pJizNggTTRHhbHl+2L/C6tAHlBhEmzuV5n
	UT4TTHkk+lds2R3uFwpMS6dO2qr1jCBLWlrujqcpHqCmfUhGX5OK7IaPL5HgzvPllHaTpglr3Kf
	BFx1X1eTBb/yMSZ6DxUdEAEi0/bORsv22CQJoHIsuRcJ9x6OQk0F/iBmWNtQFFsRSirXhPtC3MZ
	H9Bk2NqJhESViMfuP+DYTUOUw5Zc=
X-Google-Smtp-Source: AGHT+IH4e5ZZxOE73Be8vg/T2tU1RdfSMbrKJfV/QCK0Gay+Fdqc1TngOrMjIuDHS0jIzSR7cWST+Q==
X-Received: by 2002:a05:6000:228a:b0:3b7:99cb:16f6 with SMTP id ffacd0b85a97d-3b900b572f7mr8977043f8f.53.1754895577447;
        Sun, 10 Aug 2025 23:59:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e5852e28sm237872945e9.9.2025.08.10.23.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:59:36 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:59:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 18/21] drivers/nfc/s3fwrn5/i2c.c:167
 s3fwrn5_i2c_parse_dt() warn: passing zero to 'PTR_ERR'
Message-ID: <202508101336.NYrzRmBN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250811065933.VA5JskoLs9ib3eZ5yupf2oe8N2Ha67CKtLNLbFrqefs@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   c0a2b3cd5b78ddb721e53baf675d7164a118bc2d
commit: ffbe497edf85ef06fcbc6c8687a15b491e2a4829 [18/21] nfc: s3fwrn5: convert to gpio descriptors
config: x86_64-randconfig-161-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101336.NYrzRmBN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508101336.NYrzRmBN-lkp@intel.com/

smatch warnings:
drivers/nfc/s3fwrn5/i2c.c:167 s3fwrn5_i2c_parse_dt() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +167 drivers/nfc/s3fwrn5/i2c.c

c04c674fadeb4a Robert Baldyga      2015-08-20  149  static int s3fwrn5_i2c_parse_dt(struct i2c_client *client)
c04c674fadeb4a Robert Baldyga      2015-08-20  150  {
c04c674fadeb4a Robert Baldyga      2015-08-20  151  	struct s3fwrn5_i2c_phy *phy = i2c_get_clientdata(client);
ffbe497edf85ef Arnd Bergmann       2025-07-22  152  	struct device *dev = &client->dev;
c04c674fadeb4a Robert Baldyga      2015-08-20  153  
ffbe497edf85ef Arnd Bergmann       2025-07-22  154  	phy->common.gpio_en = devm_gpiod_get(dev, "en", GPIOD_OUT_HIGH);
ffbe497edf85ef Arnd Bergmann       2025-07-22  155  	if (IS_ERR(phy->common.gpio_en)) {
1995c4cc3ae407 Krzysztof Kozlowski 2020-09-10  156  		/* Support also deprecated property */
ffbe497edf85ef Arnd Bergmann       2025-07-22  157  		phy->common.gpio_en = devm_gpiod_get(dev, "s3fwrn5,en", GPIOD_OUT_HIGH);
ffbe497edf85ef Arnd Bergmann       2025-07-22  158  		if (IS_ERR(phy->common.gpio_en))
ffbe497edf85ef Arnd Bergmann       2025-07-22  159  			return PTR_ERR(phy->common.gpio_en);
1995c4cc3ae407 Krzysztof Kozlowski 2020-09-10  160  	}
c04c674fadeb4a Robert Baldyga      2015-08-20  161  
ffbe497edf85ef Arnd Bergmann       2025-07-22  162  	phy->common.gpio_fw_wake = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
ffbe497edf85ef Arnd Bergmann       2025-07-22  163  	if (IS_ERR(phy->common.gpio_fw_wake)) {
1995c4cc3ae407 Krzysztof Kozlowski 2020-09-10  164  		/* Support also deprecated property */
ffbe497edf85ef Arnd Bergmann       2025-07-22  165  		phy->common.gpio_fw_wake = devm_gpiod_get(dev, "s3fwrn5,fw", GPIOD_OUT_LOW);
ffbe497edf85ef Arnd Bergmann       2025-07-22  166  		if (IS_ERR(phy->common.gpio_fw_wake))
ffbe497edf85ef Arnd Bergmann       2025-07-22 @167  			return PTR_ERR(phy->common.gpio_en);

s/phy->common.gpio_en/phy->common.gpio_fw_wake/

1995c4cc3ae407 Krzysztof Kozlowski 2020-09-10  168  	}
c04c674fadeb4a Robert Baldyga      2015-08-20  169  
c04c674fadeb4a Robert Baldyga      2015-08-20  170  	return 0;
c04c674fadeb4a Robert Baldyga      2015-08-20  171  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

