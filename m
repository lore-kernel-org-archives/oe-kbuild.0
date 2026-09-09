Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B43C199B
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 19:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983292; cv=none; b=YxxOlx8Y3KtyM1OHvcF8sWD4ddPas+4QB64VQc6uq7B6pkj8iy9wNQWht3IUS6oip16fJ2YHTD8B0rqhTImmERihohm3+Chem9QUAH6XmT3P/SWLQ0Fie8/U++3kEdifewrVd7vB//Tkjck5GZI2Y4aqMUdvPXz/ychgobNXznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983292; c=relaxed/simple;
	bh=4+nA80njg4UcU7kJJIa5AgGSefkOiqQwbqdDEQ5u/ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZS06jXejyQXKIrgoHTz4H/kxZinHZBIV7v9e8CsgeAnZSxSk2wAA1IiefqP4lYW8C3IGIwWhHXizve0s/s3jPTVVEkn1NpRqIMYNGLYiIi10faydW0Geb47spssZCU+Q5UCNB8/SP+B7bkv5tcQ/NTGVau5+2yo53w2tHTShiJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgMuaJEH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgMuaJEH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4859b45abadso613267f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Sep 2026 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788983288; x=1789588088; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+Zp6jhpeiDA+INZ/C344pThoDc8Z/q0rjde37bpe+Y=;
        b=hgMuaJEH9syNNYk5yCEvqzhArRg+ozThFbhNxUFbAVseNuoIV7c0Aa8u0LazLRkWOV
         k05KZpbbgSzN1rkz4e42NMFDs51iH6AgYoM7PZRZnzQULDB8+AoRHUDVI8W8n9HmgZ5L
         QvM30B9ALqXT4mWYmmgY7+aVXFJOTK62yeIj31Hc36BebV7kkW7//AYcuZOYyhzwMeSw
         V/4hFTUGKwU4Mhy9rY2LhJdZQL7pm+sTE3dFyd8aI+nPtqfq3W4D9yhUp2q+9jWJdM7t
         I7d8SUU1IZTFfB4wRxjz7PcLjAgj3YeHS64OdNI7BLEH85sklbStlMe8Ah4r2Q47w4oL
         /+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788983288; x=1789588088;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+Zp6jhpeiDA+INZ/C344pThoDc8Z/q0rjde37bpe+Y=;
        b=HWqtBNEbHFAlLeCwMU1A5VHw7zWsnkffS7juZSEsniz0mfUuic1F0PSqPUtL/QgzWh
         XWpF+TSk0l/5FmdH+38GVCxUN8INnMcmQREkVMO+6D/Srcl33FkbzArWHv5QyKbERZjj
         /IHQfkC2SmVkiVwnebhnw4UXzhtJLVktKE5lBgzgPYYTlIt0cBzfJRmQPUYHmRtNZeOQ
         hltZsSGB+TuLYfHT0mrFrZptePLig2Wy/swajcsxMY/JnIKN8BZ6TkIJK3dOt6j53Ial
         OOaZ2lK6PrBrnZbkmqXCgXE0dbF8qNs3XH10a7WURNeBfsfeche3sCL7Dn/n535GVQwd
         riNA==
X-Gm-Message-State: AFuF++nYXl3PNm6NU9RjO8UPiqDmxlOwbZIPSftlSe7XS1aR9wWB8HIC
	aR1COF67vhuyzjh9iEGiGnbA1awn/DMxjn658vUCwo1SRDcks/ZBLNQ3VBO4//AMQ2rXVw==
X-Gm-Gg: AYBFou3KxTfKkGb5bcjvdWFWzqAKHHt6Svkwuybe8YcZ6/xgLo4M+/NBUGVDyU/NPVE
	ZUO+UIgH6ysz8YJOt0kh33wtExxuRZ0UowDjLuPTmafVKVRUrOW1Js2SVgbn/sFC3m/h92lrEy+
	N9HQ2IpezZEwCbJeF13Dbo5dYr4lsiNVBV7oIlAikiMFkVWap7ajsSWNiIUfVwcJP/s4eqK4Slu
	qa/yDTKJ2gkfvXm43OeS2XJWtUDzerMGKo0NKUaIPG1C8Bs3D9mdBXNwH8bdtsWfa63Tf3It9v5
	AnN/KqtfxMU4sLEeS7BwI1WwVr1XU9Smr1mlSx/xf4B0Y/bPkQ/O8IiSQHUO8mnBXpZ6b8hl1NJ
	BfJvOsY1UERu0aUY82bxj0NrH2yCrzJx8/p/BzZbKTsk3YgCSaAa/mizrN+/m1NhB3/Jht6XZjG
	kpFtNvCZjs0jlnHujgrxtpTSTVO6anZaEAJ7kaCL8n8XWvnkNZOQJOyh6LIjeimrEV27g=
