Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190401BDE8
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0lPXG3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697216517; x=1728752517;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ENIYVm9j9tyht453ifo757QYQn8TJGQvjURrSI1peoU=;
  b=Z0lPXG3fuQQhvhoxVXdD/HT8WVrBRDByJXxYKP0DNj6LOVA6xOjzBP+C
   U/X/KJ0fARCifBjBlWV45s3Frwi/VUiih08Ekdbzq1mC9zMti9NoiOjbb
   uADHziDQyEBu0i3khwAJV1nf1ga2qtFLQZJ2iETdWuANfuVFBrn8WoWdU
   +Z8E8wD1tnLCq0aKK57m42UYV+yr4VLfd2xw/w9aq1tgjlGvGxATUPTc3
   hg3DUCgciNrg3t9pLSQogJ0azzRYt7T20Sd0aTouAYLl6MdprOqCkrwK+
   HgxfKIS9hbf8wQMEaYUT0zevY2ekOCdOgnuZsHselC9XGpWKhZDcgtkIe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="3825681"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="3825681"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 10:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784234770"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="784234770"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2023 10:01:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrLXs-0005Ah-2B;
	Fri, 13 Oct 2023 17:01:52 +0000
Date: Sat, 14 Oct 2023 01:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/070-audio 17/37] sound/soc/soc-dapm.c:2260
 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.
