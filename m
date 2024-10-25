Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2B220102B
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 21:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729890454; cv=none; b=lUMC4e5uftWaZBaM9oLwiioebO9jTiJdchhtotOMv1lzVUBQURIEIuoWXIygRDmAsDoryJSbayWBuy7TA6APAEkH56QsZ+wUrd59QiZpcRWRkaJJgc3CTErwLG2OAv4y56dwk40NNgAlNqOg6atdRFzWCbBf4Rz1b+I26gOvv0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729890454; c=relaxed/simple;
	bh=7Z6UuvsYI3it+HQGJsit5f9LunRLGBhY/P4nCqRqgwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RED8pcr2u0Z6KPRVt1DD+ZNPrRdA3JZb43cKidBf5GLitl3pdYdfD2js2LuGs7JT3Dy+MgiqShfaoan1fUirsO8gB+OEkF9GqwLS5lB3L6DEAKlM29tLAy0L7YQV6UVzqgGR+0LvmEmtMOuJHRItQSDnhIT0ZXR6qm+3Ysi555c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmR03pUb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmR03pUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729890452; x=1761426452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Z6UuvsYI3it+HQGJsit5f9LunRLGBhY/P4nCqRqgwA=;
  b=bmR03pUbqROOH3RaPZ0WBeb5oE7k/vDzmsruRuNfklGaXIQ+aVae29Jk
   FvMQ1rwT/IA1pN/0MsZ46VactLnAoQ9Pe0Oprzazd2RTc/AUt5Lxxyw4o
   fHuXfq6vlffZem0rBKE45DZO4ioKZ1Tcalhdlrx8vX/xejVyGIyJaehQM
   WSkOay9niwtK3ZpM3dJwzZxcWi2xqmnpiU40l/MzhHDgOFvBAYn6ZSRz/
   93ROfcF6wnUQx6mbEMjrvPSDgR0SzRSbQhus6/cMsNNYzqOmwptmFvwwH
   HiNhfKe2UqmYLBz65an/7CRdWIPy9nj7UON7jQCFz/RdCDfixi88wDaR7
   Q==;
X-CSE-ConnectionGUID: +NH3aZD7SF6O2pbf2K1s/Q==
X-CSE-MsgGUID: Xj6QE5gWQ1OlLyYZ0uz0Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29027285"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="29027285"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:07:31 -0700
X-CSE-ConnectionGUID: 55yzKmf6SWOf2UwMyMWjmw==
X-CSE-MsgGUID: KzzroW4KRGGNUYPlT1XKUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81134523"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2024 14:07:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4RWp-000Ytc-3D;
	Fri, 25 Oct 2024 21:07:27 +0000
Date: Sat, 26 Oct 2024 05:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 2/3] net: dsa: vsc73xx: implement packet
 reception via control interface
Message-ID: <202410260438.P3jDdLQI-lkp@intel.com>
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
In-Reply-To: <20241020205452.2660042-2-paweldembicki@gmail.com>
References: <20241020205452.2660042-2-paweldembicki@gmail.com>
TO: Pawel Dembicki <paweldembicki@gmail.com>
TO: netdev@vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Pawel Dembicki <paweldembicki@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: linux-kernel@vger.kernel.org

