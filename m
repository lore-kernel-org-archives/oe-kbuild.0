Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A46FA2
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685085626; x=1716621626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gXzYykg3yOjA8kQLAYBQjHq+y6nLHtHbnGmdr8lvh2c=;
  b=EFlJaZLDlj49Xxz6R63+lr92mBYFD0ZovBE2nDexHAxZpUJCDdWZQ42N
   tOcp8LKf29OsN1HNVk6t4erUnEsxxUYlbZovQozhQ/24IKjDa5xkooZQZ
   B6GZZGVOlrlbXu+ZRKspkpfNImyFV/VsJdsFdYAFMwd4K1amnafVVgVbH
   O5DsgT+XIhLLz43L0ALnUC6PR7IsBGXHSKYYNblzOsTgP8lzpN6cqJoF1
   S/MpTxqSozaOxiYOBBvKHvUDK+s69o8yAWSnXtBwqSsv91ImelV96IlHf
   3YOiioNoU3y9QKz63fxz7H8kANKum+t548yLwuJhhNw0pNw22HSG+G0nn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356523687"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="356523687"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 00:20:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="738152285"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="738152285"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2023 00:20:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2RkL-000J8z-2x;
	Fri, 26 May 2023 07:20:21 +0000
Date: Fri, 26 May 2023 15:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:topic/midi20 25/37] sound/core/seq/seq_clientmgr.c:482
 snd_seq_read() error: copy_to_user() '&cell->event' too small (28 vs 32)
