Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED341382398
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777739247; cv=none; b=p1oceB92hwEtysncZrbC3TtT7HGmBksnFP3L4JnS1/wv0HEOMyYCy7rJcwQgu8/3G45XZAaVe05aNsdrXTAm2275brAePydHH/UwDIXQiR8edds8Sh58k9Gh/8XKFutzb3iRB6vZc4yLFVpsen9RxahndnKvtyZR9shxU43CbrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777739247; c=relaxed/simple;
	bh=l6V5UfU59znxD9iuAg75d3dz6onR7iQG3gB/IWlxnkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIa0koMzuc+mx6weWH3Vr74BgVmxCjtacHxVjPQNM7tmXf/sfNCzG7VfVVNu1oOtjXUhEwwrl0GdfY5NUV3rdmGH/rP6KWkcj3mDJu3sQoJik7SKlwQej0YvHkSJP7AybG18TJeX2Igyxtm8GqztmI/vMWefV+OYqAwAhZeNheM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hftEoomZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hftEoomZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777739245; x=1809275245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l6V5UfU59znxD9iuAg75d3dz6onR7iQG3gB/IWlxnkk=;
  b=hftEoomZGbOZ5ELw26aOOVmjnONaI8wnudWtsLgNe/pLmiDiBnXnx8jn
   dkV4/l1qLNLIfaMsq/VWpFSbcKA93BRCcE/aCCqpWgUArzNcqPxLC4plV
   qh1Sq7Q6yWFF9RoiIElR3kgEkQjhNQL/LzQyragrKrFzNphIqyiyL7rsR
   vM/eELoRDA+cfyYL744F1Xe7VOVtEs2lSfbd4LYI6I1csT1EsYUvtlSyk
   oHwXIOvwXZmG7bnT6q58brgBcOcfXwHShESwKFUvBYhatrue817MhfUtZ
   YuLt+xdx355rXVIZLVs5XlrTb1SAXWxDmUl0k5cuwSDW8qVcwBe2skn0w
   w==;
X-CSE-ConnectionGUID: fMHYMfsSSPS/PhGx4aYvwA==
X-CSE-MsgGUID: kNa9QkZnRgqm3wJF5RCa1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78696054"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="78696054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 09:27:23 -0700
X-CSE-ConnectionGUID: EmJGDs2vTUqtAE9i8wc33A==
X-CSE-MsgGUID: YkGm6JnfQ7qbjFR1iLR4kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="236903916"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 May 2026 09:27:22 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJDBX-000000001ZR-3Ags;
	Sat, 02 May 2026 16:27:19 +0000
Date: Sun, 3 May 2026 00:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260421135027.357622-3-tristmd@gmail.com>
References: <20260421135027.357622-3-tristmd@gmail.com>
TO: Tristan Madani <tristmd@gmail.com>
TO: Johannes Berg <johannes@sipsolutions.net>
CC: libertas-dev@lists.infradead.org
CC: linux-wireless@vger.kernel.org
CC: Tristan Madani <tristan@talencesecurity.com>

Hi Tristan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tristan-Madani/wifi-libertas-fix-OOB-read-from-firmware-pkt_ptr-offset-in-RX-path/20260423-061353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260421135027.357622-3-tristmd%40gmail.com
patch subject: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware bssdescriptsize in scan response
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
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

