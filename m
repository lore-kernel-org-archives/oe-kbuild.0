Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E631C06;
	Thu, 29 Dec 2022 08:44:46 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id y8so16797129wrl.13;
        Thu, 29 Dec 2022 00:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shLOGnyRf57l8TRyOK6+sLjGfHVfbSQkzK1IPgdF4ok=;
        b=gDb6DIZBhXC6DaWK6t840obqpG00K3HuAtfc8fepW1NV2W5JChobb68Zqpq+KVMKo6
         PN64xqsNZVz3LlrFkL+yGRKdpv6BTMsFl2sHCjljEUaE8jk76+CPgIKsruHrRlxKDYE3
         lMVMUPNIZk0zdwaB8fDLRICajBz6xSp9ztB16eGKZAWUvw0w9NU16rP89cmcE9cs8MV0
         wW0uEMSKTm6Mcvv4BoRgJlIy2ktgN1yNdCH1ad/L69tFdAQvvLmlLDEfGCp7FB/AdCNN
         Py4tfTq9cp/EY6q4eD3OKLTi6khIzAq/0FWRNpG8VaWj3tm+0ZJS8HOhflaEZazXfHRx
         kDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shLOGnyRf57l8TRyOK6+sLjGfHVfbSQkzK1IPgdF4ok=;
        b=vEWkNav9g/0k9bJp/9Emdm6Kqgc+3XReR2gc23S/WYCgXVwoTlq1jgy3v886qN/GSK
         rjko4ywdaBxUjf7V5vD7GrfzRSBNA55jkLkAcfFSJV1EiYZQYn4jjdSiVP/81c6G7V5C
         5+Ah4soLTVlH8kltByUmJWaxIWHqmRUmMArOpGPoTAoMw4s7JdkUyYKJKBp2kA5Mmaux
         JfWgRy6ZTJ0Y/2C3wyg3ShvCAAQH7gu6/+EKxE5qNk7jui/Mhy4+18EJ4arjv54x2qbk
         NcJenbNHymicIPr2SGeFjmt6zJa+G9Jn/SlQWn8SG2/Ge+TNe+hvbGio54H6fljxZeGu
         BjbA==
X-Gm-Message-State: AFqh2kodp8JK01GvWJejVdDAymqQ3pdFLRzM9Q3hiZzfAFiX9Z+I4Vud
	k13B/4+9ZSlPkxZi4gTEeVRwNCchG99YIA==
X-Google-Smtp-Source: AMrXdXvSyf83ujV4jDOZKDiAKRHjZtoA82FQbaY+4q29y2DFgtsNhwM3Rb3QdzNvgEaObvvU0MnyQQ==
X-Received: by 2002:a5d:430e:0:b0:279:53e1:5178 with SMTP id h14-20020a5d430e000000b0027953e15178mr9734138wrq.45.1672303484355;
        Thu, 29 Dec 2022 00:44:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y2-20020a5d4ac2000000b0027323b19ecesm16204120wrs.16.2022.12.29.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 00:44:43 -0800 (PST)
Date: Thu, 29 Dec 2022 11:44:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 19/36] sound/soc/soc-dapm.c:2277
 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.
Message-ID: <202212270519.LzpGlIjQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20221229084440.5VQEt5J0PKXT-7LcpKs5S53lStAyU46gy1FQHCkYlgI@z>

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   88d23ed31d629d6981f72fec9d008db7815cde8b
commit: ea9892341d0d212354bf954780e4762ad6ad1104 [19/36] ASoC: dapm: Export new 'graph.dot' file in debugfs
config: i386-randconfig-m021-20221226
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
sound/soc/soc-dapm.c:2277 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.

vim +/num_wdone +2277 sound/soc/soc-dapm.c

