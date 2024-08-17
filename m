Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26098440C
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Aug 2024 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723916212; cv=none; b=Qw/5f8UCGjvkaiEZW0dPwrCygaRbnMVBjMdcwKHyLlOppL47NrbaT05Rqydkss/UM0g31gNWzD+Z9P/ZYr4DRhpABuA8m4TfbQVBTsVccEezk7zesW6+QvActBIGfCQFyZ5mZefwVCJEUvXLtPD9OUd4eSnYAWbdngVzfuZdocQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723916212; c=relaxed/simple;
	bh=GevkV1B+YphoZU72elu+nUYqNVuGplPduLH2niaZRRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAk+W1qRnFVMhGlMLVUIVMNjsH7MLzORZ0bHonK8oQJX3I+XqBubMFLIAY+qU5AtkCkWjMLhNjZLfitRNsJyKfXgQYyDRdoE1aInRcylurXx8SKd9w1r68b5Kdhb10G3Q77Gy+svHB9hOlS//aDOoMVFcOZjR585HbIpOskRTtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+hfDDW+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+hfDDW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723916210; x=1755452210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GevkV1B+YphoZU72elu+nUYqNVuGplPduLH2niaZRRA=;
  b=l+hfDDW+pqxauBobajH4e8eTOfF/WPj/+yd9hwtifLYLMcR1GRcpUQEp
   5xFXCx+Bua3lMf3qkugRaCn+z8Yk8QE9y9eT1H4x4X66DPMnnNveol1mv
   EZ9MfD4kupWvRs19PE4T8+TbU8D7x2AIAe77vaRyhFn3aESJILcMmWkZ3
   yY0Gc7z7maY9m5gIM2Eaw9ifl8PbeZyHS+b/8M+n0N2cYNT5TMGxeNSc7
   v1yet3RwZAxh9CkBYVr1Mq8yuq4A3cuxyuXSFmSoEnAjZ0strevIusfo1
   34ht7Ed21KmgVoAyrktLQS+Io1gMJMVRsdShA0hggtjgwa/GarpLbMSBj
   Q==;
X-CSE-ConnectionGUID: +buQEoswTN+QbkaI3w8X7A==
X-CSE-MsgGUID: BmGAUvr4Rsa2mHy1R9cGig==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="33606856"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="33606856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 10:36:50 -0700
X-CSE-ConnectionGUID: JgVnP1yoQn6VFCg21M0PJQ==
X-CSE-MsgGUID: CLUQcdDNRey7o4T2XmfXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="59667274"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2024 10:36:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfNM6-0007he-0L;
	Sat, 17 Aug 2024 17:36:46 +0000
Date: Sun, 18 Aug 2024 01:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 10/11] i3c: master: svc: wait for Manual ACK/NACK Done
 before next step
Message-ID: <202408180012.ifcIOjgX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240813-i3c_fix-v2-10-68fe4a050188@nxp.com>
References: <20240813-i3c_fix-v2-10-68fe4a050188@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Boris Brezillon <bbrezillon@kernel.org>
TO: Parshuram Thombare <pthombar@cadence.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Conor Culhane <conor.culhane@silvaco.com>
CC: linux-i3c@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 41c196e567fb1ea97f68a2ffb7faab451cd90854]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-master-Remove-i3c_dev_disable_ibi_locked-olddev-on-device-hotjoin/20240814-234209
base:   41c196e567fb1ea97f68a2ffb7faab451cd90854
patch link:    https://lore.kernel.org/r/20240813-i3c_fix-v2-10-68fe4a050188%40nxp.com
patch subject: [PATCH v2 10/11] i3c: master: svc: wait for Manual ACK/NACK Done before next step
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240817 (https://download.01.org/0day-ci/archive/20240818/202408180012.ifcIOjgX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408180012.ifcIOjgX-lkp@intel.com/

New smatch warnings:
drivers/i3c/master/svc-i3c-master.c:1165 svc_i3c_master_xfer() warn: missing error code 'ret'

Old smatch warnings:
drivers/i3c/master/svc-i3c-master.c:520 svc_i3c_master_ibi_work() error: uninitialized symbol 'dev'.
drivers/i3c/master/svc-i3c-master.c:520 svc_i3c_master_ibi_work() error: we previously assumed 'dev' could be null (see line 495)
drivers/i3c/master/svc-i3c-master.c:1302 svc_i3c_master_start_xfer_locked() error: uninitialized symbol 'ret'.

vim +/ret +1165 drivers/i3c/master/svc-i3c-master.c

dd3c52846d5954a Miquel Raynal 2021-01-21  1122  
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
dd3c52846d5954a Miquel Raynal 2021-01-21  1235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
