Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7242A839F4
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727939903; cv=none; b=R5VXgeiDbR3/zYC7/5Gw14jt78wnW58IGRa40MBmkUZlAXKI4Uvy01gwcYNyDsHfprlLS2wr8KOVTHM2xWbOgXrJBohxcwfD7jZFZU9YWqYPP5n8R4MPCZpeK5iMH4DnJLAtFx+rB5XNwQVxENtfEDtrKyCTRen2nz/J/k8eQu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727939903; c=relaxed/simple;
	bh=PPESWzgUQO2csTC2267VaKLqmrVtVqYLw6HHfX2RGo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dzneCEsoVZ18LxUHpQRAWuBMcTsQ1/MYIw1ibMISqsyZzxqRvkEi0mTNnk999qxrqEWabDJeRD7NYUWcd40lEl9/RYwu9Wrkt0Sd5UzPg1QiRVWkhXux/+E/sQgdr6IfvlwEcExkfNchFk5iBMFzDMbCPwRNlb4p9ed+Tz/Xmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+TXKGVA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+TXKGVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727939901; x=1759475901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPESWzgUQO2csTC2267VaKLqmrVtVqYLw6HHfX2RGo4=;
  b=h+TXKGVA6MZ+UShsFEKYCedpU9Ht8GoJ0/FXnDUV2CL5hwrVOhfS9aV8
   AB9DlURQgYiPoeANbYqiEyVB2b2eI3z+TPKlqWqoXDTtnJPfVYhUQlBMv
   WN0S/61In6ekMpEb31JDsei2jjkPBOfwBHwCRrf7uS5a+iOeOM1Vf4GJg
   41Vm3ZqjaKeGPHkXIVGa72T3+8Wo1e01WZLVkoxvMv95O8OF5SQURvrSH
   9W11ysDZBVRP1ld7ntpFXQT6X6PXZJQvNwW51+SziX0jaf3im5rwcck7s
   tzrS9K3pyO81eWFgGmNUXHbDkvM0TLnBRSAkYQGGMrWejxPWjgI2cSJzm
   g==;
X-CSE-ConnectionGUID: KLK1JdkiQgivUG2gUBXMdg==
X-CSE-MsgGUID: me6td7cnQxKbv25BlKd/xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27216029"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="27216029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 00:18:20 -0700
X-CSE-ConnectionGUID: XGmQnAqATyma2xWaSv9rVg==
X-CSE-MsgGUID: bW8VHYWnSWC5acv319sadg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="73935626"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2024 00:18:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swG6L-00009s-1F;
	Thu, 03 Oct 2024 07:18:17 +0000
Date: Thu, 3 Oct 2024 15:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:sound-error-cleanup-2024-09-30 66/71]
 sound/soc/soc-core.c:1700 soc_probe_link_dais() error: uninitialized symbol
 'ret'.
Message-ID: <202410031521.0QHV4cQH-lkp@intel.com>
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

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-30
head:   b31c07e66a585a36ee2d6795e3dbbb4cbabab338
commit: 6eadb23415b5fbf9fd6a1529e465c88f6bddc889 [66/71] ASoC: error message cleanup (soc-core.c)
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031521.0QHV4cQH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410031521.0QHV4cQH-lkp@intel.com/

smatch warnings:
sound/soc/soc-core.c:1700 soc_probe_link_dais() error: uninitialized symbol 'ret'.
sound/soc/soc-core.c:1740 soc_probe_link_components() error: uninitialized symbol 'ret'.
sound/soc/soc-core.c:1791 soc_probe_aux_devices() error: uninitialized symbol 'ret'.

vim +/ret +1700 sound/soc/soc-core.c

