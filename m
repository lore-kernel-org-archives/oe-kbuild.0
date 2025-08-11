Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF522D8793
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 07:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896982; cv=none; b=rMNkbLmwFxQ1FO0PJFmNMTh7E0NvVkqP1E+OnmeJplWmoi3GV3U7x4JY/lnJUdpuFHscy2dMeFK2Aq+oQ31vlTVwLWDHy0Egruy4uS+f+lgDku+V96YfOCtwc3GOFr3b+kn82W7RuUYs3asl67lwHsJEvB4fXzh/7/0C/FdpY18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896982; c=relaxed/simple;
	bh=woCVrO6dhn36cDQiOC9fdB3hQgbbHDv9+bAvf2a9r+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=paZAwtmJo1FqOjo92F7T/LGm+nHx/SP8bFGDNkcBzUFe0y1TGN7Dqsb5A2NERq5T5CNDW1bdV8nqfFJ9MThbz/bNkDHAP2FugDJSB2CD27y4i3TlmevapGN82mEF++nrFE1/f/W/oqyG1bMNVa/EcgkDIsuDpDJzx/dvvYYzu98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FRrBg3w5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRrBg3w5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so36175165e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 00:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754896979; x=1755501779; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+z/+R7oU33VDJzw/HRlzRxAxOu1KhJaIdsYxJlphmE=;
        b=FRrBg3w5o6ZR/9M6fHPsYDaO7vAzwSrqP+gQ5Elp9/FxaiLaPjjwirFmbF8AGgOlCu
         f7Tkg1tzK3V3id2vL9uZWkk93w6tZHnhYxJZifIjh+ZtoCbHKmE4zhKy100qtFQFUlq9
         UGmtuxRaDtqbUR2hZqNFWtgamqYv9qn0aiJ0Tf+6uHwk1eDR7puNJS2MmXH1rrH06ZBG
         WygTNNmhyxvMjcNs3N8TafqpHUcLTVo0B6xbxI+ZePVEWSnYyIph7OV25rK8ZOkxE+Lt
         qMYeHwcUT55jJYVPMa3hU8ZUJXZBRNEDaZGvxAK/LD3/emzzh0uV2skSdRuzw35dM/yC
         Ku8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754896979; x=1755501779;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+z/+R7oU33VDJzw/HRlzRxAxOu1KhJaIdsYxJlphmE=;
        b=MOAVkdvzvHIPOTnhZq4HuwcuY5IkEokF7bWR7OF+PBxHSTDgrYjxL7wuI1HSM/8k7s
         cVt/vvOc0r+BPVgGZF4ba8qi6iKD76hd2RWW2KB9dsNiWttTHX/cQ83u7TRmU1DtKkIF
         i+lGFBptHRyPcHus8JQ9Zcugr5kWr/K5FyPiZH79r4u7gnY5hPK98zDCLBZo/6GF1YwX
         hX8ZZPNR0/YcR/EuB1dGcBJ29nkzeR0aNOixPzQjKov5+XnqpEVdheFhVja+BloNOqPr
         U2IV0reoHIsggwuug2oprVtWj2I17GCAez7vBo5Fzkrz3tVYm3r2otrKBEfkj4P20ReH
         w2xg==
X-Gm-Message-State: AOJu0Yzqtw4ntJTnbd6dhDjv+Z+oQMDOm9bHX/Ee67GcTCZBtPNF0C58
	q70dal4jFxgVuBJmP/BbrBDszK4h+D0zQtOo9wSvWA6v4mQ1fAbVHazUF69fbr+AgtOaDEDmHUZ
	U4vLa
X-Gm-Gg: ASbGncsGcF8xNvjPjlHvUNA6paVjLBF+0SGYpnvfMCJ4CpfsR7Pm6Ic/cAYytAhIWPD
	vKTJr/ZZJSgxr5jBFXsuvkielRTr5mGbOZPaIiI/FFUXU4STb2TXsj6lnVz+/1wS8pg2wu4qTKx
	TxKvWCVJdUS6TgK4cj88UHOy7hLQR58CjqpuxcAgAiFAe0QTFBpTaysMbLalxpYu91E9Fv19CUB
	Do3a1n9eFpFFHetM8fOpqR78IPfbl/45jb/vC6SP2rJ0ukgzg9QLKnClrIXUg/KfmKEP+C5NiPe
	Em99X0Cd2rlWAo/zSVc/ExjcZ2IFQDWa/+96k9Jvd7/ditlVsFMxU1GqsLixEAqjFxZVGKaXfg4
	tRAZ3Q1wdROoA6CL7h3RNfRK2Iog=
