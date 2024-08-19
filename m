Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B4B13B79F
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Aug 2024 05:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724044526; cv=none; b=OGX60seb2ziPIHcy85SXcejWaw1I2TQZ2b43nVuUsWOUzThzWhePwpKg3wmHmie0w/0IwRqlbk+3bgrAIqup1doxUjkI339H2w2h7XPY0qQHCwFeUQXE93g3NCBSyHlRSCDCYOoUZwwfVx/nNzsoYZPj+FmSc9G0/vFHqdsq4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724044526; c=relaxed/simple;
	bh=FzZ4qlTaecWigV2DrkStJcoD+p2S6ozkt6fRhnLY/NY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mSI3kZXgLKp9c2+gnc6TcL596hCNvNJ+Ol01o0njhmG4hPOwuBm7Xd5H2tgDt0OZGu60jmNBQMIwZOrSsbc0tMa2watvMqAsIvNoacdAiE0BTId8kVMqIN8BRoLtDAMx0/IR7vy1JpgOSp63Ytz+KpMpZV35hysc276p+SsCKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mbCJIVGr; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mbCJIVGr"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bef4d9e7f8so918864a12.2
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Aug 2024 22:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724044523; x=1724649323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr+CkCtT9RBXFTknHXbuRcbqHxZSSmq0kp0BMXuDtKM=;
        b=mbCJIVGrSxSjXJmt/CF3J2RbFw9u5X44FJwCq/Zgob3IeCeqcnX0kTGHfonG0QaZMf
         SCeKyUWszwBuLh4bVzBUGYYk3JhtT9Ckw24VpRTRzjPLt3t7L3Ef+9ScnOEVJ0uqZDxM
         mwpzFyVmLN3pSpvA9pfNva3TKUIl8fwYGudU+9ta9880pApiKlZsM/m6OwLTgdgPZ7IP
         m4eZ4p/aiWkHjW+MlylQ6PHWbfgSu4WUj+7znW00AzCo1bY5MsOnqeLNrFANjd2zir8u
         VUX+zIjWTj+V7d6iwhl9HUpvQuO9oeMmjENdB/K+wUvYj+xlh5qieeFQ+FEjEjCryDry
         y4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724044523; x=1724649323;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tr+CkCtT9RBXFTknHXbuRcbqHxZSSmq0kp0BMXuDtKM=;
        b=mI/mNeZR5/FrglLAuWl6n333gKwIAN9VKA0WCe6zXfn8eah96rY3N1ozD2CZt/BAAX
         YeJZwPlEwN/5CYMnu5zzDXYV3eSjUTNpDMTMlLNuWC5/tnot66D3iBJjzhOVpzCNCQJS
         Kjx+bODZOkRVedy5uZ2dtTXnEbnhdIrM12ip1kpvRB8h7Sl1P8vnGG1t6q0WQXsBxluC
         g/5tM/8FJUvL/f9I1OkBgBfsdin/PR2HWFDLgucfqJkrdQrP1Mv3B87vrUo1762Geqxw
         2AAqb/Q691ENlFHCRkLxaqzcRek8AzS0Q6MuhNHuvPQ3JPF6uSp3yXqWG8qHD5Hfhdln
         ggvw==
X-Gm-Message-State: AOJu0Yzex20VC9fMiFiLv6ZSgdX2Esu0aKSq6kGmdDYMynE4W/TCFUn7
	W7lGTxW/0nzuCWWnmd56PRgskopCf7Ie+UUkTdsqrhRqwjk8yXxBfGF1z+Pp8WV3f3cTNIlO77y
	g
X-Google-Smtp-Source: AGHT+IFpne2BuJmP7Itk6Z3q4Ea3k+P1Zu52GLijC8YDFNurZocTQQ6/oQutMR0qvEwq2dKko+7VxQ==
X-Received: by 2002:a17:907:e2dd:b0:a7a:aa35:408d with SMTP id a640c23a62f3a-a839292f832mr612481366b.20.1724044522456;
        Sun, 18 Aug 2024 22:15:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfa18sm591512366b.73.2024.08.18.22.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 22:15:21 -0700 (PDT)
Date: Mon, 19 Aug 2024 08:15:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Parshuram Thombare <pthombar@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 10/11] i3c: master: svc: wait for Manual ACK/NACK Done
 before next step
