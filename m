Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A0E3C4B64
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 02:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778813585; cv=none; b=gGcdowVbMaBlxIXtnYbxFUE/Ugx1OC/R+Ou0kkUIKqIumqe1pDe+b9j5u7x5lhIQrQSkKRHolJFDrAO6RjjhI0v1joOzP/EYgco6sHLi4u4V97txXXCcGArSec07ahoh/B6/gCtBF1D03Cxagl0YJnRP64JehCp7ppqDCMR5/nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778813585; c=relaxed/simple;
	bh=hOGAXRt9fWkORDTj4KCogMptICJKfIjxTeoRyIESGyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q4er5ozQ/uxlzGpkjz4KisSfcC475BPYTIhBS3n1G6tdT74+DFmBFwSCh+sliqA8O1j6QgjXu8QBGyvZ3tXKJJKEKaZx7Y8EsbbS1ZivdAnc7OMHTo52LLMZa/lY76FogSz07Dv7b7JVsFUZFF1dM44HOQ2e5aK3lY9/bEfwJ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imVF7m/9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imVF7m/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778813580; x=1810349580;
  h=date:from:to:cc:subject:message-id;
  bh=hOGAXRt9fWkORDTj4KCogMptICJKfIjxTeoRyIESGyY=;
  b=imVF7m/9Ultj6Id4q6P97XlNPmLWNQxq3ZNq9DnCoY3bx66TrFkPjpmw
   LVT+SZkIiP+WGYMrTSlCw3Dwun72Jy2cTUf5GbjoPbxIyc9KuIQJyuUK5
   CScy0N30uZs5Cn1soahQZkSplYKPqsys+FYkXwLYmnqbg6752DGhlwix2
   TdwRVvJroTgPrtZbxdpbooP3xF0euEXGlG4CClPVa834ATHAeepxx0drn
   A8saaAL1B3D6Is9qZ8XYapVRj3QyRFpIwcKs8gusF+MtLVfyPXqbVo54K
   /z+KZeHpEbazSQs3S1wWM+h+Q5SEeq0qFMvOULFezEtDwEpxBLxd3ZH5Z
   A==;
X-CSE-ConnectionGUID: idmDa/OATPictkFhBOJKnw==
X-CSE-MsgGUID: vtKXgslyTja19qRTsnDNww==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105224352"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="105224352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 19:52:58 -0700
X-CSE-ConnectionGUID: X2a19sDFR6mfTQyJhFzdXQ==
X-CSE-MsgGUID: SfyNcSc2RtyoAZGwLclcrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238670897"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2026 19:52:57 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNifW-000000000f8-2Qoj;
	Fri, 15 May 2026 02:52:54 +0000
Date: Fri, 15 May 2026 10:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:808
 usb_gpib_read() warn: was && intended here instead of ||?
Message-ID: <202605151019.PM0IpiLG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66182ca873a4e87b3496eca79d57f86b76d7f52d
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260515/202605151019.PM0IpiLG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605151019.PM0IpiLG-lkp@intel.com/

smatch warnings:
drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:808 usb_gpib_read() warn: was && intended here instead of ||?

vim +808 drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c

fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  744  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  745  	struct char_buf b = {NULL, 0};
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  746  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  747  	int retval;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  748  	char c, nc;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  749  	int ic;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  750  	struct timespec64 before, after;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  751  	int read_count = MAX_READ_EXCESS;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  752  	struct usb_gpib_priv *pd = (struct usb_gpib_priv *)board->private_data;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  753  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  754  	DIA_LOG(1, "enter %p -> %zu\n", board, length);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  755  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  756  	*bytes_read = 0;      /* by default, things go wrong */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  757  	*end = 0;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  758  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  759  	set_timeout(board);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  760  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  761  	/* single byte read has a special handling */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  762  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  763  	if (length == 1) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  764  		char inbuf[2] = {0, 0};
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  765  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  766  		/* read a single character */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  767  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  768  		ktime_get_real_ts64 (&before);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  769  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  770  		retval = write_loop(GPIB_DEV, USB_GPIB_READ_1, strlen(USB_GPIB_READ_1));
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  771  		if (retval < 0)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  772  			return retval;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  773  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  774  		retval = skel_do_read(GPIB_DEV, inbuf, 1);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  775  		retval += skel_do_read(GPIB_DEV, inbuf + 1, 1);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  776  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  777  		ktime_get_real_ts64 (&after);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  778  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  779  		DIA_LOG(1, "single read: %x %x %x in %d\n", retval,
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  780  			inbuf[0], inbuf[1],
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  781  			usec_diff(&after, &before));
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  782  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  783  		/* good char / last char? */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  784  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  785  		if (retval == 2 && inbuf[1] == ACK) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  786  			buffer[0] = inbuf[0];
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  787  			*bytes_read = 1;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  788  			return 0;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  789  		}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  790  		if (retval < 2)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  791  			return -EIO;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  792  		else
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  793  			return -ETIME;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  794  	}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  795  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  796  	/* allocate buffer for multibyte read */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  797  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  798  	b.inbuf = kmalloc(INBUF_SIZE, GFP_KERNEL);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  799  	if (!b.inbuf)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  800  		return -ENOMEM;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  801  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  802  	/* send read command and check <DLE><STX> sequence */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  803  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  804  	retval = write_loop(GPIB_DEV, USB_GPIB_READ, strlen(USB_GPIB_READ));
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  805  	if (retval < 0)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  806  		goto read_return;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  807  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18 @808  	if (one_char(board, &b) != DLE || one_char(board, &b) != STX) {
060fb82d690ecb drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2025-02-14  809  		dev_err(board->gpib_dev, "wrong <DLE><STX> sequence\n");
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  810  		retval = -EIO;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  811  		goto read_return;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  812  	}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  813  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  814  	/* get data flow */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  815  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  816  	while (1) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  817  		ic = one_char(board, &b);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  818  		if (ic == -EIO) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  819  			retval = -EIO;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  820  			goto read_return;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  821  		}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  822  		c = ic;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  823  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  824  		if (c == DLE)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  825  			nc = one_char(board, &b);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  826  		if (c != DLE || nc == DLE) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  827  			/* data byte - store into buffer */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  828  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  829  			if (*bytes_read == length)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  830  				break; /* data overflow */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  831  			if (c == DLE)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  832  				c = nc;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  833  			buffer[(*bytes_read)++] = c;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  834  			if (c == pd->eos) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  835  				*end = 1;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  836  				break;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  837  			}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  838  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  839  		} else {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  840  			/* we are in the closing <DLE><ETX> sequence */
1d8c2d4b89b40f drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-12-04  841  			c = nc;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  842  			if (c == ETX) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  843  				c = one_char(board, &b);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  844  				if (c == ACK) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  845  					*end = 1;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  846  					retval = 0;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  847  					goto read_return;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  848  				} else {
060fb82d690ecb drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2025-02-14  849  					dev_err(board->gpib_dev, "wrong end of message %x", c);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  850  					retval = -ETIME;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  851  					goto read_return;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  852  				}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  853  			} else {
060fb82d690ecb drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2025-02-14  854  				dev_err(board->gpib_dev, "lone <DLE> in stream");
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  855  				retval = -EIO;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  856  				goto read_return;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  857  			}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  858  		}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  859  	}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  860  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  861  	/* we had a data overflow - flush excess data */
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  862  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  863  	while (read_count--) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  864  		if (one_char(board, &b) != DLE)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  865  			continue;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  866  		c = one_char(board, &b);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  867  		if (c == DLE)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  868  			continue;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  869  		if (c == ETX) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  870  			c = one_char(board, &b);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  871  			if (c == ACK) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  872  				if (MAX_READ_EXCESS - read_count > 1)
060fb82d690ecb drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2025-02-14  873  					dev_dbg(board->gpib_dev, "small buffer - maybe some data lost");
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  874  				retval = 0;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  875  				goto read_return;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  876  			}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  877  			break;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  878  		}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  879  	}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  880  
060fb82d690ecb drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2025-02-14  881  	dev_err(board->gpib_dev, "no input end - board in odd state\n");
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  882  	retval = -EIO;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  883  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  884  read_return:
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  885  	kfree(b.inbuf);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  886  
060fb82d690ecb drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2025-02-14  887  	DIA_LOG(1, "done with byte/status: %d %x %d\n",	(int)*bytes_read, retval, *end);
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  888  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  889  	if (retval == 0 || retval == -ETIME) {
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  890  		if (send_command(board, USB_GPIB_UNTALK, sizeof(USB_GPIB_UNTALK)) == 0x06)
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  891  			return retval;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  892  		return	-EIO;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  893  	}
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  894  
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  895  	return retval;
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  896  }
fce79512a96afa drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c Dave Penkler 2024-09-18  897  

:::::: The code at line 808 was first introduced by commit
:::::: fce79512a96afacbe297ba3c5c2f7ed34944540d staging: gpib: Add LPVO DIY USB GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
