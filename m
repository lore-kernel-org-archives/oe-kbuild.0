Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9412F25EF
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615857; cv=none; b=GHCwwmWIFIA8Vyb5PEKemIgsdAB+Sc6ACIgaNKb0LC9xnSYnDazmhm0XIQHGVwJZArbOZCdEha5NDlnQslH77kPkhO+POToTzdRgFATAG4JNVHi1geZYZirwGjuk5B1sO8EKGKLtFIgTCF1qE9J6ZFA/QMv/D8Q0KTheRIMsRXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615857; c=relaxed/simple;
	bh=/S4+3nREbTYuHNWhpgwdOUO91bV1GYDGTW8X0ya2tBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L9OkR+FBFgfKN4jClhBE1fSOU1BRNKNbnh2PPzlJtfc7hUGG9HPw2mzDl+vYt28SBY7dm1xHaHF1HMih6tlOBJT4NdJtsD5N4x5t/nE2DEuHzcE9c1UcIlIc1Dlb2CPNpWTDaj0JD0yaee3d823XRwN9U+/rVb7/ALueOLzji/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGMb6omd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGMb6omd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769615855; x=1801151855;
  h=date:from:to:cc:subject:message-id;
  bh=/S4+3nREbTYuHNWhpgwdOUO91bV1GYDGTW8X0ya2tBg=;
  b=OGMb6omdlsP+QNaaodRVHaF/UCuWTVY5TgayvgN98PY1V+/WuKinmC11
   aRWukO46urT46nBY3ucWkDNfbW12+T0dnCS6tcuhSfeBGgbdRyDjonwC/
   u5TSpyEjNipW1s5WfA6n04aPJhAxtTAFsUcTXi6yiiDyP0O0K3M8Dgbyj
   63MrR1oiGIgyQ5JE4esF8oEfHRcAdFEyoiSMZectmNpWHArQvZ/ryNhvg
   tP81imE+7y+V+3YY+Few+PXuKG4ffE+Ir0bsqaCnKGInqOECSW49eVSz5
   n+5DyBtj26IbXSLEYVJJhlEIjAKhH69mvUcR/HGfAKBDbpdN6XAZZKRmF
   A==;
X-CSE-ConnectionGUID: T9gwbClIQhWRCHQUj2rIZg==
X-CSE-MsgGUID: RcLQK5EgQ6SX/buKCytaBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81464550"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81464550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:57:34 -0800
X-CSE-ConnectionGUID: ea2GXGfkTAK7ZfcGweZwTw==
X-CSE-MsgGUID: 94xhEcguQZOLPekGE1mVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207913505"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2026 07:57:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl7v8-00000000a9K-30rm;
	Wed, 28 Jan 2026 15:57:30 +0000
Date: Wed, 28 Jan 2026 23:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 99/99]
 drivers/scsi/storvsc_drv.c:1857 storvsc_queuecommand() warn: possible memory
 leak of 'payload'
