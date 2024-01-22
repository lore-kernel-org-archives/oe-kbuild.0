Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92DD1AAC9
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705911189; cv=none; b=XS4mslLlCxNDBwH0NQPPTJ6ThaVPLbtY5rs4BkB4V57h4OlhY507GlIlbgPtw2dj7qUU0KCr090iVKHV1ZOByHDMfvbBG+FD9y2ysQb2th6haK6OTyBzZYKsO0rsjwzTyBMJuynSyyQC4dd0DBjwr6wv9z7ZAjvjwZtJqE2OgPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705911189; c=relaxed/simple;
	bh=3cRrw0cHWQn+cK7d5PNQX3dC1AeMdE5G7mqfe1DLWq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U72Rc/1wMqun56tw00mNxCCCB3fQd4I3tcmSiuEgyYnKDXmMSmQCS9UXTZ/33HXSIKDQba2jIbZ/KeonzbChepTO9DdjpJesb9/PRvid69ucjOa4QkSYHbfzax/ccznqGOpo7r/jWVqDMblZDUFoktPtixzV1xw1TbPAm6382Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cngy6j1R; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cngy6j1R"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-337cf4ac600so2681131f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705911185; x=1706515985; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Le+VGGy4jaBeLxGf8XEn/QIwzoPXkfhsyE8WPths7mA=;
        b=Cngy6j1RY5xi4Pwdqy/xgNNw7LkX3Ci/WCBQAFTymQGmcrKoRGSVeS3S89KMep644i
         FVxwyVxu6wa5LQsfF01j1REqYAnV30WorimrfaIfKqJj6LWQoKKY1a4QYldvydYPf72b
         RSTbZ5zF0l+5VovHKsxaxW0cHxxjAqIB2XzRnC+iNlI02LCmI6Huwki+x72gW/nl2XIi
         r11LlXKP/h2eiDejWbsZPjzYhUdhJ8XYj5h7kERwM59sgT4eHg3Dof86c7/JztJW+cD9
         Kkanc3uT3cg3t4cUe2KM9jLmJpddnUmpAFGvSmmdpJUAheINabS3xSRtW+tqst1Bc4Wf
         i8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705911185; x=1706515985;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Le+VGGy4jaBeLxGf8XEn/QIwzoPXkfhsyE8WPths7mA=;
        b=FsxmmHgtfIVaa3TwHUK177yNRzyvnh66lU9HQ4vRJ1W/xhOgMs4Zc6sRywzU5j3b4q
         4XH2ZxwFkVuku1NerTPf9f0e2VMoxSIqRg3dTH/Ae7XlmCHQvDioWl2ZsvIOnEIrB+yd
         7XSupR23E8TvUiwZPf74zrbhuyYkhbEtCXXfuww1C1safxKdkwfOeN0JON3c5u7i6dA5
         kp7UR0wCWbKsDvC1OrN1zbx+6LQUvcVEGyHcvQC3fk305hyiDAGQ0pDvhtmuaNIHJkZu
         Dkr15TboE6npQZa5m/7L9AFOEJ2eQX40H9MjeSOTdxUX8LPSESz4IA0XQtdJcxyY9NR3
         crYQ==
X-Gm-Message-State: AOJu0YwDRXxTHqCDHbnOR67No/DFwvLpElJoQUdKPl58rxsszCaEtdAF
	Ax+gtnsgLN4nOIr+OWNF4LXSbXa9iq6c71a+9AnE5+68wNEJJfut3jmcMTNODppDAKjE7k0xSjO
	LyRM=
X-Google-Smtp-Source: AGHT+IF977NpNX+JrUqSrTbnSB/ycvIm+HkYZ2A/R1a5lYJmowh/lHmjTVWi+Nb89yEWmbkjt6/nNg==
X-Received: by 2002:a5d:608f:0:b0:337:d6d9:bf3b with SMTP id w15-20020a5d608f000000b00337d6d9bf3bmr72529wrt.117.1705911185509;
        Mon, 22 Jan 2024 00:13:05 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id f11-20020adff98b000000b00337d5cd0d8asm10038112wrr.90.2024.01.22.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:13:05 -0800 (PST)
Date: Mon, 22 Jan 2024 11:13:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Deepak R Varma <drv@mailo.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/staging/wlan-ng/prism2fw.c:625 mkpdrlist() error:
 __builtin_memcpy() '&pda->rec[pda->nrec]->data.mfisuprange' too small (8 vs
 10)
