Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F43AF66E
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308705; cv=none; b=hQmqk3Gbg/oTHF0nuENVc6p5K8A5+Ggyx9gFNTGls6dNJ9AK1vvQWbe1b78fz6ML5zYkQUB7Fl2xof1RSgOSFuq+hIJv16HgipMWDnkLxwdI/UEonu/vVWBdZ7jyMlMOAYAchlHIWxCQg4B5pnpF0IBP4WNJ9NggGbawteg0Ivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308705; c=relaxed/simple;
	bh=s2NtY+8guCxUjCQ4cNkEEkse6EC6qBhoocp/+onG7y8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DShkl6bD44vEiSReN2IF1NaC+NhcVse75GW6ZeoEBGYNtqNOkRshsgj4pskHQqCL42ypW+WhrV2T6D3eTLTfYI5K2jxqt+VhFfrJPeLIxeSkdtkPHWsxG5KDwwxePHPHj70ijQoQ/B4Va350O6VvaR8dTOyv9WshwJRDIdiWxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PTdNx8hW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FanetNBU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aHPmh/A+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SU7gGfQq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PTdNx8hW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FanetNBU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aHPmh/A+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SU7gGfQq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B85C7C900;
	Wed, 29 Jul 2026 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785308697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=spXwGubkjNqbrFU+PWVsLMlpX78xo9bIotdwjKpARBs=;
	b=PTdNx8hWkkgnxomTqoggLjIvZWrhIrN8qwGhzP3GzALkR2IUhwGNaSeGvhCFGBZfl+pdng
	oZYMKo1d5by9f1RabF+lHq78f0nE1LfdRcya1gD5uoDMjSz/5zxMJfsJLXhjq1r5FAv7vB
	4v4ldyKwRNusGj62dScBtDkObj60x3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785308697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=spXwGubkjNqbrFU+PWVsLMlpX78xo9bIotdwjKpARBs=;
	b=FanetNBUlqsnuMuy9qXQ1gWjPHpxwKGOHmlZ0ZOJTF9gfYkwvRAzzqg8Msxer0ysEInqSF
	+4bYWSbqAaaD+nAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="aHPmh/A+";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SU7gGfQq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785308693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=spXwGubkjNqbrFU+PWVsLMlpX78xo9bIotdwjKpARBs=;
	b=aHPmh/A+5tXHpcvXWKon7SsVoDIoCbSTB4Qfjo8Ug6HsHl9lpZWDGhdoLqOv/J3WnQ0w8c
	C6BknN7m/zWmsUjojm+0nikbQTryMpvtCXMNV6ILkRvyxxwfwYx2z5aJ1Hl9TBCCY4cliY
	M3RY4wl0SBpQnoV1imPQJsB3NwzxZCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785308693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=spXwGubkjNqbrFU+PWVsLMlpX78xo9bIotdwjKpARBs=;
	b=SU7gGfQqIDaAc3QLYuAduS6SmTlSANV3SB33QeKahVmQ9c+XZhMYdrRuiGEOsJyFSdPMF6
	/58Faej7y1O0RhDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1235779A1;
	Wed, 29 Jul 2026 07:04:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c0ZbORSmaWorfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 07:04:52 +0000
