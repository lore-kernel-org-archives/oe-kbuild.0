Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572504;
	b=vdAePNmP6Y//zOjJmMJs69HGYMp7IDax1jCu8B2yDXCsA3pwDlgeBvf7sdpHt6V2Utu9
	 95wLQ9RdZBYbw4upUsrsttA9fEI28HpmGYDE6mlA8cfHvQgie3aU9QeEx+DAgjVvb7DLz
	 c9AbZolGDwQGwxNLQMdY+1VYwQbJnxaZXLUZJqedLQmG32+aLugIyH6rPbsrBGVlYFhdO
	 CWDohg+yehKtgiZHEqLkTfgAISZp/nCMeXcMfjg0XwUcyFbLsfSKfE4onLUAwx1zsNFXx
	 oqZYSzK5xlVsoC5VLnVTnE/OY7k/DRCzkRhj4qQity7RskUNopxUEHcnf46Vrt9B8VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=WQEazG5lwx/yGmxmxj+KfS8sarmZMLT83W/zazuaHx0=;
	b=IpdU7JyPZdf7ENMdZX7ZwTrrGYMTtbThhjaG3Wdp2Lpfxuud7t8qffltVHK2l8cA3lKb
	 96Tkp4o5lOLMYgDqJevB+Yt09hhe67tC5W201VVKdshuXIQr2jpyW3ZLpcuSHJLc61j3u
	 wvYyakM7r16nuAvT2Cv3+gzBX1ntwW9DFyjFI7+MQwXOsJGFzYhY/GPGhQZXy52kXJDao
	 fj26/PlG3fhE5CiT9Li9YTbMvLwAozHWmWV/i3Nw2H/5j6phC2lmHMFYyoUBh+ImrsYnD
	 StJEGtsjQTWR/qXp1srbaeLMwWH5ZOJS94SZ8oyJGcszIpQcTA/9QByvsfaRiXYD3/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQlg12Su;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB1760A3802
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 12:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB1760A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQlg12Su
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso481030f8f.1
        for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 04:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794572503; x=1795177303; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQEazG5lwx/yGmxmxj+KfS8sarmZMLT83W/zazuaHx0=;
        b=iQlg12SuSTaXiujdVD5tw1LVOCufvCl7Qs17NnQmIOcBrGHCg6CMkx+DTDT7zIFL3m
         ZjEs/epqs7eIktY3spGSzDbdT5iepUCacT6lPsfoKQDqtkZ5g5RBnwIsGi30K33Vbl70
         wkmddBhfPxebF0TNvfgzI+kGbSxjYc2tMzGPhntD6HtD7gg5ghtMXIvGHyk6OW8/pSmL
         gXyj6V+L7lqSOTZzBtPaPDuoBRH9NSDFDwcpF9ZpoKGquWNQtltBT4QOWL4k+RPb4WfS
         EoIZu7k0dbKA/CKOYu1IASk+/CYPFh2++BfK5813JQadUHP4AyZiFXY3k4mOtDJQP3tm
         Uo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572503; x=1795177303;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQEazG5lwx/yGmxmxj+KfS8sarmZMLT83W/zazuaHx0=;
        b=eCuu+w1/Q1IcqftnPsu6cvVS8cgTeZzlmnNM83MTygdqga9/FbglN49KoDYv5RaIzo
         WKWhZWaMDKyrWrf6Nb+O5vjwf3rsiHgKLi8tsYJmrFnZWi6+t3j4zWa0q1TjbxCv0fLk
         42NISiU/0vaztBq3yPaKj7uQFTqj7GsZsugxVyPO0hc2iuHO32zpmhNWGkp7W9YZm8Uk
         UV7WOV01wQJZ+c4lGPwjxiNADp5+PLhY2qB+f/m2tO/b/dVplgjnE7JSb4L0pPFRpLj2
         1Ig02Czs3oqf2Ziycl67fo3oErt5XwY0696R05H+f0RPF8ay2PKHuisAf27Azfr99DxD
         PVyw==
X-Gm-Message-State: APuU4Z/dIrr9pV0lzvaXCoSHecgqSVgBP9XsSEHnjLpwvuCqiU5b8gyh
	zQPS6sLr+5D+9LlCKU/cfFSbijnPj21NMjEw0yVh8dDfbthJfsWD8qb4+VQYw7B5BkI2asvA
