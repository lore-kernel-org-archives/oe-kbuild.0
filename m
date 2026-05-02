Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78073264A9D
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777741369; cv=none; b=lt95Zoyyi6ImAWFTDplmmKaDcdlLHmBC3Ckf1KcEoaoEnQn55lnfYztsUN/j1jtIxjJ9KASUNPflIxdlI/LLUpIxFgyCqCGIB0ZlZhS06tWIJyIQmifyQHo0dLpDVFLyPhvoL+ycBgqalqA9gux+DZA2TnARd11Q14/155LXu6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777741369; c=relaxed/simple;
	bh=VriAp7foZmsCBzHErYGHVXgwk9LudvrUIJpK0IpR+nE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=n1a1ruSflI/Nzf0tmEi+alRX+jp5N/AFKUNz3IGh/EOgGAXV5OjLpICgp93yeQpAniO1wp5I658J3+yIX6GkHK3XvssRp9araX/r0LrejJCHMUn5EoTi+3IanvnPTKzhlth3tgWgjYSSFjkR7oz2JjdvEH/M9fCjDY14vkP7dg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ED3bvbzK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ED3bvbzK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so30785035e9.2
        for <oe-kbuild@lists.linux.dev>; Sat, 02 May 2026 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777741365; x=1778346165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzZgdwNJdhU6FxCtJG+UDhVcrXtg6d879KRoARyawaI=;
        b=ED3bvbzKx+6NHbau1RG3iWBRuLO/Nntk6XLZteOySldDdlx5PTXCq0wutzufQVxM2e
         XuQLlHRCeQwpXGLMBoutoZAb5LF7trSAme3AsQ0jMuvps923pkxSaNTyw634Gyrif5i1
         A35CD7cp/Jb+C5WQEo9fo3xbA3P2+fvf4CMtDu0SGppkhoTMq2csbcxjNXyZ8DV+EGXy
         lGsAczM6eVjIjkp045IPxApseij39j77guF/jWShndnNPKhEKWhVuDHIIo/uvpunm9G4
         Tr80b9nobHJ2NRuLbSJRFzboIutihvfvP4oaNOJhiZ2tCvrdqY6T0sD09vuLboUOSuk6
         0rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777741365; x=1778346165;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzZgdwNJdhU6FxCtJG+UDhVcrXtg6d879KRoARyawaI=;
        b=MiiFe3pabrg6F3exKmHTMSPEDd8+W4EVQU9z/tQwHhHUG270yPITn5qboceUtLJdIy
         EvY99PukcNJvhFuQo9KxAZn83EHwPljFPU3Xw60WnPeEYee5Og9nOn2HCUAN4XufE09H
         884CD1je5Cb07y58WI76Gs/q8OrVQMYUliQjLjSdSw0At8ftsIV/pY+svzS8hWD2NFDy
         IN3ulXlBKPQsfeFG+B+y1lnXEZ8J+LP3awvESg29SoTjESCZdA0K9AVmm+TiWNHeRuoA
         WyXuVWkeKO7rkjInBMevablnopTcidgt/XxvEAlUZyKA2peALtmX7v9e8uhmUGqiMSMa
         2dwA==
X-Gm-Message-State: AOJu0Yz0gKWUxbbirU0cskEJKKihVVgNOiC629OWxvp73EP1QL+uDtoV
	BY/nlVFWBqcqh4n4kmN+LmU/0yLzoVMYgsqTZN+M1g/70hL32iEg0d6/FOmQ8A==
X-Gm-Gg: AeBDieu+YofNlHvsuTgarN3iCDgnO+EoSPNxinJP16lRyKS6RfneOD8TBrQo0Y4kjT6
	5qz8Yu2++JWvV2J8TTrL7X6D/fNKXzUkVPfuLMimLZxmbibx9rcY8ov1Sox4ztrT0gfR7WcIuXK
	FEtu92Ok9bIErq8ACMLIjWWxL7h4NPdHorZHGWHIPWXkd3dA9ikJ1ImHvpfmt41mdG0GXU5GmQ9
	A7lOv5c1MPJkj8NaRKel4AAgY0+UqeKvZculKqHbH5pNvUz7O51WNHcoiMxHScFGBsg8g/cVF4K
	dco2x7SQXQyRRM86vkh5mGhGrhGoUAn7OJ/0NGUYvoKaOthbXLPEw1ula+iGdwcwUoYmFxX5paE
	ZY+Vlu1yxsLTOpTH190iINcR6MxbY7ofT0sIr7wpIYJsONvBOs/Js0Xss1R1QvVeF+EISqzgHCe
	Gulni7BKwwCrrqtxw91zAD83DmFnOu+g==
X-Received: by 2002:a05:600c:620c:b0:48a:97b6:7420 with SMTP id 5b1f17b1804b1-48a98670f8emr57099515e9.24.1777741364564;
        Sat, 02 May 2026 10:02:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe92924sm38292845e9.2.2026.05.02.10.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 10:02:43 -0700 (PDT)
Date: Sat, 2 May 2026 20:02:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Tristan Madani <tristmd@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware
 bssdescriptsize in scan response
Message-ID: <202605030019.lL8x0ZPx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421135027.357622-3-tristmd@gmail.com>
Message-ID: <20260502170239.HZ1va2-W2y_uC0keUDE-U9F7Lum426ruyZyiyvcNL1E@z>

