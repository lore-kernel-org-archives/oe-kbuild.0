Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51645645D
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+XPFYL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704749686; x=1736285686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YrQAnAjlYj29uw9vKbc/YEa54Pt5TfGu4xNYJoQL9n0=;
  b=J+XPFYL1RPgLHmwAW6/MVeGl73QRaXuken2nmToivAs4iKnFg4N39w1P
   Et0bMpTxZbSHC6Gi/67ZMocZC266Oe4UZMouGeUCV4/qCqoNEt1oBbHTS
   roxuuLMU9H7OIr3lstWJlnsZgWjPF78KYDrchXRceEBYc4x3mJp8bNFrH
   dEd2DSLz1prdrD0kXXc0KbDWU6kVozCkuPB8CAnootpS3VfcNODx/rErP
   ZUkCnEYk8q8yb+sRIlDDw5ik6JRvliI5tmhbdwOf3wfHogXd4CMa1NLwI
   BCWZF+iarCEZAe8XaKuz+ZVb8w2Agv+kiDKqzYNZAw5MDpZojc8t2A6nm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="462294622"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="462294622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 13:34:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="16051259"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2024 13:34:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMxGc-00056r-07;
	Mon, 08 Jan 2024 21:34:42 +0000
Date: Tue, 9 Jan 2024 05:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/core/seq/seq_clientmgr.c:465 snd_seq_read() error:
 __builtin_memcpy() '&cell->event' too small (28 vs 32)
