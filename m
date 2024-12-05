Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E341D5CD7
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733405701; cv=none; b=shwexX2AC1BV1lpfwSq0GJSwRi+Et87T6PrHkRsqLLYpwkGULzcuL5C+Y7I7ukywq2Kyi5fGL/JWBT1gc/IZfpOLZTPs6dKiBJtbWGWFE5qnuAHd36pUd4kONjLjoIE3MZCAX19qggAhKFMmKE9/3pHsKcszXBgTEHJoT0I9YkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733405701; c=relaxed/simple;
	bh=BoLGBVb1NPdm4L7pMGNdH6ioputrhx+cxasjf5qotXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iC+5jhw+zmkOgismhhwyK9qRuSEeJ+W58ZPj05g99HwV2OITScUxFHxowinh6w5n5lJr5eYOYvtF+hkJJD6s+wIpRJZkYr5lbQrAC8D7cvdSogecJnTmTPFckljbmLR2pGyfTiNMGfTpR/+HHYLnJFwC1Fe5mBLA6OXP4Wlcu2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvbMS+sB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvbMS+sB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43494a20379so9392235e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 05 Dec 2024 05:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733405696; x=1734010496; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JBc8KL57J8xHVYF4fKLeUkmEHOFhgXUcAjrh4skgb8=;
        b=JvbMS+sB7VSEQyfRNxtrmb6L8OWmqXomng5XsvfsrNs8EQoeXVqmu+8AI/7SNQbWrn
         Yeaj8bt4kTNdtDG33b6tEN1mLQj4gw11IeH4W1JVkCVatQeYNrMJufCAiHxZBn/bXtiT
         ez533r6+71k/ky6vzF4V8N8t5qV3AatXv14PqJsS+gep8UzLJKuCziXO7g3rSeoWQM9A
         +6Oyz+yxrUqWX1sCk4v0UHmtbqxV2ArPvZpjpmROzAwyoNJ9sYhygp9vmQ2yQopQLCaJ
         ap1ncA8He99vcT4g5sEmnwcGnEm4TfVAU57suy2Eegz0LjrY06V00GRRUw5Kyu2xIHPj
         1NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733405696; x=1734010496;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+JBc8KL57J8xHVYF4fKLeUkmEHOFhgXUcAjrh4skgb8=;
        b=KB9ypNoC9rBablKU6N6+t0mC8noumCdEYeLGSOhmD7W3gbz9FhHFm740UXxTsZhQk3
         LiuMQuLG4Rp3liPpHeGyMwbyob1xwB1/5LJvNHYpZIJjzCPIv/kmqtblmmIe2iVEoYyc
         8w94Jqv1iZgelb7pZ5Cg2iWIKNt0L2kUFqUJt3H4PywuNdlKPJy+dba3RiKNyr/Fgjdx
         kpQKOi3q69dOtrMjOg8f+BiyTlni6K4GJVt/fd/VloIvvVFmspiZAHDiUkIQktPaNlL8
         ihL4r58KrcBqdggDg7HQMwwayBiG02lSkiP3VkCE32oR8Z61SpURQSz2LLFZ2TDP/LRy
         9iQA==
X-Gm-Message-State: AOJu0Yxjle4ZUbm2tKJXofGZJFf+aIZXTkSixNCLV0XOuwtWIdgmH0rK
	1S8FwEMWEygB2bHAKfs4GW6j1gJjq++Z79mXyXLalyi6V+d3aduvu33rllVYj2CEs0pUXUcaLGM
	s
X-Gm-Gg: ASbGncsGxDyBVh0Tofh/vbiyj1U8JV3sbgcHjxpwJBZwfLRMBOh0uWzrE1RPjTapg9F
	qF4Qj230s/3WIQMHduxyMB5dFmSFhNalw+wa+9oXAugS8B44f/Y6CzhPwp0y1f48mP4qqst5Gu6
	NlwkHSs3k6cbijqb2scf5wJs/9PbpgUBQSD03CZYs9c342jgCZRTVt7ggtrJlRwr01xya3ksmHW
	xtCCCY7CmFH3HoFmEKVgcTOdUJo2S7UOXsEnUvq0nqWYdDA2pBVWvg=