Message-ID: <202601282347.NGO3hkLW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d353ced357319ee465f9f6cf72f039f3f793d4dd
commit: ae42c6f79cec7314e608f43e767253bfeab612ee [99/99] scsi: storvsc: Don't pass unused PFNs to Hyper-V host
:::::: branch date: 21 hours ago
:::::: commit date: 2 years, 8 months ago
config: x86_64-randconfig-161-20260128 (https://download.01.org/0day-ci/archive/20260128/202601282347.NGO3hkLW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601282347.NGO3hkLW-lkp@intel.com/

New smatch warnings:
drivers/scsi/storvsc_drv.c:1857 storvsc_queuecommand() warn: possible memory leak of 'payload'

Old smatch warnings:
drivers/scsi/storvsc_drv.c:827 storvsc_execute_vstor_op() warn: missing error code? 'ret'

vim +/payload +1857 drivers/scsi/storvsc_drv.c

c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1700  
bab445e12b4515 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-11-08  1701  static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1702  {
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1703  	int ret;
bab445e12b4515 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-11-08  1704  	struct hv_host_device *host_dev = shost_priv(host);
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1705  	struct hv_device *dev = host_dev->dev;
ead3700d893654 drivers/scsi/storvsc_drv.c       Christoph Hellwig 2014-12-29  1706  	struct storvsc_cmd_request *cmd_request = scsi_cmd_priv(scmnd);
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1707  	struct scatterlist *sgl;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1708  	struct vmscsi_request *vm_srb;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1709  	struct vmbus_packet_mpb_array  *payload;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1710  	u32 payload_sz;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1711  	u32 length;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1712  
2492fd7a60270b drivers/scsi/storvsc_drv.c       Keith Mange       2015-08-13  1713  	if (vmstor_proto_version <= VMSTOR_PROTO_VERSION_WIN8) {
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1714  		/*
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1715  		 * On legacy hosts filter unimplemented commands.
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1716  		 * Future hosts are expected to correctly handle
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1717  		 * unsupported commands. Furthermore, it is
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1718  		 * possible that some of the currently
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1719  		 * unsupported commands maybe supported in
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1720  		 * future versions of the host.
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1721  		 */
c77b63b639f52b drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2012-01-12  1722  		if (!storvsc_scsi_cmd_ok(scmnd)) {
0c31fa0e66195b drivers/scsi/storvsc_drv.c       Bart Van Assche   2021-10-07  1723  			scsi_done(scmnd);
92ae4ebdaa6d6d drivers/staging/hv/storvsc_drv.c Olaf Hering       2011-10-10  1724  			return 0;
92ae4ebdaa6d6d drivers/staging/hv/storvsc_drv.c Olaf Hering       2011-10-10  1725  		}
8caf92d80526f3 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2014-07-12  1726  	}
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1727  
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1728  	/* Setup the cmd request */
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1729  	cmd_request->cmd = scmnd;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1730  
0a76566595bfb2 drivers/scsi/storvsc_drv.c       Andres Beltran    2020-07-06  1731  	memset(&cmd_request->vstor_packet, 0, sizeof(struct vstor_packet));
61eaffc91d375e drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2012-01-12  1732  	vm_srb = &cmd_request->vstor_packet.vm_srb;
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar    2022-05-25  1733  	vm_srb->time_out_value = 60;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1734  
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar    2022-05-25  1735  	vm_srb->srb_flags |=
8cf308e1225f5f drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-08-31  1736  		SRB_FLAGS_DISABLE_SYNCH_TRANSFER;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1737  
3cd6d3d9b1abab drivers/scsi/storvsc_drv.c       Long Li           2016-12-14  1738  	if (scmnd->device->tagged_supported) {
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar    2022-05-25  1739  		vm_srb->srb_flags |=
3cd6d3d9b1abab drivers/scsi/storvsc_drv.c       Long Li           2016-12-14  1740  		(SRB_FLAGS_QUEUE_ACTION_ENABLE | SRB_FLAGS_NO_QUEUE_FREEZE);
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar    2022-05-25  1741  		vm_srb->queue_tag = SP_UNTAGGED;
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar    2022-05-25  1742  		vm_srb->queue_action = SRB_SIMPLE_TAG_REQUEST;
3cd6d3d9b1abab drivers/scsi/storvsc_drv.c       Long Li           2016-12-14  1743  	}
3cd6d3d9b1abab drivers/scsi/storvsc_drv.c       Long Li           2016-12-14  1744  
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1745  	/* Build the SRB */
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1746  	switch (scmnd->sc_data_direction) {
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1747  	case DMA_TO_DEVICE:
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1748  		vm_srb->data_in = WRITE_TYPE;
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar    2022-05-25  1749  		vm_srb->srb_flags |= SRB_FLAGS_DATA_OUT;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1750  		break;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1751  	case DMA_FROM_DEVICE:
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1752  		vm_srb->data_in = READ_TYPE;
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar    2022-05-25  1753  		vm_srb->srb_flags |= SRB_FLAGS_DATA_IN;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1754  		break;
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1755  	case DMA_NONE:
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1756  		vm_srb->data_in = UNKNOWN_TYPE;
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar    2022-05-25  1757  		vm_srb->srb_flags |= SRB_FLAGS_NO_DATA_TRANSFER;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1758  		break;
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1759  	default:
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1760  		/*
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1761  		 * This is DMA_BIDIRECTIONAL or something else we are never
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1762  		 * supposed to see here.
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1763  		 */
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1764  		WARN(1, "Unexpected data direction: %d\n",
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1765  		     scmnd->sc_data_direction);
cb1cf0804fe582 drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-06-25  1766  		return -EINVAL;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1767  	}
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1768  
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1769  
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1770  	vm_srb->port_number = host_dev->port;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1771  	vm_srb->path_id = scmnd->device->channel;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1772  	vm_srb->target_id = scmnd->device->id;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1773  	vm_srb->lun = scmnd->device->lun;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1774  
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1775  	vm_srb->cdb_length = scmnd->cmd_len;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1776  
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1777  	memcpy(vm_srb->cdb, scmnd->cmnd, vm_srb->cdb_length);
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1778  
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1779  	sgl = (struct scatterlist *)scsi_sglist(scmnd);
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1780  
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1781  	length = scsi_bufflen(scmnd);
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1782  	payload = (struct vmbus_packet_mpb_array *)&cmd_request->mpb;
ae42c6f79cec73 drivers/scsi/storvsc_drv.c       Michael Kelley    2023-05-15  1783  	payload_sz = 0;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1784  
0bd2fbee9d0b7f drivers/scsi/storvsc_drv.c       YueHaibing        2021-12-27  1785  	if (scsi_sg_count(scmnd)) {
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1786  		unsigned long offset_in_hvpg = offset_in_hvpage(sgl->offset);
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1787  		unsigned int hvpg_count = HVPFN_UP(offset_in_hvpg + length);
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1788  		struct scatterlist *sg;
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1789  		unsigned long hvpfn, hvpfns_to_add;
0bd2fbee9d0b7f drivers/scsi/storvsc_drv.c       YueHaibing        2021-12-27  1790  		int j, i = 0, sg_count;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1791  
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1792  		payload_sz = (hvpg_count * sizeof(u64) +
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1793  			      sizeof(struct vmbus_packet_mpb_array));
ae42c6f79cec73 drivers/scsi/storvsc_drv.c       Michael Kelley    2023-05-15  1794  
ae42c6f79cec73 drivers/scsi/storvsc_drv.c       Michael Kelley    2023-05-15  1795  		if (hvpg_count > MAX_PAGE_BUFFER_COUNT) {
b0120d99062535 drivers/scsi/storvsc_drv.c       Cathy Avery       2016-11-23  1796  			payload = kzalloc(payload_sz, GFP_ATOMIC);
81988a0e6b031b drivers/scsi/storvsc_drv.c       Vitaly Kuznetsov  2015-10-01  1797  			if (!payload)
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1798  				return SCSI_MLQUEUE_DEVICE_BUSY;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1799  		}
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1800  
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1801  		payload->range.len = length;
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1802  		payload->range.offset = offset_in_hvpg;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1803  
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1804  		sg_count = scsi_dma_map(scmnd);
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1805  		if (sg_count < 0) {
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1806  			ret = SCSI_MLQUEUE_DEVICE_BUSY;
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1807  			goto err_free_payload;
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1808  		}
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1809  
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1810  		for_each_sg(sgl, sg, sg_count, j) {
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1811  			/*
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1812  			 * Init values for the current sgl entry. hvpfns_to_add
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1813  			 * is in units of Hyper-V size pages. Handling the
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1814  			 * PAGE_SIZE != HV_HYP_PAGE_SIZE case also handles
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1815  			 * values of sgl->offset that are larger than PAGE_SIZE.
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1816  			 * Such offsets are handled even on other than the first
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1817  			 * sgl entry, provided they are a multiple of PAGE_SIZE.
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1818  			 */
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1819  			hvpfn = HVPFN_DOWN(sg_dma_address(sg));
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1820  			hvpfns_to_add = HVPFN_UP(sg_dma_address(sg) +
743b237c3a7b0f drivers/scsi/storvsc_drv.c       Tianyu Lan        2021-12-13  1821  						 sg_dma_len(sg)) - hvpfn;
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1822  
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1823  			/*
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1824  			 * Fill the next portion of the PFN array with
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1825  			 * sequential Hyper-V PFNs for the continguous physical
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1826  			 * memory described by the sgl entry. The end of the
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1827  			 * last sgl should be reached at the same time that
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1828  			 * the PFN array is filled.
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1829  			 */
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1830  			while (hvpfns_to_add--)
3d9c3dcc58e968 drivers/scsi/storvsc_drv.c       Michael Kelley    2021-02-23  1831  				payload->range.pfn_array[i++] = hvpfn++;
8f43710543ef30 drivers/scsi/storvsc_drv.c       Boqun Feng        2020-09-16  1832  		}
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1833  	}
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1834  
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1835  	cmd_request->payload = payload;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1836  	cmd_request->payload_sz = payload_sz;
be0cf6ca301c61 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2015-03-27  1837  
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1838  	/* Invokes the vsc to start an IO */
d86adf482b843b drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2016-12-14  1839  	ret = storvsc_do_io(dev, cmd_request, get_cpu());
d86adf482b843b drivers/scsi/storvsc_drv.c       K. Y. Srinivasan  2016-12-14  1840  	put_cpu();
636f0fd14ca29b drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1841  
87c71e88f6a661 drivers/scsi/storvsc_drv.c       Michael Kelley    2022-12-04  1842  	if (ret)
87c71e88f6a661 drivers/scsi/storvsc_drv.c       Michael Kelley    2022-12-04  1843  		scsi_dma_unmap(scmnd);
87c71e88f6a661 drivers/scsi/storvsc_drv.c       Michael Kelley    2022-12-04  1844  
d2598f017f02bb drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-08-25  1845  	if (ret == -EAGAIN) {
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1846  		/* no more space */
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1847  		ret = SCSI_MLQUEUE_DEVICE_BUSY;
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1848  		goto err_free_payload;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1849  	}
c77b63b639f52b drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2012-01-12  1850  
c77b63b639f52b drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2012-01-12  1851  	return 0;
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1852  
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1853  err_free_payload:
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1854  	if (payload_sz > sizeof(cmd_request->mpb))
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1855  		kfree(payload);
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08  1856  
4eea5332d67d8a drivers/scsi/storvsc_drv.c       Juan Vazquez      2022-01-08 @1857  	return ret;
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1858  }
c5b463ae24244a drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan  2011-05-10  1859  

:::::: The code at line 1857 was first introduced by commit
:::::: 4eea5332d67d8ae6ba5717ec0f4e671fdbd222e7 scsi: storvsc: Fix storvsc_queuecommand() memory leak

:::::: TO: Juan Vazquez <juvazq@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
