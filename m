Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5265FB67A
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772987091; cv=none; b=rcx8bLHaSSOsJQ5ojDctzDKY7zM92+FM568qWRbDC8ovJfXglhegJFYigbveHM0GCXdwkOtY7oktej0/8wjbNYVtlkOpln7IG6wmUGndJJqEkpbv8YvTNm0gPEW2EJq6VXUneHuUvCpACLtIX3Nip/yHLhXA6TuuuXR/ItXumAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772987091; c=relaxed/simple;
	bh=douQDcjA1ALW8z1XTK4BcY1IYxotwrpDCnMFHjjELVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mC/HeRzY/wM/WHgk1cYm/QshEVVB1yvm0UPMjQNvpdg9qa+JNS17bi6rnybdhk2QSlars7CYLOl6Fsxhvc8rK28L/Gvlg5s5+u2r89QT6EXZkcd859f9jTOUU2tXFDlCSk1cif3d4y9G4agrzVhu1S26vNnJ/3kwP0oUUJOjSMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COEpnfgJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COEpnfgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772987087; x=1804523087;
  h=date:from:to:cc:subject:message-id;
  bh=douQDcjA1ALW8z1XTK4BcY1IYxotwrpDCnMFHjjELVM=;
  b=COEpnfgJBAIH5TpaGGcXoX62vtPwkm7JeCe3QPvbskOJ1mP7BcQphdl8
   5RGy+j5/b6UAbw2nxp6kVL6EmCOyvIV+sa6rppqRqpQL9GJtyxC2pe5vI
   vlngpHjVX46ZiIhT02/sHeHfU2cXS4Xz5mCoy0GXXeTbL5ehBPWgNAJ+W
   x3mQmUy8tfJJ/YbbwlMnUfyx7B+cHHmsLT/AA8wOrrL4ZN16oSNHf145O
   XPiaYHhIkihxcbXXhYHHGPxkNb5HSFe1s+X1L3UH/CCX+I0cL9Ld2tsyj
   JmhSQigsX8sToAcGb9bdK+8xz+P+2/cAyo25N7GGF/PnPz5wSrDcT4p4e
   w==;
X-CSE-ConnectionGUID: KV/cxPn3R7mYzKNoinB4KA==
X-CSE-MsgGUID: GxkTgvBCTaSvL6HrPGVzqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77626730"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="77626730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 09:24:47 -0700
X-CSE-ConnectionGUID: yN8F/+pJTPOnQdIpgPkIHw==
X-CSE-MsgGUID: KLJv7X/jQZGhStaxYQnJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="223986535"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Mar 2026 09:24:46 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzGvq-000000003FW-1vRA;
	Sun, 08 Mar 2026 16:24:42 +0000
Date: Mon, 09 Mar 2026 00:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 120/471] drivers/pci/vgaarb.c:1146
 vga_arb_write() warn: potential spectre issue 'kbuf' [w]
Message-ID: <202603090026.SMKwdoH7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 6efb05fdf8d9ae9c3ba8f4a9bd8ea4bc3d894c1c [120/471] drivers/pci: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260309/202603090026.SMKwdoH7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603090026.SMKwdoH7-lkp@intel.com/

smatch warnings:
drivers/pci/vgaarb.c:1146 vga_arb_write() warn: potential spectre issue 'kbuf' [w]

