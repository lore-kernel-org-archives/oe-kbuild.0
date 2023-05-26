Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56998567C
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 07:05:04 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30a95ec7744so306498f8f.3
        for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 00:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685084701; x=1687676701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEB3j9Hm4cFEq/IWrgb9Zt9idZi6mpH7UvBj/2wltyE=;
        b=YSrKeg5whAJDn0g5cVRpfV7wR1PzZGXcMZUAkUVutOyRE/1794U3lHibYoa0McpWoc
         TyCSwKXjmrBMXeKGb02wLVSvpUFQMW/UnYQ6CABaoywBxUOVXLabFwzkcU+NOsp/SIWd
         l+eWzr9ypgocfjfcdFESwzQIJRUlpzPoVnZ5Gd49eqdmQrAKMlphMRoJX9on8MIZZirA
         rHZFKlcExktHHZ0g0W0TWDUN8BSEag9b3cVUwpo6Vnuc7PhvCeazcYNfGuwY535KFj56
         E5vVVCkKT4IkK6fTlwPNEkZ/EKHSwMVXN8mD9bW93VTKIofeHKcJT4/Fl0bqk0GXSd2f
         xM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685084701; x=1687676701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEB3j9Hm4cFEq/IWrgb9Zt9idZi6mpH7UvBj/2wltyE=;
        b=U9K617QiljpR/RnDamwfxqJgVAJuO/8ec2htGQIoWvykPaS9rDIkSmV3/7PL6a78Q7
         x42wA2BQ8oBOOK2Fcmz7OKoGY0CS+HcIUK0b70hK3P7eUuovPyO1/bMwHeElakrzwMxn
         0xMNMO3GGAp4GPScLs/AhYKU8hgP5zZw47BGGCKJ9Msk4a/p5XiEEWLHzW3qP257oNM4
         6HWLLVXq73YmtsCwX2NAz1OJFkz3p5aCAX2w9S5hCa5CwqXXpBLqh0rlgAiiQl8KFhJW
         /BEgIpzAyVfXfAKMbRLH/U3K6wCnu1qqVzFmgHowONxbf8WymtI44wvQ0lehIowzRkc+
         7nLg==
X-Gm-Message-State: AC+VfDyMFI8/fNfyy+of7Ww2YfpLJVJxvd63FyqslzcIWiwyd8lMSOL6
	zjZIpIrC12vEvJMvSxndstqSGe9Ql+jiep5rOPE=
X-Google-Smtp-Source: ACHHUZ436Ll/zuj+aPZ58CU5j/t4v3v5iYkysrtJQ7kI4HwVs1SAf0wTOXQ6UMRhdRD5DYbfC7pd8g==
X-Received: by 2002:adf:cd8e:0:b0:306:3ec8:289d with SMTP id q14-20020adfcd8e000000b003063ec8289dmr689173wrj.46.1685084701478;
        Fri, 26 May 2023 00:05:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f17-20020a5d5691000000b0030497b3224bsm4017317wrv.64.2023.05.26.00.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 00:05:00 -0700 (PDT)
Date: Fri, 26 May 2023 10:04:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:topic/midi20 25/40] sound/core/seq/seq_clientmgr.c:482
 snd_seq_read() error: copy_to_user() '&cell->event' too small (28 vs 32)
Message-ID: <53743044-5b66-43ab-9675-db0eeed69736@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20
head:   77700b81bd0e47d89d50eb4b3f2f323492f79998
commit: 46397622a3fa8372b8fda0f04b33d16923b03b1b [25/40] ALSA: seq: Add UMP support
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230526/202305261415.NY0vapZK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305261415.NY0vapZK-lkp@intel.com/

smatch warnings:
sound/core/seq/seq_clientmgr.c:482 snd_seq_read() error: copy_to_user() '&cell->event' too small (28 vs 32)

vim +482 sound/core/seq/seq_clientmgr.c