X-Google-Smtp-Source: AGHT+IHbem+ThoKIpTAfmVUHsxyT17Xluqm4yopKeYyDxAcxf5LqmQ0p/xUeyzuaRpl08uRf9De+7A==
X-Received: by 2002:a05:600c:4588:b0:434:9c44:678b with SMTP id 5b1f17b1804b1-434d09c2766mr91769655e9.19.1733405696503;
        Thu, 05 Dec 2024 05:34:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b375sm62072225e9.9.2024.12.05.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 05:34:56 -0800 (PST)
Date: Thu, 5 Dec 2024 16:34:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/amd/acp/acp70.c:217 acp70_pcm_resume() error: we
 previously assumed 'stream' could be null (see line 218)
Message-ID: <2c6a1bd0-7651-4c72-bca4-34674aabafe3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: d3534684ada99ef8c0899eb28c62b4462483ee19 ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412052149.HYbkQDxc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412052149.HYbkQDxc-lkp@intel.com/

smatch warnings:
sound/soc/amd/acp/acp70.c:217 acp70_pcm_resume() error: we previously assumed 'stream' could be null (see line 218)

vim +/stream +217 sound/soc/amd/acp/acp70.c

e84db124cb2158b Syed Saba Kareem 2023-10-21  208  static int __maybe_unused acp70_pcm_resume(struct device *dev)
e84db124cb2158b Syed Saba Kareem 2023-10-21  209  {
e84db124cb2158b Syed Saba Kareem 2023-10-21  210  	struct acp_dev_data *adata = dev_get_drvdata(dev);
e84db124cb2158b Syed Saba Kareem 2023-10-21  211  	struct acp_stream *stream;
e84db124cb2158b Syed Saba Kareem 2023-10-21  212  	struct snd_pcm_substream *substream;
e84db124cb2158b Syed Saba Kareem 2023-10-21  213  	snd_pcm_uframes_t buf_in_frames;
e84db124cb2158b Syed Saba Kareem 2023-10-21  214  	u64 buf_size;
e84db124cb2158b Syed Saba Kareem 2023-10-21  215  
e84db124cb2158b Syed Saba Kareem 2023-10-21  216  	spin_lock(&adata->acp_lock);
e84db124cb2158b Syed Saba Kareem 2023-10-21 @217  	list_for_each_entry(stream, &adata->stream_list, list) {
e84db124cb2158b Syed Saba Kareem 2023-10-21 @218  		if (stream) {

The list iterator can't be NULL so this check isn't required.

e84db124cb2158b Syed Saba Kareem 2023-10-21  219  			substream = stream->substream;
e84db124cb2158b Syed Saba Kareem 2023-10-21  220  			if (substream && substream->runtime) {
e84db124cb2158b Syed Saba Kareem 2023-10-21  221  				buf_in_frames = (substream->runtime->buffer_size);
e84db124cb2158b Syed Saba Kareem 2023-10-21  222  				buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
e84db124cb2158b Syed Saba Kareem 2023-10-21  223  				config_pte_for_stream(adata, stream);
e84db124cb2158b Syed Saba Kareem 2023-10-21  224  				config_acp_dma(adata, stream, buf_size);
e84db124cb2158b Syed Saba Kareem 2023-10-21  225  				if (stream->dai_id)
e84db124cb2158b Syed Saba Kareem 2023-10-21  226  					restore_acp_i2s_params(substream, adata, stream);
e84db124cb2158b Syed Saba Kareem 2023-10-21  227  				else
e84db124cb2158b Syed Saba Kareem 2023-10-21  228  					restore_acp_pdm_params(substream, adata);
e84db124cb2158b Syed Saba Kareem 2023-10-21  229  			}
e84db124cb2158b Syed Saba Kareem 2023-10-21  230  		}
e84db124cb2158b Syed Saba Kareem 2023-10-21  231  	}
e84db124cb2158b Syed Saba Kareem 2023-10-21  232  	spin_unlock(&adata->acp_lock);
e84db124cb2158b Syed Saba Kareem 2023-10-21  233  	return 0;
e84db124cb2158b Syed Saba Kareem 2023-10-21  234  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

