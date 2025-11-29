Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D71D86FF
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435108; cv=none; b=JrLjMBsx5ZLw0aH5RSFmrffy46JQl7qSHYnfM/l4p/mE0aPYpcdJOTA2XV6TYQEM/n0wgfa7Z+9a6Z8UZMXENUC65h2IML5ts9xAvXHygSfKc1c+aONzPaV4HRCbSMXUjwX1HopBUa0FMEj1i0YIP3NcvbLpgwh4eHKB/aOdaDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435108; c=relaxed/simple;
	bh=/iNK4Qtd+hA3I1KKNTPu2IlUU49kyEFn0I93BpZeAb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GXWTwJcI7nfulo1jRBU1aeA5NF6v0/nMsEnmNR8vH6ic/BEmS8IFhHsklx0PCDszzju0m0mVGKkYoeczsa4ADzqhWSI7BlF1h3iBXhXxxxYB3aWzyjusSQ4NEfsH8ksoyUpR3kkrYAkVXHr58erF1ukWthi/Lnif+5IucRd0p50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+PosJYe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+PosJYe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47790b080e4so12539175e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 08:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764435105; x=1765039905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eNQQ2TrZ6lIHhcgB8NrgQiNlLOxGJsp2u9drC4JaiaE=;
        b=V+PosJYe7InO76N3Cu3wtRYOVbU984qd40lmBkJUjq0KnC2o060eYTx5Z3zcdL3qh1
         iK8m3nRbxt0kZs77EwO0OKB2kov3JN2euf7SvlgoxD4ak84t0WBr+L+i8gG/RWD5Kahg
         yPxsx0FEUpdu7WF05lGjSy7n/DkH7eepRpFw8A/uUwHeX3rGJe/Qll3dVKYg47+UztIP
         PaM/FFEy1QimE9NjpraiZENiVJDWPO1+/rDpEx1GhHkEvjwVtpoWEfGdysx/MKYtqGLv
         +2MX/dmig9ZC9/AoA0hFVUqRngQLc/yn5rc1b6jeR3bO6zF+FMwFvo8WIizjrV7R2GVY
         pdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435105; x=1765039905;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNQQ2TrZ6lIHhcgB8NrgQiNlLOxGJsp2u9drC4JaiaE=;
        b=qIj4R+9XqdnhajaWCXccemk6s1aoa+9J8ivyL+XT5HowxjWj57z4N/68hxJUtvZ0TA
         MGSjDxkZmi3Tr+PVydulW07J0Gztm5RXIidmlDtPEhymIoyr75zZX7MFtVSEbVBKMUEB
         KkHnnbyb+0G+fRTgkMCW8ukRMRh0Y5lVg/J9CFa7wz+2YvpNtmakBsWgdN1iZArb24ef
         JTpdum5/Ab12kW8NERftFbbBfqkK6MDmxcFGURcRwyFc4B1jLfAd5VjSiMSUiiav15K8
         AXc/yKPpvoiQ86hekamsqwn5/vm/0uXSdnKN5duNmjFsD01qWFbwAFZPzJIQ4xoFg0zA
         jp5g==
X-Gm-Message-State: AOJu0Ywdq4ed642npJSqTy+4PUcpwNUhswwUKj61CzAHsIgO+pXoOqf2
	AWy0n5VXavwSQzNCUzfY8Rmb4zXuwgWHA82cpwlL2oa3mH/TMYUqeoQVI0XXal1Iwd/60HorCGC
	lDa/a
X-Gm-Gg: ASbGncvBk7wnA4Z4PHBi6uMt0TFhzD4vWZxtsIbZ1/5J0cfmr2O/y6tSTbcUUIuxl7/
	V9IqbAdJbUgklYKItKrkBU/i28lUp9YZcQQ2Ph7bih2CW/UsKk7fGRxVDjwCTwYIgekzS2us4Rl
	HqkwUdrPNAG+ywMv9lciymGDd8iw7pnlIDqUY2pEJSEolL4+3I1hyvWsypYFSHFgNUFckFSCsl4
	SvdBGH+3y8EVr0sAvwGg37Z1jGwj3s+/onmDBTZzrNQlwmWPpCD2c2G8poxd33tlu3W5bY0yra2
	ASq214uTyYYuHwz0ZqTJqf+qUeYQ1V/06Y8cm5S6muposYlKDoCGQrK+UlWaK+4+XqEgv/bXERb
	bKqJ1PXiZYvjTcuIpKtpC9USfGOZs3nU0mGnUAYTnK+EkZEta9RzlGyz19+KRBZhHgqEG7h3aYb
	SqZBj1g0fhc7Amkw2clHmWGQrmhO4=
