Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10842309A7
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733820464; cv=none; b=kPcnOUvTq0G+uUgfdx8Oe2y9JbW/PQajTQcXPPFkRGQo2dJaixY4j1gqz2aahY1w+D4fRfFBUCXJSgVLPF/Klv1n6y/4H5XTRT3TLVEdMtuc+d6o5oGiByoAwwv0JqKp815n2V9yq9+4saeRYkXUj+UZHxjsZW4UKu3l2Rbn/3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733820464; c=relaxed/simple;
	bh=ECuAT4nP7i9BweFK7juZ/y9yq7LiAJKWQ8pjhyaZfU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bvrrTw8BFiqYQwmE+3UhbzYaBNNUsSbzV8aTwv6EXiXrQyLPkdYFsW29zL5pghZO4ifjZd+Xweo7Wu7M+Ws3Q5BvGL8Ll41YQ63ve5CSG3focXDor0KDy1f/VMJFe4gg8c+ttQmj6A9va9MtrMdq+qhXFwamkXvsksypE69sB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hj/EUlbj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hj/EUlbj"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3863494591bso1420049f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 00:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733820461; x=1734425261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LN3mYjDf0WLLoooPbhO+3Eb4XaEvDNDr4DXqom+zuiQ=;
        b=Hj/EUlbjmFsEUFXRV7Qxfbz8ixJxSSRkkaSmk05974R5frq+lgSacGf1bC+QgpcH1M
         8Dh4pbOCKOGshmxTOfUJ1MjEoQi81VLo1rZZYg3d8rQ6mfsnQy5HylUTIxp8LUWnfqHq
         E3YNI3pW13lhELmI/Kyj0QQUlVC5/JPmVWNq2fqIU0lzO14UOG84mqegiEvV6KRwfsy6
         G/6dZE2rLHSPSg6eIYbO4YdYdymYSUs85lQQwUTVm4i7DEjkyVAMZl6Jw61ZXAvD6dSR
         Iwo3poPWeqqpTGqKhMui8Zrprc9WrU5d4kZ9RekFMP3fAfgvdsZrEybc+AyBVuT0L694
         fI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733820461; x=1734425261;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LN3mYjDf0WLLoooPbhO+3Eb4XaEvDNDr4DXqom+zuiQ=;
        b=httzJCE6i502Tsc5bLNyxDd/aC6VO05U98EkHvsRkRvt00LL61jI0kpPNST5tILSkP
         in1DY2AO9qRinMD6c8aMrgjbBCh0t3D8C43ONuhyoSZPMT8JsnI7QpNH993XRrfE/OVg
         6Zo+tlmBGmsJ/ZdKYGgL9mTgRKZ6S+oy1tq4QgqGxCxrc4A+B1zQSIouz7L8z2N3+nPC
         Xx4J/rrU65mB7X0LtU3Sy/9BEkOpq/eH2xlqgINQ4i/bqVK5j3MZT1hP4fPiQFIXOsqD
         u3nrpOgpV5NLar5i5Lb+y60NyNmZ2Bx9oiAoJb7c3hX2TYFJoN4rzrJCr+8iWkIJ28oB
         /AEg==
X-Gm-Message-State: AOJu0Yw3kZ+NYUOKvUMBMPv28FlmeXM18GOU2dWMxbDmLkfQlnTM9t1K
	t1guxmsmUWrjT+FzgambYRKMEqR1ek1lcs299NN/sATVLYSeTcOfFH1RYstNV2R/zzwqCFruy9C
	V
X-Gm-Gg: ASbGncsI9TabwGt1k54eKhyCrwFFNqh5F97KZEUPkWYZqZ+dIAOqldqAnjVnvtb/NbE
	k4WoGnOMTq1rU2tZIyqq3MwQVv1WS6gcfMLd8ottSTI94Il5G0BqR8o22z4jYA1XnDuooabNt17
	trr8FgYM+QadT/FPpv11dsKu5ds/SsuRv90Wp80AIC2WgSfEL2LCF0mzxz1KIi249D+LZX4fMUB
	vqhc3bJOA4A6vebiADeJRtSIn3+NL8/ioLuuIi3nC1NhVtjBUk9mMX0fqg=
