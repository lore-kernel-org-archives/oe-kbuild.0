Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EA2279DC0
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611743; cv=none; b=o2p6fTrUkNsijDBMsRZwQS2fXoWhrsZDzWaVAMPOKPpLrpKKBuXVPc/qaRkz4M5clLLcnQ6zJXrsDxWyuk/BU9JQXSwANFi9WzjgQhDxl7i3QJUqxtxVbJmwgDbPLUyxPHpvYgQpXT+YQT6O6Ec65n8gyAjKOx9UguQUjZDXie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611743; c=relaxed/simple;
	bh=mPIn/w9fqa/EhK+nFkl1NxgEh1cc/JsFSldrM05ps4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5+FrJsMDQBb8NpOEQ6Wt1TvuzbOxIG02qmeCnymxttCEk6i36SxrH3VcJc33iseHSvYzuYnu1Fb1QP3td+47XcWrU9IygQolmxV5n/z1JFccH5MTs4/VKnwMaSo49uIPZhgh4dqXmTXux1ybozI9FE1FAqa7Kll2u43q9+y/ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSw+gvo9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSw+gvo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755611741; x=1787147741;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mPIn/w9fqa/EhK+nFkl1NxgEh1cc/JsFSldrM05ps4Y=;
  b=gSw+gvo9cG8qD5lF7dsop5sNhhvMf6Xyc2ywxdG3xiTHJYNY5/PrbpU2
   KruogvZ4Fx/Zs66PxKIl/B1e+aufK94ePkuq22I/yZ4C+f7uIfjzpDPeh
   nwevIhktZGrxLQYtafkrZjWweg5TTZxqE1aB43ARjUVQ7E4raaj35ge5+
   bd7ezEXPmJmVS9VOQrrFMvGCMbiowK69dzfugRzPWauCzeXYUB3LPiDPJ
   9tUXcS22SiPrjhSrC0FGyP7+WprtbdiZX7pPcm53IpSx3peqAJ8vD8qAh
   r4JHvwWeFewBOnwSUW2VVX83NnQx1oTz4dqUOq3nu45sx2h20frZS9JMl
   g==;
X-CSE-ConnectionGUID: ZIe/TdTiSEmOu22OONfSsQ==
X-CSE-MsgGUID: bB8nlYbxSf2oOw0+V3pe7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68952565"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="68952565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 06:55:39 -0700
X-CSE-ConnectionGUID: 8kRx58pTTM+pJUEuEvFj9w==
X-CSE-MsgGUID: lumjGD5vQ+ufOoWYzWzc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168261086"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 Aug 2025 06:55:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoMoK-000GyI-0L;
	Tue, 19 Aug 2025 13:55:36 +0000
Date: Tue, 19 Aug 2025 21:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: alsa-devel@alsa-project.org
TO: "Šerif Rami" <ramiserifpersia@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   d9f0633867711cff87c5604a4f90daa8ab986e4f
commit: 0ec417aa85467c6fad0563621b74868be0faf00d [17/18] ALSA: usb-audio: Add infrastructure for TASCAM US-144MKII
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192109.lcMrINK1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
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
67afec157fe63d Šerif Rami 2025-08-14  48  					    "MIDI IN URB failed: status %d\n",
67afec157fe63d Šerif Rami 2025-08-14  49  					    urb->status);
67afec157fe63d Šerif Rami 2025-08-14  50  		}
67afec157fe63d Šerif Rami 2025-08-14  51  		goto out;
67afec157fe63d Šerif Rami 2025-08-14  52  	}
67afec157fe63d Šerif Rami 2025-08-14  53  
67afec157fe63d Šerif Rami 2025-08-14 @54  	if (tascam && atomic_read(&tascam->midi_in_active) &&
67afec157fe63d Šerif Rami 2025-08-14  55  	    urb->actual_length > 0) {
67afec157fe63d Šerif Rami 2025-08-14  56  		kfifo_in_spinlocked(&tascam->midi_in_fifo, urb->transfer_buffer,
67afec157fe63d Šerif Rami 2025-08-14  57  				    urb->actual_length, &tascam->midi_in_lock);
67afec157fe63d Šerif Rami 2025-08-14  58  		schedule_work(&tascam->midi_in_work);
67afec157fe63d Šerif Rami 2025-08-14  59  	}
67afec157fe63d Šerif Rami 2025-08-14  60  
67afec157fe63d Šerif Rami 2025-08-14  61  	usb_get_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  62  	usb_anchor_urb(urb, &tascam->midi_in_anchor);
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
67afec157fe63d Šerif Rami 2025-08-14  73  

:::::: The code at line 65 was first introduced by commit
:::::: 67afec157fe63d37f0d8f46fbe11a61364718ece ALSA: usb-audio: us144mkii: Add MIDI support and mixer controls

:::::: TO: Šerif Rami <ramiserifpersia@gmail.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
