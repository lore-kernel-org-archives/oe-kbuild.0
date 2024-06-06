Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F9155742
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664564; cv=none; b=MFVcTskWpJIp7G0YIL3nc5TEzEt/ufcbD7APT2KLdeX02O+qc8FVwQ1QRMefabqzFpq5VS0wzLqCeT3tYxafxvFqlBMmxrE6h4Qjmp0fPt/uyx9BQnLwbu4ITufbOFRFkjhzaPPa4kvtpPuUUwHQ8ECVdaCAy6Rq3W0Xez6UF+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664564; c=relaxed/simple;
	bh=mCpxfybVw+s5t6VAkDxz45g2sACkRSwSf/rV11JR9GM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fY4HW9nx4Bd3FV4uviU+vDDkf8TMjEQWpeKSdeI8xGwVYtVIdqvEloslVzSS90cEyX4EaihuMDkUjcrCuJL4sPCsmohW0gPHnDhWx0uZzCyA+dQugmWsj+cieuFhlM/VZCAp9rfpmJniWejULKgFN+23KFJSqzb5AEGFJUE95Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLBMMLtx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLBMMLtx"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso809058a12.0
        for <oe-kbuild@lists.linux.dev>; Thu, 06 Jun 2024 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717664560; x=1718269360; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jhqJzVWKZBINGIderyOHidcYli4dqLXjpNqkP4LDD4=;
        b=NLBMMLtxZr6qmlMBabfQyucYd9uYYmJ8yk5D+dEXSM1yopZnI7RFk9z1TblUi9UN+2
         TLTsvg7WiRqyxVxsWjoOn71+5NAnUlSceORN9hlQHHcOm4fosxzpytKvoOWLbPnB5bto
         EQomcgP3rQIoaw/FYpDuKyOUCTWsBFkY9PMQ5mx3Lhs/g/n5KWY4DXD0VRdWvmraoqQR
         CmrYa+TzTyIPYullOpTp9O8Icq7NyjsV+mU2P0twRYIjwdJImonezos3xIFsGFQPNAQ5
         onrmCwWjWdb0wK0fLqwhm7TZ6BhSiP+7cYle6uh5u6gKIVaaz+fAt2OECxrIfUtk923i
         ixIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717664560; x=1718269360;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jhqJzVWKZBINGIderyOHidcYli4dqLXjpNqkP4LDD4=;
        b=c6t9Kaq4c/pn0MqHeBo/ziErYSGM6IKcYpiXPFripkh5u6L7GGPff+LZpGU5lYdZ7Z
         XeM3PaLH2eK68UFQBSvrP1FoGGgI3OkowLyWuBdn8goVT3+LacWLDGOHFbN65bgS2zEu
         40d2l8eSUTW51WosYaddZ8r8f7rWoQnCQEarxanQ0rRshQSXdCkviSGuc/Fl1EHO8aR6
         l/OXIgAs6MzVLCxF8jFC1Low9Tp474pfoEv5HZY3FS+YGiy17FTjcebAQQt05xUKggLg
         SRBtsq9aSJ+KHogMiDQz1acLdvPrHm3zFBEhASJBg0cVxCqRscppEgF5epPwOWghyOlM
         UWJw==
X-Gm-Message-State: AOJu0Yyjwv8kTqaeBoKWZf1i0xo96+Ekhd66KLdDTzq16TmtJbKpCsLR
	vFksuEcNJ4c6wFcMLAZIgaIGi2ZOGG85zpeIcxv3UlrVKxoqgtrZ9Ui995LD+M9w5789L0o/MvQ
	d
X-Google-Smtp-Source: AGHT+IFaVLx5dgwnC0TMCfiKkqRrwIvNS5Mx2Z2QJryQfdCTPctVUM2HpPWn3S2o+xJhrcNy53Wl+g==
X-Received: by 2002:a50:aa93:0:b0:57a:27f5:1272 with SMTP id 4fb4d7f45d1cf-57a8b6b709fmr3119565a12.24.1717664560342;
        Thu, 06 Jun 2024 02:02:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadf9b9d0sm740521a12.2.2024.06.06.02.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:02:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 12:02:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jeremy Kerr <jk@codeconstruct.com.au>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 2/3] net: core: Implement dstats-type stats collections
Message-ID: <0510655b-f42e-47e0-81e6-29ab58645c51@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605-dstats-v1-2-1024396e1670@codeconstruct.com.au>

Hi Jeremy,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Kerr/net-core-vrf-Change-pcpu_dstat-fields-to-u64_stats_t/20240605-143942
base:   32f88d65f01bf6f45476d7edbe675e44fb9e1d58
patch link:    https://lore.kernel.org/r/20240605-dstats-v1-2-1024396e1670%40codeconstruct.com.au
patch subject: [PATCH 2/3] net: core: Implement dstats-type stats collections
config: x86_64-randconfig-161-20240606 (https://download.01.org/0day-ci/archive/20240606/202406061253.ZgaLHWWp-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406061253.ZgaLHWWp-lkp@intel.com/

smatch warnings:
net/core/dev.c:10871 dev_fetch_dstats() error: uninitialized symbol 'dstats'.

vim +/dstats +10871 net/core/dev.c

85bc70c64e8362d Jeremy Kerr     2024-06-05  10860  void dev_fetch_dstats(struct rtnl_link_stats64 *s,
85bc70c64e8362d Jeremy Kerr     2024-06-05  10861  		      const struct pcpu_dstats __percpu *dstats)
                                                                                                         ^^^^^^

85bc70c64e8362d Jeremy Kerr     2024-06-05  10862  {
85bc70c64e8362d Jeremy Kerr     2024-06-05  10863  	int cpu;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10864  
85bc70c64e8362d Jeremy Kerr     2024-06-05  10865  	for_each_possible_cpu(cpu) {
85bc70c64e8362d Jeremy Kerr     2024-06-05  10866  		u64 rx_packets, rx_bytes, rx_drops;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10867  		u64 tx_packets, tx_bytes, tx_drops;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10868  		const struct pcpu_dstats *dstats;
                                                                                          ^^^^^^
Don't declare a local dstats which shadows the function scope variable.

85bc70c64e8362d Jeremy Kerr     2024-06-05  10869  		unsigned int start;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10870  
85bc70c64e8362d Jeremy Kerr     2024-06-05 @10871  		dstats = per_cpu_ptr(dstats, cpu);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10872  		do {
85bc70c64e8362d Jeremy Kerr     2024-06-05  10873  			start = u64_stats_fetch_begin(&dstats->syncp);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10874  			rx_packets = u64_stats_read(&dstats->rx_packets);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10875  			rx_bytes   = u64_stats_read(&dstats->rx_bytes);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10876  			rx_drops   = u64_stats_read(&dstats->rx_drops);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10877  			tx_packets = u64_stats_read(&dstats->tx_packets);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10878  			tx_bytes   = u64_stats_read(&dstats->tx_bytes);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10879  			tx_drops   = u64_stats_read(&dstats->tx_drops);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10880  		} while (u64_stats_fetch_retry(&dstats->syncp, start));
85bc70c64e8362d Jeremy Kerr     2024-06-05  10881  
85bc70c64e8362d Jeremy Kerr     2024-06-05  10882  		s->rx_packets += rx_packets;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10883  		s->rx_bytes   += rx_bytes;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10884  		s->rx_dropped += rx_drops;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10885  		s->tx_packets += tx_packets;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10886  		s->tx_bytes   += tx_bytes;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10887  		s->tx_dropped += tx_drops;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10888  	}
85bc70c64e8362d Jeremy Kerr     2024-06-05  10889  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

