Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2405CA6B
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 22:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765578638; cv=none; b=UsEVRQTY0QtgFySgVFPkpxWM0agqC0mJNcEa2LoEeejW1+LV0LhaiB0rUO4+wm7/ACMgXz4HtRgLiss5MHNXt1gIZpijZQtrFoTU5vRJ8LxHvDqil1QG0LWpNZCbKjCD/OzqM8lnmdIN+GuNkDQT4YyIllQQyh/pqthLhiAJtn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765578638; c=relaxed/simple;
	bh=Hy6Y+1OpobIz8n5WwfUcAew6DHCHIi3+OyyyOxMhHNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5ChRRemIT5VVuhwRpP6sWq/nINNB8V8eLtewUofqoaxiEdjCaVsFpUASgSj7d3ikqLu4Bj0HPkyMqa6efp4ieVY6hkDmwHNa5kZLw7T4jQ6yJDPvUPUcFLTYc+ZoG9g0NxKv55eNbBf0s/nB67C3entBWfSOQaHhNQ6VKn+spo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fspLgKRv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fspLgKRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765578636; x=1797114636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hy6Y+1OpobIz8n5WwfUcAew6DHCHIi3+OyyyOxMhHNo=;
  b=fspLgKRvrA7EZ7z1ZpL05tF50jQ3DUe8Z6U4MPM3/8kXQzxAVV+gdje8
   gXecHMnImruiZhHaZssYNv1YGRKNkUOWquEDgZK6H2ncRQAfXsGOZrBs/
   Wpy3wsR9McnFHQdz+e/ytNbY9kFv1b+9GFEyQzi9iX+RGnrbqohQ7RS9k
   ykZWnS0toDHBITo1jMhYDHhqVKm1oLsX33gzdpMcwqcviGVLAJ3ciIr7v
   YktbMmP+pq2o/7Kp5qjSYM1SJ4iuGICmm1mtdpy3S+u67j3q6a2R+U/RI
   OuHoX/00ltl10Nq0HbReNaJd5tmPZJqwDYjRt/heMOGQrAumpjQIEGSVB
   A==;
X-CSE-ConnectionGUID: FxVHdl8vTQmH/KBtQFPIKg==
X-CSE-MsgGUID: Zgd2EBQ3T5yxtztj+mSNrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78291533"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78291533"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:30:35 -0800
X-CSE-ConnectionGUID: x9KjPfV2T7yblodpVnKgYA==
X-CSE-MsgGUID: HsW3Y1y+TKG7xaD9+O2aBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="220572932"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Dec 2025 14:30:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBei-000000006hg-07kl;
	Fri, 12 Dec 2025 22:30:32 +0000
Date: Sat, 13 Dec 2025 06:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/gadget/function/f_tcm.c:1308 usbg_cmd_work() error: we
 previously assumed 'active_cmd' could be null (see line 1265)
Message-ID: <202512130616.R5SPxNDR-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 29ed170538729c3c59cb8176ebb62673bbf6c799 usb: gadget: f_tcm: Check overlapped command
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130616.R5SPxNDR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130616.R5SPxNDR-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_tcm.c:1308 usbg_cmd_work() error: we previously assumed 'active_cmd' could be null (see line 1265)

vim +/active_cmd +1308 drivers/usb/gadget/function/f_tcm.c