Message-ID: <4a0b9870-b946-46e4-99fe-25bb8a03e2e7@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
commit: 049e40ef203ebdf530cb37a3f5f7752d0c07b288 staging: wlan-ng: Remove unused code
config: x86_64-randconfig-161-20240120 (https://download.01.org/0day-ci/archive/20240120/202401202022.g64TD42E-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401202022.g64TD42E-lkp@intel.com/

New smatch warnings:
drivers/staging/wlan-ng/prism2fw.c:625 mkpdrlist() error: __builtin_memcpy() '&pda->rec[pda->nrec]->data.mfisuprange' too small (8 vs 10)
drivers/staging/wlan-ng/prism2fw.c:634 mkpdrlist() error: __builtin_memcpy() '&pda->rec[pda->nrec]->data.cfisuprange' too small (8 vs 10)

Old smatch warnings:
drivers/staging/wlan-ng/prism2fw.c:951 read_fwfile() error: buffer overflow 'tmpinfo' 4 <= 4

vim +625 drivers/staging/wlan-ng/prism2fw.c

ae24e13a6485a6 Devendra Naga      2012-09-09  603  static int mkpdrlist(struct pda *pda)
76e3e7c4095237 Karl Relton        2009-04-17  604  {
76b4580bf4eaf1 Maciek Borzecki    2017-04-08  605  	__le16 *pda16 = (__le16 *)pda->buf;
76e3e7c4095237 Karl Relton        2009-04-17  606  	int curroff;		/* in 'words' */
76e3e7c4095237 Karl Relton        2009-04-17  607  
76e3e7c4095237 Karl Relton        2009-04-17  608  	pda->nrec = 0;
76e3e7c4095237 Karl Relton        2009-04-17  609  	curroff = 0;
4ccb726c728cb4 Tillmann Heidsieck 2015-09-23  610  	while (curroff < (HFA384x_PDA_LEN_MAX / 2 - 1) &&
75f49e07520d03 Mithlesh Thukral   2009-05-25  611  	       le16_to_cpu(pda16[curroff + 1]) != HFA384x_PDR_END_OF_PDA) {
b586fbd3968a32 Sergio Paracuellos 2016-11-07  612  		pda->rec[pda->nrec] = (struct hfa384x_pdrec *)&pda16[curroff];
76e3e7c4095237 Karl Relton        2009-04-17  613  
cf66823dd22429 Devendra Naga      2012-06-06  614  		if (le16_to_cpu(pda->rec[pda->nrec]->code) ==
cf66823dd22429 Devendra Naga      2012-06-06  615  		    HFA384x_PDR_NICID) {
76e3e7c4095237 Karl Relton        2009-04-17  616  			memcpy(&nicid, &pda->rec[pda->nrec]->data.nicid,
76e3e7c4095237 Karl Relton        2009-04-17  617  			       sizeof(nicid));
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  618  			le16_to_cpus(&nicid.id);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  619  			le16_to_cpus(&nicid.variant);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  620  			le16_to_cpus(&nicid.major);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  621  			le16_to_cpus(&nicid.minor);
76e3e7c4095237 Karl Relton        2009-04-17  622  		}
76e3e7c4095237 Karl Relton        2009-04-17  623  		if (le16_to_cpu(pda->rec[pda->nrec]->code) ==
76e3e7c4095237 Karl Relton        2009-04-17  624  		    HFA384x_PDR_MFISUPRANGE) {
76e3e7c4095237 Karl Relton        2009-04-17 @625  			memcpy(&rfid, &pda->rec[pda->nrec]->data.mfisuprange,
76e3e7c4095237 Karl Relton        2009-04-17  626  			       sizeof(rfid));

So &pda->rec[pda->nrec]->data is a union which used to hold a bunch of
different types in it.  At least two of those types was 60 bytes long.
So when we removed it, then the total size of pda->rec[pda->nrec]->data
became 8 bytes and it triggers a read overflow warning in Smatch.

Here is who ->data is defined now.

drivers/staging/wlan-ng/hfa384x.h
   886  struct hfa384x_pdr_mfisuprange {
   887          u16 id;
   888          u16 variant;
   889          u16 bottom;
   890          u16 top;
   891  } __packed;
   892  
   893  struct hfa384x_pdr_cfisuprange {
   894          u16 id;
   895          u16 variant;
   896          u16 bottom;
   897          u16 top;
   898  } __packed;
   899  
   900  struct hfa384x_pdr_nicid {
   901          u16 id;
   902          u16 variant;
   903          u16 major;
   904          u16 minor;
   905  } __packed;
   906  
   907  struct hfa384x_pdrec {
   908          __le16 len;             /* in words */
   909          __le16 code;
   910          union pdr {
   911                  struct hfa384x_pdr_mfisuprange mfisuprange;
   912                  struct hfa384x_pdr_cfisuprange cfisuprange;
   913                  struct hfa384x_pdr_nicid nicid;
   914  
   915          } data;
   916  } __packed;

And here is how rfid is defined.

   359  struct hfa384x_caplevel {
   360          u16 role;
   361          u16 id;
   362          u16 variant;
   363          u16 bottom;
   364          u16 top;
   365  } __packed;

Obviously it doesn't match.  So probably the code works, but obviously
something is defined incorrectly.

b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  627  			le16_to_cpus(&rfid.id);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  628  			le16_to_cpus(&rfid.variant);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  629  			le16_to_cpus(&rfid.bottom);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  630  			le16_to_cpus(&rfid.top);
76e3e7c4095237 Karl Relton        2009-04-17  631  		}
76e3e7c4095237 Karl Relton        2009-04-17  632  		if (le16_to_cpu(pda->rec[pda->nrec]->code) ==
76e3e7c4095237 Karl Relton        2009-04-17  633  		    HFA384x_PDR_CFISUPRANGE) {
76e3e7c4095237 Karl Relton        2009-04-17 @634  			memcpy(&macid, &pda->rec[pda->nrec]->data.cfisuprange,
76e3e7c4095237 Karl Relton        2009-04-17  635  			       sizeof(macid));

Same thing here.

KTODO: Silence Smatch warning in mkpdrlist()

regards,
dan carpenter

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

