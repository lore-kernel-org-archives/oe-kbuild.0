Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E011B6CF6
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729842259; cv=none; b=F1mqrZqeSwMfGFH/JuPil+KbRuMAWmO5b+IfX4VrlPYj6EY2iy3MP8+wvCaYJWZqQLeH8rvYxMztPTgiVoWcXT/tY0KXYfBdQ0CDsI6q37L5PFMgcpRXFEsRVGhTBbZSACSqg7Bh+EoSbNDRKaNXwLN1gTS5NTjwS0ZuYNAw+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729842259; c=relaxed/simple;
	bh=dJo0OCZTS17hWD5C48chC43bhuVPP74TT2WmtHdlfvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=o+r4CIDMkGPb5oKjbkEBmqPxYVYoHFWpJwuxXl1SGZLysKMZG4nZsJqTVfcScgiCU3OYs0E1QT4iSfh+MvJOWQvN+bvkqu6+uhPOGJf0T278D3TMgYNGq6dXJJwh0VLDDYxmxCFtTfKSFSlM+dozQ8ps083SiRjrCCCftHh94kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LjQkGBWB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LjQkGBWB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431616c23b5so12230085e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729842254; x=1730447054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Shoxcp3h480bf/MaRlp7RFfSIiO1DRQ9b/G/3O5b+1c=;
        b=LjQkGBWBsAY/leXy//qu5ltehnGPG4DQtbKaDX8pbAYekeR0XGN3IGndQAlKPK3Uek
         2Qs11yx7geTa+4fZTOlh/lBO3kupO89ctjpHLziCnC82Q0UZ1kfOgYxXmIheg9QWNFOg
         vPrZiZyN0NFdtQMVAZEYCCTQ4E5el5+I34RnUaT0p6F+C5SzHn5vlAoz/kZNXaHSf28r
         41ELNRVfPnuczyRIaFHAT3GkeaeRnckzjRcMby+TRrSLQVvFvUcxi+qVVPsSWxSzRShe
         Sy+uWKzVzoGej5Jb8lFIhFCh/s6sYS8q5EL6tF4HkHhnQqQ3MZ3Vk3hdB/kRuHlXDozK
         jH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729842254; x=1730447054;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Shoxcp3h480bf/MaRlp7RFfSIiO1DRQ9b/G/3O5b+1c=;
        b=J3gxA+N2WcV87iggQJIvkGqDuafJb5QTwC3/CnO8/NPMvvA1dSwHIOmAzXUng1yOBk
         ycCMYXqVmjqMk45g8NXzvk8rm3gjsM1Hq5JnP8QH7945bubO8yzDeO0B1lKjLg0qZYkR
         giDiXF8k3Lt8gniXqxCzLlBOkhuayuN6gp8pCYGcmtWNlI+AJeU0BWhTYWVgDi5wfWlw
         nYDMHl1fqWDDccbDQbRqTj9UKadZwhuU/fPCPpbtMo1ZYk6xdSvUbJHScZ7yLuU+QyYw
         BiYryERzlp+d1eGH0U3pla5aNyas6PqQh2KU7U6O/qRW/OcoQvls15g7YfuIMMGaJ4gA
         mSrw==
X-Gm-Message-State: AOJu0YwKxMbWs7lPeh6p9qRK+nkHCimDlDkXM8Hh9Ka0kbzibacTl2We
	bLUkfxyY7zy4Lux8OE54O7QducuSvPZeN3ICArlyMmcK30MsQ/mngW7gvYAI3jjEjbrgLWu/6qe
	gdJMjbA==
X-Google-Smtp-Source: AGHT+IHqGpEQ/vKDPecI19Mf9I/hj7pHAGWAj1QEt5pPdkx4Mu+LCIjrnm1o5CIW71lKN73l8P+HoA==
X-Received: by 2002:a05:600c:4689:b0:42c:b826:a26c with SMTP id 5b1f17b1804b1-4318b5a561cmr32758465e9.8.1729842254093;
        Fri, 25 Oct 2024 00:44:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360d318sm9865635e9.47.2024.10.25.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:44:13 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:44:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Remi Pommarel <repk@triplefau.lt>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Cedric Veilleux <veilleux.cedric@gmail.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in
 ath10k_flush()