08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  1226  
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1227  static void usbg_cmd_work(struct work_struct *work)
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1228  {
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1229  	struct usbg_cmd *cmd = container_of(work, struct usbg_cmd, work);
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1230  
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1231  	/*
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1232  	 * Failure is detected by f_tcm here. Skip submitting the command to the
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1233  	 * target core if we already know the failing response and send the usb
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1234  	 * response to the host directly.
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1235  	 */
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1236  	if (cmd->tmr_rsp != RC_RESPONSE_UNKNOWN)
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1237  		goto skip;
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1238  
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1239  	if (cmd->tmr_func)
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1240  		usbg_submit_tmr(cmd);
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1241  	else
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1242  		usbg_submit_cmd(cmd);
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1243  
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1244  	return;
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1245  
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1246  skip:
29ed170538729c3 Thinh Nguyen          2024-12-11  1247  	if (cmd->tmr_rsp == RC_OVERLAPPED_TAG) {
29ed170538729c3 Thinh Nguyen          2024-12-11  1248  		struct f_uas *fu = cmd->fu;
29ed170538729c3 Thinh Nguyen          2024-12-11  1249  		struct se_session *se_sess;
29ed170538729c3 Thinh Nguyen          2024-12-11  1250  		struct uas_stream *stream = NULL;
29ed170538729c3 Thinh Nguyen          2024-12-11  1251  		struct hlist_node *tmp;
29ed170538729c3 Thinh Nguyen          2024-12-11  1252  		struct usbg_cmd *active_cmd = NULL;
29ed170538729c3 Thinh Nguyen          2024-12-11  1253  
29ed170538729c3 Thinh Nguyen          2024-12-11  1254  		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
29ed170538729c3 Thinh Nguyen          2024-12-11  1255  
29ed170538729c3 Thinh Nguyen          2024-12-11  1256  		hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, cmd->tag) {
29ed170538729c3 Thinh Nguyen          2024-12-11  1257  			int i = stream - &fu->stream[0];
29ed170538729c3 Thinh Nguyen          2024-12-11  1258  
29ed170538729c3 Thinh Nguyen          2024-12-11  1259  			active_cmd = &((struct usbg_cmd *)se_sess->sess_cmd_map)[i];
29ed170538729c3 Thinh Nguyen          2024-12-11  1260  			if (active_cmd->tag == cmd->tag)
29ed170538729c3 Thinh Nguyen          2024-12-11  1261  				break;
29ed170538729c3 Thinh Nguyen          2024-12-11  1262  		}
29ed170538729c3 Thinh Nguyen          2024-12-11  1263  
29ed170538729c3 Thinh Nguyen          2024-12-11  1264  		/* Sanity check */
29ed170538729c3 Thinh Nguyen          2024-12-11 @1265  		if (!stream || (active_cmd && active_cmd->tag != cmd->tag)) {
29ed170538729c3 Thinh Nguyen          2024-12-11  1266  			usbg_submit_command(cmd->fu, cmd->req);
29ed170538729c3 Thinh Nguyen          2024-12-11  1267  			return;
29ed170538729c3 Thinh Nguyen          2024-12-11  1268  		}
29ed170538729c3 Thinh Nguyen          2024-12-11  1269  
29ed170538729c3 Thinh Nguyen          2024-12-11  1270  		reinit_completion(&stream->cmd_completion);
29ed170538729c3 Thinh Nguyen          2024-12-11  1271  
29ed170538729c3 Thinh Nguyen          2024-12-11  1272  		/*
29ed170538729c3 Thinh Nguyen          2024-12-11  1273  		 * A UASP command consists of the command, data, and status
29ed170538729c3 Thinh Nguyen          2024-12-11  1274  		 * stages, each operating sequentially from different endpoints.
29ed170538729c3 Thinh Nguyen          2024-12-11  1275  		 *
29ed170538729c3 Thinh Nguyen          2024-12-11  1276  		 * Each USB endpoint operates independently, and depending on
29ed170538729c3 Thinh Nguyen          2024-12-11  1277  		 * hardware implementation, a completion callback for a transfer
29ed170538729c3 Thinh Nguyen          2024-12-11  1278  		 * from one endpoint may not reflect the order of completion on
29ed170538729c3 Thinh Nguyen          2024-12-11  1279  		 * the wire. This is particularly true for devices with
29ed170538729c3 Thinh Nguyen          2024-12-11  1280  		 * endpoints that have independent interrupts and event buffers.
29ed170538729c3 Thinh Nguyen          2024-12-11  1281  		 *
29ed170538729c3 Thinh Nguyen          2024-12-11  1282  		 * The driver must still detect misbehaving hosts and respond
29ed170538729c3 Thinh Nguyen          2024-12-11  1283  		 * with an overlap status. To reduce false overlap failures,
29ed170538729c3 Thinh Nguyen          2024-12-11  1284  		 * allow the active and matching stream ID a brief 1ms to
29ed170538729c3 Thinh Nguyen          2024-12-11  1285  		 * complete before responding with an overlap command failure.
29ed170538729c3 Thinh Nguyen          2024-12-11  1286  		 * Overlap failure should be rare.
29ed170538729c3 Thinh Nguyen          2024-12-11  1287  		 */
29ed170538729c3 Thinh Nguyen          2024-12-11  1288  		wait_for_completion_timeout(&stream->cmd_completion, msecs_to_jiffies(1));
29ed170538729c3 Thinh Nguyen          2024-12-11  1289  
29ed170538729c3 Thinh Nguyen          2024-12-11  1290  		/* If the previous stream is completed, retry the command. */
29ed170538729c3 Thinh Nguyen          2024-12-11  1291  		if (!hash_hashed(&stream->node)) {
29ed170538729c3 Thinh Nguyen          2024-12-11  1292  			usbg_submit_command(cmd->fu, cmd->req);
29ed170538729c3 Thinh Nguyen          2024-12-11  1293  			return;
29ed170538729c3 Thinh Nguyen          2024-12-11  1294  		}
29ed170538729c3 Thinh Nguyen          2024-12-11  1295  
29ed170538729c3 Thinh Nguyen          2024-12-11  1296  		/*
29ed170538729c3 Thinh Nguyen          2024-12-11  1297  		 * The command isn't submitted to the target core, so we're safe
29ed170538729c3 Thinh Nguyen          2024-12-11  1298  		 * to remove the bitmap index from the session tag pool.
29ed170538729c3 Thinh Nguyen          2024-12-11  1299  		 */
29ed170538729c3 Thinh Nguyen          2024-12-11  1300  		sbitmap_queue_clear(&se_sess->sess_tag_pool,
29ed170538729c3 Thinh Nguyen          2024-12-11  1301  				    cmd->se_cmd.map_tag,
29ed170538729c3 Thinh Nguyen          2024-12-11  1302  				    cmd->se_cmd.map_cpu);
29ed170538729c3 Thinh Nguyen          2024-12-11  1303  
29ed170538729c3 Thinh Nguyen          2024-12-11  1304  		/*
29ed170538729c3 Thinh Nguyen          2024-12-11  1305  		 * Overlap command tag detected. Cancel any pending transfer of
29ed170538729c3 Thinh Nguyen          2024-12-11  1306  		 * the command submitted to target core.
29ed170538729c3 Thinh Nguyen          2024-12-11  1307  		 */
29ed170538729c3 Thinh Nguyen          2024-12-11 @1308  		active_cmd->tmr_rsp = RC_OVERLAPPED_TAG;
29ed170538729c3 Thinh Nguyen          2024-12-11  1309  		usbg_aborted_task(&active_cmd->se_cmd);
29ed170538729c3 Thinh Nguyen          2024-12-11  1310  
29ed170538729c3 Thinh Nguyen          2024-12-11  1311  		/* Send the response after the transfer is aborted. */
29ed170538729c3 Thinh Nguyen          2024-12-11  1312  		return;
29ed170538729c3 Thinh Nguyen          2024-12-11  1313  	}
29ed170538729c3 Thinh Nguyen          2024-12-11  1314  
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1315  	uasp_send_tm_response(cmd);
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1316  }
20e9ab60e6a6638 Thinh Nguyen          2024-12-11  1317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
