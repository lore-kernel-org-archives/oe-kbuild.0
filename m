Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E905275861
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755616156; cv=none; b=RQLUfroi2QnAy6j3TjCDDtPHhJgGI6io8oQGBfkyj2LFmv4d5o6IqIxy5m2TyIZIIw/d+lKq3qWBeRKIazpIVS15ykTncTvDPZSYeaF2+SiA80z7hn8dzLqTK3MZkTTRPh2p3rCuSm1j+tctgUpzdX48JjPw09oKdgMF6MqcPNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755616156; c=relaxed/simple;
	bh=1KPpiQ8hagVxzaGyCUhCv9U4Ry9vUGyyrlz8+xXpZfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4CNZSBJnBu/M0TihSRT/tjmJLmRiKX1sx3/Gr2TH93XmpBZsrJzBMeHXLTNwb/MfV+TyxHdJzJMrw8k/Qg1srGUeZMCk77/TLS1tIggIIsKH5ZRMu9QRtgELLRTQ0oHCSFSrOLW6c9af/9MjUIpbH0e92BocD4ScVqvbn3GE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NnW6mdcQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NnW6mdcQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b916fda762so3026551f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755616152; x=1756220952; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7UPGoC7p7M4ZyxE/iJKUZfCO9/xK4vTK1yfysENQ4=;
        b=NnW6mdcQNFduupO1TAoMfsoCnQDpZloIn8Jz6lr4ofCo7ZcT4ty+Y6zMXTrA4OkAE2
         IafyT9bHz7tv6dTENP6nxuffGLKZrC5QqFQUddZ0eao+fIWmVZoRqRUeBk+tWO9VTRM6
         39CttkVWNm+xkcpqyutL2Rd5Tti6MMVP3DzIcrMgreysEXLINb/WYDRjG+1AwWaPd16m
         pPCHqE0Ln/Awu0/lV2Nh/0E5YaiNvkFfMtHLH5vAjZynv7/ILvc+XAhud+L8Rln7hH0d
         dOJT/lNqiwHUDefgitDfPVp2kFnlMP8NMsAufyjM1pWAK2Pmdb6JMOWf2nxpW81YEjOa
         LE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755616152; x=1756220952;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b7UPGoC7p7M4ZyxE/iJKUZfCO9/xK4vTK1yfysENQ4=;
        b=IzQ+AX9TCRnu1HLwKDEPC1Dln0E7WRF6Sov2MjVt5rAlk7R0kA7qHs4gEEDwSt2RbW
         9CnF7YQucqIn/C7tLqruLgTfqVGzUFjcf+5oaLoP72cgglTNPqVWR6WRTbuyCrbODwWq
         nzISmTqsL//qut1M+AW4As5E9BmfbUDrgIQG6omGwO318FLv2L8NL4lq7TLfeloUnLFC
         GtEocYUPVj9NAGPer9GIWskH7uWses9PVnF4hAxUzEhs6NMX/JoHVR0eUViwus7uTfio
         6RwmL3Gq7qhU6ELTZ6ZTqb5b5KzGTJVP7sbAPfhhGFDGN1FGt2hJeCR0UmQLkAbKLOQ8
         HAEA==
X-Gm-Message-State: AOJu0YzLkwbZdSXjQLaSIxq+J2BAaPVS5LbG9MOVmKCTfo9J3HxqraQQ
	6RAmKyRy9ElCGRcDSYvWegpb1mywP4CoRs8LFz8Ajkqud2l1gMuhLQ0d2pSSeLWFtPIp0GOY2Xp
	pn21O
X-Gm-Gg: ASbGncs/YMGvrmFGbBTv6LDc5H0Q/W+hzX8X8FarZVtJ2nXjoSEGwRI76ygitrvg/eF
	a9zTJtPffb/ssGqRThvYmCylA/uRsItp5mQcon8KjIG7o8Hlbs9OhedJlk2q3wCITVbHZRVD+8w
	vpPaftvw+lifZ18CNxM2MnTIq4QzFpRhqCQWKYsKQq72V1LQZIGNj6a89KpCDvZ92ceM8v/LIAh
	vvBhHz2++ElxeIaaJoE/doHIiq9bdUyuGx1hHqxU/EsHuomJ7C39rV+oOzrgRYQygnXhnIZigeP
	JZ/sasNauT3IzLZtxyszUgDU/4AmnHH+EzH1p0o4UGFw/f4/XB1uuw82gAi6uFvjPwjpKjcd7Yc
	FGwDKw4zQsnWh7jm1IxpXyoj6SApowP4ebUOKHxRahJc=
