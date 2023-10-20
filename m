Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C402FE09
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Oct 2023 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKwZiBIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697839053; x=1729375053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOv2JJAJJ1s9oW5q/72YjjZeLDCYywSsuKy/HcVAtS0=;
  b=eKwZiBIpTzOvXIR0JZ12f4MQwfGHX1v8kbiu8e1Tq5TTNnWsvLLROYCs
   t51bZSOWHOA60CpXLm3uRwM04XeaBDGCIADrFk8ZF+bW89Om13be5EEKO
   NNGA89/37JBsXuuPG5BzHWr2R1SI1AWdhO9p53yOQzRA3yaROptQXcO5l
   B5wu2O6EW9TC795g8rWLR3MymSqPHm3hFqdOZpjSjZfU3zGRHG0blcPSh
   gK3ZFYqkIamPW7cbPABMhI7Hd1U55ZtM1gtBwcaeP7/uVMvEiWFAzX2br
   /s5jn+HBhcU5QnJt88/Wp+T2LQkYQKSSB+JNFqbhq5NGHO/HrkhGNOa21
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371650426"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="371650426"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 14:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="707347671"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="707347671"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Oct 2023 14:57:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtxUn-00041K-17;
	Fri, 20 Oct 2023 21:57:29 +0000
Date: Sat, 21 Oct 2023 05:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/emu10k1/voice.c:62 voice_alloc() error: potentially
 dereferencing uninitialized 'voice'.