db2a416556af03 Frank Mandarino    2006-10-06  1685  
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1686  static int soc_probe_link_dais(struct snd_soc_card *card)
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1687  {
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1688  	struct snd_soc_pcm_runtime *rtd;
51801aeafdc9c1 Kuninori Morimoto  2020-04-24  1689  	int order, ret;
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1690  
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1691  	for_each_comp_order(order) {
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1692  		for_each_card_rtds(card, rtd) {
51801aeafdc9c1 Kuninori Morimoto  2020-04-24  1693  			/* probe all rtd connected DAIs in good order */
51801aeafdc9c1 Kuninori Morimoto  2020-04-24  1694  			ret = snd_soc_pcm_dai_probe(rtd, order);
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1695  			if (ret)
6eadb23415b5fb Kuninori Morimoto  2024-09-11  1696  				goto out;
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1697  		}
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1698  	}
6eadb23415b5fb Kuninori Morimoto  2024-09-11  1699  out:
6eadb23415b5fb Kuninori Morimoto  2024-09-11 @1700  	return soc_core_ret(card->dev, ret);
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1701  }
bc7c16c226a919 Kuninori Morimoto  2019-09-04  1702  
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1703  static void soc_remove_link_components(struct snd_soc_card *card)
62ae68fa5d6d6f Stephen Warren     2012-06-08  1704  {
61aca5646b736a Lars-Peter Clausen 2014-08-19  1705  	struct snd_soc_component *component;
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1706  	struct snd_soc_pcm_runtime *rtd;
613fb50059cf19 Kuninori Morimoto  2020-01-10  1707  	int i, order;
62ae68fa5d6d6f Stephen Warren     2012-06-08  1708  
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1709  	for_each_comp_order(order) {
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1710  		for_each_card_rtds(card, rtd) {
613fb50059cf19 Kuninori Morimoto  2020-01-10  1711  			for_each_rtd_components(rtd, i, component) {
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1712  				if (component->driver->remove_order != order)
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1713  					continue;
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1714  
c6619b729814c8 Kuninori Morimoto  2019-11-06  1715  				soc_remove_component(component, 1);
62ae68fa5d6d6f Stephen Warren     2012-06-08  1716  			}
62ae68fa5d6d6f Stephen Warren     2012-06-08  1717  		}
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1718  	}
b006c0c6ed0dc7 Kuninori Morimoto  2019-09-04  1719  }
62ae68fa5d6d6f Stephen Warren     2012-06-08  1720  
62f07a6b6dbaf0 Kuninori Morimoto  2019-09-04  1721  static int soc_probe_link_components(struct snd_soc_card *card)
6fb035502956ad Kuninori Morimoto  2019-08-23  1722  {
6fb035502956ad Kuninori Morimoto  2019-08-23  1723  	struct snd_soc_component *component;
62f07a6b6dbaf0 Kuninori Morimoto  2019-09-04  1724  	struct snd_soc_pcm_runtime *rtd;
613fb50059cf19 Kuninori Morimoto  2020-01-10  1725  	int i, ret, order;
6fb035502956ad Kuninori Morimoto  2019-08-23  1726  
62f07a6b6dbaf0 Kuninori Morimoto  2019-09-04  1727  	for_each_comp_order(order) {
62f07a6b6dbaf0 Kuninori Morimoto  2019-09-04  1728  		for_each_card_rtds(card, rtd) {
613fb50059cf19 Kuninori Morimoto  2020-01-10  1729  			for_each_rtd_components(rtd, i, component) {
62f07a6b6dbaf0 Kuninori Morimoto  2019-09-04  1730  				if (component->driver->probe_order != order)
62f07a6b6dbaf0 Kuninori Morimoto  2019-09-04  1731  					continue;
62f07a6b6dbaf0 Kuninori Morimoto  2019-09-04  1732  
6fb035502956ad Kuninori Morimoto  2019-08-23  1733  				ret = soc_probe_component(card, component);
6fb035502956ad Kuninori Morimoto  2019-08-23  1734  				if (ret < 0)
6eadb23415b5fb Kuninori Morimoto  2024-09-11  1735  					goto out;
6fb035502956ad Kuninori Morimoto  2019-08-23  1736  			}
6fb035502956ad Kuninori Morimoto  2019-08-23  1737  		}
62f07a6b6dbaf0 Kuninori Morimoto  2019-09-04  1738  	}
6eadb23415b5fb Kuninori Morimoto  2024-09-11  1739  out:
6eadb23415b5fb Kuninori Morimoto  2024-09-11 @1740  	return soc_core_ret(card->dev, ret);
6fb035502956ad Kuninori Morimoto  2019-08-23  1741  }
6fb035502956ad Kuninori Morimoto  2019-08-23  1742  
e8fbd250524246 Kuninori Morimoto  2019-09-04  1743  static void soc_unbind_aux_dev(struct snd_soc_card *card)
4893a2eb34a972 Kuninori Morimoto  2019-09-04  1744  {
e8fbd250524246 Kuninori Morimoto  2019-09-04  1745  	struct snd_soc_component *component, *_component;
e8fbd250524246 Kuninori Morimoto  2019-09-04  1746  
e8fbd250524246 Kuninori Morimoto  2019-09-04  1747  	for_each_card_auxs_safe(card, component, _component) {
257c4dac8b7877 Kuninori Morimoto  2020-06-04  1748  		/* for snd_soc_component_init() */
257c4dac8b7877 Kuninori Morimoto  2020-06-04  1749  		snd_soc_component_set_aux(component, NULL);
4893a2eb34a972 Kuninori Morimoto  2019-09-04  1750  		list_del(&component->card_aux_list);
4893a2eb34a972 Kuninori Morimoto  2019-09-04  1751  	}
e8fbd250524246 Kuninori Morimoto  2019-09-04  1752  }
4893a2eb34a972 Kuninori Morimoto  2019-09-04  1753  
bee886f1ea9d9e Kuninori Morimoto  2019-09-04  1754  static int soc_bind_aux_dev(struct snd_soc_card *card)
3ca041ed04734c Sebastian Reichel  2014-04-28  1755  {
f2ed6b07645ed2 Mengdong Lin       2016-01-06  1756  	struct snd_soc_component *component;
bee886f1ea9d9e Kuninori Morimoto  2019-09-04  1757  	struct snd_soc_aux_dev *aux;
bee886f1ea9d9e Kuninori Morimoto  2019-09-04  1758  	int i;
f2ed6b07645ed2 Mengdong Lin       2016-01-06  1759  
bee886f1ea9d9e Kuninori Morimoto  2019-09-04  1760  	for_each_card_pre_auxs(card, i, aux) {
f2ed6b07645ed2 Mengdong Lin       2016-01-06  1761  		/* codecs, usually analog devices */
bee886f1ea9d9e Kuninori Morimoto  2019-09-04  1762  		component = soc_find_component(&aux->dlc);
f2ed6b07645ed2 Mengdong Lin       2016-01-06  1763  		if (!component)
3dc29b8b206207 Kuninori Morimoto  2019-08-08  1764  			return -EPROBE_DEFER;
3ca041ed04734c Sebastian Reichel  2014-04-28  1765  
257c4dac8b7877 Kuninori Morimoto  2020-06-04  1766  		/* for snd_soc_component_init() */
257c4dac8b7877 Kuninori Morimoto  2020-06-04  1767  		snd_soc_component_set_aux(component, aux);
c2b71c71037bea Kuninori Morimoto  2019-08-08  1768  		/* see for_each_card_auxs */
d2e3a1358c37cd Sylwester Nawrocki 2016-12-29  1769  		list_add(&component->card_aux_list, &card->aux_comp_list);
bee886f1ea9d9e Kuninori Morimoto  2019-09-04  1770  	}
f2ed6b07645ed2 Mengdong Lin       2016-01-06  1771  	return 0;
b19e6e7b763c71 Mark Brown         2012-03-14  1772  }
b19e6e7b763c71 Mark Brown         2012-03-14  1773  
f2ed6b07645ed2 Mengdong Lin       2016-01-06  1774  static int soc_probe_aux_devices(struct snd_soc_card *card)
2eea392d0a28a0 Jarkko Nikula      2010-11-25  1775  {
74bd3f92d0d173 Kuninori Morimoto  2019-11-06  1776  	struct snd_soc_component *component;
f2ed6b07645ed2 Mengdong Lin       2016-01-06  1777  	int order;
44c69bb13905c3 Lars-Peter Clausen 2014-07-01  1778  	int ret;
3ca041ed04734c Sebastian Reichel  2014-04-28  1779  
1a1035a9854fd8 Kuninori Morimoto  2018-09-18  1780  	for_each_comp_order(order) {
74bd3f92d0d173 Kuninori Morimoto  2019-11-06  1781  		for_each_card_auxs(card, component) {
74bd3f92d0d173 Kuninori Morimoto  2019-11-06  1782  			if (component->driver->probe_order != order)
74bd3f92d0d173 Kuninori Morimoto  2019-11-06  1783  				continue;
74bd3f92d0d173 Kuninori Morimoto  2019-11-06  1784  
74bd3f92d0d173 Kuninori Morimoto  2019-11-06  1785  			ret = soc_probe_component(card,	component);
74bd3f92d0d173 Kuninori Morimoto  2019-11-06  1786  			if (ret < 0)
6eadb23415b5fb Kuninori Morimoto  2024-09-11  1787  				goto out;
2eea392d0a28a0 Jarkko Nikula      2010-11-25  1788  		}
5f3484ac8775a1 Lars-Peter Clausen 2014-07-01  1789  	}
6eadb23415b5fb Kuninori Morimoto  2024-09-11  1790  out:
6eadb23415b5fb Kuninori Morimoto  2024-09-11 @1791  	return soc_core_ret(card->dev, ret);
2eea392d0a28a0 Jarkko Nikula      2010-11-25  1792  }
2eea392d0a28a0 Jarkko Nikula      2010-11-25  1793  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