vim +/kbuf +1146 drivers/pci/vgaarb.c

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1121  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1122  /*
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1123   * TODO: To avoid parsing inside kernel and to improve the speed we may
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1124   * consider use ioctl here
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1125   */
6efb05fdf8d9ae drivers/pci/vgaarb.c     Jens Axboe             2024-04-05  1126  static ssize_t vga_arb_write(struct kiocb *iocb, struct iov_iter *from)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1127  {
6efb05fdf8d9ae drivers/pci/vgaarb.c     Jens Axboe             2024-04-05  1128  	struct vga_arb_private *priv = iocb->ki_filp->private_data;
6efb05fdf8d9ae drivers/pci/vgaarb.c     Jens Axboe             2024-04-05  1129  	size_t count = iov_iter_count(from);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1130  	struct vga_arb_user_card *uc = NULL;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1131  	struct pci_dev *pdev;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1132  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1133  	unsigned int io_state;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1134  
49521b13cbc02a drivers/gpu/vga/vgaarb.c Dmitry Vyukov          2016-10-14  1135  	char kbuf[64], *curr_pos;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1136  	size_t remaining = count;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1137  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1138  	int ret_val;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1139  	int i;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1140  
49521b13cbc02a drivers/gpu/vga/vgaarb.c Dmitry Vyukov          2016-10-14  1141  	if (count >= sizeof(kbuf))
49521b13cbc02a drivers/gpu/vga/vgaarb.c Dmitry Vyukov          2016-10-14  1142  		return -EINVAL;
6efb05fdf8d9ae drivers/pci/vgaarb.c     Jens Axboe             2024-04-05  1143  	if (!copy_from_iter_full(kbuf, count, from))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1144  		return -EFAULT;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1145  	curr_pos = kbuf;
cc64ca4b62f503 drivers/pci/vgaarb.c     Sui Jingfeng           2023-08-09 @1146  	kbuf[count] = '\0';
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1147  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1148  	if (strncmp(curr_pos, "lock ", 5) == 0) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1149  		curr_pos += 5;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1150  		remaining -= 5;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1151  
2d6e9b91971034 drivers/gpu/vga/vgaarb.c Tiago Vignatti         2010-05-24  1152  		pr_debug("client 0x%p called 'lock'\n", priv);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1153  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1154  		if (!vga_str_to_iostate(curr_pos, remaining, &io_state)) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1155  			ret_val = -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1156  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1157  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1158  		if (io_state == VGA_RSRC_NONE) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1159  			ret_val = -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1160  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1161  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1162  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1163  		pdev = priv->target;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1164  		if (priv->target == NULL) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1165  			ret_val = -ENODEV;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1166  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1167  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1168  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1169  		vga_get_uninterruptible(pdev, io_state);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1170  
cc64ca4b62f503 drivers/pci/vgaarb.c     Sui Jingfeng           2023-08-09  1171  		/* Update the client's locks lists */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1172  		for (i = 0; i < MAX_USER_CARDS; i++) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1173  			if (priv->cards[i].pdev == pdev) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1174  				if (io_state & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1175  					priv->cards[i].io_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1176  				if (io_state & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1177  					priv->cards[i].mem_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1178  				break;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1179  			}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1180  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1181  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1182  		ret_val = count;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1183  		goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1184  	} else if (strncmp(curr_pos, "unlock ", 7) == 0) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1185  		curr_pos += 7;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1186  		remaining -= 7;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1187  
2d6e9b91971034 drivers/gpu/vga/vgaarb.c Tiago Vignatti         2010-05-24  1188  		pr_debug("client 0x%p called 'unlock'\n", priv);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1189  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1190  		if (strncmp(curr_pos, "all", 3) == 0)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1191  			io_state = VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1192  		else {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1193  			if (!vga_str_to_iostate
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1194  			    (curr_pos, remaining, &io_state)) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1195  				ret_val = -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1196  				goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1197  			}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1198  			/* TODO: Add this?
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1199  			   if (io_state == VGA_RSRC_NONE) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1200  			   ret_val = -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1201  			   goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1202  			   }
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1203  			  */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1204  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1205  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1206  		pdev = priv->target;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1207  		if (priv->target == NULL) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1208  			ret_val = -ENODEV;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1209  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1210  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1211  		for (i = 0; i < MAX_USER_CARDS; i++) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1212  			if (priv->cards[i].pdev == pdev)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1213  				uc = &priv->cards[i];
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1214  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1215  
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1216  		if (!uc) {
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1217  			ret_val = -EINVAL;
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1218  			goto done;
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1219  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1220  
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1221  		if (io_state & VGA_RSRC_LEGACY_IO && uc->io_cnt == 0) {
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1222  			ret_val = -EINVAL;
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1223  			goto done;
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1224  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1225  
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1226  		if (io_state & VGA_RSRC_LEGACY_MEM && uc->mem_cnt == 0) {
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1227  			ret_val = -EINVAL;
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1228  			goto done;
c916874d60d9da drivers/gpu/vga/vgaarb.c Julia Lawall           2011-11-15  1229  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1230  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1231  		vga_put(pdev, io_state);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1232  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1233  		if (io_state & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1234  			uc->io_cnt--;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1235  		if (io_state & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1236  			uc->mem_cnt--;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1237  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1238  		ret_val = count;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1239  		goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1240  	} else if (strncmp(curr_pos, "trylock ", 8) == 0) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1241  		curr_pos += 8;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1242  		remaining -= 8;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1243  
2d6e9b91971034 drivers/gpu/vga/vgaarb.c Tiago Vignatti         2010-05-24  1244  		pr_debug("client 0x%p called 'trylock'\n", priv);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1245  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1246  		if (!vga_str_to_iostate(curr_pos, remaining, &io_state)) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1247  			ret_val = -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1248  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1249  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1250  		/* TODO: Add this?
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1251  		   if (io_state == VGA_RSRC_NONE) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1252  		   ret_val = -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1253  		   goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1254  		   }
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1255  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1256  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1257  		pdev = priv->target;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1258  		if (priv->target == NULL) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1259  			ret_val = -ENODEV;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1260  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1261  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1262  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1263  		if (vga_tryget(pdev, io_state)) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1264  			/* Update the client's locks lists... */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1265  			for (i = 0; i < MAX_USER_CARDS; i++) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1266  				if (priv->cards[i].pdev == pdev) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1267  					if (io_state & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1268  						priv->cards[i].io_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1269  					if (io_state & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1270  						priv->cards[i].mem_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1271  					break;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1272  				}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1273  			}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1274  			ret_val = count;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1275  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1276  		} else {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1277  			ret_val = -EBUSY;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1278  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1279  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1280  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1281  	} else if (strncmp(curr_pos, "target ", 7) == 0) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1282  		unsigned int domain, bus, devfn;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1283  		struct vga_device *vgadev;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1284  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1285  		curr_pos += 7;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1286  		remaining -= 7;
2d6e9b91971034 drivers/gpu/vga/vgaarb.c Tiago Vignatti         2010-05-24  1287  		pr_debug("client 0x%p called 'target'\n", priv);
cc64ca4b62f503 drivers/pci/vgaarb.c     Sui Jingfeng           2023-08-09  1288  		/* If target is default */
2cc9116c2b37c5 drivers/gpu/vga/vgaarb.c Kyle McMartin          2010-02-16  1289  		if (!strncmp(curr_pos, "default", 7))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1290  			pdev = pci_dev_get(vga_default_device());
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1291  		else {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1292  			if (!vga_pci_str_to_vars(curr_pos, remaining,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1293  						 &domain, &bus, &devfn)) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1294  				ret_val = -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1295  				goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1296  			}
f85567c89e2500 drivers/gpu/vga/vgaarb.c Jiang Liu              2012-08-28  1297  			pdev = pci_get_domain_bus_and_slot(domain, bus, devfn);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1298  			if (!pdev) {
cf590b87327017 drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-18  1299  				pr_debug("invalid PCI address %04x:%02x:%02x.%x\n",
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  1300  					 domain, bus, PCI_SLOT(devfn),
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  1301  					 PCI_FUNC(devfn));
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1302  				ret_val = -ENODEV;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1303  				goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1304  			}
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  1305  
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  1306  			pr_debug("%s ==> %04x:%02x:%02x.%x pdev %p\n", curr_pos,
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  1307  				domain, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  1308  				pdev);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1309  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1310  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1311  		vgadev = vgadev_find(pdev);
8b7e2e865fef94 drivers/gpu/vga/vgaarb.c Thierry Reding         2015-08-12  1312  		pr_debug("vgadev %p\n", vgadev);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1313  		if (vgadev == NULL) {
eb6944f2fc01d5 drivers/gpu/vga/vgaarb.c Thierry Reding         2015-08-12  1314  			if (pdev) {
cf590b87327017 drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-18  1315  				vgaarb_dbg(&pdev->dev, "not a VGA device\n");
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1316  				pci_dev_put(pdev);
eb6944f2fc01d5 drivers/gpu/vga/vgaarb.c Thierry Reding         2015-08-12  1317  			}
eb6944f2fc01d5 drivers/gpu/vga/vgaarb.c Thierry Reding         2015-08-12  1318  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1319  			ret_val = -ENODEV;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1320  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1321  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1322  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1323  		priv->target = pdev;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1324  		for (i = 0; i < MAX_USER_CARDS; i++) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1325  			if (priv->cards[i].pdev == pdev)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1326  				break;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1327  			if (priv->cards[i].pdev == NULL) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1328  				priv->cards[i].pdev = pdev;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1329  				priv->cards[i].io_cnt = 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1330  				priv->cards[i].mem_cnt = 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1331  				break;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1332  			}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1333  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1334  		if (i == MAX_USER_CARDS) {
cf590b87327017 drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-18  1335  			vgaarb_dbg(&pdev->dev, "maximum user cards (%d) number reached, ignoring this one!\n",
773a38dbdad034 drivers/gpu/vga/vgaarb.c Mike Travis            2010-02-02  1336  				MAX_USER_CARDS);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1337  			pci_dev_put(pdev);
cc64ca4b62f503 drivers/pci/vgaarb.c     Sui Jingfeng           2023-08-09  1338  			/* XXX: Which value to return? */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1339  			ret_val =  -ENOMEM;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1340  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1341  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1342  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1343  		ret_val = count;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1344  		pci_dev_put(pdev);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1345  		goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1346  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1347  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1348  	} else if (strncmp(curr_pos, "decodes ", 8) == 0) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1349  		curr_pos += 8;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1350  		remaining -= 8;
8b7e2e865fef94 drivers/gpu/vga/vgaarb.c Thierry Reding         2015-08-12  1351  		pr_debug("client 0x%p called 'decodes'\n", priv);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1352  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1353  		if (!vga_str_to_iostate(curr_pos, remaining, &io_state)) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1354  			ret_val = -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1355  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1356  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1357  		pdev = priv->target;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1358  		if (priv->target == NULL) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1359  			ret_val = -ENODEV;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1360  			goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1361  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1362  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1363  		__vga_set_legacy_decoding(pdev, io_state, true);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1364  		ret_val = count;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1365  		goto done;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1366  	}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1367  	/* If we got here, the message written is not part of the protocol! */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1368  	return -EPROTO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1369  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1370  done:
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1371  	return ret_val;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1372  }
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  1373  

:::::: The code at line 1146 was first introduced by commit
:::::: cc64ca4b62f5035c87e955f256b338c32dfdbb19 PCI/VGA: Fix typos

:::::: TO: Sui Jingfeng <suijingfeng@loongson.cn>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