Message-ID: <202310210519.CDJVqqYI-lkp@intel.com>
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
head:   c3200081020d63f6c6bfd8a6db2ae8a5b99b348a
commit: a915d60426d4348a0b91f9870e299056fd604a32 ALSA: emu10k1: revamp playback voice allocator
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20231019 (https://download.01.org/0day-ci/archive/20231021/202310210519.CDJVqqYI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210519.CDJVqqYI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310210519.CDJVqqYI-lkp@intel.com/

smatch warnings:
sound/pci/emu10k1/voice.c:62 voice_alloc() error: potentially dereferencing uninitialized 'voice'.
sound/pci/emu10k1/voice.c:124 snd_emu10k1_voice_alloc() error: uninitialized symbol 'result'.

vim +/voice +62 sound/pci/emu10k1/voice.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   21  
^1da177e4c3f41 Linus Torvalds     2005-04-16   22  /* Previously the voice allocator started at 0 every time.  The new voice 
^1da177e4c3f41 Linus Torvalds     2005-04-16   23   * allocator uses a round robin scheme.  The next free voice is tracked in 
^1da177e4c3f41 Linus Torvalds     2005-04-16   24   * the card record and each allocation begins where the last left off.  The 
^1da177e4c3f41 Linus Torvalds     2005-04-16   25   * hardware requires stereo interleaved voices be aligned to an even/odd 
a915d60426d434 Oswald Buddenhagen 2023-05-18   26   * boundary.
^1da177e4c3f41 Linus Torvalds     2005-04-16   27   *							--rlrevell
^1da177e4c3f41 Linus Torvalds     2005-04-16   28   */
^1da177e4c3f41 Linus Torvalds     2005-04-16   29  
eb4698f347ec90 Takashi Iwai       2005-11-17   30  static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
b4fea2d3f25b5f Oswald Buddenhagen 2023-05-18   31  		       struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice)
^1da177e4c3f41 Linus Torvalds     2005-04-16   32  {
eb4698f347ec90 Takashi Iwai       2005-11-17   33  	struct snd_emu10k1_voice *voice;
a915d60426d434 Oswald Buddenhagen 2023-05-18   34  	int i, j, k, skip;
^1da177e4c3f41 Linus Torvalds     2005-04-16   35  
a915d60426d434 Oswald Buddenhagen 2023-05-18   36  	for (i = emu->next_free_voice, j = 0; j < NUM_G; i = (i + skip) % NUM_G, j += skip) {
28a97c194cec47 Takashi Iwai       2009-02-05   37  		/*
6f002b02166cc0 Takashi Iwai       2014-02-25   38  		dev_dbg(emu->card->dev, "i %d j %d next free %d!\n",
28a97c194cec47 Takashi Iwai       2009-02-05   39  		       i, j, emu->next_free_voice);
28a97c194cec47 Takashi Iwai       2009-02-05   40  		*/
^1da177e4c3f41 Linus Torvalds     2005-04-16   41  
^1da177e4c3f41 Linus Torvalds     2005-04-16   42  		/* stereo voices must be even/odd */
a915d60426d434 Oswald Buddenhagen 2023-05-18   43  		if ((number > 1) && (i % 2)) {
a915d60426d434 Oswald Buddenhagen 2023-05-18   44  			skip = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16   45  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16   46  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16   47  
^1da177e4c3f41 Linus Torvalds     2005-04-16   48  		for (k = 0; k < number; k++) {
a915d60426d434 Oswald Buddenhagen 2023-05-18   49  			voice = &emu->voices[i + k];
^1da177e4c3f41 Linus Torvalds     2005-04-16   50  			if (voice->use) {
a915d60426d434 Oswald Buddenhagen 2023-05-18   51  				skip = k + 1;
a915d60426d434 Oswald Buddenhagen 2023-05-18   52  				goto next;
^1da177e4c3f41 Linus Torvalds     2005-04-16   53  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16   54  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16   55  
a915d60426d434 Oswald Buddenhagen 2023-05-18   56  		for (k = 0; k < number; k++) {
a915d60426d434 Oswald Buddenhagen 2023-05-18   57  			voice = &emu->voices[i + k];
b840f8d8fcb3df Oswald Buddenhagen 2023-05-18   58  			voice->use = type;
b4fea2d3f25b5f Oswald Buddenhagen 2023-05-18   59  			voice->epcm = epcm;
a915d60426d434 Oswald Buddenhagen 2023-05-18   60  			/* dev_dbg(emu->card->dev, "allocated voice %d\n", i + k); */
^1da177e4c3f41 Linus Torvalds     2005-04-16   61  		}
a915d60426d434 Oswald Buddenhagen 2023-05-18  @62  		voice->last = 1;
a915d60426d434 Oswald Buddenhagen 2023-05-18   63  
a915d60426d434 Oswald Buddenhagen 2023-05-18   64  		*rvoice = &emu->voices[i];
a915d60426d434 Oswald Buddenhagen 2023-05-18   65  		emu->next_free_voice = (i + number) % NUM_G;
^1da177e4c3f41 Linus Torvalds     2005-04-16   66  		return 0;
a915d60426d434 Oswald Buddenhagen 2023-05-18   67  
a915d60426d434 Oswald Buddenhagen 2023-05-18   68  	next: ;
a915d60426d434 Oswald Buddenhagen 2023-05-18   69  	}
a915d60426d434 Oswald Buddenhagen 2023-05-18   70  	return -ENOMEM;  // -EBUSY would have been better
^1da177e4c3f41 Linus Torvalds     2005-04-16   71  }
^1da177e4c3f41 Linus Torvalds     2005-04-16   72  
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18   73  static void voice_free(struct snd_emu10k1 *emu,
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18   74  		       struct snd_emu10k1_voice *pvoice)
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18   75  {
82a9fa6e9e3c76 Oswald Buddenhagen 2023-05-18   76  	if (pvoice->dirty)
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18   77  		snd_emu10k1_voice_init(emu, pvoice->number);
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18   78  	pvoice->interrupt = NULL;
a915d60426d434 Oswald Buddenhagen 2023-05-18   79  	pvoice->use = pvoice->dirty = pvoice->last = 0;
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18   80  	pvoice->epcm = NULL;
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18   81  }
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18   82  
a915d60426d434 Oswald Buddenhagen 2023-05-18   83  int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int count, int channels,
b4fea2d3f25b5f Oswald Buddenhagen 2023-05-18   84  			    struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice)
^1da177e4c3f41 Linus Torvalds     2005-04-16   85  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   86  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16   87  	int result;
^1da177e4c3f41 Linus Torvalds     2005-04-16   88  
da3cec35dd3c31 Takashi Iwai       2008-08-08   89  	if (snd_BUG_ON(!rvoice))
da3cec35dd3c31 Takashi Iwai       2008-08-08   90  		return -EINVAL;
a915d60426d434 Oswald Buddenhagen 2023-05-18   91  	if (snd_BUG_ON(!count))
a915d60426d434 Oswald Buddenhagen 2023-05-18   92  		return -EINVAL;
a915d60426d434 Oswald Buddenhagen 2023-05-18   93  	if (snd_BUG_ON(!channels))
da3cec35dd3c31 Takashi Iwai       2008-08-08   94  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   95  
^1da177e4c3f41 Linus Torvalds     2005-04-16   96  	spin_lock_irqsave(&emu->voice_lock, flags);
a915d60426d434 Oswald Buddenhagen 2023-05-18   97  	for (int got = 0; got < channels; ) {
a915d60426d434 Oswald Buddenhagen 2023-05-18   98  		result = voice_alloc(emu, type, count, epcm, &rvoice[got]);
a915d60426d434 Oswald Buddenhagen 2023-05-18   99  		if (result == 0) {
a915d60426d434 Oswald Buddenhagen 2023-05-18  100  			got++;
a915d60426d434 Oswald Buddenhagen 2023-05-18  101  			/*
a915d60426d434 Oswald Buddenhagen 2023-05-18  102  			dev_dbg(emu->card->dev, "voice alloc - %i, %i of %i\n",
a915d60426d434 Oswald Buddenhagen 2023-05-18  103  			        rvoice[got - 1]->number, got, want);
a915d60426d434 Oswald Buddenhagen 2023-05-18  104  			*/
a915d60426d434 Oswald Buddenhagen 2023-05-18  105  			continue;
a915d60426d434 Oswald Buddenhagen 2023-05-18  106  		}
a915d60426d434 Oswald Buddenhagen 2023-05-18  107  		if (type != EMU10K1_SYNTH && emu->get_synth_voice) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  108  			/* free a voice from synth */
^1da177e4c3f41 Linus Torvalds     2005-04-16  109  			result = emu->get_synth_voice(emu);
a915d60426d434 Oswald Buddenhagen 2023-05-18  110  			if (result >= 0) {
3eb5b1d0a11d1d Oswald Buddenhagen 2023-05-18  111  				voice_free(emu, &emu->voices[result]);
a915d60426d434 Oswald Buddenhagen 2023-05-18  112  				continue;
a915d60426d434 Oswald Buddenhagen 2023-05-18  113  			}
a915d60426d434 Oswald Buddenhagen 2023-05-18  114  		}
a915d60426d434 Oswald Buddenhagen 2023-05-18  115  		for (int i = 0; i < got; i++) {
a915d60426d434 Oswald Buddenhagen 2023-05-18  116  			for (int j = 0; j < count; j++)
a915d60426d434 Oswald Buddenhagen 2023-05-18  117  				voice_free(emu, rvoice[i] + j);
a915d60426d434 Oswald Buddenhagen 2023-05-18  118  			rvoice[i] = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  119  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  120  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  121  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  122  	spin_unlock_irqrestore(&emu->voice_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  123  
^1da177e4c3f41 Linus Torvalds     2005-04-16 @124  	return result;
^1da177e4c3f41 Linus Torvalds     2005-04-16  125  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
