Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964E101E7
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Nov 2023 08:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kT//iRyW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32f78dcf036so1024177f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 09 Nov 2023 00:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699516935; x=1700121735; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFIkC1FD/Uwtc6W91szrKWUfuMQSfWOdpdRrkGpPlWo=;
        b=kT//iRyWZAmmBm2EGz7EYymR5Ie7D8ofvnZlExvbPhEPTaLigmGsv8E3gYrwWZq3Cy
         hdhkd+hRDgb7Z44wIC6ixKvD9tHdKvTwjGGwEndYguKPnxThBcQX1v5cH6Zhgqo3h1at
         suEi+S472BEB+C3fLURSw3h9jDlKIRbe2kQeUf2Y9t5LuhVkXopWzv0aXhr8VYhAiMfk
         JurVIs4QGGmi3SNMbK9mxHO0XvBni91kgF6RewVSbMxOFP3sEJw0KkUMcHb26TjKTBBX
         1Jdw8pU7zNUY+IAB5qja/Gd47GGWH3oOj0yOfjHUmACVPzoa0CpfNe7JSNgDlFQte0F2
         Lt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699516935; x=1700121735;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFIkC1FD/Uwtc6W91szrKWUfuMQSfWOdpdRrkGpPlWo=;
        b=EZ5lniiq15c6n9PZ4tJiUtU3K1BOemGepa9TLPY7Bqqs/sL1f75ce8sk52BaoHPcnK
         u+mRCKRr74LKBGm2pYJvDtrUXSZfFeaAtGIptGbFSVF0uXWkZkE1FcRwTVnOKA+jW5Dh
         sIyvuFFyXwq2lC9UNRotXcP7y5KR3+Dn2J3fdaGLMAgN+ARd2KVCBATeibD+L3ubnIbo
         5+8uZVoHoAwc4Gi+cZkei5mBoUEOmKQ9kLUJB/OzkwdEzrCpjX2+Jy1jfuEMsn8STQEw
         EwGdd58VpqzZRsvZI0M6SzfjCi1mDpFiGXqMv87wHrNPpf9YV9CvMkm5i/qUg2hHexDz
         uxaQ==
X-Gm-Message-State: AOJu0YzN3SnD8xM4GDEhHYjMYItNsugcnQ8aax5xcXUDWLyNaY9UdETd
	KwfyyGsWpD4KmyCFf8tUAwL6CkQR3mWL27gUyW8=
X-Google-Smtp-Source: AGHT+IGPq2vMTt96ad/AZA6B76G5T/W9HPy/vLX/E2Tps70yhgvZu+0T0LFKA9SFn0wgyqBEQQ+EyQ==
X-Received: by 2002:a5d:5986:0:b0:32f:b47c:f1f6 with SMTP id n6-20020a5d5986000000b0032fb47cf1f6mr4764971wri.32.1699516935529;
        Thu, 09 Nov 2023 00:02:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d67d1000000b003232380ffd7sm6758579wrw.102.2023.11.09.00.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 00:02:15 -0800 (PST)
Date: Thu, 9 Nov 2023 11:02:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tuo Li <islituo@gmail.com>,
	mchehab@kernel.org, yongsuyoo0215@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@outlook.com, Tuo Li <islituo@gmail.com>,
	BassCheck <bass@buaa.edu.cn>
Subject: Re: [PATCH] media: dvb-core: Fix a possible null-pointer dereference
 due to data race in dvbdmx_write()
Message-ID: <16d72edf-78de-4995-8821-e95973d5c474@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108091300.3124649-1-islituo@gmail.com>

Hi Tuo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tuo-Li/media-dvb-core-Fix-a-possible-null-pointer-dereference-due-to-data-race-in-dvbdmx_write/20231108-200849
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231108091300.3124649-1-islituo%40gmail.com
patch subject: [PATCH] media: dvb-core: Fix a possible null-pointer dereference due to data race in dvbdmx_write()
config: x86_64-randconfig-161-20231108 (https://download.01.org/0day-ci/archive/20231109/202311090845.BlIvG8kE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311090845.BlIvG8kE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202311090845.BlIvG8kE-lkp@intel.com/

smatch warnings:
drivers/media/dvb-core/dvb_demux.c:1163 dvbdmx_write() warn: inconsistent returns '&dvbdemux->mutex'.

vim +1163 drivers/media/dvb-core/dvb_demux.c

947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1139  static int dvbdmx_write(struct dmx_demux *demux, const char __user *buf, size_t count)
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1140  {
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1141  	struct dvb_demux *dvbdemux = (struct dvb_demux *)demux;
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1142  	void *p;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1143  
eebefd4eafaa5d drivers/media/dvb-core/dvb_demux.c     Tuo Li         2023-11-08  1144  	mutex_lock(&dvbdemux->mutex);
eebefd4eafaa5d drivers/media/dvb-core/dvb_demux.c     Tuo Li         2023-11-08  1145  	if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE)) {
eebefd4eafaa5d drivers/media/dvb-core/dvb_demux.c     Tuo Li         2023-11-08  1146  		mutex_unlock(&dvbdemux->mutex);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1147  		return -EINVAL;
eebefd4eafaa5d drivers/media/dvb-core/dvb_demux.c     Tuo Li         2023-11-08  1148  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1149  
c6cfe05532cf6e drivers/media/dvb/dvb-core/dvb_demux.c Julia Lawall   2010-05-22  1150  	p = memdup_user(buf, count);
c6cfe05532cf6e drivers/media/dvb/dvb-core/dvb_demux.c Julia Lawall   2010-05-22  1151  	if (IS_ERR(p))
c6cfe05532cf6e drivers/media/dvb/dvb-core/dvb_demux.c Julia Lawall   2010-05-22  1152  		return PTR_ERR(p);

Need to drop the lock before returning.

947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1153  	if (mutex_lock_interruptible(&dvbdemux->mutex)) {

Wait, what?  Why are we taking the lock a second time?  This won't work.

947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1154  		kfree(p);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1155  		return -ERESTARTSYS;
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1156  	}
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1157  	dvb_dmx_swfilter(dvbdemux, p, count);
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1158  	kfree(p);
3593cab5d62c4c drivers/media/dvb/dvb-core/dvb_demux.c Ingo Molnar    2006-02-07  1159  	mutex_unlock(&dvbdemux->mutex);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1160  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1161  	if (signal_pending(current))
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1162  		return -EINTR;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16 @1163  	return count;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1164  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