Hi Pawel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawel-Dembicki/net-dsa-vsc73xx-implement-packet-reception-via-control-interface/20241021-050041
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241020205452.2660042-2-paweldembicki%40gmail.com
patch subject: [PATCH net-next 2/3] net: dsa: vsc73xx: implement packet reception via control interface
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-r072-20241024 (https://download.01.org/0day-ci/archive/20241026/202410260438.P3jDdLQI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410260438.P3jDdLQI-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/vitesse-vsc73xx-core.c:935 vsc73xx_polled_rcv() error: uninitialized symbol 'len'.

Old smatch warnings:
drivers/net/dsa/vitesse-vsc73xx-core.c:839 vsc73xx_inject_frame() error: uninitialized symbol 'ret'.

vim +/len +935 drivers/net/dsa/vitesse-vsc73xx-core.c

ffd38d14c3235e Pawel Dembicki 2024-10-20  879  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  880  static void vsc73xx_polled_rcv(struct kthread_work *work)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  881  {
2fcbacbba1b072 Pawel Dembicki 2024-10-20  882  	struct vsc73xx *vsc = container_of(work, struct vsc73xx, dwork.work);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  883  	u16 ptr = VSC73XX_CAPT_FRAME_DATA;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  884  	struct dsa_switch *ds = vsc->ds;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  885  	int ret, buf_len, len, part;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  886  	struct vsc73xx_ifh ifh;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  887  	struct net_device *dev;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  888  	struct dsa_port *dp;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  889  	struct sk_buff *skb;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  890  	u32 val, *buf;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  891  	u16 count;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  892  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  893  	ret = vsc73xx_read(vsc, VSC73XX_BLOCK_SYSTEM, 0, VSC73XX_CAPCTRL, &val);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  894  	if (ret)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  895  		goto queue;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  896  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  897  	if (!(val & VSC73XX_CAPCTRL_QUEUE0_READY))
2fcbacbba1b072 Pawel Dembicki 2024-10-20  898  		/* No frame to read */
2fcbacbba1b072 Pawel Dembicki 2024-10-20  899  		goto queue;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  900  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  901  	/* Initialise reading */
2fcbacbba1b072 Pawel Dembicki 2024-10-20  902  	ret = vsc73xx_read(vsc, VSC73XX_BLOCK_CAPTURE, VSC73XX_BLOCK_CAPT_Q0,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  903  			   VSC73XX_CAPT_CAPREADP, &val);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  904  	if (ret)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  905  		goto queue;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  906  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  907  	/* Get internal frame header */
2fcbacbba1b072 Pawel Dembicki 2024-10-20  908  	ret = vsc73xx_read(vsc, VSC73XX_BLOCK_CAPTURE,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  909  			   VSC73XX_BLOCK_CAPT_FRAME0, ptr++, &ifh.datah);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  910  	if (ret)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  911  		goto queue;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  912  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  913  	ret = vsc73xx_read(vsc, VSC73XX_BLOCK_CAPTURE,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  914  			   VSC73XX_BLOCK_CAPT_FRAME0, ptr++, &ifh.datal);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  915  	if (ret)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  916  		goto queue;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  917  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  918  	if (ifh.magic != VSC73XX_IFH_MAGIC) {
2fcbacbba1b072 Pawel Dembicki 2024-10-20  919  		/* Something goes wrong with buffer. Reset capture block */
2fcbacbba1b072 Pawel Dembicki 2024-10-20  920  		vsc73xx_write(vsc, VSC73XX_BLOCK_CAPTURE,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  921  			      VSC73XX_BLOCK_CAPT_RST, VSC73XX_CAPT_CAPRST, 1);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  922  		goto queue;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  923  	}
2fcbacbba1b072 Pawel Dembicki 2024-10-20  924  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  925  	if (!dsa_is_user_port(ds, ifh.port))
2fcbacbba1b072 Pawel Dembicki 2024-10-20  926  		goto release_frame;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  927  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  928  	dp = dsa_to_port(ds, ifh.port);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  929  	dev = dp->user;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  930  	if (!dev)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  931  		goto release_frame;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  932  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  933  	count = (ifh.frame_length + 7 + VSC73XX_IFH_SIZE - ETH_FCS_LEN) >> 2;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  934  
2fcbacbba1b072 Pawel Dembicki 2024-10-20 @935  	skb = netdev_alloc_skb(dev, len);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  936  	if (unlikely(!skb)) {
2fcbacbba1b072 Pawel Dembicki 2024-10-20  937  		netdev_err(dev, "Unable to allocate sk_buff\n");
2fcbacbba1b072 Pawel Dembicki 2024-10-20  938  		goto release_frame;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  939  	}
2fcbacbba1b072 Pawel Dembicki 2024-10-20  940  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  941  	buf_len = ifh.frame_length - ETH_FCS_LEN;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  942  	buf = (u32 *)skb_put(skb, buf_len);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  943  	len = 0;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  944  	part = 0;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  945  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  946  	while (ptr < count) {
2fcbacbba1b072 Pawel Dembicki 2024-10-20  947  		ret = vsc73xx_read(vsc, VSC73XX_BLOCK_CAPTURE,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  948  				   VSC73XX_BLOCK_CAPT_FRAME0 + part, ptr++,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  949  				   buf + len);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  950  		if (ret)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  951  			goto free_skb;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  952  		len++;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  953  		if (ptr > VSC73XX_CAPT_FRAME_DATA_MAX &&
2fcbacbba1b072 Pawel Dembicki 2024-10-20  954  		    count != VSC73XX_CAPT_FRAME_DATA_MAX) {
2fcbacbba1b072 Pawel Dembicki 2024-10-20  955  			ptr = VSC73XX_CAPT_FRAME_DATA;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  956  			part++;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  957  			count -= VSC73XX_CAPT_FRAME_DATA_MAX;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  958  		}
2fcbacbba1b072 Pawel Dembicki 2024-10-20  959  	}
2fcbacbba1b072 Pawel Dembicki 2024-10-20  960  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  961  	/* Get FCS */
2fcbacbba1b072 Pawel Dembicki 2024-10-20  962  	ret = vsc73xx_read(vsc, VSC73XX_BLOCK_CAPTURE,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  963  			   VSC73XX_BLOCK_CAPT_FRAME0, ptr++, &val);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  964  	if (ret)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  965  		goto free_skb;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  966  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  967  	/* Everything we see on an interface that is in the HW bridge
2fcbacbba1b072 Pawel Dembicki 2024-10-20  968  	 * has already been forwarded.
2fcbacbba1b072 Pawel Dembicki 2024-10-20  969  	 */
2fcbacbba1b072 Pawel Dembicki 2024-10-20  970  	if (dp->bridge)
2fcbacbba1b072 Pawel Dembicki 2024-10-20  971  		skb->offload_fwd_mark = 1;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  972  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  973  	skb->protocol = eth_type_trans(skb, dev);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  974  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  975  	netif_rx(skb);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  976  	goto release_frame;
2fcbacbba1b072 Pawel Dembicki 2024-10-20  977  
2fcbacbba1b072 Pawel Dembicki 2024-10-20  978  free_skb:
2fcbacbba1b072 Pawel Dembicki 2024-10-20  979  	kfree_skb(skb);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  980  release_frame:
2fcbacbba1b072 Pawel Dembicki 2024-10-20  981  	/* Release the frame from internal buffer */
2fcbacbba1b072 Pawel Dembicki 2024-10-20  982  	vsc73xx_write(vsc, VSC73XX_BLOCK_CAPTURE, VSC73XX_BLOCK_CAPT_Q0,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  983  		      VSC73XX_CAPT_CAPREADP, 0);
2fcbacbba1b072 Pawel Dembicki 2024-10-20  984  queue:
2fcbacbba1b072 Pawel Dembicki 2024-10-20  985  	kthread_queue_delayed_work(vsc->rcv_worker, &vsc->dwork,
2fcbacbba1b072 Pawel Dembicki 2024-10-20  986  				   msecs_to_jiffies(VSC73XX_RCV_POLL_INTERVAL));
2fcbacbba1b072 Pawel Dembicki 2024-10-20  987  }
2fcbacbba1b072 Pawel Dembicki 2024-10-20  988  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
