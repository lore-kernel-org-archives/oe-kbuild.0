Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656BA231C8E
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850194; cv=none; b=KpMCB2I5alS+wFVQmfS21o+5RHBidhipm2GiAp7ki0tAIbsN4SlH0CmrZczAQb7IVR29jg1Zqg99NKgg85Vz4hwKjdqCIFE8TiePTUCMBf7A2yjGxgcgqeBbx98920NDi10KUDaL9U9gYkxGlv3fhgBr2q+5jwV6t8vXj7mxgcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850194; c=relaxed/simple;
	bh=jBiWTTuzBQuw7gIDuRVewp+lTDCHRHocsrDqPRnwp5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X9BxGG0vF06km93/kY26KqxRebDFtKVEwN4dH6bf1K1qjFXBOZh+TeDHaeR4qQtBqXLM3ymcVYD9/vf4iSDVciotlPTWZR7JLvPt8273ZSPzHxsdVaAuRBAg97DXYlLNOZIhPFKnK7hKEeZ7FXM/50JwW2u1r2Ool4iPMxEua2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8NJE4oP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8NJE4oP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733850193; x=1765386193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBiWTTuzBQuw7gIDuRVewp+lTDCHRHocsrDqPRnwp5A=;
  b=h8NJE4oPPlrbpBvO9bLVaZUEenQCVIsVP3O+JA4eeYYKWFQ31Gfv843u
   S/BdAVhHb8SX31SCrgD422nC6RTR35NUuSJElctwFVvg2jAWbb9pjMgGP
   L1RjmS9xMGiVTdQsVP9VIGytg0e9OV4yBrVWOabLLApCD2a/5fwAxVTiy
   M9vk/buT/IwJYBy2lqXX3uw66UCvjwXQ79tcqInUpCDiDRmiSm3MOAcNG
   p05ob4QXZwGzti9/Twa4usPjZNdlgudbVsiJfL3ZVrfXx2Hemzr25eYRm
   NaB0ffixT5x7HqW2nOw+wxd554KUvh6vGJEuL8n0xpA0zK8NoDjMfKkar
   Q==;
X-CSE-ConnectionGUID: +VuUkKJzQbyeYLXrvc6JDA==
X-CSE-MsgGUID: 765b6u35T7m6ugZcrpBp3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34342910"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="34342910"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 09:03:10 -0800
X-CSE-ConnectionGUID: 8FsO+PIDTNK8UdelH5Oqxg==
X-CSE-MsgGUID: ef5DqSSXRr2vHoxTdLy4Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="118711408"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2024 09:03:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL3da-0005nL-0j;
	Tue, 10 Dec 2024 17:03:06 +0000
Date: Wed, 11 Dec 2024 01:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:sound-cleanup-2024-12-09 63/87] sound/soc/soc-core.c:1700
 soc_probe_link_dais() error: uninitialized symbol 'ret'.
Message-ID: <202412110005.iYStxTQf-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-cleanup-2024-12-09
head:   18d277e267bf721d83e62a283441379714e586c2
commit: 805c1eed74ef69f191e66ee9a16ded8c1a38222d [63/87] ASoC: error message cleanup (soc-core.c)
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: sparc64-randconfig-r072-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110005.iYStxTQf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412110005.iYStxTQf-lkp@intel.com/

smatch warnings:
sound/soc/soc-core.c:1700 soc_probe_link_dais() error: uninitialized symbol 'ret'.
sound/soc/soc-core.c:1740 soc_probe_link_components() error: uninitialized symbol 'ret'.
sound/soc/soc-core.c:1791 soc_probe_aux_devices() error: uninitialized symbol 'ret'.

vim +/ret +1700 sound/soc/soc-core.c

