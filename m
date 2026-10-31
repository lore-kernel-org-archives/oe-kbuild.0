Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793454539;
	b=uy+mNmwimz5t9B4wGAe18aYmeWaJyNKPfhZjAeZAw/VftCndEzL/XzjM6GTUYm4eloMa
	 GNE3QtMtoExI+Ab9kYKcmSaK/j1fcViK9ArG9gZe2RSuOJuWz5JSavnUxhCmZa9X+lEk3
	 rfRkuzJNYhmWEZKcBEqlXIVEK+6z2eI+/oSCbIAiXaOOIkfCOyaiec9x6QExakPRtfbyl
	 wDX7I6dOMzfgXDA7lTHlWhKvtGPxWBecaADy2+SKN7JJ428c2f/tvg0mMMqq1FOgamCIg
	 5pyCJ2mEVyw4ZIEJMSb7MJHLOwR9azqgGhlgXfLPjSQQ6/+NrqMx8/tY6+rzjtkxPRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Xx9SCThQoWYYGzLXN5QVW157HMKSdqxGmw557uxzfq0=;
	b=SzaFHabwEyTIbZl+X8zn8t2zFlzZauH5dls4nC+qkJcaWjB+PUg2dTWndtiLqAVHPthd
	 y3aggDsxqFID+vrcI+wJTVSghE4B+g6gS22Rz3YRu4kKRct1//VqfmgtmZB8O1Jo1/i7b
	 cvwDVzzdXkO97B7ai16RqkWYyDQQcph0bIw9LyMiwKmSb2MVxc7kuxNrS8VLmVPuYKqve
	 6/d6NGuD/DNwKpS0MpUWyImI0bRleVU3BFkaVBbpOl33BOlqCt72D8PKHekH4cBKJZ/k6
	 mZhScRkgioUYUful7w4OFrBUPCUs5l4tCud2ipaGjxn92NyRuTTAnwk1tgHNFM1wFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVTFYAmj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574D606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 13:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8574D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVTFYAmj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so14092805e9.0
        for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454538; x=1794059338; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xx9SCThQoWYYGzLXN5QVW157HMKSdqxGmw557uxzfq0=;
        b=jVTFYAmjwFVkRZk+LX+sJxkGCgKiU4pFrXfEO31yWxIXXigQ1CFxSs6bje1ddSxZIY
         Z2nC1WnPrZ79K/MI1w5N+fDTINAGCrAlra5Aj3G48b/5+a7SpmGSGZAGOPN9XroYoDcz
         fyl2KhAMm8gyykTR7k226lMDY9md66WScoankr8O7EpA1MDuF+piDj+9HInFsxT1t/vC
         wUtF2gYomLSIteJJU0GXnrXCcXsx4lIgT3kCwtyR/8m1pYFjCBDH9SpclUh+wvITEL49
         SWsTv9KXIhsmhjF/Y9pHkUFNEKQyr10S+Krrl4CKDOZ3wZ+1yhX8gOts10L7SvI9q018
         JAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454538; x=1794059338;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xx9SCThQoWYYGzLXN5QVW157HMKSdqxGmw557uxzfq0=;
        b=GiqOHPjNQXka4N8CR4DcVLNrL1VCkuB7Czrf9Kub+rv5LHRSdNYshDOD54swrVaQhj
         fPOuzK3KVIR4RtiMjc/171lAs8dqEcLhT3HEMV8OvyPbKbeSR9qEURCmr22VLe1vVCvn
         hnzLnVBhy+oRKbDMlVVBRVXgfHtP0yj7BsACr8JiokqBsHx2suH5jn/1kqxZVBiy1gd7
         wgDr5ueMV6BP1lqrbLIODoacdvkiwwTjo0v7HHSeeIbltiXxf0IdO58tfffw3SF1sUNN
         IQal0RbI2dfEgTA7EU72KJ1xFPZL19v1s34Feo1koJDETeYXNdDVjTlm6F5HqN8wFUUV
         UrmA==
X-Gm-Message-State: AFq9FYL2oQAebuoZYUVgRt0RI241KiYXW49UGAlBY527lU5raTrhhakD
	ohuAfB4l+U1a/l71U4Hv/l+SJjy4+PwR9kSYO4RIQc7MCWqTdaA/MRteGD5xLxW2jA11VYu5