ea9892341d0d21 Martin Povišer 2022-08-21  2213  static ssize_t dapm_graph_read_file(struct file *file, char __user *user_buf,
ea9892341d0d21 Martin Povišer 2022-08-21  2214  				    size_t count, loff_t *ppos)
ea9892341d0d21 Martin Povišer 2022-08-21  2215  {
ea9892341d0d21 Martin Povišer 2022-08-21  2216  	struct snd_soc_card *card = file->private_data;
ea9892341d0d21 Martin Povišer 2022-08-21  2217  	struct snd_soc_dapm_context *dapm;
ea9892341d0d21 Martin Povišer 2022-08-21  2218  	struct snd_soc_dapm_path *p;
ea9892341d0d21 Martin Povišer 2022-08-21  2219  	struct snd_soc_dapm_widget *w;
ea9892341d0d21 Martin Povišer 2022-08-21  2220  	struct snd_soc_pcm_runtime *rtd;
ea9892341d0d21 Martin Povišer 2022-08-21  2221  	struct snd_soc_dapm_widget *wdone[16];
ea9892341d0d21 Martin Povišer 2022-08-21  2222  	struct snd_soc_dai *dai;
ea9892341d0d21 Martin Povišer 2022-08-21  2223  	int i, num_wdone = 0, cluster = 0;
ea9892341d0d21 Martin Povišer 2022-08-21  2224  	char *buf;
ea9892341d0d21 Martin Povišer 2022-08-21  2225  	ssize_t bufsize;
ea9892341d0d21 Martin Povišer 2022-08-21  2226  	ssize_t ret = 0;
ea9892341d0d21 Martin Povišer 2022-08-21  2227  
ea9892341d0d21 Martin Povišer 2022-08-21  2228  	bufsize = 1024 * card->num_dapm_widgets;
ea9892341d0d21 Martin Povišer 2022-08-21  2229  	buf = kmalloc(bufsize, GFP_KERNEL);
ea9892341d0d21 Martin Povišer 2022-08-21  2230  	if (!buf)
ea9892341d0d21 Martin Povišer 2022-08-21  2231  		return -ENOMEM;
ea9892341d0d21 Martin Povišer 2022-08-21  2232  
ea9892341d0d21 Martin Povišer 2022-08-21  2233  	mutex_lock(&card->dapm_mutex);
ea9892341d0d21 Martin Povišer 2022-08-21  2234  
ea9892341d0d21 Martin Povišer 2022-08-21  2235  #define bufprintf(...) \
ea9892341d0d21 Martin Povišer 2022-08-21  2236  		ret += scnprintf(buf + ret, bufsize - ret, __VA_ARGS__)
ea9892341d0d21 Martin Povišer 2022-08-21  2237  
ea9892341d0d21 Martin Povišer 2022-08-21  2238  	bufprintf("digraph dapm {\n");
ea9892341d0d21 Martin Povišer 2022-08-21  2239  
ea9892341d0d21 Martin Povišer 2022-08-21  2240  	/*
ea9892341d0d21 Martin Povišer 2022-08-21  2241  	 * Print the user-visible devices of the card.
ea9892341d0d21 Martin Povišer 2022-08-21  2242  	 */
ea9892341d0d21 Martin Povišer 2022-08-21  2243  	bufprintf("subgraph cluster_%d {\n", cluster++);
ea9892341d0d21 Martin Povišer 2022-08-21  2244  	bufprintf("label=\"Devices\";style=filled;fillcolor=gray;\n");
ea9892341d0d21 Martin Povišer 2022-08-21  2245  	for_each_card_rtds(card, rtd) {
ea9892341d0d21 Martin Povišer 2022-08-21  2246  		if (rtd->dai_link->no_pcm)
ea9892341d0d21 Martin Povišer 2022-08-21  2247  			continue;
ea9892341d0d21 Martin Povišer 2022-08-21  2248  
ea9892341d0d21 Martin Povišer 2022-08-21  2249  		bufprintf("w%pK [label=\"%d: %s\"];\n", rtd,
ea9892341d0d21 Martin Povišer 2022-08-21  2250  			  rtd->pcm->device, rtd->dai_link->name);
ea9892341d0d21 Martin Povišer 2022-08-21  2251  	}
ea9892341d0d21 Martin Povišer 2022-08-21  2252  	bufprintf("};\n");
ea9892341d0d21 Martin Povišer 2022-08-21  2253  
ea9892341d0d21 Martin Povišer 2022-08-21  2254  	/*
ea9892341d0d21 Martin Povišer 2022-08-21  2255  	 * Print the playback/capture widgets of DAIs just next to
ea9892341d0d21 Martin Povišer 2022-08-21  2256  	 * the user-visible devices. Keep the list of already printed
ea9892341d0d21 Martin Povišer 2022-08-21  2257  	 * widgets in 'wdone', so they will be skipped later.
ea9892341d0d21 Martin Povišer 2022-08-21  2258  	 */
ea9892341d0d21 Martin Povišer 2022-08-21  2259  	for_each_card_rtds(card, rtd) {
ea9892341d0d21 Martin Povišer 2022-08-21  2260  		for_each_rtd_cpu_dais(rtd, i, dai) {
ea9892341d0d21 Martin Povišer 2022-08-21  2261  			if (dai->playback_widget) {
ea9892341d0d21 Martin Povišer 2022-08-21  2262  				w = dai->playback_widget;
ea9892341d0d21 Martin Povišer 2022-08-21  2263  				bufprintf("w%pK [label=\"%s\"];\n", w, w->name);
ea9892341d0d21 Martin Povišer 2022-08-21  2264  				if (!rtd->dai_link->no_pcm)
ea9892341d0d21 Martin Povišer 2022-08-21  2265  					bufprintf("w%pK -> w%pK;\n", rtd, w);
ea9892341d0d21 Martin Povišer 2022-08-21  2266  				wdone[num_wdone] = w;
ea9892341d0d21 Martin Povišer 2022-08-21  2267  				if (num_wdone < ARRAY_SIZE(wdone))
ea9892341d0d21 Martin Povišer 2022-08-21  2268  					num_wdone++;
ea9892341d0d21 Martin Povišer 2022-08-21  2269  			}
ea9892341d0d21 Martin Povišer 2022-08-21  2270  
ea9892341d0d21 Martin Povišer 2022-08-21  2271  			if (dai->capture_widget) {
ea9892341d0d21 Martin Povišer 2022-08-21  2272  				w = dai->capture_widget;
ea9892341d0d21 Martin Povišer 2022-08-21  2273  				bufprintf("w%pK [label=\"%s\"];\n", w, w->name);
ea9892341d0d21 Martin Povišer 2022-08-21  2274  				if (!rtd->dai_link->no_pcm)
ea9892341d0d21 Martin Povišer 2022-08-21  2275  					bufprintf("w%pK -> w%pK;\n", w, rtd);
ea9892341d0d21 Martin Povišer 2022-08-21  2276  				wdone[num_wdone] = w;
                                                                                ^^^^^^^^^^^^^^^^^^^^
ea9892341d0d21 Martin Povišer 2022-08-21 @2277  				if (num_wdone < ARRAY_SIZE(wdone))
                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If this condition is not true then we just corrupted memory on the line
before.

ea9892341d0d21 Martin Povišer 2022-08-21  2278  					num_wdone++;
ea9892341d0d21 Martin Povišer 2022-08-21  2279  			}
ea9892341d0d21 Martin Povišer 2022-08-21  2280  		}
ea9892341d0d21 Martin Povišer 2022-08-21  2281  	}
ea9892341d0d21 Martin Povišer 2022-08-21  2282  
ea9892341d0d21 Martin Povišer 2022-08-21  2283  	for_each_card_dapms(card, dapm) {
ea9892341d0d21 Martin Povišer 2022-08-21  2284  		const char *prefix = soc_dapm_prefix(dapm);
ea9892341d0d21 Martin Povišer 2022-08-21  2285  
ea9892341d0d21 Martin Povišer 2022-08-21  2286  		if (dapm != &card->dapm) {
ea9892341d0d21 Martin Povišer 2022-08-21  2287  			bufprintf("subgraph cluster_%d {\n", cluster++);
ea9892341d0d21 Martin Povišer 2022-08-21  2288  			if (prefix)
ea9892341d0d21 Martin Povišer 2022-08-21  2289  				bufprintf("label=\"%s\";\n", prefix);
ea9892341d0d21 Martin Povišer 2022-08-21  2290  			else if (dapm->component)
ea9892341d0d21 Martin Povišer 2022-08-21  2291  				bufprintf("label=\"%s\";\n",
ea9892341d0d21 Martin Povišer 2022-08-21  2292  					  dapm->component->name);
ea9892341d0d21 Martin Povišer 2022-08-21  2293  		}

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