X-Google-Smtp-Source: AGHT+IFQybZ8AC4gkevKQ/6HpN9EXVOyox2BHm3ICg6x870LOSGMofLFGRpseW1XP7cGo/FDwctfxQ==
X-Received: by 2002:a05:600c:198e:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-477c1133927mr322314755e9.32.1764435104802;
        Sat, 29 Nov 2025 08:51:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790b0c3a28sm217505665e9.9.2025.11.29.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:51:44 -0800 (PST)
Date: Sat, 29 Nov 2025 19:51:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alex Markuze <amarkuze@redhat.com>,
	ceph-devel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, idryomov@gmail.com,
	linux-fsdevel@vger.kernel.org, amarkuze@redhat.com,
	vdubeyko@redhat.com
Subject: Re: [PATCH 3/3] ceph: add subvolume metrics collection and reporting
Message-ID: <202511290541.wFDJlRdO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127134620.2035796-4-amarkuze@redhat.com>
Message-ID: <20251129165141.FBnLnLRxptwF8JnOwSkexqnw__VprkAvkXtCWCT9Pg8@z>

Hi Alex,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Markuze/ceph-handle-InodeStat-v8-versioned-field-in-reply-parsing/20251127-214928
base:   https://github.com/ceph/ceph-client.git for-linus
patch link:    https://lore.kernel.org/r/20251127134620.2035796-4-amarkuze%40redhat.com
patch subject: [PATCH 3/3] ceph: add subvolume metrics collection and reporting
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290541.wFDJlRdO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511290541.wFDJlRdO-lkp@intel.com/

smatch warnings:
fs/ceph/debugfs.c:436 subvolume_metrics_show() error: we previously assumed 'mdsc' could be null (see line 399)

vim +/mdsc +436 fs/ceph/debugfs.c

