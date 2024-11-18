Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADE91A00F8
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 16:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731948788; cv=none; b=LqiA2iCHIsSC+LVg5ayCiwVtWOkkAZKvTX22qwE68pTgNpYk2SuSfTezS0DoX4zpLz8khKpoid2UzGFTG+CRji45f2I/PWNM1p8rWjn9qGSoqtUV73MYBxec/EuwBWekuE1uoS/+uuUiNmd2BZPV1J39hku2yZi4nJs/l4UP994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731948788; c=relaxed/simple;
	bh=uRHxYlE1bEa4Pqks36SFoA8XbsYTXJ7l92KclSww/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gjj0y+znrYoD4NyMjXSRv5Y2SB5t7GxNNJ4Y3VIKSVx6qtK8jQxGEn8hYqLdnRQQQVi0cWMSXXFeJ06/OCBZY6t9fwqY9ToqiGuF1kpdEJyqpWqI8MeVrsKD+4dAiJMdAP5Dhr34EUPtiMUNYgAk0IrB7vTP25iY3m4fwJwNH18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYKEJLOH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYKEJLOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731948786; x=1763484786;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uRHxYlE1bEa4Pqks36SFoA8XbsYTXJ7l92KclSww/Z4=;
  b=BYKEJLOH518wmXKNxPTeKobR6OwFfzhRjzK7XOPN0IPwUFO2ny4TlROd
   aaoyn13pkUO7O6pyMS9fV2Qv47rqt8osodETxSvzy5a+Bfp5fV78Fmgl4
   snojEGLvntxt+wKtcaNTk+CghWacThVF8g6mUq9K/0M2hTyoJz9PmFtnW
   YS6z2QqvXtXWz6GFFVagXTsKmbBTvevJWSRJ80gu7SIthogw4RKy0JyP+
   Lm3Bo010kOsP97YqLrlhMZqK+sIiFip+CFIT3vtMYv4X7TnPHTOCdtwV2
   6Lz7llhFgXSpOAhKmAcX9Y3ecY/f0u99q2Edm7CzGgE0pYHbc2zvM+bCj
   A==;
X-CSE-ConnectionGUID: zcTEkn+2Ti+BS/Z8xRWCxQ==
X-CSE-MsgGUID: vnxrKXL/TxaFGjCmoC4osw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31321462"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31321462"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 08:53:03 -0800
X-CSE-ConnectionGUID: 37hqp6HmSjuTFpgcAAXpYQ==
X-CSE-MsgGUID: tQcy29X7SHuNCCWOSwIAMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89427916"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2024 08:53:00 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD4zi-0002Y0-08;
	Mon, 18 Nov 2024 16:52:58 +0000
Date: Tue, 19 Nov 2024 00:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/070-audio 20/119] sound/soc/soc-dapm.c:2320
 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.
Message-ID: <202411190027.DwOYG7u2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   a89c7c8788b938f7b52c6ca56449de45e92a056e
commit: 36eb765eeea35c3cb54bd0f11d9f33982142b51c [20/119] ASoC: dapm: Export new 'graph.dot' file in debugfs
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-161-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190027.DwOYG7u2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411190027.DwOYG7u2-lkp@intel.com/

smatch warnings:
sound/soc/soc-dapm.c:2320 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.

vim +/num_wdone +2320 sound/soc/soc-dapm.c

