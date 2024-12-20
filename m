Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F45A137C37
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734679016; cv=none; b=nPAhxmvSR/DlpfDx0D9J2AjC8TRg60o+MsRQv3AmjlHIOi9hDtTXv+GCv8QI8I7OAEF4MYSm5hLloepjBiEUxo4OGq+8XBDrl2buRMxXBnkL1DN/3gxY6D6IkLksqNhhlpFzLK3GEaQ2qWYA0ABcD6JCmTTsYDRo/A+aMGOgf9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734679016; c=relaxed/simple;
	bh=396V9N0j7/5Dw01Mfdg3g9KH1VAswxlsZlw1yKbm3zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X4IqAWQd0KQGY8NF3dTtOgOPpq6y4CsfLkvqXpgjkwxuQc8vl5xh9h7R07HZri94340FqHNpdfFCrW8Ieflor23EtIvZJHpz1aG8I6+t5Grlg2P635OwlT49Pu3SDM9bt0ZBK1q6HouSagQyR17XxiAreu2QQNnEqAZXO5y9Vlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWQN2YgE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWQN2YgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734679014; x=1766215014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=396V9N0j7/5Dw01Mfdg3g9KH1VAswxlsZlw1yKbm3zs=;
  b=hWQN2YgEJZEnu1WCzU0o49OHmVi8rUp0phMF/b8ziJXkL8uvZ7xnsTgj
   ZAKHGomknpVBzhv1dNvJP8JQiL48bYQIk/lAxTly5v20r2Ww1cMF5ccxe
   pQzc0gKNEhjyjCuHPzMtj0alEY27kZwuN8xX4DkHIFHOhObsVSdpFfE4M
   WHqrRsA8ZNKzYB7jN2+gImtf7Zbhz9MYx9tOuJz+5rM948NKb9OuxjWcr
   wCdvNRQYI6t/69OCKUNa7UZw+F/TsRLXoUlxyBeNe7hp6Xs15J10+fvo+
   gc/LIuh0NBH8Y0t5MT/3t8O3uT1dbGijMCVXScQb6epo3F4DBxRmSlDc5
   Q==;
X-CSE-ConnectionGUID: Z3/RlDWsQBCUieJuy/qZOA==
X-CSE-MsgGUID: pNtivUHlR2WqDDHCSEZKMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45713792"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45713792"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 23:16:53 -0800
X-CSE-ConnectionGUID: 8u1ni5F1TMeAGOgzK/H5yA==
X-CSE-MsgGUID: EgvaemRsRvWrT63dGbphJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103051467"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Dec 2024 23:16:51 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOXFh-0000w3-0A;
	Fri, 20 Dec 2024 07:16:49 +0000
Date: Fri, 20 Dec 2024 15:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/gpib/ni_usb/ni_usb_gpib.c:837 ni_usb_write() warn:
 inconsistent returns '&ni_priv->addressed_transfer_lock'.
Message-ID: <202412201550.9NCO57Ye-lkp@intel.com>
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
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-141-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201550.9NCO57Ye-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412201550.9NCO57Ye-lkp@intel.com/

New smatch warnings:
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:837 ni_usb_write() warn: inconsistent returns '&ni_priv->addressed_transfer_lock'.

Old smatch warnings:
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:418 ni_usb_parse_termination_block() warn: was && intended here instead of ||?
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:697 ni_usb_read() warn: passing freed memory 'in_data' (line 693)

vim +837 drivers/staging/gpib/ni_usb/ni_usb_gpib.c