X-Received: by 2002:a05:6000:4703:b0:485:93c5:856e with SMTP id ffacd0b85a97d-48593c58629mr28905928f8f.9.1788983288032;
        Wed, 09 Sep 2026 12:48:08 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm40528235f8f.2.2026.09.09.12.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:48:07 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:48:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Frank Wunderlich <frank-w@public-files.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 213/213]
 drivers/tty/serial/8250/8250_mtk.c:437 mtk8250_runtime_suspend() warn:
 test_and_clear_bit() takes a bit number
Message-ID: <202609100256.0onKHOy1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260909194802.psKhmOkNRo9U9i8j-PNghrqGPChTk6ArleBGfBWcnkc@z>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   e2b8c6a7a01daa29f0109ecfd5d0fa93e27da8bf
commit: 6f53f04819bff1609acb1655c95238965736452b [213/213] serial: 8250_mtk: track busclk state to avoid bus error
config: loongarch-randconfig-r073-20260910 (https://download.01.org/0day-ci/archive/20260910/202609100256.0onKHOy1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609100256.0onKHOy1-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_mtk.c:437 mtk8250_runtime_suspend() warn: test_and_clear_bit() takes a bit number
drivers/tty/serial/8250/8250_mtk.c:454 mtk8250_runtime_resume() warn: test_and_set_bit() takes a bit number

vim +437 drivers/tty/serial/8250/8250_mtk.c

9db669f14fd829 Arnd Bergmann    2016-02-08  432  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
68e5fc4a255a7f Sascha Hauer     2015-04-27  433  {
68e5fc4a255a7f Sascha Hauer     2015-04-27  434  	struct mtk8250_data *data = dev_get_drvdata(dev);
e32a83c70cf987 Changqi Hu       2020-02-26  435  	struct uart_8250_port *up = serial8250_get_port(data->line);
68e5fc4a255a7f Sascha Hauer     2015-04-27  436  
6f53f04819bff1 Daniel Golle     2023-09-11 @437  	if (!test_and_clear_bit(MTK_UART_STATE_BIT_BUSCLK_EN, &data->state))
                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
double BIT(BIT()) bug.

6f53f04819bff1 Daniel Golle     2023-09-11  438  		return 0;
6f53f04819bff1 Daniel Golle     2023-09-11  439  
e32a83c70cf987 Changqi Hu       2020-02-26  440  	/* wait until UART in idle status */
e32a83c70cf987 Changqi Hu       2020-02-26  441  	while
e32a83c70cf987 Changqi Hu       2020-02-26  442  		(serial_in(up, MTK_UART_DEBUG0));
e32a83c70cf987 Changqi Hu       2020-02-26  443  
d518314a1fa4e9 Daniel Golle     2025-09-16  444  	clk_disable_unprepare(data->uart_clk);
c1c325d703d347 Sascha Hauer     2015-04-27  445  	clk_disable_unprepare(data->bus_clk);
68e5fc4a255a7f Sascha Hauer     2015-04-27  446  
68e5fc4a255a7f Sascha Hauer     2015-04-27  447  	return 0;
68e5fc4a255a7f Sascha Hauer     2015-04-27  448  }
68e5fc4a255a7f Sascha Hauer     2015-04-27  449  
9db669f14fd829 Arnd Bergmann    2016-02-08  450  static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
68e5fc4a255a7f Sascha Hauer     2015-04-27  451  {
68e5fc4a255a7f Sascha Hauer     2015-04-27  452  	struct mtk8250_data *data = dev_get_drvdata(dev);
68e5fc4a255a7f Sascha Hauer     2015-04-27  453  
6f53f04819bff1 Daniel Golle     2023-09-11 @454  	if (test_and_set_bit(MTK_UART_STATE_BIT_BUSCLK_EN, &data->state))
6f53f04819bff1 Daniel Golle     2023-09-11  455  		return 0;
6f53f04819bff1 Daniel Golle     2023-09-11  456  
b6c7ff2693ddc2 Chen-Yu Tsai     2023-06-06  457  	clk_prepare_enable(data->bus_clk);
d518314a1fa4e9 Daniel Golle     2025-09-16  458  	clk_prepare_enable(data->uart_clk);
c1c325d703d347 Sascha Hauer     2015-04-27  459  
68e5fc4a255a7f Sascha Hauer     2015-04-27  460  	return 0;
68e5fc4a255a7f Sascha Hauer     2015-04-27  461  }
68e5fc4a255a7f Sascha Hauer     2015-04-27  462  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

