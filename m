Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E9402BAB
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364785; cv=none; b=PpMJnkiwYLbdrrrLbtUXpikNhiWrVDtEpuYZ0FUXFKG/N9bm5abBJtf5BjRjQQ1sM63dDLWt3jBJRwMs+rp6nd70TEMUcoRHFC3sK83EUMPWXjTUdG9wZf3SQPdnhITVQ1Y0rOMZqLtp5PG7WE2h2U61RFEMGhb9Cu/YBqF5ewk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364785; c=relaxed/simple;
	bh=bCzLS0q+jtNRscZLM2Sr5m1oX2Mmlqc7HTNCcia7R+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m1G/iav02ZkS/EjYJTnWC8C/pu7fBVs6iT5VYB23p1nxT28KHOVmmeYpkwG6JEwCBO8yG2L3eYt8N3EfPHR6qPAl6RLRGs5QdUc7qM9k/oBd9aV+RKD1gIgRtxB8U24ebz2w8S5SbyvLD2RCEqoUmU02RKFvgnbIeUgJY4GIV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEcuXVKw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEcuXVKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774364784; x=1805900784;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bCzLS0q+jtNRscZLM2Sr5m1oX2Mmlqc7HTNCcia7R+4=;
  b=AEcuXVKwC1ERZ3xVYq3KTF8tmaeOrcP01nMTl60jdsuyfXLG68UgVrwk
   nDjhfCPoTa2IA4RqIwt+Pt/r8/l7TUWF6H1CHKFrCmNIRB3poTE3BcBcG
   79TpiVFSO9u+umJfr6SRvd87JybXJtKKEuybKQv1A/X8gFysGoE4/RZAi
   el3pjqfRkqTx1RTVIZenblhZtjD0Bi3ZAmwZnqSWzGfXmA9Gpq6A4uAGO
   IPkBIDC4xDufyIeH3akdzemYUlbt8q52MtCbM6qATExaNsBumx7d3K9c7
   CsXhiB3durrTR5bBUt0vrLL1oNmajQqtXaGZ+PV/fgSKjJQQjdeqvpDMC
   Q==;
X-CSE-ConnectionGUID: tu9rfPAUSjC5P8U6Ru6cWg==
X-CSE-MsgGUID: bvKuSvwyRlSXpChoi+0k0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="92764184"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92764184"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 08:06:23 -0700
X-CSE-ConnectionGUID: 9NzYPo2DSo2AKTOTIrcIyA==
X-CSE-MsgGUID: KXu/I1A9S8anjBv+wKNEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228421616"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Mar 2026 08:06:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w53Kl-000000004jD-1LFY;
	Tue, 24 Mar 2026 15:06:19 +0000
Date: Tue, 24 Mar 2026 23:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/typec/ucsi/ucsi.c:88 ucsi_sync_control_common()
 error: we previously assumed 'cci' could be null (see line 84)
Message-ID: <202603242359.jnXVUjfe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 667ecac55861281c1f5e107c8550ae893b3984f6 usb: typec: ucsi: return C=
CI and message from sync_control callback
date:   1 year, 2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: hexagon-randconfig-r073-20260324 (https://download.01.org/0day-ci/a=
rchive/20260324/202603242359.jnXVUjfe-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603242359.jnXVUjfe-lkp@intel.com/

New smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:88 ucsi_sync_control_common() error: we previ=
ously assumed 'cci' could be null (see line 84)

Old smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:746 ucsi_get_pd_caps() warn: passing zero to =
'ERR_PTR'
drivers/usb/typec/ucsi/ucsi.c:1456 ucsi_dr_swap() warn: missing error code =
'ret'

vim +/cci +88 drivers/usb/typec/ucsi/ucsi.c

584e8df58942338 Dmitry Baryshkov 2024-06-27  57 =20
667ecac55861281 Dmitry Baryshkov 2025-01-20  58  int ucsi_sync_control_comm=
on(struct ucsi *ucsi, u64 command, u32 *cci,
667ecac55861281 Dmitry Baryshkov 2025-01-20  59  			     void *data, size_t=
 size)
584e8df58942338 Dmitry Baryshkov 2024-06-27  60  {
584e8df58942338 Dmitry Baryshkov 2024-06-27  61  	bool ack =3D UCSI_COMMAND=
(command) =3D=3D UCSI_ACK_CC_CI;
584e8df58942338 Dmitry Baryshkov 2024-06-27  62  	int ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  63 =20
584e8df58942338 Dmitry Baryshkov 2024-06-27  64  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  65  		set_bit(ACK_PENDING, &uc=
si->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  66  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  67  		set_bit(COMMAND_PENDING,=
 &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  68 =20
e37b383df91ba9b =C5=81ukasz Bartosik  2024-12-03  69  	reinit_completion(&u=
csi->complete);
e37b383df91ba9b =C5=81ukasz Bartosik  2024-12-03  70 =20
584e8df58942338 Dmitry Baryshkov 2024-06-27  71  	ret =3D ucsi->ops->async_=
control(ucsi, command);
584e8df58942338 Dmitry Baryshkov 2024-06-27  72  	if (ret)
584e8df58942338 Dmitry Baryshkov 2024-06-27  73  		goto out_clear_bit;
584e8df58942338 Dmitry Baryshkov 2024-06-27  74 =20
584e8df58942338 Dmitry Baryshkov 2024-06-27  75  	if (!wait_for_completion_=
timeout(&ucsi->complete, 5 * HZ))
584e8df58942338 Dmitry Baryshkov 2024-06-27  76  		ret =3D -ETIMEDOUT;
584e8df58942338 Dmitry Baryshkov 2024-06-27  77 =20
584e8df58942338 Dmitry Baryshkov 2024-06-27  78  out_clear_bit:
584e8df58942338 Dmitry Baryshkov 2024-06-27  79  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  80  		clear_bit(ACK_PENDING, &=
ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  81  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  82  		clear_bit(COMMAND_PENDIN=
G, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  83 =20
667ecac55861281 Dmitry Baryshkov 2025-01-20 @84  	if (!ret && cci)
667ecac55861281 Dmitry Baryshkov 2025-01-20  85  		ret =3D ucsi->ops->read_=
cci(ucsi, cci);
667ecac55861281 Dmitry Baryshkov 2025-01-20  86 =20
667ecac55861281 Dmitry Baryshkov 2025-01-20  87  	if (!ret && data &&
667ecac55861281 Dmitry Baryshkov 2025-01-20 @88  	    (*cci & UCSI_CCI_COMM=
AND_COMPLETE))
667ecac55861281 Dmitry Baryshkov 2025-01-20  89  		ret =3D ucsi->ops->read_=
message_in(ucsi, data, size);
667ecac55861281 Dmitry Baryshkov 2025-01-20  90 =20
584e8df58942338 Dmitry Baryshkov 2024-06-27  91  	return ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  92  }
584e8df58942338 Dmitry Baryshkov 2024-06-27  93  EXPORT_SYMBOL_GPL(ucsi_syn=
c_control_common);
584e8df58942338 Dmitry Baryshkov 2024-06-27  94 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
