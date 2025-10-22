Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F62FF149
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120365; cv=none; b=uGFf/xBGL1GW5EvbTm42Yvcrm2qLSpLiZ75eNRsXmJU5OcX7mbwWub6HHx0ZE9E+kZelyh6QX+MwlVpk8GaA8mar/SaqiqCZLfwaOQAe3tCkge73n2Y/yUrTanUC/74O4ABmpIgCk+2KeeKPMyglIAz+C/UA9IarOtNlz16bN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120365; c=relaxed/simple;
	bh=PN77JdCVjtNp+wz3vMgaof9SXFRi0WaB6b1o8lkepmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oHJdwu92suBaYMvvUZq8ATCw+0LAgjigDErIJlVxjhBH29Xl90kE+tV/bepWpxUzveT5EZX7GtuDd5EhxtAPku9FxKtIGp57bwJdf+ZaQjVCHl4sFDInlyTP5ZMnEdcX+IiM9OxS329h3QBUrSvrD7xAzGfUR+nysY5DOuIQX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPHWsjhq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPHWsjhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761120363; x=1792656363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PN77JdCVjtNp+wz3vMgaof9SXFRi0WaB6b1o8lkepmU=;
  b=BPHWsjhqvUxMVCgnSjN6yEG4GNvReuaLCV6T4hCPn8EODFP2ItTZ2ebe
   o2swev5PDe+eZiXnCikZC0yyO4AmSc1uPYNeP94c/Jzrv05HVNhzHe93G
   D5SgjCbQ2KyN0LgaB9PrkIn0zATBHgfXB5kHp7wUBdt/sUC6bda3KwcVH
   OX2yByQCRiz65vnHGhRxO2imZZ5V4DWlaXodilQATWk7sXSegVAAuG32O
   UHIp8gNsQVA5NzPtzpMaJzVq9CnYYpwPI9ZX8pQaPGaAsi2M0UnzL+n8Q
   CtoPzxkCe//pkhyz7+l7uUEkflWxYjW7JDdEE6vlr/0RjixNk23Rm2HJf
   g==;
X-CSE-ConnectionGUID: mc40OUvAS6aBjCX+LFkZ8g==
X-CSE-MsgGUID: gPiKjtYkSOm+c4ok1ybyrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62469907"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="62469907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:06:01 -0700
X-CSE-ConnectionGUID: Kv4fpEMKQPuTq4ID+eQgUA==
X-CSE-MsgGUID: f6TZMNiDQYaRKsVdug8c9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="214449594"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Oct 2025 01:06:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBTr4-000C8j-0D;
	Wed, 22 Oct 2025 08:05:58 +0000
Date: Wed, 22 Oct 2025 16:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/hda/codecs/side-codecs/hda_component.c:178:49-56: WARNING:
 Consider using %pe to print PTR_ERR()
Message-ID: <202510221520.T7PwYc0W-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Denis Arefev <arefev@swemel.ru>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   552c50713f273b494ac6c77052032a49bc9255e2
commit: 1cf11d80db5df805b538c942269e05a65bcaf5bc ALSA: hda: Fix missing pointer check in hda_component_manager_init function
date:   11 days ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-054-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221520.T7PwYc0W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510221520.T7PwYc0W-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/hda/codecs/side-codecs/hda_component.c:178:49-56: WARNING: Consider using %pe to print PTR_ERR()

vim +178 sound/hda/codecs/side-codecs/hda_component.c

ec6f32bc924d1c0 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-05-08  146  
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  147  int hda_component_manager_init(struct hda_codec *cdc,
960ccf6eafacaa4 sound/pci/hda/hda_component.c                Simon Trimmer      2024-06-17  148  			       struct hda_component_parent *parent, int count,
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  149  			       const char *bus, const char *hid,
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  150  			       const char *match_str,
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  151  			       const struct component_master_ops *ops)
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  152  {
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  153  	struct device *dev = hda_codec_dev(cdc);
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  154  	struct component_match *match = NULL;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  155  	struct hda_scodec_match *sm;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  156  	int ret, i;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  157  
2186fe21e57aada sound/pci/hda/hda_component.c                Simon Trimmer      2024-08-29  158  	if (parent->codec) {
2186fe21e57aada sound/pci/hda/hda_component.c                Simon Trimmer      2024-08-29  159  		codec_err(cdc, "Component binding already created (SSID: %x)\n",
2186fe21e57aada sound/pci/hda/hda_component.c                Simon Trimmer      2024-08-29  160  			  cdc->core.subsystem_id);
2186fe21e57aada sound/pci/hda/hda_component.c                Simon Trimmer      2024-08-29  161  		return -EINVAL;
2186fe21e57aada sound/pci/hda/hda_component.c                Simon Trimmer      2024-08-29  162  	}
2186fe21e57aada sound/pci/hda/hda_component.c                Simon Trimmer      2024-08-29  163  	parent->codec = cdc;
2186fe21e57aada sound/pci/hda/hda_component.c                Simon Trimmer      2024-08-29  164  
28b329f431cef84 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-08-26  165  	mutex_init(&parent->mutex);
28b329f431cef84 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-08-26  166  
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  167  	for (i = 0; i < count; i++) {
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  168  		sm = devm_kmalloc(dev, sizeof(*sm), GFP_KERNEL);
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  169  		if (!sm)
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  170  			return -ENOMEM;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  171  
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  172  		sm->bus = bus;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  173  		sm->hid = hid;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  174  		sm->match_str = match_str;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  175  		sm->index = i;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  176  		component_match_add(dev, &match, hda_comp_match_dev_name, sm);
1cf11d80db5df80 sound/hda/codecs/side-codecs/hda_component.c Denis Arefev       2025-10-09  177  		if (IS_ERR(match)) {
1cf11d80db5df80 sound/hda/codecs/side-codecs/hda_component.c Denis Arefev       2025-10-09 @178  			codec_err(cdc, "Fail to add component %ld\n", PTR_ERR(match));
1cf11d80db5df80 sound/hda/codecs/side-codecs/hda_component.c Denis Arefev       2025-10-09  179  			return PTR_ERR(match);
1cf11d80db5df80 sound/hda/codecs/side-codecs/hda_component.c Denis Arefev       2025-10-09  180  		}
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  181  	}
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  182  
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  183  	ret = component_master_add_with_match(dev, ops, match);
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  184  	if (ret)
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  185  		codec_err(cdc, "Fail to register component aggregator %d\n", ret);
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  186  
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  187  	return ret;
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  188  }
cdd30ebb1b9f361 sound/pci/hda/hda_component.c                Peter Zijlstra     2024-12-02  189  EXPORT_SYMBOL_NS_GPL(hda_component_manager_init, "SND_HDA_SCODEC_COMPONENT");
fd895a74dc1dca3 sound/pci/hda/hda_component.c                Richard Fitzgerald 2024-01-24  190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