X-Google-Smtp-Source: AGHT+IE1viNjLGpD+HAtjEJG/zvJFF7kbam/xqYb7DdBJ1k+xCzcfb4DF0qP9aBktmah9XbwoOkVFQ==
X-Received: by 2002:a05:6000:18a5:b0:3b8:d8d1:1e72 with SMTP id ffacd0b85a97d-3c147fbe074mr2435307f8f.19.1755616152531;
        Tue, 19 Aug 2025 08:09:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074d43c77sm4218240f8f.23.2025.08.19.08.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:09:12 -0700 (PDT)
Date: Tue, 19 Aug 2025 18:09:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?utf-8?B?xaBlcmlm?= Rami <ramiserifpersia@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 17/18] sound/usb/usx2y/us144mkii_midi.c:65
 tascam_midi_in_urb_complete() error: we previously assumed 'tascam' could be
 null (see line 54)
Message-ID: <202508192109.lcMrINK1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20250819150908.iZvfi52d2KMzCpNyNLugiXmujoyHKPybsfqymtF9Kb8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   d9f0633867711cff87c5604a4f90daa8ab986e4f
commit: 0ec417aa85467c6fad0563621b74868be0faf00d [17/18] ALSA: usb-audio: Add infrastructure for TASCAM US-144MKII
config: powerpc64-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192109.lcMrINK1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508192109.lcMrINK1-lkp@intel.com/

smatch warnings:
sound/usb/usx2y/us144mkii_midi.c:65 tascam_midi_in_urb_complete() error: we previously assumed 'tascam' could be null (see line 54)

vim +/tascam +65 sound/usb/usx2y/us144mkii_midi.c

67afec157fe63d Šerif Rami 2025-08-14  38  
67afec157fe63d Šerif Rami 2025-08-14  39  void tascam_midi_in_urb_complete(struct urb *urb)
67afec157fe63d Šerif Rami 2025-08-14  40  {
67afec157fe63d Šerif Rami 2025-08-14  41  	struct tascam_card *tascam = urb->context;
67afec157fe63d Šerif Rami 2025-08-14  42  	int ret;
67afec157fe63d Šerif Rami 2025-08-14  43  
67afec157fe63d Šerif Rami 2025-08-14  44  	if (urb->status) {
67afec157fe63d Šerif Rami 2025-08-14  45  		if (urb->status != -ENOENT && urb->status != -ECONNRESET &&
67afec157fe63d Šerif Rami 2025-08-14  46  		    urb->status != -ESHUTDOWN && urb->status != -EPROTO) {
67afec157fe63d Šerif Rami 2025-08-14  47  			dev_err_ratelimited(tascam->card->dev,
                                                                                    ^^^^^^^^^^^^
Unchecked dereference.

67afec157fe63d Šerif Rami 2025-08-14  48  					    "MIDI IN URB failed: status %d\n",
67afec157fe63d Šerif Rami 2025-08-14  49  					    urb->status);
67afec157fe63d Šerif Rami 2025-08-14  50  		}
67afec157fe63d Šerif Rami 2025-08-14  51  		goto out;
67afec157fe63d Šerif Rami 2025-08-14  52  	}
67afec157fe63d Šerif Rami 2025-08-14  53  
67afec157fe63d Šerif Rami 2025-08-14 @54  	if (tascam && atomic_read(&tascam->midi_in_active) &&
                                                    ^^^^^^
Is this required?

67afec157fe63d Šerif Rami 2025-08-14  55  	    urb->actual_length > 0) {
67afec157fe63d Šerif Rami 2025-08-14  56  		kfifo_in_spinlocked(&tascam->midi_in_fifo, urb->transfer_buffer,
67afec157fe63d Šerif Rami 2025-08-14  57  				    urb->actual_length, &tascam->midi_in_lock);
67afec157fe63d Šerif Rami 2025-08-14  58  		schedule_work(&tascam->midi_in_work);
67afec157fe63d Šerif Rami 2025-08-14  59  	}
67afec157fe63d Šerif Rami 2025-08-14  60  
67afec157fe63d Šerif Rami 2025-08-14  61  	usb_get_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  62  	usb_anchor_urb(urb, &tascam->midi_in_anchor);
                                                                     ^^^^^^^^
Unchecked dereference.

67afec157fe63d Šerif Rami 2025-08-14  63  	ret = usb_submit_urb(urb, GFP_ATOMIC);
67afec157fe63d Šerif Rami 2025-08-14  64  	if (ret < 0) {
67afec157fe63d Šerif Rami 2025-08-14 @65  		dev_err(tascam->card->dev,
67afec157fe63d Šerif Rami 2025-08-14  66  			"Failed to resubmit MIDI IN URB: error %d\n", ret);
67afec157fe63d Šerif Rami 2025-08-14  67  		usb_unanchor_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  68  		usb_put_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  69  	}
67afec157fe63d Šerif Rami 2025-08-14  70  out:
67afec157fe63d Šerif Rami 2025-08-14  71  	usb_put_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  72  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

