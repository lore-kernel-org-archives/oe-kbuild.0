Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BAEE559
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 02:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708740845; cv=none; b=Pk12cwAKA2Ot0apx2is7d7EjRqmQ5ZVY7nsRM3ZVkCT/zhy/XglDl31ykW9GWRjFjoTEv/BSfh6Z1cLvlVwyN6WElNSS8/czIMcpBmA+FI349tnBiyI5xQ8xob5NTsPkcEgd2ofBLw2JZEQJkkDd9zXiCY5/P4j6iTST+KG7gdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708740845; c=relaxed/simple;
	bh=eMh/PYScfAdK/d8itn+zw0hek5vBmKvEfqi7iZ4SxnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nnZtipbpmcxntnvV6Wqk2g9TFhQvh2oXnD5NNjstquw7qSpoKlDiuQmEvuKEKrlF4fu9oY7Rj57JPw0Z89K0cP5D3fLiW8LUgYp/VeVGSCRXGQdFO8qqxAzbNaZouKikebYfy6JxyphANtOyG/Nhc2ddMLj/gkTRyWmt1DjpDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LB57u5Zj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LB57u5Zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708740843; x=1740276843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eMh/PYScfAdK/d8itn+zw0hek5vBmKvEfqi7iZ4SxnY=;
  b=LB57u5Zjq34xEzixiEqrECfHXB8YfNQgUlDlAfKYKWrNq7UELWgt89kJ
   kci552JlSrQdh2Bu+xEkc/bZSOjOsyEZM3dBsHYs2z8PSy8geBoD+TP2u
   8NZBRKVQHCtgfNMCqjT435OZnq++A5PPEJT+WNsAKCVMTrpjF7SrxyW/5
   3t3C5M4S/7uojCCcAYjSVsXsQH3VawMOXuULH/FUyr1Izqm+tGu6R4USg
   E8J1ymj78rQHSKRBgSeA6YiGQ/aVg71TficjAS6VIJIl3OeTCtVKXxqw7
   VxR/WoXMNUExk4I13uO1pr5mGmETlmMHjNCOoTc3CzhMnuPuCFtbIoTNb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="14516521"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="14516521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 18:14:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10694138"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Feb 2024 18:14:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdhY6-000876-1u;
	Sat, 24 Feb 2024 02:13:58 +0000
Date: Sat, 24 Feb 2024 10:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/emu10k1/voice.c:62 voice_alloc() error: uninitialized
 symbol 'voice'.
