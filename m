Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB953B5841
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 05:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785303798; cv=none; b=gSPgZsI70moJbwvbLRoSXcrEWXqEDMg90JWUfvnncd4FbmSk8Ghvu+GwqiNKwcOPuRV3aPf4W1ydT8m0muDnS20JXxnAqcS4QqIMLifxr5MHRucj+dFZeeItgBHcGU6B2H9rwkpT6TcAIbm1YRxdpmetOLbfRipTWwj3q4NPGCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785303798; c=relaxed/simple;
	bh=Qz3dPx3bwthAf+do+I7uz9VE6eCMPEJZNQSprXGgthc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdvT3g6ZDjR4t4HzN3Egpa+jwrgtE+WVWyUjfKOKT040yiJ/k71ioUJcrXQBKdem6xpuRrKSALcrqUxbOneR+5JfnNkQ8z7sH7jbEDMaKhkSHtmN0gXAu+Nup9/qc7fu8FG7iXhFgu+xz5ARr1sppm9AYAJdUGCLSIOgE9a/Uj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDkrIE8+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDkrIE8+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954afac04bso5923445e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 22:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785303795; x=1785908595; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swvhDz3kyJ/SlqLpZE3Jh0FZynfZghCEQng/U4Gd79I=;
        b=jDkrIE8+JivD7cJhJYUSZuEkkCSOR2Gmt1PwSDQHimLT7d28LifFNd4kvZm58pggOY
         +D2MVp8xqHqvVdwbniX+vvp42uUXPhRNYY6IL2KRkIGrHjVxk+ntZubPmTfVfpblmFcZ
         ks7hlbRMkN6YPu+1iLsuuxSHR9NtUR7AhWi1xYs1PzxW70Qo33LhH1phZ8mCTshyf93l
         fXDO3gPcomtrIWRARCY/9Mc99uWf/91OCbnHenq4Th4zm3nXaQQPw+Ncxpk+XxkPw6Na
         iePgKzk+qpjBRbw2pAEspWGmoapzlldlmTwLF/2of66JCek+H1GcKGwhRqdAgr9A5FJo
         fxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785303795; x=1785908595;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swvhDz3kyJ/SlqLpZE3Jh0FZynfZghCEQng/U4Gd79I=;
        b=Al9LZsjaDGTZDD/2giZkqTxeGSuloa49kCmoi5IHdsdxTJfwLneMctOReIzq7ClkF1
         tTRyzOjtLoswcOp0pmakXn+Em4YoUB30i7NlAyl7Z2LHDWllloCO7yV2F3xdzD7t8fMn
         0tbJyeV+dLLs1u2K/FLBs03jOsMQ1PwLhwYa+n69Zv5uOfWjHBMeNI8KP8lKiLpC+aaf
         a1grcepTIfArub8DiWuL9lNdDWQ3iGy5W6EuzxSMo+WVgD5UzRGFcHTjSPWv+uAXCX1b
         ym+dEzg0m2jdM1uXWnivBiR1P3HHIKeeIV//m2B8zLEu0LBpP4rjZUqyUZAxaCVuP+/O
         1jbQ==
X-Gm-Message-State: AOJu0YyQOuZHqINNgtQqDWxfno0Dxczwne5PuV2uSR2JAmvek/x8uoV5
	UlAyd/Tt7ZyH2MtP4RQTmlkXQMcs+9DLnvA59igL6EZHCr322lZ+dgukpmO9esfX5gs=
X-Gm-Gg: AR+sD10+4UmXTugK22Yg8W1SaOJGPmmOnaLENajYhZrbNGis4Sqhnnx49y5uu7tOjA4
	H1LH+M5vTAoXNBfsszEp2ou/YQ+BQOjlchSMjAQ02Re9gl4c44lpZGDCSK86iPOSDxtxvMNd98y
	0z4eeWqmR6SvnpIoqlB5VgSDZ6DtZ5DTTFj9wIHzMkNMt8mH4C3YHRi+JlkP705eqwnWVczjv+L
	+k+lCsjxZfa6uoFvmAY6vIVXROuNZNTTZkax6P10boVQaHdyLqcCnotz99+yEIv6y5tkpojYlUW
	nS9DoQR6ymkxAWwbnvjZ0pc+RgBpKS+rXvtyt6N2j+CIn46o6TDSxQnxUZ3oCCUrD9Q6uLvQSME
	G+PLQUuEbpIZOzuOJ83ne07ko1ebOnNwVprDltUmqL7rNGeRi6/F+PKFVXSpPuYkRGnkZ3VtKGg
	cWjkTdbR4SwqCCuNZdYnolHWl8PgYjQqQ5FK82DJKMU1CHXlquF4cLbMym2GxTvvr2jRU=
X-Received: by 2002:a05:600c:b85:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-496c653c8cfmr64279375e9.7.1785303795387;
        Tue, 28 Jul 2026 22:43:15 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4615f5fsm122297915e9.9.2026.07.28.22.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:43:14 -0700 (PDT)
Date: Wed, 29 Jul 2026 08:43:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7970/9778] sound/usb/6fire/chip.c:154
 usb6fire_chip_probe() warn: variable dereferenced before check 'card' (see
 line 123)
