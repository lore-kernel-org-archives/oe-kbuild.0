Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037C257854
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 06:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498028; cv=none; b=O9s8RSa1yWSCfCIYxJt+0CaESw2ulf8yypqOGhnZtXtFhTgasm65d8q88NPwUzpgMSmoP6kO5VmjY11GIjYyfmFOqrPv4Fhsi/s/PpY06kkBqWGJj01qF5ZAZI7yoY8l3w0RXku98wVsXTnAw4JEfQ2IkIde632HgYkJkckbUQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498028; c=relaxed/simple;
	bh=T3q+O+jof6fhFKBiJ6CVFzCkkLe74GTWxIh8QQz46AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Dk8IqmGG1Ny0x4xTG8VkSsPEtK7sQD1Tr/ULZzavGt4IzO0qfb2YfRU4ffo4rEp1Q4UkjmHVETbpUHGy/e6i93bmF3W0iiesQZjlvQ+SAfbAb/e+GYpQOoWy2Bp352bNzu5m6gGko2lqZKyT7jaTU62GZWRDfv/+Uqkt25CKQ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DH/iZurB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DH/iZurB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b004954so26275595e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 23:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755498024; x=1756102824; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vv+EedLDos6KkXvRZMzob7Rp+3yduDfdutqU9xZjFI0=;
        b=DH/iZurBCHR0MfbjjrXuqJT1QzvLdB7EB5prp/O2TwjYhc7bcg6MEAs0KnDE5Ayz4P
         /Ye0EmhC9uKvWYBUFVgDrOEhxAmt4DgrU9iSx4Imc2ytAm2shPABqRvEIYNsCSDPkGLu
         le0JqlB6xcB2u/pGL9Q1BVp4t/Lnyl9lSDqo/31VfXC4Kx6RrevpqGxi8iyTDPAwh5DT
         hIur3cGo3gqemIw45BdPBDxMVakOK8e2+ARIgFUoO9n/28r6e4xGnKRZ4psJCPUoUrqi
         hVoHcFzzBXHauOshX1krVXvEFD8PsHw3kgk6v+xA2lJWxJNIRM9DQd9xSbw5iwoU1QpR
         WOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755498024; x=1756102824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vv+EedLDos6KkXvRZMzob7Rp+3yduDfdutqU9xZjFI0=;
        b=MCvfi4SIL0oKZCd5mJqlL3CjJ3Im9gCvKfAHuBxQj/50GWxB2s2nGXMufYK6FmMMHi
         WNO0h4DNHaLFfLnQIJRe1zGxaY3Zbkuyk/j8trIG9/e5Fgc3akVJDwQZRlWd3qeq6t8w
         /UMgizoXe9+HoukYnDtf5ftdMc8fdYQAs3XQjM4I0O2C3cVKQt7Z21E3tz2LrKNtPFSY
         /PVe9RIP0wbF8egu08QakYJHo2Kswb+a+t607apmnq6+4YU92lJjHoEVIdB2KZ9wU49M
         oHsX7d/jR2q3kum7dt1jYP/7rCHMAnaN7LPqI+NO3a8ZPbY+dvhSPAWkXSbzTGWKU8GY
         Hxdg==
X-Gm-Message-State: AOJu0YzZ7PniQk8VhL2vMEvaOqmFERE8mxsgDkoGtmh2o3Pbwnx5K2lx
	q8qhYZlXyjKEz5+MiyrN4nMsiQBuQs/yevR6qbkEF4F3BjUgK+VWmjqn5WJiwnaXaouj5RdvtZ9
	I7VtG
X-Gm-Gg: ASbGncteHVX69ZdrCPd+q9GkX4fHOq0BL9p7a6Ncx0wxunfxb87atheCc4g9ccXNYS2
	n4PO0Nf+tVLYJotAwOTdsSiioM3Te8ze2SxigcxDCK6bAWYOkGMBQwVwure5az+4bJEFxRROhKR
	cwM7NGKgHb1loe1JctYuiLUnvfn75jZ1f73R6QAv7u/MNkp77jNDFVErjVTLfCbWGzGS6jfucfk
	ez8ZFGTGdCBZyk+hSqjNeTdaMKj5mXe3XlgAwtPBomiJitIwx90Z/SmKhpU6ja+Fk3FXghcj7kF
	CY1hVmR9yA3Z2Y0df6MRYgOHxhhldArZS7DwaZRcplpedIbqRPOkx1GoPCdOS4s7Dno5fHMgJKw
	Kc4VUPNmCahRaVo2eWbDstgffgfk=
X-Google-Smtp-Source: AGHT+IG+5SFi/GAbP4l+i/xmyijRNIVvSEjZ/3P/W3aR8A+Chf11iBLXkTTgzrgOP4ZfTjF9okFrnw==
X-Received: by 2002:a05:6000:2284:b0:3b9:1635:c13 with SMTP id ffacd0b85a97d-3bc684d7af0mr5411496f8f.16.1755498024235;
        Sun, 17 Aug 2025 23:20:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb676caf79sm11538282f8f.42.2025.08.17.23.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:20:23 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:20:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jason Xing <kerneljasonxing@gmail.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, bjorn@kernel.org, magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com, jonathan.lemon@gmail.com,
	sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net,
	hawk@kernel.org, john.fastabend@gmail.com, horms@kernel.org,
	andrew+netdev@lunn.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	netdev@vger.kernel.org, Jason Xing <kernelxing@tencent.com>