Message-ID: <202401090553.0RwuvAnG-lkp@intel.com>
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
TO: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dd3ee31125508cd67f7e7172247f05b7fd1753a
commit: 46397622a3fa8372b8fda0f04b33d16923b03b1b ALSA: seq: Add UMP support
date:   8 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20240107 (https://download.01.org/0day-ci/archive/20240109/202401090553.0RwuvAnG-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401090553.0RwuvAnG-lkp@intel.com/

New smatch warnings:
sound/core/seq/seq_clientmgr.c:465 snd_seq_read() error: __builtin_memcpy() '&cell->event' too small (28 vs 32)

Old smatch warnings:
sound/core/seq/seq_clientmgr.c:482 snd_seq_read() error: copy_to_user() '&cell->event' too small (28 vs 32)

vim +465 sound/core/seq/seq_clientmgr.c

^1da177e4c3f415 Linus Torvalds  2005-04-16  399  
^1da177e4c3f415 Linus Torvalds  2005-04-16  400  /* handle client read() */
^1da177e4c3f415 Linus Torvalds  2005-04-16  401  /* possible error values:
^1da177e4c3f415 Linus Torvalds  2005-04-16  402   *	-ENXIO	invalid client or file open mode
^1da177e4c3f415 Linus Torvalds  2005-04-16  403   *	-ENOSPC	FIFO overflow (the flag is cleared after this error report)
^1da177e4c3f415 Linus Torvalds  2005-04-16  404   *	-EINVAL	no enough user-space buffer to write the whole event
^1da177e4c3f415 Linus Torvalds  2005-04-16  405   *	-EFAULT	seg. fault during copy to user space
^1da177e4c3f415 Linus Torvalds  2005-04-16  406   */
c7e0b5bf9fff1b7 Takashi Iwai    2005-11-17  407  static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
c7e0b5bf9fff1b7 Takashi Iwai    2005-11-17  408  			    loff_t *offset)
^1da177e4c3f415 Linus Torvalds  2005-04-16  409  {
c7e0b5bf9fff1b7 Takashi Iwai    2005-11-17  410  	struct snd_seq_client *client = file->private_data;
c7e0b5bf9fff1b7 Takashi Iwai    2005-11-17  411  	struct snd_seq_fifo *fifo;
46397622a3fa837 Takashi Iwai    2023-05-23  412  	size_t aligned_size;
^1da177e4c3f415 Linus Torvalds  2005-04-16  413  	int err;
^1da177e4c3f415 Linus Torvalds  2005-04-16  414  	long result = 0;
c7e0b5bf9fff1b7 Takashi Iwai    2005-11-17  415  	struct snd_seq_event_cell *cell;
^1da177e4c3f415 Linus Torvalds  2005-04-16  416  
^1da177e4c3f415 Linus Torvalds  2005-04-16  417  	if (!(snd_seq_file_flags(file) & SNDRV_SEQ_LFLG_INPUT))
^1da177e4c3f415 Linus Torvalds  2005-04-16  418  		return -ENXIO;
^1da177e4c3f415 Linus Torvalds  2005-04-16  419  
96d4f267e40f950 Linus Torvalds  2019-01-03  420  	if (!access_ok(buf, count))
^1da177e4c3f415 Linus Torvalds  2005-04-16  421  		return -EFAULT;
^1da177e4c3f415 Linus Torvalds  2005-04-16  422  
^1da177e4c3f415 Linus Torvalds  2005-04-16  423  	/* check client structures are in place */
7eaa943c8ed8e91 Takashi Iwai    2008-08-08  424  	if (snd_BUG_ON(!client))
7eaa943c8ed8e91 Takashi Iwai    2008-08-08  425  		return -ENXIO;
^1da177e4c3f415 Linus Torvalds  2005-04-16  426  
f9a6bb841f73701 Takashi Iwai    2021-06-08  427  	if (!client->accept_input)
f9a6bb841f73701 Takashi Iwai    2021-06-08  428  		return -ENXIO;
f9a6bb841f73701 Takashi Iwai    2021-06-08  429  	fifo = client->data.user.fifo;
f9a6bb841f73701 Takashi Iwai    2021-06-08  430  	if (!fifo)
^1da177e4c3f415 Linus Torvalds  2005-04-16  431  		return -ENXIO;
^1da177e4c3f415 Linus Torvalds  2005-04-16  432  
^1da177e4c3f415 Linus Torvalds  2005-04-16  433  	if (atomic_read(&fifo->overflow) > 0) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  434  		/* buffer overflow is detected */
^1da177e4c3f415 Linus Torvalds  2005-04-16  435  		snd_seq_fifo_clear(fifo);
^1da177e4c3f415 Linus Torvalds  2005-04-16  436  		/* return error code */
^1da177e4c3f415 Linus Torvalds  2005-04-16  437  		return -ENOSPC;
^1da177e4c3f415 Linus Torvalds  2005-04-16  438  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  439  
^1da177e4c3f415 Linus Torvalds  2005-04-16  440  	cell = NULL;
^1da177e4c3f415 Linus Torvalds  2005-04-16  441  	err = 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16  442  	snd_seq_fifo_lock(fifo);
^1da177e4c3f415 Linus Torvalds  2005-04-16  443  
46397622a3fa837 Takashi Iwai    2023-05-23  444  	if (client->midi_version > 0)
46397622a3fa837 Takashi Iwai    2023-05-23  445  		aligned_size = sizeof(struct snd_seq_ump_event);
46397622a3fa837 Takashi Iwai    2023-05-23  446  	else
46397622a3fa837 Takashi Iwai    2023-05-23  447  		aligned_size = sizeof(struct snd_seq_event);
46397622a3fa837 Takashi Iwai    2023-05-23  448  
^1da177e4c3f415 Linus Torvalds  2005-04-16  449  	/* while data available in queue */
46397622a3fa837 Takashi Iwai    2023-05-23  450  	while (count >= aligned_size) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  451  		int nonblock;
^1da177e4c3f415 Linus Torvalds  2005-04-16  452  
^1da177e4c3f415 Linus Torvalds  2005-04-16  453  		nonblock = (file->f_flags & O_NONBLOCK) || result > 0;
f9a6bb841f73701 Takashi Iwai    2021-06-08  454  		err = snd_seq_fifo_cell_out(fifo, &cell, nonblock);
f9a6bb841f73701 Takashi Iwai    2021-06-08  455  		if (err < 0)
^1da177e4c3f415 Linus Torvalds  2005-04-16  456  			break;
46397622a3fa837 Takashi Iwai    2023-05-23  457  		if (!event_is_compatible(client, &cell->event)) {
46397622a3fa837 Takashi Iwai    2023-05-23  458  			snd_seq_cell_free(cell);
46397622a3fa837 Takashi Iwai    2023-05-23  459  			cell = NULL;
46397622a3fa837 Takashi Iwai    2023-05-23  460  			continue;
46397622a3fa837 Takashi Iwai    2023-05-23  461  		}
^1da177e4c3f415 Linus Torvalds  2005-04-16  462  		if (snd_seq_ev_is_variable(&cell->event)) {
46397622a3fa837 Takashi Iwai    2023-05-23  463  			struct snd_seq_ump_event tmpev;
46397622a3fa837 Takashi Iwai    2023-05-23  464  
46397622a3fa837 Takashi Iwai    2023-05-23 @465  			memcpy(&tmpev, &cell->event, aligned_size);
^1da177e4c3f415 Linus Torvalds  2005-04-16  466  			tmpev.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
46397622a3fa837 Takashi Iwai    2023-05-23  467  			if (copy_to_user(buf, &tmpev, aligned_size)) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  468  				err = -EFAULT;
^1da177e4c3f415 Linus Torvalds  2005-04-16  469  				break;
^1da177e4c3f415 Linus Torvalds  2005-04-16  470  			}
46397622a3fa837 Takashi Iwai    2023-05-23  471  			count -= aligned_size;
46397622a3fa837 Takashi Iwai    2023-05-23  472  			buf += aligned_size;
4d23359b7ec8b03 Clemens Ladisch 2005-09-05  473  			err = snd_seq_expand_var_event(&cell->event, count,
4d23359b7ec8b03 Clemens Ladisch 2005-09-05  474  						       (char __force *)buf, 0,
46397622a3fa837 Takashi Iwai    2023-05-23  475  						       aligned_size);
^1da177e4c3f415 Linus Torvalds  2005-04-16  476  			if (err < 0)
^1da177e4c3f415 Linus Torvalds  2005-04-16  477  				break;
^1da177e4c3f415 Linus Torvalds  2005-04-16  478  			result += err;
^1da177e4c3f415 Linus Torvalds  2005-04-16  479  			count -= err;
^1da177e4c3f415 Linus Torvalds  2005-04-16  480  			buf += err;
^1da177e4c3f415 Linus Torvalds  2005-04-16  481  		} else {
46397622a3fa837 Takashi Iwai    2023-05-23  482  			if (copy_to_user(buf, &cell->event, aligned_size)) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  483  				err = -EFAULT;
^1da177e4c3f415 Linus Torvalds  2005-04-16  484  				break;
^1da177e4c3f415 Linus Torvalds  2005-04-16  485  			}
46397622a3fa837 Takashi Iwai    2023-05-23  486  			count -= aligned_size;
46397622a3fa837 Takashi Iwai    2023-05-23  487  			buf += aligned_size;
^1da177e4c3f415 Linus Torvalds  2005-04-16  488  		}
^1da177e4c3f415 Linus Torvalds  2005-04-16  489  		snd_seq_cell_free(cell);
^1da177e4c3f415 Linus Torvalds  2005-04-16  490  		cell = NULL; /* to be sure */
46397622a3fa837 Takashi Iwai    2023-05-23  491  		result += aligned_size;
^1da177e4c3f415 Linus Torvalds  2005-04-16  492  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  493  
^1da177e4c3f415 Linus Torvalds  2005-04-16  494  	if (err < 0) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  495  		if (cell)
^1da177e4c3f415 Linus Torvalds  2005-04-16  496  			snd_seq_fifo_cell_putback(fifo, cell);
^1da177e4c3f415 Linus Torvalds  2005-04-16  497  		if (err == -EAGAIN && result > 0)
^1da177e4c3f415 Linus Torvalds  2005-04-16  498  			err = 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16  499  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  500  	snd_seq_fifo_unlock(fifo);
^1da177e4c3f415 Linus Torvalds  2005-04-16  501  
^1da177e4c3f415 Linus Torvalds  2005-04-16  502  	return (err < 0) ? err : result;
^1da177e4c3f415 Linus Torvalds  2005-04-16  503  }
^1da177e4c3f415 Linus Torvalds  2005-04-16  504  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
