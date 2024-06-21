Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FDA394
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jun 2024 00:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718929325; cv=none; b=NM3Pnk4+emSyzpCQiYA62dvjRMiaWIm0q3TbuOjgjDozlxJpwjaKu+BKVPE8SBKRZYNHEyHXrZsWgBIzFMa4pkPo9JBeiYSGVVz/cYhqwmCrHEBGLsFOZoqhUJkL52Tvj9JSuvNhh+3yvp9CEK5lFDfFWvV2pMSufC2iAZKN/3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718929325; c=relaxed/simple;
	bh=rYtcivBIRMPFXqsDlTT3vjQbcVhM3BwsOPl40nNjGXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HYdAZL+zkf0RyI7zqMk5DNImY+m++8YV6N04Vf3P9feRttFzcsHNZCDcFglCKt9nA1Wd8X0w2XPuav8XE6+g6J1Lx7ZGxRcIR3QsLx8jlXPV4OMayX0cw0WlpAIeYcmPlkiIDd7tjss1RDu8GgWeRQbcEdOFrX75DaPqGVvjKls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJ3WrwIr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJ3WrwIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718929323; x=1750465323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rYtcivBIRMPFXqsDlTT3vjQbcVhM3BwsOPl40nNjGXU=;
  b=lJ3WrwIrNfNqxZjSHEkhYNynScfYGoRiWo5cl5JzfqXgtNq6mg9tnbM2
   rovRYIhPemtUfblSOta1KzWmQvhjpfOiCEOIKq6Mpi5ND/h/VPNpxi61t
   TrgK6hXQ5nEh8mZaSLf609SGFkMA+9w50FTqqUfsiI0728QW+M5y7/Vcm
   2wbiFsIIqYKJH3IumbftBHo9g61qAB9/7BdwfPuBYuN/aYO16pp9eDwh+
   fVC9RIBevLCUnK+Im/xzxAeiK+3spIwUQP96VKe8yVvvRvi8cIeGgJ8fO
   MbjuSufAXu0f4RHV4CrrA+ASmeNrd5QtyYNDxVUHYbJ68YSo2M2pOG/RC
   Q==;
X-CSE-ConnectionGUID: coAXUb26S2msWZCS2cMzPQ==
X-CSE-MsgGUID: 85mlK0T8Ttqk6gOwIl3NuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33403628"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="33403628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 17:22:03 -0700
X-CSE-ConnectionGUID: 4dZ4YvqRQTCmszw424hp9g==
X-CSE-MsgGUID: +thihflpQIi1CT7zX4IL1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="43094449"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2024 17:22:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKS2Q-00083S-2R;
	Fri, 21 Jun 2024 00:21:58 +0000
Date: Fri, 21 Jun 2024 08:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 05/11] qla2xxx: Fix flash read failure
Message-ID: <202406210815.rPDRDMBi-lkp@intel.com>
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
In-Reply-To: <20240618133739.35456-6-njavali@marvell.com>
References: <20240618133739.35456-6-njavali@marvell.com>
TO: Nilesh Javali <njavali@marvell.com>
TO: martin.petersen@oracle.com
CC: linux-scsi@vger.kernel.org
CC: GR-QLogic-Storage-Upstream@marvell.com
CC: agurumurthy@marvell.com
CC: sdeodhar@marvell.com
CC: emilne@redhat.com
CC: jmeneghi@redhat.com

Hi Nilesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e8a1d87b7983b461d1d625e2973cdaadc0bd8ff5]

url:    https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/qla2xxx-unable-to-act-on-RSCN-for-port-online/20240618-223303
base:   e8a1d87b7983b461d1d625e2973cdaadc0bd8ff5
patch link:    https://lore.kernel.org/r/20240618133739.35456-6-njavali%40marvell.com
patch subject: [PATCH 05/11] qla2xxx: Fix flash read failure
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210815.rPDRDMBi-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406210815.rPDRDMBi-lkp@intel.com/

smatch warnings:
drivers/scsi/qla2xxx/qla_sup.c:3581 qla24xx_get_flash_version() warn: missing error code? 'ret'

vim +/ret +3581 drivers/scsi/qla2xxx/qla_sup.c