Message-ID: <202607291057.eO0PgxqY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260729054310.JCW7OPhF0wCU0WdN5FrtpJ8BukNAvYRli73Q0RX4pb4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3652b49adac266a3d27cb41cdfdb7d8790fc3633
commit: a54bf16965f896415c3337bc4fbb40fb11941d99 [7970/9778] ALSA: 6fire: Fix UAF at error handling during probe
config: i386-randconfig-141-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291057.eO0PgxqY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607291057.eO0PgxqY-lkp@intel.com/

smatch warnings:
sound/usb/6fire/chip.c:154 usb6fire_chip_probe() warn: variable dereferenced before check 'card' (see line 123)

vim +/card +154 sound/usb/6fire/chip.c

87f9796a0336ef Bill Pemberton 2012-12-06   70  static int usb6fire_chip_probe(struct usb_interface *intf,
c6d43ba816d1cf Torsten Schenk 2011-01-24   71  			       const struct usb_device_id *usb_id)
c6d43ba816d1cf Torsten Schenk 2011-01-24   72  {
c6d43ba816d1cf Torsten Schenk 2011-01-24   73  	int ret;
c6d43ba816d1cf Torsten Schenk 2011-01-24   74  	int i;
c6d43ba816d1cf Torsten Schenk 2011-01-24   75  	struct sfire_chip *chip = NULL;
c6d43ba816d1cf Torsten Schenk 2011-01-24   76  	struct usb_device *device = interface_to_usbdev(intf);
c6d43ba816d1cf Torsten Schenk 2011-01-24   77  	int regidx = -1; /* index in module parameter array */
c6d43ba816d1cf Torsten Schenk 2011-01-24   78  	struct snd_card *card = NULL;
c6d43ba816d1cf Torsten Schenk 2011-01-24   79  
c6d43ba816d1cf Torsten Schenk 2011-01-24   80  	/* look if we already serve this card and return if so */
f3c80e76a0e94c Takashi Iwai   2026-04-14   81  	guard(mutex)(&register_mutex);
c6d43ba816d1cf Torsten Schenk 2011-01-24   82  	for (i = 0; i < SNDRV_CARDS; i++) {
4d5de85b6a9961 Takashi Iwai   2026-04-14   83  		if (chips[i] && chips[i]->dev == device) {
c6d43ba816d1cf Torsten Schenk 2011-01-24   84  			chips[i]->intf_count++;
c6d43ba816d1cf Torsten Schenk 2011-01-24   85  			usb_set_intfdata(intf, chips[i]);
c6d43ba816d1cf Torsten Schenk 2011-01-24   86  			return 0;
4d5de85b6a9961 Takashi Iwai   2026-04-14   87  		} else if (!chips[i] && regidx < 0)
c6d43ba816d1cf Torsten Schenk 2011-01-24   88  			regidx = i;
c6d43ba816d1cf Torsten Schenk 2011-01-24   89  	}
c6d43ba816d1cf Torsten Schenk 2011-01-24   90  	if (regidx < 0) {
e3b3757b92a4df Takashi Iwai   2014-02-26   91  		dev_err(&intf->dev, "too many cards registered.\n");
c6d43ba816d1cf Torsten Schenk 2011-01-24   92  		return -ENODEV;
c6d43ba816d1cf Torsten Schenk 2011-01-24   93  	}
c6d43ba816d1cf Torsten Schenk 2011-01-24   94  
c6d43ba816d1cf Torsten Schenk 2011-01-24   95  	/* check, if firmware is present on device, upload it if not */
c6d43ba816d1cf Torsten Schenk 2011-01-24   96  	ret = usb6fire_fw_init(intf);
c6d43ba816d1cf Torsten Schenk 2011-01-24   97  	if (ret < 0)
c6d43ba816d1cf Torsten Schenk 2011-01-24   98  		return ret;
c6d43ba816d1cf Torsten Schenk 2011-01-24   99  	else if (ret == FW_NOT_READY) /* firmware update performed */
c6d43ba816d1cf Torsten Schenk 2011-01-24  100  		return 0;
c6d43ba816d1cf Torsten Schenk 2011-01-24  101  
c6d43ba816d1cf Torsten Schenk 2011-01-24  102  	/* if we are here, card can be registered in alsa. */
c6d43ba816d1cf Torsten Schenk 2011-01-24  103  	if (usb_set_interface(device, 0, 0) != 0) {
e3b3757b92a4df Takashi Iwai   2014-02-26  104  		dev_err(&intf->dev, "can't set first interface.\n");
c6d43ba816d1cf Torsten Schenk 2011-01-24  105  		return -EIO;
c6d43ba816d1cf Torsten Schenk 2011-01-24  106  	}
874b8d422e26e2 Takashi Iwai   2014-01-29  107  	ret = snd_card_new(&intf->dev, index[regidx], id[regidx],
874b8d422e26e2 Takashi Iwai   2014-01-29  108  			   THIS_MODULE, sizeof(struct sfire_chip), &card);
c6d43ba816d1cf Torsten Schenk 2011-01-24  109  	if (ret < 0) {
e3b3757b92a4df Takashi Iwai   2014-02-26  110  		dev_err(&intf->dev, "cannot create alsa card.\n");
c6d43ba816d1cf Torsten Schenk 2011-01-24  111  		return ret;
c6d43ba816d1cf Torsten Schenk 2011-01-24  112  	}
19a28b8c7f9f63 Takashi Iwai   2025-07-10  113  	strscpy(card->driver, "6FireUSB");
19a28b8c7f9f63 Takashi Iwai   2025-07-10  114  	strscpy(card->shortname, "TerraTec DMX6FireUSB");
c6d43ba816d1cf Torsten Schenk 2011-01-24  115  	sprintf(card->longname, "%s at %d:%d", card->shortname,
c6d43ba816d1cf Torsten Schenk 2011-01-24  116  			device->bus->busnum, device->devnum);
c6d43ba816d1cf Torsten Schenk 2011-01-24  117  
c6d43ba816d1cf Torsten Schenk 2011-01-24  118  	chip = card->private_data;
c6d43ba816d1cf Torsten Schenk 2011-01-24  119  	chip->dev = device;
c6d43ba816d1cf Torsten Schenk 2011-01-24  120  	chip->regidx = regidx;
c6d43ba816d1cf Torsten Schenk 2011-01-24  121  	chip->intf_count = 1;
c6d43ba816d1cf Torsten Schenk 2011-01-24  122  	chip->card = card;
a0810c3d6dd2d2 Takashi Iwai   2024-11-13 @123  	card->private_free = usb6fire_card_free;
c6d43ba816d1cf Torsten Schenk 2011-01-24  124  
c6d43ba816d1cf Torsten Schenk 2011-01-24  125  	ret = usb6fire_comm_init(chip);
f804fff1361c9d Markus Elfring 2017-09-06  126  	if (ret < 0)
f804fff1361c9d Markus Elfring 2017-09-06  127  		goto destroy_chip;
c6d43ba816d1cf Torsten Schenk 2011-01-24  128  
c6d43ba816d1cf Torsten Schenk 2011-01-24  129  	ret = usb6fire_midi_init(chip);
f804fff1361c9d Markus Elfring 2017-09-06  130  	if (ret < 0)
f804fff1361c9d Markus Elfring 2017-09-06  131  		goto destroy_chip;
c6d43ba816d1cf Torsten Schenk 2011-01-24  132  
c6d43ba816d1cf Torsten Schenk 2011-01-24  133  	ret = usb6fire_pcm_init(chip);
f804fff1361c9d Markus Elfring 2017-09-06  134  	if (ret < 0)
f804fff1361c9d Markus Elfring 2017-09-06  135  		goto destroy_chip;
c6d43ba816d1cf Torsten Schenk 2011-01-24  136  
c6d43ba816d1cf Torsten Schenk 2011-01-24  137  	ret = usb6fire_control_init(chip);
f804fff1361c9d Markus Elfring 2017-09-06  138  	if (ret < 0)
f804fff1361c9d Markus Elfring 2017-09-06  139  		goto destroy_chip;
c6d43ba816d1cf Torsten Schenk 2011-01-24  140  
c6d43ba816d1cf Torsten Schenk 2011-01-24  141  	ret = snd_card_register(card);
c6d43ba816d1cf Torsten Schenk 2011-01-24  142  	if (ret < 0) {
e3b3757b92a4df Takashi Iwai   2014-02-26  143  		dev_err(&intf->dev, "cannot register card.");
f804fff1361c9d Markus Elfring 2017-09-06  144  		goto destroy_chip;
c6d43ba816d1cf Torsten Schenk 2011-01-24  145  	}
4d5de85b6a9961 Takashi Iwai   2026-04-14  146  
c6d43ba816d1cf Torsten Schenk 2011-01-24  147  	usb_set_intfdata(intf, chip);
4d5de85b6a9961 Takashi Iwai   2026-04-14  148  	chips[regidx] = chip;
4d5de85b6a9961 Takashi Iwai   2026-04-14  149  
c6d43ba816d1cf Torsten Schenk 2011-01-24  150  	return 0;
f804fff1361c9d Markus Elfring 2017-09-06  151  
f804fff1361c9d Markus Elfring 2017-09-06  152  destroy_chip:
a54bf16965f896 Takashi Iwai   2026-07-26  153  	chip->shutdown = true;
a54bf16965f896 Takashi Iwai   2026-07-26 @154  	if (card)

You could delete this check if you want.

a54bf16965f896 Takashi Iwai   2026-07-26  155  		snd_card_disconnect(card);

Setting chip->shutdown = true means that it's pointless to
call snd_card_disconnect().  It's a no-op.  snd_card_disconnect()
has a "card->shutdown = 1;"

a54bf16965f896 Takashi Iwai   2026-07-26  156  	usb6fire_chip_abort(chip);
a0810c3d6dd2d2 Takashi Iwai   2024-11-13  157  	snd_card_free(card);
f804fff1361c9d Markus Elfring 2017-09-06  158  	return ret;
c6d43ba816d1cf Torsten Schenk 2011-01-24  159  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