Message-ID: <202305261550.cGftrSr4-lkp@intel.com>
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
CC: alsa-devel@alsa-project.org
TO: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20
head:   77700b81bd0e47d89d50eb4b3f2f323492f79998
commit: 338092483a68cae0efb0020b985b6e0a3191d01d [25/37] ALSA: seq: Add UMP support
:::::: branch date: 23 hours ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-m041-20230521 (https://download.01.org/0day-ci/archive/20230526/202305261550.cGftrSr4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305261550.cGftrSr4-lkp@intel.com/

smatch warnings:
sound/core/seq/seq_clientmgr.c:482 snd_seq_read() error: copy_to_user() '&cell->event' too small (28 vs 32)

vim +482 sound/core/seq/seq_clientmgr.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  399  
^1da177e4c3f41 Linus Torvalds  2005-04-16  400  /* handle client read() */
^1da177e4c3f41 Linus Torvalds  2005-04-16  401  /* possible error values:
^1da177e4c3f41 Linus Torvalds  2005-04-16  402   *	-ENXIO	invalid client or file open mode
^1da177e4c3f41 Linus Torvalds  2005-04-16  403   *	-ENOSPC	FIFO overflow (the flag is cleared after this error report)
^1da177e4c3f41 Linus Torvalds  2005-04-16  404   *	-EINVAL	no enough user-space buffer to write the whole event
^1da177e4c3f41 Linus Torvalds  2005-04-16  405   *	-EFAULT	seg. fault during copy to user space
^1da177e4c3f41 Linus Torvalds  2005-04-16  406   */
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  407  static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  408  			    loff_t *offset)
^1da177e4c3f41 Linus Torvalds  2005-04-16  409  {
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  410  	struct snd_seq_client *client = file->private_data;
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  411  	struct snd_seq_fifo *fifo;
338092483a68ca Takashi Iwai    2022-11-12  412  	size_t aligned_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  413  	int err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  414  	long result = 0;
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  415  	struct snd_seq_event_cell *cell;
^1da177e4c3f41 Linus Torvalds  2005-04-16  416  
^1da177e4c3f41 Linus Torvalds  2005-04-16  417  	if (!(snd_seq_file_flags(file) & SNDRV_SEQ_LFLG_INPUT))
^1da177e4c3f41 Linus Torvalds  2005-04-16  418  		return -ENXIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  419  
96d4f267e40f95 Linus Torvalds  2019-01-03  420  	if (!access_ok(buf, count))
^1da177e4c3f41 Linus Torvalds  2005-04-16  421  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  422  
^1da177e4c3f41 Linus Torvalds  2005-04-16  423  	/* check client structures are in place */
7eaa943c8ed8e9 Takashi Iwai    2008-08-08  424  	if (snd_BUG_ON(!client))
7eaa943c8ed8e9 Takashi Iwai    2008-08-08  425  		return -ENXIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  426  
f9a6bb841f7370 Takashi Iwai    2021-06-08  427  	if (!client->accept_input)
f9a6bb841f7370 Takashi Iwai    2021-06-08  428  		return -ENXIO;
f9a6bb841f7370 Takashi Iwai    2021-06-08  429  	fifo = client->data.user.fifo;
f9a6bb841f7370 Takashi Iwai    2021-06-08  430  	if (!fifo)
^1da177e4c3f41 Linus Torvalds  2005-04-16  431  		return -ENXIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  432  
^1da177e4c3f41 Linus Torvalds  2005-04-16  433  	if (atomic_read(&fifo->overflow) > 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  434  		/* buffer overflow is detected */
^1da177e4c3f41 Linus Torvalds  2005-04-16  435  		snd_seq_fifo_clear(fifo);
^1da177e4c3f41 Linus Torvalds  2005-04-16  436  		/* return error code */
^1da177e4c3f41 Linus Torvalds  2005-04-16  437  		return -ENOSPC;
^1da177e4c3f41 Linus Torvalds  2005-04-16  438  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  439  
^1da177e4c3f41 Linus Torvalds  2005-04-16  440  	cell = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  441  	err = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  442  	snd_seq_fifo_lock(fifo);
^1da177e4c3f41 Linus Torvalds  2005-04-16  443  
338092483a68ca Takashi Iwai    2022-11-12  444  	if (client->midi_version > 0)
338092483a68ca Takashi Iwai    2022-11-12  445  		aligned_size = sizeof(struct snd_seq_ump_event);
338092483a68ca Takashi Iwai    2022-11-12  446  	else
338092483a68ca Takashi Iwai    2022-11-12  447  		aligned_size = sizeof(struct snd_seq_event);
338092483a68ca Takashi Iwai    2022-11-12  448  
^1da177e4c3f41 Linus Torvalds  2005-04-16  449  	/* while data available in queue */
338092483a68ca Takashi Iwai    2022-11-12  450  	while (count >= aligned_size) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  451  		int nonblock;
^1da177e4c3f41 Linus Torvalds  2005-04-16  452  
^1da177e4c3f41 Linus Torvalds  2005-04-16  453  		nonblock = (file->f_flags & O_NONBLOCK) || result > 0;
f9a6bb841f7370 Takashi Iwai    2021-06-08  454  		err = snd_seq_fifo_cell_out(fifo, &cell, nonblock);
f9a6bb841f7370 Takashi Iwai    2021-06-08  455  		if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  456  			break;
338092483a68ca Takashi Iwai    2022-11-12  457  		if (!event_is_compatible(client, &cell->event)) {
338092483a68ca Takashi Iwai    2022-11-12  458  			snd_seq_cell_free(cell);
338092483a68ca Takashi Iwai    2022-11-12  459  			cell = NULL;
338092483a68ca Takashi Iwai    2022-11-12  460  			continue;
338092483a68ca Takashi Iwai    2022-11-12  461  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  462  		if (snd_seq_ev_is_variable(&cell->event)) {
338092483a68ca Takashi Iwai    2022-11-12  463  			struct snd_seq_ump_event tmpev;
338092483a68ca Takashi Iwai    2022-11-12  464  
338092483a68ca Takashi Iwai    2022-11-12  465  			memcpy(&tmpev, &cell->event, aligned_size);
^1da177e4c3f41 Linus Torvalds  2005-04-16  466  			tmpev.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
338092483a68ca Takashi Iwai    2022-11-12  467  			if (copy_to_user(buf, &tmpev, aligned_size)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  468  				err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  469  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  470  			}
338092483a68ca Takashi Iwai    2022-11-12  471  			count -= aligned_size;
338092483a68ca Takashi Iwai    2022-11-12  472  			buf += aligned_size;
4d23359b7ec8b0 Clemens Ladisch 2005-09-05  473  			err = snd_seq_expand_var_event(&cell->event, count,
4d23359b7ec8b0 Clemens Ladisch 2005-09-05  474  						       (char __force *)buf, 0,
338092483a68ca Takashi Iwai    2022-11-12  475  						       aligned_size);
^1da177e4c3f41 Linus Torvalds  2005-04-16  476  			if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  477  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  478  			result += err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  479  			count -= err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  480  			buf += err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  481  		} else {
338092483a68ca Takashi Iwai    2022-11-12 @482  			if (copy_to_user(buf, &cell->event, aligned_size)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  483  				err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  484  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  485  			}
338092483a68ca Takashi Iwai    2022-11-12  486  			count -= aligned_size;
338092483a68ca Takashi Iwai    2022-11-12  487  			buf += aligned_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  488  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  489  		snd_seq_cell_free(cell);
^1da177e4c3f41 Linus Torvalds  2005-04-16  490  		cell = NULL; /* to be sure */
338092483a68ca Takashi Iwai    2022-11-12  491  		result += aligned_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  492  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  493  
^1da177e4c3f41 Linus Torvalds  2005-04-16  494  	if (err < 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  495  		if (cell)
^1da177e4c3f41 Linus Torvalds  2005-04-16  496  			snd_seq_fifo_cell_putback(fifo, cell);
^1da177e4c3f41 Linus Torvalds  2005-04-16  497  		if (err == -EAGAIN && result > 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  498  			err = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  499  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  500  	snd_seq_fifo_unlock(fifo);
^1da177e4c3f41 Linus Torvalds  2005-04-16  501  
^1da177e4c3f41 Linus Torvalds  2005-04-16  502  	return (err < 0) ? err : result;
^1da177e4c3f41 Linus Torvalds  2005-04-16  503  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  504  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