X-Google-Smtp-Source: AGHT+IG5cwePAttfHDiwnbYJqi1bg7G1KUe+FWSYgo/LN7Cys+F7UYQC66MSd4jFa0z12FH5wxvVww==
X-Received: by 2002:a5d:47c9:0:b0:386:3328:6106 with SMTP id ffacd0b85a97d-386453e5101mr2651418f8f.35.1733820460851;
        Tue, 10 Dec 2024 00:47:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f4a859esm15209515f8f.23.2024.12.10.00.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 00:47:40 -0800 (PST)
Date: Tue, 10 Dec 2024 11:47:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lothar Rubusch <l.rubusch@gmail.com>,
	lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, eraretuya@gmail.com,
	l.rubusch@gmail.com
Subject: Re: [PATCH v5 10/10] iio: accel: adxl345: add FIFO with watermark
 events
Message-ID: <dc914326-7eae-4e4a-8c93-ae1a7007bcc9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205171343.308963-11-l.rubusch@gmail.com>

Hi Lothar,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/iio-accel-adxl345-refrase-comment-on-probe/20241206-011802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20241205171343.308963-11-l.rubusch%40gmail.com
patch subject: [PATCH v5 10/10] iio: accel: adxl345: add FIFO with watermark events
config: nios2-randconfig-r072-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101132.Kj6R6i3h-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412101132.Kj6R6i3h-lkp@intel.com/

smatch warnings:
drivers/iio/accel/adxl345_core.c:441 adxl345_event_handler() warn: unsigned 'int_stat' is never less than zero.

vim +/ret +321 drivers/iio/accel/adxl345_core.c

55d2386488598bb Lothar Rubusch 2024-12-05  433  static irqreturn_t adxl345_event_handler(int irq, void *p)
55d2386488598bb Lothar Rubusch 2024-12-05  434  {
55d2386488598bb Lothar Rubusch 2024-12-05  435  	struct iio_dev *indio_dev = p;
55d2386488598bb Lothar Rubusch 2024-12-05  436  	struct adxl345_state *st = iio_priv(indio_dev);
55d2386488598bb Lothar Rubusch 2024-12-05  437  	u8 int_stat;
                                                        ^^^^^^^^^^^

55d2386488598bb Lothar Rubusch 2024-12-05  438  	int samples;
55d2386488598bb Lothar Rubusch 2024-12-05  439  
55d2386488598bb Lothar Rubusch 2024-12-05  440  	int_stat = adxl345_get_status(st);
55d2386488598bb Lothar Rubusch 2024-12-05 @441  	if (int_stat < 0)
                                                            ^^^^^^^^^^^^
signedness bug

55d2386488598bb Lothar Rubusch 2024-12-05  442  		return IRQ_NONE;
55d2386488598bb Lothar Rubusch 2024-12-05  443  
55d2386488598bb Lothar Rubusch 2024-12-05  444  	if (int_stat == 0x0)
55d2386488598bb Lothar Rubusch 2024-12-05  445  		goto err;
55d2386488598bb Lothar Rubusch 2024-12-05  446  
55d2386488598bb Lothar Rubusch 2024-12-05  447  	if (int_stat & ADXL345_INT_OVERRUN)
55d2386488598bb Lothar Rubusch 2024-12-05  448  		goto err;
55d2386488598bb Lothar Rubusch 2024-12-05  449  
55d2386488598bb Lothar Rubusch 2024-12-05  450  	if (int_stat & (ADXL345_INT_DATA_READY | ADXL345_INT_WATERMARK)) {
55d2386488598bb Lothar Rubusch 2024-12-05  451  		samples = adxl345_get_samples(st);
55d2386488598bb Lothar Rubusch 2024-12-05  452  		if (samples < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  453  			goto err;
55d2386488598bb Lothar Rubusch 2024-12-05  454  
55d2386488598bb Lothar Rubusch 2024-12-05  455  		if (adxl345_fifo_push(indio_dev, samples) < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  456  			goto err;
55d2386488598bb Lothar Rubusch 2024-12-05  457  
55d2386488598bb Lothar Rubusch 2024-12-05  458  	}
55d2386488598bb Lothar Rubusch 2024-12-05  459  	return IRQ_HANDLED;
55d2386488598bb Lothar Rubusch 2024-12-05  460  
55d2386488598bb Lothar Rubusch 2024-12-05  461  err:
55d2386488598bb Lothar Rubusch 2024-12-05  462  	adxl345_fifo_reset(st);
55d2386488598bb Lothar Rubusch 2024-12-05  463  
55d2386488598bb Lothar Rubusch 2024-12-05  464  	return IRQ_HANDLED;
55d2386488598bb Lothar Rubusch 2024-12-05  465  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