Date: Wed, 29 Jul 2026 09:04:52 +0200
Message-ID: <87jyqe5l9n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	Takashi Iwai <tiwai@suse.de>,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 7970/9778] sound/usb/6fire/chip.c:154 usb6fire_chip_probe() warn: variable dereferenced before check 'card' (see line 123)
In-Reply-To: <202607291057.eO0PgxqY-lkp@intel.com>
References: <202607291057.eO0PgxqY-lkp@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2B85C7C900
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,suse.de:mid,suse.de:dkim,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 29 Jul 2026 07:43:10 +0200,
Dan Carpenter wrote:
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   3652b49adac266a3d27cb41cdfdb7d8790fc3633
> commit: a54bf16965f896415c3337bc4fbb40fb11941d99 [7970/9778] ALSA: 6fire: Fix UAF at error handling during probe
> config: i386-randconfig-141-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291057.eO0PgxqY-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202607291057.eO0PgxqY-lkp@intel.com/
> 
> smatch warnings:
> sound/usb/6fire/chip.c:154 usb6fire_chip_probe() warn: variable dereferenced before check 'card' (see line 123)
> 
> vim +/card +154 sound/usb/6fire/chip.c
> 
> 87f9796a0336ef Bill Pemberton 2012-12-06   70  static int usb6fire_chip_probe(struct usb_interface *intf,
> c6d43ba816d1cf Torsten Schenk 2011-01-24   71  			       const struct usb_device_id *usb_id)
> c6d43ba816d1cf Torsten Schenk 2011-01-24   72  {
> c6d43ba816d1cf Torsten Schenk 2011-01-24   73  	int ret;
> c6d43ba816d1cf Torsten Schenk 2011-01-24   74  	int i;
> c6d43ba816d1cf Torsten Schenk 2011-01-24   75  	struct sfire_chip *chip = NULL;
> c6d43ba816d1cf Torsten Schenk 2011-01-24   76  	struct usb_device *device = interface_to_usbdev(intf);
> c6d43ba816d1cf Torsten Schenk 2011-01-24   77  	int regidx = -1; /* index in module parameter array */
> c6d43ba816d1cf Torsten Schenk 2011-01-24   78  	struct snd_card *card = NULL;
> c6d43ba816d1cf Torsten Schenk 2011-01-24   79  
> c6d43ba816d1cf Torsten Schenk 2011-01-24   80  	/* look if we already serve this card and return if so */
> f3c80e76a0e94c Takashi Iwai   2026-04-14   81  	guard(mutex)(&register_mutex);
> c6d43ba816d1cf Torsten Schenk 2011-01-24   82  	for (i = 0; i < SNDRV_CARDS; i++) {
> 4d5de85b6a9961 Takashi Iwai   2026-04-14   83  		if (chips[i] && chips[i]->dev == device) {
> c6d43ba816d1cf Torsten Schenk 2011-01-24   84  			chips[i]->intf_count++;
> c6d43ba816d1cf Torsten Schenk 2011-01-24   85  			usb_set_intfdata(intf, chips[i]);
> c6d43ba816d1cf Torsten Schenk 2011-01-24   86  			return 0;
> 4d5de85b6a9961 Takashi Iwai   2026-04-14   87  		} else if (!chips[i] && regidx < 0)
> c6d43ba816d1cf Torsten Schenk 2011-01-24   88  			regidx = i;
> c6d43ba816d1cf Torsten Schenk 2011-01-24   89  	}
> c6d43ba816d1cf Torsten Schenk 2011-01-24   90  	if (regidx < 0) {
> e3b3757b92a4df Takashi Iwai   2014-02-26   91  		dev_err(&intf->dev, "too many cards registered.\n");
> c6d43ba816d1cf Torsten Schenk 2011-01-24   92  		return -ENODEV;
> c6d43ba816d1cf Torsten Schenk 2011-01-24   93  	}
> c6d43ba816d1cf Torsten Schenk 2011-01-24   94  
> c6d43ba816d1cf Torsten Schenk 2011-01-24   95  	/* check, if firmware is present on device, upload it if not */
> c6d43ba816d1cf Torsten Schenk 2011-01-24   96  	ret = usb6fire_fw_init(intf);
> c6d43ba816d1cf Torsten Schenk 2011-01-24   97  	if (ret < 0)
> c6d43ba816d1cf Torsten Schenk 2011-01-24   98  		return ret;
> c6d43ba816d1cf Torsten Schenk 2011-01-24   99  	else if (ret == FW_NOT_READY) /* firmware update performed */
> c6d43ba816d1cf Torsten Schenk 2011-01-24  100  		return 0;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  101  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  102  	/* if we are here, card can be registered in alsa. */
> c6d43ba816d1cf Torsten Schenk 2011-01-24  103  	if (usb_set_interface(device, 0, 0) != 0) {
> e3b3757b92a4df Takashi Iwai   2014-02-26  104  		dev_err(&intf->dev, "can't set first interface.\n");
> c6d43ba816d1cf Torsten Schenk 2011-01-24  105  		return -EIO;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  106  	}
> 874b8d422e26e2 Takashi Iwai   2014-01-29  107  	ret = snd_card_new(&intf->dev, index[regidx], id[regidx],
> 874b8d422e26e2 Takashi Iwai   2014-01-29  108  			   THIS_MODULE, sizeof(struct sfire_chip), &card);
> c6d43ba816d1cf Torsten Schenk 2011-01-24  109  	if (ret < 0) {
> e3b3757b92a4df Takashi Iwai   2014-02-26  110  		dev_err(&intf->dev, "cannot create alsa card.\n");
> c6d43ba816d1cf Torsten Schenk 2011-01-24  111  		return ret;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  112  	}
> 19a28b8c7f9f63 Takashi Iwai   2025-07-10  113  	strscpy(card->driver, "6FireUSB");
> 19a28b8c7f9f63 Takashi Iwai   2025-07-10  114  	strscpy(card->shortname, "TerraTec DMX6FireUSB");
> c6d43ba816d1cf Torsten Schenk 2011-01-24  115  	sprintf(card->longname, "%s at %d:%d", card->shortname,
> c6d43ba816d1cf Torsten Schenk 2011-01-24  116  			device->bus->busnum, device->devnum);
> c6d43ba816d1cf Torsten Schenk 2011-01-24  117  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  118  	chip = card->private_data;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  119  	chip->dev = device;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  120  	chip->regidx = regidx;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  121  	chip->intf_count = 1;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  122  	chip->card = card;
> a0810c3d6dd2d2 Takashi Iwai   2024-11-13 @123  	card->private_free = usb6fire_card_free;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  124  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  125  	ret = usb6fire_comm_init(chip);
> f804fff1361c9d Markus Elfring 2017-09-06  126  	if (ret < 0)
> f804fff1361c9d Markus Elfring 2017-09-06  127  		goto destroy_chip;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  128  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  129  	ret = usb6fire_midi_init(chip);
> f804fff1361c9d Markus Elfring 2017-09-06  130  	if (ret < 0)
> f804fff1361c9d Markus Elfring 2017-09-06  131  		goto destroy_chip;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  132  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  133  	ret = usb6fire_pcm_init(chip);
> f804fff1361c9d Markus Elfring 2017-09-06  134  	if (ret < 0)
> f804fff1361c9d Markus Elfring 2017-09-06  135  		goto destroy_chip;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  136  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  137  	ret = usb6fire_control_init(chip);
> f804fff1361c9d Markus Elfring 2017-09-06  138  	if (ret < 0)
> f804fff1361c9d Markus Elfring 2017-09-06  139  		goto destroy_chip;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  140  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  141  	ret = snd_card_register(card);
> c6d43ba816d1cf Torsten Schenk 2011-01-24  142  	if (ret < 0) {
> e3b3757b92a4df Takashi Iwai   2014-02-26  143  		dev_err(&intf->dev, "cannot register card.");
> f804fff1361c9d Markus Elfring 2017-09-06  144  		goto destroy_chip;
> c6d43ba816d1cf Torsten Schenk 2011-01-24  145  	}
> 4d5de85b6a9961 Takashi Iwai   2026-04-14  146  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  147  	usb_set_intfdata(intf, chip);
> 4d5de85b6a9961 Takashi Iwai   2026-04-14  148  	chips[regidx] = chip;
> 4d5de85b6a9961 Takashi Iwai   2026-04-14  149  
> c6d43ba816d1cf Torsten Schenk 2011-01-24  150  	return 0;
> f804fff1361c9d Markus Elfring 2017-09-06  151  
> f804fff1361c9d Markus Elfring 2017-09-06  152  destroy_chip:
> a54bf16965f896 Takashi Iwai   2026-07-26  153  	chip->shutdown = true;
> a54bf16965f896 Takashi Iwai   2026-07-26 @154  	if (card)
> 
> You could delete this check if you want.

Yes, the NULL check is superfluous and can be dropped.


> a54bf16965f896 Takashi Iwai   2026-07-26  155  		snd_card_disconnect(card);
> 
> Setting chip->shutdown = true means that it's pointless to
> call snd_card_disconnect().  It's a no-op.  snd_card_disconnect()
> has a "card->shutdown = 1;"

No, the above is chip->shutdown and it's different from
card->shutdown.


thanks,

Takashi