Subject: Re: [PATCH net-next 1/2] xsk: introduce XDP_GENERIC_XMIT_BATCH
 setsockopt
Message-ID: <202508171049.SGYNFbP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811131236.56206-2-kerneljasonxing@gmail.com>
Message-ID: <20250818062020.fO3pnjY7eLfwP3pfIlMOw0fQTGMLJiU9HGyMLSR5PPc@z>

Hi Jason,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/xsk-introduce-XDP_GENERIC_XMIT_BATCH-setsockopt/20250811-211509
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250811131236.56206-2-kerneljasonxing%40gmail.com
patch subject: [PATCH net-next 1/2] xsk: introduce XDP_GENERIC_XMIT_BATCH setsockopt
config: s390-randconfig-r073-20250817 (https://download.01.org/0day-ci/archive/20250817/202508171049.SGYNFbP3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508171049.SGYNFbP3-lkp@intel.com/

smatch warnings:
net/xdp/xsk.c:1495 xsk_setsockopt() warn: inconsistent returns '&xs->mutex'.

vim +1495 net/xdp/xsk.c

48248366d9de2a Jason Xing         2025-08-11  1460  	case XDP_GENERIC_XMIT_BATCH:
48248366d9de2a Jason Xing         2025-08-11  1461  	{
48248366d9de2a Jason Xing         2025-08-11  1462  		unsigned int batch, batch_alloc_len;
48248366d9de2a Jason Xing         2025-08-11  1463  		struct sk_buff **new;
48248366d9de2a Jason Xing         2025-08-11  1464  
48248366d9de2a Jason Xing         2025-08-11  1465  		if (optlen != sizeof(batch))
48248366d9de2a Jason Xing         2025-08-11  1466  			return -EINVAL;
48248366d9de2a Jason Xing         2025-08-11  1467  		if (copy_from_sockptr(&batch, optval, sizeof(batch)))
48248366d9de2a Jason Xing         2025-08-11  1468  			return -EFAULT;
48248366d9de2a Jason Xing         2025-08-11  1469  		if (batch > xs->max_tx_budget)
48248366d9de2a Jason Xing         2025-08-11  1470  			return -EACCES;
48248366d9de2a Jason Xing         2025-08-11  1471  
48248366d9de2a Jason Xing         2025-08-11  1472  		mutex_lock(&xs->mutex);
48248366d9de2a Jason Xing         2025-08-11  1473  		if (!batch) {
48248366d9de2a Jason Xing         2025-08-11  1474  			kfree(xs->skb_batch);
48248366d9de2a Jason Xing         2025-08-11  1475  			xs->generic_xmit_batch = 0;
48248366d9de2a Jason Xing         2025-08-11  1476  			goto out;
48248366d9de2a Jason Xing         2025-08-11  1477  		}
48248366d9de2a Jason Xing         2025-08-11  1478  		batch_alloc_len = sizeof(struct sk_buff *) * batch;
48248366d9de2a Jason Xing         2025-08-11  1479  		new = kmalloc(batch_alloc_len, GFP_KERNEL);
48248366d9de2a Jason Xing         2025-08-11  1480  		if (!new)
48248366d9de2a Jason Xing         2025-08-11  1481  			return -ENOMEM;

mutex_unlock(&xs->mutex); before returning

48248366d9de2a Jason Xing         2025-08-11  1482  		if (xs->skb_batch)
48248366d9de2a Jason Xing         2025-08-11  1483  			kfree(xs->skb_batch);
48248366d9de2a Jason Xing         2025-08-11  1484  
48248366d9de2a Jason Xing         2025-08-11  1485  		xs->skb_batch = new;
48248366d9de2a Jason Xing         2025-08-11  1486  		xs->generic_xmit_batch = batch;
48248366d9de2a Jason Xing         2025-08-11  1487  out:
48248366d9de2a Jason Xing         2025-08-11  1488  		mutex_unlock(&xs->mutex);
48248366d9de2a Jason Xing         2025-08-11  1489  		return 0;
48248366d9de2a Jason Xing         2025-08-11  1490  	}
c0c77d8fb787cf Björn Töpel        2018-05-02  1491  	default:
c0c77d8fb787cf Björn Töpel        2018-05-02  1492  		break;
c0c77d8fb787cf Björn Töpel        2018-05-02  1493  	}
c0c77d8fb787cf Björn Töpel        2018-05-02  1494  
c0c77d8fb787cf Björn Töpel        2018-05-02 @1495  	return -ENOPROTOOPT;
c0c77d8fb787cf Björn Töpel        2018-05-02  1496  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

