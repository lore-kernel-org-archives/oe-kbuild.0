Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2A34F262
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559555; cv=none; b=QMzSAHGFaJ3DtKIZMfI4GiWDzqJ4K7bB9G1rl+qsY8aRe4+PBCDT7YRNTbO8s/OqEAA/Ktcfz4Sc6i60QUgY/ivdZa+xBx0AB+Bcs7l/B56NuhsXIfFrzALEJWTDc/mEQIa9v2kanCPW91bmNIKgcQhAv9oTj3TqSx+SWgW5ea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559555; c=relaxed/simple;
	bh=FXe73Ep9sD5rBsT34++3bbbhdAQxQqAf05cgTTcvnL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YfvshTPBmsVf+sXgVlrdl0nxKHeazigXTr4p9IPeT1vTLYHWTlbRepcgVaAZvmPhUkWRtaFqLvcniwhsIFc9BmSVFNFXmkjWwIW5Vv8N6luyBnP8aQW+mSO5J0omJRzAYRcDhq6qRCcWRSKHNjV8qYiqvUByhsiRrgyOzo5aMns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GI/wLjj9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GI/wLjj9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c4c65485so5614726f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 05:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763559552; x=1764164352; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/m614NLZ+hzZen13q8+FXmSjyAZ3+3CWaMrWQ9wAjhE=;
        b=GI/wLjj9Ku3Br3WsEgwFtC6hmS1HnY025Nx4IcVnQUntvwRcFjfKIjalWTE+B/aByr
         YVtuGFULIB/NHs72snHpE+FRmnIyZjDE27Yysf9WCq3dUNfYityHqyqeZ3pYYe4fReg2
         iQrD7c2MUZ0HvmmdvGj0oY4uYo7KqYEmdSmjBz8qRGtIjPTT3k0ktozlDEu3ofDXM1cp
         c5vKXLOLFGp9ciaErjv5xhhXgsJ6yb/XuXxhoiuqIKhISV0n/yAMsMVZaD5dxjGQJfaC
         IRHFIfAkPAF73O31myzi1klcXWzHu8vbyPvv+rkxSg/NuWbeBkio0WOM9RHps/1FIQQg
         5LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763559552; x=1764164352;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m614NLZ+hzZen13q8+FXmSjyAZ3+3CWaMrWQ9wAjhE=;
        b=KxOhIz2OCS8x5WJ5T8efEkUyR9ItI8y699cUgU+0f2CpjDR3Vsob0PoRFfmPehDT3v
         KCnDmkjwLIKhRsrDCmBt1HvqBnJ11auzhKvAS4JEw+/idbsE5DH5Ortar3eaX9paICV9
         FjyYcW1Y6lqfoymWo6EqxyAuwnfbqC1OC61WsaS0AGl9y9EIhwzEgamDVnhQYxv7Ed06
         hgdg1h5sI9bOjtYIuGSudH93Yv0+Y69md5MT3O7kcbALNcys6SFqqC63uT1TFnbQomBj
         xiO0O6MplDo96jPLvXh2MS3YDGcOpaTq65Ph0ctQJaplVMCLIhGGG0mRf8aEZRri/v6i
         ZsJw==
X-Gm-Message-State: AOJu0YwCFXA1hMXMN1o6dirZaeBh0TQEdNqk73e2Pwtr1jLW6SR32Gf9
	iKl0W2Qtha2GvL8uuAeqHZYBMdpnPuyiLVCbf45cFKkFxQ9su9t3l99ZgXzvdy4xwLYzzfYNRrK
	UTIdk
X-Gm-Gg: ASbGncu1nJok4UweG3A8juX0rAxrdLwFgXoKBVEM7L+x9bnW15le+lH3s0wYEi2J002
	fDF+T73BleZBsPviOtNCRGsUkZBivTSc0rr7p6VX4FbeWg+5r+EJbLuaVnuSsC99ez+HkjXPNqI
	2wyM2bnj9Q9x3sPXCW59qY8iRUuBybzX8GuReLY9RcseISTAx2qwsXkXvx4uV23AFuPy/dqTdMT
	xLclViwbFuyA3KsL3T+ZtqUxJc5whM3rVRm1aKyaqhG6xMCkvzq5SX8piiVC/mzpqtYDXdXBKgo
	PvP0+CJo4w6SckoQaZT6UwInQ7dIv6WAO9Yj7I3h/f9lM8LHPoWEgI1YYUHa0JQVCr5yGcpRmZ6
	cG2IcljN0dV2EYbZsTtkuZ19YQBa0QG6rZlqwcYplo0hV3pZT3b57DCcvKc2oDa3r7mr9RH3KFO
	IbnA+W7PD40+mVXl7q