876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   45  
69f9032d9dfeb7 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-11-23   46  static int process_rxed_802_11_packet(struct lbs_private *priv,
69f9032d9dfeb7 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-11-23   47  	struct sk_buff *skb);
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   48  
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   49  /**
8973a6e770fc89 drivers/net/wireless/libertas/rx.c         Randy Dunlap              2011-04-26   50   * lbs_process_rxed_packet - processes received packet and forwards it
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   51   * to kernel/upper layer
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   52   *
8973a6e770fc89 drivers/net/wireless/libertas/rx.c         Randy Dunlap              2011-04-26   53   * @priv:	A pointer to &struct lbs_private
8973a6e770fc89 drivers/net/wireless/libertas/rx.c         Randy Dunlap              2011-04-26   54   * @skb:	A pointer to skb which includes the received packet
8973a6e770fc89 drivers/net/wireless/libertas/rx.c         Randy Dunlap              2011-04-26   55   * returns:	0 or -1
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10   56   */
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
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21   76  
695347d07c2b05 drivers/net/wireless/marvell/libertas/rx.c Tristan Madani            2026-04-21  @77  	if (le32_to_cpu(p_rx_pd->pkt_ptr) + sizeof(struct rxpackethdr) >
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
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  106  		sizeof(p_rx_pkt->eth803_hdr.dest_addr));
ece56191932623 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-08-02  107  	lbs_deb_hex(LBS_DEB_RX, "RX Data: Src", p_rx_pkt->eth803_hdr.src_addr,
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  108  		sizeof(p_rx_pkt->eth803_hdr.src_addr));
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  109  
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  110  	if (memcmp(&p_rx_pkt->rfc1042_hdr,
729ef6b614a140 drivers/net/wireless/marvell/libertas/rx.c Pascal Terjan             2020-05-23  111  		   rfc1042_header, sizeof(rfc1042_header)) == 0) {
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  112  		/*
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  113  		 *  Replace the 803 header and rfc1042 header (llc/snap) with an
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  114  		 *    EthernetII header, keep the src/dst and snap_type (ethertype)
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  115  		 *
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  116  		 *  The firmware only passes up SNAP frames converting
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  117  		 *    all RX Data from 802.11 to 802.2/LLC/SNAP frames.
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  118  		 *
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  119  		 *  To create the Ethernet II, just move the src, dst address right
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  120  		 *    before the snap_type.
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  121  		 */
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  122  		p_ethhdr = (struct ethhdr *)
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  123  		    ((u8 *) &p_rx_pkt->eth803_hdr
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  124  		     + sizeof(p_rx_pkt->eth803_hdr) + sizeof(p_rx_pkt->rfc1042_hdr)
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  125  		     - sizeof(p_rx_pkt->eth803_hdr.dest_addr)
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  126  		     - sizeof(p_rx_pkt->eth803_hdr.src_addr)
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  127  		     - sizeof(p_rx_pkt->rfc1042_hdr.snap_type));
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  128  
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  129  		memcpy(p_ethhdr->h_source, p_rx_pkt->eth803_hdr.src_addr,
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  130  		       sizeof(p_ethhdr->h_source));
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  131  		memcpy(p_ethhdr->h_dest, p_rx_pkt->eth803_hdr.dest_addr,
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  132  		       sizeof(p_ethhdr->h_dest));
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  133  
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  134  		/* Chop off the rxpd + the excess memory from the 802.2/llc/snap header
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  135  		 *   that was removed
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  136  		 */
e45d8e534b6758 drivers/net/wireless/libertas/rx.c         Bing Zhao                 2009-04-06  137  		hdrchop = (u8 *)p_ethhdr - (u8 *)p_rx_pd;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  138  	} else {
ece56191932623 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-08-02  139  		lbs_deb_hex(LBS_DEB_RX, "RX Data: LLC/SNAP",
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  140  			(u8 *) &p_rx_pkt->rfc1042_hdr,
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  141  			sizeof(p_rx_pkt->rfc1042_hdr));
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  142  
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  143  		/* Chop off the rxpd */
e45d8e534b6758 drivers/net/wireless/libertas/rx.c         Bing Zhao                 2009-04-06  144  		hdrchop = (u8 *)&p_rx_pkt->eth803_hdr - (u8 *)p_rx_pd;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  145  	}
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  146  
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  147  	/* Chop off the leading header bytes so the skb points to the start of
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  148  	 *   either the reconstructed EthII frame or the 802.2/llc/snap frame
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  149  	 */
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  150  	skb_pull(skb, hdrchop);
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  151  
aa21c004f80bdf drivers/net/wireless/libertas/rx.c         David Woodhouse           2007-12-08  152  	priv->cur_rate = lbs_fw_index_to_data_rate(p_rx_pd->rx_rate);
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  153  
9012b28a407511 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-05-25  154  	lbs_deb_rx("rx data: size of actual packet %d\n", skb->len);
bbfc6b788f63f0 drivers/net/wireless/libertas/rx.c         Stephen Hemminger         2009-03-20  155  	dev->stats.rx_bytes += skb->len;
bbfc6b788f63f0 drivers/net/wireless/libertas/rx.c         Stephen Hemminger         2009-03-20  156  	dev->stats.rx_packets++;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  157  
6f93a8e7e41c2d drivers/net/wireless/libertas/rx.c         David Woodhouse           2007-12-10  158  	skb->protocol = eth_type_trans(skb, dev);
afb6d39f329248 drivers/net/wireless/marvell/libertas/rx.c Sebastian Andrzej Siewior 2022-03-05  159  	netif_rx(skb);
3d4bd24b019981 drivers/net/wireless/libertas/rx.c         Florin Malita             2007-05-18  160  
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  161  	ret = 0;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  162  done:
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  163  	return ret;
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  164  }
1007832103d016 drivers/net/wireless/libertas/rx.c         Holger Schurig            2007-11-15  165  EXPORT_SYMBOL_GPL(lbs_process_rxed_packet);
876c9d3aeb989c drivers/net/wireless/libertas/rx.c         Marcelo Tosatti           2007-02-10  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
