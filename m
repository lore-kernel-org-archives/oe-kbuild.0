Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261762DBC3
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jun 2023 22:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686089481; x=1717625481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2fwHTDC5j2kM1eMPUkly7zz8hgOwTJKVCtRFU4ZDdTs=;
  b=ReIiWJp0jl7T8rbOr23J7U1PGcxVir4cM4tT1X36U4sBcx638UpgqhIZ
   m2M9nnV1jqgsaQyLAwNq9FUP2HPA43s058OLLlOqhy64dZuiYWewXmoQa
   vuVuG/65UurcaRtPrf0/FtV3wbsoLPgjYHSMy+mAJ+D2gWSZw0SpGASqk
   4UcOFDFG8/scKl2AU+nM5+GdOCkmIxiEL1TvTaCSa1N+60ep42pKAr3pN
   hbSGRN38JnVKaRxz0AGr2XkyHb+PuWMcN+zeGSN2c5nHpV8iAoTVatCkH
   Ez7EsujTY2q1BwtdXQ2/haSz9fcnQ/Nbb2lRb485vM99cTYv5XHUB6MFW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="346419304"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="346419304"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 15:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="821846152"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="821846152"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2023 15:11:16 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6etX-0005nV-2b;
	Tue, 06 Jun 2023 22:11:15 +0000
Date: Wed, 7 Jun 2023 06:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 bpf-next 08/22] xsk: add support for AF_XDP
 multi-buffer on Tx path
Message-ID: <202306070629.10bA9j7d-lkp@intel.com>
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
In-Reply-To: <20230605144433.290114-9-maciej.fijalkowski@intel.com>
References: <20230605144433.290114-9-maciej.fijalkowski@intel.com>
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
TO: bpf@vger.kernel.org
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: andrii@kernel.org
CC: netdev@vger.kernel.org
CC: magnus.karlsson@intel.com
CC: bjorn@kernel.org
CC: tirthendu.sarkar@intel.com
CC: maciej.fijalkowski@intel.com
CC: simon.horman@corigine.com

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Fijalkowski/xsk-prepare-options-in-xdp_desc-for-multi-buffer-use/20230605-225718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230605144433.290114-9-maciej.fijalkowski%40intel.com
patch subject: [PATCH v3 bpf-next 08/22] xsk: add support for AF_XDP multi-buffer on Tx path
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: csky-randconfig-m031-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070629.10bA9j7d-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306070629.10bA9j7d-lkp@intel.com/

New smatch warnings:
net/xdp/xsk.c:671 xsk_build_skb() error: 'skb' dereferencing possible ERR_PTR()

Old smatch warnings:
net/xdp/xsk.c:672 xsk_build_skb() error: 'skb' dereferencing possible ERR_PTR()
net/xdp/xsk.c:1108 xsk_bind() warn: passing a valid pointer to 'PTR_ERR'
arch/csky/include/asm/uaccess.h:191 __get_user_fn() error: uninitialized symbol 'retval'.

vim +/skb +671 net/xdp/xsk.c

9c8f21e6f8856a Xuan Zhuo        2021-02-18  601  
9c8f21e6f8856a Xuan Zhuo        2021-02-18  602  static struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
9c8f21e6f8856a Xuan Zhuo        2021-02-18  603  				     struct xdp_desc *desc)
9c8f21e6f8856a Xuan Zhuo        2021-02-18  604  {
9c8f21e6f8856a Xuan Zhuo        2021-02-18  605  	struct net_device *dev = xs->dev;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  606  	struct sk_buff *skb = xs->skb;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  607  	int err;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  608  
9c8f21e6f8856a Xuan Zhuo        2021-02-18  609  	if (dev->priv_flags & IFF_TX_SKB_NO_LINEAR) {
9c8f21e6f8856a Xuan Zhuo        2021-02-18  610  		skb = xsk_build_skb_zerocopy(xs, desc);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  611  		if (IS_ERR(skb)) {
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  612  			err = PTR_ERR(skb);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  613  			goto free_err;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  614  		}
9c8f21e6f8856a Xuan Zhuo        2021-02-18  615  	} else {
9c8f21e6f8856a Xuan Zhuo        2021-02-18  616  		u32 hr, tr, len;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  617  		void *buffer;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  618  
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  619  		buffer = xsk_buff_raw_get_data(xs->pool, desc->addr);
9c8f21e6f8856a Xuan Zhuo        2021-02-18  620  		len = desc->len;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  621  
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  622  		if (!skb) {
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  623  			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(dev->needed_headroom));
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  624  			tr = dev->needed_tailroom;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  625  			skb = sock_alloc_send_skb(&xs->sk, hr + len + tr, 1, &err);
9c8f21e6f8856a Xuan Zhuo        2021-02-18  626  			if (unlikely(!skb))
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  627  				goto free_err;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  628  
9c8f21e6f8856a Xuan Zhuo        2021-02-18  629  			skb_reserve(skb, hr);
9c8f21e6f8856a Xuan Zhuo        2021-02-18  630  			skb_put(skb, len);
9c8f21e6f8856a Xuan Zhuo        2021-02-18  631  
9c8f21e6f8856a Xuan Zhuo        2021-02-18  632  			err = skb_store_bits(skb, 0, buffer, len);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  633  			if (unlikely(err))
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  634  				goto free_err;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  635  		} else {
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  636  			int nr_frags = skb_shinfo(skb)->nr_frags;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  637  			struct page *page;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  638  			u8 *vaddr;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  639  
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  640  			if (unlikely(nr_frags == (MAX_SKB_FRAGS - 1) && xp_mb_desc(desc))) {
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  641  				err = -EFAULT;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  642  				goto free_err;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  643  			}
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  644  
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  645  			page = alloc_page(xs->sk.sk_allocation);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  646  			if (unlikely(!page)) {
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  647  				err = -EAGAIN;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  648  				goto free_err;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  649  			}
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  650  
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  651  			vaddr = kmap_local_page(page);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  652  			memcpy(vaddr, buffer, len);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  653  			kunmap_local(vaddr);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  654  
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  655  			skb_add_rx_frag(skb, nr_frags, page, 0, len, 0);
9c8f21e6f8856a Xuan Zhuo        2021-02-18  656  		}
9c8f21e6f8856a Xuan Zhuo        2021-02-18  657  	}
9c8f21e6f8856a Xuan Zhuo        2021-02-18  658  
9c8f21e6f8856a Xuan Zhuo        2021-02-18  659  	skb->dev = dev;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  660  	skb->priority = xs->sk.sk_priority;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  661  	skb->mark = xs->sk.sk_mark;
9c8f21e6f8856a Xuan Zhuo        2021-02-18  662  	skb->destructor = xsk_destruct_skb;
0918fb10a5a3a1 Tirthendu Sarkar 2023-06-05  663  	xsk_set_destructor_arg(skb);
9c8f21e6f8856a Xuan Zhuo        2021-02-18  664  
9c8f21e6f8856a Xuan Zhuo        2021-02-18  665  	return skb;
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  666  
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  667  free_err:
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  668  	if (err == -EAGAIN) {
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  669  		xsk_cq_cancel_locked(xs, 1);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  670  	} else {
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05 @671  		xsk_set_destructor_arg(skb);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  672  		xsk_drop_skb(skb);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  673  		xskq_cons_release(xs->tx);
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  674  	}
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  675  
2a2c79839c47c1 Tirthendu Sarkar 2023-06-05  676  	return ERR_PTR(err);
9c8f21e6f8856a Xuan Zhuo        2021-02-18  677  }
9c8f21e6f8856a Xuan Zhuo        2021-02-18  678  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