X-Gm-Gg: AYBFou2gXK6X3Hn+o6czS50RN7skhwMvdqwBioAsgzvq/uzD8d5q+PU4UzFDZjaP5N5
	xKA3MdJglO/TmhFPEJcUIzwrGAkIHvUaS5LTZK9qcTximHlHYC9g07TZOhk+vwzabYQJw8qlbTv
	r8Sy32I5fqemFCNDm4O4pmTI2yo1aTHRX3TXdGk+5vJUPFr/KN7LeVl3xFCxgwGBKYLfs6b+v9/
	cbUExkQaseHXA67L7WLmsyX1aNDlrunFl+1xOHKm9yup3kImVdoHtzuY/X1zSYz3VBn1f595yG8
	0HoaO0w15Pc2RPttI+Jhj1wogVahzU2MSYesCuVwBYNuMvkj9a5NrfFFmm5XxcMcmWh9RWEske3
	DBD0jAn9JD+lZDbbE7a2iU0SsTe5E0EXpcWrjDZdjNNGTP3tZBxKYI1XlnlENI3Aif9VTpAX2rV
	Dq5khX/hcxncSfpg3qf8fof4pB3sCaTMd/FDoQTttdOIShC1Zo7/ZOn6K6C6KuEC4I17m5xpqpQ
	euUk+o/wVTiCNDesrzznTxpwRqSek9+oPPSDFh/lzZ8RCump7OkPkabq74Xbn7fkr1w/gS4kcvd
	8T6rDMJ2d72aHvIbM7+dZg7go9yNJYiCHnXKCUV47z/CjwiLG09ia7XuJEg+MBZpyCK8kLxmXHB
	bMy3gt8eI7M8LQjCyHAY9gC8mXNZoB1uzscPlhaZD7PSNQCF/eaD6Yts0dvmnZeOcb19FwvkQ5C
	2C/0/DoqoVRifp
X-Received: by 2002:a05:600c:4e08:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4ac17287d04mr128220335e9.9.1793454537710;
        Sat, 31 Oct 2026 06:48:57 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm207013265e9.14.2026.10.31.06.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:48:56 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:48:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-30 221/343]
 sound/soc/codecs/sn624x-sdca-sdw.c:884 sn624x_jack_rpm_put() warn: variable
 dereferenced before check 'sn624x' (see line 882)
Message-ID: <202610311423.8OfajSb6-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261031134852.eZgEHfkSHkhcYQrmHpGo7uMhWct1G5738SOAQWJaAEg@z>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-30
head:   09f1a103b1f1ef745ade1826d62438261db56245
commit: 29e4cb0a2a9fbfe750da9e9f826e5273b2795f96 [221/343] dai
config: csky-randconfig-r2201-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311423.8OfajSb6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610311423.8OfajSb6-lkp@intel.com/

smatch warnings:
sound/soc/codecs/sn624x-sdca-sdw.c:884 sn624x_jack_rpm_put() warn: variable dereferenced before check 'sn624x' (see line 882)

vim +/sn624x +884 sound/soc/codecs/sn624x-sdca-sdw.c

12d9c9f8679c56 Qianghua Wang     2026-09-01  880  static void sn624x_jack_rpm_put(struct sn624x_sdca_priv *sn624x)
12d9c9f8679c56 Qianghua Wang     2026-09-01  881  {
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27 @882  	struct device *dev = snd_soc_component_to_dev(sn624x->component);
                                                                                                      ^^^^^^^^^^^^^^^^^
New dereference

29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  883  
12d9c9f8679c56 Qianghua Wang     2026-09-01 @884  	if (!sn624x || !sn624x->jack_rpm || !sn624x->component)
                                                             ^^^^^^
Old code had a check for NULL.

12d9c9f8679c56 Qianghua Wang     2026-09-01  885  		return;
12d9c9f8679c56 Qianghua Wang     2026-09-01  886  
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  887  	pm_runtime_mark_last_busy(dev);
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  888  	pm_runtime_put_autosuspend(dev);
12d9c9f8679c56 Qianghua Wang     2026-09-01  889  	sn624x->jack_rpm = false;
12d9c9f8679c56 Qianghua Wang     2026-09-01  890  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