Message-ID: <202402241017.wLbpm9AL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   603c04e27c3e9891ce7afa5cd6b496bfacff4206
commit: a915d60426d4348a0b91f9870e299056fd604a32 ALSA: emu10k1: revamp playback voice allocator
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-r081-20240223 (https://download.01.org/0day-ci/archive/20240224/202402241017.wLbpm9AL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402241017.wLbpm9AL-lkp@intel.com/

New smatch warnings:
sound/pci/emu10k1/voice.c:62 voice_alloc() error: uninitialized symbol 'voice'.

Old smatch warnings:
sound/pci/emu10k1/voice.c:124 snd_emu10k1_voice_alloc() error: uninitialized symbol 'result'.

vim +/voice +62 sound/pci/emu10k1/voice.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  21  
^1da177e4c3f415 Linus Torvalds     2005-04-16  22  /* Previously the voice allocator started at 0 every time.  The new voice 
^1da177e4c3f415 Linus Torvalds     2005-04-16  23   * allocator uses a round robin scheme.  The next free voice is tracked in 
^1da177e4c3f415 Linus Torvalds     2005-04-16  24   * the card record and each allocation begins where the last left off.  The 
^1da177e4c3f415 Linus Torvalds     2005-04-16  25   * hardware requires stereo interleaved voices be aligned to an even/odd 
a915d60426d4348 Oswald Buddenhagen 2023-05-18  26   * boundary.
^1da177e4c3f415 Linus Torvalds     2005-04-16  27   *							--rlrevell
^1da177e4c3f415 Linus Torvalds     2005-04-16  28   */
^1da177e4c3f415 Linus Torvalds     2005-04-16  29  
eb4698f347ec908 Takashi Iwai       2005-11-17  30  static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
b4fea2d3f25b5f3 Oswald Buddenhagen 2023-05-18  31  		       struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice)
^1da177e4c3f415 Linus Torvalds     2005-04-16  32  {
eb4698f347ec908 Takashi Iwai       2005-11-17  33  	struct snd_emu10k1_voice *voice;
a915d60426d4348 Oswald Buddenhagen 2023-05-18  34  	int i, j, k, skip;
^1da177e4c3f415 Linus Torvalds     2005-04-16  35  
a915d60426d4348 Oswald Buddenhagen 2023-05-18  36  	for (i = emu->next_free_voice, j = 0; j < NUM_G; i = (i + skip) % NUM_G, j += skip) {
28a97c194cec477 Takashi Iwai       2009-02-05  37  		/*
6f002b02166cc03 Takashi Iwai       2014-02-25  38  		dev_dbg(emu->card->dev, "i %d j %d next free %d!\n",
28a97c194cec477 Takashi Iwai       2009-02-05  39  		       i, j, emu->next_free_voice);
28a97c194cec477 Takashi Iwai       2009-02-05  40  		*/
^1da177e4c3f415 Linus Torvalds     2005-04-16  41  
^1da177e4c3f415 Linus Torvalds     2005-04-16  42  		/* stereo voices must be even/odd */
a915d60426d4348 Oswald Buddenhagen 2023-05-18  43  		if ((number > 1) && (i % 2)) {
a915d60426d4348 Oswald Buddenhagen 2023-05-18  44  			skip = 1;
^1da177e4c3f415 Linus Torvalds     2005-04-16  45  			continue;
^1da177e4c3f415 Linus Torvalds     2005-04-16  46  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  47  
^1da177e4c3f415 Linus Torvalds     2005-04-16  48  		for (k = 0; k < number; k++) {
a915d60426d4348 Oswald Buddenhagen 2023-05-18  49  			voice = &emu->voices[i + k];
^1da177e4c3f415 Linus Torvalds     2005-04-16  50  			if (voice->use) {
a915d60426d4348 Oswald Buddenhagen 2023-05-18  51  				skip = k + 1;
a915d60426d4348 Oswald Buddenhagen 2023-05-18  52  				goto next;
^1da177e4c3f415 Linus Torvalds     2005-04-16  53  			}
^1da177e4c3f415 Linus Torvalds     2005-04-16  54  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  55  
a915d60426d4348 Oswald Buddenhagen 2023-05-18  56  		for (k = 0; k < number; k++) {
a915d60426d4348 Oswald Buddenhagen 2023-05-18  57  			voice = &emu->voices[i + k];
b840f8d8fcb3df9 Oswald Buddenhagen 2023-05-18  58  			voice->use = type;
b4fea2d3f25b5f3 Oswald Buddenhagen 2023-05-18  59  			voice->epcm = epcm;
a915d60426d4348 Oswald Buddenhagen 2023-05-18  60  			/* dev_dbg(emu->card->dev, "allocated voice %d\n", i + k); */
^1da177e4c3f415 Linus Torvalds     2005-04-16  61  		}
a915d60426d4348 Oswald Buddenhagen 2023-05-18 @62  		voice->last = 1;
a915d60426d4348 Oswald Buddenhagen 2023-05-18  63  
a915d60426d4348 Oswald Buddenhagen 2023-05-18  64  		*rvoice = &emu->voices[i];
a915d60426d4348 Oswald Buddenhagen 2023-05-18  65  		emu->next_free_voice = (i + number) % NUM_G;
^1da177e4c3f415 Linus Torvalds     2005-04-16  66  		return 0;
a915d60426d4348 Oswald Buddenhagen 2023-05-18  67  
a915d60426d4348 Oswald Buddenhagen 2023-05-18  68  	next: ;
a915d60426d4348 Oswald Buddenhagen 2023-05-18  69  	}
a915d60426d4348 Oswald Buddenhagen 2023-05-18  70  	return -ENOMEM;  // -EBUSY would have been better
^1da177e4c3f415 Linus Torvalds     2005-04-16  71  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