X-Google-Smtp-Source: AGHT+IGszvzzpERaF/8oDL3FMMeG6zVxZk3f09zF1ZZQb2aBJTeLaPBC4BxqvyU1hoPCSHv7KDXCMg==
X-Received: by 2002:a05:600c:1e8b:b0:456:f9f:657 with SMTP id 5b1f17b1804b1-459f4faccd5mr99727255e9.27.1754896978920;
        Mon, 11 Aug 2025 00:22:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e78a35cdsm118970895e9.3.2025.08.11.00.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:22:58 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:22:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Yang <mmyangfl@gmail.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Yang <mmyangfl@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] net: dsa: yt921x: Add support for Motorcomm YT921x
Message-ID: <202508110116.NWcO7Fju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808173808.273774-3-mmyangfl@gmail.com>
Message-ID: <20250811072255.OyAh-mJU6HkDOCU-9HP6QZqFzS04yXAoLhgmD26xESc@z>

Hi David,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Yang/net-dsa-tag_yt921x-add-support-for-Motorcomm-YT921x-tags/20250809-014351
base:   net/main
patch link:    https://lore.kernel.org/r/20250808173808.273774-3-mmyangfl%40gmail.com
patch subject: [PATCH 2/2] net: dsa: yt921x: Add support for Motorcomm YT921x
config: um-randconfig-r072-20250810 (https://download.01.org/0day-ci/archive/20250811/202508110116.NWcO7Fju-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508110116.NWcO7Fju-lkp@intel.com/

smatch warnings:
drivers/net/dsa/yt921x.c:1090 yt921x_dsa_setup() error: uninitialized symbol 'val'.

vim +/val +1090 drivers/net/dsa/yt921x.c

77de450829a940 David Yang 2025-08-09  1061  static int yt921x_dsa_setup(struct dsa_switch *ds)
77de450829a940 David Yang 2025-08-09  1062  {
77de450829a940 David Yang 2025-08-09  1063  	struct yt921x_priv *priv = ds->priv;
77de450829a940 David Yang 2025-08-09  1064  	struct device *dev = priv->dev;
77de450829a940 David Yang 2025-08-09  1065  	struct device_node *np = dev->of_node;
77de450829a940 David Yang 2025-08-09  1066  
77de450829a940 David Yang 2025-08-09  1067  	struct device_node *child;
77de450829a940 David Yang 2025-08-09  1068  	int cpu_port;
77de450829a940 David Yang 2025-08-09  1069  	u32 val;
77de450829a940 David Yang 2025-08-09  1070  	int res;
77de450829a940 David Yang 2025-08-09  1071  
77de450829a940 David Yang 2025-08-09  1072  	res = yt921x_dsa_cpu_port(ds, &cpu_port);
77de450829a940 David Yang 2025-08-09  1073  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1074  		return res;
77de450829a940 David Yang 2025-08-09  1075  
77de450829a940 David Yang 2025-08-09  1076  	res = yt921x_detect(priv);
77de450829a940 David Yang 2025-08-09  1077  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1078  		return res;
77de450829a940 David Yang 2025-08-09  1079  
77de450829a940 David Yang 2025-08-09  1080  	/* Reset */
77de450829a940 David Yang 2025-08-09  1081  	res = yt921x_smi_write(priv, YT921X_RESETm, YT921X_RESET_HWf);
77de450829a940 David Yang 2025-08-09  1082  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1083  		return res;
77de450829a940 David Yang 2025-08-09  1084  
77de450829a940 David Yang 2025-08-09  1085  	/* YT921X_RESET_HWf is almost same as GPIO hard reset. So we need
77de450829a940 David Yang 2025-08-09  1086  	 * this delay.
77de450829a940 David Yang 2025-08-09  1087  	 */
77de450829a940 David Yang 2025-08-09  1088  	usleep_range(10000, 15000);
77de450829a940 David Yang 2025-08-09  1089  
77de450829a940 David Yang 2025-08-09 @1090  	res = read_poll_timeout(yt921x_smi_read, res, val == 0,
                                                                                              ^^^^^^^^
yt921x_smi_read() doesn't necessarily initialize *valp.

77de450829a940 David Yang 2025-08-09  1091  				YT921X_MDIO_SLEEP_US, YT921X_RESET_TIMEOUT_US,
77de450829a940 David Yang 2025-08-09  1092  				false, priv, YT921X_RESETm, &val);
77de450829a940 David Yang 2025-08-09  1093  	if (unlikely(res != 0)) {
77de450829a940 David Yang 2025-08-09  1094  		dev_err(dev, "Reset timeout\n");
77de450829a940 David Yang 2025-08-09  1095  		return res;
77de450829a940 David Yang 2025-08-09  1096  	}
77de450829a940 David Yang 2025-08-09  1097  
77de450829a940 David Yang 2025-08-09  1098  	/* Always register one mdio bus for the internal/default mdio bus. This
77de450829a940 David Yang 2025-08-09  1099  	 * maybe represented in the device tree, but is optional.
77de450829a940 David Yang 2025-08-09  1100  	 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

