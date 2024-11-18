Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FF1DFD90
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731955037; cv=none; b=UhG5rVhh5nS8yCYCJMpbOV4EwAw4u3X9X0Zob9OLWNLTsqbSK7N4nKzPWx6HbL/oNgqHM1VfNfKxmD8AGjmelBcxypzAljCiHfQft/WGjpgl6tyoU3j+Gq+ErwdPSKg+w2Ytc5x/vKcj3LgPW4OBEM5BcO2dcZsC3ahLporDH4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731955037; c=relaxed/simple;
	bh=veoy5a5dW6t2BpWB8948/OFW8RSw0oqfC0Xklrv21+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLrDpOrGQYW/Yp5Qy3F0+6P6d5UpHs7UEUmSMoiPFBng03U4oKs2CQEE5lQagIBu3sOesgalJwtI7GijrlnwqRyBQm+hkzguedU9ID/+ZOgg3xzYBERG2qLR2eIKYNyM3EAqgw5ZxPkeR13dfZbixxLW72FXs/UV417MVm8CBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/cTEMPg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/cTEMPg"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53da5a27771so2724034e87.2
        for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 10:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731955032; x=1732559832; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiW9qShnMnAuszTpZ6ciXRNNYv0VaMrdziOoNoH8MtI=;
        b=A/cTEMPgAWuHUycIzPrQLSIIzs90pVCir3Z0nQZXXypleU30GA6PrdZd+Af8ntBnKK
         LCodA4E9+KvxFNrpfh5vcX+h8hTRrtP2IKSHGAa6R8d3ow5o3PedWjgQKbkcJes2+pbu
         W5e9F6HrqSF7h38n8xpNcwHKiPjt6NF/wbbEyOdL2woEU/zD4eWTod2OQnYXWq6rAAbV
         JtaWVu9hCNQoFWknQ3gB9Q3MmRjCxj5F9YksHNnW2O2erjYIpfugmskVp/QelXroTDHp
         nMv6Tym5h/PRysWZ/u979goaEP5NsiGOlkzB81wIitsendSztruyS46St0qNjYLxYUzr
         iW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731955032; x=1732559832;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiW9qShnMnAuszTpZ6ciXRNNYv0VaMrdziOoNoH8MtI=;
        b=sJGMDg5CW8xJ9ITATGPemnOKmVVNzmIQq4C/0gRT3HcC+klhYC2NnPe+2E7mK+ab46
         XBjgKhgWw5U0l+P3+vRWdSGzmPnA2ccAuJCCOSxmq1WAVcRlIAPkhcliwMDEf7UvZnK/
         Om+ur9xFK2IRcr9TEW3juGAXOX2QPJ6bLtbBF5R4A9UhLIWlTnEFUfCO8KOyrGOjmmgk
         vGMBZ7ICqJnOZYUkMy5X11H6LJhcoMJSzFWuFKL/UuprBVfNIcFRCDQsqm1d/FevJvwt
         NhdT1I4COdGxP8yYYyv7ORQz7O2tw2WFxu4T6xwnJwyS2YTVZA688GRzXBwpvJN6dzbQ
         J95A==
X-Gm-Message-State: AOJu0Yx2OUopvhGtlhXxrfBPWtEw6aSBgp7TWAt76O3Pgkz/dygDwJPF
	RCzfETSXlIiiE6PWAl2tE16lYw+PYqlfMlLTVJLCLoAXszcQZtI7pdW8wTGMAF/Md+7V450iVPX
	X
X-Google-Smtp-Source: AGHT+IE7HkAZZKWlZWOe967YjeFFbvdoOqf49zoPBHZJEX8eseJRaxOA4F6Olv+RbpHKAT0tW28c2A==
X-Received: by 2002:a05:6512:3a84:b0:53d:a927:8206 with SMTP id 2adb3069b0e04-53dab29ad8dmr4847606e87.20.1731955030890;
        Mon, 18 Nov 2024 10:37:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac1fb7asm164569785e9.42.2024.11.18.10.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 10:37:10 -0800 (PST)
Date: Mon, 18 Nov 2024 21:37:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 20/119] sound/soc/soc-dapm.c:2320
 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.
Message-ID: <821b7439-cde3-4b59-a4b1-84b38d29b1c3@stanley.mountain>
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
head:   a89c7c8788b938f7b52c6ca56449de45e92a056e
commit: 36eb765eeea35c3cb54bd0f11d9f33982142b51c [20/119] ASoC: dapm: Export new 'graph.dot' file in debugfs
config: x86_64-randconfig-161-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190027.DwOYG7u2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411190027.DwOYG7u2-lkp@intel.com/

smatch warnings:
sound/soc/soc-dapm.c:2320 dapm_graph_read_file() error: testing array offset 'num_wdone' after use.

vim +/num_wdone +2320 sound/soc/soc-dapm.c

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

If num_wdone == ARRAY_SIZE() then the the previous line just caused memory
corruption.

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

same

36eb765eeea35c Martin Povišer 2022-08-21  2321  					num_wdone++;
36eb765eeea35c Martin Povišer 2022-08-21  2322  			}
36eb765eeea35c Martin Povišer 2022-08-21  2323  		}
36eb765eeea35c Martin Povišer 2022-08-21  2324  	}
36eb765eeea35c Martin Povišer 2022-08-21  2325  
36eb765eeea35c Martin Povišer 2022-08-21  2326  	for_each_card_dapms(card, dapm) {
36eb765eeea35c Martin Povišer 2022-08-21  2327  		const char *prefix = soc_dapm_prefix(dapm);
36eb765eeea35c Martin Povišer 2022-08-21  2328  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