Hi Tristan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tristan-Madani/wifi-libertas-fix-OOB-read-from-firmware-pkt_ptr-offset-in-RX-path/20260423-061353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260421135027.357622-3-tristmd%40gmail.com
patch subject: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware bssdescriptsize in scan response
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260503/202605030019.lL8x0ZPx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605030019.lL8x0ZPx-lkp@intel.com/

smatch warnings:
drivers/net/wireless/marvell/libertas/rx.c:77 lbs_process_rxed_packet() warn: potential user controlled sizeof overflow '((p_rx_pd->pkt_ptr)) + 22' '0-u32max + 22'

vim +77 drivers/net/wireless/marvell/libertas/rx.c

69f9032d9dfeb7 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-11-23   57  int lbs_process_rxed_packet(struct lbs_private *priv, struct sk_buff *skb)
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   58  {
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   59  	int ret = 0;
6f93a8e7e41c2d drivers/net/wireless/libertas/rx.c         David Woodhouse           2007-12-10   60  	struct net_device *dev = priv->dev;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   61  	struct rxpackethdr *p_rx_pkt;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   62  	struct rxpd *p_rx_pd;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   63  	int hdrchop;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   64  	struct ethhdr *p_ethhdr;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   65  
7919b89c8276d6 drivers/net/wireless/libertas/rx.c         Holger Schurig            2008-04-01   66  	BUG_ON(!skb);
7919b89c8276d6 drivers/net/wireless/libertas/rx.c         Holger Schurig            2008-04-01   67  
6f93a8e7e41c2d drivers/net/wireless/libertas/rx.c         David Woodhouse           2007-12-10   68  	skb->ip_summed = CHECKSUM_NONE;
6f93a8e7e41c2d drivers/net/wireless/libertas/rx.c         David Woodhouse           2007-12-10   69  
d2ed2703cabd1e drivers/net/wireless/libertas/rx.c         Dan Williams              2014-05-22   70  	if (priv->wdev->iftype == NL80211_IFTYPE_MONITOR) {
d2ed2703cabd1e drivers/net/wireless/libertas/rx.c         Dan Williams              2014-05-22   71  		ret = process_rxed_802_11_packet(priv, skb);
d2ed2703cabd1e drivers/net/wireless/libertas/rx.c         Dan Williams              2014-05-22   72  		goto done;
d2ed2703cabd1e drivers/net/wireless/libertas/rx.c         Dan Williams              2014-05-22   73  	}
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   74  
e45d8e534b6758 drivers/net/wireless/libertas/rx.c         Bing Zhao                 2009-04-06   75  	p_rx_pd = (struct rxpd *) skb->data;
                                                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This comes from rx network data.

695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   76  
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21  @77  	if (le32_to_cpu(p_rx_pd->pkt_ptr) + sizeof(struct rxpackethdr) >
                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This + operation can have an integer wrapping bug.

695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   78  	    skb->len) {
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   79  		lbs_deb_rx("rx err: pkt_ptr %u beyond skb len %u\n",
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   80  			   le32_to_cpu(p_rx_pd->pkt_ptr), skb->len);
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   81  		ret = -EINVAL;
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   82  		dev_kfree_skb(skb);
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   83  		goto done;
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   84  	}
e45d8e534b6758 drivers/net/wireless/libertas/rx.c         Bing Zhao                 2009-04-06   85  	p_rx_pkt = (struct rxpackethdr *) ((u8 *)p_rx_pd +
e45d8e534b6758 drivers/net/wireless/libertas/rx.c         Bing Zhao                 2009-04-06   86  		le32_to_cpu(p_rx_pd->pkt_ptr));
e0e42da3a4df6f drivers/net/wireless/libertas/rx.c         Holger Schurig            2009-11-25   87  
e0e42da3a4df6f drivers/net/wireless/libertas/rx.c         Holger Schurig            2009-11-25   88  	dev = lbs_mesh_set_dev(priv, dev, p_rx_pd);
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   89  
ece56191932623 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-08-02   90  	lbs_deb_hex(LBS_DEB_RX, "RX Data: Before chop rxpd", skb->data,
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   91  		 min_t(unsigned int, skb->len, 100));
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   92  
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   93  	if (skb->len < (ETH_HLEN + 8 + sizeof(struct rxpd))) {
9012b28a407511 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-05-25   94  		lbs_deb_rx("rx err: frame received with bad length\n");
bbfc6b788f63f0 drivers/net/wireless/libertas/rx.c         Stephen Hemminger         2009-03-20   95  		dev->stats.rx_length_errors++;
d2ed2703cabd1e drivers/net/wireless/libertas/rx.c         Dan Williams              2014-05-22   96  		ret = -EINVAL;
f54930f363113a drivers/net/wireless/libertas/rx.c         Philip Rakity             2009-04-07   97  		dev_kfree_skb(skb);
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   98  		goto done;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   99  	}
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  100  
e45d8e534b6758 drivers/net/wireless/libertas/rx.c         Bing Zhao                 2009-04-06  101  	lbs_deb_rx("rx data: skb->len - pkt_ptr = %d-%zd = %zd\n",
a2caba6b5fc4e0 drivers/net/wireless/libertas/rx.c         John W. Linville          2009-04-14  102  		skb->len, (size_t)le32_to_cpu(p_rx_pd->pkt_ptr),
a2caba6b5fc4e0 drivers/net/wireless/libertas/rx.c         John W. Linville          2009-04-14  103  		skb->len - (size_t)le32_to_cpu(p_rx_pd->pkt_ptr));
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  104  
ece56191932623 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-08-02  105  	lbs_deb_hex(LBS_DEB_RX, "RX Data: Dest", p_rx_pkt->eth803_hdr.dest_addr,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