Message-ID: <60d579e2-5eb7-4239-9a23-95fa4b32f351@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk@triplefau.lt>

Hi Remi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Remi-Pommarel/wifi-ath10k-Implement-ieee80211-flush_sta-callback/20241022-172038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk%40triplefau.lt
patch subject: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in ath10k_flush()
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251152.A5axJliR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410251152.A5axJliR-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath10k/mac.c:8076 _ath10k_mac_wait_tx_complete() error: uninitialized symbol 'empty'.

vim +/empty +8076 drivers/net/wireless/ath/ath10k/mac.c

c4f7022f0ef0aa Remi Pommarel     2024-10-22  8062  static void _ath10k_mac_wait_tx_complete(struct ath10k *ar,
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8063  					 unsigned long queues)
5e3dd157d7e70f Kalle Valo        2013-06-12  8064  {
affd321733eebc Michal Kazior     2013-07-16  8065  	bool skip;
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8066  	long time_left;
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8067  	unsigned int q;
5e3dd157d7e70f Kalle Valo        2013-06-12  8068  
5e3dd157d7e70f Kalle Valo        2013-06-12  8069  	/* mac80211 doesn't care if we really xmit queued frames or not
d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8070  	 * we'll collect those frames either way if we stop/delete vdevs
d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8071  	 */
548db54cc1890b Michal Kazior     2013-07-05  8072  
affd321733eebc Michal Kazior     2013-07-16  8073  	if (ar->state == ATH10K_STATE_WEDGED)
828853ac58265c Wen Gong          2018-08-28  8074  		return;
affd321733eebc Michal Kazior     2013-07-16  8075  
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15 @8076  	time_left = wait_event_timeout(ar->htt.empty_tx_wq, ({
5e3dd157d7e70f Kalle Valo        2013-06-12  8077  			bool empty;
affd321733eebc Michal Kazior     2013-07-16  8078  
edb8236df4d042 Michal Kazior     2013-07-05  8079  			spin_lock_bh(&ar->htt.tx_lock);
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8080  			for_each_set_bit(q, &queues, ar->hw->queues) {

Smatch is concerned that there might not be any set bits.  (You know that the
compiler is automatically going to ininitialize empty to false so it costs
nothing to initialize it to false explicitly and silence this warning).

c4f7022f0ef0aa Remi Pommarel     2024-10-22  8081  				empty = (ar->htt.num_pending_per_queue[q] == 0);
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8082  				if (!empty)
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8083  					break;
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8084  			}
edb8236df4d042 Michal Kazior     2013-07-05  8085  			spin_unlock_bh(&ar->htt.tx_lock);
affd321733eebc Michal Kazior     2013-07-16  8086  
7962b0d898accd Michal Kazior     2014-10-28  8087  			skip = (ar->state == ATH10K_STATE_WEDGED) ||
7962b0d898accd Michal Kazior     2014-10-28  8088  			       test_bit(ATH10K_FLAG_CRASH_FLUSH,
7962b0d898accd Michal Kazior     2014-10-28  8089  					&ar->dev_flags);
affd321733eebc Michal Kazior     2013-07-16  8090  
affd321733eebc Michal Kazior     2013-07-16  8091  			(empty || skip);
5e3dd157d7e70f Kalle Valo        2013-06-12  8092  		}), ATH10K_FLUSH_TIMEOUT_HZ);
affd321733eebc Michal Kazior     2013-07-16  8093  
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8094  	if (time_left == 0 || skip)
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8095  		ath10k_warn(ar, "failed to flush transmit queue (skip %i ar-state %i): %ld\n",
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8096  			    skip, ar->state, time_left);
828853ac58265c Wen Gong          2018-08-28  8097  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

