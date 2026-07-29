Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C919224E4A1
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 02:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292710; cv=none; b=NtIMcO2Bl+lBWXoYzfff+m9yWBnLPy+jFpaOZq45sLVr6BExrvvCDBsDa7nMQvjRfEMDE2tK2acQcsoVGlvy0FBxaDkhjsyEb/n1gl+hFfNjxrN/CfaTXkDJsJUdkl0Y6mqsZYjaN2OFI54DprNmQXplu0nj8PPa5phO0oevxxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292710; c=relaxed/simple;
	bh=gvBkBQpIY0ob2V5+7vX7ISqW2ty9urWn5DO0DdpdYfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ce4ohtAC/i/BykK7/Jg0rS380LJ6iaFhVAujjKRxQlaxjMEd4RCNKk+/qsYrGidZs/umc9HMvE4z3X+YriFiO0y44dXlW9IiS6NTMgZP9Ngi5QKUnIL61Oz22O+4TT+ExQKD6QSXojJr7/aOYAzzE9m+XBBZVqpW8ng51B9ausc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvEE2+JT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvEE2+JT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785292709; x=1816828709;
  h=date:from:to:cc:subject:message-id;
  bh=gvBkBQpIY0ob2V5+7vX7ISqW2ty9urWn5DO0DdpdYfk=;
  b=SvEE2+JTgS8IHUN9aElIExaKa21EjlAiImXoBq0cCm3RxXJDfCxCtJ6d
   QF5PlzkGq1e9lzZmjXTlsO19TaE/znOEOiFzyzTMcMWFVC1qe8JEr2nyU
   UyhXkcEVUk1xkrr85DUzcDSgDJHKArnwRrDHl8qcgg8j6v4NYwQKMP+jk
   /Iyrt7O/PxlhyCGiWnEnGbk5w6mFX3uVQH++tdMzaLYVskKKUFtSIFw6I
   dY3NaxN/+0efsg9IxKFsK7osEuFbrwBLbX+bJkEDzBljVvIgUqUd03xcD
   rdmheAkq9tuI/TSl0sl+3bgTIrEifHIxYb1XBQNU2kF7PH0gjpWmy+kLw
   Q==;
X-CSE-ConnectionGUID: ATdEHjw9S669MYvSBxMgbQ==
X-CSE-MsgGUID: Ea9JQNkJSy2YRxmWIzATMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86012652"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="86012652"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 19:38:28 -0700
X-CSE-ConnectionGUID: m8MBf5vASqOd9efG8DcS0A==
X-CSE-MsgGUID: xexlkucLS/y58GQhU/WL9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="264161039"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 19:38:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wouBc-00000000eyt-30DL;
	Wed, 29 Jul 2026 02:38:24 +0000
Date: Wed, 29 Jul 2026 10:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7970/9778] sound/usb/6fire/chip.c:154
 usb6fire_chip_probe() warn: variable dereferenced before check 'card' (see
 line 123)
Message-ID: <202607291057.eO0PgxqY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3652b49adac266a3d27cb41cdfdb7d8790fc3633
commit: a54bf16965f896415c3337bc4fbb40fb11941d99 [7970/9778] ALSA: 6fire: Fix UAF at error handling during probe
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
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

c6d43ba816d1cf Torsten Schenk 2011-01-24   69  
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
a54bf16965f896 Takashi Iwai   2026-07-26  155  		snd_card_disconnect(card);
a54bf16965f896 Takashi Iwai   2026-07-26  156  	usb6fire_chip_abort(chip);
a0810c3d6dd2d2 Takashi Iwai   2024-11-13  157  	snd_card_free(card);
f804fff1361c9d Markus Elfring 2017-09-06  158  	return ret;
c6d43ba816d1cf Torsten Schenk 2011-01-24  159  }
c6d43ba816d1cf Torsten Schenk 2011-01-24  160  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