Message-ID: <fb18343b-9941-4acc-b0bb-f7cd58d3fde3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813-i3c_fix-v2-10-68fe4a050188@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-master-Remove-i3c_dev_disable_ibi_locked-olddev-on-device-hotjoin/20240814-234209
base:   41c196e567fb1ea97f68a2ffb7faab451cd90854
patch link:    https://lore.kernel.org/r/20240813-i3c_fix-v2-10-68fe4a050188%40nxp.com
patch subject: [PATCH v2 10/11] i3c: master: svc: wait for Manual ACK/NACK Done before next step
config: x86_64-randconfig-161-20240817 (https://download.01.org/0day-ci/archive/20240818/202408180012.ifcIOjgX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408180012.ifcIOjgX-lkp@intel.com/

New smatch warnings:
drivers/i3c/master/svc-i3c-master.c:1165 svc_i3c_master_xfer() warn: missing error code 'ret'

vim +/ret +1165 drivers/i3c/master/svc-i3c-master.c

dd3c52846d5954a Miquel Raynal 2021-01-21  1123  static int svc_i3c_master_xfer(struct svc_i3c_master *master,
dd3c52846d5954a Miquel Raynal 2021-01-21  1124  			       bool rnw, unsigned int xfer_type, u8 addr,
dd3c52846d5954a Miquel Raynal 2021-01-21  1125  			       u8 *in, const u8 *out, unsigned int xfer_len,
6fb61734a74eaa3 Frank Li      2023-12-01  1126  			       unsigned int *actual_len, bool continued)
dd3c52846d5954a Miquel Raynal 2021-01-21  1127  {
2d15862dfba6bf1 Frank Li      2024-06-03  1128  	int retry = 2;
dd3c52846d5954a Miquel Raynal 2021-01-21  1129  	u32 reg;
dd3c52846d5954a Miquel Raynal 2021-01-21  1130  	int ret;
dd3c52846d5954a Miquel Raynal 2021-01-21  1131  
5e5e3c92e748a6d Frank Li      2023-10-23  1132  	/* clean SVC_I3C_MINT_IBIWON w1c bits */
5e5e3c92e748a6d Frank Li      2023-10-23  1133  	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
5e5e3c92e748a6d Frank Li      2023-10-23  1134  
2d15862dfba6bf1 Frank Li      2024-06-03  1135  
2d15862dfba6bf1 Frank Li      2024-06-03  1136  	while (retry--) {
dd3c52846d5954a Miquel Raynal 2021-01-21  1137  		writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
dd3c52846d5954a Miquel Raynal 2021-01-21  1138  		       xfer_type |
dd3c52846d5954a Miquel Raynal 2021-01-21  1139  		       SVC_I3C_MCTRL_IBIRESP_NACK |
dd3c52846d5954a Miquel Raynal 2021-01-21  1140  		       SVC_I3C_MCTRL_DIR(rnw) |
dd3c52846d5954a Miquel Raynal 2021-01-21  1141  		       SVC_I3C_MCTRL_ADDR(addr) |
6fb61734a74eaa3 Frank Li      2023-12-01  1142  		       SVC_I3C_MCTRL_RDTERM(*actual_len),
dd3c52846d5954a Miquel Raynal 2021-01-21  1143  		       master->regs + SVC_I3C_MCTRL);
dd3c52846d5954a Miquel Raynal 2021-01-21  1144  
dd3c52846d5954a Miquel Raynal 2021-01-21  1145  		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
dd3c52846d5954a Miquel Raynal 2021-01-21  1146  				 SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
dd3c52846d5954a Miquel Raynal 2021-01-21  1147  		if (ret)
dd3c52846d5954a Miquel Raynal 2021-01-21  1148  			goto emit_stop;
dd3c52846d5954a Miquel Raynal 2021-01-21  1149  
28a9dc69921b36a Frank Li      2024-08-13  1150  		/*
28a9dc69921b36a Frank Li      2024-08-13  1151  		 * According to I3C spec ver 1.1.1, 5.1.2.2.3 Consequence of Controller Starting a
28a9dc69921b36a Frank Li      2024-08-13  1152  		 * Frame with I3C Target Address.
28a9dc69921b36a Frank Li      2024-08-13  1153  		 *
28a9dc69921b36a Frank Li      2024-08-13  1154  		 * The I3C Controller normally should start a Frame, the Address may be arbitrated,
28a9dc69921b36a Frank Li      2024-08-13  1155  		 * and so the Controller shall monitor to see whether an In-Band Interrupt request,
28a9dc69921b36a Frank Li      2024-08-13  1156  		 * a Controller Role Request (i.e., Secondary Controller requests to become the
28a9dc69921b36a Frank Li      2024-08-13  1157  		 * Active Controller), or a Hot-Join Request has been made.
28a9dc69921b36a Frank Li      2024-08-13  1158  		 *
28a9dc69921b36a Frank Li      2024-08-13  1159  		 * If missed IBIWON check, the wrong data will be return. When IBIWON happen, issue
28a9dc69921b36a Frank Li      2024-08-13  1160  		 * repeat start. Address arbitrate only happen at START, never happen at REPEAT
28a9dc69921b36a Frank Li      2024-08-13  1161  		 * start.
28a9dc69921b36a Frank Li      2024-08-13  1162  		 */
28a9dc69921b36a Frank Li      2024-08-13  1163  		if (SVC_I3C_MSTATUS_IBIWON(reg)) {
4809f19e89760fb Frank Li      2024-08-13  1164  			if (svc_i3c_master_handle_ibi_won(master, reg))
4809f19e89760fb Frank Li      2024-08-13 @1165  				goto emit_stop;

Does this need an error code?

28a9dc69921b36a Frank Li      2024-08-13  1166  			continue;
28a9dc69921b36a Frank Li      2024-08-13  1167  		}
28a9dc69921b36a Frank Li      2024-08-13  1168  
49b472ebc61de3d Clark Wang    2023-05-17  1169  		if (readl(master->regs + SVC_I3C_MERRWARN) & SVC_I3C_MERRWARN_NACK) {
2d15862dfba6bf1 Frank Li      2024-06-03  1170  			/*
2d15862dfba6bf1 Frank Li      2024-06-03  1171  			 * According to I3C Spec 1.1.1, 11-Jun-2021, section: 5.1.2.2.3.
2d15862dfba6bf1 Frank Li      2024-06-03  1172  			 * If the Controller chooses to start an I3C Message with an I3C Dynamic
2d15862dfba6bf1 Frank Li      2024-06-03  1173  			 * Address, then special provisions shall be made because that same I3C
2d15862dfba6bf1 Frank Li      2024-06-03  1174  			 * Target may be initiating an IBI or a Controller Role Request. So, one of
2d15862dfba6bf1 Frank Li      2024-06-03  1175  			 * three things may happen: (skip 1, 2)
2d15862dfba6bf1 Frank Li      2024-06-03  1176  			 *
2d15862dfba6bf1 Frank Li      2024-06-03  1177  			 * 3. The Addresses match and the RnW bits also match, and so neither
2d15862dfba6bf1 Frank Li      2024-06-03  1178  			 * Controller nor Target will ACK since both are expecting the other side to
2d15862dfba6bf1 Frank Li      2024-06-03  1179  			 * provide ACK. As a result, each side might think it had "won" arbitration,
2d15862dfba6bf1 Frank Li      2024-06-03  1180  			 * but neither side would continue, as each would subsequently see that the
2d15862dfba6bf1 Frank Li      2024-06-03  1181  			 * other did not provide ACK.
2d15862dfba6bf1 Frank Li      2024-06-03  1182  			 * ...
2d15862dfba6bf1 Frank Li      2024-06-03  1183  			 * For either value of RnW: Due to the NACK, the Controller shall defer the
2d15862dfba6bf1 Frank Li      2024-06-03  1184  			 * Private Write or Private Read, and should typically transmit the Target
2d15862dfba6bf1 Frank Li      2024-06-03  1185  			 * Address again after a Repeated START (i.e., the next one or any one prior
2d15862dfba6bf1 Frank Li      2024-06-03  1186  			 * to a STOP in the Frame). Since the Address Header following a Repeated
2d15862dfba6bf1 Frank Li      2024-06-03  1187  			 * START is not arbitrated, the Controller will always win (see Section
2d15862dfba6bf1 Frank Li      2024-06-03  1188  			 * 5.1.2.2.4).
2d15862dfba6bf1 Frank Li      2024-06-03  1189  			 */
2d15862dfba6bf1 Frank Li      2024-06-03  1190  			if (retry && addr != 0x7e) {
2d15862dfba6bf1 Frank Li      2024-06-03  1191  				writel(SVC_I3C_MERRWARN_NACK, master->regs + SVC_I3C_MERRWARN);
2d15862dfba6bf1 Frank Li      2024-06-03  1192  			} else {
49b472ebc61de3d Clark Wang    2023-05-17  1193  				ret = -ENXIO;
6d1a19d34e2cc07 Frank Li      2023-12-01  1194  				*actual_len = 0;
49b472ebc61de3d Clark Wang    2023-05-17  1195  				goto emit_stop;
49b472ebc61de3d Clark Wang    2023-05-17  1196  			}
2d15862dfba6bf1 Frank Li      2024-06-03  1197  		} else {
2d15862dfba6bf1 Frank Li      2024-06-03  1198  			break;
2d15862dfba6bf1 Frank Li      2024-06-03  1199  		}
2d15862dfba6bf1 Frank Li      2024-06-03  1200  	}
49b472ebc61de3d Clark Wang    2023-05-17  1201  
dd3c52846d5954a Miquel Raynal 2021-01-21  1202  	if (rnw)
dd3c52846d5954a Miquel Raynal 2021-01-21  1203  		ret = svc_i3c_master_read(master, in, xfer_len);
dd3c52846d5954a Miquel Raynal 2021-01-21  1204  	else
dd3c52846d5954a Miquel Raynal 2021-01-21  1205  		ret = svc_i3c_master_write(master, out, xfer_len);
d5e512574dd2eb0 Clark Wang    2021-12-27  1206  	if (ret < 0)
dd3c52846d5954a Miquel Raynal 2021-01-21  1207  		goto emit_stop;
dd3c52846d5954a Miquel Raynal 2021-01-21  1208  
d5e512574dd2eb0 Clark Wang    2021-12-27  1209  	if (rnw)
6fb61734a74eaa3 Frank Li      2023-12-01  1210  		*actual_len = ret;
d5e512574dd2eb0 Clark Wang    2021-12-27  1211  
dd3c52846d5954a Miquel Raynal 2021-01-21  1212  	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
dd3c52846d5954a Miquel Raynal 2021-01-21  1213  				 SVC_I3C_MSTATUS_COMPLETE(reg), 0, 1000);
dd3c52846d5954a Miquel Raynal 2021-01-21  1214  	if (ret)
dd3c52846d5954a Miquel Raynal 2021-01-21  1215  		goto emit_stop;
dd3c52846d5954a Miquel Raynal 2021-01-21  1216  
d5e512574dd2eb0 Clark Wang    2021-12-27  1217  	writel(SVC_I3C_MINT_COMPLETE, master->regs + SVC_I3C_MSTATUS);
d5e512574dd2eb0 Clark Wang    2021-12-27  1218  
d5e512574dd2eb0 Clark Wang    2021-12-27  1219  	if (!continued) {
dd3c52846d5954a Miquel Raynal 2021-01-21  1220  		svc_i3c_master_emit_stop(master);
dd3c52846d5954a Miquel Raynal 2021-01-21  1221  
d5e512574dd2eb0 Clark Wang    2021-12-27  1222  		/* Wait idle if stop is sent. */
d5e512574dd2eb0 Clark Wang    2021-12-27  1223  		readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
d5e512574dd2eb0 Clark Wang    2021-12-27  1224  				   SVC_I3C_MSTATUS_STATE_IDLE(reg), 0, 1000);
d5e512574dd2eb0 Clark Wang    2021-12-27  1225  	}
d5e512574dd2eb0 Clark Wang    2021-12-27  1226  
dd3c52846d5954a Miquel Raynal 2021-01-21  1227  	return 0;
dd3c52846d5954a Miquel Raynal 2021-01-21  1228  
dd3c52846d5954a Miquel Raynal 2021-01-21  1229  emit_stop:
dd3c52846d5954a Miquel Raynal 2021-01-21  1230  	svc_i3c_master_emit_stop(master);
dd3c52846d5954a Miquel Raynal 2021-01-21  1231  	svc_i3c_master_clear_merrwarn(master);
dd3c52846d5954a Miquel Raynal 2021-01-21  1232  
dd3c52846d5954a Miquel Raynal 2021-01-21  1233  	return ret;
dd3c52846d5954a Miquel Raynal 2021-01-21  1234  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

