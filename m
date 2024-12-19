Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3D7226165
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Dec 2024 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734614898; cv=none; b=tozCf6BK5C9hu2b94YneiG6/1hFcDENplmOVuWOVJ+/jTljiiuV6MQPSgLrH3BE+aM2CODUUgV9dlYV7l6mzH00r399HYToDD4OsdRfmSre0nGI5GoexBK+f6gdorH1irtTf7DDT/nqCIlSiS7fUBsc43GvT5ww21rhQihN2qBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734614898; c=relaxed/simple;
	bh=n0dIh9IMFmb1kzkIoQI/7+dwDbIH/ZKb8ijbdLGsQUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTz/ZFweZpVjR4VxHQASxNQggPhaLH5tfgg8HYn5XaXjkdiTFrHXWIPaX5Tx5GU09oupetsCxMouzGk6fOCPQH0cXjrPicX4xCw9lEptS6GaOkhav8C0MwLUWrL70/THCABVq5r9Ou9HHOBhkv1TDQTIR4CRDlyllK8W9CgBL8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKmYLtSV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKmYLtSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734614896; x=1766150896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0dIh9IMFmb1kzkIoQI/7+dwDbIH/ZKb8ijbdLGsQUA=;
  b=bKmYLtSVppppQOoB1da+0/k5I8QNNHGn/OxXoWSlW6hU1vs846AxOxy6
   25fKYnbZMUshaUSEo5jfQ+reVLWexlT1iTE+NyY2+pIzflZCKh+fTFqHS
   4QEoF1zQWmx+FZbGmaTZWjoBEv0eiYW9WHsyYIGg9HLbJrRwIXUC5ix/Y
   LzW6KY0dSaGOmMPLTVAtV/jAYDbvHpCg+F6tlODa5qWoNBP3HCUSDtnqp
   W2iYGzvH2QREJhljv4/CTZJp3ExRFATq+ji0Xvzfx9UTj5bds1IjR6eDk
   j8u93vbZZa7ZO3c/6sYDcjSML6qaWOb6/c5K23vwq7c9uslgx1TpkB2Cb
   Q==;
X-CSE-ConnectionGUID: nxVE5kaoTo6cAz5bU9cJ5w==
X-CSE-MsgGUID: a1Uud95gS8yt/LyJEZE4aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38902192"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="38902192"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 05:28:13 -0800
X-CSE-ConnectionGUID: uAKkxxjhSq2cB2qu+1PExQ==
X-CSE-MsgGUID: 5bbAWY4sQnexJMH1ZepKsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121461398"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Dec 2024 05:28:12 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOGZW-0000G7-0N;
	Thu, 19 Dec 2024 13:28:10 +0000
Date: Thu, 19 Dec 2024 21:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
Message-ID: <202412192132.XB16SilM-lkp@intel.com>
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
In-Reply-To: <6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen@synopsys.com>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: Homura Akemi <a1134123566@gmail.com>

Hi Thinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d8d936c51388442f769a81e512b505dcf87c6a51]

url:    https://github.com/intel-lab-lkp/linux/commits/Thinh-Nguyen/usb-gadget-f_tcm-Don-t-free-command-immediately/20241211-092317
base:   d8d936c51388442f769a81e512b505dcf87c6a51
patch link:    https://lore.kernel.org/r/6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen%40synopsys.com
patch subject: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: nios2-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241219/202412192132.XB16SilM-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412192132.XB16SilM-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_tcm.c:1308 usbg_cmd_work() error: we previously assumed 'active_cmd' could be null (see line 1265)

vim +/active_cmd +1308 drivers/usb/gadget/function/f_tcm.c