c7e0b5bf9fff1b Takashi Iwai    2005-11-17  407  static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  408  			    loff_t *offset)
^1da177e4c3f41 Linus Torvalds  2005-04-16  409  {
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  410  	struct snd_seq_client *client = file->private_data;
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  411  	struct snd_seq_fifo *fifo;
46397622a3fa83 Takashi Iwai    2023-05-23  412  	size_t aligned_size;
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
46397622a3fa83 Takashi Iwai    2023-05-23  444  	if (client->midi_version > 0)
46397622a3fa83 Takashi Iwai    2023-05-23  445  		aligned_size = sizeof(struct snd_seq_ump_event);
46397622a3fa83 Takashi Iwai    2023-05-23  446  	else
46397622a3fa83 Takashi Iwai    2023-05-23  447  		aligned_size = sizeof(struct snd_seq_event);
46397622a3fa83 Takashi Iwai    2023-05-23  448  
^1da177e4c3f41 Linus Torvalds  2005-04-16  449  	/* while data available in queue */
46397622a3fa83 Takashi Iwai    2023-05-23  450  	while (count >= aligned_size) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  451  		int nonblock;
^1da177e4c3f41 Linus Torvalds  2005-04-16  452  
^1da177e4c3f41 Linus Torvalds  2005-04-16  453  		nonblock = (file->f_flags & O_NONBLOCK) || result > 0;
f9a6bb841f7370 Takashi Iwai    2021-06-08  454  		err = snd_seq_fifo_cell_out(fifo, &cell, nonblock);
f9a6bb841f7370 Takashi Iwai    2021-06-08  455  		if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  456  			break;
46397622a3fa83 Takashi Iwai    2023-05-23  457  		if (!event_is_compatible(client, &cell->event)) {
46397622a3fa83 Takashi Iwai    2023-05-23  458  			snd_seq_cell_free(cell);
46397622a3fa83 Takashi Iwai    2023-05-23  459  			cell = NULL;
46397622a3fa83 Takashi Iwai    2023-05-23  460  			continue;
46397622a3fa83 Takashi Iwai    2023-05-23  461  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  462  		if (snd_seq_ev_is_variable(&cell->event)) {

Smatch isn't clever enough to know that if snd_seq_ev_is_variable()
is false that means client->midi_version is zero.

46397622a3fa83 Takashi Iwai    2023-05-23  463  			struct snd_seq_ump_event tmpev;
46397622a3fa83 Takashi Iwai    2023-05-23  464  
46397622a3fa83 Takashi Iwai    2023-05-23  465  			memcpy(&tmpev, &cell->event, aligned_size);
^1da177e4c3f41 Linus Torvalds  2005-04-16  466  			tmpev.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
46397622a3fa83 Takashi Iwai    2023-05-23  467  			if (copy_to_user(buf, &tmpev, aligned_size)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  468  				err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  469  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  470  			}
46397622a3fa83 Takashi Iwai    2023-05-23  471  			count -= aligned_size;
46397622a3fa83 Takashi Iwai    2023-05-23  472  			buf += aligned_size;
4d23359b7ec8b0 Clemens Ladisch 2005-09-05  473  			err = snd_seq_expand_var_event(&cell->event, count,
4d23359b7ec8b0 Clemens Ladisch 2005-09-05  474  						       (char __force *)buf, 0,
46397622a3fa83 Takashi Iwai    2023-05-23  475  						       aligned_size);
^1da177e4c3f41 Linus Torvalds  2005-04-16  476  			if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  477  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  478  			result += err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  479  			count -= err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  480  			buf += err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  481  		} else {
46397622a3fa83 Takashi Iwai    2023-05-23 @482  			if (copy_to_user(buf, &cell->event, aligned_size)) {

So smatch complains that this might be a read overflow.

^1da177e4c3f41 Linus Torvalds  2005-04-16  483  				err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  484  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  485  			}
46397622a3fa83 Takashi Iwai    2023-05-23  486  			count -= aligned_size;
46397622a3fa83 Takashi Iwai    2023-05-23  487  			buf += aligned_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  488  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  489  		snd_seq_cell_free(cell);
^1da177e4c3f41 Linus Torvalds  2005-04-16  490  		cell = NULL; /* to be sure */
46397622a3fa83 Takashi Iwai    2023-05-23  491  		result += aligned_size;
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