Message-ID: <202310140049.EtXqBptb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   84126be72ac9e0b38c992e806417952deb3cd540
commit: f664a1ed8e4e6cae5697db372d62cac0fafde939 [17/37] ASoC: dapm: Export new 'graph.dot' file in debugfs
:::::: branch date: 3 weeks ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20230825 (https://download.01.org/0day-ci/archive/20231014/202310140049.EtXqBptb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140049.EtXqBptb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310140049.EtXqBptb-lkp@intel.com/

smatch warnings:
sound/soc/soc-dapm.c:2260 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.

vim +/num_wdone +2260 sound/soc/soc-dapm.c

ef49e4fae3f364 Mark Brown     2011-04-04  2195  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2196  static ssize_t dapm_graph_read_file(struct file *file, char __user *user_buf,
f664a1ed8e4e6c Martin Povišer 2022-08-21  2197  				    size_t count, loff_t *ppos)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2198  {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2199  	struct snd_soc_card *card = file->private_data;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2200  	struct snd_soc_dapm_context *dapm;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2201  	struct snd_soc_dapm_path *p;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2202  	struct snd_soc_dapm_widget *w;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2203  	struct snd_soc_pcm_runtime *rtd;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2204  	struct snd_soc_dapm_widget *wdone[16];
f664a1ed8e4e6c Martin Povišer 2022-08-21  2205  	struct snd_soc_dai *dai;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2206  	int i, num_wdone = 0, cluster = 0;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2207  	char *buf;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2208  	ssize_t bufsize;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2209  	ssize_t ret = 0;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2210  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2211  	bufsize = 1024 * card->num_dapm_widgets;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2212  	buf = kmalloc(bufsize, GFP_KERNEL);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2213  	if (!buf)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2214  		return -ENOMEM;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2215  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2216  	mutex_lock(&card->dapm_mutex);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2217  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2218  #define bufprintf(...) \
f664a1ed8e4e6c Martin Povišer 2022-08-21  2219  		ret += scnprintf(buf + ret, bufsize - ret, __VA_ARGS__)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2220  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2221  	bufprintf("digraph dapm {\n");
f664a1ed8e4e6c Martin Povišer 2022-08-21  2222  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2223  	/*
f664a1ed8e4e6c Martin Povišer 2022-08-21  2224  	 * Print the user-visible devices of the card.
f664a1ed8e4e6c Martin Povišer 2022-08-21  2225  	 */
f664a1ed8e4e6c Martin Povišer 2022-08-21  2226  	bufprintf("subgraph cluster_%d {\n", cluster++);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2227  	bufprintf("label=\"Devices\";style=filled;fillcolor=gray;\n");
f664a1ed8e4e6c Martin Povišer 2022-08-21  2228  	for_each_card_rtds(card, rtd) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2229  		if (rtd->dai_link->no_pcm)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2230  			continue;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2231  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2232  		bufprintf("w%pK [label=\"%d: %s\"];\n", rtd,
f664a1ed8e4e6c Martin Povišer 2022-08-21  2233  			  rtd->pcm->device, rtd->dai_link->name);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2234  	}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2235  	bufprintf("};\n");
f664a1ed8e4e6c Martin Povišer 2022-08-21  2236  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2237  	/*
f664a1ed8e4e6c Martin Povišer 2022-08-21  2238  	 * Print the playback/capture widgets of DAIs just next to
f664a1ed8e4e6c Martin Povišer 2022-08-21  2239  	 * the user-visible devices. Keep the list of already printed
f664a1ed8e4e6c Martin Povišer 2022-08-21  2240  	 * widgets in 'wdone', so they will be skipped later.
f664a1ed8e4e6c Martin Povišer 2022-08-21  2241  	 */
f664a1ed8e4e6c Martin Povišer 2022-08-21  2242  	for_each_card_rtds(card, rtd) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2243  		for_each_rtd_cpu_dais(rtd, i, dai) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2244  			if (dai->stream[SNDRV_PCM_STREAM_PLAYBACK].widget) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2245  				w = dai->stream[SNDRV_PCM_STREAM_PLAYBACK].widget;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2246  				bufprintf("w%pK [label=\"%s\"];\n", w, w->name);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2247  				if (!rtd->dai_link->no_pcm)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2248  					bufprintf("w%pK -> w%pK;\n", rtd, w);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2249  				wdone[num_wdone] = w;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2250  				if (num_wdone < ARRAY_SIZE(wdone))
f664a1ed8e4e6c Martin Povišer 2022-08-21  2251  					num_wdone++;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2252  			}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2253  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2254  			if (dai->stream[SNDRV_PCM_STREAM_CAPTURE].widget) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2255  				w = dai->stream[SNDRV_PCM_STREAM_CAPTURE].widget;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2256  				bufprintf("w%pK [label=\"%s\"];\n", w, w->name);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2257  				if (!rtd->dai_link->no_pcm)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2258  					bufprintf("w%pK -> w%pK;\n", w, rtd);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2259  				wdone[num_wdone] = w;
f664a1ed8e4e6c Martin Povišer 2022-08-21 @2260  				if (num_wdone < ARRAY_SIZE(wdone))
f664a1ed8e4e6c Martin Povišer 2022-08-21  2261  					num_wdone++;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2262  			}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2263  		}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2264  	}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2265  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2266  	for_each_card_dapms(card, dapm) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2267  		const char *prefix = soc_dapm_prefix(dapm);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2268  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2269  		if (dapm != &card->dapm) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2270  			bufprintf("subgraph cluster_%d {\n", cluster++);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2271  			if (prefix)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2272  				bufprintf("label=\"%s\";\n", prefix);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2273  			else if (dapm->component)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2274  				bufprintf("label=\"%s\";\n",
f664a1ed8e4e6c Martin Povišer 2022-08-21  2275  					  dapm->component->name);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2276  		}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2277  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2278  		for_each_card_widgets(dapm->card, w) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2279  			const char *name = w->name;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2280  			bool skip = false;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2281  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2282  			if (w->dapm != dapm)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2283  				continue;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2284  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2285  			if (list_empty(&w->edges[0]) && list_empty(&w->edges[1]))
f664a1ed8e4e6c Martin Povišer 2022-08-21  2286  				continue;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2287  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2288  			for (i = 0; i < num_wdone; i++)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2289  				if (wdone[i] == w)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2290  					skip = true;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2291  			if (skip)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2292  				continue;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2293  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2294  			if (prefix && strlen(name) > strlen(prefix) + 1)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2295  				name += strlen(prefix) + 1;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2296  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2297  			bufprintf("w%pK [label=\"%s\"];\n", w, name);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2298  		}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2299  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2300  		if (dapm != &card->dapm)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2301  			bufprintf("}\n");
f664a1ed8e4e6c Martin Povišer 2022-08-21  2302  	}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2303  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2304  	list_for_each_entry(p, &card->paths, list) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2305  		if (p->name)
f664a1ed8e4e6c Martin Povišer 2022-08-21  2306  			bufprintf("w%pK -> w%pK [label=\"%s\"];\n",
f664a1ed8e4e6c Martin Povišer 2022-08-21  2307  				  p->source, p->sink, p->name);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2308  		else
f664a1ed8e4e6c Martin Povišer 2022-08-21  2309  			bufprintf("w%pK -> w%pK;\n", p->source, p->sink);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2310  	}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2311  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2312  	bufprintf("}\n");
f664a1ed8e4e6c Martin Povišer 2022-08-21  2313  #undef bufprintf
f664a1ed8e4e6c Martin Povišer 2022-08-21  2314  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2315  	mutex_unlock(&card->dapm_mutex);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2316  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2317  	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2318  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2319  	kfree(buf);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2320  	return ret;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2321  }
f664a1ed8e4e6c Martin Povišer 2022-08-21  2322  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