X-Gm-Gg: AYBFou1G1YLSovTo5U0o+6BLTgBhf3jvjwUqH+rR42bNlSS97C/uotd6ytmkQcJ7D3h
	oysr6xfKg9vDozliYxFFD1LymsgdifVoZJMSoxwt3Iyjz7cPb7B/htyTRq9lz6UPQ00qv9UvbOE
	H8vNIYAMnVAALE2Z6cZko5KWjpHqaO/qUv6JXeDDG9CFIkXF0HuULKfNtAL2VpbE4sem+PNg7BK
	n1FWzIMqqdptcCOVc36pWXG0zkwdjOs8Uji9VFa51Aa1Uz0hM1Z3M4QUWKpF5NuESaWFvrFXH6K
	O6Gw8TRaLT1jlrfrm4v4nF36khGHl4JFh4FVqkUT1C8EyfxU9VvU1B4zXJK5xQISGiUeU7fk9LY
	OKZ1V0hhmikg7siJkLLtrLeRlax99eeL6NG2vqnQu5RfqG2ZW9Yz1PrODIq+a+Ct4aIpdMRM8oA
	XLoWCJH6GvINxRd+T/pbFX0uAEx2eKf5ALMXmPfSzKd0dY1dXDZOUbkLWDSs7kLaO+vxX84j8wM
	qEiHlPdWA4TPFl/IiBLufXDvCvnOy57+oeZHx1bqXfRbLklyJtO42c/PFTtSdtzGvwqOWAlUYVJ
	hnSgX6Sgxv6JkvwWE/bmVX9j2vgQOPww8yCfKkMf20dNo9jVmcwRt7a1ISVy8zcb4xmTTOKM8hP
	OSEeVoPRBm4fIW1dWZMHyhXEH1G5YAXGNGkG48ed2iDnMPR2EKufzfJM9lcH6YTDXS0PVvDwWrM
	t55an8lRsxgQJ8
X-Received: by 2002:a05:6000:29ce:b0:492:9c9:65de with SMTP id ffacd0b85a97d-49c6f5e833bmr3959646f8f.5.1794572502418;
        Fri, 13 Nov 2026 04:21:42 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm7560175f8f.44.2026.11.13.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:21:41 -0800 (PST)
Date: Fri, 13 Nov 2026 15:21:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 432/438] drivers/fpga/fpga-region.c:65
 fpga_region_get() warn: variable dereferenced before IS_ERR check 'region'
 (see line 57)
Message-ID: <202611131301.NSbZ3bLn-lkp@intel.com>
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
Message-ID: <20261113122138.oUZf0S-pWEuF1F6dtwfvVIq0kAxlSO0N7IlBJt2Fr1Q@z>

tree:   https://github.com/bvanassche/linux thread-safety
head:   8ea0e62cf4d68a895e3152c92a5f6ead6d5c9554
commit: 67c65b05abaf7a89e1e4f8ed3033513d6053a749 [432/438] treewide: Replace __context_unsafe() with precise lock annotations
config: arm64-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131301.NSbZ3bLn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611131301.NSbZ3bLn-lkp@intel.com/

smatch warnings:
drivers/fpga/fpga-region.c:65 fpga_region_get() warn: variable dereferenced before IS_ERR check 'region' (see line 57)

vim +/region +65 drivers/fpga/fpga-region.c

0fa20cdfcc1f68 Alan Tull       2016-11-01  46  static struct fpga_region *fpga_region_get(struct fpga_region *region)
67c65b05abaf7a Bart Van Assche 2026-11-03  47  	__cond_acquires_err_ptr(&region->mutex)
0fa20cdfcc1f68 Alan Tull       2016-11-01  48  {
0fa20cdfcc1f68 Alan Tull       2016-11-01  49  	struct device *dev = &region->dev;
0fa20cdfcc1f68 Alan Tull       2016-11-01  50  
0fa20cdfcc1f68 Alan Tull       2016-11-01  51  	if (!mutex_trylock(&region->mutex)) {
                                                                   ^^^^^^^^^^^^^^

0fa20cdfcc1f68 Alan Tull       2016-11-01  52  		dev_dbg(dev, "%s: FPGA Region already in use\n", __func__);
0fa20cdfcc1f68 Alan Tull       2016-11-01  53  		return ERR_PTR(-EBUSY);
0fa20cdfcc1f68 Alan Tull       2016-11-01  54  	}
0fa20cdfcc1f68 Alan Tull       2016-11-01  55  
0fa20cdfcc1f68 Alan Tull       2016-11-01  56  	get_device(dev);
b7c0e1ecee403a Marco Pagani    2024-04-19 @57  	if (!try_module_get(region->ops_owner)) {
                                                                    ^^^^^^^^^^^^^^^^
Dereferences

0fa20cdfcc1f68 Alan Tull       2016-11-01  58  		put_device(dev);
0fa20cdfcc1f68 Alan Tull       2016-11-01  59  		mutex_unlock(&region->mutex);
0fa20cdfcc1f68 Alan Tull       2016-11-01  60  		return ERR_PTR(-ENODEV);
0fa20cdfcc1f68 Alan Tull       2016-11-01  61  	}
0fa20cdfcc1f68 Alan Tull       2016-11-01  62  
c3d971ad32fc19 Alan Tull       2017-11-15  63  	dev_dbg(dev, "get\n");
0fa20cdfcc1f68 Alan Tull       2016-11-01  64  
67c65b05abaf7a Bart Van Assche 2026-11-03 @65  	if (IS_ERR(region))
                                                            ^^^^^

67c65b05abaf7a Bart Van Assche 2026-11-03  66  		unreachable();
                                                        ^^^^^^^^^^^^^
You're presumably testing out a static checker I guess?

67c65b05abaf7a Bart Van Assche 2026-11-03  67  
0fa20cdfcc1f68 Alan Tull       2016-11-01  68  	return region;
0fa20cdfcc1f68 Alan Tull       2016-11-01  69  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

