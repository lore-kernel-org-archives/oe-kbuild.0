Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BB8274B5C
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680484; cv=none; b=oC3YqVBjiLd7UCYQiN65Lq3PzptOwHkqATEbd4gTXF++FE9AF/8zr/yw4TriU8d53qxWgW3aN9NFcS8IMdOCkWT9MsF/XnDwSpdhRjBUQrkYaqGgLGl/AefkJPqEWm2r4AzLcEW4lvOtHuNR/JCtnjiRvAOwDjxUkpBnPUFzodw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680484; c=relaxed/simple;
	bh=uxCu2ark0tqRDazi8PnVevzh/F2/KrXyL5F+J7BAY6M=;
	h=Date:From:To:Subject:Message-ID; b=RlaMlBJPH5Y9rh2YNrHaktmZcRXlfPJIjxPB3aLbkyMbkqYNKMuwe5pUTNpErg1mqH4bUqjJCytBdsIRXD96lMmSiJZ9rjAw0TJT1GqTtepcGaYN0w7aFjrsloiu0ykMvOKN7JY+TlxQHDXhD4dESZgljTM9rRDXUvg+HUcCDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaInlbZ1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaInlbZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680483; x=1804216483;
  h=date:from:to:subject:message-id;
  bh=uxCu2ark0tqRDazi8PnVevzh/F2/KrXyL5F+J7BAY6M=;
  b=AaInlbZ18rDwj7jFORUOpTiaygH5bgIBBWSHDffdb8yigFxol2G9FrN9
   PXzMVWtW0+u9ThgLAtPR5ADJC77KUg7NV3zq1hs/qV3uG/gKB6GNTeXmX
   ckAsiXCh39wpE1P2+V1lv4skKyTdb+wiJoiG/5sCTOiYYztr0Gr/dDusH
   d1wDQVaHKLhZApvaIFYxr0ZvZMfErIAYMYFH2ECMADjCUsYf/ofxW3tbD
   z59ljP69aYfGlsKtOQ6EuBMxLndWPw8EtUkliuA29DhTwxJ8yIhl4ZCgH
   wEYw4LEWxJ0GqtsmPVXvdFHoAHSvWKm/BPC0zdthfig9gDbuApuqcHAyX
   A==;
X-CSE-ConnectionGUID: KOa+tHEDTt6B3GObeSis5A==
X-CSE-MsgGUID: YbkrnId0RxyZt6kPKkr2lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91148720"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91148720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: ssfhmwE5TSyJOObdtxVnMw==
X-CSE-MsgGUID: HKK5srMOTJC/ru4SMCaHJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241555234"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001tb-2NGd
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 429/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050449.XGuNQogx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: f2be1c24253b3040ac7bf2310cd195bb10af6c99 [429/467] drm: convert remaining fops to read/write iterators
:::::: branch date: 61 minutes ago
:::::: commit date: 62 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050449.XGuNQogx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#52: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4419:
+static ssize_t psp_read_spirom_debugfs_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#88: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:656:
+static ssize_t amdgpu_debugfs_virt_ring_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#131: FILE: drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c:127:
+static ssize_t kfd_debugfs_pasid_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#223: FILE: drivers/gpu/drm/i915/display/intel_hdcp.c:2804:
+static ssize_t intel_hdcp_force_14_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#293: FILE: drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:1275:
+static ssize_t mtk_hdmi_v2_debug_abist_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#331: FILE: drivers/gpu/drm/xe/xe_eu_stall.c:575:
+static ssize_t xe_eu_stall_stream_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#367: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:225:
+static ssize_t sched_groups_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#423: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:367:
+static ssize_t sched_group_engines_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#452: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:727:
+static ssize_t config_blob_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#489: FILE: drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:252:
+static ssize_t data_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#504: FILE: drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:264:
+static ssize_t data_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#528: FILE: drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:284:
+static ssize_t size_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#560: FILE: drivers/gpu/drm/xlnx/zynqmp_dp.c:1870:
+static ssize_t zynqmp_dp_pattern_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#578: FILE: drivers/gpu/drm/xlnx/zynqmp_dp.c:1882:
+static ssize_t zynqmp_dp_pattern_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#609: FILE: drivers/gpu/drm/xlnx/zynqmp_dp.c:2006:
+static ssize_t zynqmp_dp_custom_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#626: FILE: drivers/gpu/drm/xlnx/zynqmp_dp.c:2016:
+static ssize_t zynqmp_dp_custom_write(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