08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  1226  
287b3d115e5351 Thinh Nguyen          2024-12-11  1227  static void usbg_cmd_work(struct work_struct *work)
287b3d115e5351 Thinh Nguyen          2024-12-11  1228  {
287b3d115e5351 Thinh Nguyen          2024-12-11  1229  	struct usbg_cmd *cmd = container_of(work, struct usbg_cmd, work);
287b3d115e5351 Thinh Nguyen          2024-12-11  1230  
287b3d115e5351 Thinh Nguyen          2024-12-11  1231  	/*
287b3d115e5351 Thinh Nguyen          2024-12-11  1232  	 * Failure is detected by f_tcm here. Skip submitting the command to the
287b3d115e5351 Thinh Nguyen          2024-12-11  1233  	 * target core if we already know the failing response and send the usb
287b3d115e5351 Thinh Nguyen          2024-12-11  1234  	 * response to the host directly.
287b3d115e5351 Thinh Nguyen          2024-12-11  1235  	 */
287b3d115e5351 Thinh Nguyen          2024-12-11  1236  	if (cmd->tmr_rsp != RC_RESPONSE_UNKNOWN)
287b3d115e5351 Thinh Nguyen          2024-12-11  1237  		goto skip;
287b3d115e5351 Thinh Nguyen          2024-12-11  1238  
287b3d115e5351 Thinh Nguyen          2024-12-11  1239  	if (cmd->tmr_func)
287b3d115e5351 Thinh Nguyen          2024-12-11  1240  		usbg_submit_tmr(cmd);
287b3d115e5351 Thinh Nguyen          2024-12-11  1241  	else
287b3d115e5351 Thinh Nguyen          2024-12-11  1242  		usbg_submit_cmd(cmd);
287b3d115e5351 Thinh Nguyen          2024-12-11  1243  
287b3d115e5351 Thinh Nguyen          2024-12-11  1244  	return;
287b3d115e5351 Thinh Nguyen          2024-12-11  1245  
287b3d115e5351 Thinh Nguyen          2024-12-11  1246  skip:
7735c10c74d903 Thinh Nguyen          2024-12-11  1247  	if (cmd->tmr_rsp == RC_OVERLAPPED_TAG) {
7735c10c74d903 Thinh Nguyen          2024-12-11  1248  		struct f_uas *fu = cmd->fu;
7735c10c74d903 Thinh Nguyen          2024-12-11  1249  		struct se_session *se_sess;
7735c10c74d903 Thinh Nguyen          2024-12-11  1250  		struct uas_stream *stream = NULL;
7735c10c74d903 Thinh Nguyen          2024-12-11  1251  		struct hlist_node *tmp;
7735c10c74d903 Thinh Nguyen          2024-12-11  1252  		struct usbg_cmd *active_cmd = NULL;
7735c10c74d903 Thinh Nguyen          2024-12-11  1253  
7735c10c74d903 Thinh Nguyen          2024-12-11  1254  		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
7735c10c74d903 Thinh Nguyen          2024-12-11  1255  
7735c10c74d903 Thinh Nguyen          2024-12-11  1256  		hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, cmd->tag) {
7735c10c74d903 Thinh Nguyen          2024-12-11  1257  			int i = stream - &fu->stream[0];
7735c10c74d903 Thinh Nguyen          2024-12-11  1258  
7735c10c74d903 Thinh Nguyen          2024-12-11  1259  			active_cmd = &((struct usbg_cmd *)se_sess->sess_cmd_map)[i];
7735c10c74d903 Thinh Nguyen          2024-12-11  1260  			if (active_cmd->tag == cmd->tag)
7735c10c74d903 Thinh Nguyen          2024-12-11  1261  				break;
7735c10c74d903 Thinh Nguyen          2024-12-11  1262  		}
7735c10c74d903 Thinh Nguyen          2024-12-11  1263  
7735c10c74d903 Thinh Nguyen          2024-12-11  1264  		/* Sanity check */
7735c10c74d903 Thinh Nguyen          2024-12-11 @1265  		if (!stream || (active_cmd && active_cmd->tag != cmd->tag)) {
7735c10c74d903 Thinh Nguyen          2024-12-11  1266  			usbg_submit_command(cmd->fu, cmd->req);
7735c10c74d903 Thinh Nguyen          2024-12-11  1267  			return;
7735c10c74d903 Thinh Nguyen          2024-12-11  1268  		}
7735c10c74d903 Thinh Nguyen          2024-12-11  1269  
7735c10c74d903 Thinh Nguyen          2024-12-11  1270  		reinit_completion(&stream->cmd_completion);
7735c10c74d903 Thinh Nguyen          2024-12-11  1271  
7735c10c74d903 Thinh Nguyen          2024-12-11  1272  		/*
7735c10c74d903 Thinh Nguyen          2024-12-11  1273  		 * A UASP command consists of the command, data, and status
7735c10c74d903 Thinh Nguyen          2024-12-11  1274  		 * stages, each operating sequentially from different endpoints.
7735c10c74d903 Thinh Nguyen          2024-12-11  1275  		 *
7735c10c74d903 Thinh Nguyen          2024-12-11  1276  		 * Each USB endpoint operates independently, and depending on
7735c10c74d903 Thinh Nguyen          2024-12-11  1277  		 * hardware implementation, a completion callback for a transfer
7735c10c74d903 Thinh Nguyen          2024-12-11  1278  		 * from one endpoint may not reflect the order of completion on
7735c10c74d903 Thinh Nguyen          2024-12-11  1279  		 * the wire. This is particularly true for devices with
7735c10c74d903 Thinh Nguyen          2024-12-11  1280  		 * endpoints that have independent interrupts and event buffers.
7735c10c74d903 Thinh Nguyen          2024-12-11  1281  		 *
7735c10c74d903 Thinh Nguyen          2024-12-11  1282  		 * The driver must still detect misbehaving hosts and respond
7735c10c74d903 Thinh Nguyen          2024-12-11  1283  		 * with an overlap status. To reduce false overlap failures,
7735c10c74d903 Thinh Nguyen          2024-12-11  1284  		 * allow the active and matching stream ID a brief 1ms to
7735c10c74d903 Thinh Nguyen          2024-12-11  1285  		 * complete before responding with an overlap command failure.
7735c10c74d903 Thinh Nguyen          2024-12-11  1286  		 * Overlap failure should be rare.
7735c10c74d903 Thinh Nguyen          2024-12-11  1287  		 */
7735c10c74d903 Thinh Nguyen          2024-12-11  1288  		wait_for_completion_timeout(&stream->cmd_completion, msecs_to_jiffies(1));
7735c10c74d903 Thinh Nguyen          2024-12-11  1289  
7735c10c74d903 Thinh Nguyen          2024-12-11  1290  		/* If the previous stream is completed, retry the command. */
7735c10c74d903 Thinh Nguyen          2024-12-11  1291  		if (!hash_hashed(&stream->node)) {
7735c10c74d903 Thinh Nguyen          2024-12-11  1292  			usbg_submit_command(cmd->fu, cmd->req);
7735c10c74d903 Thinh Nguyen          2024-12-11  1293  			return;
7735c10c74d903 Thinh Nguyen          2024-12-11  1294  		}
7735c10c74d903 Thinh Nguyen          2024-12-11  1295  
7735c10c74d903 Thinh Nguyen          2024-12-11  1296  		/*
7735c10c74d903 Thinh Nguyen          2024-12-11  1297  		 * The command isn't submitted to the target core, so we're safe
7735c10c74d903 Thinh Nguyen          2024-12-11  1298  		 * to remove the bitmap index from the session tag pool.
7735c10c74d903 Thinh Nguyen          2024-12-11  1299  		 */
7735c10c74d903 Thinh Nguyen          2024-12-11  1300  		sbitmap_queue_clear(&se_sess->sess_tag_pool,
7735c10c74d903 Thinh Nguyen          2024-12-11  1301  				    cmd->se_cmd.map_tag,
7735c10c74d903 Thinh Nguyen          2024-12-11  1302  				    cmd->se_cmd.map_cpu);
7735c10c74d903 Thinh Nguyen          2024-12-11  1303  
7735c10c74d903 Thinh Nguyen          2024-12-11  1304  		/*
7735c10c74d903 Thinh Nguyen          2024-12-11  1305  		 * Overlap command tag detected. Cancel any pending transfer of
7735c10c74d903 Thinh Nguyen          2024-12-11  1306  		 * the command submitted to target core.
7735c10c74d903 Thinh Nguyen          2024-12-11  1307  		 */
7735c10c74d903 Thinh Nguyen          2024-12-11 @1308  		active_cmd->tmr_rsp = RC_OVERLAPPED_TAG;
7735c10c74d903 Thinh Nguyen          2024-12-11  1309  		usbg_aborted_task(&active_cmd->se_cmd);
7735c10c74d903 Thinh Nguyen          2024-12-11  1310  
7735c10c74d903 Thinh Nguyen          2024-12-11  1311  		/* Send the response after the transfer is aborted. */
7735c10c74d903 Thinh Nguyen          2024-12-11  1312  		return;
7735c10c74d903 Thinh Nguyen          2024-12-11  1313  	}
7735c10c74d903 Thinh Nguyen          2024-12-11  1314  
287b3d115e5351 Thinh Nguyen          2024-12-11  1315  	uasp_send_tm_response(cmd);
287b3d115e5351 Thinh Nguyen          2024-12-11  1316  }
287b3d115e5351 Thinh Nguyen          2024-12-11  1317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
