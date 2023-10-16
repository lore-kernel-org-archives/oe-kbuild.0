Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC13D72
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Oct 2023 04:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMh8AMTc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so3729015f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Oct 2023 21:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697431437; x=1698036237; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQKcm8RUoHLjFRbdRVvB/qN2XCWrFhAS4ste4e8YIFY=;
        b=dMh8AMTc+vMoLpyn3fpUez8kDlkhhCCiaRklsx9n8Y6/UDm5uwBX+zn3sbsYvXK6qR
         KYqlw6W8S1uiaSKGNNipigMAG37jZNd6eeSPg+7iBfDuTQd6nMKCmufvx19L+D017Oa7
         MU9BH/ILNm8aHQiSWWSbKHW/Ic6IVhmBe0IwRa1GMzpqdbCf57Qg7LD29ix9u342EIQR
         XBaqEv+TJlWxHaCthrrayjoZpcFX6MNCK7C8CoQJQtPWuuJKdUudBcYI4E1WZSvtccUC
         Sng9ycqe4idszYqqe2oXYKmt7IR+6/kWwoPJgmd8QLxmCqIscBK6uAZgisS/NobrdsCR
         t5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697431437; x=1698036237;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQKcm8RUoHLjFRbdRVvB/qN2XCWrFhAS4ste4e8YIFY=;
        b=AceaxnUZxgjFGW+8CgXUg805NpCpdxMIA+H+UhAkDBiNos065T7iw+1j9Z0Cm7DDgz
         zLrQ1RVz79cVQb35ztB5nepuY1u2iCL846M/870enFAHAK8W4DDjG8Zhh4Lf6EcMJSqc
         y0BuzN2m2LNMngeeaZa7ysyXlL8HUokqrCOlv9aWXZbhCrm9yEjObm2/jpz5fRkwY3R3
         dox0fMRi6GGzFnLUcuEGtx07ITu36nvkq7QrK5HlYrWymx+XsT0eVZzQV8B3VIYTlPyj
         lkw+d183fBdoQH12TbFYoFPZrZrdvA++SJwYjLnB2LCuG+ZWZV0+wkA4ft5viHV8ANwk
         hQYw==
X-Gm-Message-State: AOJu0YyiKNdmcO+7CtkzIfhCcI69dk0u/q5X84jt6Wu5efL3ESP6cIYN
	HQcSe2kSLt0FabarUJNSLz8Ymzz5KB2rnwroU7I=
X-Google-Smtp-Source: AGHT+IGdV/EfRhHpnv4sMDLX/wxIyVItLcCNBRpKeeQHjlACu+BTRV1nRmdktnf5Iy9mNVlPPit93A==
X-Received: by 2002:a5d:5947:0:b0:32d:b194:706 with SMTP id e7-20020a5d5947000000b0032db1940706mr1647398wri.16.1697431437192;
        Sun, 15 Oct 2023 21:43:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c1d8a00b003fe23b10fdfsm6050001wms.36.2023.10.15.21.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 21:43:56 -0700 (PDT)
Date: Mon, 16 Oct 2023 07:43:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 17/37] sound/soc/soc-dapm.c:2260
 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.
Message-ID: <e9198858-f4a0-42ff-9f74-2ded2ff298e3@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   84126be72ac9e0b38c992e806417952deb3cd540
commit: f664a1ed8e4e6cae5697db372d62cac0fafde939 [17/37] ASoC: dapm: Export new 'graph.dot' file in debugfs
config: i386-randconfig-141-20230825 (https://download.01.org/0day-ci/archive/20231014/202310140049.EtXqBptb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140049.EtXqBptb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310140049.EtXqBptb-lkp@intel.com/

smatch warnings:
sound/soc/soc-dapm.c:2260 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.

vim +/num_wdone +2260 sound/soc/soc-dapm.c

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
                                                                                ^^^^^^^^^^^^^^^^^^^^^
Set's memory

f664a1ed8e4e6c Martin Povišer 2022-08-21  2250  				if (num_wdone < ARRAY_SIZE(wdone))

Checks if the assignment was out of bounds.  Maybe this should
be:

	if ((num_wdone + 1 < ARRAY_SIZE(wdone))

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

Same

f664a1ed8e4e6c Martin Povišer 2022-08-21  2261  					num_wdone++;
f664a1ed8e4e6c Martin Povišer 2022-08-21  2262  			}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2263  		}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2264  	}
f664a1ed8e4e6c Martin Povišer 2022-08-21  2265  
f664a1ed8e4e6c Martin Povišer 2022-08-21  2266  	for_each_card_dapms(card, dapm) {
f664a1ed8e4e6c Martin Povišer 2022-08-21  2267  		const char *prefix = soc_dapm_prefix(dapm);
f664a1ed8e4e6c Martin Povišer 2022-08-21  2268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

