Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F92EC081
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240303; cv=none; b=oTvNnZKWdn5KaxPPBSW08yXKvjP5WUt59UBlISb8shC16nRb+g/Wab/c0HKyDWsqH+oc1J3FwYGyBJdjhDwtUbmOFNXj7HXJpCTO8xePI59aR6DqrMKP/1l2KT9n748q7TbBD9G/BVmX3WOR7dxTaHBkeyTevapKHNwjCwX51Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240303; c=relaxed/simple;
	bh=SAbhM1GoNZzf/nk2rCqP0QCmpBWBZRfqChZJMD09Awo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o7/1bT69hk3Xy9E0JdjKuDVZaqPUYUNWpLyNDTIhQz2wcrKfuWupamMthYF9yNrzS7RChrF1Y1G/xtydSKWiFWBlJaZOyxIUlsLVhY8L0yJYyubHxUzFq0UI24hWtgQUDvbjfN9ZJ2ZDC6ILfdHLVek58IV23yhFLgeIwuMiDUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6DdAy2d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6DdAy2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771240301; x=1802776301;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SAbhM1GoNZzf/nk2rCqP0QCmpBWBZRfqChZJMD09Awo=;
  b=T6DdAy2d6YBwrk8aUpIPPK6WxEL6jNGl/tP0uvXxabrujoIk28X0qspE
   tTz+kZkrRjySUHqwEsIPbvd6jOZa2zWm0gq2xhOZpQNiTW5mBjlVVSj0f
   +forlcbI9QIrwNoAnqyKRNQYgJjvFvManxbuuz16k+zVQVqIsd4vAU/He
   7aLy4FU7BEMXLCOWml6AApkdJcUtPuVWlg6FJYgLg9biWiK6pGLDWKzy8
   U0V9mpmuvFhjx8iHj+DttYLrML4peUswaXWk+QX6g9i+6vb0H2OM8UQp/
   nQ36tRqOZ4KWttoibugSzOvzuJixwzf3eiPh074urKhMZZyEt+8NjsYd9
   Q==;
X-CSE-ConnectionGUID: G8hEiiLgSWiLCoEdjgaoEg==
X-CSE-MsgGUID: oyE7zHXRS0Ss582zvJL6Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83041994"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="83041994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:11:38 -0800
X-CSE-ConnectionGUID: Sjdc5kzBSn+nugIchmef2w==
X-CSE-MsgGUID: ZiMG/mPCTyaqWOA7xKUCRw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2026 03:11:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrwVq-00000000zce-3x0N;
	Mon, 16 Feb 2026 11:11:34 +0000
Date: Mon, 16 Feb 2026 19:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/nvme/target/pci-epf.c:1087:8-12: ERROR: reference
 preceded by free on line 1082
Message-ID: <202602161926.2b0yVKkf-lkp@intel.com>
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
TO: Damien Le Moal <dlemoal@kernel.org>
CC: Keith Busch <kbusch@kernel.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "Krzysztof Wilczy=C5=84ski" <kwilczynski@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: 0faa0fe6f90ea59b10d1b0f15ce0eb0c18eff186 nvmet: New NVMe PCI endpoi=
nt function target driver
date:   1 year, 1 month ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-r053-20260216 (https://download.01.org/0day-ci/a=
rchive/20260216/202602161926.2b0yVKkf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project afd=
4df07ab0262482829d4410a6bae9f2809d37b)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602161926.2b0yVKkf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/target/pci-epf.c:1087:8-12: ERROR: reference preceded by fr=
ee on line 1082

vim +1087 drivers/nvme/target/pci-epf.c

0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1033 =20
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1034  static int nvmet_pci_epf_io=
d_parse_sgl_segments(struct nvmet_pci_epf_ctrl *ctrl,
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1035  						struct nvmet_pci_epf_=
iod *iod)
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1036  {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1037  	struct nvme_command *cmd =
=3D &iod->cmd;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1038  	struct nvme_sgl_desc seg =
=3D cmd->common.dptr.sgl;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1039  	struct nvme_sgl_desc *sgls=
 =3D NULL;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1040  	int n =3D 0, i, nr_sgls;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1041  	int ret;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1042 =20
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1043  	/*
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1044  	 * We do not support inlin=
e data nor keyed SGLs, so we should be seeing
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1045  	 * only segment descriptor=
s.
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1046  	 */
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1047  	if (seg.type !=3D (NVME_SG=
L_FMT_SEG_DESC << 4) &&
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1048  	    seg.type !=3D (NVME_SG=
L_FMT_LAST_SEG_DESC << 4)) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1049  		iod->status =3D NVME_SC_S=
GL_INVALID_TYPE | NVME_STATUS_DNR;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1050  		return -EIO;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1051  	}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1052 =20
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1053  	while (seg.length) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1054  		sgls =3D nvmet_pci_epf_ge=
t_sgl_segment(ctrl, &seg, &nr_sgls);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1055  		if (!sgls) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1056  			iod->status =3D NVME_SC_=
INTERNAL | NVME_STATUS_DNR;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1057  			return -EIO;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1058  		}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1059 =20
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1060  		/* Grow the PCI segment t=
able as needed. */
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1061  		ret =3D nvmet_pci_epf_all=
oc_iod_data_segs(iod, nr_sgls);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1062  		if (ret) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1063  			iod->status =3D NVME_SC_=
INTERNAL | NVME_STATUS_DNR;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1064  			goto out;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1065  		}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1066 =20
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1067  		/*
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1068  		 * Parse the SGL descript=
ors to build the PCI segment table,
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1069  		 * checking the descripto=
r type as we go.
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1070  		 */
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1071  		for (i =3D 0; i < nr_sgls=
; i++) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1072  			if (sgls[i].type !=3D (N=
VME_SGL_FMT_DATA_DESC << 4)) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1073  				iod->status =3D NVME_SC=
_SGL_INVALID_TYPE |
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1074  					NVME_STATUS_DNR;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1075  				goto out;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1076  			}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1077  			iod->data_segs[n].pci_ad=
dr =3D le64_to_cpu(sgls[i].addr);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1078  			iod->data_segs[n].length=
 =3D le32_to_cpu(sgls[i].length);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1079  			n++;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1080  		}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1081 =20
0faa0fe6f90ea5 Damien Le Moal 2025-01-04 @1082  		kfree(sgls);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1083  	}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1084 =20
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1085   out:
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1086  	if (iod->status !=3D NVME_=
SC_SUCCESS) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04 @1087  		kfree(sgls);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1088  		return -EIO;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1089  	}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1090 =20
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1091  	return 0;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1092  }
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1093 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