4e127de14fa78b Dave Penkler 2024-09-18  736  
4e127de14fa78b Dave Penkler 2024-09-18  737  static int ni_usb_write(gpib_board_t *board, uint8_t *buffer, size_t length,
4e127de14fa78b Dave Penkler 2024-09-18  738  			int send_eoi, size_t *bytes_written)
4e127de14fa78b Dave Penkler 2024-09-18  739  {
4e127de14fa78b Dave Penkler 2024-09-18  740  	int retval;
4e127de14fa78b Dave Penkler 2024-09-18  741  	struct ni_usb_priv *ni_priv = board->private_data;
4e127de14fa78b Dave Penkler 2024-09-18  742  	u8 *out_data, *in_data;
4e127de14fa78b Dave Penkler 2024-09-18  743  	int out_data_length;
4e127de14fa78b Dave Penkler 2024-09-18  744  	static const int in_data_length = 0x10;
4e127de14fa78b Dave Penkler 2024-09-18  745  	int usb_bytes_written = 0, usb_bytes_read = 0;
4e127de14fa78b Dave Penkler 2024-09-18  746  	int i = 0, j;
4e127de14fa78b Dave Penkler 2024-09-18  747  	int complement_count;
4e127de14fa78b Dave Penkler 2024-09-18  748  	struct ni_usb_status_block status;
4e127de14fa78b Dave Penkler 2024-09-18  749  	static const int max_write_length = 0xffff;
4e127de14fa78b Dave Penkler 2024-09-18  750  
4e127de14fa78b Dave Penkler 2024-09-18  751  	*bytes_written = 0;
4e127de14fa78b Dave Penkler 2024-09-18  752  	if (length > max_write_length) {
4e127de14fa78b Dave Penkler 2024-09-18  753  		length = max_write_length;
4e127de14fa78b Dave Penkler 2024-09-18  754  		send_eoi = 0;
4e127de14fa78b Dave Penkler 2024-09-18  755  		pr_err("%s: write length too long\n", __func__);
4e127de14fa78b Dave Penkler 2024-09-18  756  	}
4e127de14fa78b Dave Penkler 2024-09-18  757  	out_data_length = length + 0x10;
4e127de14fa78b Dave Penkler 2024-09-18  758  	out_data = kmalloc(out_data_length, GFP_KERNEL);
4e127de14fa78b Dave Penkler 2024-09-18  759  	if (!out_data)
4e127de14fa78b Dave Penkler 2024-09-18  760  		return -ENOMEM;
4e127de14fa78b Dave Penkler 2024-09-18  761  	out_data[i++] = 0x0d;
4e127de14fa78b Dave Penkler 2024-09-18  762  	complement_count = length;
4e127de14fa78b Dave Penkler 2024-09-18  763  	complement_count = length - 1;
4e127de14fa78b Dave Penkler 2024-09-18  764  	complement_count = ~complement_count;
4e127de14fa78b Dave Penkler 2024-09-18  765  	out_data[i++] = complement_count & 0xff;
4e127de14fa78b Dave Penkler 2024-09-18  766  	out_data[i++] = (complement_count >> 8) & 0xff;
4e127de14fa78b Dave Penkler 2024-09-18  767  	out_data[i++] = ni_usb_timeout_code(board->usec_timeout);
4e127de14fa78b Dave Penkler 2024-09-18  768  	out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  769  	out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  770  	if (send_eoi)
4e127de14fa78b Dave Penkler 2024-09-18  771  		out_data[i++] = 0x8;
4e127de14fa78b Dave Penkler 2024-09-18  772  	else
4e127de14fa78b Dave Penkler 2024-09-18  773  		out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  774  	out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  775  	for (j = 0; j < length; j++)
4e127de14fa78b Dave Penkler 2024-09-18  776  		out_data[i++] = buffer[j];
4e127de14fa78b Dave Penkler 2024-09-18  777  	while (i % 4)	// pad with zeros to 4-byte boundary
4e127de14fa78b Dave Penkler 2024-09-18  778  		out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  779  	i += ni_usb_bulk_termination(&out_data[i]);
4e127de14fa78b Dave Penkler 2024-09-18  780  
4e127de14fa78b Dave Penkler 2024-09-18  781  	mutex_lock(&ni_priv->addressed_transfer_lock);
4e127de14fa78b Dave Penkler 2024-09-18  782  
4e127de14fa78b Dave Penkler 2024-09-18  783  	retval = ni_usb_send_bulk_msg(ni_priv, out_data, i, &usb_bytes_written,
4e127de14fa78b Dave Penkler 2024-09-18  784  				      ni_usb_timeout_msecs(board->usec_timeout));
4e127de14fa78b Dave Penkler 2024-09-18  785  	kfree(out_data);
4e127de14fa78b Dave Penkler 2024-09-18  786  	if (retval || usb_bytes_written != i)	{
4e127de14fa78b Dave Penkler 2024-09-18  787  		mutex_unlock(&ni_priv->addressed_transfer_lock);
4e127de14fa78b Dave Penkler 2024-09-18  788  		pr_err("%s: ni_usb_send_bulk_msg returned %i, usb_bytes_written=%i, i=%i\n",
4e127de14fa78b Dave Penkler 2024-09-18  789  		       __func__, retval, usb_bytes_written, i);
4e127de14fa78b Dave Penkler 2024-09-18  790  		return retval;
4e127de14fa78b Dave Penkler 2024-09-18  791  	}
4e127de14fa78b Dave Penkler 2024-09-18  792  
4e127de14fa78b Dave Penkler 2024-09-18  793  	in_data = kmalloc(in_data_length, GFP_KERNEL);
4e127de14fa78b Dave Penkler 2024-09-18  794  	if (!in_data)
4e127de14fa78b Dave Penkler 2024-09-18  795  		return -ENOMEM;
4e127de14fa78b Dave Penkler 2024-09-18  796  	retval = ni_usb_receive_bulk_msg(ni_priv, in_data, in_data_length, &usb_bytes_read,
4e127de14fa78b Dave Penkler 2024-09-18  797  					 ni_usb_timeout_msecs(board->usec_timeout), 1);
4e127de14fa78b Dave Penkler 2024-09-18  798  
4e127de14fa78b Dave Penkler 2024-09-18  799  	mutex_unlock(&ni_priv->addressed_transfer_lock);
4e127de14fa78b Dave Penkler 2024-09-18  800  
4e127de14fa78b Dave Penkler 2024-09-18  801  	if ((retval && retval != -ERESTARTSYS) || usb_bytes_read != 12) {
4e127de14fa78b Dave Penkler 2024-09-18  802  		pr_err("%s: ni_usb_receive_bulk_msg returned %i, usb_bytes_read=%i\n",
4e127de14fa78b Dave Penkler 2024-09-18  803  		       __func__, retval, usb_bytes_read);
4e127de14fa78b Dave Penkler 2024-09-18  804  		kfree(in_data);
4e127de14fa78b Dave Penkler 2024-09-18  805  		return retval;
4e127de14fa78b Dave Penkler 2024-09-18  806  	}
4e127de14fa78b Dave Penkler 2024-09-18  807  	ni_usb_parse_status_block(in_data, &status);
4e127de14fa78b Dave Penkler 2024-09-18  808  	kfree(in_data);
4e127de14fa78b Dave Penkler 2024-09-18  809  	switch	(status.error_code) {
4e127de14fa78b Dave Penkler 2024-09-18  810  	case NIUSB_NO_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  811  		retval = 0;
4e127de14fa78b Dave Penkler 2024-09-18  812  		break;
4e127de14fa78b Dave Penkler 2024-09-18  813  	case NIUSB_ABORTED_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  814  		/* this is expected if ni_usb_receive_bulk_msg got
4e127de14fa78b Dave Penkler 2024-09-18  815  		 * interrupted by a signal and returned -ERESTARTSYS
4e127de14fa78b Dave Penkler 2024-09-18  816  		 */
4e127de14fa78b Dave Penkler 2024-09-18  817  		break;
4e127de14fa78b Dave Penkler 2024-09-18  818  	case NIUSB_ADDRESSING_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  819  		pr_err("%s: Addressing error retval %d error code=%i\n",
4e127de14fa78b Dave Penkler 2024-09-18  820  		       __func__, retval, status.error_code);
4e127de14fa78b Dave Penkler 2024-09-18  821  		retval = -ENXIO;
4e127de14fa78b Dave Penkler 2024-09-18  822  		break;
4e127de14fa78b Dave Penkler 2024-09-18  823  	case NIUSB_NO_LISTENER_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  824  		retval = -ECOMM;
4e127de14fa78b Dave Penkler 2024-09-18  825  		break;
4e127de14fa78b Dave Penkler 2024-09-18  826  	case NIUSB_TIMEOUT_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  827  		retval = -ETIMEDOUT;
4e127de14fa78b Dave Penkler 2024-09-18  828  		break;
4e127de14fa78b Dave Penkler 2024-09-18  829  	default:
4e127de14fa78b Dave Penkler 2024-09-18  830  		pr_err("%s: unknown error code=%i\n",
4e127de14fa78b Dave Penkler 2024-09-18  831  		       __func__, status.error_code);
4e127de14fa78b Dave Penkler 2024-09-18  832  		retval = -EPIPE;
4e127de14fa78b Dave Penkler 2024-09-18  833  		break;
4e127de14fa78b Dave Penkler 2024-09-18  834  	}
4e127de14fa78b Dave Penkler 2024-09-18  835  	ni_usb_soft_update_status(board, status.ibsta, 0);
4e127de14fa78b Dave Penkler 2024-09-18  836  	*bytes_written = length - status.count;
4e127de14fa78b Dave Penkler 2024-09-18 @837  	return retval;
4e127de14fa78b Dave Penkler 2024-09-18  838  }
4e127de14fa78b Dave Penkler 2024-09-18  839  

:::::: The code at line 837 was first introduced by commit
:::::: 4e127de14fa78bcd98c6459b0b984b8266cd0203 staging: gpib: Add National Instruments USB GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