d469e1da62544e7 Alex Markuze 2025-11-27  390  static int subvolume_metrics_show(struct seq_file *s, void *p)
d469e1da62544e7 Alex Markuze 2025-11-27  391  {
d469e1da62544e7 Alex Markuze 2025-11-27  392  	struct ceph_fs_client *fsc = s->private;
d469e1da62544e7 Alex Markuze 2025-11-27  393  	struct ceph_mds_client *mdsc = fsc->mdsc;
d469e1da62544e7 Alex Markuze 2025-11-27  394  	struct ceph_subvol_metric_snapshot *snapshot = NULL;
d469e1da62544e7 Alex Markuze 2025-11-27  395  	u32 nr = 0;
d469e1da62544e7 Alex Markuze 2025-11-27  396  	u64 total_sent = 0;
d469e1da62544e7 Alex Markuze 2025-11-27  397  	u32 i;
d469e1da62544e7 Alex Markuze 2025-11-27  398  
d469e1da62544e7 Alex Markuze 2025-11-27 @399  	if (mdsc) {

This assumes mdsc can be NULL

d469e1da62544e7 Alex Markuze 2025-11-27  400  		mutex_lock(&mdsc->subvol_metrics_last_mutex);
d469e1da62544e7 Alex Markuze 2025-11-27  401  		if (mdsc->subvol_metrics_last &&
d469e1da62544e7 Alex Markuze 2025-11-27  402  		    mdsc->subvol_metrics_last_nr) {
d469e1da62544e7 Alex Markuze 2025-11-27  403  			nr = mdsc->subvol_metrics_last_nr;
d469e1da62544e7 Alex Markuze 2025-11-27  404  			snapshot = kmemdup(mdsc->subvol_metrics_last,
d469e1da62544e7 Alex Markuze 2025-11-27  405  					   nr * sizeof(*snapshot),
d469e1da62544e7 Alex Markuze 2025-11-27  406  					   GFP_KERNEL);
d469e1da62544e7 Alex Markuze 2025-11-27  407  			if (!snapshot)
d469e1da62544e7 Alex Markuze 2025-11-27  408  				nr = 0;
d469e1da62544e7 Alex Markuze 2025-11-27  409  		}
d469e1da62544e7 Alex Markuze 2025-11-27  410  		total_sent = mdsc->subvol_metrics_sent;
d469e1da62544e7 Alex Markuze 2025-11-27  411  		mutex_unlock(&mdsc->subvol_metrics_last_mutex);
d469e1da62544e7 Alex Markuze 2025-11-27  412  	}
d469e1da62544e7 Alex Markuze 2025-11-27  413  
d469e1da62544e7 Alex Markuze 2025-11-27  414  	seq_puts(s, "Last sent subvolume metrics:\n");
d469e1da62544e7 Alex Markuze 2025-11-27  415  	if (!nr) {
d469e1da62544e7 Alex Markuze 2025-11-27  416  		seq_puts(s, "  (none)\n");
d469e1da62544e7 Alex Markuze 2025-11-27  417  	} else {
d469e1da62544e7 Alex Markuze 2025-11-27  418  		seq_puts(s, "  subvol_id          rd_ops    wr_ops    rd_bytes       wr_bytes       rd_lat_us      wr_lat_us\n");
d469e1da62544e7 Alex Markuze 2025-11-27  419  		for (i = 0; i < nr; i++) {
d469e1da62544e7 Alex Markuze 2025-11-27  420  			const struct ceph_subvol_metric_snapshot *e = &snapshot[i];
d469e1da62544e7 Alex Markuze 2025-11-27  421  
d469e1da62544e7 Alex Markuze 2025-11-27  422  			seq_printf(s, "  %-18llu %-9llu %-9llu %-14llu %-14llu %-14llu %-14llu\n",
d469e1da62544e7 Alex Markuze 2025-11-27  423  				   e->subvolume_id,
d469e1da62544e7 Alex Markuze 2025-11-27  424  				   e->read_ops, e->write_ops,
d469e1da62544e7 Alex Markuze 2025-11-27  425  				   e->read_bytes, e->write_bytes,
d469e1da62544e7 Alex Markuze 2025-11-27  426  				   e->read_latency_us, e->write_latency_us);
d469e1da62544e7 Alex Markuze 2025-11-27  427  		}
d469e1da62544e7 Alex Markuze 2025-11-27  428  	}
d469e1da62544e7 Alex Markuze 2025-11-27  429  	kfree(snapshot);
d469e1da62544e7 Alex Markuze 2025-11-27  430  
d469e1da62544e7 Alex Markuze 2025-11-27  431  	seq_puts(s, "\nStatistics:\n");
d469e1da62544e7 Alex Markuze 2025-11-27  432  	seq_printf(s, "  entries_sent:      %llu\n", total_sent);
d469e1da62544e7 Alex Markuze 2025-11-27  433  
d469e1da62544e7 Alex Markuze 2025-11-27  434  	mutex_lock(&mdsc->subvol_metrics_last_mutex);
                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference

d469e1da62544e7 Alex Markuze 2025-11-27  435  	seq_printf(s, "  non_zero_sends:    %llu\n",
d469e1da62544e7 Alex Markuze 2025-11-27 @436  		   mdsc->subvol_metrics_nonzero_sends);
d469e1da62544e7 Alex Markuze 2025-11-27  437  	mutex_unlock(&mdsc->subvol_metrics_last_mutex);
d469e1da62544e7 Alex Markuze 2025-11-27  438  
d469e1da62544e7 Alex Markuze 2025-11-27  439  	seq_puts(s, "\nPending (unsent) subvolume metrics:\n");
d469e1da62544e7 Alex Markuze 2025-11-27  440  	ceph_subvolume_metrics_dump(&fsc->mdsc->subvol_metrics, s);
d469e1da62544e7 Alex Markuze 2025-11-27  441  	return 0;
d469e1da62544e7 Alex Markuze 2025-11-27  442  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