db2a416556af031 Frank Mandarino    2006-10-06  1685  
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1686  static int soc_probe_link_dais(struct snd_soc_card *card)
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1687  {
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1688  	struct snd_soc_pcm_runtime *rtd;
51801aeafdc9c1d Kuninori Morimoto  2020-04-24  1689  	int order, ret;
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1690  
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1691  	for_each_comp_order(order) {
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1692  		for_each_card_rtds(card, rtd) {
51801aeafdc9c1d Kuninori Morimoto  2020-04-24  1693  			/* probe all rtd connected DAIs in good order */
51801aeafdc9c1d Kuninori Morimoto  2020-04-24  1694  			ret = snd_soc_pcm_dai_probe(rtd, order);
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1695  			if (ret)
805c1eed74ef69f Kuninori Morimoto  2024-09-11  1696  				goto out;
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1697  		}
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1698  	}
805c1eed74ef69f Kuninori Morimoto  2024-09-11  1699  out:
805c1eed74ef69f Kuninori Morimoto  2024-09-11 @1700  	return soc_core_ret(card->dev, ret);
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1701  }
bc7c16c226a919a Kuninori Morimoto  2019-09-04  1702  
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1703  static void soc_remove_link_components(struct snd_soc_card *card)
62ae68fa5d6d6f9 Stephen Warren     2012-06-08  1704  {
61aca5646b736a7 Lars-Peter Clausen 2014-08-19  1705  	struct snd_soc_component *component;
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1706  	struct snd_soc_pcm_runtime *rtd;
613fb50059cf19a Kuninori Morimoto  2020-01-10  1707  	int i, order;
62ae68fa5d6d6f9 Stephen Warren     2012-06-08  1708  
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1709  	for_each_comp_order(order) {
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1710  		for_each_card_rtds(card, rtd) {
613fb50059cf19a Kuninori Morimoto  2020-01-10  1711  			for_each_rtd_components(rtd, i, component) {
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1712  				if (component->driver->remove_order != order)
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1713  					continue;
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1714  
c6619b729814c85 Kuninori Morimoto  2019-11-06  1715  				soc_remove_component(component, 1);
62ae68fa5d6d6f9 Stephen Warren     2012-06-08  1716  			}
62ae68fa5d6d6f9 Stephen Warren     2012-06-08  1717  		}
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1718  	}
b006c0c6ed0dc77 Kuninori Morimoto  2019-09-04  1719  }
62ae68fa5d6d6f9 Stephen Warren     2012-06-08  1720  
62f07a6b6dbaf0e Kuninori Morimoto  2019-09-04  1721  static int soc_probe_link_components(struct snd_soc_card *card)
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1722  {
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1723  	struct snd_soc_component *component;
62f07a6b6dbaf0e Kuninori Morimoto  2019-09-04  1724  	struct snd_soc_pcm_runtime *rtd;
613fb50059cf19a Kuninori Morimoto  2020-01-10  1725  	int i, ret, order;
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1726  
62f07a6b6dbaf0e Kuninori Morimoto  2019-09-04  1727  	for_each_comp_order(order) {
62f07a6b6dbaf0e Kuninori Morimoto  2019-09-04  1728  		for_each_card_rtds(card, rtd) {
613fb50059cf19a Kuninori Morimoto  2020-01-10  1729  			for_each_rtd_components(rtd, i, component) {
62f07a6b6dbaf0e Kuninori Morimoto  2019-09-04  1730  				if (component->driver->probe_order != order)
62f07a6b6dbaf0e Kuninori Morimoto  2019-09-04  1731  					continue;
62f07a6b6dbaf0e Kuninori Morimoto  2019-09-04  1732  
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1733  				ret = soc_probe_component(card, component);
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1734  				if (ret < 0)
805c1eed74ef69f Kuninori Morimoto  2024-09-11  1735  					goto out;
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1736  			}
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1737  		}
62f07a6b6dbaf0e Kuninori Morimoto  2019-09-04  1738  	}
805c1eed74ef69f Kuninori Morimoto  2024-09-11  1739  out:
805c1eed74ef69f Kuninori Morimoto  2024-09-11 @1740  	return soc_core_ret(card->dev, ret);
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1741  }
6fb035502956ad1 Kuninori Morimoto  2019-08-23  1742  
e8fbd2505242467 Kuninori Morimoto  2019-09-04  1743  static void soc_unbind_aux_dev(struct snd_soc_card *card)
4893a2eb34a9722 Kuninori Morimoto  2019-09-04  1744  {
e8fbd2505242467 Kuninori Morimoto  2019-09-04  1745  	struct snd_soc_component *component, *_component;
e8fbd2505242467 Kuninori Morimoto  2019-09-04  1746  
e8fbd2505242467 Kuninori Morimoto  2019-09-04  1747  	for_each_card_auxs_safe(card, component, _component) {
257c4dac8b7877c Kuninori Morimoto  2020-06-04  1748  		/* for snd_soc_component_init() */
257c4dac8b7877c Kuninori Morimoto  2020-06-04  1749  		snd_soc_component_set_aux(component, NULL);
4893a2eb34a9722 Kuninori Morimoto  2019-09-04  1750  		list_del(&component->card_aux_list);
4893a2eb34a9722 Kuninori Morimoto  2019-09-04  1751  	}
e8fbd2505242467 Kuninori Morimoto  2019-09-04  1752  }
4893a2eb34a9722 Kuninori Morimoto  2019-09-04  1753  
bee886f1ea9d9e5 Kuninori Morimoto  2019-09-04  1754  static int soc_bind_aux_dev(struct snd_soc_card *card)
3ca041ed04734c1 Sebastian Reichel  2014-04-28  1755  {
f2ed6b07645ed29 Mengdong Lin       2016-01-06  1756  	struct snd_soc_component *component;
bee886f1ea9d9e5 Kuninori Morimoto  2019-09-04  1757  	struct snd_soc_aux_dev *aux;
bee886f1ea9d9e5 Kuninori Morimoto  2019-09-04  1758  	int i;
f2ed6b07645ed29 Mengdong Lin       2016-01-06  1759  
bee886f1ea9d9e5 Kuninori Morimoto  2019-09-04  1760  	for_each_card_pre_auxs(card, i, aux) {
f2ed6b07645ed29 Mengdong Lin       2016-01-06  1761  		/* codecs, usually analog devices */
bee886f1ea9d9e5 Kuninori Morimoto  2019-09-04  1762  		component = soc_find_component(&aux->dlc);
f2ed6b07645ed29 Mengdong Lin       2016-01-06  1763  		if (!component)
3dc29b8b2062075 Kuninori Morimoto  2019-08-08  1764  			return -EPROBE_DEFER;
3ca041ed04734c1 Sebastian Reichel  2014-04-28  1765  
257c4dac8b7877c Kuninori Morimoto  2020-06-04  1766  		/* for snd_soc_component_init() */
257c4dac8b7877c Kuninori Morimoto  2020-06-04  1767  		snd_soc_component_set_aux(component, aux);
c2b71c71037bea7 Kuninori Morimoto  2019-08-08  1768  		/* see for_each_card_auxs */
d2e3a1358c37cd8 Sylwester Nawrocki 2016-12-29  1769  		list_add(&component->card_aux_list, &card->aux_comp_list);
bee886f1ea9d9e5 Kuninori Morimoto  2019-09-04  1770  	}
f2ed6b07645ed29 Mengdong Lin       2016-01-06  1771  	return 0;
b19e6e7b763c714 Mark Brown         2012-03-14  1772  }
b19e6e7b763c714 Mark Brown         2012-03-14  1773  
f2ed6b07645ed29 Mengdong Lin       2016-01-06  1774  static int soc_probe_aux_devices(struct snd_soc_card *card)
2eea392d0a28a0a Jarkko Nikula      2010-11-25  1775  {
74bd3f92d0d173f Kuninori Morimoto  2019-11-06  1776  	struct snd_soc_component *component;
f2ed6b07645ed29 Mengdong Lin       2016-01-06  1777  	int order;
44c69bb13905c3b Lars-Peter Clausen 2014-07-01  1778  	int ret;
3ca041ed04734c1 Sebastian Reichel  2014-04-28  1779  
1a1035a9854fd89 Kuninori Morimoto  2018-09-18  1780  	for_each_comp_order(order) {
74bd3f92d0d173f Kuninori Morimoto  2019-11-06  1781  		for_each_card_auxs(card, component) {
74bd3f92d0d173f Kuninori Morimoto  2019-11-06  1782  			if (component->driver->probe_order != order)
74bd3f92d0d173f Kuninori Morimoto  2019-11-06  1783  				continue;
74bd3f92d0d173f Kuninori Morimoto  2019-11-06  1784  
74bd3f92d0d173f Kuninori Morimoto  2019-11-06  1785  			ret = soc_probe_component(card,	component);
74bd3f92d0d173f Kuninori Morimoto  2019-11-06  1786  			if (ret < 0)
805c1eed74ef69f Kuninori Morimoto  2024-09-11  1787  				goto out;
2eea392d0a28a0a Jarkko Nikula      2010-11-25  1788  		}
5f3484ac8775a18 Lars-Peter Clausen 2014-07-01  1789  	}
805c1eed74ef69f Kuninori Morimoto  2024-09-11  1790  out:
805c1eed74ef69f Kuninori Morimoto  2024-09-11 @1791  	return soc_core_ret(card->dev, ret);
2eea392d0a28a0a Jarkko Nikula      2010-11-25  1792  }
2eea392d0a28a0a Jarkko Nikula      2010-11-25  1793  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