X-Google-Smtp-Source: AGHT+IFywsvJ/Kkcb7CQTl669p0Qc8+79pdM+TJngb4nmXeXInYt0w/EpAge1FlITmi/iKuYtFhIyg==
X-Received: by 2002:a5d:64e9:0:b0:42b:4139:579f with SMTP id ffacd0b85a97d-42b593424d1mr22618315f8f.25.1763559551955;
        Wed, 19 Nov 2025 05:39:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53e846afsm37165279f8f.13.2025.11.19.05.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:39:11 -0800 (PST)
Date: Wed, 19 Nov 2025 16:39:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 9725/10183]
 drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing
 array offset 'i' after use.
Message-ID: <202511192128.aqouWvbT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251119133908.CBXJAPy_jgLWwpjOO5SVAQwlnSg6lzDP5rzQRkuiOGM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe4d0dea039f2befb93f27569593ec209843b0f5
commit: 896f1a2493b59beb2b5ccdf990503dbb16cb2256 [9725/10183] net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
config: xtensa-randconfig-r073-20251119 (https://download.01.org/0day-ci/archive/20251119/202511192128.aqouWvbT-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511192128.aqouWvbT-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing array offset 'i' after use.
drivers/net/ethernet/qlogic/qede/qede_fp.c:964 qede_tpa_cont() error: testing array offset 'i' after use.

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +/i +989 drivers/net/ethernet/qlogic/qede/qede_fp.c

cdda926d409869 Mintz, Yuval   2017-01-01   958  static inline void qede_tpa_cont(struct qede_dev *edev,
cdda926d409869 Mintz, Yuval   2017-01-01   959  				 struct qede_rx_queue *rxq,
cdda926d409869 Mintz, Yuval   2017-01-01   960  				 struct eth_fast_path_rx_tpa_cont_cqe *cqe)
cdda926d409869 Mintz, Yuval   2017-01-01   961  {
cdda926d409869 Mintz, Yuval   2017-01-01   962  	int i;
cdda926d409869 Mintz, Yuval   2017-01-01   963  
896f1a2493b59b Pavel Zhigulin 2025-11-13  @964  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This needs to be done the other way to avoid an off-by-one access.

	i < ARRAY_SIZE(cqe->len_list) && cqe->len_list[i]

cdda926d409869 Mintz, Yuval   2017-01-01   965  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d409869 Mintz, Yuval   2017-01-01   966  				   le16_to_cpu(cqe->len_list[i]));
cdda926d409869 Mintz, Yuval   2017-01-01   967  
cdda926d409869 Mintz, Yuval   2017-01-01   968  	if (unlikely(i > 1))
cdda926d409869 Mintz, Yuval   2017-01-01   969  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01   970  		       "Strange - TPA cont with more than a single len_list entry\n");
cdda926d409869 Mintz, Yuval   2017-01-01   971  }
cdda926d409869 Mintz, Yuval   2017-01-01   972  
10a0176e4e6eb6 Mintz, Yuval   2017-04-07   973  static int qede_tpa_end(struct qede_dev *edev,
cdda926d409869 Mintz, Yuval   2017-01-01   974  			struct qede_fastpath *fp,
cdda926d409869 Mintz, Yuval   2017-01-01   975  			struct eth_fast_path_rx_tpa_end_cqe *cqe)
cdda926d409869 Mintz, Yuval   2017-01-01   976  {
cdda926d409869 Mintz, Yuval   2017-01-01   977  	struct qede_rx_queue *rxq = fp->rxq;
cdda926d409869 Mintz, Yuval   2017-01-01   978  	struct qede_agg_info *tpa_info;
cdda926d409869 Mintz, Yuval   2017-01-01   979  	struct sk_buff *skb;
cdda926d409869 Mintz, Yuval   2017-01-01   980  	int i;
cdda926d409869 Mintz, Yuval   2017-01-01   981  
cdda926d409869 Mintz, Yuval   2017-01-01   982  	tpa_info = &rxq->tpa_info[cqe->tpa_agg_index];
cdda926d409869 Mintz, Yuval   2017-01-01   983  	skb = tpa_info->skb;
cdda926d409869 Mintz, Yuval   2017-01-01   984  
8a8633978b842c Manish Chopra  2018-05-17   985  	if (tpa_info->buffer.page_offset == PAGE_SIZE)
8a8633978b842c Manish Chopra  2018-05-17   986  		dma_unmap_page(rxq->dev, tpa_info->buffer.mapping,
8a8633978b842c Manish Chopra  2018-05-17   987  			       PAGE_SIZE, rxq->data_direction);
8a8633978b842c Manish Chopra  2018-05-17   988  
896f1a2493b59b Pavel Zhigulin 2025-11-13  @989  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Same.

cdda926d409869 Mintz, Yuval   2017-01-01   990  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d409869 Mintz, Yuval   2017-01-01   991  				   le16_to_cpu(cqe->len_list[i]));
cdda926d409869 Mintz, Yuval   2017-01-01   992  	if (unlikely(i > 1))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