7ec0effd30bb4b Atul Deshmukh       2013-08-27  3421  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3422  int
7b867cf76fbcc8 Anirban Chakraborty 2008-11-06  3423  qla24xx_get_flash_version(scsi_qla_host_t *vha, void *mbuf)
30c4766213aeb6 Andrew Vasquez      2007-01-29  3424  {
30c4766213aeb6 Andrew Vasquez      2007-01-29  3425  	int ret = QLA_SUCCESS;
3695310e37b4e5 Joe Carnuccio       2019-03-12  3426  	uint32_t pcihdr = 0, pcids = 0;
3695310e37b4e5 Joe Carnuccio       2019-03-12  3427  	uint32_t *dcode = mbuf;
3695310e37b4e5 Joe Carnuccio       2019-03-12  3428  	uint8_t *bcode = mbuf;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3429  	uint8_t code_type, last_image;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3430  	int i;
7b867cf76fbcc8 Anirban Chakraborty 2008-11-06  3431  	struct qla_hw_data *ha = vha->hw;
4243c115f47757 Sawan Chandak       2016-01-27  3432  	uint32_t faddr = 0;
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3433  	struct active_regions active_regions = { };
4243c115f47757 Sawan Chandak       2016-01-27  3434  
7ec0effd30bb4b Atul Deshmukh       2013-08-27  3435  	if (IS_P3P_TYPE(ha))
a9083016a5314b Giridhar Malavali   2010-04-12  3436  		return ret;
a9083016a5314b Giridhar Malavali   2010-04-12  3437  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3438  	if (!mbuf)
30c4766213aeb6 Andrew Vasquez      2007-01-29  3439  		return QLA_FUNCTION_FAILED;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3440  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3441  	memset(ha->bios_revision, 0, sizeof(ha->bios_revision));
30c4766213aeb6 Andrew Vasquez      2007-01-29  3442  	memset(ha->efi_revision, 0, sizeof(ha->efi_revision));
30c4766213aeb6 Andrew Vasquez      2007-01-29  3443  	memset(ha->fcode_revision, 0, sizeof(ha->fcode_revision));
30c4766213aeb6 Andrew Vasquez      2007-01-29  3444  	memset(ha->fw_revision, 0, sizeof(ha->fw_revision));
30c4766213aeb6 Andrew Vasquez      2007-01-29  3445  
6315a5f810d8cf Harish Zunjarrao    2009-03-24  3446  	pcihdr = ha->flt_region_boot << 2;
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3447  	if (IS_QLA27XX(ha) || IS_QLA28XX(ha)) {
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3448  		qla27xx_get_active_image(vha, &active_regions);
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3449  		if (active_regions.global == QLA27XX_SECONDARY_IMAGE) {
4243c115f47757 Sawan Chandak       2016-01-27  3450  			pcihdr = ha->flt_region_boot_sec << 2;
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3451  		}
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3452  	}
4243c115f47757 Sawan Chandak       2016-01-27  3453  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3454  	do {
30c4766213aeb6 Andrew Vasquez      2007-01-29  3455  		/* Verify PCI expansion ROM header. */
7aa8fb6727f57f Quinn Tran          2024-06-18  3456  		ret = qla24xx_read_flash_data(vha, dcode, pcihdr >> 2, 0x20);
7aa8fb6727f57f Quinn Tran          2024-06-18  3457  		if (ret) {
7aa8fb6727f57f Quinn Tran          2024-06-18  3458  			ql_log(ql_log_info, vha, 0x017d,
7aa8fb6727f57f Quinn Tran          2024-06-18  3459  			    "Unable to read PCI EXP Rom Header(%x).\n", ret);
7aa8fb6727f57f Quinn Tran          2024-06-18  3460  			break;
7aa8fb6727f57f Quinn Tran          2024-06-18  3461  		}
7aa8fb6727f57f Quinn Tran          2024-06-18  3462  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3463  		bcode = mbuf + (pcihdr % 4);
3695310e37b4e5 Joe Carnuccio       2019-03-12  3464  		if (memcmp(bcode, "\x55\xaa", 2)) {
30c4766213aeb6 Andrew Vasquez      2007-01-29  3465  			/* No signature */
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3466  			ql_log(ql_log_fatal, vha, 0x0059,
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3467  			    "No matching ROM signature.\n");
30c4766213aeb6 Andrew Vasquez      2007-01-29  3468  			ret = QLA_FUNCTION_FAILED;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3469  			break;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3470  		}
30c4766213aeb6 Andrew Vasquez      2007-01-29  3471  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3472  		/* Locate PCI data structure. */
30c4766213aeb6 Andrew Vasquez      2007-01-29  3473  		pcids = pcihdr + ((bcode[0x19] << 8) | bcode[0x18]);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3474  
7aa8fb6727f57f Quinn Tran          2024-06-18  3475  		ret = qla24xx_read_flash_data(vha, dcode, pcids >> 2, 0x20);
7aa8fb6727f57f Quinn Tran          2024-06-18  3476  		if (ret) {
7aa8fb6727f57f Quinn Tran          2024-06-18  3477  			ql_log(ql_log_info, vha, 0x018e,
7aa8fb6727f57f Quinn Tran          2024-06-18  3478  			    "Unable to read PCI Data Structure (%x).\n", ret);
7aa8fb6727f57f Quinn Tran          2024-06-18  3479  			break;
7aa8fb6727f57f Quinn Tran          2024-06-18  3480  		}
7aa8fb6727f57f Quinn Tran          2024-06-18  3481  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3482  		bcode = mbuf + (pcihdr % 4);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3483  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3484  		/* Validate signature of PCI data structure. */
3695310e37b4e5 Joe Carnuccio       2019-03-12  3485  		if (memcmp(bcode, "PCIR", 4)) {
30c4766213aeb6 Andrew Vasquez      2007-01-29  3486  			/* Incorrect header. */
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3487  			ql_log(ql_log_fatal, vha, 0x005a,
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3488  			    "PCI data struct not found pcir_adr=%x.\n", pcids);
3695310e37b4e5 Joe Carnuccio       2019-03-12  3489  			ql_dump_buffer(ql_dbg_init, vha, 0x0059, dcode, 32);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3490  			ret = QLA_FUNCTION_FAILED;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3491  			break;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3492  		}
30c4766213aeb6 Andrew Vasquez      2007-01-29  3493  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3494  		/* Read version */
30c4766213aeb6 Andrew Vasquez      2007-01-29  3495  		code_type = bcode[0x14];
30c4766213aeb6 Andrew Vasquez      2007-01-29  3496  		switch (code_type) {
30c4766213aeb6 Andrew Vasquez      2007-01-29  3497  		case ROM_CODE_TYPE_BIOS:
30c4766213aeb6 Andrew Vasquez      2007-01-29  3498  			/* Intel x86, PC-AT compatible. */
30c4766213aeb6 Andrew Vasquez      2007-01-29  3499  			ha->bios_revision[0] = bcode[0x12];
30c4766213aeb6 Andrew Vasquez      2007-01-29  3500  			ha->bios_revision[1] = bcode[0x13];
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3501  			ql_dbg(ql_dbg_init, vha, 0x005b,
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3502  			    "Read BIOS %d.%d.\n",
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3503  			    ha->bios_revision[1], ha->bios_revision[0]);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3504  			break;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3505  		case ROM_CODE_TYPE_FCODE:
30c4766213aeb6 Andrew Vasquez      2007-01-29  3506  			/* Open Firmware standard for PCI (FCode). */
30c4766213aeb6 Andrew Vasquez      2007-01-29  3507  			ha->fcode_revision[0] = bcode[0x12];
30c4766213aeb6 Andrew Vasquez      2007-01-29  3508  			ha->fcode_revision[1] = bcode[0x13];
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3509  			ql_dbg(ql_dbg_init, vha, 0x005c,
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3510  			    "Read FCODE %d.%d.\n",
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3511  			    ha->fcode_revision[1], ha->fcode_revision[0]);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3512  			break;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3513  		case ROM_CODE_TYPE_EFI:
30c4766213aeb6 Andrew Vasquez      2007-01-29  3514  			/* Extensible Firmware Interface (EFI). */
30c4766213aeb6 Andrew Vasquez      2007-01-29  3515  			ha->efi_revision[0] = bcode[0x12];
30c4766213aeb6 Andrew Vasquez      2007-01-29  3516  			ha->efi_revision[1] = bcode[0x13];
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3517  			ql_dbg(ql_dbg_init, vha, 0x005d,
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3518  			    "Read EFI %d.%d.\n",
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3519  			    ha->efi_revision[1], ha->efi_revision[0]);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3520  			break;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3521  		default:
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3522  			ql_log(ql_log_warn, vha, 0x005e,
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3523  			    "Unrecognized code type %x at pcids %x.\n",
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3524  			    code_type, pcids);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3525  			break;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3526  		}
30c4766213aeb6 Andrew Vasquez      2007-01-29  3527  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3528  		last_image = bcode[0x15] & BIT_7;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3529  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3530  		/* Locate next PCI expansion ROM. */
30c4766213aeb6 Andrew Vasquez      2007-01-29  3531  		pcihdr += ((bcode[0x11] << 8) | bcode[0x10]) * 512;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3532  	} while (!last_image);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3533  
30c4766213aeb6 Andrew Vasquez      2007-01-29  3534  	/* Read firmware image information. */
30c4766213aeb6 Andrew Vasquez      2007-01-29  3535  	memset(ha->fw_revision, 0, sizeof(ha->fw_revision));
4243c115f47757 Sawan Chandak       2016-01-27  3536  	faddr = ha->flt_region_fw;
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3537  	if (IS_QLA27XX(ha) || IS_QLA28XX(ha)) {
3f006ac342c033 Michael Hernandez   2019-03-12  3538  		qla27xx_get_active_image(vha, &active_regions);
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3539  		if (active_regions.global == QLA27XX_SECONDARY_IMAGE)
4243c115f47757 Sawan Chandak       2016-01-27  3540  			faddr = ha->flt_region_fw_sec;
5fa8774c7f38c7 Joe Carnuccio       2019-03-12  3541  	}
30c4766213aeb6 Andrew Vasquez      2007-01-29  3542  
7aa8fb6727f57f Quinn Tran          2024-06-18  3543  	ret = qla24xx_read_flash_data(vha, dcode, faddr, 8);
7aa8fb6727f57f Quinn Tran          2024-06-18  3544  	if (ret) {
7aa8fb6727f57f Quinn Tran          2024-06-18  3545  		ql_log(ql_log_info, vha, 0x019e,
7aa8fb6727f57f Quinn Tran          2024-06-18  3546  		    "Unable to read FW version (%x).\n", ret);
7aa8fb6727f57f Quinn Tran          2024-06-18  3547  	} else {
f8f97b0c5b7f7c Joe Carnuccio       2019-03-12  3548  		if (qla24xx_risc_firmware_invalid(dcode)) {
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3549  			ql_log(ql_log_warn, vha, 0x005f,
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3550  			    "Unrecognized fw revision at %x.\n",
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3551  			    ha->flt_region_fw * 4);
3695310e37b4e5 Joe Carnuccio       2019-03-12  3552  			ql_dump_buffer(ql_dbg_init, vha, 0x005f, dcode, 32);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3553  		} else {
f8f97b0c5b7f7c Joe Carnuccio       2019-03-12  3554  			for (i = 0; i < 4; i++)
7ffa5b939751b6 Bart Van Assche     2020-05-18  3555  				ha->fw_revision[i] =
7ffa5b939751b6 Bart Van Assche     2020-05-18  3556  				be32_to_cpu((__force __be32)dcode[4+i]);
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3557  			ql_dbg(ql_dbg_init, vha, 0x0060,
3695310e37b4e5 Joe Carnuccio       2019-03-12  3558  			    "Firmware revision (flash) %u.%u.%u (%x).\n",
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3559  			    ha->fw_revision[0], ha->fw_revision[1],
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3560  			    ha->fw_revision[2], ha->fw_revision[3]);
30c4766213aeb6 Andrew Vasquez      2007-01-29  3561  		}
7aa8fb6727f57f Quinn Tran          2024-06-18  3562  	}
30c4766213aeb6 Andrew Vasquez      2007-01-29  3563  
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3564  	/* Check for golden firmware and get version if available */
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3565  	if (!IS_QLA81XX(ha)) {
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3566  		/* Golden firmware is not present in non 81XX adapters */
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3567  		return ret;
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3568  	}
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3569  
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3570  	memset(ha->gold_fw_version, 0, sizeof(ha->gold_fw_version));
3695310e37b4e5 Joe Carnuccio       2019-03-12  3571  	faddr = ha->flt_region_gold_fw;
7aa8fb6727f57f Quinn Tran          2024-06-18  3572  	ret = qla24xx_read_flash_data(vha, dcode, ha->flt_region_gold_fw, 8);
7aa8fb6727f57f Quinn Tran          2024-06-18  3573  	if (ret) {
7aa8fb6727f57f Quinn Tran          2024-06-18  3574  		ql_log(ql_log_info, vha, 0x019f,
7aa8fb6727f57f Quinn Tran          2024-06-18  3575  		    "Unable to read Gold FW version (%x).\n", ret);
7aa8fb6727f57f Quinn Tran          2024-06-18  3576  	} else {
f8f97b0c5b7f7c Joe Carnuccio       2019-03-12  3577  		if (qla24xx_risc_firmware_invalid(dcode)) {
7c3df1320e5e87 Saurav Kashyap      2011-07-14  3578  			ql_log(ql_log_warn, vha, 0x0056,
3695310e37b4e5 Joe Carnuccio       2019-03-12  3579  			    "Unrecognized golden fw at %#x.\n", faddr);
3695310e37b4e5 Joe Carnuccio       2019-03-12  3580  			ql_dump_buffer(ql_dbg_init, vha, 0x0056, dcode, 32);
0f2d962f4d120e Madhuranath Iyengar 2010-07-23 @3581  			return ret;
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3582  		}
0f2d962f4d120e Madhuranath Iyengar 2010-07-23  3583  
f8f97b0c5b7f7c Joe Carnuccio       2019-03-12  3584  		for (i = 0; i < 4; i++)
7ffa5b939751b6 Bart Van Assche     2020-05-18  3585  			ha->gold_fw_version[i] =
7ffa5b939751b6 Bart Van Assche     2020-05-18  3586  			   be32_to_cpu((__force __be32)dcode[4+i]);
7aa8fb6727f57f Quinn Tran          2024-06-18  3587  	}
30c4766213aeb6 Andrew Vasquez      2007-01-29  3588  	return ret;
30c4766213aeb6 Andrew Vasquez      2007-01-29  3589  }
cb8dacbf1110d8 Andrew Vasquez      2008-04-03  3590  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