ef49e4fae3f364 Mark Brown     2011-04-04  2255  
36eb765eeea35c Martin Povišer 2022-08-21  2256  static ssize_t dapm_graph_read_file(struct file *file, char __user *user_buf,
36eb765eeea35c Martin Povišer 2022-08-21  2257  				    size_t count, loff_t *ppos)
36eb765eeea35c Martin Povišer 2022-08-21  2258  {
36eb765eeea35c Martin Povišer 2022-08-21  2259  	struct snd_soc_card *card = file->private_data;
36eb765eeea35c Martin Povišer 2022-08-21  2260  	struct snd_soc_dapm_context *dapm;
36eb765eeea35c Martin Povišer 2022-08-21  2261  	struct snd_soc_dapm_path *p;
36eb765eeea35c Martin Povišer 2022-08-21  2262  	struct snd_soc_dapm_widget *w;
36eb765eeea35c Martin Povišer 2022-08-21  2263  	struct snd_soc_pcm_runtime *rtd;
36eb765eeea35c Martin Povišer 2022-08-21  2264  	struct snd_soc_dapm_widget *wdone[16];
36eb765eeea35c Martin Povišer 2022-08-21  2265  	struct snd_soc_dai *dai;
36eb765eeea35c Martin Povišer 2022-08-21  2266  	int i, num_wdone = 0, cluster = 0;
36eb765eeea35c Martin Povišer 2022-08-21  2267  	char *buf;
36eb765eeea35c Martin Povišer 2022-08-21  2268  	ssize_t bufsize;
36eb765eeea35c Martin Povišer 2022-08-21  2269  	ssize_t ret = 0;
36eb765eeea35c Martin Povišer 2022-08-21  2270  
36eb765eeea35c Martin Povišer 2022-08-21  2271  	bufsize = 1024 * card->num_dapm_widgets;
36eb765eeea35c Martin Povišer 2022-08-21  2272  	buf = kmalloc(bufsize, GFP_KERNEL);
36eb765eeea35c Martin Povišer 2022-08-21  2273  	if (!buf)
36eb765eeea35c Martin Povišer 2022-08-21  2274  		return -ENOMEM;
36eb765eeea35c Martin Povišer 2022-08-21  2275  
36eb765eeea35c Martin Povišer 2022-08-21  2276  	mutex_lock(&card->dapm_mutex);
36eb765eeea35c Martin Povišer 2022-08-21  2277  
36eb765eeea35c Martin Povišer 2022-08-21  2278  #define bufprintf(...) \
36eb765eeea35c Martin Povišer 2022-08-21  2279  		ret += scnprintf(buf + ret, bufsize - ret, __VA_ARGS__)
36eb765eeea35c Martin Povišer 2022-08-21  2280  
36eb765eeea35c Martin Povišer 2022-08-21  2281  	bufprintf("digraph dapm {\n");
36eb765eeea35c Martin Povišer 2022-08-21  2282  
36eb765eeea35c Martin Povišer 2022-08-21  2283  	/*
36eb765eeea35c Martin Povišer 2022-08-21  2284  	 * Print the user-visible devices of the card.
36eb765eeea35c Martin Povišer 2022-08-21  2285  	 */
36eb765eeea35c Martin Povišer 2022-08-21  2286  	bufprintf("subgraph cluster_%d {\n", cluster++);
36eb765eeea35c Martin Povišer 2022-08-21  2287  	bufprintf("label=\"Devices\";style=filled;fillcolor=gray;\n");
36eb765eeea35c Martin Povišer 2022-08-21  2288  	for_each_card_rtds(card, rtd) {
36eb765eeea35c Martin Povišer 2022-08-21  2289  		if (rtd->dai_link->no_pcm)
36eb765eeea35c Martin Povišer 2022-08-21  2290  			continue;
36eb765eeea35c Martin Povišer 2022-08-21  2291  
36eb765eeea35c Martin Povišer 2022-08-21  2292  		bufprintf("w%pK [label=\"%d: %s\"];\n", rtd,
36eb765eeea35c Martin Povišer 2022-08-21  2293  			  rtd->pcm->device, rtd->dai_link->name);
36eb765eeea35c Martin Povišer 2022-08-21  2294  	}
36eb765eeea35c Martin Povišer 2022-08-21  2295  	bufprintf("};\n");
36eb765eeea35c Martin Povišer 2022-08-21  2296  
36eb765eeea35c Martin Povišer 2022-08-21  2297  	/*
36eb765eeea35c Martin Povišer 2022-08-21  2298  	 * Print the playback/capture widgets of DAIs just next to
36eb765eeea35c Martin Povišer 2022-08-21  2299  	 * the user-visible devices. Keep the list of already printed
36eb765eeea35c Martin Povišer 2022-08-21  2300  	 * widgets in 'wdone', so they will be skipped later.
36eb765eeea35c Martin Povišer 2022-08-21  2301  	 */
36eb765eeea35c Martin Povišer 2022-08-21  2302  	for_each_card_rtds(card, rtd) {
36eb765eeea35c Martin Povišer 2022-08-21  2303  		for_each_rtd_cpu_dais(rtd, i, dai) {
36eb765eeea35c Martin Povišer 2022-08-21  2304  			if (dai->stream[SNDRV_PCM_STREAM_PLAYBACK].widget) {
36eb765eeea35c Martin Povišer 2022-08-21  2305  				w = dai->stream[SNDRV_PCM_STREAM_PLAYBACK].widget;
36eb765eeea35c Martin Povišer 2022-08-21  2306  				bufprintf("w%pK [label=\"%s\"];\n", w, w->name);
36eb765eeea35c Martin Povišer 2022-08-21  2307  				if (!rtd->dai_link->no_pcm)
36eb765eeea35c Martin Povišer 2022-08-21  2308  					bufprintf("w%pK -> w%pK;\n", rtd, w);
36eb765eeea35c Martin Povišer 2022-08-21  2309  				wdone[num_wdone] = w;
36eb765eeea35c Martin Povišer 2022-08-21  2310  				if (num_wdone < ARRAY_SIZE(wdone))
36eb765eeea35c Martin Povišer 2022-08-21  2311  					num_wdone++;
36eb765eeea35c Martin Povišer 2022-08-21  2312  			}
36eb765eeea35c Martin Povišer 2022-08-21  2313  
36eb765eeea35c Martin Povišer 2022-08-21  2314  			if (dai->stream[SNDRV_PCM_STREAM_CAPTURE].widget) {
36eb765eeea35c Martin Povišer 2022-08-21  2315  				w = dai->stream[SNDRV_PCM_STREAM_CAPTURE].widget;
36eb765eeea35c Martin Povišer 2022-08-21  2316  				bufprintf("w%pK [label=\"%s\"];\n", w, w->name);
36eb765eeea35c Martin Povišer 2022-08-21  2317  				if (!rtd->dai_link->no_pcm)
36eb765eeea35c Martin Povišer 2022-08-21  2318  					bufprintf("w%pK -> w%pK;\n", w, rtd);
36eb765eeea35c Martin Povišer 2022-08-21  2319  				wdone[num_wdone] = w;
36eb765eeea35c Martin Povišer 2022-08-21 @2320  				if (num_wdone < ARRAY_SIZE(wdone))
36eb765eeea35c Martin Povišer 2022-08-21  2321  					num_wdone++;
36eb765eeea35c Martin Povišer 2022-08-21  2322  			}
36eb765eeea35c Martin Povišer 2022-08-21  2323  		}
36eb765eeea35c Martin Povišer 2022-08-21  2324  	}
36eb765eeea35c Martin Povišer 2022-08-21  2325  
36eb765eeea35c Martin Povišer 2022-08-21  2326  	for_each_card_dapms(card, dapm) {
36eb765eeea35c Martin Povišer 2022-08-21  2327  		const char *prefix = soc_dapm_prefix(dapm);
36eb765eeea35c Martin Povišer 2022-08-21  2328  
36eb765eeea35c Martin Povišer 2022-08-21  2329  		if (dapm != &card->dapm) {
36eb765eeea35c Martin Povišer 2022-08-21  2330  			bufprintf("subgraph cluster_%d {\n", cluster++);
36eb765eeea35c Martin Povišer 2022-08-21  2331  			if (prefix)
36eb765eeea35c Martin Povišer 2022-08-21  2332  				bufprintf("label=\"%s\";\n", prefix);
36eb765eeea35c Martin Povišer 2022-08-21  2333  			else if (dapm->component)
36eb765eeea35c Martin Povišer 2022-08-21  2334  				bufprintf("label=\"%s\";\n",
36eb765eeea35c Martin Povišer 2022-08-21  2335  					  dapm->component->name);
36eb765eeea35c Martin Povišer 2022-08-21  2336  		}
36eb765eeea35c Martin Povišer 2022-08-21  2337  
36eb765eeea35c Martin Povišer 2022-08-21  2338  		for_each_card_widgets(dapm->card, w) {
36eb765eeea35c Martin Povišer 2022-08-21  2339  			const char *name = w->name;
36eb765eeea35c Martin Povišer 2022-08-21  2340  			bool skip = false;
36eb765eeea35c Martin Povišer 2022-08-21  2341  
36eb765eeea35c Martin Povišer 2022-08-21  2342  			if (w->dapm != dapm)
36eb765eeea35c Martin Povišer 2022-08-21  2343  				continue;
36eb765eeea35c Martin Povišer 2022-08-21  2344  
36eb765eeea35c Martin Povišer 2022-08-21  2345  			if (list_empty(&w->edges[0]) && list_empty(&w->edges[1]))
36eb765eeea35c Martin Povišer 2022-08-21  2346  				continue;
36eb765eeea35c Martin Povišer 2022-08-21  2347  
36eb765eeea35c Martin Povišer 2022-08-21  2348  			for (i = 0; i < num_wdone; i++)
36eb765eeea35c Martin Povišer 2022-08-21  2349  				if (wdone[i] == w)
36eb765eeea35c Martin Povišer 2022-08-21  2350  					skip = true;
36eb765eeea35c Martin Povišer 2022-08-21  2351  			if (skip)
36eb765eeea35c Martin Povišer 2022-08-21  2352  				continue;
36eb765eeea35c Martin Povišer 2022-08-21  2353  
36eb765eeea35c Martin Povišer 2022-08-21  2354  			if (prefix && strlen(name) > strlen(prefix) + 1)
36eb765eeea35c Martin Povišer 2022-08-21  2355  				name += strlen(prefix) + 1;
36eb765eeea35c Martin Povišer 2022-08-21  2356  
36eb765eeea35c Martin Povišer 2022-08-21  2357  			bufprintf("w%pK [label=\"%s\"];\n", w, name);
36eb765eeea35c Martin Povišer 2022-08-21  2358  		}
36eb765eeea35c Martin Povišer 2022-08-21  2359  
36eb765eeea35c Martin Povišer 2022-08-21  2360  		if (dapm != &card->dapm)
36eb765eeea35c Martin Povišer 2022-08-21  2361  			bufprintf("}\n");
36eb765eeea35c Martin Povišer 2022-08-21  2362  	}
36eb765eeea35c Martin Povišer 2022-08-21  2363  
36eb765eeea35c Martin Povišer 2022-08-21  2364  	list_for_each_entry(p, &card->paths, list) {
36eb765eeea35c Martin Povišer 2022-08-21  2365  		if (p->name)
36eb765eeea35c Martin Povišer 2022-08-21  2366  			bufprintf("w%pK -> w%pK [label=\"%s\"];\n",
36eb765eeea35c Martin Povišer 2022-08-21  2367  				  p->source, p->sink, p->name);
36eb765eeea35c Martin Povišer 2022-08-21  2368  		else
36eb765eeea35c Martin Povišer 2022-08-21  2369  			bufprintf("w%pK -> w%pK;\n", p->source, p->sink);
36eb765eeea35c Martin Povišer 2022-08-21  2370  	}
36eb765eeea35c Martin Povišer 2022-08-21  2371  
36eb765eeea35c Martin Povišer 2022-08-21  2372  	bufprintf("}\n");
36eb765eeea35c Martin Povišer 2022-08-21  2373  #undef bufprintf
36eb765eeea35c Martin Povišer 2022-08-21  2374  
36eb765eeea35c Martin Povišer 2022-08-21  2375  	mutex_unlock(&card->dapm_mutex);
36eb765eeea35c Martin Povišer 2022-08-21  2376  
36eb765eeea35c Martin Povišer 2022-08-21  2377  	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
36eb765eeea35c Martin Povišer 2022-08-21  2378  
36eb765eeea35c Martin Povišer 2022-08-21  2379  	kfree(buf);
36eb765eeea35c Martin Povišer 2022-08-21  2380  	return ret;
36eb765eeea35c Martin Povišer 2022-08-21  2381  }
36eb765eeea35c Martin Povišer 2022-08-21  2382  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
